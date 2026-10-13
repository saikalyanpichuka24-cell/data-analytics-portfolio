# Power BI Dashboard Build — Location Data Quality
1. Power BI Desktop → Get Data → Text/CSV → `data/location_reviews_cleaned.csv`.
2. Set Review_Date to Date; volume/error/minute fields to numeric.
3. Add measures from `measures.dax`.

## Page 1: Operations Overview
- KPI cards: Total Review Records, Records Reviewed, Approval Rate %, Average Resolution Minutes.
- Line chart: Review_Date by Records Reviewed.
- Bar chart: Region by Total Review Records.
- Donut: Review_Status by count of records.
- Slicers: Review_Date, Region, Road_Type.

## Page 2: Data Quality
- Cards: Records Needing Attention, Data Quality Pass Rate %, Distinct Record IDs.
- Table: Record_ID, Region, Latitude, Longitude, Errors_Found, Invalid_Coordinates, Duplicate_Record_ID, Data_Quality_Flag.
- Slicers: Region, Issue_Type, Review_Status.

## Page 3: Issue Analysis
- Bar chart: Issue_Type by record count and by Average Resolution Minutes.
- Matrix: Region × Review_Status with record count.
- Add footer: “Synthetic portfolio dataset; results are illustrative.”
