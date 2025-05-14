Create database Ola;
Use Ola;
Select * from Bookings;
Alter table bookings
Drop Column MyUnknownColumn;

# Retrieve all successful bookings:
Select * from bookings where Booking_Status = "Success";

# Find the average ride distance for each vehicle type:
Select vehicle_type,avg(ride_distance) as Avg_Dist from Bookings group by vehicle_type
order by Avg_Dist desc;

# Get the total number of cancelled rides by customers
Select Count(booking_status) as Total_Cancelled from bookings 
where Booking_status = 'Canceled by Customer';

# List the top 5 customers who booked the highest number of rides:
Select Customer_id,count(booking_id) as Total_Bookings from bookings
group by customer_id order by total_bookings desc Limit 5;

# Get the number of rides cancelled by drivers due to personal and car-related issues:
Select count(*) as Total_rides_cancelled from bookings 
where canceled_rides_by_driver = 'Personal & Car related issue';

# Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select max(Driver_Ratings) as Max_Rating, 
min(Driver_Ratings) as Min_Rating 
from bookings
where vehicle_type = 'Prime Sedan';

# Retrieve all rides where payment was made using UPI:
Select * from bookings where payment_method = 'UPI';

# Find the average customer rating per vehicle type:
Select Vehicle_Type,round(Avg(Customer_Rating),2) as Average_Cust_Rating from bookings
group by Vehicle_Type Order by Average_Cust_Rating desc;

# Calculate the total booking value of rides completed successfully:
Select sum(Booking_Value) as Total_Value from bookings 
where booking_status = 'Success';

# List all incomplete rides along with the reason:
Select Booking_id,Incomplete_Rides_Reason from bookings 
where Incomplete_Rides ='Yes';
