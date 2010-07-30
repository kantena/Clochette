function change_month(){
    //    $('#main').load("/archives", {
    //        selected_month: this.value
    //    }, function(){
    //        console.log(this.value)
    //    }, "text");
    document.location="/archives/" + this.value
}

$(document).ready(function(){
    $('#activity_note_month').change(change_month);
});
