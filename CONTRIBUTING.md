# Contributing
First of all, thank you for considering contributing to Owllet. Your contribution, no matter how small, will be highly appreciated.

Owllet is early in its development, so there isn't a clear path of things to do, but the good thing is that you can help no matter which expertise you bring:
UI, UX, programming, writing tutorials, improving documentation, proposing features, improving the architecture, anything.

The current process for contributing is basically:
Open an issue for anything. really, anything. "How do I run it? Can I help document thing X? X doesn't happen when I do Z? We need Y."
When someone opens an issue about even the most trivial aspect of the project, that's an indicator that that thing needs to be better documented (feel free to contribute here as well).

### Current activities
There is a [Trello board](https://trello.com/b/FPugmZK3/project-doge-finances-development) that you can use to check the tasks under development during the current sprint.
I'm considering transitioning to GitHub projects to keep everything connected here on GitHub, but I haven't decided yet because Trello is very simple, and setting up GitHub projects would not be a trivial effort (feel free to volunteer for that).

## Where do I go from here?
The good thing is that there is no shortage of things to do and ways to help, so here is a list of the major areas where you can help.

### UX
At the moment, I'm writing a document describing the vision for Owllet, the problems it aims to solve, and the main features to implement.
The link will be added soon. And if it hasn't, don't hesitate to open an issue requesting it.

##### Ways to help
- Contribute to the doc
- Give feedback on the current UX and ways to improve
- Create a feature request template
- Request features (following the template)

### UI
At the moment, I'm defining the app design before continuing with development.
There is a [figma project](https://www.figma.com/file/4uLscrKfMesteCLARrVnE0/Project-Owllet---Mockups?node-id=0%3A1) where you can check the current design of the app. Right now it still has the old design from when the app was called DogeFinance.

##### Ways to help
- Build a design system (open an issue requesting guidance and access to the Figma project)
- Volunteer to design the app (open an issue requesting guidance and access to the Figma project)
- Volunteer to design some screens (open an issue requesting guidance and access to the Figma project)
- Volunteer to design a screen (open an issue requesting guidance and access to the Figma project)
- Document how to contribute to the UI: ask for access to the Figma project, open an issue to the task you are taking, etc
Sorry, I'm out of ideas here.

### Code
Also, there is code in general. And by code, I mean from the methods and attributes to code documentation and the architecture of the project.
The general idea here is that Owllet tries to use the best that the Flutter development offers, as long as it makes sense.
So for the architecture, we will use clean. And for state management, I have decided to use BLoC. For now, that's all I have decided.
Code quality will be a big focus, so we will also use TDD (Test-Drive Development), which implies writing tests.
And I'm also experimenting with various CI/CD platforms:
- [CodeMagic](https://codemagic.io/apps/623e94d7971f58cff431fa53/623e94d7971f58cff431fa52/latest_build) used to run tests on iOS
- [GitHub Actions](https://github.com/Louis-Ian/Owllet/actions) used to run tests on Android and build APKs
- [CircleCI](https://app.circleci.com/pipelines/github/Louis-Ian/Owllet) used to run tests on Android
- [CodeCov](https://app.codecov.io/gh/Louis-Ian/Owllet) used to track code coverage of tests

Feel free to propose improvements or ask for access by opening an issue

##### Ways to help
- Implementing a feature listed on the issues
- Solving a bug listed on the issues
- Improving a CI/CD pipeline
- Refactoring low-quality code to make it high-quality
- Documenting the code
- Document how to contribute to the code: fork, open PR, etc
- Document PR template

### General
Lastly, these are some things that don't have a category of their own.

##### Ways to help
- Report a bug
- Document a bug reporting template
- Document various templates
- Make tutorials on how to run the project, how to generate an APK, etc

## Wrapping up

If there is something you feel that's lacking in the project, check the list of opened issues to see if it has already been requested. If it's not, feel free to open an issue.
But do not email me. Not because I don't want to answer but because communications in an open source project should be public, and that's one of the reasons we are using issues.
If you have a better idea, feel free to suggest it using... you guessed it, another issue.
