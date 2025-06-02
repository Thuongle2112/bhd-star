import '../models/movie/movie_model.dart';

final List<String> bannerImages = [
  'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/502989655_1187705363151204_9031003673279290291_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeH_PO6_8kvx_RuYrKXj7h-DxozGi62D0I_GjMaLrYPQj2wAdEASX4x1VrYg2_NJBzB-eCKczuApVfcGwAEpGIY1&_nc_ohc=FL5dqoXM8UAQ7kNvwF5Tjot&_nc_oc=AdnwbcdtVH0HrCMwTr9SseCoOxEiO5C1H8VBZhskTPEilEMKWzeFflAIb43kmXGCwMw7C0ZkdTDGnahTFsjUvL_c&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=2osf4u2RS-1upre2QNNJlg&oh=00_AfLxw5Z8yCm2DXxXFJ28S0Mm_zaCcvzRYknk1qSFd-P9nQ&oe=684271CE',
  'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/501052866_1187532099835197_279513795857253723_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEuRmL4uDCFxgl33988Cd3SaqkIu7XvJgdqqQi7te8mB0GksQ4_LwCkwTUKIfEs1lhfpXrGe8pDHJVHrokHAKQg&_nc_ohc=xt2TYOXIqykQ7kNvwEmapsZ&_nc_oc=AdnaoKonkqMcQThVMcFTGmkz_YblMPr8fUhhZ1oiuiNWn_N3MurMzefHhhSn9JkkGEjX-GFnHx91SKokbzCUS2xX&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=zyeXwz_VtLXRLhqM54GTdQ&oh=00_AfIV-xwqQEwnLX6VpzSdoEeUaU2aQY2fwNA4sWj5JGFe2w&oe=6842749D',
  'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/500647758_1186935769894830_30956404866697322_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeH_l2GztDL2SGpzsepYxL0fOyuycL-E4hw7K7Jwv4TiHFzjnZhxoupimCAU6c353w28od8PUqdU4mUmG2HW1ePN&_nc_ohc=KeemqcWdhCMQ7kNvwHP7o0G&_nc_oc=AdnpWtwA4YHlB6RdvI5dTh1RWvWxbbuPZ9Iyxywos22KkiJvU4L9uf4JHpP1gV5ufxQBQb5GwBKiBbIGTn4xHidz&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=kWOzlhIYMteoLr5cwWM00w&oh=00_AfI1JP90Zk_m-joyGFF5QJnalobNzR9pw_QnGCJ4A38hDw&oe=684276EF',
  'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/501060879_1186934836561590_6712618219918916810_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHmAYdym-sqDL-wrsupqF00bCTX19xHqElsJNfX3EeoSY24cOi_1spL_QGCacTbSO0D_na76k4cGAv-6nXO2DUF&_nc_ohc=r4qau8rFCMUQ7kNvwHMajgw&_nc_oc=Adm-Wc5ltO_vDkMDjLW5tx6feLubigFFFhGVFnwYi0jBjTm33hZgfWT_V7W6imCjtQWNj_xZ98AjDa3ZDFLT1JTh&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=2S__JBzRNy97cbKR7xADnw&oh=00_AfKjKObxt93czr5AuTaIK8NeuBKie9Dz4MomTkjh5rtkgw&oe=6842608A',
  'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/500893464_1186813566573717_6492332176163379647_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFZ36lCmnEmXNltET_8b0P67_X-Iz-e6ufv9f4jP57q58sIWhpf-RmNgws2-33DISE1EhdxJ0a_2DemX-xMqKGS&_nc_ohc=AnqJ-Is7wcgQ7kNvwGflebY&_nc_oc=AdnYabA9PTOa7MrVP1ZYNZjRw8n2tvvRaZo-isX7ceCIXDnwdY5YQ3AimZRB53QF038zyj1LVQGetTffzwJZrAgC&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=4VW1-SdHfQ9l7Rvta3k3DA&oh=00_AfLii5TfK3QCVZkXaEbFa1NcNZxo9Ql8QKsy2tcghj3Jlw&oe=684250BF',
];

