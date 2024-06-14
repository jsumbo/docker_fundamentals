import json

# Define a list of questions and their corresponding answers
quiz_questions = [
    "What is the capital of France?\n(a) London\n(b) Paris\n(c) Berlin\n",
    "What is the largest planet in our solar system?\n(a) Mars\n(b) Jupiter\n(c) Saturn\n",
    "What is the powerhouse of the cell?\n(a) Nucleus\n(b) Ribosome\n(c) Mitochondrion\n",
    "What is the capital of Liberia \n(a) Monrovia\n(b) Ribosome\n(c) Mitochondrion\n"
]

quiz_answers = ["b", "b", "c", "a"]

# Get user name
user_name = input("Please enter your name: ")

# Initialize a variable to keep track of the user's score
score = 0

# Iterate through each question, prompt the user for input, and provide feedback
for i, question in enumerate(quiz_questions):
    user_response = input(question).lower()
    if user_response == quiz_answers[i]:
        print("Correct!\n")
        score += 1
    else:
        print("Incorrect.\n")
        score -= 1

# Display the user's final score
print(f"Quiz completed, {user_name}! Your final score is: {score} out of {len(quiz_questions)}")

# Create a dictionary to store the user's name and score
user_data = {
    "name": user_name,
    "score": score
}

# Define the file name for the JSON file
json_file_name = 'user_scores.json'

# Write the user data to a JSON file
with open(json_file_name, 'w') as file:
    json.dump(user_data, file)

print("User data has been stored in", json_file_name)