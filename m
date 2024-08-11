Return-Path: <linux-input+bounces-5511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC694E3CC
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 01:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEBC01C20ACE
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 23:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A179165EEC;
	Sun, 11 Aug 2024 23:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCPDhaU2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE32AF1A;
	Sun, 11 Aug 2024 23:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723418091; cv=none; b=gvjM016rQDw9MfteFyvOoda83vliY4Td9F0kB+B/HhcLqoyvmKHz/88V9aGDVgX4+tJs/f0SkRwaoGQmV8vfkrpNlG92WPV60nJhXWX+hMZDhTi4AgHl7aUjn6ZDBDW5KlCyThjR4fYy8xJy4WF+zffuqVxuUz8w22m1jFXfVi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723418091; c=relaxed/simple;
	bh=47KTaOPLA8kQsd6hUmt5DxZJM7FrTsUqgY8Mj23Qax0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQomOKlLXptBJpQu1K+oGbqI2lWkX0uuHfEawIEdAE6Dwv4ZC5J6sDAKFnFNnjOSNFzKtkgUDkJp5vOEsD0R/TKD1Y1zTtJsE5dIuIF8BvNKBhEOnT668fjXcvIclLKfJiMpnF4ahnjKzvUfNOBnA4kboj0tONYzlsRJhwJU9hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCPDhaU2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2cb576db1c5so2467787a91.1;
        Sun, 11 Aug 2024 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723418089; x=1724022889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47KTaOPLA8kQsd6hUmt5DxZJM7FrTsUqgY8Mj23Qax0=;
        b=aCPDhaU2HlqwEuaJiNUzSI0uS/cMChm/5b6f0zZLqa8o9pSRG6nfwHJtKu8eUyB61c
         VLlN85TBromsR/pBukqdcOPLxnoUyvPSu1bB6iHKc8w0Net+ho+H4sckFhEEJUnZzIyy
         d8Sj1hY7tIr8kKixRH5y+S2R94bg0U94kooEpmS2n0CzOxThkXPtQLvCJzVqZ5hk+jbs
         pEqnuBcTssm+0xmMuLsnYBEZDbO9PdeEqPE4YyF/6n9iJl0gg9O81eFL6lO/hpUCCkHr
         xf1ZuqDdIAUEEocmOgtOmdTA7bmq6e8n9dgYgB9uGyPCgIOVl+Ko01q63f1mUfqCV0sb
         RtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723418089; x=1724022889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47KTaOPLA8kQsd6hUmt5DxZJM7FrTsUqgY8Mj23Qax0=;
        b=Aa1z7Wi6dB33V4P4HULhaFSiTCbFZI2pgZWWiV2kZlgAaDN/lR3IK38RIdzhE+wtld
         cqVCkYaKNOM4XBacef919wwdsyh3SAZoL28+1k6T4AzJAeou9a0gt1RwLTDawu6QURIV
         E/tm16FntRKy/cqpimGjW5eo6MVcpTkQ2nq99yuj/aCTmU+vS5/JKI4uS727y3K1RaRI
         46HtjxSQEfp3cH2vE2QdbVevMYx03MRCsFGjcNYjXrcps2Jge3AydGRv2TEGbBJp9y09
         qxtTyc+ii02bMUONCGaN8jdbu1YX7QvfjcBK4kqnRNHMklJ/Sa9yMU7OAORQjA1SIwJI
         G39Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9xdDjcNhUFUrd4aRXMcXUCNrcGZ7UCHbKEAyDn8ihBvlvBT9Ng5O/OjpUy1xefWOmINYwSx2mSILprxN4fKcqNzVPqtvjZvWbjoOnqIPPYB78ew3KHXTqINWRLjQUB0AKveGmG8XOjpE=
X-Gm-Message-State: AOJu0Yyu4lv+9ou9oeyV//uKXupB/GVecB9qD55LpmkaGnPrVQvFbtxz
	Rbn8wFzVNBWOydXVSXYTxoTlhqoe9G3eR0mbRdT4pVN7KrUbT79q
X-Google-Smtp-Source: AGHT+IGTn4YebnzoVXs/zi+DSW1wtB2HjjDeAduQzXG5wLH8Gp9nsgCFtARrHyJri6puWDiuI3HjRg==
X-Received: by 2002:a17:90b:3b88:b0:2cd:27be:8218 with SMTP id 98e67ed59e1d1-2d1e7f9a0c1mr5662835a91.8.1723418088446;
        Sun, 11 Aug 2024 16:14:48 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c8042asm6822333a91.21.2024.08.11.16.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 16:14:48 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: luke@ljones.dev,
	bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Derek J . Clark" <derekjohn.clark@gmail.com>
