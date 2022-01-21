Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF4F4959C4
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 07:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244743AbiAUGKr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 01:10:47 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43863 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233615AbiAUGKp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 01:10:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id F2E575C009C;
        Fri, 21 Jan 2022 01:10:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 21 Jan 2022 01:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=5KGVsB6DEyxog7uxjx6CaM/44dqesJUjSkMd1R
        loWcs=; b=fifJg93ye4OPoxeG1tsvNeojT+zch5CeP3Atsy+Xmv/N4z3tM0yeok
        jrPvCDdhXOb/HyG5ElayPPPegp4ap6hsnUHrH1jNMdYv2VmW/cNx+65AMbGPaItf
        7eQiWsAmxGWUPwhClV3dB80das6H+Sy9NNxWrGc2ZPc0PAtCxTM1mM3LMO3KNnao
        HtPOIsr5x46tZZHV7QUDxe/6B6feEO/sgiWiyGO/pernxQgBsopeIPgFNc8i9TJ6
        /l37NtNlRMU4ywXQ/5t6QbE90qEtu9OzfT/gYYnuDHfKiMUi1RjFpQsHbwxwbev/
        HaQ/KR9gSOCusvmqTuJnenE7VhOrI6Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5KGVsB6DEyxog7uxj
        x6CaM/44dqesJUjSkMd1RloWcs=; b=atja2sLVWF4vYCPGFH4C4evHq8Qo7SNvG
        ehlkKfewxsCsOh0CVrGeAUlVR7W5eh/ccDKy24Z3yZQydGTkUcFLdmAlg2VBZl37
        tVMOLzeF9uMdmNzPboTZAO1t7SuUPOQk4cwk6jnTyI9LlPFs+8gRNguduLDboGC5
        GRbLKt6OSZ5WcjVJ3sKFI6LQi9VOBpAlw1uAF8AD/EnI5zwdmr+VSAeS2hYAhiVW
        71Yj0UPI347Vb1dTs+pctGVh7tT0ivFLkoxyC5l1psuTXNyjnGP7vam5gw/AHkYO
        dggsAtsa+Ga19iQjCA6/xxoU1VWIwiiF1xjxTHv6dMJPtdNWiKf+A==
X-ME-Sender: <xms:ZE7qYVrisdoDEQTD6jiEUrWzs6stiaAVTW0Rfcp09icmGZrt5B6PWA>
    <xme:ZE7qYXpYCO4WyPsAltwFtjCer2hgJ8ftQ5Yq47Th173S9Sb2aMouv0_6G2JQIOK5_
    pghj3aXxJhoUDkpTJ4>
X-ME-Received: <xmr:ZE7qYSOg4yyQnF0HFRvm38gqjL7i3cN8sWUk7M5SSqaTfFOPx4Yhp5sxE-UJ0xgXe-Y4Ahn6QMNJw5ueG-N0d1xsUgZgKJM1boVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeehhfehfffgheelgeeuudelhefgvdefveekudevjeevjeev
    vefggefguddufeeuveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:ZE7qYQ4N8t3BPdQFJzhnie9S5nxaoH_2RNuYq250l4QRXuzYQGrzAw>
    <xmx:ZE7qYU7n9WCP9p9IT4cdn6zHpr29QCzjaE6zNIybcTQzQ4elNDpj5g>
    <xmx:ZE7qYYgsUpcf7z24uyMtIycIWC7uc_SI7u1xEkQl36EZmBD941OrtQ>
    <xmx:ZE7qYeRQlwo1P4y593Xw-EhBAlhlelRzzZtl8Xf4yftxvl_JKyqCOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jan 2022 01:10:42 -0500 (EST)
Date:   Fri, 21 Jan 2022 16:10:36 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sean O'Brien <seobrien@chromium.org>,
        Angela Czubak <acz@semihalf.com>, linux-input@vger.kernel.org,
        upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
Message-ID: <YepOXFQUrMB/TNDX@quokka>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com>
 <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com>
 <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
 <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com>
 <Yd5CayeX+hsZz7ZP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd5CayeX+hsZz7ZP@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 11, 2022 at 06:52:27PM -0800, Dmitry Torokhov wrote:
