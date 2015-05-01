#introduction: what are we learning (learning to use R's native plot functions, how to create your own function)
#what you will be doing (using plots to display data from the previous topics, using a function to produce a plot from your dataset)

#basic plotting
#plot with a vector, change color, line type
plot(mean_pop[,3]) #not particularly informative, it's unorganized
plot(sort(mean_pop[,3])) #this is better, now that the data is more ordered, but we can hardly see differences between countries since a few have very high populations
plot(log(mean_pop[,3])) #plotting by log will show better definition between the data points
#now that we have decided to use the log scale, let's store the logged data so our plot command gets less cluttered (you'll see how long it gets very soon)
x<-log(mean_pop$pop)
#adding labels to this plot will make it more useful for people you want to show it to
plot(x, main="Avg. Population of Nations in Gapminder Dataset") #main title
#add a title for the x axis
plot(x, main="Avg. Population of Nations in Gapminder Dataset", xlab="country")
#add a title for the y axis
plot(x, main="Avg. Population of Nations in Gapminder Dataset", xlab="country", ylab="log-scale mean population")
#our plot command is getting long again, let's store the main title in an object, so that we don't have to type it each time we want to make our plot
maintitle=c("Avg. Population of Nations in Gapminder Dataset")
#we're also going to do this with our other labels too, to save typing quotes around everything
myxlab=c("country")
myylab=c("log-scale mean population")

#if we want to change these to create a new plot, we can redefine what these objects contain, and our code down the road will still be functional

#so now our command looks like this. much easier to type:
plot(x, main=maintitle, xlab=myxlab, ylab=myylab)

#there are a million ways to modify a plot using base R graphics, and we don't have enough time to cover even a few of them, but I'm going to try to take you through some basic ones that will help you produce presentation-grade plots

#the labels for the x axis are just the indices of the data points of the we are plotting. they are uninformative, and we can make this more human friendly
#first, we will need to remove the original x axis and create our own using the xaxt parameter in the plot command
#removing the x axis label
plot(x[1:20], main=maintitle, xlab=myxlab, ylab=myylab, xaxt="n") #let's just plot the information for the first 20 countries
#now we use the axis() command to add in some stand-in labels
axis(1, at=1:20, labels=letters[1:20])

#open question: write in the etherpad a command that will do the same thing for all the countries, not just the first 20

#now let's try this with the actual country names #who has a guess about how we might do this (hint, the order of the data has not changed from the object we started with (mean_pop)
plot(x[1:20], main=maintitle, xlab=myxlab, ylab=myylab, xaxt="n")
#let's store our labels in an object like we did for the other things we don't want to type each time
xlabels=mean_pop[1:20,1] #creating another object so we don't have to type out the labels each time we make a new plot
axis(1, at=1:20, labels=xlabels)

#this worked, but the size of the text is too big to display every label for every data point. let's change that.
#to change the orientation of the text, we can use a couple parameters
#the first is "las", which we will set with the par() command. par stores parameters for future plots being made
par(las=2)
axis(1, at=1:20, labels=xlabels)

#this is better, since each country name shows on the plot, but some of them are too long for the plot. we can use a different way to adjust the labels to make them appear diagonally at an angle of our choice
par(las=1) #we have to set par back to 1 (horizontal labels, not perpendicular)
#and we have to add the label text separately from the axis itself, like so:
plot(x[1:20], main=maintitle, xlab=myxlab, ylab=myylab, xaxt="n")
axis(1, at=1:20, labels=F)
text(1:20, par("usr")[3], labels=xlabels, srt=45, pos=2, adj=c(0,0), xpd=T) 
#the first argument (1:20) specifies the number of points being plotted / how the axis line is divided by ticks
#the xpd parameter lets us make sure that the letters are allowed to be printed outside the plot box itself
#the pos and adj parameters specifies how the text is justified with respect to the point they are plotted on
#srt specifies the angle of rotation of the text around the plot point
#the par("usr") parameter specifies the axis the labels are to be plotted on. in this case 3 specifies a position along the x axis

