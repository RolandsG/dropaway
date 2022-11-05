import { Outlet } from 'react-router-dom'
import TopBar from './TopBar'
import Box from '@mui/material/Box'
import Footer from './Footer'

const DefaultLayout = () => {
  return (
    <Box>
      <TopBar />
      <Box
        sx={{
          width: { xs: '95vw', md: '90vw', lg: '80vw', xl: '70vw' },
          marginLeft: 'auto',
          marginRight: 'auto',
        }}
      >
        <Outlet />
      </Box>
      <Footer />
    </Box>
  )
}
export default DefaultLayout
