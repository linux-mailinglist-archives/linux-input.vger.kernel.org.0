Return-Path: <linux-input+bounces-5509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDA94E2E4
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 22:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CACC31C203D7
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 20:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE34136349;
	Sun, 11 Aug 2024 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUjAyuPY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0711CAB;
	Sun, 11 Aug 2024 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723407635; cv=none; b=BzcCF65hFLbrX0wcli/QqgfmXNIeUeV0H0+8WTwVZh8qPG+gplZ3X3h+fyFAbDbhXyTR7r7SybuGH2nXujmxgg4BeJMpxKyhFlg2dSFdqEbBDFf8Q2Vnklwq5spGzjaKDfLY/0C6eDYIuA//lejq4ajXp1ajuxnDb3nuANDsnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723407635; c=relaxed/simple;
	bh=9nrPhqOIli/Sn+PmdftIwr2iEj3WzOG5DRHL3sC9amk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKhrqzksJ9DPuhpYlg+X9M+ZkJQEPbiUSKBPrqSHXJVOOtPh/WYXqxhHlN2bdxb8OHTTS2RFNFoL0zmcdJwWz6iF0ibn7fkuh0YfL3w8T+5QUxk+M0ducXAIrIpqGCd/sDhsOZbYvz+rEhAT72igv04WzBk9QOLi3/x3HiEn2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUjAyuPY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so2557689a12.1;
        Sun, 11 Aug 2024 13:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723407632; x=1724012432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdyzGbXOdwkKB4AadqvgplhAks6zXNnOP9aRm8WRn0I=;
        b=kUjAyuPY8ew5chwJLuHiZZaie4+8nVfe0vi4/j1DGA4gSbyLODuxVKmDM6nZOSUUHt
         dTBISNAqKF6Z4fAWVVlWk7DUmFUSuXUipYLgwbzwpAa7VRTYn7LPiu3pZ6yd8ThnGYVY
         MG+/kWsMsYMM4PzZQXZEqLvBrGFO9e+gXuIsHgmj7ETHtOHAK5riudvtA9Zc7ZQagwAi
         PpMXfi48vMH+ENuLX+7+GGgiBeUbu8HY7AGpj9dacwmO+/wTY8WiPKoXQj9zwmYAHT6F
         ppvts/zBkdmupO2q9hAqA50In9i2rlONMFlBf3euVmhrAqAcqDG4buYDmvur/IfTIQfx
         01vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723407632; x=1724012432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdyzGbXOdwkKB4AadqvgplhAks6zXNnOP9aRm8WRn0I=;
        b=iRmUkfUvTjNzaByAk1HTPoIB+DnmPoR3gAZHYFjef4dsceWNR4FF1lFGA+88U305Hj
         692WzeywxqyrOjKIL+aGoBFKzUErWOCgTyrRvqmFrCqA+UGOXp4SFuQtjL2rQA9G5+p4
         PR14de3vnfu+O/XRh26xbDmZrc0aGE17sD90E/CkGVFAgAG0Y16fZsbQxrrrg2L7bWi/
         YQDQ5c1cpvHMxpXz1D+4vKjrhJH0kjUrYty78Jxn7ZgjmaT0IhP5ZPDRL+D9bWd/sxgE
         /KAITbn6IuExJZtkmO825+ejfNLwFraP3h6x8wc53AfvNitUtBdO9Y7J/q+/cLpSvAIv
         AhvA==
X-Forwarded-Encrypted: i=1; AJvYcCXvcJ130T9dCToB7KT8BDBodUIYR3Nsn74KiQyGnzmv6rzeomM+8neq05iObJGKLg0ZbtYBgsijtG3J5OxDEXq4nSrGxM4QPylU/rKziEE4m+qdupe7LncGYZYAAqmufExmcK/+h7o1IME=
X-Gm-Message-State: AOJu0YxK326oGphmolakEatqCkQVCmAvb6TfnkFgR54TWX6rlOstb3S4
	D+WxDgC8YFIZhQAVU9ytUvUfn7n7OvrlJ/nrllOFt5v2pAQndzPJ
X-Google-Smtp-Source: AGHT+IHruNPv2D+LHNw+PgNcH96rxSa8LNiyTCMDYpVfEh5uq6kV5kmjYkUl9Rjlhsl1fkqnFJ7iSA==
X-Received: by 2002:a05:6402:50cc:b0:5bb:8ffd:24b9 with SMTP id 4fb4d7f45d1cf-5bbb399ee28mr10059346a12.0.1723407631701;
        Sun, 11 Aug 2024 13:20:31 -0700 (PDT)
