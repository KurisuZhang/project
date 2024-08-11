
<div class="container mt-5">
    <div class="form-group">
        <label for="userRole">User Role:</label>
        <select class="form-control" id="userRole"></select>
    </div>
    <div class="form-group">
        <label for="couponName">Coupon Name:</label>
        <input type="text" class="form-control" id="couponName" placeholder="Enter Coupon Name">
    </div>
    <div class="form-group">
        <label for="couponValue">Coupon Value:</label>
        <input type="text" class="form-control" id="couponValue" placeholder="Enter Coupon Value">
    </div>
    <button type="button" class="btn btn-primary" id="setCouponButton">Set Coupon</button>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Fetch the user roles from the API
            fetch('http://localhost:8080/api/user/roles')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const userRoleDropdown = document.getElementById('userRole');
                    userRoleDropdown.innerHTML = ''; // Clear existing options

                    if (data.length === 0) {
                        alert('No roles available.');
                        return;
                    }

                    data.forEach(role => {
                        const option = document.createElement('option');
                        option.value = role;
                        option.textContent = role;
                        userRoleDropdown.appendChild(option);
                    });
                })
                .catch(error => {
                    alert('Failed to fetch user roles.');
                    console.error('There was a problem with the fetch operation:', error);
                });
        });

        // Add event listener to the set coupon button
        document.getElementById('setCouponButton').addEventListener('click', function() {

            let userRole = document.getElementById('userRole').value;
            let couponName = document.getElementById('couponName').value;
            let couponValue = document.getElementById('couponValue').value;

            if (userRole && couponName && couponValue) {
                fetch('http://localhost:8081/coupons/set/' + userRole + '/' + couponName + '/' + couponValue, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => {
                        if (response.ok) {
                            alert('Coupon set successfully!');
                        } else {
                            alert('Failed to set coupon.');
                        }
                    })
                    .catch(error => {
                        alert('Failed to set coupon.');
                        console.error('There was a problem with the fetch operation:', error);
                    });
            } else {
                alert('Please fill in all fields.');
            }
        });
    </script>

</div>

