---
ID: 5
post_title: FACTS ABOUT SHELTERS
author: user
post_excerpt: ""
layout: page
permalink: >
  http://13.234.93.46/home-2/let-get-started/
published: true
post_date: 2019-08-22 01:51:17
---
<ol>
<li style="font-weight: 400;">[d3-source canvas="wpd3-5-0"][d3-source canvas="wpd3-5-0"]In the adjacent graph, we can see the comparison between the number of dogs adopted, reclaimed and euthanized for the year 2014- 2017. </li>
<li style="font-weight: 400;">As you see, the number of dogs adopted haven’t changed much from 2015 to 2017, but there has been an increase in the euthanasia count.</li>
<li style="font-weight: 400;">This data is just for one shelter house, Geelong Animal Welfare Society (GAWS). The number of dogs euthanized in Australia each year is alarming. In 2016-2017, 5763 dogs were euthanized by the RSPCA.</li>
</ol>
<p>These numbers can be reduced if we are responsible towards our pets. While looking to adopt a pet, educate yourself about the pet care and arrangements you might need to do. Look at the below sections to get more insights regarding adopting pets in Victoria. Did you know the dog breeds that are most famous in Melbourne? </p>
<p><a href="http://patmydog.tk/home-2/let-get-started/be-ready-to-adopt/registered-dog-breeds/">KNOW MORE</a></p>
<p><noscript>&lt; a href=' '&gt;&lt; img alt=' ' src='https://public.tableau.com/static/images/Bo/Book1_15665367350820/Sheet12/1_rss.png' style='border: none' /&gt;<!-- a--></noscript><object class="tableauViz" style="display: none;" width="300" height="150"><param name="host_url" value="https%3A%2F%2Fpublic.tableau.com%2F" /><param name="embed_code_version" value="3" /><param name="site_root" value="" /><param name="name" value="Book1_15665367350820/Sheet12" /><param name="tabs" value="no" /><param name="toolbar" value="yes" /><param name="static_image" value="https://public.tableau.com/static/images/Bo/Book1_15665367350820/Sheet12/1.png" /><param name="animate_transition" value="yes" /><param name="display_static_image" value="yes" /><param name="display_spinner" value="yes" /><param name="display_overlay" value="yes" /><param name="display_count" value="yes" /></object> &gt;<br /><a role="button" href="#"><br />Click here<br /></a><br /><a role="button" href="http://patmydog.tk/home-2/be-ready-to-adopt/registered-dog-breeds/"><br />Know More<br /></a><br /><a role="button" href="http://patmydog.tk/home-2/let-get-started/be-ready-to-adopt/"><br />BE READY TO ADOPT<br /></a></p>
<p> </p>
<ul>
<li style="font-weight: 400;">Most of the pets that come to shelter are either abandoned or abused. This has a great impact on their behaviour and as they spend more time in shelter houses alone in closed rooms their behaviour worsens. </li>
<li style="font-weight: 400;">As we see in the adjacent chart, the main reason of euthanasia in rescue dogs is their behaviour. This can be avoided if we make sure to adopt a pet and give them the love they deserve.</li>
<li style="font-weight: 400;">At Patmydog, we encourage international students to be more aware and ready for the responsibilities that comes with pet adoption.</li>
</ul>

