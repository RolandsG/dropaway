import { Routes, Route } from 'react-router-dom'
import DefaultLayout from './components/DefaultLayout'
import Home from './pages/Home'
import Orders from './pages/Orders'
import Profile from './pages/Profile'
import Category from './pages/Category'
import Login from './pages/Login'
import Box from '@mui/material/Box'

function App() {
  return (
    <Box className="App" sx={{ p: 2 }}>
      <Routes>
        <Route path="/" element={<DefaultLayout />}>
          <Route path="" element={<Home />} />
          <Route path="login" element={<Login />} />
          <Route path="orders" element={<Orders />} />
          <Route path="profile" element={<Profile />} />
          <Route path="category/:category" element={<Category />} />
        </Route>
      </Routes>
    </Box>
  )
}

export default App
