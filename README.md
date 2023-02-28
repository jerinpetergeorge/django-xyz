Personal version of [wsvincent/djangox](https://github.com/wsvincent/djangox)

## Installation

### Using virtualenv
1. Create virtual environment (recommended `Python 3.10`) and activate it.
2. Create en env file: `cp .envs/example.env .envs/.env`
3. Install dependencies: `pip install -r requirements/dev.txt -U`
4. Migrate the database: `python manage.py migrate`
5. Create superuser: `python manage.py createsuperuser`
6. Run the server: `python manage.py runserver`

### Using docker-compose
1. Make sure you have `docker` and `docker-compose` installed.
2. Create en env file: `cp .envs/example.env .envs/.env`
3. Build the images - `docker-compose build`
4. Run the containers - `docker-compose up`
