import { useState } from 'react'
import Box from '@mui/material/Box'
import TextField from '@mui/material/TextField'
import Button from '@mui/material/Button'
import authService from '../services/auth'
import Typography from '@mui/material/Typography'

const RegisterForm = () => {
  const [email, setEmail] = useState('')
  const [password1, setPassword1] = useState('')
  const [password2, setPassword2] = useState('')
  const [error, setError] = useState(null)

  const login = async (event) => {
    event.preventDefault()
    try {
      const response = await authService.register({ email, password1, password2 })
      if (response.error) {
        setError(response.error)
      } else {
        window.localStorage.setItem('session', response.key)
        window.location.reload()
      }
    } catch (exception) {
      console.error(exception)
    }
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
            value={email}
            id="email"
            label="Email (can be fake)"
            onChange={({ target }) => setEmail(target.value)}
          />
          <TextField
            InputLabelProps={{ required: false }}
            type="password"
            variant="standard"
            fullWidth
            required
            value={password1}
            id="password"
            label="Password"
            onChange={({ target }) => setPassword1(target.value)}
          />
          <TextField
            InputLabelProps={{ required: false }}
            type="password"
            variant="standard"
            fullWidth
            required
            value={password2}
            id="passwordConfirmation"
            label="Confirm Password"
            onChange={({ target }) => setPassword2(target.value)}
          />
          {error && (
            <Typography variant="overline" color="red">
              {error}
            </Typography>
          )}
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
