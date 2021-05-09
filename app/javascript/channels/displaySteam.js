const vmsq = require('vmsq')
const displaySteam = () => {

  
  const vmsq = require('vmsq')
  const stream = vmsq('hl2master.steampowered.com:27011', vmsq.ALL, {
  appid: 686810,
  // empty: 1
  })

  const servers = []
// const displaySteam = () => {
  stream.on('error', (err) => {
  console.error(err)
  })

  stream.on('data', (ip) => {
  console.log(ip)
  servers.push(ip)
  })

  stream.on('end', () => {
  console.log(`got ${servers.length} servers`)
  })
  // console.log(stream)
}
console.log(displaySteam())
export {displaySteam};

// <%# <script src"../components/displaySteam.js">
// const vmsq = require('vmsq')

// const stream = vmsq('hl2master.steampowered.com:27011', vmsq.EUROPE, {
//   gamedir: 'cstrike',
//   map: 'de_nuke',
//   empty: 1
// })

// const servers = []

// stream.on('error', (err) => {
//   console.error(err)
// })

// stream.on('data', (ip) => {
//   console.log(ip)
//   servers.push(ip)
// })

// stream.on('end', () => {
//   console.log(`got ${servers.length} servers`)
// })
// </script> %>