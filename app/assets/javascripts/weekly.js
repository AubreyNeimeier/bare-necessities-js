 $(document).ready(function() {
// window.onload = function(){
    attachListeners()
 })


function weekly(){
    $.getJSON("/events", function(events){
            $("#weekly").empty()
            $("#weekly").append(showWeekly(events))
        })
    }
    



function showWeekly(events){
    /// use getDay() JS function to print like 'Monday - Work - Detail cleaning 4 - 5 ' 
    return events.map(event => {
        return `<p>${event["date"]} - ${event["title"]} - ${event["description"]} </p>`

    })
}

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

function attachListeners(){

    $("#weeklyButton").on('click' , () => weekly())
}