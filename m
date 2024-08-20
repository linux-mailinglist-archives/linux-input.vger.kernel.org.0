Return-Path: <linux-input+bounces-5715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB3B958FD1
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 23:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48750B20C11
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 21:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF11C579C;
	Tue, 20 Aug 2024 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnOWbE3q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DEA45008;
	Tue, 20 Aug 2024 21:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724190040; cv=none; b=Eb7+rSug47X8p//Acnvzn1mjjlCn4kgSP4mAta3qeGU2JBXaKzXA/HBp5AiwtuJH9vqA+8tYyaGIveX1juTToANBhT/5eCd4AI0lIi8z5Jdf+X08tqQyvA1ZUMa5GYImMRJeM8hRDwdGdXphxzEDUmmxQ+lWneczQSZFKJyUPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724190040; c=relaxed/simple;
	bh=Ca6gwEKH80OPr+KsoobU9z79sFuQS6nDgaPIgItVHyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHnqEi39sajQKOjWShE16MknwZ7FNJz/t9nUqSA4lAuPcK8n2ougARAsYcIc0BDStESXBqZY6eENmSzFtvxFwWzzkLopVFPu8PxT4dO5W7O25nBkH+KbsOjimQtGC6NaRVBmrFwvZrjQ7NwX2GAj5ZUGISJqsSzo7gb51TZ05l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnOWbE3q; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso33754161fa.2;
        Tue, 20 Aug 2024 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724190036; x=1724794836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9iSw6uozci3pG6LRIrPTc4SM7kkJjQGgR6ebryZrPo=;
        b=gnOWbE3qzJAF/yc484GYgInHMrCxfmnKX44JLbgealCEXPY2rJj+6kQYpnFKbSDiyQ
         QUb0JxT/+NehVXWpUtrG1FYXHssGbZv6v5LRtz+Lr5QE5gYnQW7AZEc0U1obZao3n39F
         t8oMUtSgUafKYSjqb6vJi6CNbqiJRg6bmNo4VS2VM4IW0Q97oJD9lfJG5Fiw/in0pDWa
         HAi1p4QKtYFVe4NdMbm4O1YMIPilQC4Gxvr7RrKD/tHseM2nDpXihvnr+RZz/Btdv2u8
         0wRHIktN7PQOXn0v3WzG5VwG/UQVC8Bsp8lMXtSArFUQUeMTg38Z4+piABZtOTSv2eAE
         JdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724190036; x=1724794836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9iSw6uozci3pG6LRIrPTc4SM7kkJjQGgR6ebryZrPo=;
        b=A+w9VnUo0hdIbTCN/NE5NtqhbEgzQZ1MU4erCuV70FH2fKFT/gOnjeCidjh8bv6FqB
         8fGhinTAou5FNfJ6MtZsTbYG4RRNVTbOaKnlxwFwaB9Iz3U+tLpr/jgZHdRgB2UDswoq
         vcWBRmfsuCnVOA445LyGUTEonlgZziVvbhVwMSH/tU3cFEhk2GrKcwt1g3y8Y1MOfMO/
         CAiaSbWz4BXosP0IzjRGKPdtzm2zEiD4ugab1pDgOxkc4RGqQyDGHsNfcDKg0j/J6LcH
         Hx86eJ99Cd0+5siAqBU3BaCjuFGWLTL299XKmqALo1VLPBs9DE2EO2pCbTBGwEAjBEjD
         4fNw==
X-Forwarded-Encrypted: i=1; AJvYcCUaL90Sc+qewB6GIYh7bjSQ5f20S8+uvfzllF+6SDgzLyDPfnE8v8E/Jgz2OyrsIwDFMvhEZL/J4rkTQA==@vger.kernel.org, AJvYcCUpJwLFEfPCwcXjsRea3ybl1oHimA/Dgg6dC7OXpKhuYZ3ghldS6yvVZUBlEYxOK0rKzqOricBcgK5VcRJuwZGBo8bUNg==@vger.kernel.org, AJvYcCX1Z3aHXTx3lDdWZdkuR24rF4sSG/Nc7sk9BGjf2c7y4BlZMgboqcskt/e/ieRmKkbyju3J6hR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7cYsfBZjDyIycYexTDOu9RFQ8Zld5L9IP3y4y+LuCXj69tSyl
	sKxCare/z2gv3sMHTLnEuLuBDtMfAkJf9Ym3YiZJBdfJSQQMhnN4
X-Google-Smtp-Source: AGHT+IGIqjQs4+C80iAgdeSuscEasTqYgihJ6L+4FrzuYEUEybXMuLJI/umICeTIA5PWKNHpVej7yg==
X-Received: by 2002:a2e:742:0:b0:2f3:f1ee:2256 with SMTP id 38308e7fff4ca-2f3f8b3ce37mr1601731fa.44.1724190035975;
        Tue, 20 Aug 2024 14:40:35 -0700 (PDT)
