<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Information Fetcher</title>
</head>
<body>

<button type="button" class="text-red-700 hover:text-white border border-red-700 hover:bg-white focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">OG</button>


  <h1>New product</h1>

  <%= render "form", product: @product %>

  <br>

  <div>
    <%= link_to "Back to products", products_path %>
  </div>


  <h1>Product Information Fetcher</h1>
  <input type="text" id="fetchHandle" placeholder="Product Handle" value="uwell-caliburn-g-pod-system-kit">
  <button id="fetchButton" type="button" class="text-white bg-black hover:text-white border border-white hover:bg-white focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-black dark:text-red-500 dark:hover:text-black dark:hover:bg-red-600 dark:focus:ring-red-900">Red</button>




  <h2>Product Information</h2>
  <ul id="productInfo">
    <!-- Product information will be displayed here -->
  </ul>
  <!-- Replace 'post_title' and 'post_content' with the actual IDs of your input fields -->
  <input type="text" id="post_title" placeholder="Post Title">
  <textarea id="post_content" placeholder="Post Content" rows="10"></textarea>
  
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const fetchButton = document.getElementById('fetchButton');
      const fetchHandleInput = document.getElementById('fetchHandle');
      const productInfoList = document.getElementById('productInfo');
      
      // Function to get the image URL associated with a variant ID
      function getVariantImage(variantId, productData) {
        const variants = productData.product.variants;
        const images = productData.product.images;

        // Find the variant object with the given variantId
        const variant = variants.find(variant => variant.id === variantId);

        if (variant) {
            // Find the image object associated with the variant's image_id
            const image = images.find(image => image.id === variant.image_id);

            if (image) {
                // Return the image source
                return image.src;
            }
        }

        // Return null if no matching image is found
        return null;
      }

      fetchButton.addEventListener('click', function () {
        // Get the value from the fetchHandle input
        const handle = fetchHandleInput.value;
        
        // Fetch data from the API endpoint
        fetch(`https://www.eightvape.com/products/${handle}.json`)
          .then(response => response.json())
          .then(data => {
            // Log fetched data to the console
            console.log('Fetched JSON data:', data);
            
            // Check if product data is available
            if (data['product']) {
              // Clear previous product info
              productInfoList.innerHTML = '';
              
              // Render product information
              const product = data['product'];
              const productInfoHTML = `
                <li><strong>ID:</strong> ${product['id']}</li>
                <li><strong>Title:</strong> ${product['title']}</li>
                <li><strong>Handle:</strong> ${product['handle']}</li>
                <li><strong>Brand:</strong> ${product['vendor']}</li>
                <li><strong>Type:</strong> ${product['product_type']}</li>
                <li><strong>Image Url:</strong> ${product['image']['src']}</li>
                <li><strong>Image:</strong> <img src="${product['image']['src']}" height="160" width="160"></li>
                <li><strong>Body HTML:</strong> ${product['body_html']}</li>
                <li><strong>Vendor:</strong> ${product['vendor']}</li>
                <li><strong>Options:</strong>
                  <ul>
                    ${product['options'].map(option => `
                      <li><strong>${option.name}:</strong>
                        <ul>
                          ${option.values.map(value => `<li>${value}</li>`).join('')}
                        </ul>
                      </li>
                    `).join('')}
                  </ul>
                </li>
                <li><strong>Variants:</strong>
                  <ul>
                    ${product['variants'].map(variant => `
                      <li><strong>Title:</strong> ${variant.title}</li>
                      <li><strong>Price:</strong> ${variant.price}</li>
                      <li><strong>Image:</strong> <img src="${getVariantImage(variant.id, data)}" alt="${product['title']} - ${variant.title}"></li>
                    `).join('')}
                  </ul>
                </li>
              `;
              productInfoList.innerHTML = productInfoHTML;
              
              // Update value of po_name input field with product title
              document.getElementById('product_name').value = product['title'];
              document.getElementById('product_handle').value = product['handle'];
              document.getElementById('product_price').value = product['price'];
              document.getElementById('product_brand').value = product['vendor'];
              document.getElementById('product_category').value = product['product_type']
              document.getElementById('product_desc').value = product['body_html'];
              document.getElementById('product_image').value = product['image']['src'];
              document.getElementById('product_options').value = product['options'][0]['name']
            } else {
              productInfoList.innerHTML = '<p>No product data available.</p>';
            }
          })
          .catch(error => {
            console.error('Error fetching data:', error);
          });
      });
    });
  </script>
</body>
</html>



