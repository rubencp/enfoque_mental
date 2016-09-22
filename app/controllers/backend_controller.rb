class BackendController < ApplicationController

  def admin

    @Users = User.all

    respond_to do |format|
      format.json { @Users }
      format.xml { @Users }  
    end
    

  end

  def status

    @Users = User.all
    render json: JSON.pretty_generate(JSON.parse(@Users.to_json))
  end



end
