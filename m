Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4551AE32
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2019 23:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfELU7i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 May 2019 16:59:38 -0400
Received: from mx3.wp.pl ([212.77.101.9]:57601 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726997AbfELU7h (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 May 2019 16:59:37 -0400
Received: (wp-smtpd smtp.wp.pl 4272 invoked from network); 12 May 2019 22:59:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1557694773; bh=iyiQTrIWFatOO2FrWGC5Ae8DDFTrjkzZbDAhPWkurEg=;
          h=Subject:To:Cc:From;
          b=uNU20vHkGDzKtwImgBNkc0B+4XnFRPuquVdy+PJLYlIQH0bA9cvvKhXZCPRVYEXj0
           VR/94dli6VW9LlaYuJZX1tuU6d1Hczn97ikMkEipwMnZm1vXdGcqNXhkVeum9m5MTW
           dzSetjp75ALxH2ABxhJsf2Vesn0KglgPwpHuiDOw=
Received: from pc-201-108-240-185-static.strong-pc.com (HELO [192.168.0.9]) (spaz16@wp.pl@[185.240.108.201])
          (envelope-sender <spaz16@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-kernel@vger.kernel.org>; 12 May 2019 22:59:33 +0200
Subject: Re: [PATCH] HID: fix A4Tech horizontal scrolling
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Igor Kushnir <igorkuo@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190502213639.7632-1-spaz16@wp.pl>
 <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
 <1a40ea07-368a-93f6-8335-dec7ae50bbf4@gmail.com>
 <CAO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
 <20190507050150.GA9838@jelly>
From:   =?UTF-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>
Message-ID: <549757a1-33b5-e460-d6e7-ee766a792c27@wp.pl>
Date:   Sun, 12 May 2019 22:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507050150.GA9838@jelly>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-WP-MailID: b67fab14069587d2b61ea64472ce62d8
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [MQP0]                               
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 07.05.2019 at 07:01, Peter Hutterer wrote:
> On Fri, May 03, 2019 at 01:59:23PM +0200, Benjamin Tissoires wrote:
>> Hi,
>>
>> On Fri, May 3, 2019 at 11:43 AM Igor Kushnir <igorkuo@gmail.com> wrote:
>>>
>>> Hi Benjamin,
>>>
>>> On 5/3/19 10:36 AM, Benjamin Tissoires wrote:
>>>> Hi,
>>>>
>>>> On Thu, May 2, 2019 at 11:37 PM Błażej Szczygieł <spaz16@wp.pl> wrote:
>>>>>
>>>>> Since recent high resolution scrolling changes the A4Tech driver must
>>>>> check for the "REL_WHEEL_HI_RES" usage code.
>>>>>
>>>>> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
>>>>> Resolution Multiplier for high-resolution scrolling)
>>>>>
>>>>> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
>>>>
>>>> Thanks for the patch. I do not doubt this fixes the issues, but I
>>>> still wonder if we should not export REL_HWHEEL_HI_RES instead of
>>>> REL_HWHEEL events.
>>>
>>>
>>> If you mean exporting REL_HWHEEL_HI_RES instead of REL_HWHEEL from
>>> hid-a4tech.c, then it makes sense to me, though I do not know the code
>>> well enough to be certain.
>>
>> Yep, that's what I meant. I am worried that userspace doesn't know
>> well how to deal with a device that mixes the new and old REL_WHEEL
>> events.
> 
> sorry, I'm not sure what you mean here. The new events are always mixed with
> the old ones anyway, and both should be treated as separate event streams.
> The kernel interface to userspace is fairly easy to deal with, it's the rest
> that's a bit of mess.
> 
> [..]
> 
>>>
>>
>> OK, thanks both of you for your logs, this is helpful.
>> So just in case I need to come back later, the horizontal wheel is
>> "just" the normal wheel plus a modifier in the report.
>>
>> Anyway, ideally, can we have a v2 of the patch with the 2 changes
>> requested above in the commit message and the introduction of
>> REL_HWHEEL_HI_RES events in addition to REL_HWHEEL?
>> REL_HWHEEL_HI_RES should report `120*value` and we should also keep
>> the reporting of REL_WHEEL as it is currently.
>>
>> Peter, I grepped in the hid code, and it seems hid-cypress.c is having
>> the exact same issue. Sigh.
> 
> yeah, I found that too when grepping through it. seems to be the only other
> one though and we can use Błażej's patch as boilerplate once it's done.

Peter, I also found comparison of "usage->code ==" with "REL_HWHEEL"
and "REL_WHEEL" in hid-lenovo.c, hid-apple.c, hid-ezkey.c, hid-lg.c.
Unfortunatelly, I don't have such devices to test :(

Cheers,
Błażej.
