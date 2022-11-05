import { useState } from 'react'
import { NavLink } from 'react-router-dom'
import BottomNavigation from '@mui/material/BottomNavigation'
import BottomNavigationAction from '@mui/material/BottomNavigationAction'
import HomeIcon from '@mui/icons-material/Home'
import AccountBoxIcon from '@mui/icons-material/AccountBox'
import ArchiveIcon from '@mui/icons-material/Archive'
import Paper from '@mui/material/Paper'
import Button from '@mui/material/Button'
import ArrowBackIosNewIcon from '@mui/icons-material/ArrowBackIosNew'
import Box from '@mui/material/Box'

const BackButton = () => {
  return (
    <Box>
      <Button variant="text" component={NavLink} to={-1} sx={{ pl: 0 }}>
        <ArrowBackIosNewIcon />
        Back
      </Button>
    </Box>
  )
}

export default BackButton
