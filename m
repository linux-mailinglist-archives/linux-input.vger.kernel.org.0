Return-Path: <linux-input+bounces-5344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F7947E1C
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80EA1B23717
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 15:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACCD1547C5;
	Mon,  5 Aug 2024 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCwcw+IK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1351513C9B8;
	Mon,  5 Aug 2024 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871839; cv=none; b=YijvX3+QjCtxnuiQFkgwyd8p70tbMfxhF7WwQdwF8H2/IkXNEbl3yF1ZcGdXGGPjTsXROUpEsyq+RX7/XawaWcsiOZrXyC6+6EOmZuh+TcJyeDNPxoDXI7iHDo3W03jCJw2DQz+cZMzz58X2siJcvTwApFOcehAyLfbT914iS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871839; c=relaxed/simple;
	bh=i7fxX8wWQzc55GWGUp3ICgNH+24X3wEIrsLFeCNNUAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvRUBaDstBfJF39Tmgn2396nbOL71OucYwZZsAjnNTeLJmDZUFEQzMK+v67HDtHpc3bjgcKUnOJV6n4yZdjXlDesONxWOX2aBU0O3zTmFqDdjv9RgAq8435R7/uCdcfnCzyskoWOpc7NfBQXkXnBf4QTZIflLh3oYzsCaa++l+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCwcw+IK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a61386so3878205a12.2;
        Mon, 05 Aug 2024 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722871835; x=1723476635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3VD3yVrc5xoMlY2X1iDcr4Hux93qmlFbY/Sdk846ys=;
        b=mCwcw+IKJUKn8TsFWe3SNch0p9kBTnPSiUWsl2HOXbuS1adSB87kLG5EcZni0cphnz
         ODkSHl6Q5a3KXa6lQKVWA55LspTZUi4COnAbra2lRPlHjKKrayZXf7uOlO4WLDNLEQcG
         c8gbKEPrbdQnbjtjIe9k4hcO20VJvSytdZMi2nvPEeLNrnhIY3sTkC0KjSaYul7PL/sW
         Y9dkG7G0+M9l/Pp0EQAmt0OYTwxnk4u2ACF88QiAaHe2pDpaXoEJeQ8mYyIZ9L9O041U
         Fn6lg6fwxelXAuycxiOLZ2Sy1HGKMDjc9Z+bRrl4k3hzc1Uu4E6t7ov+1cw1spdlL2xH
         SDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722871835; x=1723476635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3VD3yVrc5xoMlY2X1iDcr4Hux93qmlFbY/Sdk846ys=;
        b=ct8wZ2MPqw2YfcOJUnHOuARzIrtEhoYDBh5YykBKz2yroVwKapw5Y12DEYeh9LgevE
         JOV1cV/IZfhcCfg0Z1KMjLQvBL95egyRalMhr0+Kug/CBBkRMC6tdQ/ijphdM89sPK3r
         +txCeU6cX9RG/264h0kkUZLFqTGvBslnk/xI95NSiuTsFriESZ16cyOj24o/O+6TRG3W
         vy6JRcUXtQ+UTyOjxdnHFwKnT0GTfLuKo6YbDQy4zEWyU5jo92VyGIPljbxIVAznZJxY
         GnM/Jh7+l1bD2GmufGXIqcouKU65me4dSoY4ay3FeGQh5NKqP2KD09WOwyvfpLNhoOBC
         /5wA==
X-Forwarded-Encrypted: i=1; AJvYcCVd6sTmAJXzXrLKv6ZdLaEW9PMYTJrxMq7yZ1rjpRFq3chOrRsFGIQaJfhCKEq3B71SSjnMAPCUDYrY5kpWqcJ6xIjK/B0wKFRkPmMLKzDPtCMx5FeqPhjrloyPNz9tT0BfmHsDR0vBBpbmQX0Pt1ow9kNCtkNZAAvImrVp+Fc9w9z/ebElCDRw
X-Gm-Message-State: AOJu0Ywz7fJOmS8txWuyUsafmNOpNT6n4VNYVuqfVXkmfyHnX59aQT+B
	xz2C0XNKU+zZTVDzvFTyZvJu3OUDWmqNzKVNn30YI8WwodrDyAdn
X-Google-Smtp-Source: AGHT+IEKtT/sI+Rkr17NWi+qHVHthq8kPHF+VIEu3to7CYe6www6aGZxqxUkCzYXWKIF8+pNpLZEig==
X-Received: by 2002:a17:907:7d94:b0:a77:cd51:3b32 with SMTP id a640c23a62f3a-a7dc51600b4mr853266966b.62.1722871834873;
        Mon, 05 Aug 2024 08:30:34 -0700 (PDT)
