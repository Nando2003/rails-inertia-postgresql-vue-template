# rails-inertia-postgresql-vue-template

1. Clone the repository.

2. Install dependencies:
```bash
bundle install
npm install
```

3. Copy the example environment file and set your own credentials:
```bash
cp .env.example .env
```

4. Edit `master.key` credentials:
```bash
EDITOR="nano" bin/rails credentials:edit
# or
bin/rails credentials:edit
```

5. Run the container:
```bash
docker compose up --build
```

6. Run database migrations:
```bash
docker compose exec app bin/rails db:migrate
```

7. Open the application in your browser:
```
http://localhost:3000
```

8. To stop the container:
```bash
docker compose down
```

## To run in production mode:

1. Build the production image:
```bash
docker compose -f docker-compose.prod.yml build
```

2. Run the production container:
```bash
docker compose -f docker-compose.prod.yml up
```