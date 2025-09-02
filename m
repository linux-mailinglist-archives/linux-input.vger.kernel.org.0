Return-Path: <linux-input+bounces-14438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF6B40ECA
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 22:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3515E0D8E
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D787925333F;
	Tue,  2 Sep 2025 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="JEglwZKz"
X-Original-To: linux-input@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B521B9F5;
	Tue,  2 Sep 2025 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846116; cv=pass; b=DZVkpgtj/r1Id+BYWwD0srSKtYm60FYg5mjsuPGLEBAmX1TPYq0J6jfIUc8sTV8pZbg1u1PcidUMT2AF5XP07NR8WCYUxvm2sXXSyKUryn/NqnmTV1JarKoeKrEuv7CAkt1NLrMYuE98zml+QKcTds7h1FHhx1MjjJ/TtJVtDRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846116; c=relaxed/simple;
	bh=+NVCKPp3zYqLBUbgr4Ge6ob+VEhpekn3ccN3sUZHe1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBiyjCZWwX0tQdcjJikuHp3PtFP/Qx2k6yWzRLeSUNuFS9xq8cE8K2sL/ewSe3QJojNGi87EmO+5mkNHIGEDJLLkRNCBNew+P+aYachqTKwPHJrF481cHYUv/N5lRyLtne6m07rKwsiexo9UcTQLZLdroSlO+pKRT5AlyER1n0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=JEglwZKz; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 936B71825E1;
	Tue,  2 Sep 2025 20:41:09 +0000 (UTC)
Received: from pdx1-sub0-mail-a243.dreamhost.com (trex-blue-7.trex.outbound.svc.cluster.local [100.102.63.102])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 20999183ACE;
	Tue,  2 Sep 2025 20:41:09 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1756845669; a=rsa-sha256;
	cv=none;
	b=qoDGw+oRFmUOm+zOb61DX+cDSjw2dTzSfvxYQDgBm1BZBlqF1c9nZvjpIjwa2US2kzxQ/6
	/Y+KK2trcj4lfVeWPzTlBDMHjacHesA2wGJb8N7YIFcFtmar5KuzvP6Bmosll7Fqjf5yg9
	Jt2R3ar0Z1ootn323rZANrx21wBMGJMCWluqaxZJJ8LLBWEqkA7PQlWfq9hnsnDnPKYyxt
	RSI3mFxqA5Hzt/SEwB941KyTFP5pBrTcYGGIqq42twIP1gMeHN1latrdn/291QBjdOoPz3
	/17n/PSKqwuP7+E3svtlmHlEpxf+1zJGELCOoR06ZRfVzz/vxN3Tb8JIl9ZRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1756845669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=E0okHnmYpT9qYGcZgXPF2BnijAb0JGl+8I0cxZqvVw8=;
	b=Aj2FvY6WsdQUhgVbVU8S0ABpdQty+CEPv1iI+wyU0j6hXNWEFwIGMG1klEsiK0L8dn3T7d
	JoZ0aKksrkqWc/oE5w4FOtp+5dHufCkTtJuDaxKLwx0dBLoNiA7fbjYd0J7BuLP9R0KMg0
	U85sQv0k1jyJXwOGfRBY+K56ag3qjR+qFfjj/WEoiWzba6mmL35Ijq7j6Pnv6xA7h/gEJl
	fnVthdj3JJ4MiEF31mgovnkxBcKsolO7uMUME2kllC10cKZSzgBVr6dYMHkbOWM9jYyitZ
	kCTwKxAuWeTQw49rVD/6VQuqVUU/sl6ddp+Ap5qg0Hem6OPIPyhb7ODG+lU2ZQ==
ARC-Authentication-Results: i=1;
	rspamd-7db949f9dd-dp9f8;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Bottle-Relation: 09d23e6168b0c68a_1756845669393_3604610517
X-MC-Loop-Signature: 1756845669393:2276742218
X-MC-Ingress-Time: 1756845669392
Received: from pdx1-sub0-mail-a243.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.63.102 (trex/7.1.3);
	Tue, 02 Sep 2025 20:41:09 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a243.dreamhost.com (Postfix) with ESMTPSA id 4cGd1c673jz99;
	Tue,  2 Sep 2025 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1756845668;
	bh=E0okHnmYpT9qYGcZgXPF2BnijAb0JGl+8I0cxZqvVw8=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=JEglwZKz4P2EsDqGpZOQv+ezcMHiQViQOiUL/dsLktoUyRY/OaOydtTTX6V80kFkw
	 6RatbbiyIg0xL4IoK2yG5Z+aeetamiVe2hy3Ro2ph1bv2hXWStQWhCL2uE7+tNlCwc
	 VzZfWAfXWqYijjSlOeoLne/NLLO+8W/3yOdez2vGdb/qiw0sDLw7ENm1Xj5n617GNB
	 2fe6UdYgs1aRePkVvRUDBhFBRxO/CKlLfGAPn0Z7lA3Wjne2R12WnpYxFFSjYmqpEM
	 vCzTqOL/m92aXc82OTQU3AsBbyn995/tL5MafbQ50ZWcayS6baQeYjG58TAvgX6VBX
	 7LgUQmaz3NyHw==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1utXoS-00000000TFG-0Uhk;
	Tue, 02 Sep 2025 13:41:08 -0700
