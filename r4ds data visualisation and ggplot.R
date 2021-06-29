print("This file was created within RStudio")
print("And now it lives on GitHub")
hi
install.packages('tidyverse')
yes
library('tidyverse')
print('checking github')

install.packages(c("nycflights13", "gapminder", "Lahman"))
install.packages('/var/folders/3p/z4pm7l2d015557gv_s81q6yr0000gn/T//RtmpdkMuY7/downloaded_packages')
library('ggplot2')
head(mpg)

#AESTHETIC MAPPING
#mapping out car data set
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
#scatter plot with colours
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
#renaming mpg data set
mpg -> car.data
head(car.data)
#make points blue
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#questions on chapter 1, 3.3.1
# why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
print('manually changing the aesthetics must be separatned from the geom function')
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
#what variables are categorical and continuous
#Those with <chr> above their columns are categorical, while those with <dbl> or <int> are continuous
print('c = manufacturer, model, class, trans, v = year, display, cyl, hwy')
?mpg
#map a continuous variable to colour, size and shape - bit  confused tbh
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = manufacturer, color = class))             
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = manufacturer, size = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))  
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) +
  geom_point()

# stroke aesthetic - changes the border of shapes (e.g. their thickness)
?geom_point
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class),
             stroke = 5,
             colour = 'blue')

#what happens if you map the same variable to multiple aesthetics? - generally not useful
ggplot(mpg, aes(x = displ, y = hwy, colour = hwy, size = displ)) +
  geom_point()

# What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)?
ggplot(mpg, aes(x = displ, y = hwy, colour = displ < 5)) +
  geom_point()
# gives a true and false option (i.e. if displ < 5 or not)

#FACETS
#Facets - subplots that each display one subset of the data
#to facet your data use facet_wrap() 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
head(mpg)
#The first argument of facet_wrap() should be a formula, which you create with ~ followed by a variable name (

#To facet your plot on the combination of two variables, add facet_grid()
# The first argument of facet_grid() is also a formula. This time the formula should contain two variable names separated by a ~.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

#questions 3.5.1
#What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ hwy, nrow = 2)
#The continuous variable is converted to a categorical variable, and the plot contains a facet for each distinct value.
#What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))vvvvvvvv
# plots with combination of drv and cyl that have no results/observations - shown in second plot
#What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
#The symbol . ignores that dimension when faceting. For example, drv ~ . facet by values of drv on the y-axis.
#What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? How might the balance change if you had a larger dataset?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))  
  
# adv - easier to distibuish between classes, more distinct categories (colours limited), easier to compare shape profiles
#dis - direct comparison of values more difficult, all points on one plot
#faceting generally more advantageous with more points and categories
#nrow and ncol are number of rows and columns when facets are presented

library(ggplot2)

#GEOMETRIC OBJECTS

#A geom is a geometrical object that a plot uses to represent data. I.e. bar plots use bar geoms, scatter charts use point geoms
# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
#every geom function in ggplot2 takes a mapping argument
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv))

#R CHEATSHEETS -> http://rstudio.com/resources/cheatsheets 

#Map two geoms to a single plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#this adds duplication to the code. placing mappings to ggplot function to make them 'global mappings'
#place mapings to geom function to make them 'local mappings' (extend or overwrite global mappings for that layer only)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#same principle to specify different data for each layer. 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

#Exercises 3.6

#line chart - geom_line(), boxplot - geom_boxplot(), histogram - geom_histogram(), area chart - geom_area()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)

#Show.legend = FALSE - remove legend/key
#se adds standard errors
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth(se = TRUE)

#3.6.1
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(group = drv), se = FALSE) +
  geom_point()
#
ggplot(mpg, aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth (mapping = aes(group = drv), se = FALSE)

rlang::last_error()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(colour = drv)) + 
  geom_smooth(se = FALSE)

#STATISICAL TRANSFORMATIONS

#bar charts can 'count' data for you into bins - uses algorithm known as a stat - stat tranforms the data
#every geom has a default stat; and every stat has a default geom
  

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
 # identity used to overwrite the default stat argument

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
#prop does stats by proportion rather than count
#“computed variables” - gives variables computed by the stat
 
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

#exercises 3.7
ggplot(data = diamonds) + 
  stat_summary(x = cut, y = depth)
    
  )
#defualt geom for stat_summary() is geom_pointrange()
# The default stat for geom_pointrange() is identity() but we can add the argument stat = "summary" to use stat_summary() instead of stat_identity().
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary"
  )

?stat_smooth()

#proportion bar chart needs group=1 as otherwise the proportion is calculated within the group
#fill aesthetic used for stacked bar chart

#POSITION ADJUSTMENT

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")


#You can colour a bar chart using either the colour aesthetic, or, more usefully, fill
#The stacking is performed automatically by the position adjustment specified by the position argument. 
#position = "fill" works like stacking, but makes each set of stacked bars the same height

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#position = "dodge" places overlapping objects directly beside one another.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#overplotting - toom any points to fit onto a scattergraph - overlap one another
#jitter adds small random noise to each point to prevent overlapping

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

#geom_point(position = "jitter"): geom_jitter().

#Note that the height and width arguments are in the units of the data. 
#Thus height = 1 (width = 1) corresponds to different relative amounts of jittering depending on the scale of the y (x) variable. 
# default values of height and width are defined to be 80% of the resolution() of the data, 
#which is the smallest non-zero distance between adjacent values of a variable.
#When x and y are discrete variables, their resolutions are both equal to 1, and height = 0.4 and width = 0.4 since the jitter moves p
#oints in both positive and negative directions.
ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) +
  geom_count(position = "jitter")

ggplot(data = mpg, aes(x = drv, y = hwy, colour = class)) +
  geom_boxplot()

#COORDINATE SYSTEMS

#The default coordinate system is the Cartesian coordinate system where the x and y positions act independently to determine the location of each point. 
#Coord_flip() switches the x and y axis - useful for long tables
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
#coord_quickmap() sets the aspect ratio correctly for maps
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

#coord_polar() uses polar coordinates
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()
#A pie chart is a stacked bar chart with the addition of polar coordinates.
ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
#The argument theta = "y" maps y to the angle of each section. 
#If coord_polar() is specified without theta = "y", then the resulting plot is called a bulls-eye chart.

#labs() function adds axis titles, plot titles and caption to the plot

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip() +
  labs(y = "Highway MPG",
       x = "Class",
       title = "Highway MPG by car class",
       subtitle = "1999-2008",
       caption = "Source: http://fueleconomy.gov")

#coord_quickmap ignores the curvature of the Earth - easier to computer and geoms dont need to be transformed

#The function coord_fixed() ensures that the line produced by geom_abline() is at a 45-degree angle. 

#overall template with which you can produce any graph
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
    mapping = aes(<MAPPINGS>),
    stat = <STAT>, 
    position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>




















  