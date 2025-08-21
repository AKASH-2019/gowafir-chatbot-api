import json
import os
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher

class ActionGetServices(Action):

    def name(self) -> str:
        return "action_get_services"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: dict) -> list[dict]:
        
        # Construct the full path to the services.json file
        file_path = os.path.join(os.getcwd(), 'services.json')
        
        try:
            # Open and read the JSON file
            with open(file_path, 'r') as f:
                services = json.load(f)
            
            # Extract the service names
            service_names = [service['name'] for service in services]
            
            # Format the names into a single message
            message = "We offer the following services: " + ", ".join(service_names) + "."
            
            # Send the message back to the user
            dispatcher.utter_message(text=message)
            
        except FileNotFoundError:
            dispatcher.utter_message(text="Sorry, I can't find the service data right now.")
        except json.JSONDecodeError:
            dispatcher.utter_message(text="Sorry, there was an issue reading the service data.")
        
        return []