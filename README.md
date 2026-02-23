# rails-inertia-postgresql-vue-template

1. Clone the repository.

2. Install dependencies:
```bash
bundle install
npm install
```

3. Edit `master.key` credentials:
```bash
EDITOR="nano" bin/rails credentials:edit
# or
bin/rails credentials:edit
```


4. Run the container:
```bash
docker compose up --build
```

5. Run database migrations:
```bash
docker compose exec app bin/rails db:migrate
```

6. Open the application in your browser:
```
http://localhost:3000
```

7. To stop the container:
```bash
docker compose down
```