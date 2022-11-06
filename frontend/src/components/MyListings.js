import { useState, useEffect } from 'react'
import coreService from '../services/core'
import { List, ListItem, ListItemText, ListItemButton, ListItemAvatar } from '@mui/material'
import { useNavigate } from 'react-router-dom'
import { Avatar, Typography, Box } from '@mui/material'

const MyListings = () => {
  const [listings, setListings] = useState([])
  const navigate = useNavigate()

  const getListings = async () => {
    const response = await coreService.getListings()
    console.log(response)
    setListings(response)
  }

  useEffect(() => {
    getListings()
  }, [])

  return (
    <Box>
      {listings &&
        listings.map((listing) => {
          return (
            <List
              disablePadding
              sx={{
                display: 'flex',
                mt: 1,
                justifyContent: 'center',
                flexDirection: 'column',
              }}
            >
              <ListItem
                disablePadding
                dense
                key={listing.id}
                sx={{ mt: 1 }}
                onClick={() => navigate(`/product/${listing.id}`)}
              >
                <ListItemAvatar>
                  <Avatar>
                    <img src={listing.photo_src} />
                  </Avatar>
                </ListItemAvatar>
                <ListItemButton>
                  <ListItemText primary={listing.title} secondary={listing.category} />
                </ListItemButton>
              </ListItem>
            </List>
          )
        })}
      {listings.length === 0 && (
        <ListItem>
          <Typography sx={{ display: 'flex', justifyContent: 'center' }}>
            You don't have any listed items
          </Typography>
        </ListItem>
      )}
    </Box>
  )
}

export default MyListings
