Return-Path: <linux-input+bounces-8685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1FD9F830F
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 171F8168BC2
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 18:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F23E19E99E;
	Thu, 19 Dec 2024 18:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKPdacRY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B340019DFA2;
	Thu, 19 Dec 2024 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734632163; cv=none; b=LzoWpOcWOun3s/f5/f98cKsbSQLI2FveuCppb5Iu3DAf9PtDtQxQKikC3M8RtQ9MJzwlD3yz1TgOPRuNfB0FDia9tkSuWqDyJw9ZHGu6Il1wR5tbGe9ywkaWaV/Vum2P13miDD3A70MULp9FaaLMQU66n6YGvsr3jFQvdq6C7H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734632163; c=relaxed/simple;
	bh=/slMNV8LKgfk+vT4lE12l8Eu3Wjpld1oqDX+E9Z384E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA+hmrKABpGC+wL1yPmqE+PTvDmDvOXKnuVVR03FNEgain2+DfFVpu7w+NwlH4T5YyGHV27nS+lRlH1LYaCzF26jGYx6k522uVA5vqiyaUkC+GMnTGquO0kMpHncfyAsugmhnxLppdMTch6c1hG3BIh9dbqPXKStnsjAQEY7qUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKPdacRY; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725ecc42d43so927493b3a.3;
        Thu, 19 Dec 2024 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734632161; x=1735236961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLoyFR82i1hU3WKpp9aM0LuV/CkjbUrQjdIuoPP67Ss=;
        b=QKPdacRYkNBh6q46AYERkAA7q0rmvw0g9lcr12iuWqlj2xJcLMa80Bfy469842qjMX
         bIvAMwCWMbCFfOH82bD/5MlugT2fV2L8tZ9QiTLj1Z4j5hMRtehH07oW3xH/6tAOtLI5
         8p3Aje4xNiSyWVmR/odaF4oDrJwzDpAs2TgF82EqWUHOQVaCPih+z/dlJYqdSTdt3Tr5
         cSU7Hg6vOHZoNb+8NUdjhsfvt/S3UsDB06HXa8EAbBay+tEDJB65YT+YrfLos5N3FT+X
         KCW2S84P6h0+L4qvlcANsbnpEoBnYv3/a91iFP2anc1sr8ripG/rZewWyt1TJV41Mgj8
         RhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734632161; x=1735236961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLoyFR82i1hU3WKpp9aM0LuV/CkjbUrQjdIuoPP67Ss=;
        b=XtG5+rpH7MDGxna14QvGUmEB5WaD4ze8Ylu9QayivN27yybK79lfUWNE/TbHbAR9T9
         oABIb7+KBcrAka/nqPlbBWMsCSBA37DMd/3xUtNxTW49SyWnblZsyCWGwF082KZANZQ1
         wXxF4F9RIWMXUlkotINRlvCeWmbonPfqeLVb28xJJ4tzP6iJPcW1ZqWYEILTYEuUoC+S
         7vfQLeb25tAklpTu1l8dmPhWOsZpsvxUGcgED+mP5E8a6guACreb3jbpMpMU+0/XPyKz
         UtWNCEM5Ndi+S1du72aQfGULJ/vrvVOUbOVAxj+xQeKDyQgFzITVLkUrzwEj48YWdURD
         t/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgqs/5Zy4QDWWxDWdPpePut3Q2gLNILfO9HgoLsY55h6G5dYjczh2p8U6DCDL6EuMGoHxx4gcts48IYg==@vger.kernel.org, AJvYcCWWSu6eIdfpO33qpRjcrSUwja5wMnsstjQhDnPwiYHr2ltt0dNZN32yBaLc9VdaVMYPk3XUb10NfrVfyzwL@vger.kernel.org
X-Gm-Message-State: AOJu0YwQnu5J6ANRrvKEjmzVackrkUjPJPP8YgRcluNEYqwhMF9dtCYy
	AOjCV9JJkQmL0HgxdPAHE5K8bcQ2OvvHXKxF1tZHz5O0U5LQrHxl
X-Gm-Gg: ASbGncuvcaV+gz7CnmJ2HxFtFX29j7KxzddaN8l4yyYdME2AwDm8VTKNDbfLvdxVmk7
	gs/CJazS9LWv/nya8xgntMr3B7HLO++6sIrgLTs61+hw/xWJb71EKE0/aKou/P/aLoapgGCmNOe
	HV2xtPs31fSmErS3uQeDad7ZmSlLougJUalPWg0biHI/iSHC+uduKA4ruv98SokFn42JXXq5Ioc
	v+9FYl/OGWsXjUHaVY9DMv9PKUPoiWws9mdpQrHRVWR/gvntzodL6+jfA==
