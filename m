Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 476AF163AA2
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2020 04:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgBSDBg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 22:01:36 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:52989 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbgBSDBg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 22:01:36 -0500
X-Originating-IP: 75.128.139.191
Received: from [10.0.3.11] (75-128-139-191.dhcp.bycy.mi.charter.com [75.128.139.191])
        (Authenticated sender: phollinsky@holtechnik.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B61871BF204;
        Wed, 19 Feb 2020 03:01:32 +0000 (UTC)
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
Cc:     Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
 <20200127022448.GC184237@dtor-ws>
 <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
 <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
 <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
 <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
 <0da4c22b-efb0-fccc-fd99-cdb398e1df8c@synaptics.com>
 <20200201013852.GG184237@dtor-ws>
From:   Paul Hollinsky <phollinsky@holtechnik.com>
Message-ID: <1f6b0b96-d6fb-7e76-afdd-0ff405e3e84a@holtechnik.com>
Date:   Tue, 18 Feb 2020 22:01:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200201013852.GG184237@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 1/31/2020 8:38 PM, Dmitry Torokhov wrote:
> On Fri, Jan 31, 2020 at 10:28:23AM -0800, Andrew Duggan wrote:
>> On 1/28/20 9:22 AM, Christopher Heiny wrote:
>>> On Tue, 2020-01-28 at 10:41 +0100, Lucas Stach wrote:
>>>> CAUTION: Email originated externally, do not click links or open
>>>> attachments unless you recognize the sender and know the content is
>>>> safe.
>>>>
>>>>
>>>> Hi Christopher,
>>>>
>>>> On Di, 2020-01-28 at 07:02 +0000, Christopher Heiny wrote:
>>>>> On Mon, 2020-01-27 at 11:21 -0800, Andrew Duggan wrote:
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 1/26/20 6:24 PM, Dmitry Torokhov wrote:
>>>>>>> On Mon, Jan 20, 2020 at 12:16:28PM +0100, Lucas Stach wrote:
>>>>>>>> When the distance thresholds are set the controller must be
>>>>>>>> in
>>>>>>>> reduced
>>>>>>>> reporting mode for them to have any effect on the interrupt
>>>>>>>> generation.
>>>>>>>> This has a potentially large impact on the number of events
>>>>>>>> the
>>>>>>>> host
>>>>>>>> needs to process.
>>>>>>>>
>>>>>>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>>>>>>> ---
>>>>>>>> I'm not sure if we want a separate DT property to allow the
>>>>>>>> use
>>>>>>>> of
>>>>>>>> reduced reporting mode, as this change might lead to problems
>>>>>>>> for
>>>>>>>> controllers with unreasonably large threshold values. I'm not
>>>>>>>> sure if
>>>>>>>> any controller with bogus threshold values exist in the wild.
>>>>>>>> ---
>>>>>>> Andrew, any feedback on this patch?
>>>>>>>
>>>>>>> Thanks!
>>>>>> The RMI4 spec does say that delta X/Y thresholds are only used in
>>>>>> reduced reporting mode, so this patch is needed for the threshold
>>>>>> values
>>>>>> to have an effect.
>>>>>>
>>>>>> Reviewed-by: Andrew Duggan <aduggan@synaptics.com>
>>>>>>
>>>>>> Because reduced reporting mode is so dependent on these
>>>>>> thresholds,
>>>>>> my
>>>>>> opinion is that it is better not to add a separate DT property,
>>>>>> but
>>>>>> to
>>>>>> instead control reduced reporting mode through the setting of
>>>>>> these
>>>>>> thresholds. My guess is that the if reduced reporting is not
>>>>>> enabled
>>>>>> in
>>>>>> the firmware by default, then the thresholds may not be valid.
>>>>>> Setting
>>>>>> the thresholds to 0 will essentially disable reduced reporting
>>>>>> mode.
>>>>>> So
>>>>>> that would be how a user could disable reduced reporting mode
>>>>>> without
>>>>>> a
>>>>>> separate DT property. Chris, do you have an opinion on this?
>>>>>> Anything
>>>>>> I
>>>>>> overlooked?
>>>>> Hi Dmitry, Andrew, Lucas,
>>>>>
>>>>> I'm in agreement with Andrew on this.  Having two ways to
>>>>> enable/disable reduced reporting (that is, both the DT property and
>>>>> the
>>>>> thresholds) could lead to confusion and unexpected
>>>>> behavior.  Simpler
>>>>> is better, in my opinion.
>>>>>
>>>>> However, in that case I'm a little concerned about the logic in the
>>>>> patch below.  When either of the thresholds are set to non-zero, we
>>>>> clear the report mask and then enable the reduced reporting bit.
>>>>> Subsequently setting both thresholds to zero will disable reduced
>>>>> reporting, but will not enable another report mode.  Unless there
>>>>> is
>>>>> code elsewhere to catch this case (and if there is, it seems like a
>>>>> bad
>>>>> idea to be handling this in two different places), it could result
>>>>> in
>>>>> the touchpad being disabled.
>>>>>
>>>>> As a hypothetical instance of this, imagine a user using the
>>>>> touchpad
>>>>> to manipulate report threshold sliders in a GUI.  Setting both
>>>>> sliders
>>>>> to zero would disable the touch sensor reporting, potentially
>>>>> leaving
>>>>> the user with a dead touch sensor and no easy way to recover from
>>>>> that.
>>>> I can see how this would be a problem, but then I see no interface in
>>>> the driver to actually change the threshold values on the fly. They
>>>> are
>>>> either set by firmware or specified via DT properties. So I don't see
>>>> how the threshold values would change on an active device. Anything
>>>> i'm
>>>> overlooking?
>>> Hi Lucas,
>>>
>>> You're not overlooking anything.  Mainly it's me being a worry-wart,
>>> and assuming that if something can be adjusted, someone will eventually
>>> come along and add a sysfs interface to adjust it, and then someone
>>> else will create a userspace tool to adjust it, and things will break.
>>>
>>> If you guys are OK with Andrew's original evaluation, then you can
>>> ignore my worry (which is, as admitted, entirely a hypothetical).
>>>
>>> 					Cheers,
>>> 						Chris
>> Currently, the driver only sets the thresholds in rmi_f11_initialize(). If
>> someone were to decide to add another method for setting the thresholds they
>> would probably remove the logic from rmi_f11_initialize() and put it in a
>> new function so that the code can be called from multiple places. In that
>> case, they should also include the code in this patch in the new function. I
>> think the comment above the new code makes it clear that setting the
>> reporting mode to reduced reporting is needed for the threshold values to be
>> used by the firmware. I don't see a way to handle potential future changes
>> without adding what may be unnecessary complexity. I reaffirm my review sign
>> off.
> Applied, thank you everyone.
>

Hi everyone,

I believe there may be an issue with the reduced reporting mode, at 
least on my machine. I have a Lenovo ThinkPad X250 with the Synaptics 
TM3075-002 trackpad.

With this patch, the trackpad becomes unusable. On a reboot, my control 
register values are [38 00 19 19 00 10 90 06 ea 03 0f 01]. This 
corresponds to a delta X/Y threshold of 25 and a palm rejection value of 
0. The protocol documentation mentions that the palm rejection value 
becomes active when in reduced reporting mode, hence its inclusion here.

Sometimes I could get the mouse to move very sporadically if I used my 
entire hand on the trackpad. I instrumented the f11_attention IRQ 
handler and found that it was not being called except for these sporadic 
movements. I tried a few different combinations of these three values, 
but they had no effect. This included setting all three values to 0, 
which in theory will yield the same behavior as continuous reporting 
mode, but it did not on my machine.

This leads me to suspect a hardware/firmware bug.

I believe the idea was that the platform/configuration could set 
sensor->axis_align.delta_x(/y)_threshold to 0 in order to disable the 
reduced reporting mode. This is the case on my laptop, but only a 
nonzero value will override the value from the firmware, so the reduced 
reporting mode still gets enabled.

All the best,
Paul
