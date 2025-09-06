# tugaspm-statelesswidget
To Do List 

# Flutter To-Do App

## Deskripsi Aplikasi
Aplikasi ini adalah aplikasi **daftar tugas (To-Do List)** sederhana menggunakan **Flutter**.  
Pengguna bisa:
- Menambah tugas baru  
- Memberi tanda (centang) jika tugas sudah selesai  
- Menghapus tugas  
- Melihat detail tugas di halaman khusus  

Struktur folder aplikasi:
lib/
│
├── models/
│ └── todo.dart # Model data tugas (id, title, isCompleted)
│
├── providers/
│ └── todo_provider.dart # Provider untuk mengatur data tugas
│
├── screens/
│ └── task_detail.dart # Halaman detail untuk melihat 1 tugas
│
├── widgets/
│ ├── task_form_dialogue.dart # Form dialog untuk menambah tugas
│ └── todo_card.dart # Tampilan tiap tugas dalam bentuk card
│
└── main.dart # Titik masuk utama aplikasi

---

## Diagram Widget Tree
MyApp
└── MaterialApp
└── HomeScreen (Scaffold)
├── AppBar (judul aplikasi)
├── FloatingActionButton (+ tambah tugas)
│ └── TaskFormDialogue (form input tugas)
└── ListView.builder (daftar tugas)
└── TodoCard (setiap item tugas)
└── [onTap] → TaskDetailScreen (halaman detail)

---

## Pendekatan State Management
Aplikasi ini menggunakan **Provider dengan ChangeNotifier**.

**Alasan dipilih:**
- Sederhana dan cocok untuk aplikasi kecil–menengah.  
- Membuat tampilan jadi **reaktif** → setiap kali data berubah, UI ikut berubah otomatis.  
- Memisahkan logika data dari tampilan, sehingga kode lebih rapi dan mudah dirawat.  

**Cara kerja singkat:**
1. User menambah / menghapus / mencentang tugas lewat UI.  
2. Widget memanggil fungsi di `TodoProvider`.  
3. `TodoProvider` mengubah data lalu menjalankan `notifyListeners()`.  
4. Widget yang berhubungan dengan data (`TodoCard`, `ListView`) otomatis update tampilannya.

## Demo
<img width="1919" height="1130" alt="Screenshot 2025-09-06 075452" src="https://github.com/user-attachments/assets/478dc15c-034c-40bd-8710-f035594335af" />
<img width="1919" height="1022" alt="Screenshot 2025-09-06 075545" src="https://github.com/user-attachments/assets/756f02b6-87aa-4f74-b2d2-1699b87aa910" />
<img width="1918" height="1025" alt="Screenshot 2025-09-06 075600" src="https://github.com/user-attachments/assets/acd80fa3-3a67-4326-9084-4d5eb8067d63" />
<img width="1919" height="1033" alt="Screenshot 2025-09-06 075615" src="https://github.com/user-attachments/assets/07880ac2-75b5-452b-9e64-d9d19d7816c8" />
<img width="1919" height="1025" alt="Screenshot 2025-09-06 075630" src="https://github.com/user-attachments/assets/a2b37b68-ee74-4b98-bccd-b4a49c8c3af6" />


