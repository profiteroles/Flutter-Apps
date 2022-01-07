import "package:get/route_manager.dart";

//Country Codes: https://www.science.co.il/international/Country-codes.php
//Translator: https://file-translate.com/en/app/json-translate

class LocalStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_AUS": {
          "account": "Account",
          "add_task": "Add Task",
          "add_to": "Add to",
          "allow": "Allow",
          "app_settings": "App Settings",
          "back": "Back,",
          "by_submission": "By submitting form you agree to our ",
          "comleted": "Completed",
          "confirm": "Confirm",
          "created": "Created",
          "dark_mode": "Dark Mode",
          "done": "Done",
          "no_bother": "Don't bother me again!",
          "email": "E-mail",
          "error_task_enter": "Enter tasks for your list",
          "error_title_required": "Title is required",
          "error_tasks_list_exist": "You already have that task!",
          "error_choose_list": "Choose a list",
          "full_name": "Full Name",
          "forgot_password": "Forgot Password ?",
          "help": "Help",
          "how_app": "How This App Work",
          "info": "Info",
          "language": "Language",
          "live_tasks": "Live Tasks",
          "login": "LOGIN",
          "my_list": "My Tasks List",
          "my_report": "My Report",
          "new_task": "New Task",
          "nope": "Nope",
          "notifications": "Notifications",
          "notification_text": "Would you like to get reminders for your task list?",
          "notification_default": "This notifications will keep you on your toes",
          "notification_schedule": "Have you completed any of your tasks lately?",
          "notification_schedule_text": "This is a little friendly reminder!",
          "off": "Off",
          "password_confirmation": "Password Confirmation",
          "personal_info": "Personal Info",
          "privacy_policy": "Privacy Policy",
          "profile": "Profile",
          "recover_text": "After submitting this form, You will be receiving an email from us.\nPlease find the email in your inbox and maybe junk box.",
          "report": "Report",
          "settings": "Settings",
          "signup": "SIGNUP",
          "siginin_with": "Or Signin with",
          "signup_with": "Or Signup with",
          "task": "Task",
          "tasks": "Tasks",
          "task_type": "Task Type",
          "terms_conditions": "Terms & Conditions",
          "title": "Title",
          "to": "to",
          "user_info": "User Information",
          "user_recover_text": "Email is sent to your email. Reset your 'Password' and sign back in",
          "total_task": "Total Task",
          "validator_8": "Well we require min 8 charactors",
          "validator_email": "This doesn't look like an E-mail",
          "validator_name": "Would be nice to get to know you",
          "validator_special": "Looks like your name is quite special",
          "validator_required": "Good try! Let's get down to business",
          "validator_password_null": "Sure it matches but ... You know how this works",
          "validator_pass_match": "Passwords kinda need match!",
          "welcome": "Welcome "
        },
        "ru_RUS": {
          "account": "Счет",
          "add_task": "Добавить задачу",
          "add_to": "добавить в",
          "app_settings": "настройки приложения",
          "complited": "выполнено",
          "confirm": "подтверждать",
          "dark_mode": "темный режим",
          "done": "Выполнено",
          "error_task_enter": "Требуется задача",
          "error_title_required": "Требуется название",
          "help": "помощь",
          "language": "язык",
          "my_list": "мой список",
          "new_task": "новое задание",
          "notifications": "уведомления",
          "personal_info": "личная информация",
          "privacy_policy": "политика конфиденциальности",
          "profile_screen": "экран профиля",
          "settings": "настройки",
          "task": "задача",
          "task_type": "тип задачи",
          "terms_conditions": "условия и положения",
          "title": "заглавие",
        },
        "de_DEU": {
          "account": "Konto",
          "add_task": "Aufgabe Hinzufügen",
          "add_to": "Ergänzen",
          "app_settings": "App Einstellungen",
          "complited": "Abgeschlossen",
          "confirm": "Bestätigen",
          "dark_mode": "Dunkelmodus",
          "done": "Fertig",
          "error_task_enter": "Geben Sie Aufgaben für Ihre Liste ein",
          "error_title_required": "Titel ist erforderlich",
          "help": "Hilfe",
          "language": "Sprache",
          "my_list": "Meine Liste",
          "new_task": "Neue Aufgabe",
          "notifications": "Benachrichtigungen",
          "personal_info": "Persönliche Informationen",
          "privacy_policy": "Datenschutz-Bestimmungen",
          "profile_screen": "Profilbildschirm",
          "settings": "Einstellungen",
          "task": "Aufgabe",
          "task_type": "Aufgabentyp",
          "terms_conditions": "Geschäftsbedingungen",
          "title": "Titel",
        },
        "fr_FRA": {
          "account": "Compte",
          "add_task": "Ajouter une tâche",
          "add_to": "Ajouter à",
          "app_settings": "Paramètres de l'application",
          "complited": "Terminé",
          "confirm": "Confirmer",
          "dark_mode": "Mode sombre",
          "done": "Terminé",
          "error_task_enter": "Entrez les tâches pour votre liste",
          "error_title_required": "Le titre est requis",
          "help": "Ajouter une tâche0",
          "language": "Ajouter une tâche1",
          "my_list": "Ajouter une tâche2",
          "new_task": "Ajouter une tâche3",
          "notifications": "Ajouter une tâche4",
          "personal_info": "Ajouter une tâche5",
          "privacy_policy": "Ajouter une tâche6",
          "profile_screen": "Ajouter une tâche7",
          "settings": "Ajouter une tâche8",
          "task": "Ajouter une tâche9",
          "task_type": "Ajouter à0",
          "terms_conditions": "Ajouter à1",
          "title": "Ajouter à2"
        },
        "es_ESP": {
          "account": "Cuenta",
          "add_task": "Agregar tarea",
          "add_to": "Agregar a",
          "app_settings": "Configuración de la aplicación",
          "complited": "Completado",
          "confirm": "Confirmar",
          "dark_mode": "Modo oscuro",
          "done": "Listo",
          "error_task_enter": "Ingresar tareas para su lista",
          "error_title_required": "Se requiere título",
          "help": "Agregar tarea0",
          "language": "Agregar tarea1",
          "my_list": "Agregar tarea2",
          "new_task": "Agregar tarea3",
          "notifications": "Agregar tarea4",
          "personal_info": "Agregar tarea5",
          "privacy_policy": "Agregar tarea6",
          "profile_screen": "Agregar tarea7",
          "settings": "Agregar tarea8",
          "task": "Agregar tarea9",
          "task_type": "Agregar a0",
          "terms_conditions": "Agregar a1",
          "title": "Agregar a2",
        }
      };
}
