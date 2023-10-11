class TourismPlace {
  String? name;
  String? location;
  String? openDays;
  String? openTime;
  String? ticketPrice;
  String? imageAsset;

  TourismPlace({
    required this.name,
    required this.location,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Farm House Lembang',
    location: 'Lembang',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25000',
    imageAsset: 'https://cdn.nativeindonesia.com/foto/farmhouse-lembang-bandung/farm-house-lembang-Bandung-43.jpg',
  ),
  TourismPlace(
    name: 'Observatorium Bosscha',
    location: 'Lembang',
    openDays: 'Open Tuesday - Saturday',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 20000',
    imageAsset: 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Bosscha_001.JPG',
  ),
  TourismPlace(
    name: 'Jalan Asia Afrika',
    location: 'Kota Bandung',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Free',
    imageAsset: 'https://piknikwisata.com/wp-content/uploads/2019/11/jalan-asia-afrika-e1573213030252.jpg',
  ),
];