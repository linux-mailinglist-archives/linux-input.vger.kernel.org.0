Return-Path: <linux-input+bounces-14102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DBCB2AD3F
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 17:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20028581F1C
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 15:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A2531813A;
	Mon, 18 Aug 2025 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OSBgBwZ9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043DE30E835
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531967; cv=none; b=L4gctl01KGX2JaUP9k5VzANKihGDR5sxjPhijsgN2hqzzqLITto4uunGkqImSqIWfZXfq1c9VoKIrX4tSHJkmL1N6oMPMqd8oe/s8K4sIy7msO9vjhs37zXCQEu2QwnjxYDD3TRRyVubW3JlyS+LK1o4mfT8i7Y7yZjHR/Gyi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531967; c=relaxed/simple;
	bh=FxHr6cWcJyl9Gy9CK27ObVGVSKhIH1BuiovYHEEKEpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo/whp3McQNc3sz3FSDo42+FcKxV98/K/vjztg83nJzy0A2as3W1/XQgnji37xcMhXlhRfbl5C06HG1kYh1tSxaYdVRWTWmeVeMsD6Fu8Pe1+5Y589PHbvPnUgdhbDXqnRxvGDQaCadHkiTnC6RuPT8dQ3oTfwarwoZeWZy51SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OSBgBwZ9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2eb49b83so2628484b3a.3
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755531964; x=1756136764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL4a5MAx53SYD7+WOx5HJxIWAtu+xXDJ6eJQwEroQJM=;
        b=OSBgBwZ9Gs1nVML9F9mvsdZ66OxDq52q6s3rcaFJiG9LXTNXQKSsdDWScx7USwqGog
         Wg2mIBrKvLtFOgY5cO6H6VD+4t3drOLBu9IdMu7yxCnFPcE4PkXQ2uqFKd1ujTaeuOMs
         o10HAcDVJIuaNpIN/ZYMVTAcf907worM0dfWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531964; x=1756136764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL4a5MAx53SYD7+WOx5HJxIWAtu+xXDJ6eJQwEroQJM=;
        b=oJuqRbUXJNxpKEc2uLHubiJrcZO8PfVQo7xN7vsf0xPN4ZdDLcr4EwWE5pQjLuNiLC
         WDgliVL/XjUxm4a0SCpheTjmO22a/2eGRUYYXWIy88F2MZHkpwJ1mzu35zCZ910aYo4Z
         QdYbwFtd5+jQBTjedssA1TvmvlYNlx9KAbq/2IRCR0zTbwKfjZMHtyQNl8VVzs80SCkd
         0DVRrPZliwMPjFySip9eAtJPt8kyo8m3TnQQny2FCfPJkp/NYdCS9mfX9leY4QKcVmMm
         HdN2CX42LdD6zwrert1tlgbmSshyCsCX0BcIKlAV7pY/9FuPeNyuP0EWJoYKZnvLoHIr
         b2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVRutlK0TRnZUfeXCnoZDjT5Tj7CrGJS1hmL+Iw2FMJXAVWooCwnqmPPA6Lp+pgpT0g1zzD3or8/J9kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk+WHZrQ3qPCLqonQvDkX6MUmnwKeW8An5is6+YOXGpU1fEX1k
	mmEjCfR3piMnoXf7mlGpYwBJ/GqZHqMURLlVnPevCrKcdB6ggFYtrTaU539YdDXNLRsT8oPxBVW
	DMBM=
X-Gm-Gg: ASbGncu/KlX2g2QOf705ZHJIB94B3XpnM3vN30hzodT1sNJbiEeDE1wduaC26N0Z/BT
	7cvl5x6mExYfhFj5KXZmPFGf349rph6p8JR/MYJTX04ToBPeiMB3LlkCvLXpFKkeRlDBfQjj+F9
	vLSZFeapD9KOxYCNwgNQJEFBsUtbFSI9rnqWy8SaSPCRl8fhbBDwocDVzaBUFdef+QMve03OQ51
	Hg5PPst0vaWyjGqrQPOpLWQVTp5wW82BOQvOnT8KxNc/GqFafPHJwNuQmEuqf07sjEIDqX4ewzL
	rciEssf31uTVJJX73+wTpHt7cvrEQhA4O+3IFFj+MGWC7bW9EJbs6fTBFA+Y2mOVmlROpQ9BAMl
	sNJAGTlmwUkXZr702q8YBh4eq0YtqBPx4fD+q+QAGyao8nAiI0bwgGd2+VqKOs4nkiw==
