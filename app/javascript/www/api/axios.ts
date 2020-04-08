import axios from 'axios'

export default axios.create({
  baseURL: `${process.env.BASE_URL}/api/www/`,
  headers: {
    'Content-Type': 'application/json',
  },
  responseType: 'json'
});