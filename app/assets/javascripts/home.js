
//////////////////////// HOME PAGE functions ///////////////////////////////////////////////////
///New-Feature? use getDay() JS function to print like 'Monday - Work - Detail cleaning 4 - 5 ' 

//Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.
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
// ORIGINAL JS SHOW (the link to show extra details about an event on the homepage )
// function jsEventShow(event){
//     let id = event.attributes[0].value
//     $.getJSON(`/events/${id}`, function(event){
//         $(`#event-details-${id}`).empty()
//         $(`#event-details-${id}`).append(showEventDetails(event))
//     })
// }


// function showEventDetails(event){
//     return `<a class="event-teaser-link" href="/events/${event.id}"> ${event["description"]} - ${event["start_time"]} - ${event["end_time"]} </a>`
// }

//Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.
function jsEventShow(event){
    let id = event.attributes[0].value
    $.getJSON(`/events/${id}`, function(event){
        $(`#event-details-${id}`).empty()
        //instatiante a new event prototype and pass in req attributes
        let jsEvent = new Event(event["title"], event["description"], event["date"])
        
        // append a pretty formatted string using event prototype method
        $(`#event-details-${id}`).append(jsEvent.showEventPretty(id))
    })
}



////////////////////////FORM HIJACKING ///////////////////////////////////////////////
// Must use your Rails application and JavaScript to render a form for creating a resource that submits dynamically.

$(function newEvent(){
    $("#new_event").submit(function(e){
        e.preventDefault();
        //serialize the values on the form
        var values = $(this).serialize();
        //debugger;
        
        //make a post request and route to create action
        var posting = $.post("/events", values);
        //debugger;
        posting.done(function(data){
            
            var event = data
            $(`ul.${event["date"]}`).append(showNewEvent(event));
            document.getElementById("new_event").reset();
        })
        $("input[name=commit]").disabled = false;
    })
    
})

// WORKFLOW FOR JS CLASS model 
//take json response (data in the done function) and create an event prototype. 
// call a newly created event prototype function to format the response in a pretty way.  


function showNewEvent(event){
    return `<li><button data-event="${event["id"]}" onclick="jsEventShow(this)">${event["title"]}</li>`
}




/// JS EVENT 'CLASS' DEFINITION
//Must translate the JSON responses into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. Formatters work really well for this.
function Event(title, description, date){
        this.title = title;
        this.description = description;
        this.date = date;
    }

    
Event.prototype.showEventPretty = function(id){
    return `<a class="event-teaser-link" href="/events/${id}"> ${this.description} </a>`
}
