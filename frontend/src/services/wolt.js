const baseUrl = process.env.REACT_APP_WOLT_URL

// mockup
const placeholder = async ({ username, password }) => {
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
  placeholder,
}
