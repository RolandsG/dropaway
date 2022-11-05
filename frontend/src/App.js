import { Routes, Route } from 'react-router-dom'
import DefaultLayout from './components/DefaultLayout'
import Home from './pages/Home'
import Orders from './pages/Orders'
import Product from './pages/Product'
import Profile from './pages/Profile'
import Category from './pages/Category'
import Login from './pages/Login'
import ListNewProduct from './pages/ListNewProduct'
import Box from '@mui/material/Box'

function App() {
  return (
    <Box className="App" sx={{ p: 2 }}>
      <Routes>
        <Route path="/" element={<DefaultLayout />}>
          <Route path="" element={<Home />} />
          <Route path="login" element={<Login />} />
          <Route path="orders" element={<Orders />} />
          <Route path="product/:id" element={<Product />} />
          <Route path="profile" element={<Profile />} />
          <Route path="category/:category" element={<Category />} />
          <Route path="category/:category/product/:id" element={<Product />} />
          <Route path="new-product" element={<ListNewProduct />} />
        </Route>
      </Routes>
    </Box>
  )
}

export default App