Received: from [192.168.1.127] ([151.49.95.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd190ad1bcsm1591942a12.30.2024.08.11.13.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 13:20:31 -0700 (PDT)
Message-ID: <f9fc3639-d1ec-4c59-9c84-126561c2b86a@gmail.com>
Date: Sun, 11 Aug 2024 22:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
To: Antheas Kapenekakis <lkml@antheas.dev>, Luke Jones <luke@ljones.dev>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAGwozwHDwswam-Q40YqXMDJt6oui=UHv-bkjuF+X5fOmT+6PaA@mail.gmail.com>
 <9078b350-27a8-48af-a19d-2adaaaa16f9f@app.fastmail.com>
 <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/24 18:10, Antheas Kapenekakis wrote:
> Hi Luke,
> thank you for taking the time to reply.
> 
> And everyone else, thank you for putting up with my broken line spacing,
> because of Gmail. And perhaps the lack of in-reply-to because of mailto.
> Hopefully in-reply-to works this time ;).
>> First off, understand that I do not mean to attack your work. I tried to
> make my response helpful to you. In fact, I took a lot of time in writing it
> and preemptively saved you a lot of work in testing your patchset so you do
> not have to spend time reaching the same conclusions that I have had to.
>> Provided you heed my comments of course, which is not clear from your reply.
> 
> As I currently represent what is the largest Linux ROG Ally community, I hope
> it is reasonable that it is in my and my community's best interest that an
> unstable patch which could affect Linux Ally support should be vetted before
> it becomes part of the mainline kernel. Once it becomes part of the kernel,
> workarounds around it will become very hard. We have achieved near perfect
> controller support through userspace, so I would hate to jeopardize that.
> 
Hello,

I'm Denis and I want to say a few things:

first of all I have been following the ROG Ally scene from quite a while now and
I submitted one of the oldest patches regarding it specifically:
https://lore.kernel.org/all/20231117011556.13067-1-luke@ljones.dev/
and in no way I feel represented by you.

We have talked about this matter many times in an open-to-everybody discord server,
and all the records are still available for whoever wants to read those in the chimeraos
server.

We all have warned you about taking control of devices from userspace, many and
many times again. More than nine months ago, you decided to ignore us all and
write an application you knew it would have played bad with future a driver that would
have been submitted upstream.

To be clear to readers your application started as a clone of my own application, meant
as a temporary workaround for a support that we all knew was coming:
mine: https://github.com/NeroReflex/ROGueENEMY (first commit: 2 Nov 2023)
yours: https://github.com/hhd-dev/hhd (first commit: 30 Nov 2023)
plus yours was targeting lenovo hardware specifically and added ROG support
after some time... Both have been developed in the same discord server, there
is absolutely no way you could have missed those messages.

The first tool supporting the legion go console was a port of my own tool by another
user (that I helped) in our server and we all knew it was a very suboptimal (and temporary)
way of arriving at the final goal of having these handhelds devices in a reliable
ready-to-game state, including you.

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
>> You're repeating information that has come directly from me.
> 
> Indeed, this specific point (XInput being deprecated) came from you.
> I am just bringing everyone up to speed, since I feel your patch missed
> some important context.
> 
>> I have many records from many MCU updates. It doesn't happen. (referring to
>> relying to the endpoint descriptor instead of HID Usages)
> 
> In my opinion, using the standard Usage Page and Usage the controller reports
> remains the proper solution (this is what the Windows driver does).
> Remember that if there is a breakage due to a firmware update, users will
> become unable to use their device as they can not update the kernel.
> 
> Using `desc.bEndpointAddress` may be appropriate for a userspace tool or an
> out-of-tree kernel driver, but perhaps not for the mainline kernel.
> I am happy to be proven wrong.
> 
>> "Attempted"... I *did*. You've failed to notice that what I've set is
>> what is reported by the HID report.
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
> 
> As for why I have to add support for your patchset, it is simply because
> it being there changes the controller mappings, so I simply need to add
> an if statement that uses the standard XInput mappings when it is available.
> 
> This is not to say that the end result will be as reliable as without your
> driver, as Handheld Daemon will then be at the mercy of your kernel driver.
> So please, do extended testing and I think with e.g., ChimeraOS 46.2 being
> released yesterday with your patchset, you will get some valuable
> feedback soon enough.
> 

To be fair, the submitted work has been ongoing for quite some time now,
and it has been tested on both ally and ally x by at least five developers,
including me who tested even more scenarios than input, especially regarding s2idle.
Moreover users of other distributions tested the driver too.

Our distribution version was released as stable when we felt it was completed in all features
and we have finished testing what we could have possibly taught of (this happens to be yesterday),
but anyway I don't believe the release date of a distribution is a valid point of argument for a kernel driver.

If there are bugs please file an actual bug report them so we can fix them.

> I know that I have spent multiple weeks already optimizing my implementation,
> having released it close to a month ago. Which is also why I am not in a
> rush to add support for your experimental patchset.
> 