Received: from localhost (tor-exit-0071.fourwinds.cc. [94.16.116.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d42825sm466844966b.123.2024.08.05.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:30:34 -0700 (PDT)
Date: Mon, 5 Aug 2024 18:30:31 +0300
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZrDwF919M0YZTqde@mail.gmail.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805141608.170844-1-hdegoede@redhat.com>

On Mon, 05 Aug 2024 at 16:16:08 +0200, Hans de Goede wrote:
> Commit 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
> added an i8042_command(..., I8042_CMD_AUX_[EN|DIS]ABLE) call to
> the ideapad-laptop driver to suppress the touchpad events at the PS/2
> AUX controller level.
> 
> Commit c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux
> port on/off on select models") limited this to only do this by default
> on the IdeaPad Z570 to replace a growing list of models on which
> the i8042_command() call was disabled by quirks because it was causing
> issues.
> 
> A recent report shows that this is causing issues even on the Z570 for
> which it was originally added because it can happen on resume before
> the i8042 controller's own resume() method has run:
> 
> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
> [   50.247406] i8042: [49434] a8 -> i8042 (command)
> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
> ...
> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> ...
> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
> [   50.248407] i8042: [49435] aa -> i8042 (command)
> [   50.248601] i8042: [49435] 00 <- i8042 (return)
> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55

What exactly is the issue? Is it just a few errors in dmesg, or does
8042 stop responding completely?

I've seen something similar when I enabled the touchpad while moving the
cursor, but it was just a matter of a few lines in dmesg and a protocol
resync, both touchpad and keyboard worked after that.

> Dmitry (input subsys maintainer) pointed out that just sending
> KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON which the ideapad-laptop driver
> already does should be sufficient and that it then is up to userspace
> to filter out touchpad events after having received a KEY_TOUCHPAD_OFF.

I believe it's not the case (at least it wasn't back then). The whole
point of my patch in the first place was to make touchpad toggle work
properly on Z570.

Userspace (GNOME) supports two variants of hardware:

1. Laptops that disable touchpad themselves and send out
KEY_TOUCHPAD_ON/OFF to report the status. Upon receiving these keycodes,
GNOME just shows the status pop-up and relies on firmware to disable the
touchpad.

2. Laptops that just send KEY_TOUCHPAD_TOGGLE whenever the key is
pressed. GNOME maintains its own touchpad state and disables it in
software (as well as showing the pop-up).

That means, userspace is not filtering out events upon receiving
KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
is weird. It maintains the touchpad state in firmware to light up the
status LED, but the firmware doesn't do the actual touchpad disablement.

That is, if we use TOGGLE, the LED will get out of sync. If we use
ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.

> Given all the problems the i8042_command() call has been causing just
> removing it indeed seems best, so this removes it completely. Note that
> this only impacts the Ideapad Z570 since it was already disabled by
> default on all other models.

While I agree that i8042_command() is not a perfect solution, I don't
like the idea of breaking the touchpad toggle, even if "only one" laptop
model is affected. Can we suppress input events from the touchpad in
some other way, purely in software? I.e. don't call i8042_command(),
don't disrupt the PS/2 protocol, but instead let ideapad-laptop tell
psmouse to stop generating input events for a while?

> Fixes: c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on select models")
> Reported-by: Jonathan Denose <jdenose@chromium.org>
> Closes: https://lore.kernel.org/linux-input/20231102075243.1.Idb37ff8043a29f607beab6440c32b9ae52525825@changeid/
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 37 ---------------------------
>  1 file changed, 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1ace711f7442..255fb56ec9ee 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -18,7 +18,6 @@
>  #include <linux/device.h>
>  #include <linux/dmi.h>
>  #include <linux/fb.h>
> -#include <linux/i8042.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -144,7 +143,6 @@ struct ideapad_private {
>  		bool hw_rfkill_switch     : 1;
>  		bool kbd_bl               : 1;
>  		bool touchpad_ctrl_via_ec : 1;
> -		bool ctrl_ps2_aux_port    : 1;
>  		bool usb_charging         : 1;
>  	} features;
>  	struct {
> @@ -182,12 +180,6 @@ MODULE_PARM_DESC(set_fn_lock_led,
>  	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
>  	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
>  
> -static bool ctrl_ps2_aux_port;
> -module_param(ctrl_ps2_aux_port, bool, 0444);
> -MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
> -	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
> -
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
>  MODULE_PARM_DESC(touchpad_ctrl_via_ec,
> @@ -1560,7 +1552,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
>  {
>  	unsigned long value;
> -	unsigned char param;
>  	int ret;
>  
>  	/* Without reading from EC touchpad LED doesn't switch state */
> @@ -1568,15 +1559,6 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>  	if (ret)
>  		return;
>  
> -	/*
> -	 * Some IdeaPads don't really turn off touchpad - they only
> -	 * switch the LED state. We (de)activate KBC AUX port to turn
> -	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> -	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> -	 */
> -	if (priv->features.ctrl_ps2_aux_port)
> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> -
>  	/*
>  	 * On older models the EC controls the touchpad and toggles it on/off
>  	 * itself, in this case we report KEY_TOUCHPAD_ON/_OFF. Some models do
> @@ -1699,23 +1681,6 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>  	{}
>  };
>  
> -/*
> - * On some models the EC toggles the touchpad muted LED on touchpad toggle
> - * hotkey presses, but the EC does not actually disable the touchpad itself.
> - * On these models the driver needs to explicitly enable/disable the i8042
> - * (PS/2) aux port.
> - */
> -static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
> -	{
> -	/* Lenovo Ideapad Z570 */
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -		DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
> -		},
> -	},
> -	{}
> -};
> -
>  static void ideapad_check_features(struct ideapad_private *priv)
>  {
>  	acpi_handle handle = priv->adev->handle;
> @@ -1725,8 +1690,6 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
>  	priv->features.hw_rfkill_switch =
>  		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
> -	priv->features.ctrl_ps2_aux_port =
> -		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
>  	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
>  
>  	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
> -- 
> 2.45.2
> 

