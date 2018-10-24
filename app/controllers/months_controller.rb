class MonthsController < ApplicationController 

    def new
        #Don't believe we need a new action. we are not rendering a new form. we need to change the month
        @old_month =
    end

    def create  
        #instantiate the new month, based on the previous month (submitted as a form)
        #catch the old month and add 30 calendar days
        #instantiate the new starting div day, and month name
        redirect_to show_path(@month)

    end

    def show
        #instantiate new task and new event for form on new month
        #find the new month from the url
    end



end

