# Flutter GetX and Django Practice Project

This is a practice project that demonstrates the integration of Flutter with the GetX state management library and Django as the backend. The project aims to provide a simple example of how to build a mobile application using Flutter and GetX while utilizing Django as the server-side framework.

## Features

- User authentication and registration
- Fetching data from Django API
- Updating data using Django API
- State management using GetX
- Routing and navigation using GetX
- Form validation and error handling
- Responsive UI design

## Prerequisites

Before running this project, ensure that you have the following installed:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Install Dart](https://dart.dev/get-dart)
- Django: [Install Django](https://www.djangoproject.com/download/)

## Getting Started

1. Clone this repository to your local machine:

```bash
git clone https://github.com/wonderkidshihab/blog.git
```

2. Change to the project directory:

```bash
cd blog
```

3. Install the required Flutter packages:

```bash
flutter pub get
```

4. Install the required Django packages (optional if you are running the Django server separately):

```bash
pip install -r requirements.txt
```

## Configuration

### Flutter

1. Open the `lib/config/api_config.dart` file.
2. Modify the `baseUrl` variable to match your Django server URL.

### Django

1. Open the `backend/backend/settings.py` file.
2. Modify the `ALLOWED_HOSTS` variable to include the IP address or domain name of your Flutter app.

## Running the App

### Flutter

You can run the Flutter app using the following command:

```bash
flutter run
```

### Django

If you're using a separate terminal, navigate to the `backend` directory and start the Django server:

```bash
cd backend
python manage.py runserver
```

## Contributing

Contributions to this practice project are welcome. If you find any bugs or want to enhance the functionality, feel free to open an issue or submit a pull request.

## License

This practice project is licensed under the [MIT License](LICENSE). Feel free to use it for educational purposes and personal projects.

## Acknowledgments

This project was created for educational purposes and is inspired by various Flutter and Django resources available online. Special thanks to the Flutter and Django communities for their contributions and support.

Happy coding!
