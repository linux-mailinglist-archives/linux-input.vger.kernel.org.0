Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490FF219B6F
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 10:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgGIIuF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 04:50:05 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:58709 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726140AbgGIIuF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Jul 2020 04:50:05 -0400
Received: from [192.168.0.6] (ip5f5af27e.dynamic.kabel-deutschland.de [95.90.242.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9EF36206442F5;
        Thu,  9 Jul 2020 10:50:02 +0200 (CEST)
Subject: Re: i8042 AUX port [serio1] suspend takes a second on Dell XPS 13
 9360
To:     Mario Limonciello <mario.limonciello@dell.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        it+linux-input@molgen.mpg.de, linux@leemhuis.info
References: <5a74e1a7-2083-c6b2-f51a-f44908ac8bc4@molgen.mpg.de>
 <20180130175017.72inurhk5l7tcvae@dtor-ws>
 <20180130180736.ehucqywbz7zdl4v7@dtor-ws>
 <f02b699d-b130-c09f-3e09-db62ecf2df2c@molgen.mpg.de>
 <609c1f35df7346da8ac1d12c35e04cf7@ausx13mpc120.AMER.DELL.COM>
 <b9223169-2282-4ada-999a-7f50d205ca7d@molgen.mpg.de>
 <33355407b8d74575bab0c36e442141ea@ausx13mpc120.AMER.DELL.COM>
 <9e83b8b4-7ea5-d286-a559-66e000df7da1@molgen.mpg.de>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <a1ef8c9e-14e5-11c4-d7d5-52225027b6b1@molgen.mpg.de>
Date:   Thu, 9 Jul 2020 10:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9e83b8b4-7ea5-d286-a559-66e000df7da1@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Dmitry, dear Mario,


Am 21.02.18 um 10:22 schrieb Paul Menzel:

> Am 15.02.2018 um 16:22 schrieb Mario.Limonciello@dell.com:
>>> -----Original Message-----
>>> From: Paul Menzel [mailto:pmenzel+linux-input@molgen.mpg.de]
>>> Sent: Thursday, February 15, 2018 2:26 AM
>>> On 02/14/18 18:11, Mario.Limonciello@dell.com wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Paul Menzel [mailto:pmenzel+linux-input@molgen.mpg.de]
>>>>> Sent: Wednesday, February 14, 2018 10:41 AM
>>>
>>>>> On 01/30/18 19:07, Dmitry Torokhov wrote:
>>>>>> On Tue, Jan 30, 2018 at 09:52:45AM -0800, Dmitry Torokhov wrote:
>>>>>
>>>>>>> On Tue, Jan 30, 2018 at 06:36:34PM +0100, Paul Menzel wrote:
>>>>>
>>>>>>>> I do not know, when it started, but with Linux 4.14-rc8 and 4.15,
>>>>>>>> benchmarking suspend and resume time with `sleepgraph.py` [1][2], there is a
>>>>>>>> regression, that i8042 AUX port [serio1] suspend takes a second on Dell XPS
>>>>>>>> 13 9360 and TUXEDO Book 1406.
>>>>>>>
>>>>>>> It would be really helpful to know when the regression started.
>>>>>>
>>>>>> So the reason it takes longer is because the touchpad does not 
>>>>>> want to talk to us for some reason and we wait until commands time out:
>>>>>>
>>>>>> [   94.591636] calling  serio1+ @ 2299, parent: i8042
>>>>>> [   94.794292] psmouse serio1: Failed to disable mouse on isa0060/serio1
>>>>>> [   95.593303] call serio1+ returned 0 after 974280 usecs
>>>>>>
>>>>>> but it is not clear why it happens, I do not think we changed anything
>>>>>> in that path for a while, so it might be some other change affecting
>>>>>> things indirectly. I'm afraid you'll have to narrow the scope, and
>>>>>> ideally bisect.
>>>>
>>>> Please keep in mind the XPS 9360 has a touchpad that can operate in I2C
>>>> or PS2 modes.  It's connected to both buses and with the right initialization
>>>> sequence will come up in I2C mode.
>>>>
>>>> Assuming Paul M. has compiled and used hid-multitouch and i2c-hid the
>>>> touchpad should be operating in I2C mode.
>>>>
>>>> When this happens I expect that the touchpad shouldn't be responding
>>>> to PS2 commands.
>>>>
>>>> As a debugging tactic, you may consider to unload psmouse before
>>>> suspend and still see the touchpad operational.
>>>
>>> Thank you! Unloading *psmouse* with `sudo modprobe -r psmouse` indeed
>>> worked on the Dell XPS 13 9360, that means, the cursor is still 
>>> functioning.
>>>
>>>>> Thank you for your replies. First of all, it looks like *only* the Dell
>>>>> system is effected as I was unable to reproduce it on the TUXEDO Book
>>>>> 1406. I have to verify that by finding old log files.
>>>>
>>>> Does this other laptop you are drawing a comparison to also have a
>>>> touchpad that can operate in multiple modes?
>>>>
>>>> To make an accurate comparison you should determine what mode it's in.
>>>
>>> Yeah, removing the module *psmouse*, the cursor didn’t work there
>>> anymore. I was really sure, that I saw that problem once on the TUXEDO
>>> device too, but must have been mistaken, that’s why I corrected it.
>>> Sorry for the misunderstanding.
>>>
>>> So, why does *psmouse* get loaded on the Dell XPS 13 9360 since at least
>>> Linux 4.13? Or where the modules added causing the touchpad to operate
>>> in I2C mode, which causes PS2 to stop to work?
>>
>> It was like that before this laptop even launched to the market.
>> It's been like that since way before 4.13.  I want to say maybe 
>> 3.13ish is when
>> I2C mode would come up instead.
> 
> Indeed, analyzing the behavior on the current 8th generation Dell XPS 13 
> 93*7*0 with the shipped Ubuntu with Linux 4.4.0-112-generic, the same 
> delay is visible.
> 
>> The order of events goes something like this:
>> 1) Touchpad is initially in PS2 mode
>> 2) psmouse loads
>> 3) It reports that it may be supportable by a different bus
>> 4) The sequence to switch to I2C mode happens
>> 5) i2c-hid and hid-multitouch get loaded
>> 6) psmouse is no longer functional
>>
>> Dmitry is there a way that we can connect the two events?  When 
>> i2c-hid finds
>> the touchpad notify psmouse to unload or at least stop trying to 
>> access it to prevent
>> the problem Paul is talking about with suspend?
> 
> That would be great. Please tell me, if there is a bug tracker, where 
> this issue should reported to to track it.

The issue is still present with Linux 5.8-rc4. Does Mario’s plan sound 
feasible?


Kind regards,

Paul
