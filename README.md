# X plane altitude and speed analysis.

On a curious whim, and maybe after watching "The Right Stuff" again, I became interested in plotting up the different test flights for various X aircraft launched by the US Air Force in the mid-20th century.

This project was a good test of:
1. Web scraping with RVest on wikipedia Package
2. GGPlot for the visualization development.


These data were gleaned from the wikipedia pages for X-Planes
[X-1](https://en.wikipedia.org/wiki/List_of_X-1_flights)
[X-2](https://en.wikipedia.org/wiki/List_of_X-2_flights)
[X-15](https://en.wikipedia.org/wiki/List_of_X-15_flights)
Important to note that the Douglas D-558-2 was not included in these data bases because it was a private aircraft developed by Douglas Aircraft Company and not operated by the USAF.This was the first airplane to breach Mach 2.

The resulting data yield some interesting visuals like the one below:
![Mach v year by plane](Mach_v_Year.jpeg)

Showing the distinct advances in technology and test bed plane velocity through time.

The X aircraft with the most high altitude high mach flights was the X-15. I developed the plot below just looking at the X-15 aircraft.
![X15 mach vs altitude](X15_mach_v_altitude.jpeg)

This plot highlights just how may tests were done between Mach 4 and 5 and were attempting to push the aircraft to higher and higher altitudes. 
