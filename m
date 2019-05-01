Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D225D105EF
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2019 09:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfEAHvB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 May 2019 03:51:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43282 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfEAHvB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 May 2019 03:51:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D4F5C608D4; Wed,  1 May 2019 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556697059;
        bh=iNrkDBSiMlVRKyLmefjQ5N8FGGudYMobLCdcSYJ8Hl0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CoYnf+ZUYBbvMvC4wXYAEXNLABXWKp6w+i4D81Tny2QR3lPqz7mloAX4A6TlSjM6Q
         5KYkLgrmi9pppjOKpPkEyWmU4sZeU4AGeUm7rUwC4sHglAYkPboZZbJKDsN/RZFB1j
         9SYFcVwTj3VSPgp+XXXUEQ+Ni+aCAin+jB4l3y9A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.204.79.15] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mojha@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB3C6607B9;
        Wed,  1 May 2019 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556697058;
        bh=iNrkDBSiMlVRKyLmefjQ5N8FGGudYMobLCdcSYJ8Hl0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bDjrhtsXNLBWxlMH/v+1rLPbmNecnGPQTVULW1srVOr9UPzXBYr8EMc1pxOtOE8RH
         KBSkG898EjyQ6t/bwG8ybCSuMWo3PHWV2vTC2Sd2ZY7qoSbIIA5wdzaTjGQbUW3JLk
         igaSabI4emOTehRL5xD13PBje1kc5/RJn7UULMEg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB3C6607B9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH v2] Input: uinput: Avoid Object-Already-Free with a global
 lock
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gaurav Kohli <gkohli@codeaurora.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Martin Kepplinger <martink@posteo.de>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>
References: <a4d1a2f3-1db7-e300-9569-7b7a2fadd64e@codeaurora.org>
 <20190419071152.x5ghvbybjhv76uxt@penguin>
 <f3cd46fb-2bb1-0422-b2be-3f7625ec9c4e@codeaurora.org>
 <20190423032839.xvbldglrmjxkdntj@penguin>
 <17f4a0be-ab04-8537-9197-32fbca807f3f@codeaurora.org>
 <20190423084944.gj2boxfcg7lp4zad@penguin>
 <20190423110611.GL2217@ZenIV.linux.org.uk>
 <5614f04f-827d-1668-9ed0-60d93e110b8e@codeaurora.org>
 <20190424130711.GP2217@ZenIV.linux.org.uk>
 <5b02ac1e-df3e-d9cd-ecf3-fe60cda2cece@codeaurora.org>
 <20190424225641.GQ2217@ZenIV.linux.org.uk>
From:   Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <f0a48477-8b25-6538-20e0-53b732afb4d1@codeaurora.org>
Date:   Wed, 1 May 2019 13:20:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424225641.GQ2217@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sorry to come late on this

On 4/25/2019 4:26 AM, Al Viro wrote:
> On Wed, Apr 24, 2019 at 07:39:03PM +0530, Mukesh Ojha wrote:
>
>> This was my simple program no multithreading just to understand f_counting
>>
>> int main()
>> {
>>          int fd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);
>>          ioctl(fd, UI_SET_EVBIT, EV_KEY);
>>          close(fd);
>>          return 0;
>> }
>>
>>             uinput-532   [002] ....    45.312044: SYSC_ioctl: 2   <= f_count
> Er...  So how does it manage to hit ioctl(2) before open(2)?  Confused...

I was confused too about this earlier, but after printing fd got to know 
this is not for the same fd
opening for /dev/uinput, may it is for something while running the 
executable.

>
>>>      <After fdget()
>>            uinput-532   [002] ....    45.312055: SYSC_ioctl: 2
>> <After fdput()
>>            uinput-532   [004] ....    45.313766: uinput_open: uinput: 1   /*
>> This is from the uinput driver uinput_open()*/
>>
>>    =>>>>                         /* All the above calls happened for the
>> open() in userspace*/
>>
>>            uinput-532   [004] ....    45.313783: SYSC_ioctl: 1 /* This print
>> is for the trace, i put after fdget */
>>            uinput-532   [004] ....    45.313788: uinput_ioctl_handler:
>> uinput: uinput_ioctl_handler, 1 /* This print is from the uinput_ioctl
>> driver */
>>
>>            uinput-532   [004] ....    45.313835: SYSC_ioctl: 1 /* This print
>> is for the trace, i put after fdput*/
>>            uinput-532   [004] ....    45.313843: uinput_release: uinput:  0
>> /* And this is from the close()  */
>>
>>
>> Should fdget not suppose to increment the f_count here, as it is coming 1 ?
>> This f_count to one is done at the open, but i have no idea how this  below
>> f_count 2 came before open() for
>> this simple program.
> If descriptor table is not shared, fdget() will simply return you the reference
> from there, without bothering to bump the refcount.  _And_ having it marked
> "don't drop refcount" in struct fd.
>
> Rationale: since it's not shared, nobody other than our process can modify
> it.  So unless we remove (and drop) the reference from it ourselves (which
> we certainly have no business doing in ->ioctl() and do not do anywhere
> in drivers/input), it will remain there until we return from syscall.
>
> Nobody is allowed to modify descriptor table other than their own.
> And if it's not shared, no other owners can appear while the only
> existing one is in the middle of syscall other than clone() (with
> CLONE_FILES in flags, at that).
>
> For shared descriptor table fdget() bumps file refcount, since there
> the reference in descriptor table itself could be removed and dropped
> by another thread.
>
> And fdget() marks whether fput() is needed in fd.flags, so that
> fdput() does the right thing.


Thanks Al, it is quite clear that issue can't happen while a ioctl is in 
progress.
Actually the issue seems to be a race while glue_dir input is removed.

   114.339374] input: syz1 as /devices/virtual/input/input278
[  114.345619] input: syz1 as /devices/virtual/input/input279
[  114.353502] input: syz1 as /devices/virtual/input/input280
[  114.361907] input: syz1 as /devices/virtual/input/input281
[  114.367276] input: syz1 as /devices/virtual/input/input282
[  114.382292] input: syz1 as /devices/virtual/input/input283

in our case it is input which is getting removed while a inputxx is 
trying make node inside input.

Similar issue https://lkml.org/lkml/2019/5/1/3

Thanks,
Mukesh



