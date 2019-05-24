Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4F2B29085
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 07:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387660AbfEXFvK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 01:51:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41282 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfEXFvK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 01:51:10 -0400
Received: from [125.35.49.90] (helo=[10.0.0.21])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hU36f-00007q-ER; Fri, 24 May 2019 05:51:05 +0000
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6?=
 =?UTF-8?Q?_alps-fix_the_issue_the_special_alps_trackpoint_do_not_work=2e?=
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        dmitry.torokhov@gmail.com, XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali> <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
Date:   Fri, 24 May 2019 13:50:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524053648.GA16379@jelly>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/5/24 下午1:36, Peter Hutterer wrote:
> On Fri, May 24, 2019 at 01:25:52PM +0800, Hui Wang wrote:
>> On 2019/5/23 下午2:01, Peter Hutterer wrote:
>>> On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
>>>> On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
>>>>> Hi Pali,
>>>>>
>>>>> Ok, and cannot you set ALPS_DUALPOINT flag based on that
>>>>> alps_check_is_trackpoint() result and then update
>>>>> alps_process_packet_ss4_v3() code to supports also
>>>>> V8 trackpoint packets?
>>>>> --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
>>>>>         Then we choose the standard mouse driver.
>>>> Mouse speed is something which is configurable. Have you configured it
>>>> somehow? Also there is libinput project should handle these settings
>>>> more properly.
>>>>
>>>> Adding Peter Hutterer, maintainer of libinput to loop. I think he could
>>>> help with this problem.
>>> libinput has a quirk for a magic multiplier on trackpoints. it was the only
>>> solution I found that came close to "working" given that every device seems
>>> to provide some other random magic data. Doc for it is here:
>>> https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html
>> Hello Peter Hutterer,
>>
>> To adjust the trackpoint speed from userspace:
>>
>> If the libinput version is lower than 1.9.0, we could set
>> POINTINGSTICK_CONST_ACCEL=0.25
>>
>> If the libinput version is higher than 1.12.0, we could set
>> AttrTrackpointMultiplier=0.25
>>
>> But if we use libinput-1.10.0,  how could we adjust the speed?
> The LIBINPUT_ATTR_TRACKPOINT_RANGE property, which didn't end up working
> well (hence why it got replaced again). See the docs here though:
> https://wayland.freedesktop.org/libinput/doc/1.10.0/trackpoints.html
>
> Cheers,
>     Peter

OK, got it, Thanks.


>>> There are also different speeds depending on which xorg driver you'd use (or
>>> libinput/Wayland), so a "mouse speed is not ideal" is almost a guarantee,
>>> given a large enough variety of setups :) That's why we have the speed
>>> toggle, but I'm happy to hear any suggestions on how to make the trackpoint
>>> more useful (in libinput anyway).
>>>
>>>> I do not think it is a good idea to force back to generic PS/2 mouse
>>>> driver for touchpads and trackpoints. Native drivers for touchpads and
>>>> trackpoints supports multitouch, absolute reporting and lot of other
>>>> things... Also calculation of mouse speed from absolute positions on
>>>> touchpads can be more easily fixed as from emulated relative movements.
>>> Yeah, agree. Using PS/2 mouse drivers means you lose *all* the extra
>>> features touchpads have like palm detection, tapping, scrolling, gestures,
>>> etc.
>>>
>>> Cheers,
>>>      Peter
>>>
>>>> Dmitry, what is your opinion about this problem? What should psmouse.ko
>>>> do in this situation? Disallow usage of absolute mode and force bare
>>>> PS/2 relative mode?
