// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require d3
//= require bootstrap-sprockets
//= require data-confirm-modal
//= require_tree .

$("document").ready(function(){
	$.ajax({
		url: "../graph/data", // in graph_controller.rb
		type: 'GET',
		dataType: "json",
		success: function (data) {
		   draw(data["results"]);
		},
		error: function (result) {
		   console.log("here was an error")
		   error();
		}
	});

	function draw(data) {

	console.log(data)

	// set the dimensions and margins of the graph
	// uses actual width and height of screen
	var margin = {top: 20, right: 80, bottom: 70, left: 100};
		// if the screen is large, make it half the screen
		// otherwise make it the whole screen
		if ($(window).width() > 580) {
	    	var width = $( window ).width()*3/4 - margin.left - margin.right;
	    	console.log($(window).width())
		}
		else {
			var width = $( window ).width() - margin.left - margin.right;
		}
	    height = $( window ).height()/2 - margin.top - margin.bottom;

	// create function to parse the date / time
	var parseTime = d3.timeParse("%Y-%m-%d");

	// set the ranges
	var x = d3.scaleTime().range([0, width]);
	var y = d3.scaleLinear().range([height, 0]);

	// define the line
	var valueline = d3.line()
	    .x(function(d) { return x(d[0]); })
	    .y(function(d) { return y(d[1]); });

	// append the svg obgect to the body of the page
	// appends a 'group' element to 'svg'
	// moves the 'group' element to the top left margin
	var svg = d3.select("#graph").append("svg")
	    .attr("width", width + margin.left + margin.right)
	    .attr("height", height + margin.top + margin.bottom)
	  	.append("g")
	    .attr("transform",
	          "translate(" + margin.left + "," + margin.top + ")");

	  // format the data
	  data.forEach(function(d) {
	      d[0] = parseTime(d[0]);
	      d[1] = +d[1];
	  });

	  // Scale the range of the data
	  x.domain(d3.extent(data, function(d) { return d[0]; }));
	  y.domain([0, 100]);

	  // Add the valueline path.
	  svg.append("path")
	      .data([data])
	      .attr("class", "line")
	      .attr("d", valueline);

	  // Add the X Axis
	  svg.append("g")
		.attr("transform", "translate(0," + height + ")")
		.call(d3.axisBottom(x)
	      	.ticks(d3.timeDay))
	    .selectAll("text")	
        .style("text-anchor", "end")
        .attr("dx", "-.8em")
        .attr("dy", ".15em")
        .attr("transform", "rotate(-65)");

      // text label for the x axis
	  svg.append("text")             
	      .attr("transform",
            "translate(" + (width/2) + " ," + 
                           (height + margin.top + 40) + ")")
	      .style("text-anchor", "middle")
	      .text("Date");
	


	  // Add the Y Axis
	  svg.append("g")
	      .call(d3.axisLeft(y));

	  // Y axis label
	  svg.append("text")
	      .attr("transform", "rotate(-90)")
	      .attr("y", 0 - margin.left/2)
	      .attr("x",0 - (height / 2))
	      .attr("dy", "1em")
	      .style("text-anchor", "middle")
	      .text("Total percent eaten"); 


}

})