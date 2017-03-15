$("document").ready(function(){

	$("#food_name").keyup(function(){
		value = $(this).val();
		suggestions = []

		// search must have at least 3 charachters for api to work
		if (value.length >=3) {
			// make api call. this ajax call actually references lib/stilltasty.rb
			// then it displays the results in a drop-down list
			// when the user clicks on an option, it adds the name and id to the form, then submits
			$.ajax({
				url: "/api-find", // in pages_controller.rb
				type: 'GET',
				data: { food: value },
				dataType: "json",

				success: function(data) { //what to do when it is successful. do this every time

					suggestions = data.results // this gives an array of objects. each object is a search suggestion containing a name and id
					// console.log(suggestions)
					html_string = "" // initialize string to be put in the list group on test_api.html.erb
					// go through each suggestion and put it in an <a>
					for (var i = 0; i <= suggestions.length - 1; i++) {
						html_string += "<a class='list-group-item' id='"+ i + "'>"+suggestions[i].name+"</a>"
					}


					$("#suggestions").html(html_string)
					
					// when user clicks an option, add it to the form and submit
					$(".list-group-item").click(function(event){


						// fill in the visible input with the name of the suggestion
						$("#food_name").val(suggestions[event.target.id[0]].name)

						// fill in the hidden form with the still tasty id
						food_id_num =  suggestions[event.target.id[0]].id
						document.getElementById("food_still_tasty_id").value = food_id_num;
						
						//remove the suggestion list since we picked one!
						$("#suggestions").html("")

						// make api call to find out the shelflife
						$.ajax({
							url: "/guide-find", // in pages_controller.rb
							type: 'GET',
							data: { food: food_id_num },
							dataType: "json",

							success: function(data) {
								document.getElementById("new_food_shelf_life").value = data.results["methods"][0]["expirationTime"]
								

								// submit form
								$("#new_food").submit()

							}, error:function(data){
								alert("error")
							}
							
						})
						
					})
				},

				error:function(data){
					console.log("error")
				}
			});
			

		}

	});

})