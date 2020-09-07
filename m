Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E43F25F1F3
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 05:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgIGDGE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Sep 2020 23:06:04 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:54919 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726341AbgIGDGD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Sep 2020 23:06:03 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 606755C0094;
        Sun,  6 Sep 2020 23:06:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 06 Sep 2020 23:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=WuFqT77QlCSP+p4RVXQkunGg3RX
        ROrmMgDNlCMmcxr8=; b=DsdrCggv2/nheHOaM/G2/iL8pLVqzfpw4EEz8q08tpa
        RzdFZqZX7V/Lr160i10gMX1/EKfT18H7KlgJuPkUFeR8Guf2jtIM2CtITfD9ythA
        vrGmG3V+EGGelz8G8y/cGBxhnzzt+16d/+uldzULTc0xqMXAi9vP1jAN6jl0/ZIJ
        RkJVlJOAJYZE7uz8SZGzDwZfi5IfeWR8xcHp4R+g4l64qTBKIWLbTbBi/wYQIkZF
        LnPJXZZw9SM+asXVVfdP6yqjA7F3Eb8kGuEKxnzUv39xkZjT25W0IOH/ICKBn7gV
        VTVA3qRQM1JQ3VvZLKsEm8GjjxrkMHsf+morEnpxSUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WuFqT7
        7QlCSP+p4RVXQkunGg3RXROrmMgDNlCMmcxr8=; b=BDFyPTlegNBiMQmTa+knQ7
        HTMlHUEWso1PzS8yoM5BUD3gWaH5wGAh0MZ+hnaXSsFZCum/K0BQg2qnpB41eUNC
        6V5eM/yP3l6NR+qgrgevjM7sYwys2MNbhXWtKBG/vsRWgsyzOYbjNCikLaHmMyvE
        EEkUAFPn8m8z1OQrS7RMrkw6HgS91XG8bU4PkCnBEeQ6brSRiuVjddYWEs3N8nyd
        lXPx/IU1oESrrtW3Vi1VdsE7pvZsQSRpMQaq1Bu9vHihSZ+DWtUhA+RchLtQKWJS
        J1uDwPusOF4c+BQpKoJRMC5BY9I9I3YCggAEZNogGa9xveFFNjk5QS7fLEn8ROkQ
        ==
X-ME-Sender: <xms:mKNVX8zMqXVP4b8YrLuKbr4wO2QWJ1-WGbL2jygUON0JaMyBx_4_6w>
    <xme:mKNVXwSXUaOTB2XC6zFmqq-oHOhGCneBEh5bnXLsw2x9vii887xMgMZ8Fvs9UuHL4
    K7EoV8SNqfEFawodlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegledgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrjedurdejfeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgv
    rhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:mKNVX-U8e34Ud2oW-vPDJu9W-Rn8ssdNqcLNimpYRd2n2-wTvu42nQ>
    <xmx:mKNVX6gXLpFpEFL4Wf-jbq_B05Ktdkfz0pwPolbwdQuDVUlAlSB5kw>
    <xmx:mKNVX-DGBPXOk1s8I6-3zxXi5NyN6QQCkCFb9GmYx-MMoOSa_Ft9BA>
    <xmx:maNVXx8nK5lNNKIMwtfqx1VJ431Q6uclH22B3IczhndnZYzWG_EF3g>
Received: from jelly (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 33620306467E;
        Sun,  6 Sep 2020 23:05:57 -0400 (EDT)
Date:   Mon, 7 Sep 2020 13:06:34 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org, Javi Ferrer <javi.f.o@gmail.com>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200907030634.GA13082@jelly>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
 <20200606181806.GR89269@dtor-ws>
 <20200612194619.0ac97cf2@primarylaptop.localdomain>
 <20200614235735.GA11069@koala>
 <20200623182540.0ed5de81@primarylaptop.localdomain>
 <20200626000439.GA108136@koala>
 <20200726234229.4edf73b4@primarylaptop.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726234229.4edf73b4@primarylaptop.localdomain>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

apparently I never replied to this, apologies.

On Sun, Jul 26, 2020 at 11:42:29PM +0200, Denis 'GNUtoo' Carikli wrote:
> On Fri, 26 Jun 2020 10:04:39 +1000
> Peter Hutterer <peter.hutterer@who-t.net> wrote:
> 
> > thanks for the log. Basically - the problem is that
> > ABS_MT_TOUCH_MAJOR and ABS_PRESSURE are completely unrelated on the
> > device and the latter has apparently random values. 1585880999.248531
> > is an event where you go from almost max pressure to 0 without
> > changing touch major.
> I also tried not to touch the screen too hard, so it's normal to have
> some pressure variation as well.

some pressure variation is fine, but having major unchanged while pressure
changes significantly is a problem. Especially with a human finger the touch
size would uusally change as you increase or decrease pressure simply
because the finger gets squished.

> > Since pressure is more common, you'll have to expect that userspace
> > may ignore major/minor and handle pressure instead where available.
> > Doubly so since historically the major/minor value range has been
> > completely random while pressure was at least somewhat predictable.
> > In this sequence, your touch major ranges from 4-14 despite the axis
> > range being 0-255.
> > 
> > Historically, pressure has also been used as equivalent to touch
> > size, so decoupling touch size and pressure is tricky anyway.
> > Speaking from libinput's POV I would disable ABS_(MT_)PRESSURE in
> > this device since it's not reliable to detect a touch. But then we'd
> > still need a quirk in place to tell us what the possible touch major
> > range could be to make sense of that number.
>
> I didn't understood if I needed to do something about that patch or
> not.
> 
> Here I'm mostly interested in fixing that issue for future kernels
> and/or userspace input stack releases.
> 
> Am I supposed to fix the issue in userspace? Or is the advise on
> libinput a way to deal with older kernel versions? Is the quirk
> meant to be in Linux or in libinput?

libinput uses ABS_MT_PRESSURE with some defaults based on the pressure range
unless a (libinput) quirk tells it to use the ABS_MT_TOUCH_MAJOR axis
ranges. git grep for the AttrTouchSizeRange, AttrThumbSizeThreshold and
AttrPalmSizeThreshold and that'll get you there.

Given the recording, i'm assuming pressure is not reliable on this device so
you will have to add the quirk.

> I'm currently testing with GNU/Linux as it's faster, but eventually I'm
> also interested in running Android with a Linux kernel that is as much
> upstream as possible, so I also need to understand the API here: Is it
> up to userspace to interpret if the values are somewhat valid, or is it
> up to the kernel to return valid values?

yes, it's up to userspace. there's some documentation in the kernel
regarding the major/minor axis ranges but not a lot of devices use it that
way. Hence libinput requiring a quirk for this. Not 100% what other input
stacks do though.

Cheers,
   Peter
