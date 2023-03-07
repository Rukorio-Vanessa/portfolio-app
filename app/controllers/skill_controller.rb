class JobController < AppController
    
    #fetch all skills
    get '/skills' do
        skills = Skill.all
        json_response(data: skills)
    end
    

    #create new skill
    post '/skills/create' do

        data = JSON.parse(request.body.read)

        begin
            skill = Skill.create(data)
            json_response(code: 201, data: project)
        rescue => e
            error_response(422, e)
        end
       
    end
    

    #update skills list by deleting
    delete '/skills/destroy/:id' do
        begin
            skill = Skill.find(params[:id])
            skill.destroy
            json_response(data: { message: "skill has been deleted!" })
          rescue => e
            error_response(422, e)
        end
    end


end