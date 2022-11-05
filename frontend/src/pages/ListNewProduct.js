import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import { TextField, Button, Stack, FormControl, InputLabel, Select, MenuItem } from '@mui/material'
import BackButton from '../components/BackButton'
import FileUpload from '../components/FileUpload'
import { useState } from 'react'
import coreService from '../services/core'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { TimePicker } from '@mui/x-date-pickers/TimePicker'
import { AdapterMoment } from '@mui/x-date-pickers/AdapterMoment'
import moment from 'moment'
import { File } from '@lokalise/node-api/dist/models/file'

const ListNewProduct = () => {
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [category, setCategory] = useState('')
  const [condition, setCondition] = useState('')
  const [error, setError] = useState(null)
  const [pickup_location, setPickupLocation] = useState('Helsiki Central Station')
  const [fromTime, setFromTime] = useState(null)
  const [fromTimeString, setFromTimeString] = useState(null)
  const [toTime, setToTime] = useState(null)
  const [toTimeString, setToTimeString] = useState(null)

  const listProduct = async (event) => {
    event.preventDefault()
    const item = {
      title: name,
      category: category,
      description: description,
      photo_src: 'test_src',
      dimensions: 'testXtest',
      pickup_location: pickup_location,
      pickup_time_from: fromTimeString,
      pickup_time_to: toTimeString,
    }
    try {
      const response = await coreService.addProduct({ item })
      if (response.error) {
        setError(response.error)
      } else {
        console.log('item published')
        //navigate('/')
      }
    } catch (exception) {
      console.error(exception)
    }
  }
  return (
    <Box
      sx={{
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      <Box sx={{ display: 'flex' }}>
        <BackButton />
      </Box>
      <form onSubmit={listProduct} id="login-form">
        <Stack spacing={2} sx={{ display: 'flex', flexDirection: 'column' }}>
          <TextField
            label="Item name"
            value={name}
            variant="standard"
            onChange={({ target }) => setName(target.value)}
          />
          <FileUpload />
          <TextField
            label="Description"
            variant="standard"
            multiline
            value={description}
            onChange={({ target }) => setDescription(target.value)}
          />
          <FormControl fullWidth variant="standard">
            <InputLabel id="demo-simple-select-label">Category</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={category}
              onChange={({ target }) => setCategory(target.value)}
              label="Category"
            >
              <MenuItem value="APPAREL">Apparel</MenuItem>
              <MenuItem value="ELECTRONICS">Electronics</MenuItem>
              <MenuItem value="GARDEN">Garden & Outdoors</MenuItem>
              <MenuItem value="SUPPLIES">Supplies</MenuItem>
              <MenuItem value="SPORT">Sporting goods</MenuItem>
              <MenuItem value="HOME">Home goods</MenuItem>
              <MenuItem value="GAMES">Toys and Games</MenuItem>
              <MenuItem value="OTHER">Other</MenuItem>
            </Select>
          </FormControl>
          <FormControl fullWidth variant="standard">
            <InputLabel id="demo-simple-select-label">Condition</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={condition}
              onChange={({ target }) => setCondition(target.value)}
              label="Category"
            >
              <MenuItem value="NEW">New</MenuItem>
              <MenuItem value="ALMOST_NEW">Almost new</MenuItem>
              <MenuItem value="USED">Used</MenuItem>
              <MenuItem value="DAMAGED">Damaged</MenuItem>
            </Select>
          </FormControl>
          <TextField
            variant="standard"
            label="Pickup address"
            value={pickup_location}
            onChange={({ target }) => setPickupLocation(target.value)}
          />
          <LocalizationProvider dateAdapter={AdapterMoment}>
            <Typography format="body2">Pickup time</Typography>
            <Stack direction="row" spacing={2} sx={{ display: 'flex' }}>
              <TimePicker
                label="From"
                value={fromTime}
                inoutFormat="HH:mm"
                onChange={(newValue) => {
                  setFromTime(newValue)
                  setFromTimeString(moment(newValue).format('hh:mm'))
                }}
                renderInput={(params) => <TextField {...params} />}
              />
              <TimePicker
                label="To"
                value={toTime}
                onChange={(newValue) => {
                  setToTime(newValue)
                  setToTimeString(moment(newValue).format('hh:mm'))
                }}
                minutesStep="10"
                renderInput={(params) => <TextField {...params} />}
              />
            </Stack>
          </LocalizationProvider>
          {/* <Box sx={{ display: 'flex', flexDirection: 'column', p: 0 }}>
            <Typography variant="subtitle2">Dimensions</Typography>
            <Stack direction="row" spacing={2} sx={{ display: 'flex' }}>
              <TextField variant="standard" label="Length" onChange="" />
              <TextField variant="standard" label="Width" onChange="" />
              <TextField variant="standard" label="Height" onChange="" />
            </Stack>
          </Box> */}
          {/* <TextField
            InputLabelProps={{ required: false }}
            type="password"
            variant="standard"
            fullWidth
            required
            value="Password"
            id="password"
            label="Password"
            // onChange={({ target }) => setPassword(target.value)}
          />
          <Typography variant="overline" color="red">
            Error
          </Typography> */}
          <Button
            type="submit"
            id="login-button"
            variant="contained"
            className="align-center"
            sx={{ mt: 2 }}
          >
            Publish
          </Button>
          {error && (
            <Typography variant="overline" color="red">
              {error}
            </Typography>
          )}
        </Stack>
      </form>
    </Box>
  )
}

export default ListNewProduct
