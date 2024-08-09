# This is a passion project based on the data collected from the Washington Post. 

## How to download the dataset(s)
https://www.washingtonpost.com/national/2019/07/18/how-download-use-dea-pain-pills-database/
https://www.washingtonpost.com/investigations/interactive/2023/opioid-epidemic-pain-pills-sold-oxycodone-hydrocodone/

## Washington Post Repo
https://github.com/wpinvestigative/arcos-api

## The analysis will be done on Postgresql and visualized on Tableau. My goal is to showcase and spread awareness of the disease that has plagued our nation and in doing so, further my SQL, Tableau and data analysis learnings. 

### Tableau Viz
[https://public.tableau.com/app/profile/jason.lee2654/viz/OpioidAnalysis_17184034804720/opioiddashboard-v2](https://public.tableau.com/app/profile/jason.lee2654/viz/OpioidAnalysis_17184034804720/opioiddashboard-v4)

#### I originally used this [Wikipedia page](https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population) to find the populations of each state but the year's are inaccurate since displayed are years: 2000, 2020, and 2020 which I used for Rise, Peak and Fall years respectively. However it's not as accurate since the rise years, according to the Washington Post, started at 2006. To paint a more accurate picture, I used information from the US Census Bureau API, specifically the [ACS](https://www.census.gov/programs-surveys/acs) using Python. The API call, along with wrangling the data can be found under the ipynb file called [census_api.ipynb](https://github.com/JasonSTLee/opioid_project/blob/main/census_api.ipynb).

##### 
