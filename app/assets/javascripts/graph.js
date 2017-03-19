// $.ajax({
//            type: "GET",
//            contentType: "application/json; charset=utf-8",
//            url: '/data',
//            dataType: 'json',
//            success: function (data) {
//                draw(data);
//                console.log(data)
//            },
//            error: function (result) {
//                error();
//            }
//        });

// function draw(data) {
//     var color = d3.scale.category20b();
//     var width = 420,
//         barHeight = 20;

//     var x = d3.scale.linear()
//         .range([0, width])
//         .domain([0, d3.max(data)]);

//     var chart = d3.select("#graph")
//         .attr("width", width)
//         .attr("height", barHeight * data.length);

//     var bar = chart.selectAll("g")
//         .data(data)
//         .enter().append("g")
//         .attr("transform", function (d, i) {
//                   return "translate(0," + i * barHeight + ")";
//               });

//     bar.append("rect")
//         .attr("width", x)
//         .attr("height", barHeight - 1)
//         .style("fill", function (d) {
//                    return color(d)
//                })

//     bar.append("text")
//         .attr("x", function (d) {
//                   return x(d) - 10;
//               })
//         .attr("y", barHeight / 2)
//         .attr("dy", ".35em")
//         .style("fill", "white")
//         .text(function (d) {
//                   return d;
//               });
// }

// function error() {
//     console.log("error")
// }

//Width and height
// $("document").ready(function(){
//   alert("hi");
//       var w = 500;
//       var h = 50;

//       var svg = d3.select("#graph")
//             .append("svg")
//             .attr("width", w)   // <-- Here
//             .attr("height", h); // <-- and here!

//             var dataset = [ 5, 10, 15, 20, 25 ];

//             var circles = svg.selectAll("circle")
//           .data(dataset)
//           .enter()
//           .append("circle");

//       circles.attr("cx", function(d, i) {
//               return (i * 50) + 25;
//           })
//            .attr("cy", h/2)
//            .attr("r", function(d) {
//                 return d;
//         }).attr("fill", "yellow")
//         .attr("stroke", "orange")
//         .attr("stroke-width", function(d) {
//             return d/2;
//       });
// })

$("document").ready(function(){
  alert("hi")
})