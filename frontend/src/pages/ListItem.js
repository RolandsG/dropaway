import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'

const ListItem = () => {
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
          {error && (
            <Typography variant="overline" color="red">
              {error}
            </Typography>
          )}
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

export default LisItem
