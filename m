Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B091A9B3C9
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 17:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732419AbfHWPq5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 11:46:57 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43775 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726839AbfHWPq5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 11:46:57 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 7BF6D2A6;
        Fri, 23 Aug 2019 11:46:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 23 Aug 2019 11:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=subject:to:cc:references:from:message-id
        :date:mime-version:in-reply-to:content-type
        :content-transfer-encoding; s=fm3; bh=VxZQdASDRbPSv59S2xNFGQROn0
        pVoD3mXfpOGowxY0g=; b=MyPZGHCUbohkxfKoQTZKopTqzts59LNkmU57ABW01C
        h8oRns9uVGZd7ude81s3D0PtSiSNAue6Nbi34QBGGyAgaa2RUdvym6XKDEjyN4rb
        gt0v6aMsYpYFa122noc6mF74TtcYO5Rw8KIQaSqk7UiWfQrZtCi9scWsgYvUq/Xo
        BqWFxHTspRihZqaApPdzLZfYo7Hl3HLVh/p6HkXKo8iQt7vCc2DD5klp60duxJhw
        WAoII4bH98JArKmI3Yqcktkaht3Yr8tK2ImZyijmbE1IpHWjBUBsVs0UpHVuXYN8
        rEsfNeqpJzUB76cYmoXqs20ARxC/dtB2Qi9MI8AzCVvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=VxZQdASDRbPSv59S2xNFGQROn0pVoD3mXfpOGowxY
        0g=; b=fIjqdwN64jh7YEe+F9TfCDBFyPdnm+FJ0OyS4HtXK6MMBcxcmppPt7bXD
        UMAIeWRAGV+GBR9H2lDjVBjhvbrkn+fm5/fc+DrClf+E2ygAKs7ROeXnac1uhsPs
        KF6FJ9LRUMlbt19yLPvksFYIxt+rOJDenIqtC8YcJehZC/tr+Kz1xeByy4aFJsNv
        6xXl/o4cmOwvHNft7f9BgMUTXlLJASG62mUmDUOWYVx3rplYtbXSh9/WkJ7kmg/r
        bB+Q1F33l6zeYUyz1GRsEJykAC/SGJn8iZzn6SSqHDfGvMJgpSCdQIRGZ4lrO1rE
        sBirKmVZtaVFRWMSFvgaJJ44UnFqA==
X-ME-Sender: <xms:bgpgXXXxUT4aeDdDStXZ7_sGo3bDD0oLLi47RZfhGJL6VZbOr6bCqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:bgpgXaTFVFiSKQ_VvrqgOxlNSDhqZHFnxvNJZLyH4jUfGzrIjwDA0g>
    <xmx:bgpgXaAxmT3B0qaWIb5Y1WBU4GpuGbLWJSrMsUtusA90ovu7aq_qIw>
    <xmx:bgpgXdR8ePkMcznwc-naCHlIoNBt_38afDpc0oowNM6_qw9MRfjUuw>
    <xmx:bwpgXSdL7GUNSETq0totQra6lsxSXcag0R_8lV-zW1VBIEN6_fkhgQ>
