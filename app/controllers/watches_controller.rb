class WatchesController < ApplicationController
  def index
    matching_watches = Watch.all

    @list_of_watches = matching_watches.order({ :created_at => :desc })

    render({ :template => "watches/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_watches = Watch.where({ :id => the_id })

    @the_watch = matching_watches.at(0)

    render({ :template => "watches/show.html.erb" })
  end

  def create
    the_watch = Watch.new
    the_watch.body = params.fetch("query_body")
    the_watch.status = params.fetch("query_status")
    the_watch.user_id = params.fetch("query_user_id")

    if the_watch.valid?
      the_watch.save
      redirect_to("/watches", { :notice => "Watch created successfully." })
    else
      redirect_to("/watches", { :alert => the_watch.errors.full_messages.to_sentence })
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
      redirect_to("/watches/#{the_watch.id}", { :notice => "Watch updated successfully."} )
    else
      redirect_to("/watches/#{the_watch.id}", { :alert => the_watch.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_watch = Watch.where({ :id => the_id }).at(0)

    the_watch.destroy

    redirect_to("/watches", { :notice => "Watch deleted successfully."} )
  end
end
