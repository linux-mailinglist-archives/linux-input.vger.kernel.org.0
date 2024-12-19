Return-Path: <linux-input+bounces-8687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C019F8349
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB20B7A24E9
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 18:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B58619E83C;
	Thu, 19 Dec 2024 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC29ELGu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DAF35948;
	Thu, 19 Dec 2024 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633109; cv=none; b=k/PXuikEUz4gatoyF8NUCXEUixvfYzYdcddmzWuCZmZPG0GJpjrZ1sShTI+v2if0ZwmW4q71blBfMUvey5GlbzNN2zBHUV12KHHotnzBzcW+AGntyu3kLUf2dO9dUyQuXFyF58roQQWVVsiQmBGr2M6DV4bbMJFI80frZx6xK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633109; c=relaxed/simple;
	bh=HNoJnuDqsWnlgD4p+PmDF1KisG8WnKXEh8lr4CMTUmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoNzsVL3dolK4pQFt38Vc1VEnOfnvdvZVzohlK8Nx6e/lqGFyqzVNNmK+5IVr94RT3sZSr8CQfH389SMVkWbGiBXNTh8hUW9U8wsx1E4Ux8L9XAxgDCuia4TIGucpK1nYDMhCouV1TBIIldoSwPVbPFm464vlBAGog8ZGO6/JpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC29ELGu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so955122a12.1;
        Thu, 19 Dec 2024 10:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734633107; x=1735237907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8zr3TqEdsKgEDXLGKcXbLsvznJt5gMJu3I/7eVx9EE=;
        b=GC29ELGuTq/4Vvr4eNLJcGKdj4oeRpl3aMacOTve7mpkdf+2eq6W9pwHAu24mw1/XD
         lSWQ//sWpl3AQtyaCws7SWcxJyOWZEQ+HuV7D4TSw35zti7508cwkbFEBcPhHXomuxVs
         6OHJk7JR7tohOPgU1Pp3Lj54TZVJ5aQ7EanapPp4P6jNuMN3nYo+g94W4a81vvrO7obw
         z29fNgQCPwPKrqneExszPiZ3OjvwUq/QqLF4VNYuGevMYG3xLuUY1nUqrZB0FH5SRKTL
         vY31H8cZGWBuTtonPjBvaKZOtzaLWO9D+1s+5GlDeaintN7RWAuDp/ngnK7HUFfC2cka
         4cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633107; x=1735237907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8zr3TqEdsKgEDXLGKcXbLsvznJt5gMJu3I/7eVx9EE=;
        b=pM7KaksTX6Ic1+M2FasnnuVjPAhW/ST88LV6JAQZXvGMSKasKVBM5KZ/S6I3lGEf60
         eL9gUkQzmKNXoTqDATI+EhRNnafq0Hg4Dbrc+0fYzsb9xwb3eEunV29UPYZIWtzTZNXi
         g7I2l7MqcooSIktb91CLrLJBdWJ3w0o94sOMtqJbb6+H+Wzqx7yCFgC6BlINv4LIzn4A
         Ri1FHVMMghCAxbMxJNx1kOlw2DPLvkphsd4JFAfYLZsmHER1WEM2ZIenv3t3tWOGA54f
         sM2ZBrVpgLQRBJn2jkauVZxVL4FALMNBNSK5mOB2A6yQABKzfbFj9/v4I3c9PF+2FuUw
         dO1g==
X-Forwarded-Encrypted: i=1; AJvYcCXGoa++W/QROgTj2D7UcdPOJjQpn+f8eqDUEwc9QRJ7uYLcv3WBoCGiaC4VL3JR/07WBuZ3rnXfP29+chgR@vger.kernel.org, AJvYcCXM47g1q9f3N/4FDXZiCmcAFjrC9DzJdJlX3EJ5Cpr9M0KNt5jX07yjFR3sB8fEX6+v1W5eyuziuVYJng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBcRzUHAcH0U8UanotzwU1TZwr9xpVfvnGgyF+u1tWxPu0bwC
	T0Dt2CBzOVXAjcTLzQPQ+nCPlDH0HdBQS7c/0U7bZzpF/mfyzehJXM6LIw==
X-Gm-Gg: ASbGnctGHwNKtPZIUiG1BYzzPNo38jQfg67RdoBa0fP7bxCu4QXx2nYMFa4FBx08WQ2
	8TWbISDrSvmXVahkqa/lN9RKgzVjNQk8O8VWct3yglRJhOb6TKYuhxTQgANWudHOssEbnbG/APd
	6+Ksf47nJiCi0n/OiEIJ3mrvT2/JLn8C3xnChDm92g9G2iIXWRkRfZTOGit2Dsep4nziTxvjDn3
	ytCwLsIrtt/rV1qYdeqpHHnJGPv4ZGBd/A4IXjO5QJDX/8Y5r46HWluVA==
X-Google-Smtp-Source: AGHT+IECP3rcLZke8HDSthVkwdarDodQND3LeKlPf+VWEhCy84QrODOkzS+3Dc5eFfqxjNnUn/RlJA==
X-Received: by 2002:a17:90b:524d:b0:2ea:3f34:f18d with SMTP id 98e67ed59e1d1-2f452e10348mr38376a91.10.1734633106844;
        Thu, 19 Dec 2024 10:31:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:afa0:e44c:aa7e:5cd4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477e8222sm1881271a91.23.2024.12.19.10.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:31:46 -0800 (PST)
