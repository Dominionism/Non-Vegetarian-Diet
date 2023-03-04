# Non-Vegetarian-Diet

Link: https://dominion.shinyapps.io/Non-Vegetarian-Diet/

## Data Set Description
The data set dedicated for this project contains **values** that display different *dietary meal* preferences of different countries and how they were affected they were affected by the **COVID-19** pandemic. To be more specific, the data set itself explores the different intakes of certain meals and how the meal products affect different consequences of the pandemic such as **confirmed cases**, **death**, **recovery**, and so on.

## Widget(s) & Panel Descriptions

#### Plot Section
For the plot, there are two specific widgets used. First, there is the **slider** widget, which is an important interactive tool that the user can manipulate under their own discretion. The **slider** contains a specific range of values that the user can experiment with and the *default* number of data points that the user begins with is *ten* data points.

Following the slider, the **radioButtons** widget was also purposely included in order to present the user an additional layer of interactive experience that enables them to manipulate the color of the data points themselves, with two options, either **"blue"**, or **"red"**.

**Additional Notes**: On the side of the visual plot, it displays *legends* of which the data points change color (not only through the users selection), but also due to the differences in **"recovery conditions"**.

The plot section is contains a "titlePanel" which outputs the title of the visual "mainPanel" plot, and the slider is contained within the "sidebarPanel."

**Text Summary**: The text summary below the main panel reacts to the user interaction and displays the specific value they have selected, corresponding to the number of data points visible on the plot.


#### Table Section
For the table, there is the **select** input widget. Similar to the other widgets used in this project, the **select** widget grants the user the opportunity to interact with the data set and manipulate the front-end based on the information that is relevant. In this specific table panel, the **select** enables the user to select the different countries within the data set and view the different values of "Meat" intake and their "Recovery" cases post-COVID.

The table section also contains the "sidebarPanel" which contains the interactive **select** widget, and the "mainPanel" contains the data table that is **reactive** to user manipulation which in result changes the visible table values.

**Text Summary**: The text summary below the main panel reacts to the user interaction and outputs the country's **recovery** percentage rate.

## Project: Hours Dedicated
I dedicated approximately 15 hours to complete this project. However, this might be less than the actual time spent given that there was much reference back to the textbook which also consumed time, specifically for research.