X-Google-Smtp-Source: AGHT+IGO6sNtymB9533J+21WYaQAL09pGe4cTXdXYvgXYbLUNl/o/jTlG1OQFmSGgIZef3QkA+1hGA==
X-Received: by 2002:a05:6a00:3be1:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72aaa0fc91dmr4636435b3a.4.1734632160918;
        Thu, 19 Dec 2024 10:16:00 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:afa0:e44c:aa7e:5cd4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb8a0sm1606374b3a.163.2024.12.19.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:16:00 -0800 (PST)
Date: Thu, 19 Dec 2024 10:15:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Peter Hutterer <peter.hutterer@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Message-ID: <Z2Ri3cuiRYDap2f6@google.com>
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>

Hi,

On Thu, Dec 19, 2024 at 05:01:09PM +0100, Hans de Goede wrote:
> Hi,
> 
> Really +Cc Peter Hutterer this time.
> 
> On 19-Dec-24 4:48 PM, Mark Pearson wrote:
> > Hi Hans
> > 
> > On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
> >> +Cc Peter Hutterer
> > 
> > My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)
> 
> Except I forgot to actually add Peter...
> 
> >> Hi Mark,
> >>
> >> Thank you for your patch.
> >>
> >> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
> >>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
> >>> generates is not mapped.
> >>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
> >>> the expected value for copilot.
> >>>
> >>> Tested on T14s G6 AMD.
> >>> I've had reports from other users that their ThinkBooks are using the same
> >>> scancode.
> >>
> >> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
> >> there are 2 issues with this approach:
> >>
> >> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
> >>    XF86TouchpadOff as F20 - F23 where repurposed to
> >>    TouchPad on/off/toggle / micmute to work around X11
> >>    not allowing key-codes > 247.
> >>
> >>    We are actually working on removing this X11 workaround
> >>    to make F20-F23 available as normal key-codes again
> >>    for keyboards which actually have such keys.
> >>
> >> 2. There are some keyboards which have an actual F23 key
> >>    and mapping the co-pilot key to that and then having
> >>    desktop environments grow default keybindings on top
> >>    of that will basically mean clobbering the F23 key or
> >>    at least making it harder to use.
> >>
> >> I think was is necessary instead is to add a new
> >> KEY_COPILOT to include/uapi/linux/input-event-codes.h
> >> and use that instead.

We have discussed this with Peter and came to the conclusion that
KEY_ASSISTANT should cover this use case.

Also, this tweak should go into udev rules (/lib/udev/hwdb.d/60-keyboard.hwdb)
instead of adding a vendor-specific tweak to the main atkbd table.

For the future releases you may want to add "linux,keymap" device
property to your ACPI/DSDT to control the scancode->keycode mapping when
Linux is running.

> > 
> > Sorry, should have been clearer in the commit message.
> > I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....
> > 
> > Somewhere I had a MS page...but this Tom's HW page mentions it:
> > https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools
> > 
> > I'll see if I can find something more formal.
> > 
> >>
> >> Peter, I thought I read somewhere that you were looking
> >> into mapping the copilot key to a new  KEY_COPILOT evdev
> >> key for some other keyboards?
> >>
> > 
> > Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.
> 
> So I guess I got caught off guard by your commit message
> which suggests that only scancode 0x6e is generated.
> 
> If indeed a left-shift + Windows/Meta key + 0x6e combination
> is send them this is a different story, since indeed we
> cannot filter on that in the kernel. Although sometimes
> I wonder if we should because we are seeing similar things
> where left-shift + Windows/Meta key + xxxx is send for
> e.g. touchpad on/off toggle.
> 
> To workaround this atm GNOME listens for XF86TouchpadToggle
> as well as shift + meta + XF86TouchpadToggle, theoretically it
> would be nice if we can recognize these special key-combos at
> a lower level. But thinking about this that is nasty, because
> then we would get an event sequence like this:
> 
> Report shift pressed
> Report meta pressed

No, you have to delay to see if it is real press or part of sequence.

> <oops special key, release them>
> Report meta released
> Report shift released
> Report KEY_TOUCHPAD_TOGGLE
> <and what do we do with the modifiers now?
>  for correctness I guess we report them
>  as pressed again until the hw reports them released>
> Report shift pressed
> Report meta pressed
> <hw releases the fake modifiers>
> Report meta released
> Report shift released
> 
> So yeah handling this in the kernel is not going to be pretty.

Yes, we have a form of this in drivers/tty/sysrq.c and it indeed is not
pretty.

> 
> So I think your right and just mapping this to F23 is probably
> best, but I would like to hear what Peter thinks first.

So vendor yet again encoded a shortcut sequence into firmware,
beautiful. I guess you can try to install a 8042 filter
(via i8042_add_filter()) in drivers/platform/x86/lenovo-<something>.c
to monitor for this specific scancode sequence and replace it with
something else (through an auxiliary input device). 

Thanks.

-- 
Dmitry

