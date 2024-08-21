Return-Path: <linux-input+bounces-5720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8B195940C
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 07:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A559928154C
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 05:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84C2166F02;
	Wed, 21 Aug 2024 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edKtMg2x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063C157E62;
	Wed, 21 Aug 2024 05:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724218109; cv=none; b=oXTDDMpYna/dPVEHgxCF/82Hx+k55eg1yKiGu45169q38YBgUMS5cCeNCuSwpIxY9zTFgCj6+gZaqe5cmNHsvSIc5+PWhXRIJRl4KLedqB0Fd2CaiHrmQa9KNfnMe3Zg/Nt8Ncfyu6p5fKPXWXs6E9MjJAZTfdoc6DxTiXguk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724218109; c=relaxed/simple;
	bh=aLcHiegIuOi+f+fxw2rJxz/UsUNbZWn/Ch2h2XFIoQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPr9rlT4j8U9WR/sXY08mQSXuzxQDxmiyFxLgbbU2mtI75PpW9kLU0luaVCDbdFUV0ak+x9H3ReZqbVggMVAt5Wu8MA+dwJTmcVtrfgH7f+AEwrdLfT5In2Pyij1gz0oBISx8B4NC/C9CBeN9shxbrpNYzwNV7pKtiX6LUXD94Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edKtMg2x; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso4464143a12.2;
        Tue, 20 Aug 2024 22:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724218107; x=1724822907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTFKIDvCm1Z5mPreMcN7KxNB0etUZ8BUtYGdp/1dbTc=;
        b=edKtMg2xNe5XuYkN+ew7XmFdtqs+Q6wyeyf2iDPbbSy0YnnzkBcEOgiOp3sAaQGBqw
         a5Z5DG02BdhJ1D2lsY+0INXSji1G/C+6wRH9VWuLKWHeRRhplgn3d3SwKObscEfr2YdS
         8Qg9nGGBDVo1FEuK/h+gsapbBiVaJJ0g9zaChNP26af3oHtfHgJU+IdEN8RdxbKDnRj4
         M5QeYp00/kdbdLwHAGzJmTPgsOi3yz47NwmZ6pU/2aaK2zHakxr4ZKGpNqWBbWTnYluK
         WnehQOkqY1txPHm3jbp9dtvumjZgH8uPT7pvXH6M/7QtxckEoPjeqFgvcTDpo2QSLOmW
         ZFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724218107; x=1724822907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTFKIDvCm1Z5mPreMcN7KxNB0etUZ8BUtYGdp/1dbTc=;
        b=N4BAt0RPtgoW5rA2WAC2qRMZnM9Fuhl0jW1bPmEnWFMZky8bebcdHeomwpwl6tuEoY
         Pg64AjHgMknpmAhm5i0qLl1dys+x+CcKYR2pZtV1Kj8do5KSbYk9yawUPS35HkxrymFw
         77ufhgtn7M0eXJbKyR4WnNquaFfYYnn4pkcSLAPYjuiDqzxzzEFhz14cve/C1ghtUtME
         5CI3pmmwiu/0Hbt1o8yUWsFE1i8GtsjTsdLYV70vuUfWgHIpoVCURZvA5yd55SEMo1jZ
         qyMYlICXTmSG9eW46sEGen0tKGLFqAg0+5XeJefxRSBWQosa5KaUT1TZuPxnXHcTS3w4
         aOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkNj0YEDTLZszz8G8W7kN5YYH90WxNvEvd9IBtO84g7l/XorQImpVI0+Wp8QdNs2WLMqSK/NCQ1sj76vmnpOpF04RNIw==@vger.kernel.org, AJvYcCW70QmB99GeIDLAXCHOYEmmEp0QjWOJyQUvBB5hi/DXANSu01i29PX9t8K6puAcCjr53j9KczFj@vger.kernel.org, AJvYcCWgv7HfqF/9Q9xB3r/yPKdLpYJyFRfU+/BGpTkP8k+tH1cKYP5rL8kx6BDybBGQXtkMBoWUKOvzz3eAcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydY5m2BXDc2Fqkjhjcm0h/tsUIouPOoGHwxc5alZaUUbqoU4yV
	oIWBWHbo+y2YLn/+e9cTwHlawKywISMvXdArkFjFleui/tOxs5yn
X-Google-Smtp-Source: AGHT+IF4/W5UKTOzWJfcWClbUVUzvP2wRHB4iGB3pJ+jyH5opKIM1m+Rmv1H5gwXifaXY+kvk9TB4Q==
X-Received: by 2002:a05:6a20:9e4e:b0:1c4:b8a1:6d54 with SMTP id adf61e73a8af0-1cad8145eeamr1908544637.36.1724218107253;
        Tue, 20 Aug 2024 22:28:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9f8b:d2d2:8416:b9d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebba6f7esm676665a91.55.2024.08.20.22.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 22:28:26 -0700 (PDT)
Date: Tue, 20 Aug 2024 22:28:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZsV6-NRkJLJhHxiq@google.com>
References: <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
 <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
 <Zrph94r8haR_nbj7@google.com>
 <ZsJZ7fKJtNTbXhi7@google.com>
 <ZsR0HdzglEH19dVH@mail.gmail.com>
 <ZsUNUh7IGeduDUNX@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsUNUh7IGeduDUNX@mail.gmail.com>

