window.onload = function(){
   
    var svgCanvas = d3.select("svg")
        .attr("width", 1080)
        .attr("height",600)
        .attr("class", "svgCanvas");
    
    d3.json("5120json.json", function(d){
       console.log(d);

        
        var location={}
        var minValue = Infinity;
        var maxValue = -1;
        d.forEach(function(thisD){
            var this_value =thisD['value']
            minValue = Math.min(minValue, this_value);
            maxValue = Math.max(maxValue, this_value);
        });
        var value2range = d3.scaleLinear()
            .domain([minValue, maxValue])
            .range([0.1, 1]);
       
    
        var range2color = d3.interpolateReds;
     

                
    
        svgCanvas.selectAll("circle")
            .data(d).enter() // create place hodlers if the data are new
            .append("circle") // create one circle for each
            .attr("cx", function(thisElement, index){ 
              // calculate the centres of circles
                
                return thisElement['x'];
            })
            .attr("cy", function(thisElement, index){
            return thisElement['y'];
        })
            .attr("r", function(thisElement, index){ 
              // use the value from data to create the radius
                return thisElement['value']/100;
            })
            .attr("fill", function(thisElement, index){
               return range2color(value2range(thisElement['value']))
            })
            
            .on("mouseover", function(thisElement, index){
                svgCanvas.selectAll("circle")
                    .attr("opacity", 0.1); // grey out all circles
                d3.select(this) // hightlight the on hovering on
                    .attr("opacity", 1);
                let xPosition = parseFloat(d3.select(this).attr("x"));
                let yPosition = parseFloat(d3.select(this).attr("y"));
                d3.select("#tooltip")
                  .style("left",xPosition)
                  .style("top",yPosition)
                  .select("#tooltip_value")
                  .text('The year is :'+thisElement['year']+'\n\nthe gap is :'+thisElement['value']);
             
                
                d3.select("#tooltip").classed("hidden",false);
                d3.select(this)
                   ;
                
                
            })
            .on("mouseout", function(thisElement, index){
              // restore all circles to normal mode
                svgCanvas.selectAll("circle") 
                    .attr("opacity", 1);
                 d3.select("#tooltip").classed("hidden",true);
            });
            svgCanvas.append("g")
                .attr("class", "labels")
                .selectAll("text")
                .data(d)
                .enter()
                .append("text")
                .attr("dx", function(d, i) {
                    return d['x']-40
                })
                .attr("dy", function(d, i) {
                    return d['y']+10
                })
                .attr('fill','white')
                .text(function(d) {
                    return d['value']+'\n\n'+d['year']
                ;
                });
        console.log(d);
        
            
      
    });
}