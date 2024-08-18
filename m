Return-Path: <linux-input+bounces-5629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC19955EEF
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 22:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C0A1F21331
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 20:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3C914B96C;
	Sun, 18 Aug 2024 20:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSULKj1b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CB200CD;
	Sun, 18 Aug 2024 20:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013043; cv=none; b=TNRU8D3LqFB5g7gbv9cxZ/UrGjRvHA5y55sho3fcLndF8ZIfjHHc7mms6ve0JfrcSlRh4p7mHnyXgOW0bY6LQw+s/xNG3i3VjtCTP2+dUvOx65o4h7NvJr35ULdUBYysPa2wCU4HEZ7pgBafamsmyEQFJdyqpLtkKndsaOgz6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013043; c=relaxed/simple;
	bh=eCjX5pNzKVMG306k+J86UVhaCeznzNhkrLyY02DKV0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTP/VSdgJLA5r+LipndAGLx1PmWChH5d4KRAnY8mJz1VMgfkQi06d/xv4MSInignYneYJUym4RQww+vjYipqqTTxOJtFurT7yxyfTUebpeY8alm5vIDIke5GtBXObb6quRKu8zK2UtwpbTh+/aP5UwZGMODpAKrV3b6mL7u2mks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSULKj1b; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-202089e57d8so13578705ad.0;
        Sun, 18 Aug 2024 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724013041; x=1724617841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkxfC7vKUIi3VV8lBRaHYV6gRlWOhn41WVeuz5Kyb90=;
        b=iSULKj1bd1dcjLem9yXg4v6qi3YElu89N9mqNhUq+jFasf6Z/L+A6lRreKiGCYyilv
         h3yRlkF1360pf3wq4d6zWXbZABLCRgvN12F3qiCBnhbD3vSy/+eeXsCcXxJpAGZQWaGy
         9hstrrpcxjylJ0FaaWN+uH0owHarwTL2Ehbkwb8jLKEQfcXxF2J39lU0GJv0YGAcdiIp
         AK/PFiXs3WNBqdbeJVlI69NtmTc33gH1vhoDNl4XjhzC/FFrSgT3sP7LerJCiC7QlgUc
         a1rWmcMfVYw1vhOOU6uSkUuY/dnsgCWlxaXSLiaHOTGurNcjTMfG+XQhkmyh7vw3CEBT
         ioGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724013041; x=1724617841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkxfC7vKUIi3VV8lBRaHYV6gRlWOhn41WVeuz5Kyb90=;
        b=rp8ndqJpKSIPR3NSJiLg6EyFNmEMldoB8aryPva1I06t0hqRmPugtdDHv0K110eJGR
         R/JUicUjKxbQ9Q1/OqFH5l3t+OHto3fFO2fFuB0WPJ3Ib3x7RnPD16XCFNPx0NmUnFTJ
         1gvrj3RjVp5h5eme8eOQviW056GZPVUx7LVXXv+P6w4MnvCFjqKamxl9W8b41doMZ6KF
         NUmMjZ1yrJFtQIcwL3vdR81k8+KYB3ifET3a8KVbWfUtv9/mBz8iirRuZ6t9KNO5kprA
         FGc1WQ+/5fm3vy3Az9AQHGt812WLw0ZL3vpNIYe1SRpRICuq5sfCuA5x7W9pwnI6NqHj
         YokQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPv3Ux9F70wYl7ffUI6sTu61+z3mpP52dkitSBete/XeXxb2OY7bFNgoYDx7dtFVb8MDNOk+aQnmXZzbjHcxVdWoo5YBeszaK9Gi2AnxZQd2YpxlggDZb8sQS47adJiIphwVlIFYXt8WAj+fjWMbeYZPFy1bSFqC+/q++c7fqtx5d/HVJUuINN
X-Gm-Message-State: AOJu0YztAzxDKAeKcsC+YaZQ4wIok0pJOcdab0F7P8Vs9XRzoMzxpT67
	oQ0xhbytlensQOl+KaiN5X9HCcg5uV12tvnyemLi8zaNR6ZWKUeA
X-Google-Smtp-Source: AGHT+IEDn17d71Rc49yCeHVb8Cnk7sCzmpIHEPJdfLmAe32OrInBv66RFYzKGXF3qeMIQzf/K04mhQ==
X-Received: by 2002:a17:903:1c7:b0:202:15b8:3018 with SMTP id d9443c01a7336-20215b831ffmr94304605ad.3.1724013040790;
        Sun, 18 Aug 2024 13:30:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6364e81sm5572118a12.83.2024.08.18.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 13:30:40 -0700 (PDT)
Date: Sun, 18 Aug 2024 13:30:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>,
	Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZsJZ7fKJtNTbXhi7@google.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
 <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
 <Zrph94r8haR_nbj7@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrph94r8haR_nbj7@google.com>

