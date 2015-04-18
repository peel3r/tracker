class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]
  before_action :set_pool #sets appropriate pool before doing anything else
  before_action :set_kind_trackers
  before_action :admin!

  def index
    @trackers = Tracker.all
  end


  def show
  end


  def new
    @tracker = @pool.trackers.build
    5.times { @tracker.possible_trackers.build }
  end


  def edit
  end


  def create
    @tracker = @pool.trackers.build(tracker_params)

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to @pool, notice: 'Tracker was successfully created.' }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { render :new }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to @tracker, notice: 'Tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to @pool, notice: 'Tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_pool
      @pool = Pool.find params[:pool_id]#sets pool id from the url: /pools/-id->2<--/trackers
    end

    def set_kind_trackers
      @kind_options = [
          ["Open Question", "open"],
          ["Multiple Choice Question", "choice"],
          ["Multi Choice Question", "multichoice"]
      ]
    end

    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    def tracker_params
      params.require(:tracker).permit(:title, :kind, :pool_id,{ possible_trackers_attributes: [:title,:tracker_id] })
    end

  def admin!
    authenticate_user!

    redirect_to root_path, alert: "you are not authorized to this operation"  unless current_user.admin?
  end
end
