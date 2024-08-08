<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSV Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .upload-card {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .upload-icon {
            font-size: 50px;
            color: #007bff;
            margin-bottom: 15px;
        }

        .upload-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .upload-text {
            font-size: 14px;
            color: #6c757d;
            margin-bottom: 20px;
        }

        .upload-btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
        }

        .file-input {
            display: none;
        }

        .file-label {
            display: block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .file-label:hover {
            background-color: #0056b3;
        }

        .file-name {
            font-size: 14px;
            color: #28a745;
            margin-top: 10px;
        }
    </style>
</head>

<%@ include file="../component/nav.jsp" %>

<body>
<div class="upload-card bg-light">
    <div class="upload-icon">
        <i class="fas fa-cloud-upload-alt"></i>
    </div>
    <div class="upload-title">
        Upload Your CSV File
    </div>
    <div class="upload-text">
        Choose a CSV file to upload.
    </div>
    <label for="file-upload" class="file-label">
        <i class="fas fa-folder-open"></i> Choose File
    </label>
    <input type="file" id="file-upload" class="file-input" accept=".csv">
    <div id="file-name" class="file-name"></div>
    <button class="btn btn-primary upload-btn mt-3" id="upload-button">
        <i class="fas fa-upload"></i> Upload
    </button>
    <div id="outputContent" class="output-content"></div>
</div>

<!-- JavaScript to handle file upload -->
<script>
    document.getElementById('file-upload').addEventListener('change', function () {
        document.getElementById('file-name').textContent = this.files[0].name;
    });

    document.getElementById('upload-button').addEventListener('click', function () {
        const fileInput = document.getElementById('file-upload');
        if (fileInput.files.length === 0) {
            alert("Please choose a file before uploading.");
            return;
        }

        const formData = new FormData();
        formData.append('file', fileInput.files[0]);

        fetch('http://localhost:8080/api/admin/upload', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                alert("File uploaded successfully!");
                document.getElementById('outputContent').textContent = data;
            })
            .catch(error => {
                console.error('Error:', error);
                alert("File upload failed!");
            });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>