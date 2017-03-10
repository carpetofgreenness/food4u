$("document").ready(function(){

	$("#food_name").keyup(function(){
		value = $(this).val();
		suggestions = []

		if (value.length >=3) {
			$.ajax({
				url: "/api-find", //need this every time, as string
				type: 'GET',
				data: { food: value },
				dataType: "json", //need this, or jsonp

				success: function(data) { //what to do when it is successful. do this every time

					suggestions = data.results
					console.log(suggestions)
					html_string = ""

					for (var i = 0; i <= suggestions.length - 1; i++) {
						html_string += "<a class='list-group-item' id='"+ i + "'>"+suggestions[i].name+"</a>"
					}


					$("#suggestions").html(html_string)
					
					$(".list-group-item").click(function(event){
						$("#food_name").val(suggestions[event.target.id[0]].name)
						document.getElementById("food_still_tasty_id").value = suggestions[event.target.id[0]].id;
						$("#suggestions").html("")
						$("form").submit()
					})
				},

				error:function(data){
					console.log("error")
				}
			});
			

		}

	});

})