On Mon, Aug 12, 2024 at 12:26:47PM -0700, Dmitry Torokhov wrote:
> On Mon, Aug 12, 2024 at 08:18:24PM +0200, Hans de Goede wrote:
> > Hi Dmitry,
> > 
> > On 8/12/24 7:24 PM, Dmitry Torokhov wrote:
> > > On Mon, Aug 12, 2024 at 04:41:50PM +0200, Hans de Goede wrote:
> > >> Hi Maxim,
> > >>
> > >> On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
> > >>> On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
> > >>>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> > >>>>> That means, userspace is not filtering out events upon receiving
> > >>>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> > >>>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> > >>>>> is weird. It maintains the touchpad state in firmware to light up the
> > >>>>> status LED, but the firmware doesn't do the actual touchpad disablement.
> > >>>>>
> > >>>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
> > >>>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
> > >>>>
> > >>>> Ack.
> > >>>>
> > >>>> So how about this instead:
> > >>>>
> > >>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > >>>> index 1ace711f7442..b7fa06f793cb 100644
> > >>>> --- a/drivers/platform/x86/ideapad-laptop.c
> > >>>> +++ b/drivers/platform/x86/ideapad-laptop.c
> > >>>> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
> > >>>>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> > >>>>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> > >>>>  	 */
> > >>>> -	if (priv->features.ctrl_ps2_aux_port)
> > >>>> +	if (send_events && priv->features.ctrl_ps2_aux_port)
> > >>>>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> > >>>>  
> > >>>>  	/*
> > >>>>
> > >>>> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
> > >>>> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> > >>>
> > >>> *Maxim
> > >>
> > >> Oops, sorry.
> > >>
> > >>> Just a heads-up, my Z570 now belongs to a family member, we'll test what
> > >>> you asked, but right now there is a btrfs corruption on that laptop that
> > >>> we need to fix first, it interferes with kernel compilation =/
> > >>
> > >> Note as discussed in another part of the thread the original bug report
> > >> actually was not on a Z570, so the whole usage of i8042_command() on
> > >> suspend/resume was a bit of a red herring. And the suspend/resume issue
> > >> has been fixed in another way in the mean time.
> > >>
> > >> So there really is no need to test this change anymore. At the moment
> > >> there are no planned changes to ideapad-laptop related to this.
> > > 
> > > I think we still need to stop ideapad-laptop poking into 8042,
> > > especially ahead of time.
> > 
> > I agree. I think your suggestion of using the new(ish) [un]inhibit
> > support in the input subsystem for this instead of poking at the i8042
> > is a good idea.
> > 
> > As I mentioned when you first suggested this, I guess this requires 2 things:
> > 
> > 1. Some helper to find the struct input_dev for the input_dev related
> >    to the ps/2 aux port
> > 2. In kernel API / functions to do inhibit/uninhibit
> >    (maybe these already exist?)
> > 
> > > If we do not want to wait for userspace to
> > > handle this properly, I wonder if we could not create an
> > > input_handler that would attach to the touchpad device and filter out
> > > all events coming from the touchpad if touchpad is supposed to be off.
> > 
> > I think using the inhibit stuff would be better no?
> 
> The issue with inhibit/uninhibit is that they are only exposed to
> userpsace via sysfs. And as you mentioned we need to locate the input
> device corresponding to the touchpad.
> 
> With input handler we are essentially getting both - psmouse does not do
> anything special in inhibit so it is just the input core dropping
> events, the same as with the filter handler, and we can use hanlder's
> match table to limit it to the touchpad and input core will find the
> device for us.
> 
> > 
> > The biggest problems with trying to fix this are:
> > 
> > 1. Finding time to work on this
> > 2. Finding someone willing to test the patches
> > 
> > Finding the time is going to be an issue for me since the i8042_command()
> > calls are only still done on a single model laptop (using a DMI quirk)
> > inside ideapad-laptop now, so this is pretty low priority IMHO. Which
> > in practice means that I will simply never get around to this, sorry...
> 
> Yeah, I can see that ;) Maybe I will find a couple of hours to waste...

Maybe something like below can work?


platform/x86: ideapad-laptop: do not poke keyboard controller

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Ideapad Z570 the driver tries to disable and reenable data coming
from the touchpad by poking directly into 8042 keyboard controller.
This may coincide with the controller resuming and leads to spews in
dmesg and potentially other instabilities.

Instead of using i8042_command() to control the touchpad state create a
input handler that serves as a filter and drop events coming from the
touchpad when it is supposed to be off.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c |  171 ++++++++++++++++++++++++++++++++-
 1 file changed, 168 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index fcf13d88fd6e..2f40feefd5e3 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -17,7 +17,6 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/fb.h>
-#include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -157,6 +156,13 @@ struct ideapad_private {
 		struct led_classdev led;
 		unsigned int last_brightness;
 	} fn_lock;
+	struct {
+		bool initialized;
+		bool active;
+		struct input_handler handler;
+		struct input_dev *tp_dev;
+		spinlock_t lock;
+	} tp_switch;
 };
 
 static bool no_bt_rfkill;
@@ -1236,6 +1242,158 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
 	}
 }
 
+struct ideapad_tpswitch_handle {
+	struct input_handle handle;
+	struct ideapad_private *priv;
+};
+
+#define to_tpswitch_handle(h) \
+	container_of(h, struct ideapad_tpswitch_handle, handle);
+
+static int ideapad_tpswitch_connect(struct input_handler *handler,
+				    struct input_dev *dev,
+				    const struct input_device_id *id)
+{
+	struct ideapad_private *priv =
+		container_of(handler, struct ideapad_private, tp_switch.handler);
+	struct ideapad_tpswitch_handle *h;
+	int error;
+
+	h = kzalloc(sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return -ENOMEM;
+
+	h->priv = priv;
+	h->handle.dev = dev;
+	h->handle.handler = handler;
+	h->handle.name = "ideapad-tpswitch";
+
+	error = input_register_handle(&h->handle);
+	if (error)
+		goto err_free_handle;
+
+	/*
+	 * FIXME: ideally we do not want to open the input device here
+	 * if there are no other users. We need a notion of "observer"
+	 * handlers in the input core.
+	 */
+	error = input_open_device(&h->handle);
+	if (error)
+		goto err_unregister_handle;
+
+	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
+		priv->tp_switch.tp_dev = dev;
+
+	return 0;
+
+ err_unregister_handle:
+	input_unregister_handle(&h->handle);
+err_free_handle:
+	kfree(h);
+	return error;
+}
+
+static void ideapad_tpswitch_disconnect(struct input_handle *handle)
+{
+	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
+	struct ideapad_private *priv = h->priv;
+
+	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
+		priv->tp_switch.tp_dev = NULL;
+
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(h);
+}
+
+static bool ideapad_tpswitch_filter(struct input_handle *handle,
+				    unsigned int type, unsigned int code,
+				    int value)
+{
+	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
+	struct ideapad_private *priv = h->priv;
+
+	if (!priv->tp_switch.active)
+		return false;
+
+	/* Allow passing button release events, drop everything else */
+	return !(type == EV_KEY && value == 0) &&
+	       !(type == EV_SYN && code == SYN_REPORT);
+
+}
+
+static const struct input_device_id ideapad_tpswitch_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+				INPUT_DEVICE_ID_MATCH_KEYBIT |
+				INPUT_DEVICE_ID_MATCH_ABSBIT,
+		.bustype = BUS_I8042,
+		.vendor = 0x0002,
+		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
+		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
+				BIT_MASK(BTN_TOOL_FINGER) },
+		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
+				BIT_MASK(ABS_PRESSURE) |
+				BIT_MASK(ABS_TOOL_WIDTH) },
+	},
+	{ }
+};
+
+static int ideapad_tpswitch_init(struct ideapad_private *priv)
+{
+	int error;
+
+	if (!priv->features.ctrl_ps2_aux_port)
+		return 0;
+
+	spin_lock_init(&priv->tp_switch.lock);
+
+	priv->tp_switch.handler.name = "ideapad-tpswitch";
+	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
+	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
+	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
+	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
+
+	error = input_register_handler(&priv->tp_switch.handler);
+	if (error) {
+		dev_err(&priv->platform_device->dev,
+			"failed to register touchpad switch handler: %d",
+			error);
+		return error;
+	}
+
+	priv->tp_switch.initialized = true;
+	return 0;
+}
+
+static void ideapad_tpswitch_exit(struct ideapad_private *priv)
+{
+	if (priv->tp_switch.initialized) {
+		input_unregister_handler(&priv->tp_switch.handler);
+		priv->tp_switch.initialized = false;
+	}
+}
+
+static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool on)
+{
+	guard(spinlock_irq)(&priv->tp_switch.lock);
+
+	priv->tp_switch.active = on;
+	if (on) {
+		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
+		if (tp_dev) {
+			input_report_key(tp_dev, BTN_TOUCH, 0);
+			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
+			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
+			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
+			input_report_key(tp_dev, BTN_LEFT, 0);
+			input_report_key(tp_dev, BTN_RIGHT, 0);
+			input_report_key(tp_dev, BTN_MIDDLE, 0);
+			input_sync(tp_dev);
+		}
+	}
+}
+
 /*
  * backlight
  */
@@ -1567,7 +1725,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
-	unsigned char param;
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
@@ -1582,7 +1739,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
 	 */
 	if (priv->features.ctrl_ps2_aux_port)
-		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
+		ideapad_tpswitch_toggle(priv, value);
 
 	/*
 	 * On older models the EC controls the touchpad and toggles it on/off
@@ -1927,6 +2084,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		goto input_failed;
 
+	err = ideapad_tpswitch_init(priv);
+	if (err)
+		goto tpswitch_failed;
+
 	err = ideapad_kbd_bl_init(priv);
 	if (err) {
 		if (err != -ENODEV)
@@ -2001,6 +2162,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
+
+tpswitch_failed:
 	ideapad_input_exit(priv);
 
 input_failed:
@@ -2029,6 +2193,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
 	ideapad_input_exit(priv);
 	ideapad_debugfs_exit(priv);
 	ideapad_sysfs_exit(priv);

