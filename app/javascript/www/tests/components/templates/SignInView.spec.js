import { shallowMount, createLocalVue } from '@vue/test-utils';
import flushPromises from 'flush-promises'
import VueRouter from 'vue-router'

import SignInView from '../../../components/templates/SignInView.vue';
import Authorization from '../../../api/authorization'
jest.mock('../../../api/authorization')

Authorization.signIn.mockImplementation(({}) => {
  return Promise.resolve('')
})

const localVue = createLocalVue()
localVue.use(VueRouter)
const router = new VueRouter()

describe('Vue', () => {
  it('ページを表示', () => {
    const wrapper = shallowMount(SignInView);
    expect(wrapper.text()).toMatch('メールアドレス');
  });

  it('ログインボタンが正常に動作する', async () => {
    const wrapper = shallowMount(SignInView, { localVue, router });
    wrapper.find('button').trigger('click')
    await flushPromises()
    expect(wrapper.text()).toMatch('メールアドレス');
  });
});
