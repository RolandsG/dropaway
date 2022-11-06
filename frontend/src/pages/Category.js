import { useEffect, useState } from 'react'
import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import coreService from '../services/core'
import { NavLink } from 'react-router-dom'
import { useParams } from 'react-router-dom'
import BackButton from '../components/BackButton'

const Category = () => {
  const { category } = useParams()
  const [items, setItems] = useState(null)

  console.log('category:', category)

  const getItems = async () => {
    const response = await coreService.getProducts()
    console.log(response)
    setItems(response)
  }

  useEffect(() => {
    getItems()
  }, [])

  return (
    <Box
      id="main-box"
      disableGutters
      sx={{ display: 'flex', mt: 1, justifyContent: 'center', flexDirection: 'column' }}
    >
      <BackButton />
      <Typography variant="h5" sx={{ mb: 2, fontWeight: 'bold' }}>
        {category}
      </Typography>
      <Box
        disableGutters
        sx={{
          display: 'flex',
          flexDirection: 'row',
          justifyContent: 'flex-start',
          flexWrap: 'wrap',
          my: 1,
        }}
      >
        {items &&
          items
            .filter((item) => item.category === category)
            .map((product) => {
              return (
                <Box
                  disableGutters
                  key={product.id}
                  sx={{
                    display: 'flex',
                    width: '100px',
                    flexDirection: 'column',
                    mx: 1,
                  }}
                >
                  <NavLink to={`product/${product.id}`}>
                    <Box
                      disableGutters
                      component="img"
                      sx={{
                        height: '100px',
                        objectFit: 'cover',
                        borderRadius: 3,
                      }}
                      alt="Item Picture"
                      src={product.photo_src}
                    />
                  </NavLink>
                  <Typography
                    component={NavLink}
                    to={`product/${product.id}`}
                    variant="body2"
                    sx={{ my: 1, textDecoration: 'none', color: 'inherit', fontWeight: '600' }}
                  >
                    {product.title}
                  </Typography>
                </Box>
              )
            })}
      </Box>
    </Box>
  )
}

export default Category
