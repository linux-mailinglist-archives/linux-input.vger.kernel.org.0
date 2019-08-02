Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961B67F723
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2019 14:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731445AbfHBMpG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Aug 2019 08:45:06 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:40260 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730003AbfHBMpG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 2 Aug 2019 08:45:06 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 1CF12A2467;
        Fri,  2 Aug 2019 14:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1564749903;
        bh=nvQUfKP+YLUvGkf2Egb3la6Tmn8eCU9WiK5TjnwIgDc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ea9qyXXpqHlROgmKsP9rS6PDmtn/V6oA/bX/euvhuFlge7fnjadjRf3412MNNFenT
         fsfYSE+sYfl4jOVp6daeoVzB96c4Ssy+wJGNyJTay2crCEpcKUtjuBb6ZTM8GiUt+m
         b6SpxHhkXvRAdHFRnG3FTaUP1Mq6ny7TlNeAHTZI=
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <20190521053705.GI183429@dtor-ws>
 <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
 <20190725085753.GA26665@penguin>
 <ac436c3c-fa89-f777-85b2-f38adf842e10@ysoft.com>
 <20190725144009.GA27432@penguin>
 <dcee1139-c53f-5ea0-f387-a3aa5a9bf39f@ysoft.com>
 <20190727073156.GA795@penguin>
 <f06a913e-09aa-3225-a495-bb290ee2bb6f@ysoft.com>
 <20190801234954.GA178933@dtor-ws>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <f240ecdf-b142-02f0-2e1a-655693f4fa30@ysoft.com>