> On Tue, Jan 11, 2022 at 09:19:19PM -0500, Sean O'Brien wrote:
> > On Tue, Jan 11, 2022 at 12:07 PM Angela Czubak <acz@semihalf.com> wrote:
> > >
> > > On Mon, Jan 10, 2022 at 10:02 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> > > > > Hi Dmitry,
> > > > >
> > > > > On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > >
> > > > > > Hi Angela,
> > > > > >
> > > > > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > > > > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > > > > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > > > > > themselves from ABS_MT_PRESSURE.
> > > > > >
> > > > > > This needs better explanation for why it is needed. I assume this is to
> > > > > > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > > > > > then I believe we should define a new flag for input_mt_init_slots()
> > > > > > and check it here and also use it to calculate the force across contacts
> > > > > > in input_mt_sync_frame().
> > > > > >
> > > > > > Or did I misunderstand the point?
> > > > > >
> > > > > I would say you understood it correctly, though to my mind it is not a
> > > > > static behaviour,
> > > >
> > > > It should be, otherwise how will userspace know the meaning of the
> > > > event?
> > > >
> > > Fair point.
> > >
> > > > > i.e. we may want to switch this kind of calculation on and off.
> > > > > Are flags intended to be modified at runtime?
> > > >
> > > > No.
> > > >
> > > > > For instance, if user decides to remove the release or press effect (previously
> > > > > uploaded by them) and there is no default one per device, then we should switch
> > > > > the haptic handling from kernel mode back to device mode.
> > > >
> > > > Why? I think if user removes effects then they do not want to have
> > > > haptics effects. I am wondering if this whole thing made too complex.
> > > >
> > > > In my mind we have following cases:
> > > >
> > > > - OS does not know about these haptics devices (touchpads). They work in
> > > >   device (?) mode and provide haptic feedback on their own.
> > > >
> > > > - OS does know about haptics devices (that includes having both kernel
> > > >   *and* userspace support for them. If one is missing then the other
> > > >   should not be enabled, it is up to the distro to make sure all pieces
> > > >   are there). In this case OS controls haptics effects all the time,
> > > >   except:
> > > >
> > > > - OS supports haptics, but switched it to device mode to allow haptics
> > > >   effect playback when waking up.
> > > >
> > > Perhaps switching between modes should be a separate discussion.
> > > Right now it seems to me that your suggestion could be that if
> > > INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
> > > something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
> > > every ABS_PRESSURE event should actually be a sum of pressures/true forces
> > > across all slots. Does it sound right?
> > > If so, I suppose I will implement it. It should be completely independent from
> > > device/kernel mode and, what is more, if hid_haptic_init() fails for any reason
> > > the pressure sum still gets calculated.
> 
> I'd say that if hid_haptic_init() fails we should not say that the
> device is INPUT_PROP_HAPTIC_TOUCHPAD (if we even decide to continue with
> the device instantiation, which we probably should not).
> 
> > >
> > > Sean, is it OK for the device to keep kernel mode in the event no
> > > default press/release
> > > waveform is defined in the waveform list and the user removes relevant effects
> > > (after having uploaded them)? I think it was desired to remain in the
> > > device mode
> > > if no such waveforms/effects are defined and, thus, I assumed that removing
> > > following effects (in case no press/release waveforms in the waveform
> > > list) should
> > > trigger coming back to device mode.
> > > Right now it seems that switching back to device mode should be
> > > allowed only when
> > > suspending the device.
> > 
> > I agree that we should switch to device-controlled mode if press/release are
> > not defined by the device, and userspace has not supplied alternative
> > waveforms for either. If we kept it in kernel-controlled mode, there would be
> > no effect for click/release. This can be achieved by userspace by emitting
> > EVIOCFFTAKECONTROL for click and release, and never sending haptic commands.
> 
> What is wrong for not having effect for press/release if userspace did
> not bother to set it up? I think this is reasonably to expect that if
> user enabled support for haptic touchpad in kernel they should also have
> userspace that knows how to handle it. If we go with this requirement I
> think we will reduce a lot of complexity.
> 
> Benjamin, Jiri, Peter, I'd like you to chime in please.
> 
> > 
> > This also allows for the case where userspace may want to send haptics for UX
> > effects, while still relying on the device for traditional press and release
> > haptics (in the case where the device doesn't define press/release
> > waveforms).
> 
> Again, what is the difference between press/release and other UX
> effects? They seem to be the same to me...

Agree with Dmitry here - have a sensible default in the kernel and if
userspace changes it, it's now userspace's problem to do it right. Anything
more complex is just making things more complicated for niche cases that may
never happen.

Cheers,
  Peter