X-Google-Smtp-Source: AGHT+IFf2xE13UfCdfLrdnA05py1L9cW2Ak43DA1Agj5SxxOI3W0CGCTuZzY7H/qPSPDpbsHges3cA==
X-Received: by 2002:a05:6a00:2e84:b0:76b:ef69:1543 with SMTP id d2e1a72fcca58-76e51705490mr16888110b3a.8.1755531964051;
        Mon, 18 Aug 2025 08:46:04 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45566701sm7412181b3a.58.2025.08.18.08.46.02
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:46:02 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b471754c159so2868398a12.3
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 08:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSaPLCbho2ImhFbpfTtrOGyqEmaiOeOuP33+PUYnbRd1Pjdn6D70bJLn8zOy5CMvkvOENnkTWyZ13azA==@vger.kernel.org
X-Received: by 2002:a17:903:22cc:b0:234:8a4a:adad with SMTP id
 d9443c01a7336-24478f71be3mr130935345ad.26.1755531961668; Mon, 18 Aug 2025
 08:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
 <20250813125132.1319482-2-treapking@chromium.org> <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
 <CAEXTbpcTJVCqR-NAfddd2H9oLUitcUi3XnX1GQf7hA06-Vx9UQ@mail.gmail.com>
In-Reply-To: <CAEXTbpcTJVCqR-NAfddd2H9oLUitcUi3XnX1GQf7hA06-Vx9UQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 08:45:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UV8_XGmxC=7Z18PEnj6wKz+yZQuV_4h+LJh_MNCqszvg@mail.gmail.com>
X-Gm-Features: Ac12FXw4q2jsZWPukvpps6uXMC47W9riQkJS9EcpIvFu79iTZtix4Q66btupXkE
Message-ID: <CAD=FV=UV8_XGmxC=7Z18PEnj6wKz+yZQuV_4h+LJh_MNCqszvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 18, 2025 at 4:49=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Hi Doug,
>
> On Fri, Aug 15, 2025 at 8:27=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium=
.org> wrote:
> > >
> > > Introduce a new HID quirk to indicate that this device has to be enab=
led
> > > after the panel's backlight is enabled, and update the driver data fo=
r
> > > the elan devices to enable this quirk. This cannot be a I2C HID quirk
> > > because the kernel needs to acknowledge this before powering up the
> > > device and read the VID/PID. When this quirk is enabled, register
> > > .panel_enabled()/.panel_disabling() instead for the panel follower.
> > >
> > > Also rename the *panel_prepare* functions into *panel_follower* becau=
se
> > > they could be called in other situations now.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - Rename *panel_prepare* functions to *panel_follower*
> > > - Replace after_panel_enabled flag with enabled/disabling callbacks
> > >
> > >  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++---------=
--
> > >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
> > >  include/linux/hid.h                   |  2 ++
> > >  3 files changed, 40 insertions(+), 19 deletions(-)
> >
> > This seems reasonable to me.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Given that this affects devices that we already had support for
> > (you're changing the behavior of two touchscreens), should it have a
> > Fixes tag?
>
> I'll add Fixes tags in the next version.
> >
> > We'll also need to figure out a process for landing the two patches. I
> > can easily land the first one in drm-misc-next, but then it'll be a
> > while before the i2c-hid one can land. Is it OK to wait?
>
> I'm okay with waiting for the next release for i2c-hid patch to land.
> Or should will ask the HID maintainers to ack this patch?

I'll also respond on the v3, but probably the easiest is just:

* I won't wait for a response for the HID maintainers before landing
patch #1 into drm-misc.

* If HID maintainers don't want to Ack the patch for landing through
drm-misc, we'll just pause landing of patch #2 until things percolate
to mainline.

-Doug

