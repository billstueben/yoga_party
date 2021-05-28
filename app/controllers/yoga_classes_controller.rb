class YogaClassesController < ApplicationController
  def index
    matching_yoga_classes = YogaClass.all

    @list_of_yoga_classes = matching_yoga_classes.order({ :created_at => :desc })

    render({ :template => "yoga_classes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_yoga_classes = YogaClass.where({ :id => the_id })

    @the_yoga_class = matching_yoga_classes.at(0)

    render({ :template => "yoga_classes/show.html.erb" })
  end

  def create
    the_yoga_class = YogaClass.new
    the_yoga_class.yogi_id = params.fetch("query_yogi_id")
    the_yoga_class.duration_secs = params.fetch("query_duration_secs")
    the_yoga_class.public_to_all = params.fetch("query_public_to_all", false)

    if the_yoga_class.valid?
      the_yoga_class.save
      redirect_to("/yoga_classes", { :notice => "Yoga class created successfully." })
    else
      redirect_to("/yoga_classes", { :notice => "Yoga class failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_yoga_class = YogaClass.where({ :id => the_id }).at(0)

    the_yoga_class.yogi_id = params.fetch("query_yogi_id")
    the_yoga_class.duration_secs = params.fetch("query_duration_secs")
    the_yoga_class.public_to_all = params.fetch("query_public_to_all", false)

    if the_yoga_class.valid?
      the_yoga_class.save
      redirect_to("/yoga_classes/#{the_yoga_class.id}", { :notice => "Yoga class updated successfully."} )
    else
      redirect_to("/yoga_classes/#{the_yoga_class.id}", { :alert => "Yoga class failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_yoga_class = YogaClass.where({ :id => the_id }).at(0)

    the_yoga_class.destroy

    redirect_to("/yoga_classes", { :notice => "Yoga class deleted successfully."} )
  end
end
