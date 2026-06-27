# Machine Learning

# Amazon Rekognition
- Find objects, people, text, and scenes in images and videos using Machine Learning
- Facial analysis and facial search for user verification
- People counting
- Create a database of **"familiar faces"** or compare against celebrities

## Use Cases
- Labeling
- Content Moderation
- Text Detection
- Face Detection and Analysis
  - Gender
  - Age range
  - Emotions
- Face Search and Verification
- Celebrity Recognition
- Pathing
  - Example: Sports game analysis

# Amazon Transcribe
- Automatically converts speech to text
- Uses a deep learning process called **Automatic Speech Recognition (ASR)** to convert speech to text quickly and accurately
- Automatically removes Personally Identifiable Information (PII) using **Redaction**
- Supports automatic language identification for multilingual audio

## Use Cases
- Transcribe customer service calls
- Automate closed captioning and subtitling
- Generate metadata for media assets to create a fully searchable archive

# Amazon Polly
- Turn text into lifelike speech using deep learning
- Allows you to create applications that talk

# Amazon Translate
- Provides natural and accurate language translation
- Allows you to localize content such as websites and applications for international users
- Easily translates large volumes of text efficiently

# Amazon Lex & Amazon Connect

## Amazon Lex
- Uses the same technology that powers **Alexa**
- Uses **Automatic Speech Recognition (ASR)** to convert speech to text
- Uses **Natural Language Understanding (NLU)** to recognize the intent of text or callers
- Helps build:
  - Chatbots
  - Call center bots

## Amazon Connect
- Cloud-based virtual contact center
- Receive calls and create contact flows
- Integrates with other CRM systems or AWS services
- No upfront payments
- Up to **80% cheaper** than traditional contact center solutions

### Example Workflow

```text
Phone Call
(Schedule an Appointment)
        │
        ▼
Amazon Connect
        │
        ▼
Amazon Lex
(Intent Recognized)
        │
        ▼
AWS Lambda
(Invoke Function)
        │
        ▼
CRM
(Schedule Appointment)
```

# Amazon Comprehend
- Used for **Natural Language Processing (NLP)**
- Fully managed and serverless service
- Uses Machine Learning to find insights and relationships in text

## Features
- Detects the language of the text
- Extracts:
  - Key phrases
  - Places
  - People
  - Brands
  - Events
- Determines whether text is positive or negative (Sentiment Analysis)
- Analyzes text using tokenization and parts of speech
- Automatically organizes collections of text files by topic

## Sample Use Cases
- Analyze customer interactions (emails) to identify what led to a positive or negative experience
- Create and group articles by topics discovered by Amazon Comprehend