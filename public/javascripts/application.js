function change_month(){
    document.location="/archives?selected_month=" + this.value;
}

$(document).ready(function(){
    $('#activity_note_month').change(change_month);
});
