class ChaptersController < ApplicationController
  def index
    matching_chapters = Chapter.all

    @list_of_chapters = matching_chapters.order({ :created_at => :desc })

    render({ :template => "chapters/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_chapters = Chapter.where({ :id => the_id })

    @the_chapter = matching_chapters.at(0)

    render({ :template => "chapters/show.html.erb" })
  end

  def create
    the_chapter = Chapter.new
    the_chapter.yoga_class_id = params.fetch("query_yoga_class_id")
    the_chapter.name = params.fetch("query_name")
    the_chapter.duration_secs = params.fetch("query_duration_secs")

    if the_chapter.valid?
      the_chapter.save
      redirect_to("/chapters", { :notice => "Chapter created successfully." })
    else
      redirect_to("/chapters", { :notice => "Chapter failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_chapter = Chapter.where({ :id => the_id }).at(0)

    the_chapter.yoga_class_id = params.fetch("query_yoga_class_id")
    the_chapter.name = params.fetch("query_name")
    the_chapter.duration_secs = params.fetch("query_duration_secs")

    if the_chapter.valid?
      the_chapter.save
      redirect_to("/chapters/#{the_chapter.id}", { :notice => "Chapter updated successfully."} )
    else
      redirect_to("/chapters/#{the_chapter.id}", { :alert => "Chapter failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_chapter = Chapter.where({ :id => the_id }).at(0)

    the_chapter.destroy

    redirect_to("/chapters", { :notice => "Chapter deleted successfully."} )
  end
end
