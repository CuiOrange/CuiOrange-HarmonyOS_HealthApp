/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ACHIEVEMENT_LEVEL_LIST } from './TaskInitList';
import GlobalInfo from '../viewmodel/GlobalInfo';
import GlobalInfoApi from '../common/database/tables/GlobalInfoApi';
import TaskInfo from '../viewmodel/TaskInfo';
import TaskInfoApi from '../common/database/tables/TaskInfoApi';
import {HomeStore} from '../viewmodel/HomeViewModel'
export const ACHIEVEMENT_LEVEL_KEY = 'AchievementLevelKey';
export const SINGLE_ACHIEVEMENT_LEVEL_KEY = 'SingleAchievementLevelKey';
// 获取天数成就
export function getDayAchievementLevel() {
  GlobalInfoApi.query((res: GlobalInfo) => {
    let globalInfo: GlobalInfo = res;
    let achievementStr = globalInfo.achievements ?? '';
    let achievements = achievementStr.split(',');
    if (achievements.length > 0) {
      AppStorage.set<Number>(ACHIEVEMENT_LEVEL_KEY, Number(achievements[achievements.length - 1]));
    }
  })
}

// // 获取单项成就
// export function getSingleAchievementLevel() {
//   const now=new Date();
//   TaskInfoApi.query(now.toString(),true,(res:TaskInfo)=>{
//     let taskInfo: TaskInfo = res;
//     let fin=Number(taskInfo.finValue);
//     let tar=Number(taskInfo.targetValue);
//     let rate=fin/tar;
//     if(rate>=1&&rate<2){
//       // 100%达成
//       AppStorage.set<Number>(SINGLE_ACHIEVEMENT_LEVEL_KEY, 1);
//     }else if(rate>=2&&rate<4){
//       // 200%达成
//       AppStorage.set<Number>(SINGLE_ACHIEVEMENT_LEVEL_KEY, 2);
//     }else if(rate>=4&&rate<5){
//       // 400%达成
//       AppStorage.set<Number>(SINGLE_ACHIEVEMENT_LEVEL_KEY, 4);
//     }
//   })
// }


// 天数成就
export function isReachNewDayAchievement(globalInfo: GlobalInfo): boolean {
  let achievementStr = globalInfo.achievements ?? '';
  let achievements = achievementStr.split(',');
  if (ACHIEVEMENT_LEVEL_LIST.indexOf(globalInfo.checkInDays) >= 0 &&
    achievements.indexOf(String(globalInfo.checkInDays)) < 0) {
    return true;
  }
  return false;
}
