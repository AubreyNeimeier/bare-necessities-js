
//////////////////////// HOME PAGE functions ///////////////////////////////////////////////////
/// use getDay() JS function to print like 'Monday - Work - Detail cleaning 4 - 5 ' 
function weekly(){
    $.getJSON("/events", function(events){
            $("#weekly").empty()
            $("#weekly").append(showWeekly(events))
        })
    }

function showWeekly(events){
    
    return events.map(event => {
        return `<p>${event["date"]} - ${event["title"]} - ${event["description"]} </p>`

    })
}

/////////////////    for individual days and events. (the clickable event on each day and the details)
function jsEventShow(event){
    let id = event.attributes[0].value
    $.getJSON(`/events/${id}`, function(event){
        $(`#event-details-${id}`).empty()
        $(`#event-details-${id}`).append(showEventDetails(event))
    })
}

function showEventDetails(event){
    return `<a class="event-teaser-link" href="/events/${event.id}"> ${event["description"]} - ${event["start_time"]} - ${event["end_time"]} </a>`
}



////////////////////////FORM HIJACKING ///////////////////////////////////////////////
$(function newEvent(){
    $("#new_event").submit(function(e){
        e.preventDefault();
        //serialize the values on the form
        var values = $(this).serialize();
        
        //make a post request and route to create action
        var posting = $.post("/events", values);
        posting.done(function(data){
            
            var event = data
            $(`ul.${event["date"]}`).append(showNewEvent(event));
            document.getElementById("new_event").reset();
            //$("#new_event").reset();
        })
        
    })
})

function showNewEvent(event){
    return `<li><button data-event="${event["id"]}" onclick="jsEventShow(this)">${event["title"]}</li>`
}

/////////////////////// EVENT SHOW PAGE //////////////////////////////////////////////

function getTasks(event){
    
    let id = event.attributes[0].value
    
    // we don't have a route for events/34/tasks. we just have events/34. 
    // we'll request the event and then the associated tasks thru ORM serializations
    $.getJSON(`/events/${id}`, function(event){
        $("#tasks").empty();
        $("#tasks").append(showTasks(event))

    })
}

function showTasks(event){
    //debugger;
    event_id = event["id"] 
    let tasks = event["tasks"].map(task => {
        return `<input type="checkbox" name="${task.id}" value="${task.id}"><a href="/events/${event_id}/tasks/${task["id"]}"> ${task["description"]} </a><br>`
    })
    
    return (tasks + `<input type="submit" value="Mark as Complete"> </form>`)
}

// let form_stuff = `<form id="todoForm" method="delete" action="/tasks/${task.id}">`