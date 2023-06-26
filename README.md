# Desserts App
## Bryce Cullen - Created for Fetch
### June 25, 2023

## Approach:
- On app launch, I query the 'https://themealdb.com/api/json/v1/1/filter.php?c=Dessert' endpoint and add each dessert ID to an array.
- Then, I loop over the array of ID's and query the 'https://themealdb.com/api/json/v1/1/lookup.php?i=' endpoint to gather the relevant info for each dessert. Null/empty values are filtered out.
- The relevant info obtained from the second API query is stored in a custom Dessert struct. All dessert structs are stored in a global array.

## Structure:
- The desserts (DessertItem) are all displayed in ContentView as a simple list in alphabetical order.
- Tapping on a dessertItem navigates to the DessertDetails view which elegantly displays all the information about that dessert to the user.
- The Dessert Details view is broken into 3 sections: A header which contains the name, origin, and image for the dessert, A section for the recipe containing the ingredients and instructions, And a section containing the video and source links that navigate the user to an in-app custom web view.

## Features:
Beyond those specified, I have added a few features:
- Image display from URL on the DessertDetails page.
- In app video and website viewing in the DessertDetails page via a custom WebView.
Unimplemented: With more time, I had hoped to implement a sorting system for the main view that allows users to show desserts that fall under a certain tag or tags. I parsed the JSON data such that the tags are stored in an array of strings rather than one string (["tag1","tag2","tag3"] vs. "tag1,tag2,tag3").

### NOTE: For a few desserts, there are valid youtube links, however those videos have since been made private or taken down. With furhter polishing, I would verify that the video is public before displaying a navigation link for it.