<!-- wp:html -->
<style>
body{
    width:1060px;
    margin:50px auto;
}
path {  stroke: #fff; }
path:hover {  opacity:0.9; }
rect:hover {  fill:blue; }
.axis {  font: 10px sans-serif; }
.legend tr{    border-bottom:1px solid grey; }
.legend tr:first-child{    border-top:1px solid grey; }

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {  display: none; }
.legend{
    margin-bottom:76px;
    display:inline-block;
    border-collapse: collapse;
    border-spacing: 0px;
}
.legend td{
    padding:4px 5px;
    vertical-align:bottom;
}
.legendFreq, .legendPerc{
    align:right;
    width:50px;
}

</style>
<body>
<div id='dashboard'>
</div>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script>
function dashboard(id, fData){
    var barColor = 'steelblue';
    function segColor(c){ return {low:"#807dba", mid:"#e08214",high:"#41ab5d"}[c]; }
    
    // compute total for each state.
    fData.forEach(function(d){d.total=d.freq.low+d.freq.mid+d.freq.high;});
    
    // function to handle histogram.
    function histoGram(fD){
        var hG={},    hGDim = {t: 60, r: 0, b: 30, l: 0};
        hGDim.w = 500 - hGDim.l - hGDim.r, 
        hGDim.h = 300 - hGDim.t - hGDim.b;
            
        //create svg for histogram.
        var hGsvg = d3.select(id).append("svg")
            .attr("width", hGDim.w + hGDim.l + hGDim.r)
            .attr("height", hGDim.h + hGDim.t + hGDim.b).append("g")
            .attr("transform", "translate(" + hGDim.l + "," + hGDim.t + ")");

        // create function for x-axis mapping.
        var x = d3.scale.ordinal().rangeRoundBands([0, hGDim.w], 0.1)
                .domain(fD.map(function(d) { return d[0]; }));

        // Add x-axis to the histogram svg.
        hGsvg.append("g").attr("class", "x axis")
            .attr("transform", "translate(0," + hGDim.h + ")")
            .call(d3.svg.axis().scale(x).orient("bottom"));

        // Create function for y-axis map.
        var y = d3.scale.linear().range([hGDim.h, 0])
                .domain([0, d3.max(fD, function(d) { return d[1]; })]);

        // Create bars for histogram to contain rectangles and freq labels.
        var bars = hGsvg.selectAll(".bar").data(fD).enter()
                .append("g").attr("class", "bar");
        
        //create the rectangles.
        bars.append("rect")
            .attr("x", function(d) { return x(d[0]); })
            .attr("y", function(d) { return y(d[1]); })
            .attr("width", x.rangeBand())
            .attr("height", function(d) { return hGDim.h - y(d[1]); })
            .attr('fill',barColor)
            .on("mouseover",mouseover)// mouseover is defined below.
            .on("mouseout",mouseout);// mouseout is defined below.
            
        //Create the frequency labels above the rectangles.
        bars.append("text").text(function(d){ return d3.format(",")(d[1])})
            .attr("x", function(d) { return x(d[0])+x.rangeBand()/2; })
            .attr("y", function(d) { return y(d[1])-5; })
            .attr("text-anchor", "middle");
        
        function mouseover(d){  // utility function to be called on mouseover.
            // filter for selected state.
            var st = fData.filter(function(s){ return s.State == d[0];})[0],
                nD = d3.keys(st.freq).map(function(s){ return {type:s, freq:st.freq[s]};});
               
            // call update functions of pie-chart and legend.    
            pC.update(nD);
            leg.update(nD);
        }
        
        function mouseout(d){    // utility function to be called on mouseout.
            // reset the pie-chart and legend.    
            pC.update(tF);
            leg.update(tF);
        }
        
        // create function to update the bars. This will be used by pie-chart.
        hG.update = function(nD, color){
            // update the domain of the y-axis map to reflect change in frequencies.
            y.domain([0, d3.max(nD, function(d) { return d[1]; })]);
            
            // Attach the new data to the bars.
            var bars = hGsvg.selectAll(".bar").data(nD);
            
            // transition the height and color of rectangles.
            bars.select("rect").transition().duration(500)
                .attr("y", function(d) {return y(d[1]); })
                .attr("height", function(d) { return hGDim.h - y(d[1]); })
                .attr("fill", color);

            // transition the frequency labels location and change value.
            bars.select("text").transition().duration(500)
                .text(function(d){ return d3.format(",")(d[1])})
                .attr("y", function(d) {return y(d[1])-5; });            
        }        
        return hG;
    }
    
    // function to handle pieChart.
    function pieChart(pD){
        var pC ={},    pieDim ={w:250, h: 250};
        pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;
                
        // create svg for pie chart.
        var piesvg = d3.select(id).append("svg")
            .attr("width", pieDim.w).attr("height", pieDim.h).append("g")
            .attr("transform", "translate("+pieDim.w/2+","+pieDim.h/2+")");
        
        // create function to draw the arcs of the pie slices.
        var arc = d3.svg.arc().outerRadius(pieDim.r - 10).innerRadius(0);

        // create a function to compute the pie slice angles.
        var pie = d3.layout.pie().sort(null).value(function(d) { return d.freq; });

        // Draw the pie slices.
        piesvg.selectAll("path").data(pie(pD)).enter().append("path").attr("d", arc)
            .each(function(d) { this._current = d; })
            .style("fill", function(d) { return segColor(d.data.type); })
            .on("mouseover",mouseover).on("mouseout",mouseout);

        // create function to update pie-chart. This will be used by histogram.
        pC.update = function(nD){
            piesvg.selectAll("path").data(pie(nD)).transition().duration(500)
                .attrTween("d", arcTween);
        }        
        // Utility function to be called on mouseover a pie slice.
        function mouseover(d){
            // call the update function of histogram with new data.
            hG.update(fData.map(function(v){ 
                return [v.State,v.freq[d.data.type]];}),segColor(d.data.type));
        }
        //Utility function to be called on mouseout a pie slice.
        function mouseout(d){
            // call the update function of histogram with all data.
            hG.update(fData.map(function(v){
                return [v.State,v.total];}), barColor);
        }
        // Animating the pie-slice requiring a custom function which specifies
        // how the intermediate paths should be drawn.
        function arcTween(a) {
            var i = d3.interpolate(this._current, a);
            this._current = i(0);
            return function(t) { return arc(i(t));    };
        }    
        return pC;
    }
    
    // function to handle legend.
    function legend(lD){
        var leg = {};
            
        // create table for legend.
        var legend = d3.select(id).append("table").attr('class','legend');
        
        // create one row per segment.
        var tr = legend.append("tbody").selectAll("tr").data(lD).enter().append("tr");
            
        // create the first column for each segment.
        tr.append("td").append("svg").attr("width", '16').attr("height", '16').append("rect")
            .attr("width", '16').attr("height", '16')
			.attr("fill",function(d){ return segColor(d.type); });
            
        // create the second column for each segment.
        tr.append("td").text(function(d){ return d.type;});

        // create the third column for each segment.
        tr.append("td").attr("class",'legendFreq')
            .text(function(d){ return d3.format(",")(d.freq);});

        // create the fourth column for each segment.
        tr.append("td").attr("class",'legendPerc')
            .text(function(d){ return getLegend(d,lD);});

        // Utility function to be used to update the legend.
        leg.update = function(nD){
            // update the data attached to the row elements.
            var l = legend.select("tbody").selectAll("tr").data(nD);

            // update the frequencies.
            l.select(".legendFreq").text(function(d){ return d3.format(",")(d.freq);});

            // update the percentage column.
            l.select(".legendPerc").text(function(d){ return getLegend(d,nD);});        
        }
        
        function getLegend(d,aD){ // Utility function to compute percentage.
            return d3.format("%")(d.freq/d3.sum(aD.map(function(v){ return v.freq; })));
        }

        return leg;
    }
    
    // calculate total frequency by segment for all state.
    var tF = ['low','mid','high'].map(function(d){ 
        return {type:d, freq: d3.sum(fData.map(function(t){ return t.freq[d];}))}; 
    });    
    
    // calculate total frequency by state for all segment.
    var sF = fData.map(function(d){return [d.State,d.total];});

    var hG = histoGram(sF), // create the histogram.
        pC = pieChart(tF), // create the pie-chart.
        leg= legend(tF);  // create the legend.
}
</script>

<script>
var freqData=[
{State:'AL',freq:{low:4786, mid:1319, high:249}}
,{State:'AZ',freq:{low:1101, mid:412, high:674}}
,{State:'CT',freq:{low:932, mid:2149, high:418}}
,{State:'DE',freq:{low:832, mid:1152, high:1862}}
,{State:'FL',freq:{low:4481, mid:3304, high:948}}
,{State:'GA',freq:{low:1619, mid:167, high:1063}}
,{State:'IA',freq:{low:1819, mid:247, high:1203}}
,{State:'IL',freq:{low:4498, mid:3852, high:942}}
,{State:'IN',freq:{low:797, mid:1849, high:1534}}
,{State:'KS',freq:{low:162, mid:379, high:471}}
];

dashboard('#dashboard',freqData);
</script>
<!-- /wp:html -->