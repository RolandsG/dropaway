import { useState, useEffect } from 'react'
import Box from '@mui/material/Box'
import TextField from '@mui/material/TextField'
import Button from '@mui/material/Button'
import authService from '../services/auth'
import Typography from '@mui/material/Typography'
import { Snackbar, Alert } from '@mui/material'

const LoginForm = () => {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
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
    setError(null)
    try {
      const response = await authService.login({ email, password })
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
            value={email}
            id="name"
            label="Email"
            onChange={({ target }) => setEmail(target.value)}
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
      <Snackbar sx={{ p: 2 }} open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="error" sx={{ width: '100%' }}>
          {error}
        </Alert>
      </Snackbar>
    </Box>
  )
}

export default LoginForm
