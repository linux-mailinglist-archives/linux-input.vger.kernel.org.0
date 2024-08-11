Return-Path: <linux-input+bounces-5504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC194E0A8
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 11:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBC11C21081
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802BA2B9CD;
	Sun, 11 Aug 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="XJTyb3iT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZlfgoODc"
X-Original-To: linux-input@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04D3D969;
	Sun, 11 Aug 2024 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723368160; cv=none; b=rTu349pP45ifzaTklGe8YsNxxEUVBbhFSaXbfk4EI7ZOB2c+Uv/odqqqsarbAsDR8b0Jlk5j7mJFnxrE3prYDNpgBKh5AEWB24xgI79prSRvwuMyteDDOHHbIEHslM+b44102n73Fga/sJ32ysQCZLRtiPbkl5t0IHFuQzBFiOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723368160; c=relaxed/simple;
	bh=owZ4KF0qdrz087DO/3CWdbMlQfqB1H3u531+Nx3QMUc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bFpXdisyUT40Wjxs9JBkfZPVyvgnvWtX1EhqEVC23yZTZAiGMDaEPVvYJ2HDx4NN6DCcaw1wp8rOBK1lZZciGfQYRRO7WDSYZuf5lPR6f72nTKP9K/RciR0PW7udWgnUMhkhKkir4P+UF2UNvWPZ7ap+LJN9PeOcpYZ5wN7nSqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=XJTyb3iT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZlfgoODc; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4627C13807E7;
	Sun, 11 Aug 2024 05:22:37 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Sun, 11 Aug 2024 05:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723368157;
	 x=1723454557; bh=igcMJ+br0SbtSjgPx9k1pidzNRWIcYzar2UqL1qu7C8=; b=
	XJTyb3iTcOKfUNf3NxX8v+9JnR8bxxbGRkx0cSSD5k9FUIxOsj0Yk4TjmyVmEONE
	hPHeZyHCeVlJ0sUbeck6/a/NjOt5qrYnll04e1dGt9SGuscljGdSxslFL18pzoOS
	cw/qTi0ODQSejnLd8En+fb4AdHYQ++fjrrGaU2guYH1LL1hLJUWL3tasjj/Ijl2v
	3/Jbvz0fanAkBZ5LpU/43FncHK6M/tSRyQwHueCm1M0NSIie4YMtAMz65I0GX5bk
	G0eNzsLX7YADlYC7lqk/Psy/MH/+dBU1wu+Iz3tY2R+hbuZWEkLn57YJoSFjr9i5
	xA7YlW4HLRi2ghOtjN/39w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723368157; x=
	1723454557; bh=igcMJ+br0SbtSjgPx9k1pidzNRWIcYzar2UqL1qu7C8=; b=Z
	lfgoODcD6mE+Zg1QNL2zgpMsV0fXJa/wDIqNzCT69GwBfqG74kS0jGltxTmCjrtT
	wpQNqIXBgOkq51Yq4tVL3FI2qNVdbeFfD45KBD4AK39gtuWtPZktE1Tjsz8FQDH+
	8PgKW+2XXokT6G0hI+f4cG7s2dlRhoHqP+obvH7AZw8dlNBJL32F265bGvOIXc7m
	84cdzBxkVG1R2puS4lLClsDIE4Hv4w315R2rPuBMae7EVU/zxY7C+ASwGRm7t8b9
	ygue0iMVEy/jNSNACVzXs3GAQGB/yjsDI2MNLIK0cFc9HkZyq2zYgiges4UHX4a4
	FKdkKINQl/T136KrKvmmQ==
X-ME-Sender: <xms:3YK4ZoFgxu06-MPVgo8QrgXw7kCPrfbbgftMCiIUZ2v6rXOm88N6zA>
    <xme:3YK4ZhUZDZX9xAa6HQyynydjUS5RvJWzxu8JUq04ToRbvU12-O9bWEb6c7O1u8x7v
    RJESVjQ-7UU8ypNEF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefo
    ggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnuhhkvgculfhonh
    gvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepjedv
    geeuudektdejkefgjeejtefhvdetgeejkedtleelfeeitdeuudfftdduudegnecuffhomh
    grihhnpehgihhthhhusgdrtghomhdpthhhihhsrdigsghogidpsggvnhguphhoihhnthgr
    uggurhgvshhsrdhsohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlkhhmlhesrghnthhhvggrshdruggvvh
    dprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehj
    ihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3YK4ZiLk2If9KB96eEfrcMwfu4hDJzLF7UhWh3kv-AInuRn384wgDg>
    <xmx:3YK4ZqEai8TExA6w7qDc9LwhhqjqZtdxi80dxqbyQC_hVHxs0-osmg>
    <xmx:3YK4ZuXA1g-K4VBykyHKxgAtjVF3m4NYolfiSZ_eEi57nDQs1Y9qRw>
    <xmx:3YK4ZtN7wJmByWQ4Wh9Jfg6RdG-TwyfAyftnNYLPIFom-VMeWaFA7Q>
    <xmx:3YK4ZtRo3zYHLpwj5lQhoMTT-FyIvJAm9qbub7anEV78GuC1l0Q7IK6i>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E8FB32340081; Sun, 11 Aug 2024 05:22:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 11 Aug 2024 21:22:16 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <9078b350-27a8-48af-a19d-2adaaaa16f9f@app.fastmail.com>
