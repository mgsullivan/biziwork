class PagesController < ApplicationController
  def home
  	if current_user 
      @task = Task.new
  		redirect_to tasks_path  		
  	end
  end
  def about
  end
  def test
  	@task = Task.new
  end
end
