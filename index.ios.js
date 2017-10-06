import {
  NativeModules,
} from 'react-native';

export default {
  saveToCameraRoll: (tag) => {
    if ((tag.split('.').slice(-1)[0] !== 'gif' )) {
      throw new Error('Only GIF format is supported by saveToCameraRoll');
    }
    return NativeModules.RNFetchGif.saveToCameraRoll(tag);
  },
};
