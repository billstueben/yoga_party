class PosesController < ApplicationController
  def index
    matching_poses = Pose.where({ :chapter_id => 1 }).order(:name)

    @list_of_poses = matching_poses

    render({ :template => "poses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_poses = Pose.where({ :id => the_id })

    @the_pose = matching_poses.at(0)

    render({ :template => "poses/show.html.erb" })
  end

  def create
    the_pose = Pose.new
    the_pose.name = params.fetch("query_name")
    the_pose.picture = params.fetch("query_picture")
    the_pose.chapter_id = 1
    the_pose.tips = params.fetch("query_tips")
    the_pose.duration_secs = params.fetch("query_duration_secs")

    if the_pose.valid?
      the_pose.save
      redirect_to("/poses", { :notice => "Pose created successfully." })
    else
      redirect_to("/poses", { :notice => "Pose failed to create successfully." })
    end
  end
# The idea is to make a create that adds another version of the pose with that chapter id here
  
  def class_pose

    the_id = params.fetch("path_id")
    the_yoga_class = YogaClass.where({ :id => the_id }).at(0)

    the_pose = Pose.new
    the_pose.name = params.fetch("query_name")
    the_pose.chapter_id = params.fetch("query_chapter_id")
    @matching_pose = Pose.where({:name => the_pose.name}).at(0)
    the_pose.duration_secs = @matching_pose.duration_secs
    the_pose.picture = @matching_pose.picture
    the_pose.tips = @matching_pose.tips
    the_pose.created_at = @matching_pose.created_at
    the_pose.updated_at = @matching_pose.updated_at

    if the_pose.valid?
      the_pose.save
      redirect_to("/yoga_classes/#{the_yoga_class.id}", { :notice => "Pose successfully."} )
    else
      redirect_to("/yoga_classes/#{the_yoga_class.id}", { :alert => "Pose failed to add successfully." })
    end

  end



  def update
    the_id = params.fetch("path_id")
    the_pose = Pose.where({ :id => the_id }).at(0)

    the_pose.name = params.fetch("query_name")
    the_pose.picture = params.fetch("query_picture")
    #the_pose.chapter_id = params.fetch("query_chapter_id")
    the_pose.tips = params.fetch("query_tips")
    the_pose.duration_secs = params.fetch("query_duration_secs")

    if the_pose.valid?
      the_pose.save
      redirect_to("/poses/#{the_pose.id}", { :notice => "Pose updated successfully."} )
    else
      redirect_to("/poses/#{the_pose.id}", { :alert => "Pose failed to update successfully." })
    end
  end

  def destroy
    @the_id = params.fetch("path_id")
    @the_pose = Pose.where({ :id => @the_id }).at(0)
    @the_chapter = Chapter.where({ :id => @the_pose.chapter_id }).at(0)
    @the_yoga_class = YogaClass.where({ :id => @the_chapter.yoga_class_id }).at(0)

    if @the_pose.chapter_id == 1
      @the_pose.destroy
      redirect_to("/poses", { :notice => "Pose deleted successfully."} )  
    else
      @the_pose.destroy
      redirect_to("/yoga_classes/#{@the_yoga_class.id}", { :notice => "Pose deleted successfully" })
    end  
      #render({ :template => "poses/delete.html.erb" })
  end


end
