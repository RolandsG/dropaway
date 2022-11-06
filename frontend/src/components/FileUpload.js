import React, { useState } from 'react'
import Image from '@mui/icons-material/Image'
import { Typography, Button, Box } from '@mui/material'
import CircularProgress from '@mui/material/CircularProgress'

const FileUpload = ({ setPhotoSrc, selected }) => {
  const [image, setImage] = useState(null)
  const [url, setUrl] = useState('')
  const [loading, setLoading] = useState(false)
  const uploadImage = () => {
    const data = new FormData()
    data.append('file', image)
    data.append('upload_preset', 'products')
    data.append('cloud_name', 'dtzpuflzw')
    setLoading(true)
    fetch('  https://api.cloudinary.com/v1_1/dtzpuflzw/image/upload', {
      method: 'post',
      body: data,
    })
      .then((resp) => resp.json())
      .then((data) => {
        setUrl(data.url)
        setPhotoSrc(data.url)
        console.log(data.url)
        selected(false)
        setLoading(false)
      })
      .catch((err) => console.log(err))
  }
  return (
    <Box sx={{ display: 'flex', justifyContent: 'center', flexDirection: 'column' }}>
      {!image && (
        <Button variant="outlined" component="label">
          SELECT PHOTO
          <input
            hidden
            accept="image/*"
            type="file"
            onChange={(e) => {
              selected(true)
              setImage(e.target.files[0])
            }}
          />
        </Button>
      )}
      {image && !url && (
        <Button variant="contained" component="label" onClick={uploadImage}>
          {!loading && (
            <Box sx={{ display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
              <Typography variant="subtitle2">{image.name}</Typography>
              <Typography variant="h6">Upload photo</Typography>
            </Box>
          )}
        </Button>
      )}
      {url && (
        <div>
          <img
            alt="not found"
            width={'100%'}
            src={url}
            onClick={() => {
              setImage(null)
              setUrl(null)
            }}
          />
        </div>
      )}
    </Box>
  )
}
export default FileUpload
