import { useState } from 'react'
import Box from '@mui/material/Box'
import TextField from '@mui/material/TextField'
import Button from '@mui/material/Button'
import authService from '../services/auth'
import Typography from '@mui/material/Typography'
import { Snackbar, Alert } from '@mui/material'

const RegisterForm = () => {
  const [email, setEmail] = useState('')
  const [password1, setPassword1] = useState('')
  const [password2, setPassword2] = useState('')
  const [error, setError] = useState(null)
  const [open, setOpen] = useState(false)

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return
    }

    setOpen(false)
  }

  const login = async (event) => {
    event.preventDefault()
    try {
      const response = await authService.register({ email, password1, password2 })
      if (response.error) {
        setError(response.error)
        setOpen(true)
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
      <Snackbar sx={{ p: 2 }} open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="error" sx={{ width: '100%' }}>
          {error}
        </Alert>
      </Snackbar>
    </Box>
  )
}

export default RegisterForm
