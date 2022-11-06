import { Box, Stack } from '@mui/system'
import BackButton from '../components/BackButton'
import Typography from '@mui/material/Typography'
import Button from '@mui/material/Button'
import CalculateDelivery from '../components/CalculateDelivery'
import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import coreService from '../services/core'
import woltService from '../services/wolt'
import { NavLink, useNavigate } from 'react-router-dom'
import { Chip, Snackbar, Alert } from '@mui/material'

const Product = () => {
  const { id } = useParams()
  const [deliveryFee, setDeliveryFee] = useState(null)
  const [deliveryEstimate, setDeliveryEstimate] = useState(null)
  const [product, setProduct] = useState(null)
  const [address, setAddress] = useState('Dipoli')
  const [error, setError] = useState(null)
  const [success, setSuccess] = useState(null)
  const [tracking, setTracking] = useState(null)
  const user = window.localStorage.getItem('session')
  const navigate = useNavigate()
  const [open, setOpen] = useState(false)

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return
    }

    setOpen(false)
  }

  const getProductInfo = async () => {
    const response = await coreService.getSingleProduct({ id })
    setProduct(response)
  }

  const orderItem = async () => {
    const response = await woltService.orderItem({ itemId: id, dropoff: address })
    if (response.error_code) {
      console.error(response)
      setError(response.error_code)
      setOpen(true)
    } else {
      setError(false)
      setSuccess(true)
      setTracking(response.tracking.url)
      console.log(response.tracking.url)
    }
  }

  const handleCondition = (condition) => {
    if (condition === 'NEW') {
      return { name: 'New', color: 'primary' }
    }
    if (condition === 'ALMOST_NEW') {
      return { name: 'Almost new', color: 'info' }
    }
    if (condition === 'USED') {
      return { name: 'Used', color: 'secondary' }
    }
    if (condition === 'DAMAGED') {
      return { name: 'Damaged', color: 'warning' }
    }
  }

  // const handleTracking = () => {

  // }

  useEffect(() => {
    getProductInfo()
  }, [])

  return (
    <Box sx={{ display: 'flex', mt: 1, p: 0, justifyContent: 'center' }}>
      {product && (
        <Box
          sx={{
            display: 'flex',
            flexDirection: 'column',
            width: '100%',
            p: 0,
          }}
        >
          <BackButton />
          <Stack spacing={2} sx={{ display: 'flex', width: '100%' }}>
            <img
              src={product.photo_src}
              loading="lazy"
              width="100%"
              style={{ borderRadius: '15px' }}
            />
            <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
              <Typography variant="h5" sx={{ fontWeight: '600' }}>
                {product.title}
              </Typography>
              <Chip
                label={handleCondition(product.condition).name}
                color={handleCondition(product.condition).color}
                variant="outlined"
              />
            </Box>
            <Typography variant="h6" color="grey" sx={{ fontWeight: '600' }}>
              {product.category}
            </Typography>
            <Typography variant="body1">{product.description}</Typography>
            <Box
              sx={{
                display: 'flex',
                justifyContent: 'center',
              }}
            >
              <CalculateDelivery
                setDeliveryFee={setDeliveryFee}
                deliveryFee={deliveryFee}
                setDeliveryEstimate={setDeliveryEstimate}
                pickup={product.pickup_location}
                address={address}
                setAddress={setAddress}
              />
            </Box>
            <Box
              sx={{
                display: 'flex',
                textAlign: 'center',
                justifyContent: 'center',
                flexDirection: 'column',
              }}
            >
              {deliveryFee && <Typography variant="body1">Delivery fee: €{deliveryFee}</Typography>}
              {deliveryEstimate && (
                <Typography variant="body1">Delivery estimate: {deliveryEstimate} min</Typography>
              )}
            </Box>
            {success && (
              <Button color="primary" href={tracking} target="_blank">
                Track Order
              </Button>
            )}
            {!success && user && deliveryFee && address && (
              <Button variant="contained" color="primary" onClick={orderItem}>
                Order
              </Button>
            )}
            {!user && deliveryFee && address && (
              <Button variant="contained" color="primary" onClick={() => navigate('/login')}>
                Log in to order
              </Button>
            )}
            {error && (
              <Typography variant="overline" color="red">
                {error}
              </Typography>
            )}
          </Stack>
        </Box>
      )}
      <Snackbar sx={{ p: 2 }} open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="error" sx={{ width: '100%' }}>
          {error}
        </Alert>
      </Snackbar>
    </Box>
  )
}

export default Product
