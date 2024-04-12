#Introduction: A brief overview of the project, its purpose, and key features.
- User registration and login
- Sharing YouTube videos
- Viewing a list of shared videos (no need to display up/down votes)
- Real-time notifications for new video shares: When a user shares a new video, other logged-in users should receive a real-time notification about the newly shared video. This notification can be displayed as a pop-up or a banner in the application, and it should contain the video title and the name of the user who shared it.

#Prerequisites: List required software and tools, along with their appropriate versions.
- Ruby 3.1.4
- Rails 7.0.8.1
- Docker

#Installation & Configuration: Step-by-step instructions for cloning the repository, installing dependencies, and configuring settings.
- Cloning the repository: git clone https://github.com/npmnn/videos_sharing.git
- Install WSL2, Docker Desktop (Windows)
- Install Docker, Docker-Compose (Ubuntu)

#Database Setup: Instructions for setting up the database, running migrations, and seeding data if necessary.
- cd source code (videos_sharing folder)
- docker-compose build
- docker-compose up
- docker-compose run web rake db:create
- docker-compose run web rake db:migrate

#Running the Application: How to start the development server, access the application in a web browser, and run the test suite.
- After running docker-compose up, the development environment will be up and running
- Access the application in a web browser: http://localhost:3000/
- docker-compose run web rspec

#(BE/FS) Docker Deployment: Instructions for deploying the application using Docker, including building the Docker image and running containers (optional for Backend developers)

#Usage: A brief guide outlining how to use the application, including any specific features or functionality the reviewer should be aware of.
- After accessing the application, create a user account
- Share video by pressing the button: Share Video on screen
- Video information shared by others will be automatically pushed to notifications on the screen

#Troubleshooting: Common issues that may arise during setup and their potential solutions.
