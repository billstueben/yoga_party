class YogaClassesController < ApplicationController
  def index
    matching_yoga_classes = YogaClass.all

    @list_of_yoga_classes = matching_yoga_classes.order({ :created_at => :desc })

    render({ :template => "yoga_classes/index.html.erb" })
  end

  def warm_up

    render({ :template => "yoga_classes/warm_up.html.erb" })

  end


  def show
    the_id = params.fetch("path_id")

    matching_yoga_classes = YogaClass.where({ :id => the_id })

    @the_yoga_class = matching_yoga_classes.at(0)
    @matching_chapters = Chapter.where({:yoga_class_id => @the_yoga_class.id})
    
    @warm_up_chapter = Chapter.where({:yoga_class_id => @the_yoga_class.id}).where({:name => "1. Warm up"})
    @flow_chapter = Chapter.where({:yoga_class_id => @the_yoga_class.id}).where({:name => "2. Flow"})
    @balancing_chapter = Chapter.where({:yoga_class_id => @the_yoga_class.id}).where({:name => "3. Balancing"})
    @cool_down_chapter = Chapter.where({:yoga_class_id => @the_yoga_class.id}).where({:name => "4. Cool down"})

    render({ :template => "yoga_classes/show.html.erb" })
  end

  def create
    the_yoga_class = YogaClass.new
    the_yoga_class.yogi_id = @current_yogi.id
    the_yoga_class.duration_secs = params.fetch("query_duration_secs")
    the_yoga_class.public_to_all = params.fetch("query_public_to_all", false)
    the_yoga_class.name = params.fetch("query_name")

    if the_yoga_class.valid?
      the_yoga_class.save

      warm_up_chapter = Chapter.new
    warm_up_chapter.yoga_class_id = the_yoga_class.id
    warm_up_chapter.name = "1. Warm up"
    warm_up_chapter.duration_secs = 0
    warm_up_chapter.save
 

    flow_chapter = Chapter.new
    flow_chapter.yoga_class_id = the_yoga_class.id
    flow_chapter.name = "2. Flow"
    flow_chapter.duration_secs = 0
    flow_chapter.save


    balancing_chapter = Chapter.new
    balancing_chapter.yoga_class_id = the_yoga_class.id
    balancing_chapter.name = "3. Balancing"
    balancing_chapter.duration_secs = 0
    balancing_chapter.save


    cool_down_chapter = Chapter.new
    cool_down_chapter.yoga_class_id = the_yoga_class.id
    cool_down_chapter.name = "4. Cool down"
    cool_down_chapter.duration_secs = 0
    cool_down_chapter.save



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
