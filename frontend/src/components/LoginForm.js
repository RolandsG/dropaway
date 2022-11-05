import { useState } from 'react'
import Box from '@mui/material/Box'
import TextField from '@mui/material/TextField'
import Button from '@mui/material/Button'
import authService from '../services/auth'
import { useNavigate } from 'react-router-dom'

const LoginForm = () => {
  const [username, setName] = useState('')
  const [password, setPassword] = useState('')
  const navigate = useNavigate()

  const login = async (event) => {
    event.preventDefault()
    try {
      const response = await authService.login({ username, password })
      window.localStorage.setItem('session', JSON.stringify(response.key))
      navigate(-1)
    } catch (exception) {
      console.error(exception)
    }
    setPassword('')
  }

  return (
    <Box
      sx={{
        width: '300px',
        textAlign: 'center',
      }}
    >
      <form onSubmit={login} id="login-form">
        <Box sx={{ display: 'grid', rowGap: 2 }}>
          <TextField
            InputLabelProps={{ required: false }}
            variant="standard"
            type="text"
            fullWidth
            required
            value={username}
            id="name"
            label="Username"
            onChange={({ target }) => setName(target.value)}
          />
          <TextField
            InputLabelProps={{ required: false }}
            type="password"
            variant="standard"
            fullWidth
            required
            value={password}
            id="password"
            label="Password"
            onChange={({ target }) => setPassword(target.value)}
          />
          <Button
            type="submit"
            id="login-button"
            variant="contained"
            className="align-center"
            sx={{ mt: 2 }}
          >
            login
          </Button>
        </Box>
      </form>
    </Box>
  )
}

export default LoginForm