#this gives us the kind and orientation of text we want, but the axis lines and ticks are sort of in the way. there are a lot of choices here (we can move the text around the plot, for example), but we're going to do the simplest thing we can do and increase the margin at the bottom of the plot using par()
par("mar") #this will show us our current margin parameters 
#x y axis margins are the two first parameters (the others are top x and top y axis margins). increasing the numbers increases the distance from the edge of the plot window to the axis line in question. 
par(mar=c(9.1,4.1,4.1,2.1)) #i fiddled with this until i had a value that made sense for my axis labels
#we also don't really need the x axis label, and it's a bit cluttered down there anyway, so let's tell xlab to make the label blank
plot(x[1:20], main=maintitle, xlab=c(""), ylab=myylab, xaxt="n")
axis(1, at=1:20, labels=F)
text(1:20, par("usr")[3], labels=xlabels, srt=45, pos=2, xpd=T)

#let's make the country labels a bit bigger, too. we can use the cex parameter for this. it specifies a size multiplier for the text being printed, where 1.0 is the normal size.
text(1:20, par("usr")[3] - 0.3, labels=xlabels, srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T) #i also modified the par("usr") parameter so that the text is a little more offset from the x axis

#and let's draw a line in the graph that shows the log value of 10 million (so we can visualize which countries have fewer than 10 million people, for example)
plot(x[1:20], main=maintitle, xlab=c(""), ylab=myylab, xaxt="n")
#we can draw a line like this
abline(14,0) #where first number is the y intercept, and the second is the slope

#SOCRATIVE QUESTION
#who can guess how we do this for a population of 10 million on a log scale? 
abline(log(10000000),0)

#let's make this more colorful!
abline(log(10000000),0, col=blue)
#the col parameter can be changed for plot points, axis labels, and almost any other part of the plot as well. 

#so now, our plot looks like this:
plot(x[1:20], main=maintitle, xlab=c(""), ylab=myylab, xaxt="n")
abline(log(10000000),0, col=blue)
axis(1, at=1:20, labels=F)
text(1:20, par("usr")[3] - 0.1, labels=xlabels, srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T)

#we can also change the style of plot points we want to use using the pch parameter in the plot command
plot(x[1:20], main=maintitle, xlab=c(""), ylab=myylab, xaxt="n", pch=20)

#and plot over top of our plot using the points() command
points(x[21:40], pch=15, col="red") 

#next up: we can use par to create multiple plots at once
#we have done a stepwise improvement of our plot, so let's show same data with the original default parameters, plus our final plot side by side. we can plot these at the same time using the par command
par(mfrow=c(1,2)) #here i am saying that i would like one row with two columns in it
par(mar=c(9.1,4.1,4.1,2.1)) #our separate par commands must go up front, as far as i'm aware
plot(mean_pop$pop[1:20])
plot(x[1:20], main=maintitle, xlab=c(""), ylab=myylab, xaxt="n")
abline(log(10000000),0, col=blue)
axis(1, at=1:20, labels=F)
text(1:20, par("usr")[3] - 0.1, labels=xlabels, srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T)

#finally, we can learn how to produce a PDF/SVG/PNG of our plot from inside the R environment
#we already have all the code we need to make the plot, we just need to know how to turn it into a PDF. turns out this is very easy!
pdf("gapminder_mean_populations.pdf", width=7, height=7) #7 is the default value, we can change this if we want (for example, we could have a width of 14 and a height of 7 for our double plot that we just created, if we wanted to
plot()
othercommands()
dev.off() #this tells R that we are finished plotting, and it will write the file

#to produce and SVG or PNG just do the same but use the svg() and png() functions before making your plot
#when you are doing this, your plot will not appear in a graphics window. you have to know what it looks like ahead of time. there isn't much point in writing the file until you are finished, after all.


