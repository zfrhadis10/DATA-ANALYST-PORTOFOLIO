'''
=================================================

Nama  : Zafirah Aida Adista

=================================================
'''

# dictionary untuk menyimpan keranjang
keranjang = []

def menambah_barang():
    '''
    fungsi ini digunakan untuk menambah barang ke keranjang. 
    user dapat mengetikkan nama dan harga barang yang akan dibeli
    '''
    nama = input ('nama_barang: ') # menyediakan input barang bagi user untuk memasukkan barang yang akan ditambahkan
    harga = input ('harga_barang: ') # menyediakan input harga barang bagi user untuk memasukkan harga barang yang akan ditambahkan
    if harga.isdigit():
        harga = int(harga) # memastikan user menginput harga dengan angka
        barang = {'nama': nama, 'harga': harga} # menyimpan data barang dalam list keranjang
        keranjang.append(barang) # menambahkan barang yang diinput oleh user ke dalam list keranjang
        print(f'Berhasil menambahkan {nama} ke dalam keranjang')
    else:
        print('ERROR. Harga tidak valid. Barang gagal ditambahkan') # ketika user meenginput bukan angka pada harga

def menghapus_barang():
    '''
    fungsi ini digunakan untuk menghapus item barang dari keranjang berdasarkan
    nama barang yang diinput oleh user.
    '''
    hapus_barang = input('masukkan barang yang ingin dihapus: ')
    found = False # untuk memulai pencarian barang
    for item in keranjang: # melakukan looping untuk mencari barang di dalam list keranjang
        if item ['nama'].lower() == hapus_barang.lower(): # menjadikan case-insensitive
            keranjang.remove(item)
            print(f'{hapus_barang} Berhasil dihapus')
            return # keluar dari loop jika barang sudah ditemukan dan dihapus
    
    if not found: # ketika barang tidak ditemukan di list
        print(f'{hapus_barang} Tidak Ditemukan di Keranjang')

    if not keranjang: # ketika tidak ada barang apapun di keranjang (kosong)
        print('Keranjang Kosong')
        

def tampilkan_barang():
    '''
    fungsi ini digunakan untuk menampilkan seluruh daftar barang
    yang telah dimasukkan ke dalam keranjang.
    barang akan ditampilkan dengan nomor urut, nama barang, dan harga.
    nomor urut sesuai dengan urutan penambahanan barang ke dalam keranjang.
    '''
    print('\n --- Keranjang Anda ---') # judul keranjang
    if not keranjang:
        print('Keranjang anda kosong') # ketika tidak ada barang apapun di keranjang (kosong) 
    else:
        for i, item in enumerate(keranjang,1): # memulai dari angka 1
            print(f'{i}. {item["nama"]} - Rp{item["harga"]}') # menampilkan nomor urut, nama barang, dan harga

def lihat_total():
    '''
    fungsi ini digunakan untuk menghitung total uang yang harus dibayar. 
    total uang dihitung dengan menjumlahkan semua harga barang yang ada di dalam keranjang.
    '''
    total_harga = sum(item['harga'] for item in keranjang)
    print(f'\n Total belanja anda: Rp{total_harga}')


def menu():
    '''
    fungsi ini digunakan untuk menampilkan interface menu yang berisikan menu fitur.
    user dapat menginput nomor menu sesuai dengan fitur yang ingin dijalankan.
    program akan terus berjalan hingga user memilih exit.
    '''
    # menampilkan greeting di awal program
    print('===========================================')
    print('         Selamat Datang di Toko Jaya       ')
    print('             Selamat Berbelanja            ')
    print('===========================================')

    # melakukam looping agar user bisa terus berinteraksi dengan program
    while True:
        # menampilkan pilihan menu interaktif kepada user
        print('''
Menu:
1. Menambah Barang
2. Hapus Barang
3. Tampilkan Barang di Keranjang
4. Lihat Total Belanja
5. Exit
''') 
        pilihan = input('Pilihan: ') # menyediakan input menu yang dapat dipilih user

        if pilihan == '1':
            menambah_barang()
        elif pilihan == '2':
            menghapus_barang()
        elif pilihan == '3':
            tampilkan_barang()
        elif pilihan == '4':
            lihat_total()
        elif pilihan == '5':
            print('Sampai Jumpa! Terima kasih sudah belanja di Toko Jaya.') # salam perpisahan untuk user di akhir program
            break # menghentikan loop
        else:
            print('ERROR. Silakan ketikkan nomor 1-5.') # ketika user mengetikkan selain angka 1-5

# running program
if __name__ == '__main__':
    menu()