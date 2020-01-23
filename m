Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C627146114
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2020 05:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgAWEFh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 23:05:37 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60751 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725933AbgAWEFh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 23:05:37 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 1ECA82220C;
        Wed, 22 Jan 2020 23:05:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 22 Jan 2020 23:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=2
        tcZk8wvkzjgAZ72DD+CmQfwa2ouxVLEDEok6FcSmFE=; b=yHTTlIDOWqFp8IBUJ
        kH+VNly91oM6IHrMr9cZVLDVVIapkIzJZcAiATACXvpqVgdWFakIm4AdMmTCviQj
        i2QTnmUUDetubJAIYM8DPL7fakCtqohmILpRAy3H1DBlivudE7C6X/HAPBR1gglx
        WJ0y/y2WBSTcMh1//6Wc4kl5AK+tdTnL9tgF4axcXLVfAWfokJLyumpPIxMscIYH
        CbqG7tONhDpx54GAX1SnNSFod54ySVOi9BD8jWwCFeLZIlR6RnUPNxgmEhyQGs9O
        T8My9/t2YeZCGIi86JO2lRsi4MFbXWD92zOh7YKcrO/0ZEj7VBgIbTvrnLBstohb
        +cyzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=2tcZk8wvkzjgAZ72DD+CmQfwa2ouxVLEDEok6FcSm
        FE=; b=hnGDwaEnG7sFG5a6+N5jL3TMIXHyakEZ8uHvJqp7316aVluwAWlnTloUT
        ttSMvMeSmWnkJtMp29x5Tmz1fsD5Xdk2zSYd2qlqF1dEMVALwzCwQprqTg/e9ajJ
        ZLaeLV0SUbrS0HQmb2JVTDWlAO6n5XYV7B/Igqpa8s3whpiQciISr/h6xKjKc5n6
        iediSZVDWtwXeovFLq/YlEU2cr/KIo9ZFuO+v5RoidVIvkjoIkoFtkawfZ3ARf9z
        4b4R4vr3xSLv8nXHKEYxhAAZmrnNTQsefT1R4D0VvABi6DodDqi8q6zkvqDmk8Zm
        38glVJGcfW9uh5OrvsWb+ZPcsJIAQ==
X-ME-Sender: <xms:jxspXmWlmOW-VxtoqwXyEgl72lSOvMyLR5ptRINNiPt_Dl2swRo0DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvddugdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhr
    ghenucfkphepuddujedrvddtrdejtddrudegjeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdq
    thdrnhgvth
X-ME-Proxy: <xmx:jxspXjSYYoRGq_cj3mVELu0km4rXDff57xA4OW3S7Al1V43-gooZzQ>
    <xmx:jxspXolaXqKW6RVGWRDnxKEjfDHrEm5TdlX0Qd5FjbweaZKMpc-A5A>
    <xmx:jxspXh4CHX5NiQAYVyFmd_DGmmvVEcMEkAbk_4RIq5Ch4m-SswjEDQ>
    <xmx:kBspXvCMEQ83z3_NOQ8jv1QYdKAga-oHuwHuJFnwoFDkbtwP7Ayujw>
Received: from jelly (117-20-70-147.751446.bne.nbn.aussiebb.net [117.20.70.147])
        by mail.messagingengine.com (Postfix) with ESMTPA id D8A51328005E;
        Wed, 22 Jan 2020 23:05:32 -0500 (EST)
Date:   Thu, 23 Jan 2020 14:05:27 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Re: [RFC] linux-input alps - loosing precision
Message-ID: <20200123040527.GA408658@jelly>
References: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
 <20200117094206.xu47p6ybxmsf5ne2@pali>
 <20200121213441.GO47797@dtor-ws>
 <20200121233558.GA399961@jelly>
 <20200122010457.GA110084@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200122010457.GA110084@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 21, 2020 at 05:04:57PM -0800, dmitry.torokhov@gmail.com wrote:
