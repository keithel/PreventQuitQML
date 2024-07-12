# PreventQuitQML - Qt QML example showing how to handle quit

An example app that shows you how to handle two different things related to
application quitting.

# What this does

First, it shows how to be notified that the app will be
quitting momentarily, giving you a chance to do some cleanup.

Second, it shows how to handle the user requesting that the app quit, allowing
you to interrupt that process and either fully prevent it, or provide some UI to
the user to, for instance, check that they're sure they want to quit the app.

## Running

Install Qt from online installer or elsewhere.
Open in Qt Creator, select Qt kit to use, build, and run.
It is designed to run on both both Qt 5.15 and 6.x.
