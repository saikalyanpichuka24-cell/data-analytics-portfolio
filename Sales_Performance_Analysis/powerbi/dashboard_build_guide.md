# Power BI Dashboard Build — Sales Performance
1. Get Data → Text/CSV → `data/sales_data_cleaned.csv`.
2. Set Order_Date to Date; Quantity to Whole Number; Sales, Cost, Profit to Decimal Number; Discount_Pct to Percentage.
3. Create a date table: `Calendar = CALENDAR(MIN(sales_data_cleaned[Order_Date]), MAX(sales_data_cleaned[Order_Date]))`
4. Relate `Calendar[Date]` to `sales_data_cleaned[Order_Date]`, then add measures from `measures.dax`.

## Page 1: Executive Overview
- KPI cards: Total Sales, Total Profit, Profit Margin %, Distinct Orders, Units Sold.
- Line chart: Calendar[Date] by Total Sales.
- Bar chart: Region by Total Sales.
- Slicers: Date, Region, Category, Sales_Channel.

## Page 2: Product & Category
- Clustered bar: Category by Total Sales and Total Profit.
- Bar chart: Product by Total Profit, descending.
- Table: Product, Total Sales, Total Profit, Profit Margin %.

## Page 3: Segment & Channel
- Matrix: Segment × Sales_Channel with Total Sales and Total Profit.
- Column chart: Average Discount % by Category.

## Page 4: Data Quality
- Card: Orders Needing Attention.
- Table: Order_ID, Region, Category, Quantity, Duplicate_Order_ID, Invalid_Quantity, Data_Quality_Flag.

Format Sales and Profit as currency. Add a footer: “Synthetic portfolio dataset; findings are illustrative.”