On Wed, Aug 21, 2024 at 12:40:34AM +0300, Maxim Mikityanskiy wrote:
> On Tue, 20 Aug 2024 at 13:46:53 +0300, Maxim Mikityanskiy wrote:
> > On Sun, 18 Aug 2024 at 13:30:37 -0700, Dmitry Torokhov wrote:
> > > 
> > > Maybe something like below can work?
> > 
> > Great patch, thank you, I'll test it and report the results. See some
> > minor comments below.
> > 
> > > 
> > > 
> > > platform/x86: ideapad-laptop: do not poke keyboard controller
> > > 
> > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > 
> > > On Ideapad Z570 the driver tries to disable and reenable data coming
> > > from the touchpad by poking directly into 8042 keyboard controller.
> > > This may coincide with the controller resuming and leads to spews in
> > > dmesg and potentially other instabilities.
> > > 
> > > Instead of using i8042_command() to control the touchpad state create a
> > > input handler that serves as a filter and drop events coming from the
> > > touchpad when it is supposed to be off.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/platform/x86/ideapad-laptop.c |  171 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 168 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > > index fcf13d88fd6e..2f40feefd5e3 100644
> > > --- a/drivers/platform/x86/ideapad-laptop.c
> > > +++ b/drivers/platform/x86/ideapad-laptop.c
> > > @@ -17,7 +17,6 @@
> > >  #include <linux/device.h>
> > >  #include <linux/dmi.h>
> > >  #include <linux/fb.h>
> > > -#include <linux/i8042.h>
> > >  #include <linux/init.h>
> > >  #include <linux/input.h>
> > >  #include <linux/input/sparse-keymap.h>
> > > @@ -157,6 +156,13 @@ struct ideapad_private {
> > >  		struct led_classdev led;
> > >  		unsigned int last_brightness;
> > >  	} fn_lock;
> > > +	struct {
> > > +		bool initialized;
> > > +		bool active;
> > > +		struct input_handler handler;
> > > +		struct input_dev *tp_dev;
> > > +		spinlock_t lock;
> > > +	} tp_switch;
> > >  };
> > >  
> > >  static bool no_bt_rfkill;
> > > @@ -1236,6 +1242,158 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
> > >  	}
> > >  }
> > >  
> > > +struct ideapad_tpswitch_handle {
> > > +	struct input_handle handle;
> > > +	struct ideapad_private *priv;
> > > +};
> > > +
> > > +#define to_tpswitch_handle(h) \
> > > +	container_of(h, struct ideapad_tpswitch_handle, handle);
> > > +
> > > +static int ideapad_tpswitch_connect(struct input_handler *handler,
> > > +				    struct input_dev *dev,
> > > +				    const struct input_device_id *id)
> > > +{
> > > +	struct ideapad_private *priv =
> > > +		container_of(handler, struct ideapad_private, tp_switch.handler);
> > > +	struct ideapad_tpswitch_handle *h;
> > > +	int error;
> > > +
> > > +	h = kzalloc(sizeof(*h), GFP_KERNEL);
> > > +	if (!h)
> > > +		return -ENOMEM;
> > > +
> > > +	h->priv = priv;
> > > +	h->handle.dev = dev;
> > > +	h->handle.handler = handler;
> > > +	h->handle.name = "ideapad-tpswitch";
> > > +
> > > +	error = input_register_handle(&h->handle);
> > > +	if (error)
> > > +		goto err_free_handle;
> > > +
> > > +	/*
> > > +	 * FIXME: ideally we do not want to open the input device here
> > > +	 * if there are no other users. We need a notion of "observer"
> > > +	 * handlers in the input core.
> > > +	 */
> > > +	error = input_open_device(&h->handle);
> > > +	if (error)
> > > +		goto err_unregister_handle;
> > > +
> > > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > > +		priv->tp_switch.tp_dev = dev;
> > > +
> > > +	return 0;
> > > +
> > > + err_unregister_handle:
> > > +	input_unregister_handle(&h->handle);
> > > +err_free_handle:
> > > +	kfree(h);
> > > +	return error;
> > > +}
> > > +
> > > +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> > > +{
> > > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > > +	struct ideapad_private *priv = h->priv;
> > > +
> > > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > 
> > Nice syntax, I didn't know about it before.
> > 
> > > +		priv->tp_switch.tp_dev = NULL;
> > > +
> > > +	input_close_device(handle);
> > > +	input_unregister_handle(handle);
> > > +	kfree(h);
> > > +}
> > > +
> > > +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> > > +				    unsigned int type, unsigned int code,
> > > +				    int value)
> > > +{
> > > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > > +	struct ideapad_private *priv = h->priv;
> > > +
> > > +	if (!priv->tp_switch.active)
> > 
> > This check seems inverted. ideapad_tpswitch_toggle assigns true when the
> > touchpad is enabled.
> 
> I tested the patch on Z570 (with this check inverted), and it seems to
> work great.
> 
> Also tested what happens on resume from suspend: the laptop reenables
> the touchpad (the LED turns off on suspend and blinks briefly on
> resume), and the driver handles it properly.

Great, thank you! Give me a couple of days and I think I will implement
observer/passive handler support and we can figure out how to merge
this...

-- 
Dmitry

