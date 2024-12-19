Return-Path: <linux-input+bounces-8689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B1F9F83E8
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 20:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7EE16064F
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9E71A0B0C;
	Thu, 19 Dec 2024 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+pPZtxN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C91A23A3;
	Thu, 19 Dec 2024 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734635872; cv=none; b=cjyrsjnqn208SbaC2D4Oxo98NAXcnthZusxdUdgkf0ZhAMlVOLO5RJGGN+lyHfPvR8Z6pjCncSiqUOuuEiHz868M0ve0TxAymTfbQBN6z0ZZ6E7YosEUa5pvYsT7FfOEBD4d2XRu3NFxbRGDuN1Tn1OzZ3nQ1IBM0lPn6ddzP/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734635872; c=relaxed/simple;
	bh=1lMfZp7NScuX8jIZgRDZhMh3Db7NBqmEYPrVWJMPGaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctyweZM0ZG3eSUa6KsvB7MWxfVmytsUaC/uI99JkESAEribRIBcX9JbPA8zMyGGWNDX/0CZqCtyu54n1Ya3aE5T9/cYp2s+5087kC/QqYc3hMRh6WpL+SKc/K5gtzWsrHnYz9JXdR/WLDYdWhFaRQrC1NeIjCJ8K0QqOcQJur1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+pPZtxN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166360285dso11389615ad.1;
        Thu, 19 Dec 2024 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734635870; x=1735240670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrB1G5Vb85niP6Q1iuoFTgmFbH5vL+w3bep31QCK5wA=;
        b=b+pPZtxN+UlaL+Nr/ZhYZu2PRvTGLaxfHsmLdUWYkAuAeqMnyZRXdEBlRDJ7JtFW4V
         ANoB37V0etIDVd1uKm/m6GBmP2zUljt4wZvG0NyDxHwHlI5YgJiBfVTO3me8bLmbrfR+
         IQLDEYqQk/OlU8s5wD7GfmLO/w180FmQzTDflzOBqUjLOrrlfK8TIAAAli0uD4a1cUlM
         +pZS8uiEYrZPOhYrdhXdF+YZM/OAJENyWHhoCauuKp3v/zMa5YGsApzO9CpMD3JnKI0c
         xe9BLgLx2EvZUTL6Xof+jZ/zIY+ISgk0MCuu+WkMPKIkD9cTEdhFwewRe6mYnGdVqrmc
         fGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635870; x=1735240670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrB1G5Vb85niP6Q1iuoFTgmFbH5vL+w3bep31QCK5wA=;
        b=lkzKA2koJ6/sw8Oz5mFOSbwgkGPSM/7XUv1BuQN5WzMN74eHobT6HTEV9A0jSE/zly
         ffOw6uque+4Tv7Ou1keOM/IYxCAwn2mb6ruvML+cg5tWDVgdIBTtoG9NBc4pZgDLAHJb
         9bdJDlnmJNN/PzRTrJTcGjKj+fG6qeuaC9ICyltopCeqAmNScim14baiTtKo/Boxu59X
         OzfH0VxjQFtoRNcUiVkq7///OoHWsfoa30aq8DEwiezgRRffKg49zbaC5TR7Tc5Ov1VP
         lT4i3mDvtTwz3dzll3UTcIoVSVWUahuZVdXFZB8V70l858U86WoDLbATwaDCqp/903in
         6Kvg==
X-Forwarded-Encrypted: i=1; AJvYcCVUeAa1lXWPnzOKLvt+YdUCqA+2pBKRBi1ZSgL58lNy7FoJLTy90zN32Zw2r3d/euJ8wne9MXLueMo6FftY@vger.kernel.org, AJvYcCXWejoLqFFHsF19ANvWK5W0Et6Quxa+pfsgUvJw58wZixVweHpHnYah0YQIanhzh5APc++OItx+yOYnWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIELYPDqacymFfk2a0Me0eQN2zuQGVC2QeBcwTIWp44Wyoz8Mh
	45BfkafjzBbUibyofHQHFCI0aVq6ctn90hMCGb6YV0GVpgczrdCc
