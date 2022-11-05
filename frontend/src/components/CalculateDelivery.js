import Button from '@mui/material/Button'
import TextField from '@mui/material/TextField'
import Dialog from '@mui/material/Dialog'
import DialogActions from '@mui/material/DialogActions'
import DialogContent from '@mui/material/DialogContent'
import DialogContentText from '@mui/material/DialogContentText'
import DialogTitle from '@mui/material/DialogTitle'
import { Box } from '@mui/system'
import { useState } from 'react'
import woltService from '../services/wolt'

export default function CalculateDelivery({ setDeliveryFee, deliveryFee }) {
  const [open, setOpen] = useState(false)

  const handleClickOpen = () => {
    setOpen(true)
  }

  const handleClose = () => {
    setOpen(false)
  }
  const getFee = async () => {
    const response = await woltService.getDeliveryFee({
      pickup: 'brivibas 132',
      dropoff: 'tomsona 32',
    })
    const fee = response.fee.amount
    const deliveryEstimate = response.time_estimate_minutes
    console.log('fee', fee)
    console.log('delivery time', deliveryEstimate)
  }

  return (
    <div style={{ width: '100%' }}>
      <Box sx={{ display: 'flex', justifyContent: 'center' }}>
        {!deliveryFee && (
          <Button variant="outlined" color="primary" onClick={handleClickOpen} fullWidth>
            Calculate delivery fee
          </Button>
        )}
        {deliveryFee && (
          <Button variant="outlined" color="primary" onClick={handleClickOpen} fullWidth>
            Realculate delivery fee
          </Button>
        )}
        <Dialog open={open} onClose={handleClose}>
          <DialogTitle>Enter delivery address</DialogTitle>
          <DialogContent>
            <TextField autoFocus label="Street name and number" fullWidth variant="standard" />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button onClick={getFee}>Calculate</Button>
          </DialogActions>
        </Dialog>
      </Box>
    </div>
  )
}
