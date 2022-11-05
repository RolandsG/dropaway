const baseUrl = process.env.REACT_APP_BASE_URL

// {"pickup": "brivibas 90", "dropoff": "tomsona 32"}

const getDeliveryFee = async ({ pickup, dropoff }) => {
  const config = {
    method: 'GET',
    headers: { 'Content-Type': 'application/json' },
  }
  const responseRaw = await fetch(
    `${baseUrl}/api/v1/core/delivery-fee?pickup=${pickup}&dropoff=${dropoff}`,
    config,
  )
  const response = await responseRaw.json()
  return response
}

/* eslint import/no-anonymous-default-export: [2, {"allowObject": true}] */
export default {
  getDeliveryFee,
}
