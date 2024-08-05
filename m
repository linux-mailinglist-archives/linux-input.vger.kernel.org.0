Return-Path: <linux-input+bounces-5348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE70947FCF
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 19:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0941C281DAA
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBE515B995;
	Mon,  5 Aug 2024 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4p14pIo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A66E48CCC;
	Mon,  5 Aug 2024 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877247; cv=none; b=cuCvSgLfmWRcngm7faf5duDdixEqti4xtfQyB6KkVOtRfNfcNv4NaeoX1uZF1sY/jVd5to0E0UXstPmuZAGIXMa0X2iL54lzrq86l/TPczL20gx+2jxvNGcGAlALExmml06y+iZ0Hn95pRs792rT04/FDsvXmZpY7N0nbeGV55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877247; c=relaxed/simple;
	bh=wUfv32by8pmeG1BNUr8rMlZOd5hLhi8tiloKJEWhH/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqx9R3qmaa+RrFh9gEwlwLgyJ9Vsaag7Udg7DTfHhWZtbc+Vej2SiC1t8PcYxuSdGRYH9PRrtMv6K6UuxDHIjF2zauLiSHCP1b4HKMhzqgYGAJDj+4SzEspqGALGZokMF1sp21l5KS3nj0AG6PFt14x8xM+nr/CGlO18rRfVx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4p14pIo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc692abba4so78538575ad.2;
        Mon, 05 Aug 2024 10:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722877245; x=1723482045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2d0S0RkdCZXxRtKsvgb708mDm6QP2XBNXnJ5hNcHsxY=;
        b=B4p14pIoJFEprmEWBfJx8XzXnlmhUJwZpAyC6FPLy8Dc16W9KwGpAnmyKk2JWE4MOR
         c4ce9JTQrU2NFiwgHPdkoQiivnuini4EYGBP0frDQcpgw2ZCw0H9+MBbvdhvpkW7bwBN
         ea2QUxZJnUR2byPkoHMmbP2wabJ4tsu2HbXpnQ9aPH5pcVnYv/nSjhCFTptmAraWAeyF
         YQzUUdIbjl5t6WkjddoipoUPq/i+H3VlR0vwyOWkPIMPBp6ZpBuJXtn/8Zz3MR0ZkPoX
         IrtBi9Fi/1BB2Gasf1l3SPVrajJ/k2xGnx9OodHTWwWrW0HdJowDCqtp10CLc86sBFFo
         0aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722877245; x=1723482045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d0S0RkdCZXxRtKsvgb708mDm6QP2XBNXnJ5hNcHsxY=;
        b=L4WL0JRho1faHvk4aYTN13UwIHD1mrqxGFX5stqF0lamzse2L9F5SXNO73iKi2a2nf
         N02mhxJblC3Iu0wL9fMUewvdY/jpiNjufyvghickZwZaTs20t4yZEA220E8/7/Ta6XCw
         W+BqB/9KZP8IIlKCW71/qH8WPooTVGWlWYrtJYJzYnsF9ciWQYo7pQ0/4a4qAyVyqdhJ
         KTe0E9qvDmdI5CW9et8kycNKiejFWFamqjkog9C9iVwCwAZDbvHMzx8q2j+wbRgYqmSK
         6walf0AHAlZ0hUIo0UR8lQe98GL+exxYEI7swrU16p4hi8uINDdebwgYUykfWoDVPCGC
         eFHg==
X-Forwarded-Encrypted: i=1; AJvYcCV8n9jsXuHNtYDFRMvmuYTiwY29VkccWoUygtZf1j6nuhhubjI3GUH14nSfaOfw1UFlMO5T7M/gZKMHd9/mjss8b2aO6vM/XKvqrLRNKl5bO2MaULXhws5J8on124UDGUBhttWYBRb/xr8LDI/SuFAE7NdZ0gY2TkkmvF2SAH0904piG9Q6KGNW
X-Gm-Message-State: AOJu0Ywzem1em5k2cgU51/0P00mO4lxaXxqwYwMuYPfsWRHJbq5LSfvn
	qDGPd/Yb+S/VitC8qoZ4gzo4RmTfzz8e2E53aC3vaU4+GnYeRDLi
X-Google-Smtp-Source: AGHT+IHUC4fkX6EB3EulyK7hPDW8f5FADSmG+6DNClGIcN3Ov6fAAmFGJaL7mlz+JV8R7Z+atedZcA==
X-Received: by 2002:a17:902:c947:b0:1fd:8c25:415c with SMTP id d9443c01a7336-1ff572b4bc7mr122080485ad.24.1722877244627;
        Mon, 05 Aug 2024 10:00:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b116:76da:13a7:247b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19af1sm70684715ad.47.2024.08.05.10.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:00:44 -0700 (PDT)
Date: Mon, 5 Aug 2024 10:00:41 -0700
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
Message-ID: <ZrEFOepmMYoWfyHY@google.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>