final List<Movie> movies = [
  Movie(
    id: '1',
    title: 'DORAEMON: NOBITA\'S ART WORLD TALES',
    genre: ['Hoạt Hình', 'Phiêu Lưu'],
    duration: '105 phút',
    ageRating: '0+',
    releaseDate: DateTime(2024, 5, 23),
    language: 'Tiếng Nhật - Phụ đề Tiếng Việt',
    format: ['2D'],
    description:
        'Doraemon: Nobita Và Thế Giới Tranh Của Thiên Tài là câu chuyện khi Doraemon, Nobita và các bạn phiêu lưu vào thế giới tranh vẽ để cứu một cậu bé.',
    posterUrl:
        'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/501452035_1119493646888322_122760771760040073_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeFPf9Jdmafb2xwWm5nR05sjzgkmU6cOgpPOCSZTpw6Ck7a0eQVWa24SHwJVZl4dmlJU-nyRNxbhZLN55zbtngB7&_nc_ohc=LxbJE3ObW4wQ7kNvwHqIYcf&_nc_oc=AdmjaHHuNrVp_K-Bh5I28c0IYZr_v2NSDiNlD5hwiKkv43r0zn4mINRVuN_8qR9lZib4xG2dRDLfXR-wF-F870V-&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=AV8kwxcCbw04NNnbugCmog&oh=00_AfLEBrt2-OCikxDfBKZulJhfn66JfjnIBMhnHL5UMOrDEw&oe=68434736',
    bannerUrl:
        'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/501452035_1119493646888322_122760771760040073_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeFPf9Jdmafb2xwWm5nR05sjzgkmU6cOgpPOCSZTpw6Ck7a0eQVWa24SHwJVZl4dmlJU-nyRNxbhZLN55zbtngB7&_nc_ohc=LxbJE3ObW4wQ7kNvwHqIYcf&_nc_oc=AdmjaHHuNrVp_K-Bh5I28c0IYZr_v2NSDiNlD5hwiKkv43r0zn4mINRVuN_8qR9lZib4xG2dRDLfXR-wF-F870V-&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=AV8kwxcCbw04NNnbugCmog&oh=00_AfLEBrt2-OCikxDfBKZulJhfn66JfjnIBMhnHL5UMOrDEw&oe=68434736',
    director: 'Yasuichiro Yamamoto',
    cast: ['Wasabi Mizuta', 'Megumi Ohara', 'Yumi Kakazu'],
    trailerUrl: 'https://www.youtube.com/watch?v=RU_G9XXmLc4',
    isNowShowing: true,
  ),
  Movie(
    id: '2',
    title: 'SÁT THỦ TRONG BÓNG TỐI',
    genre: ['Hành Động', 'Tội Phạm'],
    duration: '102 phút',
    ageRating: '18+',
    releaseDate: DateTime(2024, 5, 10),
    language: 'Tiếng Anh - Phụ đề Tiếng Việt',
    format: ['2D', 'IMAX'],
    description:
        'Một sát thủ chuyên nghiệp phải đối mặt với quá khứ của mình khi anh ta bị cuốn vào một âm mưu quốc tế.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/502701641_1119492260221794_8604527136793767872_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeHZjbm0aqV2WdrSU55vsWvYhi5vCes1SOeGLm8J6zVI518mPCNVriBDTtlyOYUz0iS2zr9R3_4k0ilegDzBgfFh&_nc_ohc=unOhADjzwX8Q7kNvwGmEwqH&_nc_oc=AdlMRRnBZyUKDbnf4fL4HO7aLibRUNJM9LUWZYYayNWMrfTScIZXBAwlkdXhDgQqjMbpRwAsbNVEEIDP2Vvh6Tyz&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=krkxdQZy4PJNBy8W1OZzGg&oh=00_AfJDLVaTl5unca9qlskNA0kUu2WklJuMxHkIS5RFT8YWHA&oe=68431F6D',
    director: 'Michael Johnson',
    cast: ['Tom Hardy', 'Idris Elba', 'Charlize Theron'],
    isNowShowing: true,
  ),
  Movie(
    id: '3',
    title: 'NHIỆM VỤ BẤT KHẢ THI',
    genre: ['Hành Động', 'Điệp Viên'],
    duration: '120 phút',
    ageRating: '16+',
    releaseDate: DateTime(2024, 5, 15),
    language: 'Tiếng Anh - Phụ đề Tiếng Việt',
    format: ['2D', 'IMAX', '4DX'],
    description:
        'Ethan Hunt trở lại với nhiệm vụ nguy hiểm nhất từ trước đến nay để ngăn chặn một vũ khí có thể hủy diệt thế giới.',
    posterUrl:
        'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/501334231_1119447343559619_992550342020098612_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEcDR8xcFhhUTUDRRKKQ9fZzIZgBFC19WXMhmAEULX1ZVfo5ox9jyNy3w3iZ397Rlm28GElEbvpHbUsPLy5D4zI&_nc_ohc=5Lo48YM-qeMQ7kNvwGgqJZy&_nc_oc=Adn-aRPukpOeopAmf5NxE4eU7LtlRkjgHTS6WPn4zS0W4MHcCuEBA5J_0_mTO_82T2KY3a9M3FJ3W2WNOiiCWqxy&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=luvMeVOw9koajk-rCZcMEQ&oh=00_AfJWHxuxkrnJph2NrLPLZpDnYJycrLLjX3tJt0DcvNolZg&oe=68434597',
    director: 'Christopher McQuarrie',
    cast: ['Tom Cruise', 'Rebecca Ferguson', 'Simon Pegg'],
    trailerUrl: 'https://www.youtube.com/watch?v=avz06PDqDbM',
    isNowShowing: true,
  ),
  Movie(
    id: '4',
    title: 'DORAEMON: NOBITA\'S ART WORLD TALES',
    genre: ['Hoạt Hình', 'Phiêu Lưu'],
    duration: '105 phút',
    ageRating: '0+',
    releaseDate: DateTime(2024, 5, 23),
    language: 'Tiếng Nhật - Phụ đề Tiếng Việt',
    format: ['2D'],
    description:
        'Doraemon: Nobita Và Thế Giới Tranh Của Thiên Tài là câu chuyện khi Doraemon, Nobita và các bạn phiêu lưu vào thế giới tranh vẽ để cứu một cậu bé.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/502989655_1187705363151204_9031003673279290291_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeH_PO6_8kvx_RuYrKXj7h-DxozGi62D0I_GjMaLrYPQj2wAdEASX4x1VrYg2_NJBzB-eCKczuApVfcGwAEpGIY1&_nc_ohc=FL5dqoXM8UAQ7kNvwF5Tjot&_nc_oc=AdnwbcdtVH0HrCMwTr9SseCoOxEiO5C1H8VBZhskTPEilEMKWzeFflAIb43kmXGCwMw7C0ZkdTDGnahTFsjUvL_c&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=2osf4u2RS-1upre2QNNJlg&oh=00_AfLxw5Z8yCm2DXxXFJ28S0Mm_zaCcvzRYknk1qSFd-P9nQ&oe=684271CE',
    bannerUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/502989655_1187705363151204_9031003673279290291_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeH_PO6_8kvx_RuYrKXj7h-DxozGi62D0I_GjMaLrYPQj2wAdEASX4x1VrYg2_NJBzB-eCKczuApVfcGwAEpGIY1&_nc_ohc=FL5dqoXM8UAQ7kNvwF5Tjot&_nc_oc=AdnwbcdtVH0HrCMwTr9SseCoOxEiO5C1H8VBZhskTPEilEMKWzeFflAIb43kmXGCwMw7C0ZkdTDGnahTFsjUvL_c&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=2osf4u2RS-1upre2QNNJlg&oh=00_AfLxw5Z8yCm2DXxXFJ28S0Mm_zaCcvzRYknk1qSFd-P9nQ&oe=684271CE',
    director: 'Yasuichiro Yamamoto',
    cast: ['Wasabi Mizuta', 'Megumi Ohara', 'Yumi Kakazu'],
    trailerUrl: 'https://www.youtube.com/watch?v=RU_G9XXmLc4',
    isNowShowing: true,
  ),
  Movie(
    id: '5',
    title: 'SÁT THỦ TRONG BÓNG TỐI',
    genre: ['Hành Động', 'Tội Phạm'],
    duration: '102 phút',
    ageRating: '18+',
    releaseDate: DateTime(2024, 5, 10),
    language: 'Tiếng Anh - Phụ đề Tiếng Việt',
    format: ['2D', 'IMAX'],
    description:
        'Một sát thủ chuyên nghiệp phải đối mặt với quá khứ của mình khi anh ta bị cuốn vào một âm mưu quốc tế.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/500231167_1116314623872891_6251865445158772619_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHLsehuSJcpJ1eUdY1RF02APoRvaCKtEGc-hG9oIq0QZ_mZwz7vJx3amsRmQDp79KdBJJyRML1MiUTlIZj3D1fU&_nc_ohc=rNE4vdX2NIYQ7kNvwEBfuuz&_nc_oc=AdmWFzt3HuowczbV3-V5k39YkJT8iX5fV9BaxUINkAUz90LnhO66xQhMMFAYrLs3iXy0heQuGJXgzFdk3vfYZTKf&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=gazYRT-3fdVCwwIB0waedA&oh=00_AfJsPh8T0SmSN4T0ZU8xr8DqzcADL0-P01ykLfDvjyKqLQ&oe=68431CA3',
    director: 'Michael Johnson',
    cast: ['Tom Hardy', 'Idris Elba', 'Charlize Theron'],
    isNowShowing: true,
  ),
  Movie(
    id: '6',
    title: 'NHIỆM VỤ BẤT KHẢ THI',
    genre: ['Hành Động', 'Điệp Viên'],
    duration: '120 phút',
    ageRating: '16+',
    releaseDate: DateTime(2024, 5, 15),
    language: 'Tiếng Anh - Phụ đề Tiếng Việt',
    format: ['2D', 'IMAX', '4DX'],
    description:
        'Ethan Hunt trở lại với nhiệm vụ nguy hiểm nhất từ trước đến nay để ngăn chặn một vũ khí có thể hủy diệt thế giới.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/500414012_1116337940537226_2605465916569949982_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFkDcI1wj0RgZmkJaQQ0z8wu8-lCNdGpiG7z6UI10amIaACcM4LZjT-ptWFMlPkwaXeTkWQZDtfecAdDew6ODzw&_nc_ohc=x3rLktq9RL4Q7kNvwE2FsNn&_nc_oc=Adn7X3ZtQmFxPz0IpvNg1C12TecaqjHuwc4J_tfHPEV3ILVbFqmXDIsoKJ4PQib62UE8k1Ou_DK2ciXy3GxcNdOJ&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=h3HDjCDb_pFlU2_qRJamKg&oh=00_AfK1lRnmCvkrT_OySjkJ2e1wqrv6FvqMQhJjp_BGRgHuxw&oe=68432DF7',
    director: 'Christopher McQuarrie',
    cast: ['Tom Cruise', 'Rebecca Ferguson', 'Simon Pegg'],
    trailerUrl: 'https://www.youtube.com/watch?v=avz06PDqDbM',
    isNowShowing: true,
  ),
  Movie(
    id: '7',
    title: 'DORAEMON: NOBITA\'S ART WORLD TALES',
    genre: ['Hoạt Hình', 'Phiêu Lưu'],
    duration: '105 phút',
    ageRating: '0+',
    releaseDate: DateTime(2024, 5, 23),
    language: 'Tiếng Nhật - Phụ đề Tiếng Việt',
    format: ['2D'],
    description:
        'Doraemon: Nobita Và Thế Giới Tranh Của Thiên Tài là câu chuyện khi Doraemon, Nobita và các bạn phiêu lưu vào thế giới tranh vẽ để cứu một cậu bé.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/502989655_1187705363151204_9031003673279290291_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeH_PO6_8kvx_RuYrKXj7h-DxozGi62D0I_GjMaLrYPQj2wAdEASX4x1VrYg2_NJBzB-eCKczuApVfcGwAEpGIY1&_nc_ohc=FL5dqoXM8UAQ7kNvwF5Tjot&_nc_oc=AdnwbcdtVH0HrCMwTr9SseCoOxEiO5C1H8VBZhskTPEilEMKWzeFflAIb43kmXGCwMw7C0ZkdTDGnahTFsjUvL_c&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=2osf4u2RS-1upre2QNNJlg&oh=00_AfLxw5Z8yCm2DXxXFJ28S0Mm_zaCcvzRYknk1qSFd-P9nQ&oe=684271CE',
    bannerUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/502989655_1187705363151204_9031003673279290291_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeH_PO6_8kvx_RuYrKXj7h-DxozGi62D0I_GjMaLrYPQj2wAdEASX4x1VrYg2_NJBzB-eCKczuApVfcGwAEpGIY1&_nc_ohc=FL5dqoXM8UAQ7kNvwF5Tjot&_nc_oc=AdnwbcdtVH0HrCMwTr9SseCoOxEiO5C1H8VBZhskTPEilEMKWzeFflAIb43kmXGCwMw7C0ZkdTDGnahTFsjUvL_c&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=2osf4u2RS-1upre2QNNJlg&oh=00_AfLxw5Z8yCm2DXxXFJ28S0Mm_zaCcvzRYknk1qSFd-P9nQ&oe=684271CE',
    director: 'Yasuichiro Yamamoto',
    cast: ['Wasabi Mizuta', 'Megumi Ohara', 'Yumi Kakazu'],
    trailerUrl: 'https://www.youtube.com/watch?v=RU_G9XXmLc4',
    isNowShowing: true,
  ),
  Movie(
    id: '8',
    title: 'SÁT THỦ TRONG BÓNG TỐI',
    genre: ['Hành Động', 'Tội Phạm'],
    duration: '102 phút',
    ageRating: '18+',
    releaseDate: DateTime(2024, 5, 10),
    language: 'Tiếng Anh - Phụ đề Tiếng Việt',
    format: ['2D', 'IMAX'],
    description:
        'Một sát thủ chuyên nghiệp phải đối mặt với quá khứ của mình khi anh ta bị cuốn vào một âm mưu quốc tế.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/497729940_1108956257942061_6363117028717960846_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeF7vR-gkaOJjcM_U9jmbdZcCcoUMWjRvQEJyhQxaNG9ASIOZ99ni6r3Eyc1EbtyX--iqH7KSMmGMOgvQSaf25z4&_nc_ohc=JeOuYhbPz-wQ7kNvwFkwvIV&_nc_oc=AdmR3LA_W_a8yJJNnEu-tgWzo6rVdgCB9IdAnquW28k2bAlCXXoZcmozKzFPrH09-3f3tNeIChud-1z1KeafczCT&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=Bca4XjAQmtQizPodftdXwQ&oh=00_AfK30xrNSRp1vk_42mVeRjCnXgAwiQ0TRxRMItODNX-U0A&oe=68432F45',
    director: 'Michael Johnson',
    cast: ['Tom Hardy', 'Idris Elba', 'Charlize Theron'],
    isNowShowing: true,
  ),
  Movie(
    id: '10',
    title: 'DEADPOOL & WOLVERINE',
    genre: ['Hành Động', 'Siêu Anh Hùng', 'Hài'],
    duration: '122 phút',
    ageRating: '18+',
    releaseDate: DateTime(2024, 6, 26),
    language: 'Tiếng Anh - Phụ đề Tiếng Việt',
    format: ['2D', 'IMAX', '4DX'],
    description:
        'Wade Wilson đang làm việc chăm chỉ tại một trạm dừng chân khi một nhóm đặc nhiệm tinh nhuệ lôi anh ta vào một nhiệm vụ mới.',
    posterUrl:
        'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/497729940_1108956257942061_6363117028717960846_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeF7vR-gkaOJjcM_U9jmbdZcCcoUMWjRvQEJyhQxaNG9ASIOZ99ni6r3Eyc1EbtyX--iqH7KSMmGMOgvQSaf25z4&_nc_ohc=JeOuYhbPz-wQ7kNvwFkwvIV&_nc_oc=AdmR3LA_W_a8yJJNnEu-tgWzo6rVdgCB9IdAnquW28k2bAlCXXoZcmozKzFPrH09-3f3tNeIChud-1z1KeafczCT&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=Bca4XjAQmtQizPodftdXwQ&oh=00_AfK30xrNSRp1vk_42mVeRjCnXgAwiQ0TRxRMItODNX-U0A&oe=68432F45',
    director: 'Shawn Levy',
    cast: ['Ryan Reynolds', 'Hugh Jackman', 'Emma Corrin'],
    isNowShowing: false,
  ),
  Movie(
    id: '11',
    title: 'KẺ ĂN HỒN',
    genre: ['Kinh Dị', 'Tâm Lý'],
    duration: '95 phút',
    ageRating: '18+',
    releaseDate: DateTime(2024, 6, 15),
    language: 'Tiếng Việt',
    format: ['2D'],
    description:
        'Phim kinh dị Việt Nam về những linh hồn bị nguyền rủa và người săn ma cố gắng giải cứu họ.',
    posterUrl:
        'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/499909691_1111714667666220_5263535657530052335_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeHccaWmHOpC5Sl_aKVYulDhpzEpxT42PnKnMSnFPjY-cqWZOj1gw4zhr5jAhMXTuAb7pOECZj9q2B6Mhj_fFK6E&_nc_ohc=RgIMHYXXYWQQ7kNvwGGALXX&_nc_oc=AdnhhOyTt0twbAFnfY-1HeJElrhEhz2Z9HRuXtRf_kE_uZTehMw0GksQ4gbf9ehSLaHgJJykh1HL9Zs2Sxb917Dt&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=aEEm9__xXffTj50iEsMx2A&oh=00_AfIebEVlUlELkF6YXIP8yp537FPqiLEdzxZUQJo9r0lBpA&oe=68431982',
    director: 'Trần Hữu Tấn',
    cast: ['Quang Tuấn', 'NSƯT Chiều Xuân', 'Võ Điền Gia Huy'],
    isNowShowing: false,
  ),
];
