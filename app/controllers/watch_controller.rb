class WatchController < ApplicationController
  def index
    matching_watch = Watch.all

    @list_of_watch = matching_watch.order({ :created_at => :desc })

    render({ :template => "watch/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_watch = Watch.where({ :id => the_id })

    @the_watch = matching_watch.at(0)

    render({ :template => "watch/show.html.erb" })
  end

  def create
    the_watch = Watch.new
    the_watch.body = params.fetch("query_body")
    the_watch.user_id = session.fetch(:user_id)

    if the_watch.valid?
      the_watch.save
      redirect_to("/watch", { :notice => "Watch created successfully." })
    else
      redirect_to("/watch", { :alert => the_watch.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_watch = Watch.where({ :id => the_id }).at(0)

    the_watch.body = params.fetch("query_body")
    the_watch.status = params.fetch("query_status")
    the_watch.user_id = params.fetch("query_user_id")

    if the_watch.valid?
      the_watch.save
      redirect_to("/watch/#{the_watch.id}", { :notice => "Watch updated successfully."} )
    else
      redirect_to("/watch/#{the_watch.id}", { :alert => the_watch.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_watch = Watch.where({ :id => the_id }).at(0)

    the_watch.destroy

    redirect_to("/watch", { :notice => "Watch deleted successfully."} )
  end
end
