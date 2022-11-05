import { useState } from 'react'
import Box from '@mui/material/Box'
import TextField from '@mui/material/TextField'
import Button from '@mui/material/Button'
import authService from '../services/auth'
import { useNavigate } from 'react-router-dom'

const RegisterForm = () => {
  const [username, setName] = useState('')
  const [password, setPassword] = useState('')
  const [passwordConfirmation, setPasswordConfirmation] = useState('')
  const navigate = useNavigate()

  const login = async (event) => {
    event.preventDefault()
    try {
      const response = await authService.register({ username, password, passwordConfirmation })
      window.localStorage.setItem('session', JSON.stringify(response.key))
      navigate('/home')
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
          <TextField
            InputLabelProps={{ required: false }}
            type="password"
            variant="standard"
            fullWidth
            required
            value={passwordConfirmation}
            id="passwordConfirmation"
            label="Confirm Password"
            onChange={({ target }) => setPasswordConfirmation(target.value)}
          />
          <Button
            type="submit"
            id="register-button"
            variant="contained"
            className="align-center"
            sx={{ mt: 2 }}
          >
            Register
          </Button>
        </Box>
      </form>
    </Box>
  )
}

export default RegisterForm
