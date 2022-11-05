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

const orderItem = async ({ itemId, dropoff }) => {
  const user = window.localStorage.getItem('session')
  const coreConfig = {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(!!user && { Authorization: `Token ${user}` }),
    },
  }
  const woltConfig = {
    method: 'GET',
    headers: { 'Content-Type': 'application/json' },
  }

  const coreResponseRaw = await fetch(`${baseUrl}/api/v1/core/order-item/${itemId}/`, coreConfig)
  const coreResponse = await coreResponseRaw.json()

  if (coreResponseRaw.status === 200 && coreResponse.status === 'SCHEDULED') {
    const woltResponseRaw = await fetch(
      `${baseUrl}/api/v1/core/delivery-order?item_id=${itemId}&dropoff=${dropoff}`,
      woltConfig,
    )
    const woltResponse = await woltResponseRaw.json()
    return woltResponse
  }
}

/* eslint import/no-anonymous-default-export: [2, {"allowObject": true}] */
export default {
  getDeliveryFee,
  orderItem,
}
