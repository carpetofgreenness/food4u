$("document").ready(function(){

	$("#food").keyup(function(){
		value = $(this).val();

		if (value.length >=3) {
			$.ajax({
				url: "/api-find", //need this every time, as string
				type: 'GET',
				data: { food: value },
				dataType: "json", //need this, or jsonp

				success: function(data) { //what to do when it is successful. do this every time
					// console.log("success")
					console.log(data)
				},

				error:function(data){
					console.log("error")
				}
			});
			
		}

	});
})