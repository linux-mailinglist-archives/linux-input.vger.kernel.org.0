Return-Path: <linux-input+bounces-13200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1614AEDABB
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 13:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8DF188F67D
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5375025BF14;
	Mon, 30 Jun 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGZkwMcN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5525A351;
	Mon, 30 Jun 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282502; cv=none; b=nm+Y7Kwx0NiOzZTsrp5b+Czs4XLyDBnQ0rUmT3eK2RIcam/o3ke6NRTVTijr34jXKhG+xqR6Kbg624Bwqp8T8SGPuQDlt82mI2FSvLbMmwV1NEHk6nW8oXcz4Ez8KdyI9PdcWQkasDcgHKIlG9v/ekonK2TqvsPrKCmy590f3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282502; c=relaxed/simple;
	bh=NCU514sWwUJE9Z2TWXQPbFT8ayuK6ddhyUCCZiIEVIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwHK/xzg2xE2mxHxMSan6psToYhfPt5HQC1azexvyUgqvm4SECLHKbS4/Pb0gnMk0MhF/Zkq7WiG4DkREe4aX/k1viOj1nIT3SJ8lU9oecaqC/2IzqPDq0R8WuBKrs+CLdlfhV259VPiSfjju0OeJEPi8Er6yXticS76BvvbSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGZkwMcN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747ef5996edso1706462b3a.0;
        Mon, 30 Jun 2025 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751282500; x=1751887300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8J3oU3FmkEwSjLfjiK/dSK0NR+xWVZZ4VhglxPAf/2M=;
        b=UGZkwMcN/QjmDb8ICxkGRFgdxlN7pP0OkzpP1rj4pZEpPF8EUNyR5ECxjVC3ZjQjxv
         bjvoIw81flqOCVH4frXqCg5fY3sK5WU93q2GH6iOsIb87uX3dOTEItDVF7C5/A0LA/qp
         Als6hR2WpcopZj50Tdw0ZBxG34DiRFVrNkkk66ch4Pu+W1rLccl/PZ4cw5wwUmBbcjBq
         QTAiQVXp0gOqo4Z26FGtwRmxWl6VpJyXeJu1pKZA0ngrACM4RAzIDdZbsFOpyHVRHzPE
         gY3WvZfN6LfOKy8bz/Lg7kPGf/snVDeWgVyuTS+s6pdoCGNhjFhYLv/AExLDFYriWGlm
         shgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282500; x=1751887300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J3oU3FmkEwSjLfjiK/dSK0NR+xWVZZ4VhglxPAf/2M=;
        b=HTGibGZNypLaIEgadfzw2TNU+AEulZzdxjhogbun3/jpNqKuf6DYvl62WwtFRknfI3
         8DQJf0aXi9gAHk2uJEZiZChOoEjALWyEfSsqzpJCbyX8OLDNbGZH4lwm4UOcByUmcAFT
         1/T0nDJft3gGk5VuLmCpMbQ7KBcy7nUvikyg89PhBAbLftzcC/R0YsYaZBZn5L3fwm6j
         8MdWKzeO+hOVr4H3Hcz8eu/Ouxh+KUMrmOijdb5ZOKEbJ1TuUeh5zppMCI2e5OxVWK/y
         8Nr5hhV+JkuSIlntl/j6Wxe2gRZGvIqVblV3/sFzbF6nwlEy3jqarl2bnn3l+n4kHYiZ
         YJLA==
X-Forwarded-Encrypted: i=1; AJvYcCU7LS8ZPu1FC5lCSQ3d3sj0b4Vr7ml1gH1t+B2mNqS7pKYaW1mZqtiVh4WYTgfFpTGO1upzvsMgOXGesA4ZCffAUOMQJg==@vger.kernel.org, AJvYcCUH5b+F+O4JaTID8BRQmB4vXmN4kJsodQkExXEYXUmW0hUVcqi+382Og06RP5tBommzK0+vubRPqY75/Q==@vger.kernel.org, AJvYcCXgkjbO7z3l8GaQlgGe6rNfh9IbUa8ZR5isHxEdtcwMPjiHq9oTE/ylVSRKZVYakcodTxPqkDmxp/qFWdLW@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQl1pQSBS8kuy2fWozWJgZqYm8spGrcDnI7Jmug1vi9V5iCwi
	9eu2lraw+lL/hayAt2unotLGSIDF9O6YZjxEnT3dK5qXbTeRI7d4N/V6g1YOwmsFWU2Hg9SXW+x
	5b8SRau4VerTH/REdU3cj1CKH98DzbW0=
