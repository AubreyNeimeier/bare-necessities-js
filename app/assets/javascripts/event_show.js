/////////////////////// EVENT SHOW PAGE //////////////////////////////////////////////
//Your Rails application must dynamically render on the page at least one 'has-many' relationship through JSON using JavaScript.

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
        return `<a href="/events/${event_id}/tasks/${task["id"]}"> ${task["description"]} </a><br>`
    })
    
    return tasks
}
