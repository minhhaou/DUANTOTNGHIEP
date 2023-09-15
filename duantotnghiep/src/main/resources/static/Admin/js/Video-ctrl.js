var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("Video-ctrl", function ($scope, $http, $window) {
    $scope.itemsVideoWithTen = []; // Mảng mới chứa tên video và dữ liệu video ban đầu
    $scope.itemsVideo = [];
    $scope.formTaiLieu = {};

    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];
    $scope.itemsNguoiDung = [];

    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    const accountTokenInput = document.getElementById("accessToken");
    const authorizationTokenGroup = document.getElementById('authorizationTokenGroup');
    const accessTokenGroup = document.getElementById('accessTokenGroup');
    const titleGroup = document.getElementById('form-title');
    const privacyStatusGroup = document.getElementById('form-privacyStatus');
    const descriptionGroup = document.getElementById('form-description');
    const fileGroup = document.getElementById('form-file');

    $scope.initialize = function () {
        // load tài liệu
        $http.get("/rest/Videos").then(resp => {
            $scope.itemsVideo = resp.data;
            console.log($scope.itemsVideo);

            // Lặp qua danh sách các video và gọi hàm getYouTubeVideoTitle để lấy tên video
            for (let i = 0; i < $scope.itemsVideo.length; i++) {
                const video = $scope.itemsVideo[i];
                const url = 'v=' + video.linkVideo;
                if (url.includes('v=')) {
                    // Tách chuỗi sau 'v=' để lấy mã video
                    const videoId = url.split('v=')[1].split('&')[0];

                    // Xây dựng URL API YouTube Data
                    const apiUrl = `https://www.googleapis.com/youtube/v3/videos?id=${videoId}&part=snippet&key=AIzaSyB62JPnQ_NP6xp7pbf5WDb4kVJcP1yMT08`;

                    // Gửi yêu cầu AJAX (cần sử dụng API key của bạn)
                    // Hoặc bạn có thể sử dụng thư viện AJAX như Axios hoặc Fetch API.
                    // Sau đó, bạn có thể trích xuất tên video từ dữ liệu phản hồi.
                    // Ví dụ sử dụng Fetch API:
                    fetch(apiUrl)
                        .then(response => response.json())
                        .then(data => {
                            const videoTitle = data.items[0].snippet.title;
                            $scope.itemsVideoWithTen.push({
                                videoData: video,
                                videoTitle: videoTitle // Tên video từ API YouTube
                            });
                            console.log($scope.itemsVideoWithTen);
                        })
                        .catch(error => {
                            console.error('Lỗi khi lấy thông tin video: ' + error);
                        });
                } else {
                    console.error('Không tìm thấy mã video trong URL.');
                }
            }
        }).catch(error => {
            console.error("An error occurred:", error);
        });

        $http.get("/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
        });
    };

    $scope.loadDocuments = function () {
        if ($scope.selectedCourse) {
            $http.get("/rest/Videos/" + $scope.selectedCourse).then(resp => {
                $scope.itemsCauHoi = resp.data;
                $scope.totalItems = $scope.itemsCauHoi.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        } else {
            $http.get("/rest/Videos").then(resp => {
                $scope.itemsCauHoi = resp.data;
                $scope.totalItems = $scope.itemsCauHoi.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        }
    };

    console.log($scope.itemsVideoWithTen);
    console.log($scope.itemsVideo);


    $scope.updateUI = function () {
        if (accountTokenInput===null || accountTokenInput.value === ''||accountTokenInput.value === null) {
            // Hiển thị các input khi accountToken không tồn tại hoặc trống
            authorizationTokenGroup.style.display = 'block';
            accessTokenGroup.style.display = 'block';
            titleGroup.style.display = 'none';
            privacyStatusGroup.style.display = 'none';
            descriptionGroup.style.display = 'none';
            fileGroup.style.display = 'none';
        } else {
            // Ẩn các input khi accountToken có giá trị
            authorizationTokenGroup.style.display = 'none';
            accessTokenGroup.style.display = 'none';
            titleGroup.style.display = 'block';
            privacyStatusGroup.style.display = 'block';
            descriptionGroup.style.display = 'block';
            fileGroup.style.display = 'block';
        }
    }

    $scope.updateUI();
    $scope.initialize();
});