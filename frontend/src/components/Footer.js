import { useState } from 'react'
import { NavLink } from 'react-router-dom'
import BottomNavigation from '@mui/material/BottomNavigation'
import BottomNavigationAction from '@mui/material/BottomNavigationAction'
import HomeIcon from '@mui/icons-material/Home'
import AccountBoxIcon from '@mui/icons-material/AccountBox'
import ArchiveIcon from '@mui/icons-material/Archive'
import Paper from '@mui/material/Paper'

const Footer = () => {
  const [value, setValue] = useState(0)

  return (
    <Paper sx={{ position: 'fixed', bottom: 0, left: 0, right: 0 }} elevation={3}>
      <BottomNavigation
        showLabels
        value={value}
        onChange={(event, newValue) => {
          setValue(newValue)
        }}
      >
        <BottomNavigationAction component={NavLink} to="" label="Home" icon={<HomeIcon />} />
        <BottomNavigationAction
          component={NavLink}
          to="orders"
          label="Orders"
          icon={<ArchiveIcon />}
        />
        <BottomNavigationAction
          component={NavLink}
          to="profile"
          label="Profile"
          icon={<AccountBoxIcon />}
        />
      </BottomNavigation>
    </Paper>
  )
}

export default Footer
