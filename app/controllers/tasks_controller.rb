class TasksController < ApplicationController 
    before_action :require_login
    def show
        @task = Task.find_by(id: params[:id])
        @event = @task.event
        #binding.pry
    end

    def edit
        @event = Event.find_by(id: params[:event_id])
        @task = Task.find_by(id: params[:id])
    end

    def update
        @event = Event.find_by(id: params[:event_id])
        @task = Task.find_by(id: params[:id])
        @task.event = @event
        binding.pry
        if @task.update(task_params)
            redirect_to event_task_path(@event, @task)
        else
            render edit_event_task_path(@event, @task)
        end

    end






    def create
        @task = Task.new(task_params)
        @task.user = current_user
        if @task.save
            redirect_to task_path(@task)
        else
            @user = current_user
            @event = Event.new
            render "users/show"
        end

    end


    private

    def task_params
        params.require(:task).permit(:event_id, :description, :status, :id)
    end

    def require_login
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end
end
