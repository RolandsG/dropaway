import React from 'react'
import CssBaseline from '@mui/material/CssBaseline'
import * as ReactDOMClient from 'react-dom/client'
import { ThemeProvider, createTheme } from '@mui/material/styles'
import { BrowserRouter } from 'react-router-dom'
import './index.css'
import App from './App'

import '@fontsource/roboto/300.css'
import '@fontsource/roboto/400.css'
import '@fontsource/roboto/500.css'
import '@fontsource/roboto/700.css'

const themeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      light: '#7BCC70',
      main: '#42C231',
      dark: '#308F24',
    },
  },
}

const theme = createTheme(themeOptions)

const container = document.getElementById('root')

const root = ReactDOMClient.createRoot(container)

root.render(
  <React.StrictMode>
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </ThemeProvider>
  </React.StrictMode>,
)
