Return-Path: <linux-input+bounces-7380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D799BCE1
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 02:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4335B20FA5
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 00:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E73139B;
	Mon, 14 Oct 2024 00:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4hTK+jD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D94A1C;
	Mon, 14 Oct 2024 00:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728865018; cv=none; b=jUJDf3exBfktKdYwdr8MpufGIWwqRcJJxvc8V2wmJ81Pr4AuB0T2/xKhi2cGhpVLml1JjnWwuCZFK/xQTp0ANXflK9kucTaQyjVASNeUdYeG1eQ9EfSKVd+To9KGNBRStHksQYLPlUAwRzPHlozMFq2qcTgk2k6pEveeeIWwxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728865018; c=relaxed/simple;
	bh=H8LxFpLQGQlVeBckQzM3hRiLd9BKZU8Ty5mnHd1LooY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoK4KvYii0XtkvInLXLoNDZG24veXD54SL6XH1OJQgIb1ikDAu2udwe2qvJ9v9pOyDTkMO2h0ZVYjryb6jXvzwomqpZe0lu/5MytnJY6S4PlEMVkcs6T2Z8UBPBIx5/2QZSeYcBUEt6WxPEzAYyWBB/TxeyMdwipwkzCvOL3yeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4hTK+jD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so3163853f8f.2;
        Sun, 13 Oct 2024 17:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728865015; x=1729469815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji81C34IVdT9C8xuuIvF1XCFX9JFwMotyJlYw7dOsL0=;
        b=U4hTK+jDlqSQq7q2n1yrsa6rNX2ZA9+nisss+pjKT7WmespnizUPH44GezCPt1hjy3
         lWSK78hKxW+nARjC1zrJ+9QllYfi8ejx85orPfoovQwruj1DskhCgPJ/3B+Ep7EH41kl
         WV1hIk8oE3Fo+JqaMCCfbYkZNp6cdsblCb6iNct7Kv9hyIWajYC71IbZJBMR5GBXyq95
         q8Pq8bacpkFF2vAiaRAf3tqk4YdP7kmmfMq4qcettSpWvMUiQFwrT93pyYazYegHyaZf
         MLrcXIp1DUvDBynW4ADVEfyKJQ6DTdpklZACggXnsYsNf+BMDLog090LBE0fTt/yE85p
         HV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728865015; x=1729469815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ji81C34IVdT9C8xuuIvF1XCFX9JFwMotyJlYw7dOsL0=;
        b=GMxO9Nv27Q7ggGB59y2zTehcfeBwFihinlXHfoqmOnWnNW4wy/K9ZF5yU9+ikD8KfU
         k8xtYe9nhvtxRMkOP7ijqRXRUUkgLpchw5KSe2HauuZNeZxNXtWSNQ6y5GfI3I56omKH
         76w6KL5FfWCGO3Ifnb+VZjz2m0uFwtyntDF6qabqMglCnb4Qm1iqhPEJzolcY+2wEPFl
         mChXaxtoI88HB6onj2oLrJeQSDufT9Zz7EptPLZW5VYm6ZHZT67A2RChUJelaSTa3pdO
         wjQEgrS8aPDHytENxxB5JUkwmmx71u5Y3Z3dmfRnVEBlGjjkNwOXihCdSdro4aGxRrHR
         Rx1A==
X-Forwarded-Encrypted: i=1; AJvYcCWY1csCKIyLNu4FyMmqHYQ/TJy2CXRV+oSVBfUCJFRCJhZC2p3v+0MSYRsAngLaEDiDuOxvrGPAwgyb2g==@vger.kernel.org, AJvYcCXdJgEvyOnKLzSUXKyGRSi3M/8gKonyHJJVree600V++okylJGfZwU2+mYUlU1P/UmsghiynqXhEa3QdcpZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Ppf65ZEDszP4nCS2ybAQHFTGbVenghhvEhCM1CI83CuDpb8d
	rIKMxKWdt2J8uDxSKlouN5OTPtG9/oW+cueemXkLqye9asdJ3kbkENuClZQKIVg/mwq1RRXpAYS
	V3GdQijvKfQlpKJ+vWedizgB9W07Jj90=
