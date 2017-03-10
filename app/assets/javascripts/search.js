$("document").ready(function(){

	$("#food").keyup(function(){
		value = $(this).val();
		suggestions = []

		if (value.length >=3) {
			$.ajax({
				url: "/api-find", //need this every time, as string
				type: 'GET',
				data: { food: value },
				dataType: "json", //need this, or jsonp

				success: function(data) { //what to do when it is successful. do this every time
					// console.log("success")
					// console.log(data)
					suggestions = data.results
					// console.log(suggestions)
					html_string = ""

					for (var i = 0; i <= suggestions.length - 1; i++) {
						html_string += "<a class='list-group-item' id='"+suggestions[i].name+"'>"+suggestions[i].name+"</a>"
					}

					console.log(html_string)

					$("#suggestions").html(html_string)
					
					$(".list-group-item").click(function(event){
						console.log(event.target)
						$("#food").val(event.target.id)
					})
				},

				error:function(data){
					console.log("error")
				}
			});
			

		}

	});

})