X-Gm-Gg: ASbGncud+uoSnRDXsuc/U2tl3lcJbrR3OlIVBJeq+WnZE5NI/gPjq9oRhrVr3s2Cr3B
	tPyea1e7hgPhCq0T0hMrq67l8wvhGNCdpncRrq3PB119s+L5XwPB6rnzEZglzBvCNXWTN5+rmnB
	l3vT/g5Qmuxe9gadjLiS7udWgm/al24hgebTpKKgtP1skpC0zEUUzMPgvNOIo3oW1fZqCJRuFd0
	nypEoJUZQ0oYI9Bjq+kVk+HqppWe1nygBQ+fHE+zehXKO9Rgm/VCnqyWA==
X-Google-Smtp-Source: AGHT+IE81AE1xMYxzIbr0y28cO5Gxgzpca15PzZe/oXAS7OQS3URLgQspB8h7fqmPA7Z7Zp2/D5NXw==
X-Received: by 2002:a17:902:d484:b0:212:514:b30a with SMTP id d9443c01a7336-219e5560f96mr7524125ad.12.1734635870088;
        Thu, 19 Dec 2024 11:17:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:afa0:e44c:aa7e:5cd4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde7esm15862005ad.152.2024.12.19.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:17:49 -0800 (PST)
Date: Thu, 19 Dec 2024 11:17:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Peter Hutterer <peter.hutterer@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Message-ID: <Z2RxW6K-_Ujrxeim@google.com>
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
 <Z2Ri3cuiRYDap2f6@google.com>
 <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>
 <Z2Rmj6V0FFbWUhCd@google.com>
 <e16e0f6f-9eb0-487f-8c71-3023a17f8afb@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e16e0f6f-9eb0-487f-8c71-3023a17f8afb@app.fastmail.com>

