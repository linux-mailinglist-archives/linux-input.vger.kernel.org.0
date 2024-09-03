Return-Path: <linux-input+bounces-6120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773ED96AD21
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 01:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BD291C243AF
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0491D7985;
	Tue,  3 Sep 2024 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j03uaLNi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D4B647;
	Tue,  3 Sep 2024 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407760; cv=none; b=dhxYKKqTBIBVyT+kkWHocF5NGWwZWJQeszIi04ZlOnoegG2ieC5M4hB7/OXxGClnyUxGDstCtfWntBZP3obxzqi6fE+RygYg1MmK10b3euocF/YSlFyMx4jDgc+wI0GHqzEBkdElkrBAA9YxEAL5X/l7Ownp+0xL78lPiw45CsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407760; c=relaxed/simple;
	bh=LSOwYuGCKvbFWo4iN2ovI4ZnBGmZF6NN5+HSYIkfa6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcK1n+CodWuUibA8v+gmGWHHJL2nwSUfFRZagOkHSeYW2IxXiFU+niJquBWkC+P5OOl6L9lkFuWeoD59fAAuoolss2LS6SPQ7IeLw4bOWDH1TICA4VYiCzfyv2FgzM64xsbNpJFHEvYZHS7yAUF5Y4UdIYFSFSmX/r4W+kkiDYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j03uaLNi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso2260862a91.3;
        Tue, 03 Sep 2024 16:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725407758; x=1726012558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cFMiOs/yfweXq3uJON9KHqWX+3Y5SezGqg1af6CUqlg=;
        b=j03uaLNihtNvPPbucbwH9S+Ruu2VCgsiS54hm6PAdMYFOik47PEw9Xdq8t7TohHCrJ
         /9ZIVyjvVVonftTr/WKLya4A4ytLDCK1dWZwteZpzA9Oeqv5/w4utMGI27X2ClPkClCM
         xSTDitBq2t9uSMJ8ufqILefbpUHkla6VXcXUoX1eCHmLJLQnDHkFjZ7JrHvhmzbvmn6O
         DCKNerIUF++yWZB+HGVB7/10ZYQ4Qy7rsqkdJJ/6yiVQbQzHvk67o2U02T6IKFlrkSok
         kDp38k8KcaHh54y+IOgX6F8ehWneQ4nh2J2Eb/Gcf5eT25loQStqRHESLxZwRn1Rkr0W
         Qs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725407758; x=1726012558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFMiOs/yfweXq3uJON9KHqWX+3Y5SezGqg1af6CUqlg=;
        b=rk0iiJ9t2UZ13tNbTWHQro/7/3sOcUB7A4ck5s7P1I7IoNsa5vdOcQouJnSa2Vhkaq
         2qUhT83PosHU2V43diw5yGNYeT/bEebt5SKswlmgi+OuoTMXGlDwz6NuC3WAYMNP4ZnS
         PpnqGnyvVYi6kD9ndW+oA1rHEMX2zl6giiUi062P5cadiJvBHwgJs4QfsYN11r5fX7ru
         oaYM7i/BsCH1bJL61oBNxW7JX7JlSYuRmo5h/BLpjaxZgWVzd83knf0+t1xi1C7G53Ol
         k2WobyUBZ6BLrE3jElViw5rPw1FJZe0OepiUMl7jyrAJ1sqNHZTbpiQChTdGpR2AzFWf
         ReOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8oDpm7ljJj+lTqFvCfw7o2gLNnwhbysZyj3EpKITwdx30AVPfj/n5PS/PmfhMwXRJMUsRuhp1@vger.kernel.org, AJvYcCXffZr0D6tlrDPIXrFQyEE1BCvHGWlLPgbBm7nDfJSab1I6NO3o4I7cXL0uABSlaFW5pwSxAH9/AwtrNQ==@vger.kernel.org, AJvYcCXj5tLVVuM/bm1zQuV7Jy3ZpP1iAOuL6dRcTQMj6KfmcpgdlQeMbuvno7QGijeimLHT3lWxwCR4UEg/go9PaPOm9wK26Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKOUdGQ/xzqUiRMl2PhBVHI0RR+MX3ihuWSgWqADEgh8VoJoP
	ZfF15rp+guYIhAkQhbO/FWa6NnE7vFqNRnsXAHSanfVAibeYI46v
