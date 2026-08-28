# **Hurricane Hugo Impact on Concentration in Puerto Rico's Streams**

#### Author: 

Karla Ramos [[Github Profile](https://github.com/Karlavramos)]

##### Contributors:

Eden Gonzalez

Karolina Sienko



## Genneral Summary
This repository purpose is to reproduce figure 3 from Schaefer et al. (2000), that demonstrated the changes in stream chemistry overtime including hurricane disturbance by Huricane Hugo. The analysis focus on concentration changes in (a) potassium, (b) nitrate-N, (c) magnesium, (d) calcium and (e) ammonium-N in Bisley bason and Rio Mameyes Punete Roto.

## Repository Content

1. **clean_data:** Data that has been developed to plot and recreate analysis.

2. **data:** Raw data entries from Chemistry of stream water from the Luquillo Mountains ver 4923064, Brisley Quebradas (1-3) and Rio Mameyes Puerto Roto.

3. **docs:** Rendered version of paper.

4. **output:** Csv created from clean data.

5. **paper:** Paper that breaksdown the project details and results.

6. **R:** Functions created to clean data for analysis.


## Data 
McDowell, W. and International Institute of Tropical Forestry(IITF), USDA Forest Service.. 2024. Chemistry of stream water from the Luquillo Mountains ver 4923064. Environmental Data Initiative. https://doi.org/10.6073/pasta/f31349bebdc304f758718f4798d25458 (Accessed 2026-08-25).

1_Cleaned_data was developed by applying moving-average() and tidy-data() functions. The tidy_data function filters all the data from 1988-1994 and selects the ions needed for analysis. The moving-average function applies 
9 week moving average and calulates the mean average for every site.


## Refrences
Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358. 

