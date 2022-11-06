import { Avatar, Button } from '@mui/material'
import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'
import { useEffect, useState } from 'react'
import ProfileAccordion from '../components/ProfileAccordion'
import { useNavigate } from 'react-router-dom'

const Profile = () => {
  const text = 'Profile'
  const legoImageId = Math.floor(Math.random() * 9)
  const [user, setUser] = useState(null)
  const navigate = useNavigate()

  const logOut = () => {
    window.localStorage.removeItem('session')
    navigate('/login')
    window.location.reload()
  }

  const getUser = async () => {
    const config = {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' },
    }
    const responseRaw = await fetch(
      `https://randomuser.me/api/?inc=name,email,location&nat=fi`,
      config,
    )
    const response = await responseRaw.json()
    setUser(response.results[0])
  }

  useEffect(() => {
    getUser()
  }, [])

  return (
    <Box sx={{ display: 'flex', mt: 1, p: 0, justifyContent: 'center' }}>
      <Box sx={{ display: 'flex', flexDirection: 'column', p: 0 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', p: 2 }}>
          {user && (
            <Avatar
              sx={{ width: 64, height: 64 }}
              src={'http://api.randomuser.me/portraits/lego/' + legoImageId + '.jpg'}
            />
          )}
          {user && (
            <Typography variant="h6" sx={{ px: 2 }}>
              {user.name.first}
            </Typography>
          )}
        </Box>
        <Box sx={{ display: 'flex' }}>
          <ProfileAccordion user={user} />
        </Box>
        <Button variant="outlined" onClick={logOut}>
          Log out
        </Button>
      </Box>
    </Box>
  )
}

export default Profile
