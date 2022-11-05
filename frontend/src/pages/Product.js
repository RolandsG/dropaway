import { Box, Stack } from '@mui/system'
import BackButton from '../components/BackButton'
import Typography from '@mui/material/Typography'
import Button from '@mui/material/Button'
import CalculateDelivery from '../components/CalculateDelivery'
import { useState } from 'react'

const Product = () => {
  const [deliveryFee, setDeliveryFee] = useState(null)

  return (
    <Box sx={{ display: 'flex', mt: 1, p: 0, justifyContent: 'center' }}>
      <Box sx={{ display: 'flex', flexDirection: 'column', p: 0 }}>
        <BackButton />
        <Stack spacing={2} sx={{ display: 'flex' }}>
          <img
            src="https://images.unsplash.com/photo-1551963831-b3b1ca40c98e"
            loading="lazy"
            width="100%"
            style={{ borderRadius: '15px' }}
          />
          <Typography variant="h5" sx={{ fontWeight: '600' }}>
            Name
          </Typography>
          <Typography variant="h6" color="grey" sx={{ fontWeight: '600' }}>
            Category
          </Typography>
          <Typography variant="body1">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
            sit amet blandit leo lobortis eget.
          </Typography>
          <Typography variant="body2">Dimensions: 00x00x00</Typography>
          <Typography variant="body2">Condition: Used</Typography>
          <Box
            sx={{
              display: 'flex',
              justifyContent: 'center',
            }}
          >
            <CalculateDelivery setDeliveryFee={setDeliveryFee} deliveryFee={deliveryFee} />
          </Box>
          <Box sx={{ display: 'flex', textAlign: 'center', justifyContent: 'center' }}>
            {deliveryFee && <Typography variant="body1">Delivery fee: €{deliveryFee}</Typography>}
          </Box>
          <Button variant="contained" color="primary">
            Order
          </Button>
        </Stack>
      </Box>
    </Box>
  )
}

export default Product
