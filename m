Return-Path: <linux-input+bounces-11005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBAA6A160
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 09:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B5E882FFA
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 08:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472B920AF6C;
	Thu, 20 Mar 2025 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="OJs07coR"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC01487E9;
	Thu, 20 Mar 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459423; cv=none; b=rLyaI5H0DLRiff431x/M7+wNad0oKVNOmHjXhHcu3qBnQeA1LZQnpo+3O1ht4jR6P8f2uDkJCb5+nSIwdjA4K0Wl7fxs0do+eoKLN+mOwUHv28YMr26oQ/rH3Os6wijwOKUhqrwC6Ia8Ib8zh7ojrqDr1EHsIiHkQEXAXurYrNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459423; c=relaxed/simple;
	bh=lM8uEMqGloIIhxK8we3YSOHTRitLpbY76DwJKVqm0E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+kxfVzV2pn5vg91Ek8xAFRILwqpAIydaqEDkIUMEkxgHOS0aVJJVJPr2cbJqGUEpX9FphhIR3CXvrJ4T5Pxf4xKlrkfcgyWtiicTrSc83OpVEp+B087edQLwoVlVrk1hWTqu0XlNX+Dhd/tO3S9PPOvJwW6tX5GGWMzKGvHvTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=OJs07coR; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 9F4992E08704;
	Thu, 20 Mar 2025 10:30:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742459419;
	bh=ziUOA57vt7GRj6E5P8yVSLpiyhos2lGfmA35dWw4RKQ=;
	h=Received:From:Subject:To;
	b=OJs07coRP0qkVVQWNT+V/uyICgTESo9ryX6o8hzD48IwSJBTfwTKXyhJbRe6PgUL6
	 OzJRZJ16TbAdMISN0p7vzZ9of+t16BvrzgqzFlGpD6CVgiroqya/h4kAPML9bKyJjV
	 isDIGLDHCeX7xKZ9sq1v796pTLUGHUrtDE70cvj8=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-307c13298eeso6138621fa.0;
        Thu, 20 Mar 2025 01:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVMPS17GIVeRw8VdBAfbjzRwT8te04H0sjaC7051Q4Zbp4BjJr5SAH/0J9ZDMj1mnBwDgxy2t1BwI/lrw==@vger.kernel.org,
 AJvYcCXTpMetBctO0T4jCGdEO4NCaef1QQBtzsR7Vou38mgWCPUnjrxweRhPq1I4FLgJteX69yVO/tDnmyLcHuDC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4EjdUbK+aQbt68CZNzqTlkbzzp12D5L/Llpvo1eUTgE0fNtUa
	3mm3ylRsxeKq1Adiz20fdDmlDMEq2ng1feOkFjSp20qAmMZnzEztgP3o0t5SHimuIdRxPdXNABt
	Op5Bn9076KRXUkVdst1wXe7E25to=
X-Google-Smtp-Source: 
 AGHT+IG09r4aPlZS9FtR6xYfWQ819/Rg9PKjIpTRksh0LUYjkf/MLyEpy6CnX91Ix7+RKHE2FaX+3aOiS9tE6pQnZFc=
X-Received: by 2002:a05:651c:547:b0:308:ee65:7f44 with SMTP id
 38308e7fff4ca-30d72789e95mr8912211fa.8.1742459417875; Thu, 20 Mar 2025
 01:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-7-lkml@antheas.dev>
 <51c78ba6-9518-4259-85da-d761b031df7f@ljones.dev>
In-Reply-To: <51c78ba6-9518-4259-85da-d761b031df7f@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Mar 2025 09:30:06 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGsB4UjsHa=CWT2zzbpHx5yPEOtTA9RmVqR1jqMB4_C6Q@mail.gmail.com>
X-Gm-Features: AQ5f1JouLn7odMmdLAzBP_cRIF3KVlpUpTATrLGK3AEzwIsAOS-pTxSfQUzL9PY
Message-ID: 
 <CAGwozwGsB4UjsHa=CWT2zzbpHx5yPEOtTA9RmVqR1jqMB4_C6Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] HID: asus: introduce small delay on Asus Z13 RGB
 init
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174245941904.26145.17944018537723476768@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Mar 2025 at 08:12, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 20/03/25 08:13, Antheas Kapenekakis wrote:
> > The folio keyboard of the Z13 can get stuck in its BIOS mode, where the
> > touchpad behaves like a mouse and the keyboard start button is not
> > reliable if we perform the initialization too quickly. This mostly
> > happens during boot, and can be verified to be caused by hid-asus
> > through simple blacklisting. A small delay fixes it.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/hid/hid-asus.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 85ae75478b796..5b75ee83ae290 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -571,6 +571,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >       unsigned char kbd_func;
> >       int ret;
> >
> > +     /* Wait a bit before init to prevent locking the keyboard */
> > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ROG Flow Z13"))
> > +             msleep(500);
> > +
> >       ret = asus_kbd_init(hdev);
> >       if (ret < 0)
> >               return ret;
>
> See my comment on patch 1 about trying a loop with the init
> request/response as a hopeful way to test readiness.
>
> Cheers,
> Luke.

Turns out there isn't an init problem. I have removed this patch from V2.

It was hid-asus taking control of the touchpad from hid-multitouch. So
adding HID_GROUP_GENERIC fixes this. I replaced it with that and
squashed the rename patch alongside it.

Antheas

