Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6734C14778F
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2020 05:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730310AbgAXEYb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 23:24:31 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55819 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729797AbgAXEYb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 23:24:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 936E36F1;
        Thu, 23 Jan 2020 23:24:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 23 Jan 2020 23:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=J
        uR3+GlgVUil3K1IeM4Hqi31/IxVY8Q5Mmxe1kVtdx4=; b=xWkXZ0S2JVYeErW6a
        VO+V6mBjExL77KYYJwOrduCrJ6QNVBAJOQm8V1Rbw1HRrsRsfiO0jAERpwhdU7ra
        Qy2kSY+jLBzjD8Wg42c286dK8vgWyJN+Azzk2xI3LdmTHUYQlmnXXOXMZfRvJEmK
        Wa85bmN5KrhGkji+FFJI1Q7tYyEJNRjFSJY7l7yFsrjUUr/2l1lR208MHxpYqzJp
        xsaXHHwH8C2MjVj2CdH5v/nIe8ImeppgZVk0zxET8d27Lkq0/RRfP+p1ve3uAuaW
        ZQnrunqDR8WcnsTtX8Ifzdj51kXFcvqg2dFXvvyJ0SJNWM6aOE0a0O3z20pdulH2
        S8Cnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=JuR3+GlgVUil3K1IeM4Hqi31/IxVY8Q5Mmxe1kVtd
        x4=; b=xQDw+8s/x+CqmWOWEfOZRp5Tz+glbJ/6pSeOLqbcuM0DSjxmJxIOslSda
        m/RfDYMkJla74FIlOYDXyCDc49HO2nobK1VHgoZBayA2D5kQyzXLbQva28o/80zy
        mORviG/6tyPK0JQ85b+YcCGWduxc+oBJPPOFrOXP3T6i800rhk7NnD8ZVmLTIDAy
        FNgTiTso/YzostmJfkHtS16GbCWcbkrjcPZWTtNwHy+Rzolk2Ded254P4Xfx8VoE
        4Zjgcdr1rsIm2gUJ1ZCXLjd4UyffoeIa50aJ3sSKA/BzxaKXr2Q/c4gLSBocdeOG
        0XDAYICOQTLjuDxsEhs4TAWWKR2bQ==
X-ME-Sender: <xms:fHEqXrIUvnsnggfUcv5EfeF6oXgLZLakF_lFuCG8lijVu3Dp2nLXMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdefgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhr
    ghenucfkphepuddujedrvddtrdejuddruddtleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdq
    thdrnhgvth
X-ME-Proxy: <xmx:fHEqXjaxw4fXTLCio4Bmh4W58NdAFRSuulxQQhvFrYu5j0Kks_MkEA>
    <xmx:fHEqXuvk-5I665X-ESGsXgBrQu1-WIAbLwIH26eNw0VF13-yv0pjgw>
    <xmx:fHEqXoujjsbDhK1U3-pkNHL_yoWnvn-ZG-0t0N0aWeqLcGVcPoEPAw>
    <xmx:fXEqXupjioWU34Sn8ImOHLURF_fV1ze5i5pLS9pkL5wRRF_l0tVQOw>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3EF643060AF2;
        Thu, 23 Jan 2020 23:24:25 -0500 (EST)
Date:   Fri, 24 Jan 2020 14:24:21 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>
Cc:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Re: [RFC] linux-input alps - loosing precision
Message-ID: <20200124042421.GB412105@jelly>
References: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
 <20200117094206.xu47p6ybxmsf5ne2@pali>
 <20200121213441.GO47797@dtor-ws>
 <20200121233558.GA399961@jelly>
 <20200122010457.GA110084@dtor-ws>
 <20200123040527.GA408658@jelly>
 <03fd616f969247d8afaa79d6f26a5c7e@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03fd616f969247d8afaa79d6f26a5c7e@de.bosch.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 23, 2020 at 09:25:49AM +0000, Leutwein Tobias (BEG/ENC1) wrote:
