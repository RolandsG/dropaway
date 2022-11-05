import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import { TextField, Button, Stack, FormControl, InputLabel, Select, MenuItem } from '@mui/material'
import BackButton from '../components/BackButton'
import Image from '@mui/icons-material/Image'
import { useState } from 'react'

const ListNewProduct = () => {
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [category, setCategory] = useState(null)
  const [condition, setCondition] = useState(null)
  const [selectedImage, setSelectedImage] = useState(null)

  const handleNameChange = (event) => {
    setName(event.target.value)
  }
  const handleDescriptionChange = (event) => {
    setDescription(event.target.value)
  }
  const handleCategoryChange = (event) => {
    setCategory(event.target.value)
  }
  const handleConditionChange = (event) => {
    setCondition(event.target.value)
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
      <form onSubmit={''} id="login-form">
        <Stack spacing={2} sx={{ display: 'flex', flexDirection: 'column' }}>
          <TextField
            label="Item name"
            value={name}
            variant="standard"
            onChange={handleNameChange}
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
            onChange={handleDescriptionChange}
          />
          <FormControl fullWidth variant="standard">
            <InputLabel id="demo-simple-select-label">Category</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={category}
              onChange={handleCategoryChange}
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
              onChange={handleConditionChange}
              label="Category"
            >
              <MenuItem value="NEW">New</MenuItem>
              <MenuItem value="ALMOST_NEW">Almost new</MenuItem>
              <MenuItem value="USED">Used</MenuItem>
              <MenuItem value="DAMAGED">Damaged</MenuItem>
            </Select>
          </FormControl>
          <Box sx={{ display: 'flex', flexDirection: 'column', p: 0 }}>
            <Typography variant="subtitle2">Dimensions</Typography>
            <Stack direction="row" spacing={2} sx={{ display: 'flex' }}>
              <TextField variant="standard" label="Length" onChange="" />
              <TextField variant="standard" label="Width" onChange="" />
              <TextField variant="standard" label="Height" onChange="" />
            </Stack>
          </Box>
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
        </Stack>
      </form>
    </Box>
  )
}

export default ListNewProduct
