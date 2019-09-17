Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CE2B49CB
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfIQIsc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 04:48:32 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:49304 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389188AbfIQIsb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 04:48:31 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46XcG35Rf1z1rQB9;
        Tue, 17 Sep 2019 10:48:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46XcG34pQHz1qqkS;
        Tue, 17 Sep 2019 10:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id ST5qOysjaGAQ; Tue, 17 Sep 2019 10:48:26 +0200 (CEST)
X-Auth-Info: f6sv6cSG4dOXyIEsiyYRZ+Hng027v0rf1SbNmVYXKcs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 17 Sep 2019 10:48:26 +0200 (CEST)
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
References: <20190302141704.32547-1-marex@denx.de>
 <20190302141704.32547-2-marex@denx.de> <20190810164137.GQ178933@dtor-ws>
 <27428362-1bfc-de9a-da19-c47a9d483e9e@denx.de>
 <20190810174447.GR178933@dtor-ws>
 <4c284f45-fd6f-4bc1-bf58-ea9ae8c601bf@denx.de>
 <20190810190513.GS178933@dtor-ws>
 <4a1bdf7a-2d6b-0753-a5b9-f4d94f1c26a7@denx.de>
 <20190811164257.GT178933@dtor-ws>
 <7d31563e-e789-fd84-a24b-7741b75f4638@denx.de>
 <20190917032842.GL237523@dtor-ws>
From:   Marek Vasut <marex@denx.de>
Message-ID: <d1d7c0f6-f8b4-972f-95c0-80336fee0ace@denx.de>
Date:   Tue, 17 Sep 2019 10:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917032842.GL237523@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/17/19 5:28 AM, Dmitry Torokhov wrote:
> On Fri, Aug 23, 2019 at 12:34:29PM +0200, Marek Vasut wrote:
>> On 8/11/19 6:42 PM, Dmitry Torokhov wrote:
>>> On Sat, Aug 10, 2019 at 11:30:29PM +0200, Marek Vasut wrote:
>>>> On 8/10/19 9:05 PM, Dmitry Torokhov wrote:
>>>>> On Sat, Aug 10, 2019 at 08:00:14PM +0200, Marek Vasut wrote:
>>>>>> On 8/10/19 7:44 PM, Dmitry Torokhov wrote:
>>>>>>> On Sat, Aug 10, 2019 at 06:50:08PM +0200, Marek Vasut wrote:
>>>>>>>> On 8/10/19 6:41 PM, Dmitry Torokhov wrote:
>>>>>>>>> Hi Marek,
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> On Sat, Mar 02, 2019 at 03:17:04PM +0100, Marek Vasut wrote:
>>>>>>>>>> Add support for ILI2117 touch controller. This controller is similar
>>>>>>>>>> to the ILI210x and ILI251x, except for the following differences:
>>>>>>>>>> - Reading out of touch data must happen at most 300 mS after the
>>>>>>>>>>   interrupt line was asserted. No command must be sent, the data
>>>>>>>>>>   are returned upon pure I2C read of 43 bytes long.
>>>>>>>>>> - Supports 10 simultaneous touch inputs.
>>>>>>>>>> - Touch data format is slightly different.
>>>>>>>>>
>>>>>>>>> So with this and also I see there is another ili2117a submission, I do
>>>>>>>>> believe that we need to switch to using function pointers instead of
>>>>>>>>> if/else if/else style cheking of the model.
>>>>>>>>
>>>>>>>> How about we add tested functionality in first and only then do bigger
>>>>>>>> untested changes ? I think that would work better for everyone.
>>>>>>>
>>>>>>> Sorry, I would really prefer to do what is right and build additional
>>>>>>> functionality on top of the good foundation. I asked to switch to the
>>>>>>> function pointers before, but you did not want to citing performance
>>>>>>> (even though we are using function pointers everywhere in the kernel),
>>>>>>> now I gave a draft implementation, I hope you can use it.
>>>>>>
>>>>>> So why can't we add tested code in first and then add new huge untested
>>>>>> patch on top and start testing it ? I think doing it in reverse is
>>>>>> actually not helpful, if there is a problem in this massive new patch,
>>>>>> it could be reverted without losing functionality.
>>>>>
>>>>> We still have 4 weeks till merge window + stabilization time past it.
>>>>
>>>> Sure, but this patch was posted 5 months ago and was in real world
>>>> deployment since, so it has 5 months of practical testing. I don't want
>>>> to throw that away.
>>>>
>>>> The patch you want me to test can easily be rebased on the ILI2117
>>>> support and then we retain those months of testing, which I think is
>>>> much better.
>>>
>>> OK, fine, I rebased the patch[es] on top of this one and uploaded to:
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git iili2xxx-touchscreen
>>>
>>> Please give it a try and if it works I'll merge into next.
>>
>> Sorry for the delay.
>>
>> I had to revert
>> Input: ili210x - define and use chip operations structure
>> as with ^ I get no events.
> 
> Any more details? Does the driver bind to the device? Is there data
> coming form the wire and it is being consumed but not parsed properly?
> Something else?

The driver bound, there were just no data coming out of the
/dev/input/event device at all. But if I reverted this patch "Input:
ili210x - define and use chip operations structure", then I was getting
data again. So that patch is likely wrong.
