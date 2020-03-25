Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D391927E8
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 13:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCYMN2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 08:13:28 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:55231 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgCYMN2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 08:13:28 -0400
IronPort-SDR: 4NntKNMwAeFnkYAEAgljL50YrhiRHC/zhuOgrCjV2tZkC+lrX3TKdHnlhtJqtm71nfd58YAQAi
 G7o1pbcefvMSwUwiBPzFWrjUR83wgI2jLuOSJfeUdFqsFQdrIpV+BNEUT/zVRrAfd3mN7vAyK4
 SkoqnB9fD12VEQFOjxwMG9D757kVXzXwG8oKbdgzsVNWYYtgivN0fPmLlfGE8RYQesL2blgyjU
 mSpymhsvFRVYsDTaUFLUN27JenaDZs9rrC718eG2Gh9UVXyVMyOuz9P5wU1vFEnQSKxsi5c+EE
 K4Q=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="49056887"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 25 Mar 2020 04:13:27 -0800
IronPort-SDR: sqayK+8xJmiqpMUYpqK7uCRGuIZVkfrcbZpQzhMac03DRzoGluwB440yfTj6j1I99kH4GP4qZ1
 vKl52/R5wRnC+ZaEiBVh0eKSgdSFnIRf6LscdNryW0cVuT4CsEj2iVl0GblZbga4dVhsJzLyPB
 wJ2HCQnAZe3FX2BqdhKXQry3b+k6Deah8AKPYksbF00XB6KYwleg0PqzXrGZxOSfCxtsMFzMXK
 xXoBycU8W4Z5fFIUj3xtrXUDjO3gW81CgkuakO+wAVOgcY60w7b2EL9YNwj40I1i2eqrXrmECz
 g1Q=
Subject: Re: [PATCH v7 00/48] atmel_mxt_ts misc
To:     Dmitry Osipenko <digetx@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <rydberg@bitmath.org>,
        <dmitry.torokhov@gmail.com>, <nick@shmanahar.org>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <c583d151-9243-cbde-a04b-bc0389d9be5a@gmail.com>
 <89e4bb0b-b2eb-0b67-4307-fb2af914b1c0@mentor.com>
 <f9b221e7-f189-3e47-adab-1cbc49490d4b@gmail.com>
 <bd3c487b-b065-3e4f-6ab1-f344a4113fcd@mentor.com>
 <5d8fdfc1-cc95-59db-b83e-87bb16ea79e8@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <4d39b644-7fcb-427e-7110-c61fb36122f5@mentor.com>
Date:   Wed, 25 Mar 2020 21:13:09 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5d8fdfc1-cc95-59db-b83e-87bb16ea79e8@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/03/24 23:54, Dmitry Osipenko wrote:
> 23.03.2020 05:25, Wang, Jiada пишет:
>> Hello Dmitry
>>
>> On 2020/03/21 0:53, Dmitry Osipenko wrote:
>>> Hello Jiada,
>>>
>>> 20.03.2020 06:37, Wang, Jiada пишет:
>>>> Hello Dmitry
>>>>
>>>> I have submitted v8 patch-set to address your comments towards v7
>>>> patch-set,
>>>> most of checkpatch warnings and errors have been addressed,
>>>>
>>>> But I didn't update for following two types of warnings
>>>> since I want to keep consistency with legacy code
>>>>
>>>> WARNING: DEVICE_ATTR unusual permissions '0600' used
>>>> #290: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3761:
>>>> +static DEVICE_ATTR(debug_v2_enable, 0600, NULL,
>>>
>>> What will happen if you'll use 0644? Will an empty line be returned or
>>> driver will crash?
>>>
>> debug_v2_enable doesn't have .show callback implemented, so after change
>> permission to 644, read of it results in an I/O error,
>>
>> for other 0600 permission interfaces (t38_data, t25 and debug_enable)
>> added in this series,
>> change to 644 can return expected information when read.
>>
>> Do you think it's better to change debug_v2_enable to 0200,
>> and others to 0644?
> 
> Since the debug_enable has mxt_debug_enable_show(), the same should be
> done for debug_v2_enable, for consistency.
> 
> The permissions should be 0644 for everything that is read/write.
> 
> The 0200 should be used for everything that is root-only and write-only.

Thanks for your comments and suggestion in another email,
I will submit v9 patch-set to address these warnings

Thanks,
Jiada
> 