X-Google-Smtp-Source: AGHT+IFOE3cS1YC5tzzgZ3r3i9jiYZTer9F1jlK7UVk75TthuSEWg3rssXTq8VbDN1pkNJIVezZA2Q==
X-Received: by 2002:a17:90b:101:b0:2c3:2557:3de8 with SMTP id 98e67ed59e1d1-2d8973a5a50mr10867409a91.33.1725407758168;
        Tue, 03 Sep 2024 16:55:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b3b95e8sm12010806a91.54.2024.09.03.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 16:55:57 -0700 (PDT)
Date: Tue, 3 Sep 2024 16:55:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZteiClP9jabjHFkG@google.com>
References: <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
 <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
 <Zrph94r8haR_nbj7@google.com>
 <ZsJZ7fKJtNTbXhi7@google.com>
 <ZsR0HdzglEH19dVH@mail.gmail.com>
 <ZsUNUh7IGeduDUNX@mail.gmail.com>
 <ZsV6-NRkJLJhHxiq@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsV6-NRkJLJhHxiq@google.com>

On Tue, Aug 20, 2024 at 10:28:24PM -0700, Dmitry Torokhov wrote:
> On Wed, Aug 21, 2024 at 12:40:34AM +0300, Maxim Mikityanskiy wrote:
> > On Tue, 20 Aug 2024 at 13:46:53 +0300, Maxim Mikityanskiy wrote:
> > > On Sun, 18 Aug 2024 at 13:30:37 -0700, Dmitry Torokhov wrote:
> > > > 
> > > > Maybe something like below can work?
> > > 
> > > Great patch, thank you, I'll test it and report the results. See some
> > > minor comments below.
> > > 
> > > > 
> > > > 
> > > > platform/x86: ideapad-laptop: do not poke keyboard controller
> > > > 
> > > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > 
> > > > On Ideapad Z570 the driver tries to disable and reenable data coming
> > > > from the touchpad by poking directly into 8042 keyboard controller.
> > > > This may coincide with the controller resuming and leads to spews in
> > > > dmesg and potentially other instabilities.
> > > > 
> > > > Instead of using i8042_command() to control the touchpad state create a
> > > > input handler that serves as a filter and drop events coming from the
> > > > touchpad when it is supposed to be off.
> > > > 
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > ---
> > > >  drivers/platform/x86/ideapad-laptop.c |  171 ++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 168 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > > > index fcf13d88fd6e..2f40feefd5e3 100644
> > > > --- a/drivers/platform/x86/ideapad-laptop.c
> > > > +++ b/drivers/platform/x86/ideapad-laptop.c
> > > > @@ -17,7 +17,6 @@
> > > >  #include <linux/device.h>
> > > >  #include <linux/dmi.h>
> > > >  #include <linux/fb.h>
> > > > -#include <linux/i8042.h>
> > > >  #include <linux/init.h>
> > > >  #include <linux/input.h>
> > > >  #include <linux/input/sparse-keymap.h>
> > > > @@ -157,6 +156,13 @@ struct ideapad_private {
> > > >  		struct led_classdev led;
> > > >  		unsigned int last_brightness;
> > > >  	} fn_lock;
> > > > +	struct {
> > > > +		bool initialized;
> > > > +		bool active;
> > > > +		struct input_handler handler;
> > > > +		struct input_dev *tp_dev;
> > > > +		spinlock_t lock;
> > > > +	} tp_switch;
> > > >  };
> > > >  
> > > >  static bool no_bt_rfkill;
> > > > @@ -1236,6 +1242,158 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
> > > >  	}
> > > >  }
> > > >  
> > > > +struct ideapad_tpswitch_handle {
> > > > +	struct input_handle handle;
> > > > +	struct ideapad_private *priv;
> > > > +};
> > > > +
> > > > +#define to_tpswitch_handle(h) \
> > > > +	container_of(h, struct ideapad_tpswitch_handle, handle);
> > > > +
> > > > +static int ideapad_tpswitch_connect(struct input_handler *handler,
> > > > +				    struct input_dev *dev,
> > > > +				    const struct input_device_id *id)
> > > > +{
> > > > +	struct ideapad_private *priv =
> > > > +		container_of(handler, struct ideapad_private, tp_switch.handler);
> > > > +	struct ideapad_tpswitch_handle *h;
> > > > +	int error;
> > > > +
> > > > +	h = kzalloc(sizeof(*h), GFP_KERNEL);
> > > > +	if (!h)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	h->priv = priv;
> > > > +	h->handle.dev = dev;
> > > > +	h->handle.handler = handler;
> > > > +	h->handle.name = "ideapad-tpswitch";
> > > > +
> > > > +	error = input_register_handle(&h->handle);
> > > > +	if (error)
> > > > +		goto err_free_handle;
> > > > +
> > > > +	/*
> > > > +	 * FIXME: ideally we do not want to open the input device here
> > > > +	 * if there are no other users. We need a notion of "observer"
> > > > +	 * handlers in the input core.
> > > > +	 */
> > > > +	error = input_open_device(&h->handle);
> > > > +	if (error)
> > > > +		goto err_unregister_handle;
> > > > +
> > > > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > > > +		priv->tp_switch.tp_dev = dev;
> > > > +
> > > > +	return 0;
> > > > +
> > > > + err_unregister_handle:
> > > > +	input_unregister_handle(&h->handle);
> > > > +err_free_handle:
> > > > +	kfree(h);
> > > > +	return error;
> > > > +}
> > > > +
> > > > +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> > > > +{
> > > > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > > > +	struct ideapad_private *priv = h->priv;
> > > > +
> > > > +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> > > 
> > > Nice syntax, I didn't know about it before.
> > > 
> > > > +		priv->tp_switch.tp_dev = NULL;
> > > > +
> > > > +	input_close_device(handle);
> > > > +	input_unregister_handle(handle);
> > > > +	kfree(h);
> > > > +}
> > > > +
> > > > +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> > > > +				    unsigned int type, unsigned int code,
> > > > +				    int value)
> > > > +{
> > > > +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> > > > +	struct ideapad_private *priv = h->priv;
> > > > +
> > > > +	if (!priv->tp_switch.active)
> > > 
> > > This check seems inverted. ideapad_tpswitch_toggle assigns true when the
> > > touchpad is enabled.
> > 
> > I tested the patch on Z570 (with this check inverted), and it seems to
> > work great.
> > 
> > Also tested what happens on resume from suspend: the laptop reenables
> > the touchpad (the LED turns off on suspend and blinks briefly on
> > resume), and the driver handles it properly.
> 
> Great, thank you! Give me a couple of days and I think I will implement
> observer/passive handler support and we can figure out how to merge
> this...

OK, so if you could try the patch below that would be great.
Don't forget to set ".passive_observer = 1" in the ideapad handler.

Thanks!

-- 
Dmitry


Input: introduce notion of passive observers for input handlers

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c |    7 +++++++
 include/linux/input.h |    5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 54c57b267b25..60a9445d78d5 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -605,6 +605,9 @@ int input_open_device(struct input_handle *handle)
 
 	handle->open++;
 
+	if (handle->handler->passive_observer)
+		goto out;
+
 	if (dev->users++ || dev->inhibited) {
 		/*
 		 * Device is already opened and/or inhibited,
@@ -668,6 +671,9 @@ void input_close_device(struct input_handle *handle)
 
 	__input_release_device(handle);
 
+	if (handle->handler->passive_observer)
+		goto out;
+
 	if (!--dev->users && !dev->inhibited) {
 		if (dev->poller)
 			input_dev_poller_stop(dev->poller);
@@ -684,6 +690,7 @@ void input_close_device(struct input_handle *handle)
 		synchronize_rcu();
 	}
 
+out:
 	mutex_unlock(&dev->mutex);
 }
 EXPORT_SYMBOL(input_close_device);
diff --git a/include/linux/input.h b/include/linux/input.h
index 89a0be6ee0e2..6437c35f0796 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -286,6 +286,10 @@ struct input_handle;
  * @start: starts handler for given handle. This function is called by
  *	input core right after connect() method and also when a process
  *	that "grabbed" a device releases it
+ * @passive_observer: set to %true by drivers only interested in observing
+ *	data stream from devices if there are other users present. Such
+ *	drivers will not result in starting underlying hardware device
+ *	when input_open_device() is called for their handles
  * @legacy_minors: set to %true by drivers using legacy minor ranges
  * @minor: beginning of range of 32 legacy minors for devices this driver
  *	can provide
@@ -321,6 +325,7 @@ struct input_handler {
 	void (*disconnect)(struct input_handle *handle);
 	void (*start)(struct input_handle *handle);
 
+	bool passive_observer;
 	bool legacy_minors;
 	int minor;
 	const char *name;