Subject: Re: Re: [PATCH] hid-asus-ally: Add full gamepad support
Date: Sun, 11 Aug 2024 16:14:42 -0700
Message-ID: <20240811231443.43986-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
References: <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Antheas,

Having been one of the many testers of this patch set, having been the one
who added support for it to InputPlumber, and being in the position of
actually having a device in hand to validate the patches in ChimeraOS, I am
fully qualified to address your "concerns".

> Hi Luke,
> thank you for taking the time to reply.
>
> And everyone else, thank you for putting up with my broken line spacing,
> because of Gmail. And perhaps the lack of in-reply-to because of mailto.
> Hopefully in-reply-to works this time ;).
>
> First off, understand that I do not mean to attack your work. I tried to
> make my response helpful to you. In fact, I took a lot of time in writing it
> and preemptively saved you a lot of work in testing your patchset so you do
> not have to spend time reaching the same conclusions that I have had to.
>
> Provided you heed my comments of course, which is not clear from your reply.
>
> As I currently represent what is the largest Linux ROG Ally community, I hope
> it is reasonable that it is in my and my community's best interest that an
> unstable patch which could affect Linux Ally support should be vetted before
> it becomes part of the mainline kernel. Once it becomes part of the kernel,
> workarounds around it will become very hard. We have achieved near perfect
> controller support through userspace, so I would hate to jeopardize that.

I think you might have a misunderstanding of the purpose of kernel space and
user space. Directly implementing many of the features that you have into HHD
as a user level systemd service violates the separation of the kernel and user
protection rings put in place by the kernel architecture. It is not incumbent on
kernel maintainers to respect that just because you have a lot of users,
especially considering that you have created this problem for yourself.

> In my previous email, I gave you my preliminary thoughts without having time
> to test your patchset. Of course, as I noted in that email, I will be testing
> and integrating support for your patchset, personally, with an Ally X unit
> I will be getting access to close to the end of August.
>
> I do not think there is value in arguing, therefore I am not happy continuing
> the discussion under this tone. Hopefully, in a few days you, will have
> another look at my comments, with a level head, and address them.
> I still believe that they are valid and that if they are fixed, I am more
> than happy with your patchset merging into the kernel.
>
> Since you raised some technical points in your response, let me disambiguate.
>
> > You're repeating information that has come directly from me.
>
> Indeed, this specific point (XInput being deprecated) came from you.
> I am just bringing everyone up to speed, since I feel your patch missed
> some important context.
>
> > I have many records from many MCU updates. It doesn't happen. (referring to
> > relying to the endpoint descriptor instead of HID Usages)
>
> In my opinion, using the standard Usage Page and Usage the controller reports
> remains the proper solution (this is what the Windows driver does).
> Remember that if there is a breakage due to a firmware update, users will
> become unable to use their device as they can not update the kernel.
>
> Using `desc.bEndpointAddress` may be appropriate for a userspace tool or an
> out-of-tree kernel driver, but perhaps not for the mainline kernel.
> I am happy to be proven wrong.

Multiple kernel drivers use desc.bEndpointAddress, with subsystems ranging from
i2c, isdn, and multiple usb drivers. If you want some concrete examples of HID
drivers, look at hid_thrustmaster or usbtouchscreen.

> > "Attempted"... I *did*. You've failed to notice that what I've set is
> > what is reported by the HID report.
>
> I am a bit confused here. I thought the purpose of your patch was to convert
> the HID report into what xpad would export. That means respecting xpad, not
> a random HID report.
>
> In this case, the absinfo (with `input_set_abs_params`) needs to be set
> according to what is set by xpad, which is signed and from -32768 to 32767
> (referencing both the Linux Gamepad Specification and the out-of-tree driver
> xpadneo which seems to be the prominent driver providing support for
> controllers similar to Ally X, i.e., Xbox One bluetooth controllers).
>
> I know from experience that Handheld Daemon will have a problem with this.
> But alas, I was not referring to Handheld Daemon being the problem here:
> it is simple enough to fix it in there and I will do it when I add
> support for your patchset (would rather avoid doing it or doing it and having
> to revert it of course). I was moreso referring to other userspace
> applications without this privilege.

Steam has no issues detecting a normal i16 axis range from the u16 provided by
this driver. It isn't an issue with InputPlumber either. This seems to be an
issue you with you not properly detecting and normalizing axes for translation
in your userspace implementation.

