import axios from './axios'

export default {
  signIn: ({ email, password }: { email: string, password: string }): Promise<{}> => {
    return axios.post(`/auth/sign_in`, {
      email: email,
      password: password,
    })
  },
}