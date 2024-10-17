class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :answer, :submit_answer]
  before_action :authenticate_user!, except: [:index]
  before_action :admin_check, only: [:new, :create, :edit, :update]
  
  def index
    @events = Event.order(scheduled_date: :desc).page(params[:page]).per(10)
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.event_users.build
    #イベントユーザの子供になるインスタンスを作る
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      params[:event][:user_ids].reject(&:blank?).each do |user_id|
        @event.event_users.create!(user_id: user_id)
      end
      redirect_to events_path, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      @event.event_users.destroy_all
  
      params[:event][:user_ids].reject(&:blank?).each do |user_id|
        @event.event_users.create!(user_id: user_id)
      end
  
      redirect_to event_path(@event), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end
  

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end

  def answer
    @user_event = @event.event_users.find_by(user_id: current_user.id)
    @user = @user_event.user unless @user_event.nil?
    debugger
  end
  
  def submit_answer
    @user_event = @event.event_users.find_by(user_id: current_user.id)
    if @user_event.update(answer_params)
      redirect_to @event, notice: '回答が更新されました。'
    else
      render :answer
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :scheduled_date, user_ids: [], event_users_attributes: [:event_id, :user_id, :answer, :created_at, :updated_at])
  end
  
  def answer_params
    params.require(:event_user).permit(:answer)
  end

  def admin_check
    unless current_user.is_admin?
      flash[:alert] = "管理者権限が必要です。"
      redirect_to events_path
    end
  end
end
