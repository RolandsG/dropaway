import { Outlet } from 'react-router-dom'
import TopBar from './TopBar'
import Box from '@mui/material/Box'
import Footer from './Footer'

const DefaultLayout = () => {
  const user = window.localStorage.getItem('session')

  return (
    <Box>
      <TopBar />
      <Box
        sx={{
          width: { lg: '40vw', xl: '35vw' },
          mb: '56px',
          marginLeft: 'auto',
          marginRight: 'auto',
        }}
      >
        <Outlet />
      </Box>
      {user && <Footer />}
    </Box>
  )
}
export default DefaultLayout