In-Reply-To: 
 <CAGwozwHDwswam-Q40YqXMDJt6oui=UHv-bkjuF+X5fOmT+6PaA@mail.gmail.com>
References: 
 <CAGwozwHDwswam-Q40YqXMDJt6oui=UHv-bkjuF+X5fOmT+6PaA@mail.gmail.com>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 9 Aug 2024, at 3:35 AM, Antheas Kapenekakis wrote:
> Hi Luke,
> I reviewed this patch and leave some of my thoughts below.
> 
> I am the creator of the Handheld Daemon (HHD) (https://github.com/hhd-dev/hhd)
> app, which offers a lot of this functionality using a userspace implementation,
> and have thousands of handheld users, a lot of whom are on both Allies,
> so I believe I have some valuable feedback on this.

Then you are aware that the work I do in kernel is almost always targeting ASUS ROG. You will also be aware that my goal is to enable default user experience *without* the requirement of any userspace blobs - this includes moving things from my own daemon to kernel where possible so that users do not require a userspace app at all if they so desire.

> In Ally X, Asus seems to have been told by Microsoft that the XInput driver is
> being deprecated and they've had to move on to a different one.
> For Asus, this meant doing a HID implementation which seems to be
> similar to the Xbox Adaptive Controller, and using a custom windows
> driver for it
> in Windows. Therefore, unlike the original Ally, which did not require Windows
> drivers to have its controller work, Ally X does.

You're repeating information that has come directly from me.

> First, you are hardcoding `desc.bEndpointAddress`, which is error
> prone and could
> break in the future with an MCU/EC update.

I have many records from many MCU updates. It doesn't happen. This is even true right across the ROG laptop range for as long as I've been tracking these. ASUS is remarkably consistent.

> HID gamepad, the usage page is 0xFF31 and the usage is 0x0080. And perhaps there
> is a gamepad driver already that could support Ally X with a simple quirk.

There isn't. The ones that might support it are not being upstreamed. And that is also *not* my goal here (a complete and accessible default user experience with zero dependency).

> Following, you attempted to mimic an Xinput device, but your driver does not set
> the ABS values of the device properly. For your convenience, here are the values
> from the Legion Go, which uses an XInput gamepad:
> ```
>    0x0000: ABS_X
>      > [val 0, min -32768, max 32767, fuzz 16, flat 128, res 0]
>    0x0001: ABS_Y
>      > [val -1, min -32768, max 32767, fuzz 16, flat 128, res 0]
>    0x0002: ABS_Z
>      > [val 0, min 0, max 255, fuzz 0, flat 0, res 0]
>    0x0003: ABS_RX
>      > [val 0, min -32768, max 32767, fuzz 16, flat 128, res 0]
>    0x0004: ABS_RY
>      > [val 0, min -32768, max 32767, fuzz 16, flat 128, res 0]
>    0x0005: ABS_RZ
>      > [val 0, min 0, max 255, fuzz 0, flat 0, res 0]
>    0x0010: ABS_HAT0X
>      > [val 0, min -1, max 1, fuzz 0, flat 0, res 0]
>    0x0011: ABS_HAT0Y
>      > [val 0, min -1, max 1, fuzz 0, flat 0, res 0]
> ```

"Attempted"... I *did*. You've failed to notice that what I've set is what is reported by the HID report. When you use the event and js interfaces it is shown as above. I invite you to modify the driver as you think and see the results for yourself instead of suggesting I don't know what I'm doing here.

> quirk it only for the Ally X. If you break HHD, the chance you break
> userspace in
> general (e.g., random proton game) is very high.

I don't know what HHD is doing, but it sounds like it is not very compatible with anything anyone else does - particularly in kernel when functionality *is being added*. InputPlumber on the other hand was easily able to support this driver.

If functionality is missing for a device the proper thing to do is add that upstream to the kernel for *everyone* to benefit from, not keep it local to a userspace application where it benefits only users of that application and results in yet more duplicated effort, fragmentation, lack of or less peer review.

> I recall multiple examples of this in Linux as well, e.g., Solaar for Logitech,
> asusctl (your daemon) for Asus, libratbag for mice, and OpenRGB for
> rgb which includes
> the Ally. Can you justify the deviation here and the need for a kernel driver?

As I said, default user experience *without* requirement for userspace - the appropriate place for this is in the kernel, not in userspace. The job of the kernel is to handle hardware and expose safe interfaces for it (asusctl exists to expose a safe userspace dbus API for the functions I add to the kernel that doesn't require root. And I code for kernel first, asusctl second - the exception being RGB led because that is difficult to handle well with mcled_class when so many laptops have varying levels of function here - thus I await the outcome of a very long discussion on LKML regarding this).

Throw any plain distro on Ally with this patch and it should just work. And again InputPlumber was able to work with it without any fuss and I believe has gained a lot from it. Why can't you?

> 
> I am afraid that it might be unreliable, and applying kernel patches
> is something
> very difficult that most users can not do. Furthermore, given the user chooses
> to install a userspace program to manage their controller (e.g., HHD),
> you should
> ensure this driver functionality can be disabled, from boot, so that it does not
> interfere with userspace programs.

It is so far more reliable than a python daemon and it all gets reviewed heavily before being accepted to mainstream. Most users do not apply patches, they use a distro that provides everything required.

> For example, one problem I recall that before we removed the XPAD patchset
> from the distribution Bazzite, I noticed during reviewing logs that your patch
> regularly failed the ready check on certain allies, and after trying
> the ready check
> myself as part of HHD, I had to pull it after 10 hours because users
> came out of
> the woodwork to report their controller misbehaved.
> Of course, in those cases HHD handled initialization, so your patch failing did
> not affect functionality.

I've had zero reports of this.

> ## Xbox/Xbox + A Quirk
> As mentioned above, the vendor device of the Ally reports the front manufacturer
> buttons as HID commands from the special vendor device. This allows Armoury
> crate to open in windows. Of course, in Linux there is no Armoury crate, so
> these buttons are unused by default. Userspace programs can fix this
> quirk and your previous kernel patches do as much, by exposing the buttons as
> F15, F16, F17, F18.
> 
> A final component to this patchset is taking this vendor device and making it
> accessible from the gamepad driver. This is uniquely possible on the
> Ally X, because
> the gamepad happens to be HID and located on the same USB interface, so you can,
> with a bit of trickery, receive the front button commands from the
> gamepad driver.

There is no trickery. It very simply takes the event and puts it through the shared input device that was created - dead easy with a driver with global state.

> This allows you to quirk them, and here specifically for steam, to
> Xbox and Xbox+A
> ("BTN_GUIDE" and "BTN_GUIDE+BTN_SOUTH"), which have similar functionality to
> the Steamdeck's steam and three dot buttons.
> 
> In my opinion, that borders a bit on being too opinionated, and perhaps e.g.,
> Asus would also share this opinion. Imagine if Asus tried to add some sort of
> official support to linux, only to find out the Linux driver is remapping the
> buttons and they have to work around that. Also, combining two HID devices is
> a bit unorthodox, and may cause other issues (see `desc.bEndpointAddress`).
> So perhaps Asus needs to be consulted here?

I talk to ASUS engineers regularly. I in fact have an agreement with them, and I'm under NDA for a lot of specifics.

> Further, I have some advice for your button implementation.
> 80ms is too short for steam and is a delay I have tried before. It
> will fail in low
> device TDPs, as Steam will begin to lag and miss the commands. For
> your reference,
> HHD uses 150ms for this and I have tried 80ms in the past.c.

It is a very different story in a kernel driver vs a python blob daemon subject to GC, userspace etc.

> In general, I am trying to move away from Xbox+A as it tends to add delay and
> since I prefer to multiplex the right vendor button for double
> presses, it starts
> to become noticable. It also does not work if the user presses the
> Nintendo layout
> button in the Steam UI.
> 
> In addition, you are freezing the kernel driver to send those commands for 240ms
> which is around 100 reports.

It is done on a worker. It is not blocking the kernel....

> The first one is allowing users to enable mcu_powersave in February.
> Beforehand, it was force disabled by the kernel by your previous patch.
> This feature remains broken when the device is at low TDPs and unplugged.
> We force disable it now as part of the distribution Bazzite now.
> Applies to both Ally and Ally X.

This is not my experience on both Ally and Ally X. Please describe how you think it is broken? If you mean that the USB devices are removed and re-added - then it is up to you to account for this, just as other tools now do. The powersaving gained from enabling this for suspend can be significant and in the case of the Ally X it drops right down to a 2% use of 80Wh over 10 hours. ChimeraOS now enables it by default, and this was heavily tested.

> 
> The second occasion was 3 weeks ago when you pushed the Ally X quirk
> and converted
> `ally_mcu_usb_switch` into a DMI table. It seems that a DMI table does
> not work in
> this codepath, and it is something that we had tried over a week
> before you posted the
> patch and had reverted it. If you had asked me I would have told you as much.
> After this patch got cherry picked by CachyOS and ChimeraOS, it ended
> up breaking
> both Allies, which is not a favorable user experience.

Does not work how? And what do you mean "Asked you?" I don't know you, and your work is not my target here - the default kernel is. This is what you need to be prepared to work with just like others are. Userspace needs to work with kernelspace, and hardware interaction is the purpose of the kernel - this driver exposes this functionality in a safe way *for* userspace to consume without requiring direct (raw) access to hardware.

> Moving forward, I will try to be more attentive in the kernel conversation and,
> e.g., upstream patches. And perhaps you can be a bit more thorough
> testing before you push your patches up to the kernel.

I test, mate. With the default kernel and empty userspace. This was also pulled in to ChimeraOS Unstable as part of that testing and validation - it has been quite thoroughly vetted at this point by myself and many others.

Luke.