> On Wed, Jan 22, 2020 at 09:35:58AM +1000, Peter Hutterer wrote:
> > On Tue, Jan 21, 2020 at 01:34:41PM -0800, dmitry.torokhov@gmail.com wrote:
> > > Hi Pali,
> > > 
> > > On Fri, Jan 17, 2020 at 10:42:06AM +0100, Pali Rohár wrote:
> > > > On Thursday 09 January 2020 14:26:16 Leutwein Tobias (BEG/ENC1) wrote:
> > > > > Hello,
> > > > > 
> > > > > At the file
> > > > > https://github.com/torvalds/linux/blob/master/drivers/input/mouse/alps.c
> > > > > I've seen that values coming from the trackpoint/trackstick are divided at some devices, which results in a loss of precision.
> > > > > 
> > > > > As I was not lucky with the behavior of the trackpoint of my computer I've made a fork of libinput https://gitlab.freedesktop.org/leutwe/libinput/tree/master/
> > > > > where I changed  src/filter-trackpoint.c . With this change, the values from lib evdev are multiplied by a factor (dpToFac_au16 []). The array element used from dpToFac_au16 [] is also the value received by evdev.
> > > > > 
> > > > > At higher forces I use a factor much higher than 1, so the undivided value from the device would be the best for me.
> > > > > 
> > > > > In order not to change the behavior for other users, it might be possible to change the divider at runtime via the sys- file system - like it is at trackpoint.c and take the currently used divider as default value.
> > > > > 
> > > > > Positions at source code were I see the division:
> > > > > 
> > > > > alps_process_trackstick_packet_v3()
> > > > > /*
> > > > > * The x and y values tend to be quite large, and when used
> > > > > * alone the trackstick is difficult to use. Scale them down
> > > > > * to compensate.
> > > > > */
> > > > > x /= 8;
> > > > > y /= 8;
> > > > > 
> > > > > alps_process_packet_v6()
> > > > > /* Divide 4 since trackpoint's speed is too fast */ input_report_rel(dev2, REL_X, (char)x / 4); input_report_rel(dev2, REL_Y, -((char)y / 4));
> > > > 
> > > > Hello Dmitry!
> > > > 
> > > > This problem is about fact that alps.c for some ALPS devices already
> > > > truncate precision of trackpoint movement.
> > > > 
> > > > Tobias is unhappy with this fact and would like to get all bits of
> > > > movement information, not just some high.
> > > > 
> > > > But existing userspace application expects that for these devices kernel
> > > > already truncate precision and process truncated data from kernel.
> > > > 
> > > > Now question is: Are we able to send to userspace input data without
> > > > doing truncation and without breaking existing applications?
> > > > 
> > > > It looks like that for such thing we need some userspace <--> kernel API
> > > > which disable truncating of precision.
> > > > 
> > > > Have you been solving similar issue for other other drivers or in other
> > > > area of input code?
> > > 
> > > Unfortunately I do not think we can automatically "recover" the lost
> > > precision without help of libinput, which would need to tweak the
> > > trackpoint [sysfs] property letting kernel know that it should send
> > > original data.
> > 
> > Right, so the problem here is simply: we don't have write access to sysfs
> > and most of libinput's users don't either. For evdev devices it's fine
> > thanks to logind but that won't apply for anything else. Which means that
> > sysfs is no-go unless you want to shell-script your way around it.
> 
> I wonder if we can do this via udev rule that [newer] libinput package
> would install? I do not think we need to support multiple input stacks
> on the same system at the same time, so system-wide config could work...

good point and yes, that would work. and we already do something similar
with the fuzz handling anyway. reading sysfs is usually not an issue and
worst case we can set a udev property to get around that.

Cheers,
   Peter

> 
> > 
> > It's been a while since I looked at the trackpoint code but from what I
> > remember it's a historical mess of inter-dependencies. The kernel driver did
> > something, then userspace adjusted based on that, then the kernel driver
> > couldn't fix anything because of userspace, and that looped 3-4 times.
> > 
> > libinput has the magic trackpoint multiplier quirk to work around this
> > deadlock but multiplying doesn't give you precision back. As an immediate
> > brain fart, maybe we need a "subpixel" REL_X_FRACTION axis?
> > Not ideal, since every relative device other than trackpoints just pass on
> > device units and rely on userspace to make sense of it, so the trackpoints
> > will likely stay the only users of it.
> > 
> > Alternatively - add the sysfs file, make libinput read it and adjust its
> > behaviour and then eventually toggle the default. Less breakage that way but
> > now you're talking about a multi-year inertia. And you rely on userspace
> > updating with the kernel.
> > 
> > Or introduce a resolution field for the EV_REL scope. Not sure how to do
> > that either and let's be honest, it wouldn't really be set by the kernel for
> > most devices anyway because it doesn't scale well (would've come in useful
> > for the various dpi settings on mice though).
> > 
> > That's all I can think of right now. For any solution - the libinput bits
> > are the easy ones, it's the inertia and possible other input stacks that are
> > the killer here.
> 
> Yeah, none of the above options with new resolution, or event code
> appeal to me too much.
> 
> Thanks.
> 
> -- 
> Dmitry