On Mon, Aug 05, 2024 at 05:45:19PM +0200, Hans de Goede wrote:
> Hi Maxim,
> 
> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> > On Mon, 05 Aug 2024 at 16:16:08 +0200, Hans de Goede wrote:
> >> Commit 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
> >> added an i8042_command(..., I8042_CMD_AUX_[EN|DIS]ABLE) call to
> >> the ideapad-laptop driver to suppress the touchpad events at the PS/2
> >> AUX controller level.
> >>
> >> Commit c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux
> >> port on/off on select models") limited this to only do this by default
> >> on the IdeaPad Z570 to replace a growing list of models on which
> >> the i8042_command() call was disabled by quirks because it was causing
> >> issues.
> >>
> >> A recent report shows that this is causing issues even on the Z570 for
> >> which it was originally added because it can happen on resume before
> >> the i8042 controller's own resume() method has run:
> >>
> >> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
> >> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
> >> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
> >> [   50.247406] i8042: [49434] a8 -> i8042 (command)
> >> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
> >> ...
> >> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> >> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> >> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> >> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> >> ...
> >> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
> >> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
> >> [   50.248407] i8042: [49435] aa -> i8042 (command)
> >> [   50.248601] i8042: [49435] 00 <- i8042 (return)
> >> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
> > 
> > What exactly is the issue? Is it just a few errors in dmesg, or does
> > 8042 stop responding completely?
> 
> When this issue happens at resume the touchpad stops sending events
> completely because the i8042 driver's resume() method fails and exits
> early.

We actually retry up to 5 times so we usually get the right response
from the controller. Additionally on x86 we do not abort
initialization/resume even if controller selftest still fails after all
the retries.

> 
> > 
> > I've seen something similar when I enabled the touchpad while moving the
> > cursor, but it was just a matter of a few lines in dmesg and a protocol
> > resync, both touchpad and keyboard worked after that.
> 
> Right, the problem is that in this case the i8042's resume() method
> is failing, which I believe causes the Elan ps/2 driver to not get
> re-attached to the aux port on resume.

There's a69ce592cbe0 ("Input: elantech - fix touchpad state on resume
for Lenovo N24") that sends disable/enable pair as part of Elan touchpad
resume handling which unwedges the touchpad.

> 
> 
> > 
> >> Dmitry (input subsys maintainer) pointed out that just sending
> >> KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON which the ideapad-laptop driver
> >> already does should be sufficient and that it then is up to userspace
> >> to filter out touchpad events after having received a KEY_TOUCHPAD_OFF.
> > 
> > I believe it's not the case (at least it wasn't back then). The whole
> > point of my patch in the first place was to make touchpad toggle work
> > properly on Z570.
> > 
> > Userspace (GNOME) supports two variants of hardware:
> > 
> > 1. Laptops that disable touchpad themselves and send out
> > KEY_TOUCHPAD_ON/OFF to report the status. Upon receiving these keycodes,
> > GNOME just shows the status pop-up and relies on firmware to disable the
> > touchpad.
> > 
> > 2. Laptops that just send KEY_TOUCHPAD_TOGGLE whenever the key is
> > pressed. GNOME maintains its own touchpad state and disables it in
> > software (as well as showing the pop-up).
> 
> You're right I had forgotten about this. There is really no reason
> why GNOME cannot also suppress events after a TOUCHPAD_OFF event,
> but atm it indeed does not do this. We could fix this by patching:
> plugins/media-keys/gsd-media-keys-manager.c of gnome-settings-daemon
> to also update the TOUCHPAD_ENABLED_KEY setting when receiving
> KEY_TOUCHPAD_ON/OFF. Something which I think we should do to,
> but that will not help solve this bug since we cannot rely
> on users having a fixed g-s-d.
> 
> So: self-NACK for this patch. (which is a bummer because I really
> liked being able to just remove this)
> 
> > That means, userspace is not filtering out events upon receiving
> > KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> > KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> > is weird. It maintains the touchpad state in firmware to light up the
> > status LED, but the firmware doesn't do the actual touchpad disablement.
> > 
> > That is, if we use TOGGLE, the LED will get out of sync. If we use
> > ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.

Still, poking the touchpad directly at a random time is not something
that we should be doing. The command may come in the middle of touchpad
initialization or in the middle of resuming, or at another inopportune
moment - as you mentioned yourself toggling while using the touchpad
results in a spew in dmesg.

We have "inhibit/uninhibit" sysfs controls that allow suppressing input
events form a device, they should be used instead.

> 
> Ack.
> 
> So how about this instead:
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1ace711f7442..b7fa06f793cb 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>  	 */
> -	if (priv->features.ctrl_ps2_aux_port)
> +	if (send_events && priv->features.ctrl_ps2_aux_port)
>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>  
>  	/*
> 
> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> 
> Jonathan, as the reporter of the original suspend/resume issue, can you check if
> a kernel with this patch + ideapad-laptop re-enabled no longer has the suspend/resume
> issue you were seeing ?
> 
> Regards,
> 
> Hans
> 

Thanks.

-- 
Dmitry

