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
    <div id="outputContent" class="file-name"></div>
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
        .then(response => response.json()) // Use .text() instead of .json()
        .then(data => {
            alert("File uploaded successfully!");
            document.getElementById('outputContent').textContent = data.message;
        })
        .catch(error => {
            console.error('Error:', error);
            alert("File upload failed!");
        });
    });
</script>