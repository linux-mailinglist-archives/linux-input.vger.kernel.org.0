Return-Path: <linux-input+bounces-6635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1497E097
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 10:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F340DB20E53
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 08:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57981917F2;
	Sun, 22 Sep 2024 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmr9xWz6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DB2A1D6;
	Sun, 22 Sep 2024 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726994121; cv=none; b=Pa4/KxKUbXyHlaI71YH6kjV5lvMGdokk5enaGch7fOiQPnVfj9WTQONhiNpIo21QlNi5wCWzcwubv56a4pNnPg4KZf8/KPAXrCd2WsxvX1hWMgrhCC2rBKCiHq68nBLcPpJqsPoALWtXxlLpNVgtAHSdN3O77rDOPNDxtHXysK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726994121; c=relaxed/simple;
	bh=g+UzxhXTkNKyawHNmt+6mQDzKIjYDRcOqMj4/ic+LYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RymLCK7gdepzvF0RRRATdk9Gh38sCoyUtdHwBZRIkrC8R90elAE2Jy4tzq1Z/ragoEoCG3lNxZss0ICLZcFSMyej/PUMPcOD8kGp8VIdHqh6Gpg/EIxS7iPY3XoqAAxIWkJkGyej8+pbqde4gD1jKOkjYaIvaYWTkGrQmKQjOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmr9xWz6; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c4226a56a8so4105403a12.2;
        Sun, 22 Sep 2024 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726994118; x=1727598918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hELMiTG/dFt/UvLafTh78bwKU4OJLAzKH/zb3xlfROw=;
        b=fmr9xWz6NfZjhkH8uDtLUzN4H30MOBsjPEy9AvHNfkkio3KOSRS/BIz/DBgLBInHjr
         rc/hFLRWdgCRXWPKWCR+pN32qM5hkwRdNf71eQcr181VMys6wP+BmytPNu81/lbWLnHm
         Vj6PQ8z6p6U/oH1mhUGVhOWQjwvfj79U7glRi3bji3eoHqHzR0VB2lKPZG2PwxpMjSd1
         dihMIRhwCU7e9YCK4rVmMYaF9NRlcnfK9eylG89CLTCQVFJ1Is5MVeXMThPQkCTwZFEA
         yho7Yq0eg5HfS22twrczkuezah/UiwHqGiXLjEXH8BJKkq94PNOVG4G8x+/04qpytzHc
         GALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994118; x=1727598918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hELMiTG/dFt/UvLafTh78bwKU4OJLAzKH/zb3xlfROw=;
        b=RXkdZ1eympunPEe/ldQYIouFpasoK9ASqAsKYQSDtJNc2cZB4HNxzgYu3TPumhGLaB
         mA0+DOKbl9NONa/2ba2sfRtM7yepYSeGZXoHrHfmqTxincJGPpNWI/qYY4b61z3ZTzZb
         h4KQlLGJXfQujBSZcKsC8lWf2HbJ3OmM/x+1Q1jz630rbRYS1DKktCYDgQ3MKq7l0xvh
         Kc58av5u2eSYPtoiy7UNrkYvjNEh1PbyrOyhVSylSW+g5GsbioVdy7vRowAoh6Toszb/
         mC1KTFJMCDFqfcoxHWa7TDFYwk4sp0lvaJOCqofRTTqZ7FrTNlK+pQSuiAUqCVbW8A5c
         rAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIBSN65fW8O7gCvprl+3OfjPSzaattdGIsTV12ayi7MENTqJ4rAifhFMQOZCm366sx0QRwbQJrL/zpfFfuoWjU+YrasQ==@vger.kernel.org, AJvYcCXXGFU4JLKtFckxupEeIV2O0jEQ+Ioretnx91tO10xGfSTKmE4rtZbLWKjOtCirV0DhtlyHDJyr@vger.kernel.org, AJvYcCXabrbw/+G2lxoMI3Iln13b2VJHI8eAyulPtygwt2tBvv4nSj66uWpeQn4BkNGR0s4VucgxpUZs9VhlWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqjpbrEsWuyMx4ooxTEIfQ/Ju/dzYlQnb3+/5zg80z0RoIR0S
	KqBif6E6A1Knm8IEl/45hitllJ7TCTfjJzzqQB84A0D+7hmyQtcSiXzYmHYXG6c=
X-Google-Smtp-Source: AGHT+IHpaQ8L9/ZYjljF5hDaBaYHA2wczNXlBH3xtNT5xzJXFXKFv0ZySyab/80g0dGZNr+MK1zLuA==
X-Received: by 2002:a05:6402:2694:b0:5c5:b9bb:c65a with SMTP id 4fb4d7f45d1cf-5c5b9bbc771mr2838650a12.1.1726994117696;
        Sun, 22 Sep 2024 01:35:17 -0700 (PDT)
