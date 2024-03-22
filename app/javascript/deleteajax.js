let ajaxDestroy= (article_id)=>{
    $.ajax({
        url: "/articles/"+article_id,
        type: "DELETE",
        success: function(data) {
            console.log(data);
            $('#row_'+article_id).hide();
        },
        error: function(data) {
            console.log('Error:', data);
            alert("Access denied");
        }
    });
}

$('.removeArticle').click((e)=>{
    let buttonId=e.target.id;
    let indexOfUnderscore=buttonId.indexOf('_')
    let article_id = Number(e.target.id.slice(indexOfUnderscore+1, buttonId.length));
    ajaxDestroy(article_id);
})