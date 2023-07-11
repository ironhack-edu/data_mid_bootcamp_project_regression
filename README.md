# Data Mid-Bootcamp Project Regression

This repository provides a comprehensive overview of a project dedicated to the prediction of house prices based on various features. It not only includes our objective but also the methods employed for data extraction and data wrangling. 

While this document is written with an audience in mind that may or may not have technical expertise with Python/SQL/Tableau, we've tried to make the information as accessible as possible. 

## Table of Contents
- [Project Goal](#project-goal)
- [Data](#data)
    - [Data Points](#data-points)
    - [King County Grading System](#king-county-grading-system)
 
## Links: 
- Planning : https://www.notion.so/d780fdec038742ee819123921e7d2cb2?v=a80f602e31594e359f7c48b687e22396
- Tableau : https://public.tableau.com/authoring/Midbootcampproject_16890771105650/SqftlotvsPrice#1
- Miro : https://miro.com/welcomeonboard/QlFHSVF4Ulo1Wm5TSVpKOWExYWRMRXdkeVAwU3VITmxuWkx6SUEwQTh1MXZNOElic28xcVdRdWUyNXF2cTZzenwzMDc0NDU3MzUzNTI2OTQ4MDI0fDI=?share_link_id=845545079302
- Github: https://github.com/AntoineVagnon/data_mid_bootcamp_project_regression/tree/master

## Project Goal
Our project goal is twofold:
1. Predict the price of a house based on features provided in the dataset.
2. Understand which factors are responsible for higher property value - $650K and above.

## Data
Our dataset comprises of 22,000 properties within the timeframe of May 2014 to May 2015.

### Data Points
The dataset includes the following data points:
- **Id**: Unique identification number for the property.
- **date**: The date the house was sold.
- **price**: Price of the house.
- **waterfront**: Indicator of whether the house has a view to a waterfront.
- **condition**: The overall condition of the property. A value of 1 indicates a worn-out property and 5 an excellent condition.
- **grade**: Overall grade given to the housing unit, based on the King County grading system. Values range from 1 (poor) to 13 (excellent).
- **Sqft_above**: The square footage of the house excluding the basement.
- **Sqft_living15**: Living room area in 2015. This implies that some renovations may or may not have affected the lot size area.
- **Sqft_lot15**: LotSize area in 2015. This also implies potential renovations.

### King County Grading System
Grades, as part of the King County grading system, represent the construction quality of improvements. They range from grade 1 to 13, and are generally defined as:

1. **1-3**: Falls short of minimum building standards. Normally cabin or inferior structure.
2. **4**: Generally older, low-quality construction. Does not meet code.
3. **5**: Low construction costs and workmanship. Small, simple design.
4. **6**: Lowest grade currently meeting building code. Low quality materials and simple designs.
5. **7**: Average grade of construction and design. Commonly seen in plats and older sub-divisions.
6. **8**: Just above average in construction and design. Usually better materials in both the exterior and interior finish work.
7. **9**: Better architectural design with extra interior and exterior design and quality.
8. **10**: Homes of this quality generally have high quality features. Finish work is better and more design quality is seen in the floor plans. Generally have a larger square footage.
9. **11**: Custom design and higher quality finish work with added amenities of solid woods, bathroom fixtures, and more luxurious options.
10. **12**: Custom design and excellent builders. All materials are of the highest quality and all conveniences are present.
11. **13**: Generally custom designed and built. Mansion level. Large amount of highest quality cabinet work, wood trim, marble, entry ways etc.





