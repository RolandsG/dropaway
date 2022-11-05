import * as React from 'react'
import Accordion from '@mui/material/Accordion'
import AccordionSummary from '@mui/material/AccordionSummary'
import AccordionDetails from '@mui/material/AccordionDetails'
import Typography from '@mui/material/Typography'
import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
import {
  InputLabel,
  Select,
  MenuItem,
  FormControl,
  TextField,
  Stack,
  FormControlLabel,
  Switch,
  ListItem,
  List,
  ListItemIcon,
  ListItemText,
  ListItemButton,
} from '@mui/material'
import { useState } from 'react'
import HomeIcon from '@mui/icons-material/Home'

export default function ProfileAccordion({ user }) {
  const [country, setCountry] = useState('Finland')

  const handleChange = (event) => {
    setCountry(event.target.value)
  }
  return (
    <div>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls="panel1a-content"
          id="panel1a-header"
        >
          <Typography>My listings</Typography>
        </AccordionSummary>
        <AccordionDetails>
          <Typography>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
            sit amet blandit leo lobortis eget.
          </Typography>
        </AccordionDetails>
      </Accordion>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls="panel1a-content"
          id="panel1a-header"
        >
          <Typography>Settings</Typography>
        </AccordionSummary>
        <AccordionDetails>
          <Stack spacing={2}>
            {user && (
              <TextField
                id="outlined-basic"
                label="Name"
                defaultValue={user.name.first + ' ' + user.name.last}
                variant="outlined"
                sx={{ display: 'flex' }}
              />
            )}
            {user && (
              <TextField
                id="outlined-basic"
                label="Email"
                defaultValue={user.email}
                variant="outlined"
                sx={{ display: 'flex' }}
              />
            )}
            <FormControl fullWidth>
              <InputLabel id="demo-simple-select-label">Country</InputLabel>
              <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={country}
                label="Country"
                onChange={handleChange}
              >
                <MenuItem value={'Latvia'}>Latvia</MenuItem>
                <MenuItem value={'Finland'}>Finland</MenuItem>
                <MenuItem value={'Estonia'}>Estonia</MenuItem>
              </Select>
            </FormControl>
            <FormControlLabel
              control={<Switch defaultChecked />}
              label="Allow email notifications"
            />
          </Stack>
        </AccordionDetails>
      </Accordion>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls="panel2a-content"
          id="panel2a-header"
        >
          <Typography>My addresses</Typography>
        </AccordionSummary>
        <AccordionDetails>
          <List>
            <ListItem disablePadding>
              <ListItemButton>
                <ListItemIcon>
                  <HomeIcon />
                </ListItemIcon>
                {user && (
                  <ListItemText
                    primary="Home"
                    secondary={
                      user.location.street.name +
                      ' ' +
                      user.location.street.number +
                      ', ' +
                      user.location.city
                    }
                  />
                )}
              </ListItemButton>
            </ListItem>
          </List>
        </AccordionDetails>
      </Accordion>
    </div>
  )
}
