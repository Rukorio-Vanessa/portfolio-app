class ProjectController < AppController
    set :views, './app/views'

    get '/hello' do
        "Welcome to Project-Controller!"
    end

    #create a projecct
    post '/project/create' do
        begin
          project = Project.create( self.data(create:true) )
          json_response(code: 201, data: project)
        rescue => e
          json_response(code: 404, data: { error: e.message} )
        end
    end
    
    #display all projects
    get '/project' do
        project = Project.all
        json_response(code: 200, data: project)
    end

    #display all projects of a user
    get '/projects/:user_id' do
        user_id = params['user_id'].to_i
        my_projects = User.find(user_id).own_projects
        projects_part_of = User.find(user_id).projects
        user_projects = {my_projects: my_projects, part_of: projects_part_of}
        user_projects.to_json
   end

     
   # renders using erb
    get '/view/project' do
        @projects = Project.all
        erb :project
    end


    #deletes a project
    delete '/projects/destroy/:id' do

        begin
        project = Project.find(params[:id])
        project.destroy
        json_response(data: { message: "Project deleted successfully" })
        
        rescue => e
        json_response(code: 422, data: { error: e.message })
        end
    end
    
    #updates a project entry
    put '/project/update/:id' do

        begin
          project = Project.find(self.project_id)
          project.update(self.data)
          json_response(data: { message: "project updated successfully" })
        
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end
    
    private
    def project_id
        params['id'].to_i
    end

end