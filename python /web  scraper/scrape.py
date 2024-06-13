import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime

# URL of the Eventbrite page to scrape
url = "https://www.eventbrite.com/d/ca--san-francisco/events/"

# Create a CSV file to store the event data
csv_file = open("eventbrite_events.csv", "w", newline="", encoding="utf-8")
csv_writer = csv.writer(csv_file)
csv_writer.writerow(["Title", "Description", "Location", "Start Date", "End Date"])

# Send a request to the URL and get the HTML content
response = requests.get(url)
html_content = response.content

# Parse the HTML content
soup = BeautifulSoup(html_content, "html.parser")

# Find all event listings
event_listings = soup.find_all("div", {"class": "card-body"})

# Loop through each event listing
for listing in event_listings:
    # Extract event title
    title_element = listing.find("span", {"class": "listing-map-card-minor__name"})
    event_title = title_element.text.strip() if title_element else "N/A"

    # Extract event description
    description_element = listing.find("div", {"class": "structured-content-resolution"})
    event_description = description_element.text.strip() if description_element else "N/A"

    # Extract event location
    location_element = listing.find("div", {"class": "listing-map-card-location"})
    event_location = location_element.text.strip() if location_element else "N/A"

    # Extract event start and end dates
    date_element = listing.find("div", {"class": "listing-map-card-dates__container"})
    if date_element:
        date_text = date_element.text.strip()
        date_parts = date_text.split(" – ")
        if len(date_parts) == 2:
            start_date_str, end_date_str = date_parts
            try:
                start_date = datetime.strptime(start_date_str, "%a, %b %d %I:%M %p")
                end_date = datetime.strptime(end_date_str, "%a, %b %d %I:%M %p")
            except ValueError:
                start_date = "N/A"
                end_date = "N/A"
        else:
            start_date = "N/A"
            end_date = "N/A"
    else:
        start_date = "N/A"
        end_date = "N/A"

    # Write the event data to the CSV file
    csv_writer.writerow([event_title, event_description, event_location, start_date, end_date])

# Close the CSV file
csv_file.close()
print("Event data scraping complete. Data saved to eventbrite_events.csv")