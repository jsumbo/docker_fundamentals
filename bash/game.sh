#!/bin/bash

# Define a list of questions and their corresponding answers
quiz_questions=(
   "What is the capital of Japan? (a) Beijing (b) Tokyo (c) Seoul"
   "Who wrote 'Romeo and Juliet'? (a) William Shakespeare (b) Charles Dickens (c) Jane Austen"
   "What is the largest mammal on Earth? (a) Blue whale (b) Elephant (c) Giraffe"
   "Which planet is known as the Red Planet? (a) Venus (b) Mars (c) Jupiter"
   "Who painted the Mona Lisa? (a) Vincent van Gogh (b) Leonardo da Vinci (c) Pablo Picasso"
)

quiz_answers=("b" "a" "a" "b" "b")

# Greetings and instructions
echo "Welcome to the Quiz Game!"
echo "You will be prompted with multiple-choice questions. Please choose the correct answer by typing the corresponding letter."
echo

# Get user name
read -p "Please enter your name: " user_name

# Initialize a variable to keep track of the user's score
score=0

# Iterate through each question, prompt the user for input, and provide feedback
for i in "${!quiz_questions[@]}"; do
   read -p "${quiz_questions[i]} " user_response
   user_response=${user_response,,}  # Convert the input to lowercase
   if [[ $user_response == ${quiz_answers[i]} ]]; then
       echo "Correct!"
       ((score+=1))
   else
       echo "Incorrect!"
       ((score-=1))
   fi
done

# Display the user's final score
echo "Quiz completed, $user_name! Your final score is: $score out of ${#quiz_questions[@]}"

# Create a JSON object to store the user's name and score
json_object=$(cat <<EOF
{
   "name": "$user_name",
   "score": $score
}
EOF
)

# Define the file name for the JSON file
json_file_name='user_scores.json'

# Write the user data to a JSON file
echo "$json_object" > "$json_file_name"

echo "User data has been stored in $json_file_name"
