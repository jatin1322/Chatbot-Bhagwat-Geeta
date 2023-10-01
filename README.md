# Bhagwat Geeta Chatbot Documentation

## Overview

This is an AI Chatbot which answers User’s queries/life problems by quoting examples
from The Bhagavad Gita using Meta’s Llama 2 model.

## Components

The Bhagwat Geeta Chatbot is composed of two main components:

1. **Data Preparation and Vectorization (ingest.py):**
   - Responsible for loading Bhagwat Geeta PDF documents, splitting the text into chunks, and creating a FAISS vector store for efficient similarity search.

2. **Chatbot Implementation (model.py):**
   - Implements a question-answering chatbot using LangChain, Hugging Face Transformers, and FAISS for retrieval-based question answering.

## Model Architecture

### LangChain Components

1. **CTransformers (LangChain LLM):**
   - The `CTransformers` class loads a locally downloaded language model ("llama-2-7b-chat.ggmlv3.q8_0.bin") using the LangChain library.
   - Parameters:
     - `model`: Model file name.
     - `model_type`: Model type ("llama").
     - `max_new_tokens`: Maximum number of new tokens in the generated response.
     - `temperature`: Sampling temperature for generation.

2. **HuggingFaceEmbeddings:**
   - Utilizes the Hugging Face Transformers library to load a pre-trained transformer model ("sentence-transformers/all-MiniLM-L6-v2") for generating embeddings from text.
   - Parameters:
     - `model_name`: Pre-trained transformer model name.
     - `model_kwargs`: Additional model-specific arguments (in this case, setting the device to 'cpu').

3. **FAISS Vector Store:**
   - Utilizes the FAISS library to create a vector store from Bhagwat Geeta documents' text chunks.
   - Documents are loaded using PyPDFLoader and split into chunks using RecursiveCharacterTextSplitter.

4. **PromptTemplate:**
   - Defines a prompt template for the QA retrieval chain, including placeholders for context and question.

5. **RetrievalQA Chain:**
   - Constructs a retrieval-based question-answering chain using LangChain's `RetrievalQA` class. It uses the CTransformers language model, a FAISS retriever, and a custom prompt.

### ChainLit Integration

- Uses ChainLit to manage chat interactions, including chat start and message handling.
- Defines a custom callback handler to process the final answer and source documents.

## Usage

### Data Preparation and Vectorization

1. **Setup:**
   - Ensure you have the required Python environment with the necessary libraries installed (`langchain`, `huggingface`, `faiss-gpu`, etc.).
   - Adjust the `DATA_PATH` and `DB_FAISS_PATH` variables in the code to point to your Bhagwat Geeta PDF documents and desired vector store path.

2. **Run:**
   - Execute the script to create the FAISS vector store:

     ```bash
     python ingest.py
     ```

### Chatbot Implementation

1. **Setup:**
   - Ensure you have the required Python environment with the necessary libraries installed (`langchain`, `huggingface`, `faiss-gpu`, etc.).
   - Adjust the `DB_FAISS_PATH` variable in the chatbot script to point to the vector store path.

2. **Run:**
   - Execute the chatbot script:

     ```bash
     chainlit run model.py -w
     ```

3. **Interaction:**
   - Upon running the script, the chatbot will start, prompting the user for queries related to Bhagwat Geeta.
   - The chatbot will provide answers based on the implemented retrieval QA chain.

---


## Dockerization

### Docker Hub Repository

- The Dockerized application is available on Docker Hub at [jatin1322/chatbot](https://hub.docker.com/repository/docker/jatin1322/chatbot/general).

### Usage

- To run the Docker container, use the following command:

  ```bash
  docker run -p 8000:8000 jatin1322/chatbot:latest


### How to Run

1. **Pull the Docker Image:**
   - Pull the Docker image from Docker Hub:

     ```bash
     docker pull jatin1322/chatbot
     ```

2. **Run the Docker Container:**
   - Run the Docker container with port mapping (replace `8000:8000` with the desired port mapping):

     ```bash
     docker run -p 8000:8000 jatin1322/chatbot
     ```