Again, you were totally aware of what you were doing and what was going on,
so this is not "unfortunate accident".

>> It is a very different story in a kernel driver... (referring to the 80ms
>> delay used for Xbox+A)
> 
> Please understand that I have spent weeks of effort debugging and optimizing
> the Side Menu behavior of Handheld Daemon. In fact, it currently implements
> three different ways of opening the Steam Side Menu (keyboard, extest through
> the gamescope X11 socket, and as a last fallback as Xbox + A). When I say
> 80ms is not enough, I know it is not enough. Otherwise Handheld Daemon would
> be using 80ms. The rest is conjecture.
> 

I am not understanding the point here. If your userspace tool was working before all of these
additions why can't you simply ship a blacklist file for the new driver?

If you are relying in some initialization code done from the driver
I offer myself in adding a kernel argument to keep only that initialization code.

>> It is done on a worker. It is not blocking the kernel....
>> (referring to xbox+a holding a spinlock to send the key combo with msleep)
> 
> Repeating myself:
> 
>>> In addition, you are freezing the kernel **driver** to send those
>>> commands for 240ms which is around 100 reports.
> 
> Which in my opinion will become more like 300ms. Freezing the controller for
> that long is not ideal (I know you are not freezing the kernel).
> Please revisit this.
> 
>> Please describe how you think it is broken? (referring to `mcu_powersave`)
> 
> Quoting myself:
> 
>>> This feature remains broken when the device is at low TDPs and unplugged.
> 
> e.g., when the Ally is set on its quiet mode and or is below 12W, and is
> suspended unplugged, with Steam and a game running. In this case,
> the USB controller of the Ally simply does not wake up and RGB breaks.
> The occurrence of this given those conditions is around 40% of the time.
> This includes testing with or without your DMI table patch by the way.
> 
>> Does not work how? (referring to `ally_mcu_usb_switch`)
> 
> Seems like a DMI table always sets it to 0. I do not know why. However I do
> know that as part of our validation on the distribution Bazzite which took
> place prior to you submitting your patch, we tested both adding an or for
> ally x and a dmi table, and the dmi table did not work. Post submitting your
> patch, there was a 5 day brief period where both the unstable ChimeraOS
> kernel and the CachyOs kernel integrated your patch before they also
> integrated the patch I am replying to (which makes Handheld Daemon not work;
> for now). During this period both the original ally and the ally x regressed
> when `mcu_powersave` was disabled.
> 
>> I test, mate. With the default kernel and empty userspace.

MCU powersave is not even part of this driver. It directly affects the device to be
clear, but nobody can do anything about it: it is how hardware has been designed.

If you need said feature to be disabled you can use an udev rule, that will indeed
make the device consume more while in s2idle state and is therefore suboptimal,
otherwise please brings this up where it is relevant.

Again all of this is knowledge that has been around for about a year, and none of
this comes at a surprise to you.

> 
> Unfortunately, this is not how users interact with my kernel patches and
> Handheld Daemon. They usually play games with SteamUI running in the
> background. Often, this includes setting an aggressively low TDP, and multiple
> suspends back-to-back while in game. This is the standard I hold myself to.
> And I would expect no less from a mainline kernel driver.
> 

The vast majority of users are using a distribution meant for handheld hardware
because tradition distributions requires having a mouse and keyboard around,
however we have records in our server of people asking how to have their controllers
working in archlinux, so what you say is not an absolute truth and there are people who
actually wants being able to use theirs hardware without any of our userspace tooling:
"ours" means all of them, my unmaintained proof-of-concept project, your hdd and inputplumber.

Plus you are also talking about TDP here, and this is a totally separate topic from my understanding.

> I hope I replied to all your technical claims. If I missed any, I am
> happy to clarify and expand where appropriate.
> 
> Again, good luck with your patchset. Hopefully, it will merge with 6.12 and
> Ally X owners will get an acceptable result without the need for userspace
> tools (albeit without gyro, back buttons, and RGB being part of the
> controller).

Gyroscope is on a different subsystem on the kernel and there is no way of having it part of
the input device without userspace drivers. This is true for every OS, including windows.

Back buttons are mappable and can be made part of the controller, and this is even documented:
it comes with some caveats, but if an user wants to have X and Y buttons mapped on back paddles
it will now be possible.

RGB support is once again another example of a peripheral that is impossible to be made
part of an input device, so I am not getting the point:
the fact that you control leds via the emulated controller because some other user
space drivers for that specific emulated device can does mean nothing in this context
and to be fair since you are sending raw hidraw commands to that device it means you are
already driving the current driver in an inconsistent state (reported state vs hardware state)
and therefore blacklisting it is what you should have done months ago, when we told you were
already conflicting with what was upstreamed already, before your work.

> Best regards,
> Antheas

Best regards,
Denis

