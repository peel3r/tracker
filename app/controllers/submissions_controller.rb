class SubmissionsController < ApplicationController
  def new
    @pool = Pool.find params[:pool_id]
    @submission = @pool.submissions.build

    @pool.trackers.each { |tracker| @submission.answers.build tracker: tracker }
  end

  def create
    @pool = Pool.find params[:pool_id]
    @submission = @pool.submissions.build submission_params

    if @submission.save
      redirect_to @pool, notice: "thank yoou for choosing a tracker"
    else
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:pool_id, {
      answers_attributes: [:value,:tracker_id, :submission_id, :possible_tracker_id] })
  end

end