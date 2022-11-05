import { useState } from 'react'
import PropTypes from 'prop-types'
import Box from '@mui/material/Container'
import LoginForm from '../components/LoginForm'
import Tabs from '@mui/material/Tabs'
import Tab from '@mui/material/Tab'
import RegisterForm from '../components/RegisterForm'

const Login = () => {
  const [value, setValue] = useState(0)

  const handleChange = (event, newValue) => {
    setValue(newValue)
  }

  const TabPanel = (props) => {
    const { children, value, index, ...other } = props

    return (
      <div
        role="tabpanel"
        hidden={value !== index}
        id={`simple-tabpanel-${index}`}
        aria-labelledby={`simple-tab-${index}`}
        {...other}
      >
        {value === index && <Box sx={{ p: 3 }}>{children}</Box>}
      </div>
    )
  }

  TabPanel.propTypes = {
    children: PropTypes.node,
    index: PropTypes.number.isRequired,
    value: PropTypes.number.isRequired,
  }

  return (
    <Box
      sx={{
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '80vh',
        m: 0,
        p: 0,
      }}
    >
      <Tabs value={value} onChange={handleChange} aria-label="basic tabs example">
        <Tab label="Login" />
        <Tab label="Sign Up" />
      </Tabs>
      <TabPanel value={value} index={0}>
        <LoginForm />
      </TabPanel>
      <TabPanel value={value} index={1}>
        <RegisterForm />
      </TabPanel>
    </Box>
  )
}

export default Login
