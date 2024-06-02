import en from './en/en.json' assert { type: 'JSON' };
import elements_en from 'element-ui/lib/locale/lang/en';

const localized_en = { ...en, ...elements_en };
export { localized_en as en };