#open question: create 4 row 4 column plot using par that plots 20 counties' average populations in each plot window. so, first twenty in the first window, second twenty in the second window, and so on
#once everyone is ready, you can paste your answers in the Etherpad

#changing gears for a moment: writing your own functions
#functions are built like this:

NameOfFunction <- function(data, parameters passed to function, comma separated) {
	work done by function, if else statements, etc.
	return(results of work done)
}

#and they are called like this:
NameOfFunction(data, par1=TRUE, par2=c(5))

#R has a built in function to summarize a data table like the one we are working with:
summary(gapminder) #let's look at the output

#you can see that this gives you plenty of info, and it even does different things depending on the type of information it gets (for the non-numeric categories, it produces a different kind of output)

#let's pretend for a moment that the summary function doesn't exist... and we need to summarize a bunch of columns in a dataset, and get the standard deviation, minimum, maximum, and mean values for each

#let's write a function that does this for one column first

summaryfun=function(x) { #at the moment, it only takes one input, the data
	stdevx<-sd(x)
	meanx<-mean(x)
	minx<-min(x)
	maxx<-max(x)
	return<-c(stdevx, meanx, minx, maxx)
}
#we haven't printed anything to the screen, or done anything other than return the values yet
funtest=summaryfun(gapminder$lifeExp)
funtest #let's look at what we got. so we know that the order of output is stdev, mean, min, then max

#let's say you didn't want to do the min and max every time, only if you specifically needed it. you can set up a parameter for that when you call the function. something like this:

