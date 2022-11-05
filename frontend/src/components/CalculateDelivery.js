import Button from '@mui/material/Button'
import TextField from '@mui/material/TextField'
import Dialog from '@mui/material/Dialog'
import DialogActions from '@mui/material/DialogActions'
import DialogContent from '@mui/material/DialogContent'
import DialogContentText from '@mui/material/DialogContentText'
import DialogTitle from '@mui/material/DialogTitle'
import { useState } from 'react'

export default function CalculateDelivery({ setDeliveryFee }) {
  const [open, setOpen] = useState(false)

  const handleClickOpen = () => {
    setOpen(true)
  }

  const handleClose = () => {
    setOpen(false)
  }
  const calculateDelivery = async () => {
    const config = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer hPklgvFdpMgC8mNt8Z7OiiYdBqJZMi4RBwqsQnJ60c4',
      },
    }
    const responseRaw = await fetch(
      `https://daas-public-api.development.dev.woltapi.com/merchants/6364e0098018ce361efafca7/delivery-fee`,
      config,
    )
    const response = await responseRaw.json()
    console.log(response.results)
  }
  setDeliveryFee('2.56')

  return (
    <div>
      <Button variant="outlined" color="primary" onClick={handleClickOpen}>
        Calculate delivery fee
      </Button>
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>Enter delivery address</DialogTitle>
        <DialogContent>
          <TextField autoFocus label="Street name and number" fullWidth variant="standard" />
          <TextField autoFocus label="City" fullWidth variant="standard" />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={calculateDelivery}>Calculate</Button>
        </DialogActions>
      </Dialog>
    </div>
  )
}
