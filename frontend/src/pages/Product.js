import { Box, Stack } from '@mui/system'
import BackButton from '../components/BackButton'
import Typography from '@mui/material/Typography'
import Button from '@mui/material/Button'
import CalculateDelivery from '../components/CalculateDelivery'
import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import coreService from '../services/core'
import woltService from '../services/wolt'
import { NavLink } from 'react-router-dom'

const Product = () => {
  const { id } = useParams()
  const [deliveryFee, setDeliveryFee] = useState(null)
  const [deliveryEstimate, setDeliveryEstimate] = useState(null)
  const [product, setProduct] = useState(null)
  const [address, setAddress] = useState('Dipoli')
  const [error, setError] = useState(null)
  const [success, setSuccess] = useState(null)
  const [tracking, setTracking] = useState(null)

  const getProductInfo = async () => {
    const response = await coreService.getSingleProduct({ id })
    console.log(response)
    setProduct(response)
  }

  const orderItem = async () => {
    const response = await woltService.orderItem({ itemId: id, dropoff: address })
    if (response.error_code) {
      console.error(response)
      setError(response.error_code)
    } else {
      setError(false)
      setSuccess(true)
      setTracking(response.tracking.url)
      console.log(response.tracking.url)
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
        <Box sx={{ display: 'flex', flexDirection: 'column', p: 0 }}>
          <BackButton />
          <Stack spacing={2} sx={{ display: 'flex' }}>
            <img
              src={product.photo_src}
              loading="lazy"
              width="100%"
              style={{ borderRadius: '15px' }}
            />
            <Typography variant="h5" sx={{ fontWeight: '600' }}>
              {product.title}
            </Typography>
            <Typography variant="h6" color="grey" sx={{ fontWeight: '600' }}>
              {product.category}
            </Typography>
            <Typography variant="body1">{product.description}</Typography>
            <Typography variant="body2">Condition: {product.condition}</Typography>
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
            {deliveryFee && address && (
              <Button variant="contained" color="primary" onClick={orderItem}>
                Order
              </Button>
            )}
            {error && (
              <Typography variant="overline" color="red">
                {error}
              </Typography>
            )}
            {success && (
              <>
                <Typography variant="overline" color="primary">
                  Your order has been placed!
                </Typography>
                <Button color="primary" href={tracking} target="_blank">
                  Track Order
                </Button>
              </>
            )}
          </Stack>
        </Box>
      )}
    </Box>
  )
}

export default Product
