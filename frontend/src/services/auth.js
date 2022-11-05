const baseUrl = process.env.REACT_APP_BASE_URL

const login = async ({ email, password }) => {
  const config = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ password, email }),
  }
  const responseRaw = await fetch(`${baseUrl}/api/v1/auth/login/`, config)
  const response = await responseRaw.json()
  if (responseRaw.status !== 200) {
    if (response.non_field_errors) {
      return { error: response.non_field_errors[0] }
    } else if (response.email) {
      return { error: response.email[0] }
    } else {
      console.error(response)
      return { error: 'uncaught error, check log' }
    }
  }
  return response
}

const register = async ({ email, password1, password2 }) => {
  const config = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password1, password2 }),
  }
  const responseRaw = await fetch(`${baseUrl}/api/v1/registration/`, config)
  const response = await responseRaw.json()
  if (responseRaw.status !== 201) {
    if (response.email) {
      return { error: response.email[0] }
    } else if (response.password1) {
      return { error: response.password1[0] }
    } else if (response.password2) {
      return { error: response.password2[0] }
    } else if (response.non_field_errors) {
      return { error: response.non_field_errors[0] }
    } else {
      console.error(response)
      return { error: 'uncaught error, check log' }
    }
  }
  return response
}

/* eslint import/no-anonymous-default-export: [2, {"allowObject": true}] */
export default {
  login,
  register,
}
