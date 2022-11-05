import { useEffect, useState } from 'react'
import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import coreService from '../services/core'
import { NavLink } from 'react-router-dom'
import Button from '@mui/material/Button'
import Fab from '@mui/material/Fab'
import AddIcon from '@mui/icons-material/Add'

const Home = () => {
  const title = 'Categories'
  const [items, setItems] = useState(null)
  const [categories, setCategories] = useState(null)

  const getItems = async () => {
    const response = await coreService.getProducts()
    setCategories([...new Set(response.map((item) => item.category))])
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
      <Typography variant="h5" sx={{ mb: 2, fontWeight: 'bold' }}>
        {title}
      </Typography>
      {categories &&
        categories.map((category) => {
          return (
            <Box disableGutters key={category} sx={{ mt: 1 }}>
              <Box
                disableGutters
                sx={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}
              >
                <Typography variant="h6">{category}</Typography>
                <Button variant="text" component={NavLink} to={`category/${category}`}>
                  all
                </Button>
              </Box>
              <Box
                disableGutters
                sx={{
                  display: 'flex',
                  flexDirection: 'row',
                  justifyContent: 'flex-start',
                  my: 1,
                }}
              >
                {items
                  .filter((item) => item.category === category)
                  .slice(0, 3)
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
                        <Box
                          disableGutters
                          component="img"
                          sx={{
                            width: '100%',
                          }}
                          alt="Item Picture"
                          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6GGUNbamHf-Kn0vOP67diocqTsx4QXme2SQ&usqp=CAU"
                        />
                        <Typography variant="body2" sx={{ my: 1 }}>
                          {product.title}
                        </Typography>
                      </Box>
                    )
                  })}
              </Box>
            </Box>
          )
        })}
      <Box sx={{ display: 'flex' }}>
        <Box sx={{ flexGrow: 1 }} />
        <Fab
          color="primary"
          aria-label="add"
          sx={{
            minWidth: '56px',
            position: 'fixed',
            bottom: '70px',
            right: { xs: '30px', md: '100px', lg: '500px' },
          }}
        >
          <AddIcon />
        </Fab>
      </Box>
    </Box>
  )
}

export default Home