Date: Thu, 19 Dec 2024 10:31:43 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Peter Hutterer <peter.hutterer@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Message-ID: <Z2Rmj6V0FFbWUhCd@google.com>
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
 <Z2Ri3cuiRYDap2f6@google.com>
 <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>

On Thu, Dec 19, 2024 at 07:26:19PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
> > Hi,
> > 
> > On Thu, Dec 19, 2024 at 05:01:09PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> Really +Cc Peter Hutterer this time.
> >>
> >> On 19-Dec-24 4:48 PM, Mark Pearson wrote:
> >>> Hi Hans
> >>>
> >>> On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
> >>>> +Cc Peter Hutterer
> >>>
> >>> My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)
> >>
> >> Except I forgot to actually add Peter...
> >>
> >>>> Hi Mark,
> >>>>
> >>>> Thank you for your patch.
> >>>>
> >>>> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
> >>>>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
> >>>>> generates is not mapped.
> >>>>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
> >>>>> the expected value for copilot.
> >>>>>
> >>>>> Tested on T14s G6 AMD.
> >>>>> I've had reports from other users that their ThinkBooks are using the same
> >>>>> scancode.
> >>>>
> >>>> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
> >>>> there are 2 issues with this approach:
> >>>>
> >>>> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
> >>>>    XF86TouchpadOff as F20 - F23 where repurposed to
> >>>>    TouchPad on/off/toggle / micmute to work around X11
> >>>>    not allowing key-codes > 247.
> >>>>
> >>>>    We are actually working on removing this X11 workaround
> >>>>    to make F20-F23 available as normal key-codes again
> >>>>    for keyboards which actually have such keys.
> >>>>
> >>>> 2. There are some keyboards which have an actual F23 key
> >>>>    and mapping the co-pilot key to that and then having
> >>>>    desktop environments grow default keybindings on top
> >>>>    of that will basically mean clobbering the F23 key or
> >>>>    at least making it harder to use.
> >>>>
> >>>> I think was is necessary instead is to add a new
> >>>> KEY_COPILOT to include/uapi/linux/input-event-codes.h
> >>>> and use that instead.
> > 
> > We have discussed this with Peter and came to the conclusion that
> > KEY_ASSISTANT should cover this use case.
> > 
> > Also, this tweak should go into udev rules (/lib/udev/hwdb.d/60-keyboard.hwdb)
> > instead of adding a vendor-specific tweak to the main atkbd table.
> > 
> > For the future releases you may want to add "linux,keymap" device
> > property to your ACPI/DSDT to control the scancode->keycode mapping when
> > Linux is running.
> > 
> >>>
> >>> Sorry, should have been clearer in the commit message.
> >>> I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....
> >>>
> >>> Somewhere I had a MS page...but this Tom's HW page mentions it:
> >>> https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools
> >>>
> >>> I'll see if I can find something more formal.
> >>>
> >>>>
> >>>> Peter, I thought I read somewhere that you were looking
> >>>> into mapping the copilot key to a new  KEY_COPILOT evdev
> >>>> key for some other keyboards?
> >>>>
> >>>
> >>> Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.
> >>
> >> So I guess I got caught off guard by your commit message
> >> which suggests that only scancode 0x6e is generated.
> >>
> >> If indeed a left-shift + Windows/Meta key + 0x6e combination
> >> is send them this is a different story, since indeed we
> >> cannot filter on that in the kernel. Although sometimes
> >> I wonder if we should because we are seeing similar things
> >> where left-shift + Windows/Meta key + xxxx is send for
> >> e.g. touchpad on/off toggle.
> >>
> >> To workaround this atm GNOME listens for XF86TouchpadToggle
> >> as well as shift + meta + XF86TouchpadToggle, theoretically it
> >> would be nice if we can recognize these special key-combos at
> >> a lower level. But thinking about this that is nasty, because
> >> then we would get an event sequence like this:
> >>
> >> Report shift pressed
> >> Report meta pressed
> > 
> > No, you have to delay to see if it is real press or part of sequence.
> > 
> >> <oops special key, release them>
> >> Report meta released
> >> Report shift released
> >> Report KEY_TOUCHPAD_TOGGLE
> >> <and what do we do with the modifiers now?
> >>  for correctness I guess we report them
> >>  as pressed again until the hw reports them released>
> >> Report shift pressed
> >> Report meta pressed
> >> <hw releases the fake modifiers>
> >> Report meta released
> >> Report shift released
> >>
> >> So yeah handling this in the kernel is not going to be pretty.
> > 
> > Yes, we have a form of this in drivers/tty/sysrq.c and it indeed is not
> > pretty.
> > 
> >>
> >> So I think your right and just mapping this to F23 is probably
> >> best, but I would like to hear what Peter thinks first.
> > 
> > So vendor yet again encoded a shortcut sequence into firmware,
> > beautiful. I guess you can try to install a 8042 filter
> > (via i8042_add_filter()) in drivers/platform/x86/lenovo-<something>.c
> > to monitor for this specific scancode sequence and replace it with
> > something else (through an auxiliary input device). 
> 
> If we want to filter out these in essence fake modifier
> events then this needs to be done at some core level,
> because AFAIK the shift + meta + F23 key-combo is what
> microsoft is telling OEMs to use, so we are going to see this on
> laptops from all vendors including whitelabel laptops.

Hm, then I'd rather leave it to the userspace shortcut handling to deal
with. It's probably gonna disappear the same way as others in a couple
of years ;) and be replaced with some thing else.

And mapping to F23 as I said should be done through udev. I doubt they
will get all OEMs settle on the same scancode.

Thanks.

-- 
Dmitry