Received: from localhost (tor-exit-45.for-privacy.net. [185.220.101.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89d5bsm9015654a12.74.2024.09.22.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:35:16 -0700 (PDT)
Date: Sun, 22 Sep 2024 11:35:14 +0300
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <Zu_WwjD15VgiR2j9@mail.gmail.com>
References: <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
 <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
 <Zrph94r8haR_nbj7@google.com>
 <ZsJZ7fKJtNTbXhi7@google.com>
 <ZsR0HdzglEH19dVH@mail.gmail.com>
 <ZsUNUh7IGeduDUNX@mail.gmail.com>
 <ZsV6-NRkJLJhHxiq@google.com>
 <ZteiClP9jabjHFkG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZteiClP9jabjHFkG@google.com>

On Tue, 03 Sep 2024 at 16:55:54 -0700, Dmitry Torokhov wrote:
> On Tue, Aug 20, 2024 at 10:28:24PM -0700, Dmitry Torokhov wrote:
> > On Wed, Aug 21, 2024 at 12:40:34AM +0300, Maxim Mikityanskiy wrote:
> > > On Tue, 20 Aug 2024 at 13:46:53 +0300, Maxim Mikityanskiy wrote:
> > > > On Sun, 18 Aug 2024 at 13:30:37 -0700, Dmitry Torokhov wrote:
> > > > > 
> > > > > Maybe something like below can work?
> > > > 
> > > > Great patch, thank you, I'll test it and report the results. See some
> > > > minor comments below.
> > > > 
> > > > > 
> > > > > 
> > > > > platform/x86: ideapad-laptop: do not poke keyboard controller
> > > > > 
> > > > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > 
> > > > > On Ideapad Z570 the driver tries to disable and reenable data coming
> > > > > from the touchpad by poking directly into 8042 keyboard controller.
> > > > > This may coincide with the controller resuming and leads to spews in
> > > > > dmesg and potentially other instabilities.
> > > > > 
> > > > > Instead of using i8042_command() to control the touchpad state create a
> > > > > input handler that serves as a filter and drop events coming from the
> > > > > touchpad when it is supposed to be off.
> > > > > 
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > ---
> > > > >  drivers/platform/x86/ideapad-laptop.c |  171 ++++++++++++++++++++++++++++++++-
> > > > >  1 file changed, 168 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > > > > index fcf13d88fd6e..2f40feefd5e3 100644
> > > > > --- a/drivers/platform/x86/ideapad-laptop.c
> > > > > +++ b/drivers/platform/x86/ideapad-laptop.c
> > > > > @@ -17,7 +17,6 @@
> > > > >  #include <linux/device.h>
> > > > >  #include <linux/dmi.h>
> > > > >  #include <linux/fb.h>
> > > > > -#include <linux/i8042.h>
> > > > >  #include <linux/init.h>
> > > > >  #include <linux/input.h>
> > > > >  #include <linux/input/sparse-keymap.h>
> > > > > @@ -157,6 +156,13 @@ struct ideapad_private {
> > > > >  		struct led_classdev led;
> > > > >  		unsigned int last_brightness;
> > > > >  	} fn_lock;
> > > > > +	struct {
> > > > > +		bool initialized;
> > > > > +		bool active;
> > > > > +		struct input_handler handler;
> > > > > +		struct input_dev *tp_dev;
> > > > > +		spinlock_t lock;
> > > > > +	} tp_switch;
> > > > >  };
> > > > >  
> > > > >  static bool no_bt_rfkill;
> > > > > @@ -1236,6 +1242,158 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > +struct ideapad_tpswitch_handle {
> > > > > +	struct input_handle handle;
> > > > > +	struct ideapad_private *priv;
> > > > > +};
> > > > > +
> > > > > +#define to_tpswitch_handle(h) \
> > > > > +	container_of(h, struct ideapad_tpswitch_handle, handle);
> > > > > +
> > > > > +static int ideapad_tpswitch_connect(struct input_handler *handler,
> > > > > +				    struct input_dev *dev,
> > > > > +				    const struct input_device_id *id)
> > > > > +{
> > > > > +	struct ideapad_private *priv =
> > > > > +		container_of(handler, struct ideapad_private, tp_switch.handler);
> > > > > +	struct ideapad_tpswitch_handle *h;
> > > > > +	int error;
> > > > > +
> > > > > +	h = kzalloc(sizeof(*h), GFP_KERNEL);
> > > > > +	if (!h)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	h->priv = priv;
> > > > > +	h->handle.dev = dev;
> > > > > +	h->handle.handler = handler;
> > > > > +	h->handle.name = "ideapad-tpswitch";
> > > > > +
> > > > > +	error = input_register_handle(&h->handle);
> > > > > +	if (error)
> > > > > +		goto err_free_handle;
> > > > > +
> > > > > +	/*
> > > > > +	 * FIXME: ideally we do not want to open the input device here
> > > > > +	 * if there are no other users. We need a notion of "observer"
> > > > > +	 * handlers in the input core.
> > > > > +	 */
> > > > > +	error = input_open_device(&h->handle);
> > > > > +	if (error)
> > > > > +		goto err_unregister_handle;
> > > > > +
> > > > > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > > > > +		priv->tp_switch.tp_dev = dev;
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > + err_unregister_handle:
> > > > > +	input_unregister_handle(&h->handle);
> > > > > +err_free_handle:
> > > > > +	kfree(h);
> > > > > +	return error;
> > > > > +}
> > > > > +
> > > > > +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> > > > > +{
> > > > > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > > > > +	struct ideapad_private *priv = h->priv;
> > > > > +
> > > > > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > > > 
> > > > Nice syntax, I didn't know about it before.
> > > > 
> > > > > +		priv->tp_switch.tp_dev = NULL;
> > > > > +
> > > > > +	input_close_device(handle);
> > > > > +	input_unregister_handle(handle);
> > > > > +	kfree(h);
> > > > > +}
> > > > > +
> > > > > +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> > > > > +				    unsigned int type, unsigned int code,
> > > > > +				    int value)
> > > > > +{
> > > > > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > > > > +	struct ideapad_private *priv = h->priv;
> > > > > +
> > > > > +	if (!priv->tp_switch.active)
> > > > 
> > > > This check seems inverted. ideapad_tpswitch_toggle assigns true when the
> > > > touchpad is enabled.
> > > 
> > > I tested the patch on Z570 (with this check inverted), and it seems to
> > > work great.
> > > 
> > > Also tested what happens on resume from suspend: the laptop reenables
> > > the touchpad (the LED turns off on suspend and blinks briefly on
> > > resume), and the driver handles it properly.
> > 
> > Great, thank you! Give me a couple of days and I think I will implement
> > observer/passive handler support and we can figure out how to merge
> > this...
> 
> OK, so if you could try the patch below that would be great.
> Don't forget to set ".passive_observer = 1" in the ideapad handler.

Sorry for the slow response. I tested the patches, setting
passive_observer in ideapad_tpswitch_init and inverting the check in
ideapad_tpswitch_filter - all seems to work perfectly!

> Thanks!
> 
> -- 
> Dmitry
> 
> 
> Input: introduce notion of passive observers for input handlers
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/input.c |    7 +++++++
>  include/linux/input.h |    5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 54c57b267b25..60a9445d78d5 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -605,6 +605,9 @@ int input_open_device(struct input_handle *handle)
>  
>  	handle->open++;
>  
> +	if (handle->handler->passive_observer)
> +		goto out;
> +
>  	if (dev->users++ || dev->inhibited) {
>  		/*
>  		 * Device is already opened and/or inhibited,
> @@ -668,6 +671,9 @@ void input_close_device(struct input_handle *handle)
>  
>  	__input_release_device(handle);
>  
> +	if (handle->handler->passive_observer)
> +		goto out;
> +
>  	if (!--dev->users && !dev->inhibited) {
>  		if (dev->poller)
>  			input_dev_poller_stop(dev->poller);
> @@ -684,6 +690,7 @@ void input_close_device(struct input_handle *handle)
>  		synchronize_rcu();
>  	}
>  
> +out:
>  	mutex_unlock(&dev->mutex);
>  }
>  EXPORT_SYMBOL(input_close_device);
> diff --git a/include/linux/input.h b/include/linux/input.h
> index 89a0be6ee0e2..6437c35f0796 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -286,6 +286,10 @@ struct input_handle;
>   * @start: starts handler for given handle. This function is called by
>   *	input core right after connect() method and also when a process
>   *	that "grabbed" a device releases it
> + * @passive_observer: set to %true by drivers only interested in observing
> + *	data stream from devices if there are other users present. Such
> + *	drivers will not result in starting underlying hardware device
> + *	when input_open_device() is called for their handles
>   * @legacy_minors: set to %true by drivers using legacy minor ranges
>   * @minor: beginning of range of 32 legacy minors for devices this driver
>   *	can provide
> @@ -321,6 +325,7 @@ struct input_handler {
>  	void (*disconnect)(struct input_handle *handle);
>  	void (*start)(struct input_handle *handle);
>  
> +	bool passive_observer;
>  	bool legacy_minors;
>  	int minor;
>  	const char *name;

