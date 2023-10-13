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
    openDays: 'Monday - Saturday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25.000',
    imageAsset: 'assets/image/farm-house-lembang-Bandung.jpg',
  ),
  TourismPlace(
    name: 'Observatorium Bosscha',
    location: 'Lembang',
    openDays: 'Tuesday - Saturday',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'assets/image/observatorium-bosscha.jpg',
  ),
  TourismPlace(
    name: 'Jalan Asia Afrika',
    location: 'Kota Bandung',
    openDays: 'Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp. Free',
    imageAsset: 'assets/image/jalan-asia-afrika.jpg',
  ),
];