Date:   Fri, 2 Aug 2019 14:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801234954.GA178933@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02. 08. 19 1:49, Dmitry Torokhov wrote:
> On Tue, Jul 30, 2019 at 11:25:49AM +0200, Michal Vokáč wrote:
>> On 27. 07. 19 9:31, Dmitry Torokhov wrote:
>>> On Fri, Jul 26, 2019 at 01:31:31PM +0200, Michal Vokáč wrote:
>>>> On 25. 07. 19 16:40, Dmitry Torokhov wrote:
>>>>> On Thu, Jul 25, 2019 at 02:58:02PM +0200, Michal Vokáč wrote:
>>>>>> On 25. 07. 19 10:57, Dmitry Torokhov wrote:
>>>>>>> Hi Michal,
>>>>>>>
>>>>>>> On Tue, May 21, 2019 at 08:51:17AM +0200, Michal Vokáč wrote:
>>>>>>>> On 21. 05. 19 7:37, Dmitry Torokhov wrote:
>>>>>>>>> Hi Michal,
>>>>>>>>>
>>>>>>>>> On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> I have to deal with a situation where we have a custom i.MX6 based
>>>>>>>>>> platform in production that uses the MPR121 touchkey controller.
>>>>>>>>>> Unfortunately the chip is connected using only the I2C interface.
>>>>>>>>>> The interrupt line is not used. Back in 2015 (Linux v3.14), my
>>>>>>>>>> colleague modded the existing mpr121_touchkey.c driver to use polling
>>>>>>>>>> instead of interrupt.
>>>>>>>>>>
>>>>>>>>>> For quite some time yet I am in a process of updating the product from
>>>>>>>>>> the ancient Freescale v3.14 kernel to the latest mainline and pushing
>>>>>>>>>> any needed changes upstream. The DT files for our imx6dl-yapp4 platform
>>>>>>>>>> already made it into v5.1-rc.
>>>>>>>>>>
>>>>>>>>>> I rebased and updated our mpr121 patch to the latest mainline.
>>>>>>>>>> It is created as a separate driver, similarly to gpio_keys_polled.
>>>>>>>>>>
>>>>>>>>>> The I2C device is quite susceptible to ESD. An ESD test quite often
>>>>>>>>>> causes reset of the chip or some register randomly changes its value.
>>>>>>>>>> The [PATCH 3/4] adds a write-through register cache. With the cache
>>>>>>>>>> this state can be detected and the device can be re-initialied.
>>>>>>>>>>
>>>>>>>>>> The main question is: Is there any chance that such a polled driver
>>>>>>>>>> could be accepted? Is it correct to implement it as a separate driver
>>>>>>>>>> or should it be done as an option in the existing driver? I can not
>>>>>>>>>> really imagine how I would do that though..
>>>>>>>>>>
>>>>>>>>>> There are also certain worries that the MPR121 chip may no longer be
>>>>>>>>>> available in nonspecifically distant future. In case of EOL I will need
>>>>>>>>>> to add a polled driver for an other touchkey chip. May it be already
>>>>>>>>>> in mainline or a completely new one.
>>>>>>>>>
>>>>>>>>> I think that my addition of input_polled_dev was ultimately a wrong
>>>>>>>>> thing to do. I am looking into enabling polling mode for regular input
>>>>>>>>> devices as we then can enable polling mode in existing drivers.
>>>>>>>>
>>>>>>>> OK, that sounds good. Especially when one needs to switch from one chip
>>>>>>>> to another that is already in tree, the need for a whole new polling
>>>>>>>> driver is eliminated.
>>>>>>>
>>>>>>> Could you please try the patch below and see if it works for your use
>>>>>>> case? Note that I have not tried running it, but it compiles so it must
>>>>>>> be good ;)
>>>>>>
>>>>>> Hi Dmitry,
>>>>>> Thank you very much for the patch!
>>>>>> I gave it a shot and it seems you forgot to add the input-poller.h file
>>>>>> to the patch.. it does not compile on my side :(
>>>>>
>>>>> Oops ;) Please see the updated patch below.
>>>>
>>>> Thank you, now it is (almost) good as you said :D
>>>>
>>>>>>
>>>>>>> Input: add support for polling to input devices
>>>>>>>
>>>>>>> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>>>>>
>>>>>>> Separating "normal" and "polled" input devices was a mistake, as often we want
>>>>>>> to allow the very same device work on both interrupt-driven and polled mode,
>>>>>>> depending on the board on which the device is used.
>>>>>>>
>>>>>>> This introduces new APIs:
>>>>>>>
>>>>>>> - input_setup_polling
>>>>>>> - input_set_poll_interval
>>>>>>> - input_set_min_poll_interval
>>>>>>> - input_set_max_poll_interval
>>>>>>>
>>>>>>> These new APIs allow switching an input device into polled mode with sysfs
>>>>>>> attributes matching drivers using input_polled_dev APIs that will be eventually
>>>>>>> removed.
>>>>>>
>>>>>> After reading this I am not really sure what else needs to be done
>>>>>> to test/use the poller. I suspect I need to modify the input device
>>>>>> driver (mpr121_touchkey.c in my case) like this:
>>>>>>
>>>>>> If the interrupt gpio is not provided in DT, the device driver probe
>>>>>> function should:
>>>>>>     - not request the threaded interrupt
>>>>>>     - call input_setup_polling and provide it with poll_fn
>>>>>>       Can the mpr_touchkey_interrupt function be used as is for this
>>>>>>       purpose? The only problem I see is it returns IRQ_HANDLED.
>>>>>
>>>>> I'd factor out code suitable for polling from mpr_touchkey_interrupt()
>>>>> and then do
>>>>>
>>>>> static irqreturn_t mpr_touchkey_interrupt(...)
>>>>> {
>>>>> 	mpr_touchkey_report(...);
>>>>> 	return IRQ_HANDLED;
>>>>> }
>>>>>
>>>>
>>>> Probably a trivial problem for experienced kernel hacker but I can not
>>>> wrap my head around this - the interrupt handler takes the mpr121
>>>> device id as an argument while the poller poll_fn takes struct input_dev.
>>>>
>>>> I fail to figure out how to get the device id from the input device.
>>>>
>> Thanks for the hints Dmitry. I am trying my best but still have some
>> issues with the input_set/get_drvdata.
>>
>> The kernel Oopses on NULL pointer dereference in mpr_touchkey_report.
>> Here is the backtrace:
>>
>> [    2.916960] 8<--- cut here ---
>> [    2.920022] Unable to handle kernel NULL pointer dereference at virtual address 000001d0
>> [    2.928138] pgd = (ptrval)
> 
> Ah, that's my fault I believe. Can you please try sticking
> 
> 	poller->input = dev;
> 
> into input_setup_polling()?
> 
Nice, that solved the problem and I confirm the poller mechanism works
as expected. The sysfs poll/min/max interface also works just fine.

Please Cc me when you submit your patch. I think you can already add
my "Tested-by: Michal Vokáč <michal.vokac@ysoft.com>".

I will send mine series when the poller is in your tree. I will include
the proposed DT binding change, adding the "linux,poll-interrupt"
property, though Rob did not respond to this yet.

What about the min/max poll interval limits? Was your idea those should
also be configurable from DT? Currently I defined some limits that are
reasonable for our use case but may not be suitable for someone else.

In the meantime I also need to improve reliability of the reading.
Sometimes the keys get stuck or an electrostatic discharge causes
reset of the chip. I will extract changes that deal with these problems
from the RFC series and from some downstream patches and submit those
later.

Thank you!
Michal
