const baseUrl = process.env.REACT_APP_BASE_URL

// mockup
const login = async ({ username, password }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password, email: 'rl@gg.lv' }),
  }
  const responseRaw = await fetch(`${baseUrl}/api/v1/auth/login/`, config)
  const response = await responseRaw.json()
  return response
}

// mockup
const register = async ({ username, password }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  }
  const responseRaw = await fetch(`${baseUrl}/register/`, config)
  const response = await responseRaw.json()
  return response
}

/* eslint import/no-anonymous-default-export: [2, {"allowObject": true}] */
export default {
  login,
  register,
}
