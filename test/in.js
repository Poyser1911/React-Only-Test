import React from 'react'
import {expect} from 'chai'
import {mount, shalow} from 'enzyme'
import Header from '../../../src/components/Header/Header';


describe('HeaderCompoment', () => {
    it('should create obj', () => {
        const wrapper = mount(Header);
        expect(Header.prototype).to.not.be.null;
    })
});