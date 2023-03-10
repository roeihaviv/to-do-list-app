class TasksController < ApplicationController

  include ActionView::Helpers::DateHelper

  # def index
  #   @start_time = Task.created_at
  #   @time_since = time_since(@start_time)
  # end

  def index
    matching_tasks = Task.all

    @list_of_tasks = matching_tasks.order({ :created_at => :desc })

    render({ :template => "tasks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tasks = Task.where({ :id => the_id })

    @the_task = matching_tasks.at(0)

    render({ :template => "tasks/show.html.erb" })
  end

  def create
    the_task = Task.new
    the_task.body = params.fetch("query_body")
    the_task.user_id = session.fetch(:user_id)

    if the_task.valid?
      the_task.save
      redirect_to("/tasks", { :notice => "Task created successfully." })
    else
      redirect_to("/tasks", { :alert => the_task.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_task = Task.where({ :id => the_id }).at(0)

    the_task.body = params.fetch("query_body")
    the_task.status = params.fetch("query_status")
    the_task.user_id = params.fetch("query_user_id")

    if the_task.valid?
      the_task.save
      redirect_to("/", { :notice => "Task updated successfully."} )
    else
      redirect_to("/tasks/#{the_task.id}", { :alert => the_task.errors.full_messages.to_sentence })
    end
  end

  def update_status
    #require 'pry' ; binding.pry
    task_id = params[:id]
    new_status = params[:status]

    task = Task.find(task_id)
    #task.update_status!(params[:status])
    task.status = new_status
    task.save!
 
    redirect_to '/'
    # the_id = params.fetch("path_id")
    # the_task = Task.where({ :id => the_id }).at(0)

    # the_task.body = params.fetch("query_body")
    # the_task.status = params.fetch("query_status")
    # the_task.user_id = params.fetch("query_user_id")

    # if the_task.valid?
    #   the_task.save
    #   redirect_to("/tasks/#{the_task.id}", { :notice => "Task updated successfully."} )
    # else
    #   redirect_to("/tasks/#{the_task.id}", { :alert => the_task.errors.full_messages.to_sentence })
    # end
  end

  def destroy
    the_id = params.fetch("id")
    the_task = Task.where({ :id => the_id }).at(0)

    the_task.destroy

    redirect_to("/tasks", { :notice => "Task deleted successfully."} )
  end
  
end