summaryfun=function(x, minmax=c(TRUE, FALSE) { #note the second parameter is added on this line
	stdevx<-sd(x)
	meanx<-mean(x)
	if(minmax==TRUE) { #now i create an if statement that decides whether the minimum and maximum values for the input data are calculated
		minx<-min(x)
		maxx<-max(x)
		result<-c(stdevx, meanx, minx, maxx) #let's store the results to be returned so we aren't writing conditional return statements
	} 
	if (minmax==FALSE) {
		result<-c(stdevx, meanx) #same goes for here
	}
	return(result)	#we'll never need to modify this line now, only the lines that define 'result'
}

#let's examine the output of the function with and without the minmax parameter
minmaxtest<-summaryfun(gapminder$lifeExp, minmax=TRUE)
nommtest<-summaryfun(gapminder$lifeExp, minmax=FALSE)

#we can see the function we wrote works, and that it only returns the minimum and maximum values of the data if we ask it to

#so now, let's say you wanted to do this to a bunch of different columns in the same dataset, R has a built-in function for that!
#we can use the apply function to do this to an entire matrix or data frame, either by rows or by columns, apply works like this:
apply(data, margin*, function, arguments for function) #*margin means either 1 for rows, 2 for columns, or c(1,2) for both

#so let's say we want to use the apply function to execute our own function on the numeric columns (4, 5, and 6) in the gapminder dataset, and just get the mean and standard deviation for each column
#how would we do this? try to figure out the syntax, and post it in the Etherpad when you are done
apply(gapminder[,4:6], 2, summaryfun, minmax=FALSE)

#writing your own function as a way to streamline a data pipeline
#let's imagine that you were studying the gapminder dataset, plus several other datasets with the same categories of data (country, life expectancy, population, etc), and you wanted to write a function that calculated the mean life expectancy, then produced a graph of your results, so that you could execute that function on each dataset. 

#you can subset the gapminder dataset by country, let's say by groups of 20, then have the function produce a plot for each group of 20. 142 (the total number of countries) isn't divisible by anything but 71 and 2, so we are going to create four pretend datasets of 20 countries each

#one thing to be aware of: if we want these plots to be comparable, we had better set the y axis to have the same limits for each plot. we can do this by calculating the min and max, so let's set that as a parameter ylim=c(min, max) in our function for the sake of the exercise 

#let's write that function, so that there is an option to print the plot to a PDF, or to have it show up on your screen.
gapminder_plot_fun<-function(gapminder, setylim=c(TRUE, FALSE), outformat=c("PDF", "SVG", "PNG")) {
	mean_LE<-aggregate(lifeExp ~ country + continent, gapminder, mean)
	#we have the mean populations, now let's being the plotting portion. we already know what we want to call the plots we're making. we could set this as a parameter too but it isn't necessary right now. 
	maintitle<-c("Avg. Life Expectancies in Different Countries")
	myylab<-c("average life expectancy") 

#let's pause here for a second, how would each student attempt the following IF statement?

	if (setylim==TRUE) {  
		myymin<-min(mean_LE$lifeExp) - 5
		myymax<-max(mean_LE$lifeExp) + 5 #i'm leaving a buffer here so the plot points aren't right up against the edges of the charts
	} 
	if (setylim==FALSE) { 
		myymin=NULL
		myymax=NULL #if we set them as null (meaning, they are empty), what do you think will happen?
	}
#but, if we don't set this, another conditional gets satisfied when each plot prints
	if (outformat == "PDF") { #if statements determine what the plot output format will be
		pdf("gapminder_life_expectancy.pdf", height=14, width=14)
	}
	if (outformat == "PNG") {
		png("gapminder_life_expectancy.png")
	}
	if (outformat == "SVG") {
		svg("gapminder_life_expectancy.svg")
	}
	par(mfrow=c(2,2))
	
	par(mar=c(9.1,4.1,4.1,2.1))
	toplot=mean_LE$lifeExp[1:20]
	#if (setylim==FALSE) { myymin=min(toplot); myymax=max(toplot) }
	plot(toplot, main=maintitle, xlab=c(""), ylab=myylab, ylim=c(myymin, myymax), xaxt="n")
	axis(1, at=1:20, labels=F)
	text(1:20, par("usr")[3] - 0.3, labels=mean_LE[1:20,1], srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T)
	
	par(mar=c(9.1,4.1,4.1,2.1))
	toplot=mean_LE$lifeExp[21:40]
	#if (setylim==FALSE) { ymin=min(toplot); ymax=max(toplot) }
	plot(toplot, main=maintitle, xlab=c(""), ylab=myylab, ylim=c(myymin, myymax), xaxt="n")
	axis(1, at=1:20, labels=F)
	text(1:20, par("usr")[3] - 0.3, labels=mean_LE[21:40,1], srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T)
	
	par(mar=c(9.1,4.1,4.1,2.1))
	toplot=mean_LE$lifeExp[41:60]
	#if (setylim==FALSE) { ymin=min(toplot); ymax=max(toplot) }
	plot(toplot, main=maintitle, xlab=c(""), ylab=myylab, ylim=c(myymin, myymax), xaxt="n")
	axis(1, at=1:20, labels=F)
	text(1:20, par("usr")[3] - 0.3, labels=mean_LE[41:60,1], srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T)
	
	par(mar=c(9.1,4.1,4.1,2.1))
	toplot=mean_LE$lifeExp[61:80]
	#if (setylim==FALSE) { ymin=min(toplot); ymax=max(toplot) }
	plot(toplot, main=maintitle, xlab=c(""), ylab=myylab, ylim=c(myymin, myymax), xaxt="n")
	axis(1, at=1:20, labels=F)
	text(1:20, par("usr")[3] - 0.3, labels=mean_LE[61:80,1], srt=45, pos=2, adj=c(0,0), cex=1.2, xpd=T)
	
	#as an aside, i'd like to do this in a more automated way that would make sense if we were actually doing work we meant to publish or present, but to do that I'd have to introduce more concepts than I think I should in my section of the course
	dev.off()
}

#so now we get to execute this monstrosity
gapminder_plot_fun(gapminder, setylim=TRUE, outformat=c("PDF"))