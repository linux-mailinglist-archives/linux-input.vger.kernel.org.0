Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A57467056
	for <lists+linux-input@lfdr.de>; Fri,  3 Dec 2021 03:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243021AbhLCDAp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 22:00:45 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:60939 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242005AbhLCDAp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Dec 2021 22:00:45 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 6C40D3201134;
        Thu,  2 Dec 2021 21:57:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 02 Dec 2021 21:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=PlXh0FiZ7NUPdbaXGu8vcmpZDWB
        lIttRE8J0nknpW0o=; b=Kr6NO5wrwovFzO3Q3kzP+S+zJWs92ZxCuVD/EFaAprl
        60DsxVUuva7LnqOQ4j76MkN6ql5TkNLVSmYdqxSxzUsrLniltDqWGezgJZ7436qL
        SxmClSe0Jux/Zu66Et4tS3Oc4BjBcC8Ys7IXvJhRtX2Wbu6GuuzP8MGFCJrTQcKR
        7AR4BWkbUScOtDYiYhA++ZPeTtbUouicNi66Rtm+yiVq+lGjwprneBAEe/5F9EFp
        2YNMrFHZbMJ/DYsE9YQyU4HEGecSSjVAa2hZgBl1XX6X6b3KdnGibwmCPyBQjMxG
        yqkjwqQvwAnCRO/NCmxccqCk4aBYz7JafgjdfoMjkkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PlXh0F
        iZ7NUPdbaXGu8vcmpZDWBlIttRE8J0nknpW0o=; b=M1LGsW8flhY9NnHdVFxQaN
        hl3bzzYutLjNbjVr9T/x25ExXbKGeFn50U+7tJYbwt8AGjlzoCl9+IaY4p3ScNc3
        X8kOiZI0oYcwa4q55Qyzvc0rVl+Gu/i7H+3szJ3YEwJ7Is8ru9ih9okgSLxS0Hlp
        IVj/iUs2WcLazQlWQMF71Gku2Fo685+sm5HCFqV1N3laM89YFo1Ks6BcETI+Q8Yh
        ImQ72D1G7BKjrAIbK60qz+FsG+ayxM+8evoFxtrodNQzLVHLhwxDw9ZDN7rNxZsl
        CraRQDAQ2F3fx26XFoDA9XH4ZAC1u37ZeJT3EWNvP6dY5PqIuaCqMSSaZ4ID0M/A
        ==
X-ME-Sender: <xms:kIepYV5_oogA-ahgM4o9ffN797FukWUXG6jrET3nNEeHevyEQ4BfwQ>
    <xme:kIepYS7LPGKkoDa_zY-m75P1ueKgMtKYa_UZ805BeKgi3KciaVk3XFGYeesPwKYM3
    TRyyQn1QtZ96Auyvo4>
X-ME-Received: <xmr:kIepYccuNpwY_5D4AKgi8R5itCu_8tds4TxePSGt7T95JOQZiCjiOfgUfb1EWXvUKBSbifaofnmWofYyxAmmlfxNT09z65nRrOqy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieeigdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeehhfehfffgheelgeeuudelhefgvdefveekudevjeevjeev
    vefggefguddufeeuveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:kIepYeIgcCfIBAEeuv2cZ2iP9xmKCosg-WOPkmLKoI-HcsOxp44ReA>
    <xmx:kIepYZLQ5BAYWFPXpPMPJCXnAuxaR6sFt_OtfuwYBwXvT-dNJ0z1cw>
    <xmx:kIepYXyWTiiGAR9DFyOThncb5uTZiKWCj0FBI5VimvD1khYeheFEyQ>
    <xmx:kIepYWET64eAZwDmak6ATtGVes7M4SDENeJWZzbMEZOWNNLAtMfXDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Dec 2021 21:57:18 -0500 (EST)
Date:   Fri, 3 Dec 2021 12:57:12 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Angela Czubak <acz@semihalf.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        seobrien@chromium.org, jikos@kernel.org,
        Dmitry Torokhov <dtor@chromium.org>
Subject: Re: Forcepad interface design proposal
Message-ID: <YamHiBW8nI8Lxeef@quokka>
References: <CAB4aORVm7hFDVE_zekZZxTEkXgBJD=HzEekMWNAZs3kV05JU7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB4aORVm7hFDVE_zekZZxTEkXgBJD=HzEekMWNAZs3kV05JU7w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Nov 30, 2021 at 02:51:48PM +0100, Angela Czubak wrote:
> Hi Benjamin and Peter,
> 
> I am refreshing this old thread in order to clarify some things
> discussed here :)
> I specifically got lost when reading about virtual IDs for effects.
> Asking more inline.

[...]

> > > > > > > So, the solution we came to this morning, while talking to Peter, was
> > > > > > > that the HID driver for a simple haptic HID device would allocate a
> > > > > > > virtual device memory to store the effects and the parameters.
> > > > > > >
> > > > > > > This way, we can:
> > > > > > > - upload effect WAVEFORM_RELEASE with its parameters in id 0 of the
> > > > > > > drvdata of the device
> > > > > > > - upload effect WAVEFORM_PRESS with its parameters in id 1 of the
> > > > > > > drvdata of the device
> > > > > > > - ...
> > > > > > > - upload effect WAVEFORM_VENDOR_ZZZ_ZZZ with its parameters in id N of
> > > > > > > the drvdata of the device -> userspace will use it while scrolling for
> > > > > > > instance
> > > > > > > - ...
> > > > > > >
> > > > > > > Then the kernel on BTN_LEFT press can automatically trigger the effect
> > > > > > > with id 1 and the one with id 0 on release in the case of the
> > > > > > > autonomous mode mentioned below.
> > > > > > >
> > > > > > > To solve the question of knowing which effect should be loaded in
> > > > > > > which slot, I think we should rely on a userspace helper (udev?).
> > > > > > > We definitively not want the kernel to keep a list of devices to
> > > > > > > effects matches, but having a udev database (hwdb and intrinsic?)
> > > > > > > would nicely solve the issue as we do not need to update the kernel
> > > > > > > for each new device coming in.
> > > > > > >
> > > > > > > From the kernel driver, we can populate the WAVEFORM_PRESS and
> > > > > > > WAVEFORM_RELEASE with some sensible parameters, but userspace should
> > > > > > > be allowed to override them.
> > > > > > >
> > > > > > > The advantage of having this virtual memory of device effects, is that
> > > > > > > each userspace implementation could use its own matching for effects.
> > > > > > > For example, libinput might want to say:
> > > > > > > - id 0 -> BTN_LEFT released
> > > > > > > - id 1 -> BTN_LEFT pressed
> > > > > > > - id 0x1000 -> scrolling up
> > > > > > > - id 0x1001 -> scrolling down
> > > > > > > - id 0x2042 -> hard press
> > > > > > >
> Was there some idea up then to implement virtual effect IDs? Right now
> it seems that
> the number of possible FF effects is limited to FF_MAX_EFFECTS and
> that it is the kernel
> and not the user space that assigns the ID when an effect is uploaded.
> Or was it more of a suggestion for the future than a requirement
> regarding the simple haptic feedback implementation?

I have to admit I barely remember any of this, it happend around a very busy
time and i have little recollection beyond re-reading this thread. The above
was an idea on how to handle custom waveforms, we never went past what was
suggested in this thread.

Cheers,
   Peter
