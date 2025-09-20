# explorer-backend

Windows Explorer Project
1. Clone Repository
```bash
git clone https://github.com/elsanoviani/explorer-backend.git
cd explorer-backend
```
2. Install Dependencies

Pastikan kamu menggunakan Bun.
Install dependencies:

```bash
bun install
```

3. Environment Variables

Buat file .env berdasarkan contoh .env.example:
```bash
cp .env.example .env
```
```bash
Buka .env dan sesuaikan konfigurasi database-mu, contohnya:

DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=explorer
PORT=3000
```

Catatan: Pastikan database sudah dibuat (explorer) sebelum run backend.

4. Database Migration

Jika ada migration, jalankan:

```bash
bun run prisma migrate dev 
```

Kalau kamu langsung insert manual data di DB, step ini bisa dilewati.

5. Run Server

Jalankan server dengan:
```bash
bun run index.ts
```

Server akan berjalan di port yang sudah di-set di .env, misalnya:
```bash
http://localhost:3000
```

6. API Endpoints
```bash
GET /folders → ambil semua folder (flat)

GET /folders/nested → ambil semua folder dengan children (nested)
```