> As for why I have to add support for your patchset, it is simply because
> it being there changes the controller mappings, so I simply need to add
> an if statement that uses the standard XInput mappings when it is available.
>
> This is not to say that the end result will be as reliable as without your
> driver, as Handheld Daemon will then be at the mercy of your kernel driver.
> So please, do extended testing and I think with e.g., ChimeraOS 46.2 being
> released yesterday with your patchset, you will get some valuable
> feedback soon enough.

> I know that I have spent multiple weeks already optimizing my implementation,
> having released it close to a month ago. Which is also why I am not in a
> rush to add support for your experimental patchset.

I have dozens of hours of testing done with these patches on both the Ally X
and the original hardware. There aren't any issues that I have found that fall
under the scope of this patch set. Calling it "experimental" is expressly
unfounded, especially so considering you yourself admit you haven't actually
tested it.

> > It is a very different story in a kernel driver... (referring to the 80ms
> > delay used for Xbox+A)
>
> Please understand that I have spent weeks of effort debugging and optimizing
> the Side Menu behavior of Handheld Daemon. In fact, it currently implements
> three different ways of opening the Steam Side Menu (keyboard, extest through
> the gamescope X11 socket, and as a last fallback as Xbox + A). When I say
> 80ms is not enough, I know it is not enough. Otherwise Handheld Daemon would
> be using 80ms. The rest is conjecture.

This is 100% an issue with your software. I just completed an exhaustive battery
of testing at 8w STAPM/FPPT/SPPT on Quiet power profile with only 2 cores
active. The tests included using Steam by itself and the kernel implementation,
as well as running InputPlumber (which also has an 80ms delay) and an
OpenGamepadUI Overlay. In both the kernel implementation and the InputPlumber
implementation there was no difference between the low power mode and running
without restriction on either the Ally or Ally X.

> > It is done on a worker. It is not blocking the kernel....
> > (referring to xbox+a holding a spinlock to send the key combo with msleep)
>
> Repeating myself:
>
> > > In addition, you are freezing the kernel **driver** to send those
> > > commands for 240ms which is around 100 reports.
>
> Which in my opinion will become more like 300ms. Freezing the controller for
> that long is not ideal (I know you are not freezing the kernel).
> Please revisit this.
>
> > Please describe how you think it is broken? (referring to `mcu_powersave`)
>
> Quoting myself:
>
> > > This feature remains broken when the device is at low TDPs and unplugged.
>
> e.g., when the Ally is set on its quiet mode and or is below 12W, and is
> suspended unplugged, with Steam and a game running. In this case,
> the USB controller of the Ally simply does not wake up and RGB breaks.
> The occurrence of this given those conditions is around 40% of the time.
> This includes testing with or without your DMI table patch by the way.

Your RGB interface in HHD is another good example of bypassing the kernel
with userspace. Use the mc_led interface provided by this patch set. It works
the same as the out of tree Ayn and Ayaneo drivers I wrote that you're already
using.

> > Does not work how? (referring to `ally_mcu_usb_switch`)

> Seems like a DMI table always sets it to 0. I do not know why. However I do
> know that as part of our validation on the distribution Bazzite which took
> place prior to you submitting your patch, we tested both adding an or for
> ally x and a dmi table, and the dmi table did not work. Post submitting your
> patch, there was a 5 day brief period where both the unstable ChimeraOS
> kernel and the CachyOs kernel integrated your patch before they also
> integrated the patch I am replying to (which makes Handheld Daemon not work;
> for now). During this period both the original ally and the ally x regressed
> when `mcu_powersave` was disabled.

File a bug report. mcu_powersave is not relevant to this patch series. The LKML
is not a forum to voice grievances over any tangentially related issues you find.

> > I test, mate. With the default kernel and empty userspace.
>
> Unfortunately, this is not how users interact with my kernel patches and
> Handheld Daemon. They usually play games with SteamUI running in the
> background. Often, this includes setting an aggressively low TDP, and multiple
> suspends back-to-back while in game. This is the standard I hold myself to.
> And I would expect no less from a mainline kernel driver.

> I hope I replied to all your technical claims. If I missed any, I am
> happy to clarify and expand where appropriate.
>
> Again, good luck with your patchset. Hopefully, it will merge with 6.12 and
> Ally X owners will get an acceptable result without the need for userspace
> tools (albeit without gyro, back buttons, and RGB being part of the
> controller).

> Best regards,
> Antheas

Preeminent regards,
Derek J. Clark