Date: Tue, 2 Sep 2025 13:41:08 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aLdWZJwSrpvgXPFL@ewhac.org>
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>

	Didn't directly receive the intermediate reply:

On Tue, Sep 02, 2025 at 11:14:09AM +0200, Hans de Goede wrote:
> On 2-Sep-25 11:07 AM, Hans de Goede wrote:
> > Ah I see. Yes if you do need to do a CONFIG check then using IS_ENABLED()
> > is good.
> > 
> > But I'm afraid that the underlying problem here is the use of
> > cdev.brightness_hw_changed this is really only meant for led-class.c
> > internal use.
> > 
	Then there should be a comment in the include file to that effect.

> > The idea of cdev.brightness_hw_changed is that it stores the last
> > value set by the hw.
> > 
> > But in the mean time that value may have been overwritten by software.
> > 
> > I think that you will fail to call led_classdev_notify_brightness_hw_changed()
> > (you can add a debug print to check) if the following happens:
> > 
> > 1. Brightness set to 255 (RGB 255,255,255) through sysfs
> > 2. State toggled to off by backlight control button, brightness is now 0
> > 3. Brightness set to 255 (RGB 255,255,255) through sysfs
> > 4. State toggled to off by backlight control button, brightness is now 0
> > 
	This does not happen.  The G13 accepts and remembers backlight color
settings even when the LEDs have been toggled off locally.

```
#### Initial state: Backlight on, full green:
root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
255
255
0 255 0
root:/sys/class/leds/g13:rgb:kbd_backlight# echo 255 0 0 > multi_intensity 
#### Backlight is on, full red.
root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
255
255
255 0 0
#### Backlight toggle button pressed; backlight is now off.
root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
255
0
255 0 0
root:/sys/class/leds/g13:rgb:kbd_backlight# echo 0 0 255 > multi_intensity 
#### Backlight color set to full blue, but is still off.
root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
255
0
0 0 255
#### Backlight toggle button pressed; backlight is now on, and blue.
root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
255
255
0 0 255
```

	This also works if you alter `brightness` while the backlight is
toggled off.  IMHO, this is correct, principle-of-least-surprise behavior.

	Further (at least on my machine), `brightness_hw_changed` is
read-only in sysfs, and therefore can't be altered by host software.
Therefore, it would seem that using `cdev.brightness_hw_changed` as a cache
value is valid.  Otherwise, as you ouline below, we'd have to go through all
the workqueue gymnastics.

> > I also see that you use TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF
> > for the brightness value send to led_classdev_notify_brightness_hw_changed()
> > but I would expect the hw to restore the previous brightness on a toggle
> > from off -> on through the button? So then that should be send.
> > 
> > And you also never update cdev.brightness and use the cached 
> > struct lg_g15_led.brightness in lg_g13_kbd_led_get(). This means that
> > after a hw toggle of the backlight reading the brightness from sysfs
> > will show the wrong (old) value.
> > 
	This prompts the question:  What is the full intensity calculation
formula intended to be?  The docs appear to be rather quiet on this point.
If we assume all intensity/brightness values (0-255) are essentially mapped
to the range [0.0, 1.0], then it seems to me the calculation is:

	out = intensity * brightness * brightness_hw_changed

	i.e., turning either brightness value down to zero will turn the LED
"off" without affecting the other values, so when you turn it back on again,
you'll get back the color/other brightness you started with.  (Corollary:
For software to know the current output value, it must consider all three
input values.)

	I'm further assuming that brightness_hw_changed should have the same
range as brightness, as there is no separate `max_brightness_hw_changed`
sysfs value.

> > I think that instead what you need to do is create a
> > lg_g13_leds_changed_work() mirroring lg_g15_leds_changed_work()

	I dissent.  But then it's entirely possible I'm still missing
something...

	The only edge case I'm immediately aware of is:

	* Plug in G13.
	* Toggle backlight off.
	* Unload kernel module.
	* Reload kernel module.

	The backlight is now toggled off, but the newly loaded driver
doesn't know this.  Attempting to read `brightness_hw_changed` from sysfs at
this point will result in ENODATA (essentially reporting, "I don't know").
AFAIK, there is no way to probe the G13 for the current state of the
backlight HW toggle.  However, the moment the user generates any event on
the G13, the correct state will be obtained, and `brightness_hw_changed`
will be updated accordingly.  Not ideal, but seemed the most honest
approach.

> p.s.
> 
> Hmm, I wonder if this device is maybe more like the G510, where
> once the BL is turned off it simply ignores any updates send
> from the PC?  [ ... ]

	Nope.  As per my experiments above, the G13 accepts and remembers
backlight color updates even when the backlight is locally toggled off.

					Schwab

