Return-Path: <linux-input+bounces-5508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AD94E228
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 18:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAE921C2093B
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 16:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6647014F9F4;
	Sun, 11 Aug 2024 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="F02Eu7XK"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1A14A624;
	Sun, 11 Aug 2024 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723392659; cv=none; b=IK958dcr66lL0sOq/t+8dU0Ce5lY62AmKWl93tiQqnlS0E62hlGv9slEoO//PmqrKiKHCGGEWRPlrJbfSdByXSYIByjONjG/5EQaMqHOA927M67tcXp2vIggQRrgUcGLs5SAJtBhGqnvXgOXo64QnMgoVA9chG5lctnPCkamR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723392659; c=relaxed/simple;
	bh=K1RkmZ1XMXbmQ0IgaOltvb6q7PvX1FamB1pjg0OaYT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0wGETnyC2a+HxX3Xqd95v7WRfIOsLhWq3FUwubdFjYNtrto8dAYGXPcLHVXPNYk1Pt6LI5fbCXIpuuAyEqN9ij7k3Es9i2ftwtrmGytWyVL7e9ndAj0eqFqmaH2KdE1O3XUF8Ln/mRxJwi2jYhAE8+Mj5rZZ2pmwFN6ryAH7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=F02Eu7XK; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 6CE8C2E03AC7;
	Sun, 11 Aug 2024 19:10:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1723392645;
	bh=K1RkmZ1XMXbmQ0IgaOltvb6q7PvX1FamB1pjg0OaYT4=;
	h=Received:From:Subject:To;
	b=F02Eu7XKnTPaImNpwXKuPnbtyyOjgrovKdHWhzuljLALp071aKlRciH/Fm8ltCPuU
	 vR0FTVWAKFaRAaEiHdrNfkJnhTcJf/PFxSWp33g7YjumbyYNBq8mPM5ZKQuY5ScqGm
	 0+uMVzP74DU0ygPbNMI8wUH0GsraE70C5r2S82yg=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ef2fccca2cso37593651fa.1;
        Sun, 11 Aug 2024 09:10:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUC3LIROHArQIPD9wuoeJZv5P4SiyOmR0UfILjzAKC2tagj8MZZlCxasf+B7JpN9aOg13Tv4up9GMtUYkr7jV+/NUqB3Dm4gynBXrvNb5RfXOvX/Gm3i/MSuBV7ikTuOncJLFyfwUVDNu8=
X-Gm-Message-State: AOJu0Yw4Cqqh/EgayFKhRuXch5wjKQylvd2svB1ICNOORWinKA4c1MY1
	bPVmT7G/dzIORhrb+gD7qQJG1pGUP3IX9x1AYn6fSGM/UZop60lKWYBRhAjurOW3YdVDbls7faT
	Myv8EobqzI4ep25NxQ9G0+JFKVkc=
X-Google-Smtp-Source: 
 AGHT+IGpEsjzcGBVUnaHabhb8bPLfQTy9dOLO0VluRaclDx0/Hs56pujGp+8TFWm/nIYF9bg0+ieD9LmumITnzJJmaQ=
X-Received: by 2002:a2e:be9d:0:b0:2ef:2dfd:15e3 with SMTP id
 38308e7fff4ca-2f1a6cf2727mr62339501fa.19.1723392644652; Sun, 11 Aug 2024
 09:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwHDwswam-Q40YqXMDJt6oui=UHv-bkjuF+X5fOmT+6PaA@mail.gmail.com>
 <9078b350-27a8-48af-a19d-2adaaaa16f9f@app.fastmail.com>
In-Reply-To: <9078b350-27a8-48af-a19d-2adaaaa16f9f@app.fastmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 11 Aug 2024 19:10:33 +0300
X-Gmail-Original-Message-ID: 
 <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
Message-ID: 
 <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
To: Luke Jones <luke@ljones.dev>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <172339264584.8458.1347010145616904680@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Luke,
thank you for taking the time to reply.

And everyone else, thank you for putting up with my broken line spacing,
because of Gmail. And perhaps the lack of in-reply-to because of mailto.
Hopefully in-reply-to works this time ;).

First off, understand that I do not mean to attack your work. I tried to
make my response helpful to you. In fact, I took a lot of time in writing it
and preemptively saved you a lot of work in testing your patchset so you do
not have to spend time reaching the same conclusions that I have had to.

Provided you heed my comments of course, which is not clear from your reply.

As I currently represent what is the largest Linux ROG Ally community, I hope
it is reasonable that it is in my and my community's best interest that an
unstable patch which could affect Linux Ally support should be vetted before
it becomes part of the mainline kernel. Once it becomes part of the kernel,
workarounds around it will become very hard. We have achieved near perfect
controller support through userspace, so I would hate to jeopardize that.

In my previous email, I gave you my preliminary thoughts without having time
to test your patchset. Of course, as I noted in that email, I will be testing
and integrating support for your patchset, personally, with an Ally X unit
I will be getting access to close to the end of August.