On Thu, Dec 19, 2024 at 01:40:24PM -0500, Mark Pearson wrote:
> On Thu, Dec 19, 2024, at 1:31 PM, Dmitry Torokhov wrote:
> > On Thu, Dec 19, 2024 at 07:26:19PM +0100, Hans de Goede wrote:
> >> Hi,
> >> 
> >> On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
> >> > Hi,
> >> > 
> >> > On Thu, Dec 19, 2024 at 05:01:09PM +0100, Hans de Goede wrote:
> >> >> Hi,
> >> >>
> >> >> Really +Cc Peter Hutterer this time.
> >> >>
> >> >> On 19-Dec-24 4:48 PM, Mark Pearson wrote:
> >> >>> Hi Hans
> >> >>>
> >> >>> On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
> >> >>>> +Cc Peter Hutterer
> >> >>>
> >> >>> My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)
> >> >>
> >> >> Except I forgot to actually add Peter...
> >> >>
> >> >>>> Hi Mark,
> >> >>>>
> >> >>>> Thank you for your patch.
> >> >>>>
> >> >>>> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
> >> >>>>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
> >> >>>>> generates is not mapped.
> >> >>>>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
> >> >>>>> the expected value for copilot.
> >> >>>>>
> >> >>>>> Tested on T14s G6 AMD.
> >> >>>>> I've had reports from other users that their ThinkBooks are using the same
> >> >>>>> scancode.
> >> >>>>
> >> >>>> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
> >> >>>> there are 2 issues with this approach:
> >> >>>>
> >> >>>> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
> >> >>>>    XF86TouchpadOff as F20 - F23 where repurposed to
> >> >>>>    TouchPad on/off/toggle / micmute to work around X11
> >> >>>>    not allowing key-codes > 247.
> >> >>>>
> >> >>>>    We are actually working on removing this X11 workaround
> >> >>>>    to make F20-F23 available as normal key-codes again
> >> >>>>    for keyboards which actually have such keys.
> >> >>>>
> >> >>>> 2. There are some keyboards which have an actual F23 key
> >> >>>>    and mapping the co-pilot key to that and then having
> >> >>>>    desktop environments grow default keybindings on top
> >> >>>>    of that will basically mean clobbering the F23 key or
> >> >>>>    at least making it harder to use.
> >> >>>>
> >> >>>> I think was is necessary instead is to add a new
> >> >>>> KEY_COPILOT to include/uapi/linux/input-event-codes.h
> >> >>>> and use that instead.
> >> > 
> >> > We have discussed this with Peter and came to the conclusion that
> >> > KEY_ASSISTANT should cover this use case.
> >> > 
> >> > Also, this tweak should go into udev rules (/lib/udev/hwdb.d/60-keyboard.hwdb)
> >> > instead of adding a vendor-specific tweak to the main atkbd table.
> >> > 
> >> > For the future releases you may want to add "linux,keymap" device
> >> > property to your ACPI/DSDT to control the scancode->keycode mapping when
> >> > Linux is running.
> 
> I can look into this, but gut feeling is it's a bad solution for the Linux ecosystem as it will limit it to only platforms in the Lenovo Linux program. Be nicer to have a more widespread solution.
> 
> >> > 
> >> >>>
> >> >>> Sorry, should have been clearer in the commit message.
> >> >>> I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....
> >> >>>
> >> >>> Somewhere I had a MS page...but this Tom's HW page mentions it:
> >> >>> https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools
> >> >>>
> >> >>> I'll see if I can find something more formal.
> >> >>>
> >> >>>>
> >> >>>> Peter, I thought I read somewhere that you were looking
> >> >>>> into mapping the copilot key to a new  KEY_COPILOT evdev
> >> >>>> key for some other keyboards?
> >> >>>>
> >> >>>
> >> >>> Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.
> >> >>
> >> >> So I guess I got caught off guard by your commit message
> >> >> which suggests that only scancode 0x6e is generated.
> >> >>
> >> >> If indeed a left-shift + Windows/Meta key + 0x6e combination
> >> >> is send them this is a different story, since indeed we
> >> >> cannot filter on that in the kernel. Although sometimes
> >> >> I wonder if we should because we are seeing similar things
> >> >> where left-shift + Windows/Meta key + xxxx is send for
> >> >> e.g. touchpad on/off toggle.
> >> >>
> >> >> To workaround this atm GNOME listens for XF86TouchpadToggle
> >> >> as well as shift + meta + XF86TouchpadToggle, theoretically it
> >> >> would be nice if we can recognize these special key-combos at
> >> >> a lower level. But thinking about this that is nasty, because
> >> >> then we would get an event sequence like this:
> >> >>
> >> >> Report shift pressed
> >> >> Report meta pressed
> >> > 
> >> > No, you have to delay to see if it is real press or part of sequence.
> >> > 
> >> >> <oops special key, release them>
> >> >> Report meta released
> >> >> Report shift released
> >> >> Report KEY_TOUCHPAD_TOGGLE
> >> >> <and what do we do with the modifiers now?
> >> >>  for correctness I guess we report them
> >> >>  as pressed again until the hw reports them released>
> >> >> Report shift pressed
> >> >> Report meta pressed
> >> >> <hw releases the fake modifiers>
> >> >> Report meta released
> >> >> Report shift released
> >> >>
> >> >> So yeah handling this in the kernel is not going to be pretty.
> >> > 
> >> > Yes, we have a form of this in drivers/tty/sysrq.c and it indeed is not
> >> > pretty.
> >> > 
> >> >>
> >> >> So I think your right and just mapping this to F23 is probably
> >> >> best, but I would like to hear what Peter thinks first.
> >> > 
> >> > So vendor yet again encoded a shortcut sequence into firmware,
> >> > beautiful. I guess you can try to install a 8042 filter
> >> > (via i8042_add_filter()) in drivers/platform/x86/lenovo-<something>.c
> >> > to monitor for this specific scancode sequence and replace it with
> >> > something else (through an auxiliary input device). 
> >> 
> >> If we want to filter out these in essence fake modifier
> >> events then this needs to be done at some core level,
> >> because AFAIK the shift + meta + F23 key-combo is what
> >> microsoft is telling OEMs to use, so we are going to see this on
> >> laptops from all vendors including whitelabel laptops.
> >
> > Hm, then I'd rather leave it to the userspace shortcut handling to deal
> > with. It's probably gonna disappear the same way as others in a couple
> > of years ;) and be replaced with some thing else.
> >
> > And mapping to F23 as I said should be done through udev. I doubt they
> > will get all OEMs settle on the same scancode.
> >
> 
> I'll see if we can find a way to check on other vendor platforms what scancode is used.
> If it is a common scancode, across multiple vendors, would the patch be acceptable?

It is currently unmapped by default, so maybe.

FWIW:

dtor@dtor-ws:~/kernel/work $ grep KEY_6e /lib/udev/hwdb.d/60-keyboard.hwdb
KEYBOARD_KEY_6e=wlan
KEYBOARD_KEY_6e=left                                   # left on d-pad
KEYBOARD_KEY_6e=search

That 2nd entry is actually from one of Thinkpad models ;)

Thanks.

-- 
Dmitry

