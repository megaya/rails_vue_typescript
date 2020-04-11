import {shallowMount} from '@vue/test-utils';
import SignInView from '../../../components/templates/SignInView.vue';

describe('Vue', () => {
  it('shallowMount', () => {
    const wrapper = shallowMount(SignInView);
    expect(wrapper.text()).toMatch('メールアドレス');
  });
});
