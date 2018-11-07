class EventsController < ApplicationController
    before_action :require_login

    def index 
        @events = Event.collect_weekly_events
        @user = current_user
        respond_to do |format|
            format.html {render :index}
            format.json {render json: @events, status: 200}
        end
        #render json: @events, status: 200 
    end

    def new
        @event = Event.new

    end

    def show
        @event = Event.find_by(id: params[:id])
        @task = Task.new
        respond_to do |format|
            format.html {render :show}
            format.json {render json: @event, status: 200}
        end
        #render json: @event, status: 200

    end
     
    def edit 
        @event = Event.find_by(id: params[:id])
    end

    def update
        @event = Event.find_by(id: params[:id])
        # @event.date = Date.new(params[:event]["date(1i)"].to_i, params[:event]["date(2i)"].to_i, params[:event]["date(3i)"].to_i)
         if @event.update(event_params)
            #update date object? event.date_object = @event.date.to_date
            redirect_to event_path(@event)
        else
            redirect_to edit_event_path(@event)
        end       
    end


    def create
        @event = Event.new(event_params)
        @event.user = current_user
        @event.date = Date.new(params[:event]["date(1i)"].to_i, params[:event]["date(2i)"].to_i, params[:event]["date(3i)"].to_i)
        @event.date_object = @event.date.to_date
        
        if @event.save
            #binding.pry
            render json: @event, status: 201

            #redirect_to event_path(@event)
          
        else
            @event.date = Date.today
            @user = current_user
            @task = Task.new
            render "users/show"
        end

    end

    def destroy
        @event = Event.find_by(id: params[:id])
        @event.destroy
        redirect_to user_path(current_user.id)
    end


    

    private
    
    def event_params
        params.require(:event).permit(:title, :description, :start_time, :end_time, "date(1i)", "date(2i)", "date(3i)", :date_object)
    end

    def require_login
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

end

