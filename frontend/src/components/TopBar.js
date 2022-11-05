import AppBar from '@mui/material/AppBar'
import Box from '@mui/material/Box'
import Logo from '../assets/Logo.png'

const TopBar = () => {
  return (
    <AppBar
      position="relative"
      color="transparent"
      elevation={0}
      sx={{ display: 'flex', flexDirection: 'row', justifyContent: 'center' }}
    >
      <Box
        component="img"
        sx={{
          width: 130,
        }}
        alt="Dropaway logo"
        src={Logo}
      />
    </AppBar>
  )
}

export default TopBar