X-Google-Smtp-Source: AGHT+IE94o4RcEzV+yHpUgBK0EBhLOjDSLOep2wdDVS0V8FUM9VsdXWy7fZDuHMO20nJ685e0qJBID78AoE60xIsHu4=
X-Received: by 2002:a05:6000:1c1:b0:37c:cfa4:d998 with SMTP id
 ffacd0b85a97d-37d601db8d0mr5668700f8f.49.1728865014504; Sun, 13 Oct 2024
 17:16:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925100303.9112-1-alex.vinarskis@gmail.com>
 <20240925100303.9112-2-alex.vinarskis@gmail.com> <2xb4vqlt2gdrmioyx7tjaw2vfw55pmhvz54q7f2ldrkikzzxge@737bp5ms6gwc>
In-Reply-To: <2xb4vqlt2gdrmioyx7tjaw2vfw55pmhvz54q7f2ldrkikzzxge@737bp5ms6gwc>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 14 Oct 2024 02:16:43 +0200
Message-ID: <CAMcHhXoKdXODc+4Bs-o2WXvxXiWpJHLBupnoqLyTa9m5KrNWbA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] HID: i2c-hid: introduce re-power-on quirk
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 13:54, Benjamin Tissoires <bentiss@kernel.org> wrote:
>
> On Sep 25 2024, Aleksandrs Vinarskis wrote:
> > It appears some keyboards from vendor 'QTEC' will not work properly until
> > suspend & resume.
> >
> > Empirically narrowed down to solution of re-sending power on command
> > _after_ initialization was completed before the end of initial probing.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >  drivers/hid/i2c-hid/i2c-hid-core.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > index 632eaf9e11a6..087ca2474176 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -50,6 +50,7 @@
> >  #define I2C_HID_QUIRK_BAD_INPUT_SIZE         BIT(3)
> >  #define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET  BIT(4)
> >  #define I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND    BIT(5)
> > +#define I2C_HID_QUIRK_RE_POWER_ON            BIT(6)
> >
> >  /* Command opcodes */
> >  #define I2C_HID_OPCODE_RESET                 0x01
> > @@ -1048,7 +1049,11 @@ static int i2c_hid_core_register_hid(struct i2c_hid *ihid)
> >               return ret;
> >       }
> >
> > -     return 0;
> > +     /* At least some QTEC devices need this after initialization */
> > +     if (ihid->quirks & I2C_HID_QUIRK_RE_POWER_ON)
> > +             ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
>
> I'd rather not have this in i2c-hid-core.c, TBH.
>
> We do have a nice split separation of i2c-hid which allows to add vendor
> specific i2c-hid-of drivers. We currently have 2 (goodix and elan) and a
> third wouldn't be much of an issue.

Hi,

Thanks for the input.
I did some further digging, as I did not understand how to implement
your suggestion right away, and in addition I think I am a bit short
on data about this keyboard to create a dedicated driver. I am still
not 100% sure how to proceed, so would like to share my findings
first, perhaps you would have something else to add.

Firstly, I am not quite sure what/who is the 'QTEC' manufacturer. I
could not find it online by VID. In DSDT tables it's listed as
'QTEC0001', which sounds very generic. Only existing reference to QTEC
that I could find in the kernel was in this [1] patch, where it
appears to be a combo Elan touchpad+keyboard device, at least based on
VID, though it was listed in ACPI as 'QTEC0001' as well. This is not
the case with this device, as VID is a new, never seen before value.
Which in turn means we could not use ACPI ID matching in case of a
dedicated driver.