I do not think there is value in arguing, therefore I am not happy continuing
the discussion under this tone. Hopefully, in a few days you, will have
another look at my comments, with a level head, and address them.
I still believe that they are valid and that if they are fixed, I am more
than happy with your patchset merging into the kernel.

Since you raised some technical points in your response, let me disambiguate.

> You're repeating information that has come directly from me.

Indeed, this specific point (XInput being deprecated) came from you.
I am just bringing everyone up to speed, since I feel your patch missed
some important context.

> I have many records from many MCU updates. It doesn't happen. (referring to
> relying to the endpoint descriptor instead of HID Usages)

In my opinion, using the standard Usage Page and Usage the controller reports
remains the proper solution (this is what the Windows driver does).
Remember that if there is a breakage due to a firmware update, users will
become unable to use their device as they can not update the kernel.

Using `desc.bEndpointAddress` may be appropriate for a userspace tool or an
out-of-tree kernel driver, but perhaps not for the mainline kernel.
I am happy to be proven wrong.

> "Attempted"... I *did*. You've failed to notice that what I've set is
> what is reported by the HID report.

I am a bit confused here. I thought the purpose of your patch was to convert
the HID report into what xpad would export. That means respecting xpad, not
a random HID report.

In this case, the absinfo (with `input_set_abs_params`) needs to be set
according to what is set by xpad, which is signed and from -32768 to 32767
(referencing both the Linux Gamepad Specification and the out-of-tree driver
xpadneo which seems to be the prominent driver providing support for
controllers similar to Ally X, i.e., Xbox One bluetooth controllers).

I know from experience that Handheld Daemon will have a problem with this.
But alas, I was not referring to Handheld Daemon being the problem here:
it is simple enough to fix it in there and I will do it when I add
support for your patchset (would rather avoid doing it or doing it and having
to revert it of course). I was moreso referring to other userspace
applications without this privilege.

As for why I have to add support for your patchset, it is simply because
it being there changes the controller mappings, so I simply need to add
an if statement that uses the standard XInput mappings when it is available.

This is not to say that the end result will be as reliable as without your
driver, as Handheld Daemon will then be at the mercy of your kernel driver.
So please, do extended testing and I think with e.g., ChimeraOS 46.2 being
released yesterday with your patchset, you will get some valuable
feedback soon enough.

I know that I have spent multiple weeks already optimizing my implementation,
having released it close to a month ago. Which is also why I am not in a
rush to add support for your experimental patchset.

> It is a very different story in a kernel driver... (referring to the 80ms
> delay used for Xbox+A)

Please understand that I have spent weeks of effort debugging and optimizing
the Side Menu behavior of Handheld Daemon. In fact, it currently implements
three different ways of opening the Steam Side Menu (keyboard, extest through
the gamescope X11 socket, and as a last fallback as Xbox + A). When I say
80ms is not enough, I know it is not enough. Otherwise Handheld Daemon would
be using 80ms. The rest is conjecture.

> It is done on a worker. It is not blocking the kernel....
> (referring to xbox+a holding a spinlock to send the key combo with msleep)

Repeating myself:

> > In addition, you are freezing the kernel **driver** to send those
> > commands for 240ms which is around 100 reports.

Which in my opinion will become more like 300ms. Freezing the controller for
that long is not ideal (I know you are not freezing the kernel).
Please revisit this.

> Please describe how you think it is broken? (referring to `mcu_powersave`)

Quoting myself:

> > This feature remains broken when the device is at low TDPs and unplugged.

e.g., when the Ally is set on its quiet mode and or is below 12W, and is
suspended unplugged, with Steam and a game running. In this case,
the USB controller of the Ally simply does not wake up and RGB breaks.
The occurrence of this given those conditions is around 40% of the time.
This includes testing with or without your DMI table patch by the way.

> Does not work how? (referring to `ally_mcu_usb_switch`)

Seems like a DMI table always sets it to 0. I do not know why. However I do
know that as part of our validation on the distribution Bazzite which took
place prior to you submitting your patch, we tested both adding an or for
ally x and a dmi table, and the dmi table did not work. Post submitting your
patch, there was a 5 day brief period where both the unstable ChimeraOS
kernel and the CachyOs kernel integrated your patch before they also
integrated the patch I am replying to (which makes Handheld Daemon not work;
for now). During this period both the original ally and the ally x regressed
when `mcu_powersave` was disabled.

> I test, mate. With the default kernel and empty userspace.

Unfortunately, this is not how users interact with my kernel patches and
Handheld Daemon. They usually play games with SteamUI running in the
background. Often, this includes setting an aggressively low TDP, and multiple
suspends back-to-back while in game. This is the standard I hold myself to.
And I would expect no less from a mainline kernel driver.

I hope I replied to all your technical claims. If I missed any, I am
happy to clarify and expand where appropriate.

Again, good luck with your patchset. Hopefully, it will merge with 6.12 and
Ally X owners will get an acceptable result without the need for userspace
tools (albeit without gyro, back buttons, and RGB being part of the
controller).

Best regards,
Antheas

