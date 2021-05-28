class PosesController < ApplicationController
  def index
    matching_poses = Pose.all

    @list_of_poses = matching_poses.order({ :created_at => :desc })

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
    the_pose.chapter_id = params.fetch("query_chapter_id")
    the_pose.tips = params.fetch("query_tips")
    the_pose.duration_secs = params.fetch("query_duration_secs")

    if the_pose.valid?
      the_pose.save
      redirect_to("/poses", { :notice => "Pose created successfully." })
    else
      redirect_to("/poses", { :notice => "Pose failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_pose = Pose.where({ :id => the_id }).at(0)

    the_pose.name = params.fetch("query_name")
    the_pose.picture = params.fetch("query_picture")
    the_pose.chapter_id = params.fetch("query_chapter_id")
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
    the_id = params.fetch("path_id")
    the_pose = Pose.where({ :id => the_id }).at(0)

    the_pose.destroy

    redirect_to("/poses", { :notice => "Pose deleted successfully."} )
  end
end
