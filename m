Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDAA51D19A
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 08:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345279AbiEFGuZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 02:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242966AbiEFGuZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 02:50:25 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F9A6543F
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 23:46:43 -0700 (PDT)
Received: from [192.168.0.22] (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 1D294A1E6;
        Thu,  5 May 2022 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651819602; bh=GZHKWIiCkQx6faH/KLTx2296M58TbBjk0KmjMQI/+6I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=nHPSFYizxXbRtKLzkotH2/vDYNs7d8fxk6DOj0B6K5puhylKzopX+bxK2c9zHVsgo
         BCUAmlZVFYGMChRU5p/UHxdHTePoaREfE81kCG5pHz2w/7ePW+jTtmgbny56j88Emp
         jwxRmXg2pMOLQjHdZN04+BCshcSvCWn+nHMHPCmKzcxZQ/wxah5WDDUCacuHGXP4/d
         WfaMQ3qH5mVelSN7Bs3fR/q5LM8gjZKuP0byMSXjljL1GTHg3ySriHV0Yf2mEVe9Bn
         nhEunmCZp8eNYahc1xbFGup8nRRoj1KxMjOow4/qXWCG/NevcepZ1iMS1pQwcUy1S8
         Hb4q6W4g+ouog==
Message-ID: <b94a747c-8974-b574-e751-6a6b2e01a29c@endrift.com>
Date:   Thu, 5 May 2022 23:46:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
Content-Language: en-US
To:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>
References: <20220427224526.35657-1-vi@endrift.com>
 <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
 <YnQBkd5V3lmC9cGr@google.com>
 <CAEc3jaB5aRtuWBV8wuqFy+Tic360LLbV6M09KY+aeWR7XLjZxw@mail.gmail.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <CAEc3jaB5aRtuWBV8wuqFy+Tic360LLbV6M09KY+aeWR7XLjZxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

On 5/5/22 22:21, Roderick Colenbrander wrote:
> Hi Vicki,
> 
> Joining the conversation late as I on a long vacation.
> 
> On Thu, May 5, 2022 at 12:47 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> On Thu, May 05, 2022 at 10:50:24AM +0200, Benjamin Tissoires wrote:
>>> Hi Vicki,
>>>
>>> On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>>>>
>>>> This allows the touchpad input_dev to be removed and have the driver remain
>>>> functional without its presence. This will be used to allow the touchpad to
>>>> be disabled, e.g. by a module parameter.
>>>
>>> Thanks for the contribution.
>>> I'd like to hear from Roderick, but I have a general comment here:
>>> We had Wii and Steam controllers following this logic. Now we are
>>> adding Sony PS ones... That seems like a lot of duplication, and I
>>> wonder if we should not have something more generic.
>>
> 
> I understand the use case of rejecting input. I wasn't that fond of
> handling it kernel side also because it would complicate the code a
> lot more (and some would perhaps want to do the same for accelerometer
> device). Below Dmitry gives a nice idea about inhibition.
> 
> Methods I would considered perhaps would have been a custom udev role
> (it sounds like you have control of the platform). Or another method
> is using EVIOCGRAB to get exclusive access to an input device to block
> others from using it again depends on your specific use case. When
> this topic came up some years ago with Valve it was one of the methods
> considered there if I recall.
> 
>> Hmm, if userspace is not interested in data from an input device (and it
>> does not want to simply not open it), it can use inhibit/uninhibit sysfs
>> attributes to silence it.
>>
>> I am not sure we need to build support for destroying input device or
>> introducing module parameters, etc.
>>
> 
> Inhibition is interesting and could work. I wasn't aware of this
> feature and we may actually use it for hid-playstation to save some
> power as there are various HID commands for power saving when the
> device isn't open. If we were to add that, some care would need to be
> taken with HIDRAW, which the driver is often unaware of. I guess the
> end responsibility for making sure the device would work would be with
> the hidraw user (unless there will be some interop APIs).
> 
I would like to know more about these sysfs controls. I wasn't aware of any way to do this from userspace, and paired with udev rules that allow access to these controls (can udev modify sysfs permissions?) to the right users/groups, this might be a viable way to manage this. My sponsor is Valve, so that might be why this is somewhat familiar. They want to be able to have the Steam input daemon disable various reporting from the controllers without requiring root or getting too deep into the system, but I think udev rules that allow Steam itself access to the sysfs inhibition controls may be a good approach if there's a way to do that, especially already in the kernel. I know the kernel they're shipping right now is a few versions old.

Thanks,
Vicki

>> Thanks.
>>
>> --
>> Dmitry
> 
> 
> Thanks,
> Roderick
