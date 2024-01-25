Return-Path: <linux-input+bounces-1463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894B83C152
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 12:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202F528A270
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926534123F;
	Thu, 25 Jan 2024 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix88OQlE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918A405F2;
	Thu, 25 Jan 2024 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706183554; cv=none; b=K3ucP8quDlOi9FyLB7GMnFRL/zHNXECidzzR6YV9AvMqZZMV0Vj/2HrcjYPBrn/mdxYcubgN3YmTbw4PrBIRiHCndRlma57s0gl1wgmTbdMRhgqc33CWSPpno/eHzNbAw8KK1JhPODiy7nDvWFVVMC4De9XbJA5RteUpuKlkZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706183554; c=relaxed/simple;
	bh=IotUz0FYez15B3UG5UxLwZizW04sxIeca+swI6TsY/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAecZ0gdGMsEpit6ub++mViNVt1Js0zHNzgRQFrYhEX6/jrkj8a5tTVOotVBXnQ4ZrU3RKxVTPLJ0e0q4wQRGdnrGLTdWy35rj1MPpalVr5zQyD3tIZYcp5YzKU/Ej86S+ABSEvyf/+m1WFAGMPcV2TM3YWAsFzHsvcgnjtHKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix88OQlE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a313b51cf1fso118931266b.0;
        Thu, 25 Jan 2024 03:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706183551; x=1706788351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtQi9lG55OkpFWgCG9yUXCV2zMZLKQIv/F6kAd79d1Q=;
        b=Ix88OQlEK91phWFOTNIy6uU41vN83t0ev4BrZWcIRv3/NVqtnf69dooIz739Wybh4s
         l/uPW8AkUAUhMQ8ANnp1QBn7XjG8mQD9Xd59Nfr1UsBbeY82Z8F/zAWt99U+msu5D2Y1
         e/KrW0DULetPbGyA03ANWN2HQ2KnrOxEda+j1Qr5zTIyIfoSeZrGY+eyS3vyTSzjhPp0
         sBmdVxY2njeqU03a+XtAVxIx0N3qhdAhxPk0sd/hOJ9QptqCqFvTbvTh3PXmtd0en2wN
         Ed+ib07q3a4Nnze73emI+vz9vI/gF8UnJR8fwxgBu/8r9mGsVg9VpB96BSwDxSacblzi
         P1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706183551; x=1706788351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtQi9lG55OkpFWgCG9yUXCV2zMZLKQIv/F6kAd79d1Q=;
        b=Qk0pMQgg94uiyDDGyvpbFxNL6H8C0cKZf0g5D8vGddobN5/TNa9onf1wlNjFBa1toY
         e+P8b21VxZ40l0l4YoqOQ1/Cc6hTOvDRRO3uLnnbLTVZCpOKprpU1O5yhr/Vis0xwN26
         UKwiL4K/GyKBef/Bh4sRR48ndN4nS63TnJ5A4Mu72RG7TKOKUkHszYNFbq9GP3KyyDj+
         leBD3tWdU7DTbQUSClKmLS/c5zHXaZxjX2bZM0Qynab2vKW2nTDvjejPLz+6d0L7jb27
         LLj3TD1FSfMO3J6lMWd19b3FacmSzUwaF6QWsyGPRAzFCy6WV82G2ZyL7bbhsIZk4huF
         2iFA==
X-Gm-Message-State: AOJu0YxsHEEeuWSok+xJDIP3AhiTUF2F/vFmeWHHu/yGIIaCs+QQBOA7
	VidN0SLfUJF8tJ0aOOOkvJ/uL8EWCyT4cCqn7KAZyPQPUApSKHNk5MwX5ZK1xQUZmeGfx7+Ka2m
	cJUJ/30q9uzepGg1UgOVfhC7+Yr1l1Jvpjuk=
X-Google-Smtp-Source: AGHT+IFNEevWXpnCrMnNK0q/9Y2OSZ4nLPGcg3TB0W7ZLtOsOUu6ctLWiY1cEGFtLj47rlNaJR7stzXwN14dCqDKcQQ=
X-Received: by 2002:a17:906:3001:b0:a31:5d3e:b659 with SMTP id
 1-20020a170906300100b00a315d3eb659mr1156483ejz.4.1706183550954; Thu, 25 Jan
 2024 03:52:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
 <20231213214803.9931-5-biju.das.jz@bp.renesas.com> <ZYD3cvHBHMZoACnQ@google.com>
In-Reply-To: <ZYD3cvHBHMZoACnQ@google.com>
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 25 Jan 2024 11:52:19 +0000
Message-ID: <CADT+UeAULCmWmbTi_c0QSnk_vrdU6vixnyPdF_AKH2c5qE-j4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Input: da9063 - Add polling support
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Support Opensource <support.opensource@diasemi.com>, linux-input@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for the feedback.

On Tue, Dec 19, 2023 at 1:52=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Dec 13, 2023 at 09:48:03PM +0000, Biju Das wrote:
> > +static void da9063_onkey_polled_poll(struct input_dev *input)
> > +{
> > +     struct da9063_onkey *onkey =3D input_get_drvdata(input);
> > +     const struct da906x_chip_config *config =3D onkey->config;
> > +     unsigned int val;
> > +     int error;
> > +
> > +     error =3D regmap_read(onkey->regmap, config->onkey_status, &val);
> > +     if (onkey->key_power && !error && (val & config->onkey_nonkey_mas=
k)) {
> > +             input_report_key(onkey->input, KEY_POWER, 1);
> > +             input_sync(onkey->input);
> > +             schedule_delayed_work(&onkey->work, 0);
>
> In the polling case you should not be scheduling any additional works as
> the driver may get confused if you repeatedly open and close input
> device.

OK.

>
> Also I think in threaded case it might be cleaner to avoid scheduling
> work and simply loop in the interrupt thread (since it can sleep).

Agreed. Will fix this in the next version.

Cheers,
Biju

