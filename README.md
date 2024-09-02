# Analyzing the Opioid Crisis

## How to download the dataset(s)
https://www.washingtonpost.com/national/2019/07/18/how-download-use-dea-pain-pills-database/
https://www.washingtonpost.com/investigations/interactive/2023/opioid-epidemic-pain-pills-sold-oxycodone-hydrocodone/

## Washington Post Repo
https://github.com/wpinvestigative/arcos-api

## How It's Made:

**Tech used:** Python , PostgreSQL, and Tableau

### Tableau Viz
[https://public.tableau.com/app/profile/jason.lee2654/viz/OpioidAnalysis_17184034804720/opioiddashboard-v2](https://public.tableau.com/app/profile/jason.lee2654/viz/OpioidAnalysis_17184034804720/opioiddashboard-v4)

#### I originally used this [Wikipedia page](https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population) to find the populations of each state but the year's are inaccurate since displayed are years: 2000, 2020, and 2020 which I used for Rise, Peak and Fall years respectively. However it's not as accurate since the rise years, according to the Washington Post, started at 2006. To paint a more accurate picture, I used information from the US Census Bureau API, specifically the [ACS](https://www.census.gov/programs-surveys/acs) using Python. The API call, along with wrangling the data can be found under the ipynb file called [census_api.ipynb](https://github.com/JasonSTLee/opioid_project/blob/main/census_api.ipynb).

## Getting data ready

I started off by downloading the datasets from the Washington Post's website for each state. The data is collected from the DEA and is all the records of opioid transactions. Since my Python kernel kept crashing when I appended all the csv's together, I decided to import the datasets into PostgreSQL. Before doing so, I read the csv's with only specific columns I needed to continue with my analysis, this shortened the amount of time and space importing csv's into PG. Code for this can be found in file [reading_csv.ipynb](https://github.com/JasonSTLee/Opioid-Project/blob/main/reading_csv.ipynb). The code for appending the files into one dataset on PG can be found in [table.sql](https://github.com/JasonSTLee/Opioid-Project/blob/main/table.sql).

Another dataset I needed to get was population of each state, per year from 2006 to 2019, the span of years the opioid data covers. I did this by calling the American Community Survey's API and creating a loop to get data for each year, then using Pandas to form the dataframe / csv. Code for this can be found in file [census_api.ipynb](https://github.com/JasonSTLee/Opioid-Project/blob/main/census_api.ipynb). The final dataset I needed was the count of deaths from opioid from 2006 - 2019.

## Analyzing and visualizing dataset

![Pills per Person per State](https://github.com/user-attachments/assets/47ed8dc4-6967-4636-87dc-efd0f125441c)
To begin, we start with the states with the highest pills per person, to no surprise Kentucky and West Virginia were the biggest victims of the crisis. Shockingly, Oklahoma is followed by Tennessee to be 4th; I didn't expect a non-Appalachian state to break the top 5.

![Scatterplot: Pills per Populatoin](https://github.com/user-attachments/assets/78d8b3a4-799c-4ce5-9ce5-a5f5170c313e)
I visualize the same information as above in a scatterplot to show that how one can showcase the content in different, meaningful ways. What's interesting here is that the bubble in the far right is California, the state with the highest population, but there isn't a high amount of opioids in the state.

![Pills & Deaths per Year](https://github.com/user-attachments/assets/5800c0c0-f32a-4ed3-b61c-1fc72cd94331)
I find this graph to be very interesting because it shows the delayed effects of opioids. There is a high surge in the early - mid 2010s in pills, and while there is the drop in the late 2010s, there is a high spike in deaths at the same time there is a drop in opioid transactions. 

![Chain to Retail Pharmacy Ratop](https://github.com/user-attachments/assets/b745edee-aec3-4233-95d0-3519263272d3)
The last graph I'd like to showcase is chain to retail pharmacy ratio. Watching too many Hollywood shows and movies, I assumed that the states with the highest opioid transactions (and therefore usage) would be states that also have more retail (mom and pop) pharmacies than chains. This is not the case as I plotted the top 5 states (based on count of pills per person) and the only state that has a higher chain to retail ratio is Nevada, which is 3x the national ratio. 

