#!/bin/bash

# Check if Docker is installed
if command -v docker &> /dev/null
then
    echo "Docker is installed. Running the 'chatbot' container..."
    
    # Run the 'chatbot' container with port mapping
    sudo docker run -p 8000:8000 jatin1322/chatbot:latest
    
else
    echo "Error: Docker is not installed. Please install Docker before running this script."
fi
