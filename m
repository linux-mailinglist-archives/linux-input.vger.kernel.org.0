Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C592E35F241
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 13:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348968AbhDNLXU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 07:23:20 -0400
Received: from smtpcmd01-sp1.aruba.it ([62.149.158.218]:49682 "EHLO
        smtpcmd01-sp1.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348948AbhDNLXU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 07:23:20 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WdbjllVNnkdBBWdbkl2XjH; Wed, 14 Apr 2021 13:22:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618399377; bh=0F+vBt2TA34xwOMDg/rFjQNTe2kOJ5mDE5te0iNhXEY=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=GTALKCDYaxeYuVDCyggMObVlGXrqVxKKYCYtbBDS7S/XJ2MCfs15CkYR0vBUfQuYu
         78p5qNX91vwWQAdONSIysEiNYSGrSNdBcDYOV0Il2bEmYe/7hCQ1rDmp6U8wQlglN1
         O9UrJHu0CntpsFmsheAduFLWES5nWfzqUBTj1jlhbTJF8yGEqiIO+N7VlsH1Y22B69
         B/is15dvY6hRgr8wL/XfOprDlzCTlJyiUSsgiKbEZyMxa6Lc8Op/49Oq1585PIbfoX
         dbwJsI01Lu6YCxbgFSUtmqdY2hGOrafFlE+HiDLYMTtepagTw8gFoC65jgNEzgKv5z
         Qj1EIxHju9Kcg==
Subject: Re: [PATCH v7 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
 <YHaBJ6MX9c28MUQY@google.com> <YHaP1Fzsi5pSaEq3@koala>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <080a71d9-d629-5589-c943-4e65a7f414d8@benettiengineering.com>
Date:   Wed, 14 Apr 2021 13:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHaP1Fzsi5pSaEq3@koala>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM7avIgFexNNvYx1guTyVc0Xmp2xddnI0yXtpkWYal7MGcfx7EvEZDqXSh7odITtGiUqYV1J1BX+HN9jGj/Zm730JLoyQ88cL9VfD5Rp4MAIcH+LYOGN
 2yWnnZkFcGp6L3L5/RkPTOImvvxeuILImclUFkVK3flqLQX9BuSzN2amk7oWj0rN+ACpeRN7rYEH0nFp7WU9dK3RzJAL+BTE5LwZdQwW8m1PcbpR54Svkf4Q
 2pBtnCJPBN1lM+oBs1bqY3oDndEImaHzbul1oBT97VgN+tt1e3Eg++Q3yG76qtZzk7tgqlziZKnPXypKwsdkqwUSKt7Gk0kppvbyP2ilVsj6v8h1JD0zperH
 l2qAYeXUn8pfq3Z0JUEEepTSjUTVfxZOdqpVSRmYPVcUWyvajOLn/0nwvOWE3L2lzXKPe2F92HYit+6GImKFObbarQvz7FFldx7tI6kuPeTd0A6TOYM=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter, Dmitry,

On 4/14/21 8:46 AM, Peter Hutterer wrote:
> On Tue, Apr 13, 2021 at 10:44:07PM -0700, Dmitry Torokhov wrote:
>> Hi Giulio,
>>
>> On Tue, Apr 13, 2021 at 04:44:46PM +0200, Giulio Benetti wrote:
>>> +
>>> +	input_mt_report_pointer_emulation(tsdata->input, true);
>>
>> For touchscreens it does not make much sense to report BTN_DOUBLETAP,
>> BTN_TRIPLETAP, etc, events (they are really for touchpads), so I changed
>> this to
>>
>> 	input_mt_report_pointer_emulation(tsdata->input, false);
>>
>> to only report ABS_X, ABS_Y, and BTN_TOUCH, and applied.
> 
> Can you expand on this please, just to make sure I'm not misinterpreting
> those codes? Those bits are just for how many fingers are down (but without
> position), dropping those bits means you restrict the device to a pure
> single-touch screen. Or am I missing something here?

I've re-tested the driver after setting 
input_mt_report_pointer_emulation() use_count to false. It works 
correctly with all touch points expected. That use_count refers to 
finger count of Touchpad[1]. Also you can see that even with 
use_count=false this for loop[2] is entered by counting all the 
mt->slots and then input_event() reports all of them.

I hope I've understood correctly :-)

[1]: 
https://elixir.bootlin.com/linux/v5.12-rc7/source/drivers/input/input-mt.c#L190
[2]: 
https://elixir.bootlin.com/linux/v5.12-rc7/source/drivers/input/input-mt.c#L208

> then again, MT support has been in the kernel for long enough that by now
> everything should understand it, so there's a certain "meh" factor.
> 
> Cheers,
>     Peter
> 

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