For reference, XPS 9345 has also a somewhat combo solution - the
keyboard has a separate touchbar-like Functions keys row. I opened up
the device to inspect it - keyboard's IC is marked as ECE117, which
appears to be a Microchip keyboard IC [2]. Touchbar is routed to the
motherboard via a different connector, which may be routed back to the
same IC via the keyboard's connector (based on the amount of wires in
the keyboard-motherboard connector being way more than just
sda/scl/gnd/3v3/5v), but I cannot be sure without in-detail electrical
tests. This puzzles me a bit, as in addition, IC's datasheet refers to
being connected to 'host EC' rather than just host - perhaps then
otherwise, the onboard EC (present on this laptop, but no drivers
available for linux at present) is acting like a bridge that is
presented as this 'combo' device. Either way, neither of this explains
what is actually from QTEC, and rather points it to be an embedded
firmware from Dell, if I interpret my findings correctly, but please
correct me if you think otherwise.

Finally, during the BIOS update, one of the stages mentioned 'updating
ELAN touchbar firmware' (not keyboard). Which confirms suspicion that
the 'combo' device may be created by onboard EC, since any press of
keyboard's usual or Function keys sends data from the same 'QTEC'
keyboard as if it was one device, and it certainly does not identify
as ELAN.

>
> I'm not really happy of this admittely simple solution in this patch
> because:
> - what if QTEC "fixes" that behavior in the future?

That is a very valid point indeed. Especially with PID being rather
useless, and ACPI ID apparently being shared with other devices, this
may become an issue, as only VID stays unique - at least for now.
However, I did not fully understand how making a dedicated driver is
advantageous over a quirk, if we are limited by VID matching either
way? Or did you mean to only have that keyboard selectable by dt via
compatible?

> - what if you actually need to enable/disable regulators like goodix and
>   elan do

At least at the moment it seems there is no need for that.

>
> So to me, a better solution would be to create a i2c-hid-of-qtec.c,
> assign a new compatible for this keyboard, and try to fix up the initial
> powerup in .power_up in that particular driver. This way, we can extend

If I managed to narrow down the issue correctly, fixing the
'.power_up' stage won't resolve the particular issue unfortunately. As
per my original patch, re-running power on command has to be done
_after_ device registration (which in turn is after power up phase).
If I would be to move re-power up any earlier, eg, between power up
and `i2c_hid_init_irq`, it would have no effect again, the keyboard
won't work until suspend & resume. In other words it appears that the
process of registering hid what 'breaks' the controller, and power-up
command has to be resent only after it. This is also how I discovered
the solution in the first place - suspending the laptop and resuming
it magically 'fixed' the keyboard. Given that due to lack of
schematics no regulators are defined in device tree at the moment, I
deduced that it was software init that broke the keyboard, and
pm_resume 'fixed' it, which then allowed me to narrow it down to the
proposed patch. But again, please correct me if you think I
interpreted it wrong.

I thus tried to implement this quirk similarly to existing
`I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET`, which is used for ELAN
touchscreens and is present in this core file, and not in
i2c-hid-of-elan.c. I do agree that making a dedicated i2c-hid-of-
driver is cleaner, though I am not sure I understood full advantage of
it in this context, and not sure it will actually solve a particular
issue as its not the problem with power up itself. On the other hand,
perhaps as you mentioned enabling/disabling regulators first would in
turn fix this weird behaviour? Though sadly I have no way to test it,
since only got a  using a dummy regulator for this keyboard...

Would like to hear your thoughts,
Thanks in advance,
Alex

[1] https://patchwork.kernel.org/project/linux-input/patch/20190415161108.16419-1-jeffrey.l.hugo@gmail.com/#22595417
[2] https://ww1.microchip.com/downloads/en/DeviceDoc/00001860D.pdf

> the driver for the regulators, and we can also fix this issue while being
> sure we do not touch at anything else.
>
> Anyway, glad to see the bringup of the new arm based XPS-13 taking
> shape!
>
> Cheers,
> Benjamin
>
>
> > +
> > +     return ret;
> >  }
> >
> >  static int i2c_hid_core_probe_panel_follower(struct i2c_hid *ihid)
> > --
> > 2.43.0
> >

