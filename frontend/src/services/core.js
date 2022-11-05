const baseUrl = process.env.REACT_APP_BASE_URL

// mockup
const getProducts = async ({ username, password }) => {
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
const addProduct = async ({ username, password }) => {
  const config = {
    method: 'GET',
    headers: { 'Content-Type': 'application/json' },
  }
  const responseRaw = await fetch(`${baseUrl}/login/`, config)
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
