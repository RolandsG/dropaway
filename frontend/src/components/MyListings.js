import { useState, useEffect } from 'react'
import coreService from '../services/core'
import { Box, Typography } from '@mui/system'
import { List, ListItem, ListItemText, ListItemButton } from '@mui/material'
import { useNavigate } from 'react-router-dom'

const MyListings = () => {
  const [listings, setListings] = useState()
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
    <List
      disablePadding
      sx={{
        display: 'flex',
        mt: 1,
        justifyContent: 'center',
        flexDirection: 'column',
      }}
    >
      {listings &&
        listings.map((listing) => {
          return (
            <ListItem disablePadding dense key={listing.id} sx={{ mt: 1 }}>
              <ListItemButton onClick={() => navigate(`/product/${listing.id}`)}>
                <ListItemText primary={listing.title} secondary={listing.category} />
              </ListItemButton>
            </ListItem>
          )
        })}
    </List>
  )
}

export default MyListings
