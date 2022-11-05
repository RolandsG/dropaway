import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import { TextField, Button, Stack, FormControl, InputLabel, Select, MenuItem } from '@mui/material'
import BackButton from '../components/BackButton'
import Image from '@mui/icons-material/Image'
import { useState } from 'react'
import coreService from '../services/core'

const ListNewProduct = () => {
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [category, setCategory] = useState('')
  const [condition, setCondition] = useState('')
  const [selectedImage, setSelectedImage] = useState(null)
  const [error, setError] = useState(null)

  const listProduct = async (event) => {
    event.preventDefault()
    const item = {
      title: name,
      category: category,
      description: description,
      photo_src: 'test_src',
      dimensions: 'testXtest',
      pickup_location: 'Hietalahdenranta 7',
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
          {selectedImage && (
            <div>
              <img alt="not fount" width={'250px'} src={URL.createObjectURL(selectedImage)} />
              <br />
              <button onClick={() => setSelectedImage(null)}>Remove</button>
            </div>
          )}
          <Button variant="outlined" component="label" startIcon={<Image />}>
            Add photo
            <input
              hidden
              accept="image/*"
              type="file"
              onChange={(event) => {
                console.log(event.target.files[0])
                setSelectedImage(event.target.files[0])
              }}
            />
          </Button>
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