> > From: Peter Hutterer <peter.hutterer@who-t.net>
> > Sent: Donnerstag, 23. Januar 2020 05:05
> > 
> > On Tue, Jan 21, 2020 at 05:04:57PM -0800, dmitry.torokhov@gmail.com
> > wrote:
> > > On Wed, Jan 22, 2020 at 09:35:58AM +1000, Peter Hutterer wrote:
> > > > On Tue, Jan 21, 2020 at 01:34:41PM -0800, dmitry.torokhov@gmail.com
> > wrote:
> > > > > Hi Pali,
> > > > >
> > > > > On Fri, Jan 17, 2020 at 10:42:06AM +0100, Pali Rohár wrote:
> > > > > > On Thursday 09 January 2020 14:26:16 Leutwein Tobias (BEG/ENC1)
> > wrote:
> > > > > > > Hello,
> > > > > > >
> > > > > > > At the file
> > > > > > > https://github.com/torvalds/linux/blob/master/drivers/input/mo
> > > > > > > use/alps.c I've seen that values coming from the
> > > > > > > trackpoint/trackstick are divided at some devices, which results in a
> > loss of precision.
> > > > > > >
> > > > > > > As I was not lucky with the behavior of the trackpoint of my
> > > > > > > computer I've made a fork of libinput
> > > > > > > https://gitlab.freedesktop.org/leutwe/libinput/tree/master/
> > > > > > > where I changed  src/filter-trackpoint.c . With this change, the
> > values from lib evdev are multiplied by a factor (dpToFac_au16 []). The array
> > element used from dpToFac_au16 [] is also the value received by evdev.
> > > > > > >
> > > > > > > At higher forces I use a factor much higher than 1, so the undivided
> > value from the device would be the best for me.
> > > > > > >
> > > > > > > In order not to change the behavior for other users, it might be
> > possible to change the divider at runtime via the sys- file system - like it is at
> > trackpoint.c and take the currently used divider as default value.
> > > > > > >
> > > > > > > Positions at source code were I see the division:
> > > > > > >
> > > > > > > alps_process_trackstick_packet_v3()
> > > > > > > /*
> > > > > > > * The x and y values tend to be quite large, and when used
> > > > > > > * alone the trackstick is difficult to use. Scale them down
> > > > > > > * to compensate.
> > > > > > > */
> > > > > > > x /= 8;
> > > > > > > y /= 8;
> > > > > > >
> > > > > > > alps_process_packet_v6()
> > > > > > > /* Divide 4 since trackpoint's speed is too fast */
> > > > > > > input_report_rel(dev2, REL_X, (char)x / 4);
> > > > > > > input_report_rel(dev2, REL_Y, -((char)y / 4));
> > > > > >
> > > > > > Hello Dmitry!
> > > > > >
> > > > > > This problem is about fact that alps.c for some ALPS devices
> > > > > > already truncate precision of trackpoint movement.
> > > > > >
> > > > > > Tobias is unhappy with this fact and would like to get all bits
> > > > > > of movement information, not just some high.
> > > > > >
> > > > > > But existing userspace application expects that for these
> > > > > > devices kernel already truncate precision and process truncated data
> > from kernel.
> > > > > >
> > > > > > Now question is: Are we able to send to userspace input data
> > > > > > without doing truncation and without breaking existing applications?
> > > > > >
> > > > > > It looks like that for such thing we need some userspace <-->
> > > > > > kernel API which disable truncating of precision.
> > > > > >
> > > > > > Have you been solving similar issue for other other drivers or
> > > > > > in other area of input code?
> > > > >
> > > > > Unfortunately I do not think we can automatically "recover" the
> > > > > lost precision without help of libinput, which would need to tweak
> > > > > the trackpoint [sysfs] property letting kernel know that it should
> > > > > send original data.
> > > >
> > > > Right, so the problem here is simply: we don't have write access to
> > > > sysfs and most of libinput's users don't either. For evdev devices
> > > > it's fine thanks to logind but that won't apply for anything else.
> > > > Which means that sysfs is no-go unless you want to shell-script your way
> > around it.
> > >
> > > I wonder if we can do this via udev rule that [newer] libinput package
> > > would install? I do not think we need to support multiple input stacks
> > > on the same system at the same time, so system-wide config could work...
> > 
> > good point and yes, that would work. and we already do something similar
> > with the fuzz handling anyway. reading sysfs is usually not an issue and worst
> > case we can set a udev property to get around that.
> > 
> 
> From a maintainability point of view (and also in terms of runtime), it
> may be best to just remove the divider. In this case, users need to make
> the adaption, but they could do so, if desired, with respect to the Linux
> kernel version.

checking the kernel version is unreliable given the various backports and
stable patches. And note that when you remove the divider, you're still
breaking all of userspace that hasn't adjusted yet. In some cases (*cough*
libinput) you may not even be able to scale the acceleration down far enough
to make up for the new data (haven't tried it and it should roughly be fine,
but better test this first).

> In case of libinput I think this could be done through the device quirks.
> https://wayland.freedesktop.org/libinput/doc/latest/device-quirks.html

yep, we already have quirks for trackpoints anyway, adding more isn't that
hard. however - quirks are a whack-a-mole game which tends to get boring
after a while. So we need some unique identifer to know which devices need
to be handled. Maybe bump id.version, it seems to be 0 anyway for alps which
means we have plenty of numbers left before we run out.

Cheers,
   Peter


 
> > >
> > > >
> > > > It's been a while since I looked at the trackpoint code but from
> > > > what I remember it's a historical mess of inter-dependencies. The
> > > > kernel driver did something, then userspace adjusted based on that,
> > > > then the kernel driver couldn't fix anything because of userspace, and
> > that looped 3-4 times.
> > > >
> > > > libinput has the magic trackpoint multiplier quirk to work around
> > > > this deadlock but multiplying doesn't give you precision back. As an
> > > > immediate brain fart, maybe we need a "subpixel" REL_X_FRACTION
> > axis?
> > > > Not ideal, since every relative device other than trackpoints just
> > > > pass on device units and rely on userspace to make sense of it, so
> > > > the trackpoints will likely stay the only users of it.
> > > >
> > > > Alternatively - add the sysfs file, make libinput read it and adjust
> > > > its behaviour and then eventually toggle the default. Less breakage
> > > > that way but now you're talking about a multi-year inertia. And you
> > > > rely on userspace updating with the kernel.
> > > >
> > > > Or introduce a resolution field for the EV_REL scope. Not sure how
> > > > to do that either and let's be honest, it wouldn't really be set by
> > > > the kernel for most devices anyway because it doesn't scale well
> > > > (would've come in useful for the various dpi settings on mice though).
> > > >
> > > > That's all I can think of right now. For any solution - the libinput
> > > > bits are the easy ones, it's the inertia and possible other input
> > > > stacks that are the killer here.
> > >
> > > Yeah, none of the above options with new resolution, or event code
> > > appeal to me too much.
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry
