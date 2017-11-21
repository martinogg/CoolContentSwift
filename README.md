# CoolContentSwift

A personal project to port the "Contents Viewer" app from React Native to Swift.
This app is aimed at implementing best practises, using MVVM structure with TDD.

The project is also hooked up to Travis-CI for online testing. https://travis-ci.org/martinogg/CoolContentSwift

The basis of the project is to present content in a vertical scroll view, based on JSON config files.
These config files are manually generated, but has a structure defined in a JSON Schema file.

There are a number of elements in the config structure, text, a selectable text button, image and image button.
A tree structure of elements may be created, allowing the user to drill down to view content in a UINavigationController.

Currently under development, so not all features are implemented yet.


# JSON Schema

A Schema file describes the structure of the config files to be loaded. Check out ConfigSchema/configschema.json for the schema.
To create a config file based on the schema with a slightly nicer interface than a text editor, check out http://jeremydorn.com/json-editor/

Directions.
- go to http://jeremydorn.com/json-editor/
- on the Schema pane at the botton, replace the default schema with the schema at ConfigSchema/configschema.json and click Update Schema
- You can now see a GUI version of the JSON content on the left side, with the created JSON output on the right side
- Create your content, then save out the created JSON file to load up in the project, either as a local file in the app or an online file thats linked to by the local file in the app.

Top Level Object types
- local_list
	Provides a list of items in a Vertical scroll view. The items are explained below 

- external_url
	Shows a full-screen url as part of a UIWebView within the app

- config_external_url
	Returns the result of a specified url for the config file instead. The app requires a local config to begin with, however it could be just a link to an online resource


Items in a local_list

- basic_list_item
	A standard UITableViewCell with customisable text. Tap to excute an action. This action will push a new UITableView on to the Navigation Controller with the contents of the "target" entry, consisting of a top level object type

- imagebutton_list_item 
	A customised UITableViewCell with image. The source can be local (denoted "asset:[filename]"), or specified with a URL. Tap to excute an action. This action will push a new UITableView on to the Navigation Controller with the contents of the "target" entry, consisting of a top level object type	

- image_list_item
	A customised UITableViewCell with image. The source can be local (denoted "asset:[filename]"), or specified with a URL.

- text_list_item
	A standard UITableViewCell with customisable text. 


The initial config file is at config.json within the project