Received: from [192.168.2.40] (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id AFF5ED6005F;
        Fri, 23 Aug 2019 11:46:53 -0400 (EDT)
Subject: Re: [Resubmit] Read battery voltage from Logitech Gaming mice
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
 <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com>
 <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com>
 <CAO-hwJ+=dAyFnUfiPSmiGpzYTj=9BPDdeKQOY7UoCOvwQ5CH7Q@mail.gmail.com>
From:   Pedro Vanzella <pedro@pedrovanzella.com>
Message-ID: <5c5d9d2f-a19a-8f2a-a3b5-c4c1332d1a6d@pedrovanzella.com>
Date:   Fri, 23 Aug 2019 11:46:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+=dAyFnUfiPSmiGpzYTj=9BPDdeKQOY7UoCOvwQ5CH7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 8/23/19 10:32 AM, Benjamin Tissoires wrote:
> On Fri, Aug 23, 2019 at 4:22 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>>
>> Hi Benjamin,
>>
>> On 8/23/19 4:25 AM, Benjamin Tissoires wrote:
>>> Hi Pedro,
>>>
>>> On Thu, Aug 22, 2019 at 10:19 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>>>>
>>>> Resumitting this after having rebased it against the latest changes.
>>>
>>> thanks for resubmitting. Sorry I wasn't able to provide feedback on
>>> the last revision
>>>
>>
>> No worries, I know how these things are.
>>
>>>>
>>>> The gaming line of Logitech devices doesn't use the old hidpp20
>>>> feature for battery level reporting. Instead, they report the
>>>> current voltage of the battery, in millivolts.
>>>>
>>>> This patch set handles this case by adding a quirk to the
>>>> devices we know to have this new feature, in both wired
>>>> and wireless mode.
>>>
>>> So the quirk is in the end a bad idea after all. I had some chats with
>>> Filipe that made me realize this.
>>
>> I actually resubmitted by Filipe's request, since the patches weren't
>> applying cleanly anymore. The idea was to apply these patches and in the
>> future refactor the code to use the feature discovery routines.
>>
>>> Re-reading our previous exchanges also made me understood why I wasn't
>>> happy with the initial submission: for every request the code was
>>> checking both features 0x1000 and 0x1001 when we can remember this
>>> once and for all during hidpp_initialize_battery().
>>
>> Yeah I wasn't too happy about this either, but since there was nothing
>> prohibiting some device to have both features enabled, I thought this
>> wasn't too horrible.
> 
> I honestly don't think we will find one device that has both features
> enabled. It doesn't make sense as the "new" feature allows for fine
> tuning in the software, which would be moot if you also enable the
> percentage.
> 
>>
>>>
>>> So I think we should remove the useless quirk in the end (bad idea
>>> from me, I concede), and instead during hidpp_initialize_battery() set
>>> the correct HIDPP_CAPABILITY_*.
>>> Not entirely sure if we should try to call 0x1000, or 0x1001 or if we
>>> should rely on the 0x0001 feature to know which feature is available,
>>> but this should be implementation detail.
>>
>> I like the idea of calling 0x0001 once on device boot much better. I
>> think we could easily just fetch the location for the features we know
>> about and want to deal with once only. This also makes sure we support
>> every single device that supports this feature, so that is a huge plus.
>>
>> In fact, I think we should _not_ call 0x0001 on battery init, but only
>> call battery init _after_ we called 0x0001 and discovered either 0x1000
>> or 0x1001 (or the solar battery feature, or any other one that might
>> crop up in the feature).
> 
> ack for that
> 
>>
>>>
>>>>
>>>> This version of the patch set is better split, as well as adding the
>>>> quirk to make sure we don't needlessly probe every device connected.
>>>
>>> It is for sure easy to review, but doesn't make much sense in the end.
>>> I think we should squash all the patches together as you are just
>>> adding one feature in the driver, and it is a little bit disturbing to
>>> first add the quirk that has no use, then set up the structs when they
>>> are not used, and so on, so forth.
>>
>> You're right. My first instinct was to send a single patch. As much as I
>> tested this, I always feel like breaking the patch up post-facto will
>> break a git bisect in the future and everyone will hate me :P
> 
> as long as the patches are compiling and are not breaking, git bisect
> will not be a problem. However, we might end up with the last one,
> which is not very explicit in what it does as it just enables the
> features implemented previously.
> 
>>
>> So we (you, me and Filipe) should probably come up with an action plan
>> here. The way I see it there are two issues here: one is adding this
>> feature, and the other is refactoring to use feature discovery for all
>> features. There are advantages and disadvantages to doing one or another
>> first and we might want to discuss that.
>>
>> By merging this first (probably after I resubmit it as a single squashed
>> patch) we get to test it a bit better and have a usable feature sooner.
>> Plenty of people have been requesting this and there is plenty of stuff
>> that can be built on top of it, but only once this is actually merged I
>> think.
>>
>> On the other hand, by first refactoring the rest of the code to use
>> 0x0001 we avoid some rework on this patch. It should be minor, as most
>> functions here do all the heavy lifting after the initial feature
>> discovery, and are thus mostly independent from how that is done.
>>
>> I'm happy either way, so just let me know what you guys decide.
> 
> I think we should merge your v3 squashed series with a slight
> autodetection during battery init, like the method you used in the v1.
> This would remove the quirk, but keep the straightforward commands
> when addressing battery data.

Alright, I rebased against for-5.4/logitech to make sure, squashed 
everything and restored the detection code from v1, removing the quirk. 
Tested and it works on both wired and wireless on my G900.

> 
> Relying on 0x0001 should be done separately and can come in in a later
> patch IMO (unless you plan to work on it, in which case you can send
> both at once).

0x0001 is quite the task and I think Filipe already has a good plan to 
tackle it, so I'll leave that for him.

> 
> The problem I have with quirks, and that I explained to Filipe on IRC
> is that this is kernel ABI. Even if there is a very low chance we have
> someone using this, re-using the same drv_data bit in the future might
> break someone's device.
> 
>>
>> If you guys (or anyone else reading this on the public list, really) has
>> any input - naming things being notoriosly hard, I'm actually happy with
>> nitpicking - I'd appreciate it. On that note, come to think of it, I'm
>> not 100% sure reporting the voltage in milivolts is the standard way. I
>> looked through the docs, but found no solid guideline. It was either
>> that or a float, so I think I made the right call here, but still.
> 
> I am not sure either. Adding Bastien as he has a lot more experience in upower.
> 
> But I am under the impression that the kernel part is more "try to
> deal with whatever the hardware provides, and deal with it in user
> space".
> 

I'll submit v4 as a single patch in the next couple of minutes.

- Pedro
