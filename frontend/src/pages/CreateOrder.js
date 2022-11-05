import Box from '@mui/material/Container'
import Typography from '@mui/material/Typography'

const CreateOrder = () => {
  const text = 'Home page'

  return (
    <Box sx={{ display: 'flex', mt: 1, justifyContent: 'center' }}>
      <Typography variant="body1" color="grey" sx={{ fontStyle: 'italic', color: '#a3a3a3' }}>
        {text}
      </Typography>
    </Box>
  )
}

export default CreateOrder
