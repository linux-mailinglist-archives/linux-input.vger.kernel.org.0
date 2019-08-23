Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43FE9B1CA
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 16:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388877AbfHWOWV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 10:22:21 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:35829 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731879AbfHWOWV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 10:22:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9C1793C2;
        Fri, 23 Aug 2019 10:22:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 23 Aug 2019 10:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=subject:to:cc:references:from:message-id
        :date:mime-version:in-reply-to:content-type
        :content-transfer-encoding; s=fm3; bh=EfJbH9OnjtKj3CUw1B8NweZdaH
        ec7Po9qpFZEwcvYrI=; b=uTYtomk7fnjsuB+Qb5dnNGMqMMgTm04p3WAXh1nrFw
        VrUGpe3iGSZJihcXwupkzpdsl844IOyfiMTtEJ2D2ZN1P4Izy9OWKPsDiiRplT0u
        /GGeP5ET0MnTglPST/YwV7JZApPyDHbOiDahyyHohaSE1XBlLW5gRkV/73yYpxxB
        WYec5KddR4eSh4cbtnhEosVKTZImz6Q7uoJWnWGpQCRlnvkCvXaDg09vD0Lvoc4A
        Iw+3cYVb/earPt4J0iQZkEQISMj65sWa0dYFQARifzJ+cBp4dgcPqttxd7ZobNqq
        GUHuEsYysLBCHfMM7LOanGZhWn8+ouMQkiD9aGvDNg+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=EfJbH9OnjtKj3CUw1B8NweZdaHec7Po9qpFZEwcvY
        rI=; b=Ypi5VS697rlEot91gUSkgrcHUdK2a07L4aMrA3pGXWHgOzVLij/BUvcrv
        I6/rMBokzP2V6lJWqoPBtLlH3P/VxF+m3rP64b9gcxukzl+aw2UZFOioGkbZHCBw
        FzztRDjnSbIvuUL9zJ2cd3uo1mgLk13jABNBrquUa+vKKOBf470IE19c6pbXUhsW
        t1Z6DC6vgOmKqT4tyZqqVC6AJF+RsXbGi1pbJTAJ4mlhpjbU2GHhwxXnpBHcOiMi
        cWjWbDNZktVLrCt0K0CClrNcZ0g1gG8OgTHjCqI0M4G41BeviGGVe2XP56vRw8bj
        atFZ2CEHBzTtja5v/QLqnuqSFDTgg==
X-ME-Sender: <xms:mvZfXaeV44b2Cp0xkv_oTz9chBGil9v4vBfen-eicCJcn_HhT6PXJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:mvZfXSAfu7NKSfBc49k2vXugBfcbbdNOeBhXCzt-i6IrD06dYvb04Q>
    <xmx:mvZfXcZ_BTcCmRhooDg7M0CpmpjKx6iKXB25pOp_dN4KzizMKvNDQA>
    <xmx:mvZfXS5SgzMLSnrmfc-aCqIUaDStoYIbchQ5YYnKIyn8P7h20lH2pQ>
    <xmx:m_ZfXUMkWbjiD7l1h3BGQtdFc8Xh2M61BihaKKk0EV9Dhf0YkuyPEg>
Received: from [192.168.2.40] (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id E5E098005C;
        Fri, 23 Aug 2019 10:22:17 -0400 (EDT)
Subject: Re: [Resubmit] Read battery voltage from Logitech Gaming mice
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
 <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com>
From:   Pedro Vanzella <pedro@pedrovanzella.com>
Message-ID: <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com>
Date:   Fri, 23 Aug 2019 10:22:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 8/23/19 4:25 AM, Benjamin Tissoires wrote:
> Hi Pedro,
> 
> On Thu, Aug 22, 2019 at 10:19 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>>
>> Resumitting this after having rebased it against the latest changes.
> 
> thanks for resubmitting. Sorry I wasn't able to provide feedback on
> the last revision
> 

No worries, I know how these things are.

>>
>> The gaming line of Logitech devices doesn't use the old hidpp20
>> feature for battery level reporting. Instead, they report the
>> current voltage of the battery, in millivolts.
>>
>> This patch set handles this case by adding a quirk to the
>> devices we know to have this new feature, in both wired
>> and wireless mode.
> 
> So the quirk is in the end a bad idea after all. I had some chats with
> Filipe that made me realize this.

I actually resubmitted by Filipe's request, since the patches weren't 
applying cleanly anymore. The idea was to apply these patches and in the 
future refactor the code to use the feature discovery routines.

> Re-reading our previous exchanges also made me understood why I wasn't
> happy with the initial submission: for every request the code was
> checking both features 0x1000 and 0x1001 when we can remember this
> once and for all during hidpp_initialize_battery().

Yeah I wasn't too happy about this either, but since there was nothing 
prohibiting some device to have both features enabled, I thought this 
wasn't too horrible.

> 
> So I think we should remove the useless quirk in the end (bad idea
> from me, I concede), and instead during hidpp_initialize_battery() set
> the correct HIDPP_CAPABILITY_*.
> Not entirely sure if we should try to call 0x1000, or 0x1001 or if we
> should rely on the 0x0001 feature to know which feature is available,
> but this should be implementation detail.

I like the idea of calling 0x0001 once on device boot much better. I 
think we could easily just fetch the location for the features we know 
about and want to deal with once only. This also makes sure we support 
every single device that supports this feature, so that is a huge plus.

In fact, I think we should _not_ call 0x0001 on battery init, but only 
call battery init _after_ we called 0x0001 and discovered either 0x1000 
or 0x1001 (or the solar battery feature, or any other one that might 
crop up in the feature).

> 
>>
>> This version of the patch set is better split, as well as adding the
>> quirk to make sure we don't needlessly probe every device connected.
> 
> It is for sure easy to review, but doesn't make much sense in the end.
> I think we should squash all the patches together as you are just
> adding one feature in the driver, and it is a little bit disturbing to
> first add the quirk that has no use, then set up the structs when they
> are not used, and so on, so forth.

You're right. My first instinct was to send a single patch. As much as I 
tested this, I always feel like breaking the patch up post-facto will 
break a git bisect in the future and everyone will hate me :P

So we (you, me and Filipe) should probably come up with an action plan 
here. The way I see it there are two issues here: one is adding this 
feature, and the other is refactoring to use feature discovery for all 
features. There are advantages and disadvantages to doing one or another 
first and we might want to discuss that.

By merging this first (probably after I resubmit it as a single squashed 
patch) we get to test it a bit better and have a usable feature sooner. 
Plenty of people have been requesting this and there is plenty of stuff 
that can be built on top of it, but only once this is actually merged I 
think.

On the other hand, by first refactoring the rest of the code to use 
0x0001 we avoid some rework on this patch. It should be minor, as most 
functions here do all the heavy lifting after the initial feature 
discovery, and are thus mostly independent from how that is done.

I'm happy either way, so just let me know what you guys decide.

If you guys (or anyone else reading this on the public list, really) has 
any input - naming things being notoriosly hard, I'm actually happy with 
nitpicking - I'd appreciate it. On that note, come to think of it, I'm 
not 100% sure reporting the voltage in milivolts is the standard way. I 
looked through the docs, but found no solid guideline. It was either 
that or a float, so I think I made the right call here, but still.

- Pedro

> 
> Cheers,
> Benjamin
> 
>>
>>
