-- Location Data Quality & Process Analysis (table: location_reviews)
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT Record_ID) AS distinct_ids,
 SUM(Records_Reviewed) AS records_reviewed,
 SUM(CASE WHEN TRIM(Review_Status)='Approved' THEN 1 ELSE 0 END) AS approved,
 AVG(Resolution_Minutes) AS avg_resolution_minutes
FROM location_reviews;

-- Missing or invalid fields
SELECT
 SUM(CASE WHEN Region IS NULL OR TRIM(Region)='' THEN 1 ELSE 0 END) AS missing_region,
 SUM(CASE WHEN Latitude IS NULL THEN 1 ELSE 0 END) AS missing_latitude,
 SUM(CASE WHEN Longitude IS NULL OR Longitude=0 THEN 1 ELSE 0 END) AS invalid_longitude,
 SUM(CASE WHEN Errors_Found<0 THEN 1 ELSE 0 END) AS negative_errors
FROM location_reviews;

-- Duplicate record identifiers
SELECT Record_ID, COUNT(*) AS occurrences FROM location_reviews
GROUP BY Record_ID HAVING COUNT(*)>1 ORDER BY occurrences DESC;

-- Region throughput and approval rate
SELECT COALESCE(NULLIF(TRIM(Region),''),'Unknown') AS region,
 COUNT(*) AS review_count, SUM(Records_Reviewed) AS records_reviewed,
 AVG(CASE WHEN TRIM(Review_Status)='Approved' THEN 1.0 ELSE 0.0 END)*100 AS approval_rate_pct
FROM location_reviews
GROUP BY COALESCE(NULLIF(TRIM(Region),''),'Unknown') ORDER BY review_count DESC;

-- Issues with highest average resolution time
SELECT Issue_Type, COUNT(*) AS issue_count, AVG(Resolution_Minutes) AS avg_resolution_minutes
FROM location_reviews GROUP BY Issue_Type ORDER BY avg_resolution_minutes DESC;