Received: from localhost ([91.219.237.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935909sm808193166b.112.2024.08.20.14.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 14:40:35 -0700 (PDT)
Date: Wed, 21 Aug 2024 00:40:34 +0300
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZsUNUh7IGeduDUNX@mail.gmail.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
 <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
 <Zrph94r8haR_nbj7@google.com>
 <ZsJZ7fKJtNTbXhi7@google.com>
 <ZsR0HdzglEH19dVH@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsR0HdzglEH19dVH@mail.gmail.com>

On Tue, 20 Aug 2024 at 13:46:53 +0300, Maxim Mikityanskiy wrote:
> On Sun, 18 Aug 2024 at 13:30:37 -0700, Dmitry Torokhov wrote:
> > On Mon, Aug 12, 2024 at 12:26:47PM -0700, Dmitry Torokhov wrote:
> > > On Mon, Aug 12, 2024 at 08:18:24PM +0200, Hans de Goede wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On 8/12/24 7:24 PM, Dmitry Torokhov wrote:
> > > > > On Mon, Aug 12, 2024 at 04:41:50PM +0200, Hans de Goede wrote:
> > > > >> Hi Maxim,
> > > > >>
> > > > >> On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
> > > > >>> On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
> > > > >>>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> > > > >>>>> That means, userspace is not filtering out events upon receiving
> > > > >>>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> > > > >>>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> > > > >>>>> is weird. It maintains the touchpad state in firmware to light up the
> > > > >>>>> status LED, but the firmware doesn't do the actual touchpad disablement.
> > > > >>>>>
> > > > >>>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
> > > > >>>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
> > > > >>>>
> > > > >>>> Ack.
> > > > >>>>
> > > > >>>> So how about this instead:
> > > > >>>>
> > > > >>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > > > >>>> index 1ace711f7442..b7fa06f793cb 100644
> > > > >>>> --- a/drivers/platform/x86/ideapad-laptop.c
> > > > >>>> +++ b/drivers/platform/x86/ideapad-laptop.c
> > > > >>>> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
> > > > >>>>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> > > > >>>>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> > > > >>>>  	 */
> > > > >>>> -	if (priv->features.ctrl_ps2_aux_port)
> > > > >>>> +	if (send_events && priv->features.ctrl_ps2_aux_port)
> > > > >>>>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> > > > >>>>  
> > > > >>>>  	/*
> > > > >>>>
> > > > >>>> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
> > > > >>>> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> > > > >>>
> > > > >>> *Maxim
> > > > >>
> > > > >> Oops, sorry.
> > > > >>
> > > > >>> Just a heads-up, my Z570 now belongs to a family member, we'll test what
> > > > >>> you asked, but right now there is a btrfs corruption on that laptop that
> > > > >>> we need to fix first, it interferes with kernel compilation =/
> > > > >>
> > > > >> Note as discussed in another part of the thread the original bug report
> > > > >> actually was not on a Z570, so the whole usage of i8042_command() on
> > > > >> suspend/resume was a bit of a red herring. And the suspend/resume issue
> > > > >> has been fixed in another way in the mean time.
> > > > >>
> > > > >> So there really is no need to test this change anymore. At the moment
> > > > >> there are no planned changes to ideapad-laptop related to this.
> > > > > 
> > > > > I think we still need to stop ideapad-laptop poking into 8042,
> > > > > especially ahead of time.
> > > > 
> > > > I agree. I think your suggestion of using the new(ish) [un]inhibit
> > > > support in the input subsystem for this instead of poking at the i8042
> > > > is a good idea.
> > > > 
> > > > As I mentioned when you first suggested this, I guess this requires 2 things:
> > > > 
> > > > 1. Some helper to find the struct input_dev for the input_dev related
> > > >    to the ps/2 aux port
> > > > 2. In kernel API / functions to do inhibit/uninhibit
> > > >    (maybe these already exist?)
> > > > 
> > > > > If we do not want to wait for userspace to
> > > > > handle this properly, I wonder if we could not create an
> > > > > input_handler that would attach to the touchpad device and filter out
> > > > > all events coming from the touchpad if touchpad is supposed to be off.
> > > > 
> > > > I think using the inhibit stuff would be better no?
> > > 
> > > The issue with inhibit/uninhibit is that they are only exposed to
> > > userpsace via sysfs. And as you mentioned we need to locate the input
> > > device corresponding to the touchpad.
> > > 
> > > With input handler we are essentially getting both - psmouse does not do
> > > anything special in inhibit so it is just the input core dropping
> > > events, the same as with the filter handler, and we can use hanlder's
> > > match table to limit it to the touchpad and input core will find the
> > > device for us.
> > > 
> > > > 
> > > > The biggest problems with trying to fix this are:
> > > > 
> > > > 1. Finding time to work on this
> > > > 2. Finding someone willing to test the patches
> > > > 
> > > > Finding the time is going to be an issue for me since the i8042_command()
> > > > calls are only still done on a single model laptop (using a DMI quirk)
> > > > inside ideapad-laptop now, so this is pretty low priority IMHO. Which
> > > > in practice means that I will simply never get around to this, sorry...
> > > 
> > > Yeah, I can see that ;) Maybe I will find a couple of hours to waste...
> > 
> > Maybe something like below can work?
> 
> Great patch, thank you, I'll test it and report the results. See some
> minor comments below.
> 
> > 
> > 
> > platform/x86: ideapad-laptop: do not poke keyboard controller
> > 
> > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > On Ideapad Z570 the driver tries to disable and reenable data coming
> > from the touchpad by poking directly into 8042 keyboard controller.
> > This may coincide with the controller resuming and leads to spews in
> > dmesg and potentially other instabilities.
> > 
> > Instead of using i8042_command() to control the touchpad state create a
> > input handler that serves as a filter and drop events coming from the
> > touchpad when it is supposed to be off.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/platform/x86/ideapad-laptop.c |  171 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 168 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > index fcf13d88fd6e..2f40feefd5e3 100644
> > --- a/drivers/platform/x86/ideapad-laptop.c
> > +++ b/drivers/platform/x86/ideapad-laptop.c
> > @@ -17,7 +17,6 @@
> >  #include <linux/device.h>
> >  #include <linux/dmi.h>
> >  #include <linux/fb.h>
> > -#include <linux/i8042.h>
> >  #include <linux/init.h>
> >  #include <linux/input.h>
> >  #include <linux/input/sparse-keymap.h>
> > @@ -157,6 +156,13 @@ struct ideapad_private {
> >  		struct led_classdev led;
> >  		unsigned int last_brightness;
> >  	} fn_lock;
> > +	struct {
> > +		bool initialized;
> > +		bool active;
> > +		struct input_handler handler;
> > +		struct input_dev *tp_dev;
> > +		spinlock_t lock;
> > +	} tp_switch;
> >  };
> >  
> >  static bool no_bt_rfkill;
> > @@ -1236,6 +1242,158 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
> >  	}
> >  }
> >  
> > +struct ideapad_tpswitch_handle {
> > +	struct input_handle handle;
> > +	struct ideapad_private *priv;
> > +};
> > +
> > +#define to_tpswitch_handle(h) \
> > +	container_of(h, struct ideapad_tpswitch_handle, handle);
> > +
> > +static int ideapad_tpswitch_connect(struct input_handler *handler,
> > +				    struct input_dev *dev,
> > +				    const struct input_device_id *id)
> > +{
> > +	struct ideapad_private *priv =
> > +		container_of(handler, struct ideapad_private, tp_switch.handler);
> > +	struct ideapad_tpswitch_handle *h;
> > +	int error;
> > +
> > +	h = kzalloc(sizeof(*h), GFP_KERNEL);
> > +	if (!h)
> > +		return -ENOMEM;
> > +
> > +	h->priv = priv;
> > +	h->handle.dev = dev;
> > +	h->handle.handler = handler;
> > +	h->handle.name = "ideapad-tpswitch";
> > +
> > +	error = input_register_handle(&h->handle);
> > +	if (error)
> > +		goto err_free_handle;
> > +
> > +	/*
> > +	 * FIXME: ideally we do not want to open the input device here
> > +	 * if there are no other users. We need a notion of "observer"
> > +	 * handlers in the input core.
> > +	 */
> > +	error = input_open_device(&h->handle);
> > +	if (error)
> > +		goto err_unregister_handle;
> > +
> > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > +		priv->tp_switch.tp_dev = dev;
> > +
> > +	return 0;
> > +
> > + err_unregister_handle:
> > +	input_unregister_handle(&h->handle);
> > +err_free_handle:
> > +	kfree(h);
> > +	return error;
> > +}
> > +
> > +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> > +{
> > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > +	struct ideapad_private *priv = h->priv;
> > +
> > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> 
> Nice syntax, I didn't know about it before.
> 
> > +		priv->tp_switch.tp_dev = NULL;
> > +
> > +	input_close_device(handle);
> > +	input_unregister_handle(handle);
> > +	kfree(h);
> > +}
> > +
> > +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> > +				    unsigned int type, unsigned int code,
> > +				    int value)
> > +{
> > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > +	struct ideapad_private *priv = h->priv;
> > +
> > +	if (!priv->tp_switch.active)
> 
> This check seems inverted. ideapad_tpswitch_toggle assigns true when the
> touchpad is enabled.

I tested the patch on Z570 (with this check inverted), and it seems to
work great.

Also tested what happens on resume from suspend: the laptop reenables
the touchpad (the LED turns off on suspend and blinks briefly on
resume), and the driver handles it properly.

> 
> > +		return false;
> > +
> > +	/* Allow passing button release events, drop everything else */
> > +	return !(type == EV_KEY && value == 0) &&
> > +	       !(type == EV_SYN && code == SYN_REPORT);
> > +
> > +}
> > +
> > +static const struct input_device_id ideapad_tpswitch_ids[] = {
> > +	{
> > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> > +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> > +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> > +		.bustype = BUS_I8042,
> > +		.vendor = 0x0002,
> > +		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
> > +		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
> > +				BIT_MASK(BTN_TOOL_FINGER) },
> > +		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
> > +				BIT_MASK(ABS_PRESSURE) |
> > +				BIT_MASK(ABS_TOOL_WIDTH) },
> > +	},
> > +	{ }
> > +};
> > +
> > +static int ideapad_tpswitch_init(struct ideapad_private *priv)
> > +{
> > +	int error;
> > +
> > +	if (!priv->features.ctrl_ps2_aux_port)
> 
> Nit: the comment above ctrl_ps2_aux_port and the MODULE_PARAM_DESC
> should be altered, because it no longer disables PS/2 AUX, but just
> filters the events on software level.
> 
> Not sure whether we want to keep the old name for the module parameter.
> I think it's better to keep it, because it essentially serves the same
> purpose, but the implementation is better.
> 
> > +		return 0;
> > +
> > +	spin_lock_init(&priv->tp_switch.lock);
> > +
> > +	priv->tp_switch.handler.name = "ideapad-tpswitch";
> > +	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
> > +	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
> > +	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
> > +	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
> > +
> > +	error = input_register_handler(&priv->tp_switch.handler);
> > +	if (error) {
> > +		dev_err(&priv->platform_device->dev,
> > +			"failed to register touchpad switch handler: %d",
> > +			error);
> > +		return error;
> > +	}
> > +
> > +	priv->tp_switch.initialized = true;
> > +	return 0;
> > +}
> > +
> > +static void ideapad_tpswitch_exit(struct ideapad_private *priv)
> > +{
> > +	if (priv->tp_switch.initialized) {
> > +		input_unregister_handler(&priv->tp_switch.handler);
> > +		priv->tp_switch.initialized = false;
> > +	}
> > +}
> > +
> > +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool on)
> > +{
> > +	guard(spinlock_irq)(&priv->tp_switch.lock);
> > +
> > +	priv->tp_switch.active = on;
> > +	if (on) {
> > +		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
> > +		if (tp_dev) {
> > +			input_report_key(tp_dev, BTN_TOUCH, 0);
> > +			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
> > +			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
> > +			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
> > +			input_report_key(tp_dev, BTN_LEFT, 0);
> > +			input_report_key(tp_dev, BTN_RIGHT, 0);
> > +			input_report_key(tp_dev, BTN_MIDDLE, 0);
> > +			input_sync(tp_dev);
> > +		}
> > +	}
> > +}
> > +
> >  /*
> >   * backlight
> >   */
> > @@ -1567,7 +1725,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
> >  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
> >  {
> >  	unsigned long value;
> > -	unsigned char param;
> >  	int ret;
> >  
> >  	/* Without reading from EC touchpad LED doesn't switch state */
> > @@ -1582,7 +1739,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
> >  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> >  	 */
> >  	if (priv->features.ctrl_ps2_aux_port)
> > -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> > +		ideapad_tpswitch_toggle(priv, value);
> >  
> >  	/*
> >  	 * On older models the EC controls the touchpad and toggles it on/off
> > @@ -1927,6 +2084,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
> >  	if (err)
> >  		goto input_failed;
> >  
> > +	err = ideapad_tpswitch_init(priv);
> > +	if (err)
> > +		goto tpswitch_failed;
> > +
> >  	err = ideapad_kbd_bl_init(priv);
> >  	if (err) {
> >  		if (err != -ENODEV)
> > @@ -2001,6 +2162,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
> >  
> >  	ideapad_fn_lock_led_exit(priv);
> >  	ideapad_kbd_bl_exit(priv);
> > +	ideapad_tpswitch_exit(priv);
> > +
> > +tpswitch_failed:
> >  	ideapad_input_exit(priv);
> >  
> >  input_failed:
> > @@ -2029,6 +2193,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
> >  
> >  	ideapad_fn_lock_led_exit(priv);
> >  	ideapad_kbd_bl_exit(priv);
> > +	ideapad_tpswitch_exit(priv);
> >  	ideapad_input_exit(priv);
> >  	ideapad_debugfs_exit(priv);
> >  	ideapad_sysfs_exit(priv);