X-Gm-Gg: ASbGnctve7hvSyaiq97K2/YmjZmOgpR4v/goxcVMq/TSprOLbZlVDOfqiTj3GkDD71E
	Nq9/tMn5bn4aGd+nTYsYe7/K9gXOkQ/Ek6Ve3tmnffyd0zXT+zYLsrjCfvyZn//6LjOh3wUDfkD
	e6ysJHBCUU7bgAZfbuQ/OKHAOK0G1ZdsDyMy+4df+EEf16ulT29tsO7RrDD5F6MdUgZzKEJaMLB
	m+uCg==
X-Google-Smtp-Source: AGHT+IGel8gwZk7cmvt1YCIp9yfYoFSQ3i1n6CaDsHWkLJCLxhmB2RQZN2NpmquyT2mQLHl4GyGcNrHfMFbUs2i4gpA=
X-Received: by 2002:a05:6a00:2d18:b0:748:68dd:ecc8 with SMTP id
 d2e1a72fcca58-74af6f7a3ebmr17244165b3a.22.1751282499827; Mon, 30 Jun 2025
 04:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620004209.28250-1-vishnuocv@gmail.com> <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
 <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com> <20250629205148.l2etpceayuzmhzph@pali>
In-Reply-To: <20250629205148.l2etpceayuzmhzph@pali>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 30 Jun 2025 20:21:02 +0900
X-Gm-Features: Ac12FXyJREBHZUE3BDLX_Wweq50jfNnmNP1LCY3mZVSbuEU7aKBjMJPbMugfydg
Message-ID: <CABxCQKucaDFHb+faMz6w6GOWNrbA_nDb4zhA8xrWmq=Qj8ZpgA@mail.gmail.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap handling
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, hansg@kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, jay_lee@pixart.com, 
	zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Vishnu Sankar <vsankar@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

On Mon, Jun 30, 2025 at 5:51=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Monday 30 June 2025 05:42:45 Mark Pearson wrote:
> > Hi Dmitry,
> >
> > On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> > > Hi Vishnu,
> > >
> > > On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> > >> Newer ThinkPads have a doubletap feature that needs to be turned
> > >> ON/OFF via the trackpoint registers.
> > >> Systems released from 2023 have doubletap disabled by default and
> > >> need the feature enabling to be useful.
> > >>
> > >> This patch introduces support for exposing and controlling the
> > >> trackpoint doubletap feature via a sysfs attribute.
> > >> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> > >> This can be toggled by an "enable" or a "disable".
> > >>
> > >> With this implemented we can remove the masking of events, and rely =
on
> > >> HW control instead, when the feature is disabled.
> > >>
> > >> Note - Early Thinkpads (pre 2015) used the same register for hysteri=
s
> > >> control, Check the FW IDs to make sure these are not affected.
> > >>
> > >> trackpoint.h is moved to linux/input/.
> > >
> > > No, please keep everything private to trackpoint.c and do not involve
> > > thinkpad_acpi driver. By doing so you are introducing unwanted
> > > dependencies (for both module loading, driver initialization, and
> > > operation) and unsafe use of non-owned pointers/dangling pointers, et=
c.
> > >
> >
> > Do you have recommendations on how to handle this case then?
> >
> > This is a Thinkpad specific feature and hence the logic for involving t=
hinkpad_acpi. There are Thinkpad hotkeys that will enable/disable the track=
point doubletap feature - so there is some linkage. I'm not sure how to avo=
id that.
> >
> > Is there a cleaner way to do this that you'd recommend we look at using=
? It's a feature (albeit a minor one) on the laptops that we'd like to make=
 available to Linux users.
> >
> > Mark
>
> Hello, I do not know what is doubletap and patch description does not
> explain it. But for laptop / mouse interface, I'm just giving example
> that dell-laptop.c for some particular laptop can enable/disable
> touchpad led and uses PS/2 interface for it. See touchpad_led_init().
> I do not know if it is ideal or preferred solution, just writing to let
> you know, maybe it can be useful.

FYR, please find the previous commits regarding Doubletap support for
Trackpoint below:

https://github.com/torvalds/linux/commit/a9b0b1ee59a79d0d3853cba9a4b7376ea1=
5be21f
https://github.com/torvalds/linux/commit/fd1e3344d13f1eedb862804dd1d2d5e184=
cf8eae

Sorry if details are missing in the commit. I can add those.

To be more precise, Thinkpad_acpi handles hotkeys, including Fn+G for doubl=
etap.
To make that work, we need an integration point.

Thinkpad_acpi.c
Fn + G Hotkey - Enable/Disable the Trackpoint Double Tap.
DoubleTap on Trackpoint - Generates a DoubleTap ACPI Event

trackpoint.c
Enable/Disable the Doubletap functionality

To enable (this is decided based on Fn + G toggle key) the Trackpoint
Doubletap, we need to write to the Trackpoint extended register.
Therefore, the event to enable or disable the double tap will be
handled inside Thinkpad_acpi, but the actual write to the register is
in trackpoint.c.

I will check dell-laptop.c to understand the LED handling.

--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

