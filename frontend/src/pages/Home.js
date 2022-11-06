import { useEffect, useState } from 'react'
import * as React from 'react'
import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import coreService from '../services/core'
import { NavLink } from 'react-router-dom'
import Button from '@mui/material/Button'
import Fab from '@mui/material/Fab'
import AddIcon from '@mui/icons-material/Add'
import ChevronRight from '@mui/icons-material/ChevronRight'
import Snackbar from '@mui/material/Snackbar'
import IconButton from '@mui/material/IconButton'
import CloseIcon from '@mui/icons-material/Close'

const Home = () => {
  const title = 'Categories'
  const user = window.localStorage.getItem('session')
  const [items, setItems] = useState(null)
  const [categories, setCategories] = useState(null)
  const [open, setOpen] = useState(false)

  const handleClick = () => {
    setOpen(true)
  }

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return
    }

    setOpen(false)
  }

  const action = (
    <React.Fragment>
      <Button color="primary" size="small" component={NavLink} to="login">
        Log in
      </Button>
      <IconButton size="small" color="primary" onClick={handleClose}>
        <CloseIcon fontSize="small" />
      </IconButton>
    </React.Fragment>
  )

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
      <Box sx={{ display: 'flex', flexDirection: 'row', justifyContent: 'center', mb: 2 }}>
        <Typography variant="h5" sx={{ fontWeight: 'bold' }}>
          {title}
        </Typography>
        <Box sx={{ flexGrow: 1 }} />
        {!user && (
          <Button component={NavLink} to="login">
            Log in
          </Button>
        )}
      </Box>
      {categories &&
        categories.map((category) => {
          return (
            <Box disableGutters key={category} sx={{ mt: 1 }}>
              <Box
                disableGutters
                sx={{
                  display: 'flex',
                  flexDirection: 'row',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                }}
              >
                <Typography variant="h6">{category}</Typography>
                <Button
                  variant="text"
                  component={NavLink}
                  to={`category/${category}`}
                  endIcon={<ChevronRight />}
                  sx={{ textTransform: 'none' }}
                >
                  See all
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
                        key={product.id}
                        disableGutters
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
                          sx={{
                            my: 1,
                            textDecoration: 'none',
                            color: 'inherit',
                            fontWeight: '600',
                          }}
                        >
                          {product.title}
                        </Typography>
                      </Box>
                    )
                  })}
              </Box>
            </Box>
          )
        })}
      {user && (
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
            component={NavLink}
            to="new-product"
          >
            <AddIcon />
          </Fab>
        </Box>
      )}
      {!user && !open && (
        <Box sx={{ display: 'flex' }}>
          <Box sx={{ flexGrow: 1 }} />
          <Fab
            color="primary"
            aria-label="add"
            sx={{
              minWidth: '56px',
              position: 'fixed',
              bottom: '30px',
              right: { xs: '30px', md: '100px', lg: '500px' },
            }}
            onClick={handleClick}
          >
            <AddIcon />
          </Fab>
        </Box>
      )}
      <Snackbar
        open={open}
        autoHideDuration={6000}
        onClose={handleClose}
        message="Log in to add or order items"
        action={action}
      />
    </Box>
  )
}

export default Home
