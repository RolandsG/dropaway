const baseUrl = process.env.REACT_APP_BASE_URL

const login = async ({ email, password }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ password, email }),
  }
  const responseRaw = await fetch(`${baseUrl}/api/v1/auth/login/`, config)
  const response = await responseRaw.json()
  if (responseRaw.status !== 200) {
    if (response.non_field_errors) {
      return { error: response.non_field_errors[0] }
    } else if (response.email) {
      return { error: response.email[0] }
    }
  }
  return response
}

const register = async ({ email, password, passwordConfirm }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password }),
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
