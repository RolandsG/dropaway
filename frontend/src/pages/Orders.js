import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import { useState, useEffect } from 'react'
import coreService from '../services/core'

const Orders = () => {
  const text = 'Orders page'

  const [orders, setOrders] = useState()

  const getOrders = async () => {
    const response = await coreService.getOrders()
    console.log(response)
    setOrders(response)
  }

  useEffect(() => {
    getOrders()
  }, [])

  return (
    <Box sx={{ display: 'flex', mt: 1, justifyContent: 'center' }}>
      <Typography variant="body1" color="grey" sx={{ fontStyle: 'italic', color: '#a3a3a3' }}>
        {text}
      </Typography>
      {orders &&
        orders.map((order) => {
          return <Box disableGutters key={order} sx={{ mt: 1 }}></Box>
        })}
    </Box>
  )
}

export default Orders
