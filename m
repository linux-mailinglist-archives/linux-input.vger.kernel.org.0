Return-Path: <linux-input+bounces-16261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A4C74A47
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27F2135BF0F
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6D62F693C;
	Thu, 20 Nov 2025 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="h6eOP+us"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C783314A1
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649826; cv=none; b=iz22k7gnSDIf9kPsWKVJW3FjfOmXcgVN10KLIEESc1IyvVbmOMr83u6nE4MjOk4nwQAfsnAc53uG6A4KGwZmHY4fNqHkCpF+NiDjTFQdpYIs+FPX3sTfo5MGg1OT/oA6FdYDt7mSZHPxvtbga+I5igmmVRf879wO6Exv3cWJq1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649826; c=relaxed/simple;
	bh=FUPJaikyvTNFMdDAh9pNbdy/D97pILhqpShUgWWPWQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M486qKs6weNz89tnRUUprYvzS0PbnlDxIsKK7F9Ed1Ai15BkjUqkTyzXKT5CL92oqIve/q4c4S3QWTPiJagvXiQvYL6i714qbVUmgwLrTISuFnG7tiwoQP8N9qfJ8/8iVbgjBEVyBt58JDj1NyTmSw1rlDgRXMQ0l0T2rpdJkt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=h6eOP+us; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 7B2AB5E658
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:43:43 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id C4A0D5E49E
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:43:42 +0200 (EET)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B7438200C91
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:43:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763649821;
	bh=uNXx3SZpCCx8TEuTVeaXqrcI+RiUfDY5+1Cbf9d71c0=;
	h=Received:From:Subject:To;
	b=h6eOP+us6Zh0QTKHBSGw4I+fGUBiu5NaHZEP/e4VS4ABOmBRvfi+Y50/bepTLjeWK
	 4bYhyTHzKhzpGAJpsnka3KEYXaWIWnoAchPxyMmPDRtTpHr6eOXyyC00YDsTNvhFhi
	 3DNLnvYf8q4l+Iirtq+ZMHcQIBoKyvYsWRWJ04HkEeyeqlW7Y9yi/Uc82U+INvgm0v
	 Y3CRfg7benlyxfaCEl5rXUvZBoq4Bu52MfLiJXyEFYSOhU+p2mvWaYzOapQzlyL3Ex
	 PV3rf3pCQOr1JayH1LPn+a5tikUJ3YWej3euKw3MfjVdI2S51Ww3v6U2hWAk45MS1I
	 CVEEAcKIZTfeQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so10211921fa.1
        for <linux-input@vger.kernel.org>;
 Thu, 20 Nov 2025 06:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJsuUvOrtt/gdufcp/oiZORwxWGGiwnY3sqXPm9ywu/5QT/NJY5D6FPqKoInv3MuNDcjfZNTqXYtU/5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGAwlU4MhYXEHqV6Lsqqi1BLOQqZeHqcQZSTTYNqN49xNTNSlN
	WZivZGy2O9iLCO6ZPyZ2RSP1N1V7QONQtoNA9Sg01Ml8gT8xMn0NSmfmzksoKxWBSErv6lTkNQ2
	edVEVcxLHIJROGwf6aXt/u7HkkKe4wbw=
X-Google-Smtp-Source: 
 AGHT+IH7O2zNRtI1BwkhDbiifNEMFiR+UhgZJK1bVk1+Pn+GW/vm2DfG0R/nqnKUYNfqF9r2p0XdAQa3Bfum9zq9b4g=
X-Received: by 2002:a2e:8749:0:b0:37b:971a:211f with SMTP id
 38308e7fff4ca-37cc67b2f0bmr8655471fa.44.1763649821145; Thu, 20 Nov 2025
 06:43:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-7-lkml@antheas.dev>
 <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
 <5e577dcf-995e-441b-9351-11d6da097fcc@gmail.com>
In-Reply-To: <5e577dcf-995e-441b-9351-11d6da097fcc@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 15:43:29 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHNK3VFxeo2wNfW02+gp2EkU6g=kSi1_5ZYRAdW_swd_g@mail.gmail.com>
X-Gm-Features: AWmQ_bkElZlX56dRRqtB0UKz9VbctOCWxKWfJGFMYPMw9N2y4vZc2yX4XTs4p4A
Message-ID: 
 <CAGwozwHNK3VFxeo2wNfW02+gp2EkU6g=kSi1_5ZYRAdW_swd_g@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] HID: asus: early return for ROG devices
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176364982193.2736056.4260032808726647170@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 15:29, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/20/25 15:15, Antheas Kapenekakis wrote:
> > On Thu, 20 Nov 2025 at 14:29, Denis Benato <benato.denis96@gmail.com> wrote:
> >>
> >> On 11/20/25 10:46, Antheas Kapenekakis wrote:
> >>> Some ROG devices have a new dynamic backlight interface for control by
> >>> Windows. This interface does not create an ->input device, causing the
> >>> kernel to print an error message and to eject it. In addition, ROG
> >>> devices have proper HID names in their descriptors so renaming them is
> >>> not necessary.
> >> Is this patchset supposed to work without the renaming, correct?
> >>
> >> If so consider dropping the drop of renames, taking required time
> >> to organize with Derek and resubmit when things are ready:
> >> there is no point for the rename to stall the rest and quit renaming
> >> is not urgent at all.
> > I feel like two months is enough of a timeframe for a simple rename
> > fix to go in.
> >
> > I do not want to have to reorder the checks just so the rename can
> > stay in _for now_. Skipping the ->input check is important for both
> > Xbox Ally/Z13 as it causes errors and the device to stay partially
> > uninitialized.
> >
> >>> Therefore, if a device is identified as ROG, early return from probe to
> >>> skip renaming and ->input checks.
> >>>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>  drivers/hid/hid-asus.c | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>> index 3047bc54bf2e..6193c9483bec 100644
> >>> --- a/drivers/hid/hid-asus.c
> >>> +++ b/drivers/hid/hid-asus.c
> >>> @@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>>           asus_kbd_register_leds(hdev))
> >>>               hid_warn(hdev, "Failed to initialize backlight.\n");
> >>>
> >>> +     /*
> >>> +      * For ROG keyboards, skip rename for consistency and ->input check as
> >>> +      * some devices do not have inputs.
> >>> +      */
> >>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> >>> +             return 0;
> >>> +
> >>>       /*
> >>>        * Check that input registration succeeded. Checking that
> >>>        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> >> Just for clarity is this supposed to fix this: https://gitlab.com/asus-linux/asusctl/-/issues/700 ?
> >> This model works once in windows users disable  that new feature.
> >>
> >> Note: that kernel the person submitting the bug is using contains your v8
> >> and asus-armoury.
> >>
> > No. This user has a laptop that has at least a WMI implementation of
> > RGB controls (this is why you can see rgb settings). Since you did not
> > ask for logs, it is not clear if it also has a HID implementation that
> > is skipped due to e.g., a missing product ID. Very likely it is a bug
> > on the WMI implementation that is out of scope for this series.
> I will ask for logs, but I recall someone with the same model sent dmesg already,
> I'll try to find it, but if this is true... Are we lending control of LEDs to a bugged WMI
> implementation for this laptop?
>

Yes, the asus-wmi driver is bugged in certain laptops. This does not
mean it should not be activated-the device has RGB. It means that it
should be fixed eventually.


