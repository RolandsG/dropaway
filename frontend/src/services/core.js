const baseUrl = process.env.REACT_APP_BASE_URL

// mockup
const getProducts = async () => {
  const user = window.localStorage.getItem('session')
  const config = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      ...(!!user && { Authorization: `Token ${user}` }),
    },
  }
  const responseRaw = await fetch(`${baseUrl}/api/v1/core/items/`, config)
  const response = await responseRaw.json()
  return response
}

// mockup
const addProduct = async ({ item }) => {
  const user = window.localStorage.getItem('session')
  const config = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(!!user && { Authorization: `Token ${user}` }),
    },
    body: JSON.stringify({
      title: item.title,
      category: item.category,
      description: item.description,
      photo_src: item.photo_src,
      dimensions: item.dimensions,
      pickup_location: item.pickup_location,
    }),
  }
  const responseRaw = await fetch(`${baseUrl}/api/v1/core/items/`, config)
  const response = await responseRaw.json()
  return response
}

// mockup
const deleteProduct = async ({ username, password }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  }
  const responseRaw = await fetch(`${baseUrl}/login/`, config)
  const response = await responseRaw.json()
  return response
}

// mockup
const purchaseProduct = async ({ username, password }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  }
  const responseRaw = await fetch(`${baseUrl}/login/`, config)
  const response = await responseRaw.json()
  return response
}

/* eslint import/no-anonymous-default-export: [2, {"allowObject": true}] */
export default {
  getProducts,
  addProduct,
  deleteProduct,
  purchaseProduct,
}
