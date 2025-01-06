Return-Path: <linux-input+bounces-8919-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2CA01D39
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168A83A2952
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B432386340;
	Mon,  6 Jan 2025 02:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJzpmBUH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5286335;
	Mon,  6 Jan 2025 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736129297; cv=none; b=VQGFT3LAodQb38M6lc44yWcInwjSXTmh6rt1E8n5e2TGpkVftrsjh7psQFoEG0XX4KkP6UsaFheIVVE2m73r9yM838YOaiZ6GfSP5eTGtpH/TI+pcKZrR2VICpkKHgBpfApc1XdXs7d/Rx0YJlXb86/EYLO3oUvhgatAsuvzpSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736129297; c=relaxed/simple;
	bh=39UgLp4kIMXBEKlJjFF9vlbr4qkWc7iI4V6hk0c5svQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CH0wPFptDPXLNnaflyTFgt1q7HzHZJKqj3C6lCl4CrbXGUii6olojWxi5kQ1doDPY8qnb448uzplwph2dy2uC9cjvYftkvM3E/YuCJ7Ger990C+NXu2a+GncCvFy00VZ7zVaxOadTxE9sn30/Sul7dc3OUj1IMnuQvEfDdjjYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJzpmBUH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so138414775e9.1;
        Sun, 05 Jan 2025 18:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736129294; x=1736734094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GhJTTVx9RhxyQy1N1NCqF9AXzhuQJ8duYbTZxvItgvo=;
        b=EJzpmBUHyuv53oBVVTP1axNYxMACGAg73EPfCS6iAlXbviYIUAceeirsU90RTxHa//
         C00tHJ+Ns56pQflvNaXmmzoPgvelT6tqoWlH1IONorVuIhHctNZG8jLrbZxml708aNzK
         H24TcxP/NRZfa4boXLi8Fr4r6OXXpmQxi4XZpHmPobCMjhyzdeEPDysjS++KdMeTsmHY
         Nf1T88QuvQ3QEpKgIJ2R2ahp8hNwlvwCMmQhiciq4qGUyUgb49rEBXSPNgy6vz4RT0ZT
         fkU1g7KoTTig7gyCyySIWaJ23VAuHdP31w+UCGhdjgV3hHfFkZKXSPLDt6xoLixJ6OPc
         dJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736129294; x=1736734094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhJTTVx9RhxyQy1N1NCqF9AXzhuQJ8duYbTZxvItgvo=;
        b=NN0axpcC6S8UzwPzdXCUi3kPFbEcqmCqVACTmPoFdyPU9kjAMmrjb3yQPmdcG2xMJA
         sx2kt3GWP0ZDckIhuJ58aKmiiLv4dhXfXtnRMec3nvvPZdMzoS+g/g3QyRR62j4bf4bO
         +NwINUxKjtAyp0C9G0FWls9xYO4uXWtOh5JRkUxxPfIsUemA7kx3oZZH1qSVlwEhq56h
         77rT2EuO73I8fn2IIbbPE9YUGxc9wN9Bb08qorGcekvqj8KBjNOlTAR38zB0Kz2Wzowg
         Ynyq/AnpkIoc53+8Mj9E7eLQYNWSghgCuqyyfEb90t0OInwnCpaiqfVVrhsBztIHjKJH
         h/1g==
X-Forwarded-Encrypted: i=1; AJvYcCVqT+TAw1BEQg8tBb+X5Oml52xcSig5aa9omeVqSiDHqBhoc/QoTjYF7S6Z5+ExtRCug02xcKcXK0xQ62Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEwkpWXE3CM5UnLBn9EvICKuqwYyOV0+jRONQCG+v7imKjYys
	gPo4KurM5gU6L3L1YOzVdrQ3fDibFdTdUITvFTcU3Psx7Trg3IaBcBajEKNVEVEwXXMhMPYbwn1
	nAO1Dy7vThs+QAaNqwQCsaLpj9qWGbw==
X-Gm-Gg: ASbGncvPS+hlTlZUGrX+BxUTIHzbTjkeMT7ydh1Dw0Xne2pVshkTaZQLliShZTT8EO7
	v+ph44BGwVamn5sKQVEZNlJvfnPXcnMayJKegtg==
X-Google-Smtp-Source: AGHT+IFQ/pWo4gKEJUL4W6O+RzoPtipFA1AaGTzm5ZFnlsDmGA7it2huKnP+n0nYpGI+UcqoCOROdikmxZUGHCtAiuI=
X-Received: by 2002:a05:600c:4f09:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-43668645d57mr497813315e9.16.1736129294048; Sun, 05 Jan 2025
 18:08:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241020195717.CD7CC17525E@bout3.ijzerbout.nl>
 <CALTg27kQOjBkX+W4L+EntReUkRSiPKKB4jhoB05f1LGvTNgyFg@mail.gmail.com> <CALTg27=tjOq38cHfRAW8QN+dN3QxGMkZRj+3amwDfzFwJf42uQ@mail.gmail.com>
In-Reply-To: <CALTg27=tjOq38cHfRAW8QN+dN3QxGMkZRj+3amwDfzFwJf42uQ@mail.gmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Mon, 6 Jan 2025 02:08:03 +0000
Message-ID: <CALTg27nJTXHKL8=V-7nuT00r8svVr4k760yMy2ghVLsyMs+FRA@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Add missing initializer
To: Jiri Kosina <jikos@kernel.org>
Cc: Linux Input <linux-input@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Kees Bakker <kees@ijzerbout.nl>
Content-Type: text/plain; charset="UTF-8"

Hi, just bumping this since it's been a few months, will it be picked
up for 6.13?

Thanks,
Stuart

On Sun, 3 Nov 2024 at 02:32, Stuart <stuart.a.hayhurst@gmail.com> wrote:
>
> Checked the script, CCed missing people
>
> Stuart
>
> On Thu, 24 Oct 2024 at 02:51, Stuart <stuart.a.hayhurst@gmail.com> wrote:
> >
> > Good catch, thanks
> >
> > Are you aware of 'scripts/get_maintainer.pl'? It might tell you to CC
> > Jiri Kosina and Benjamin Tissoires, as they can actually apply this.
> >
> > Stuart
> >
> > On Sun, 20 Oct 2024 at 20:57, Kees Bakker <kees@ijzerbout.nl> wrote:
> > >
> > > This was detected by Coverity, CID 1600743
> > >
> > > Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> > > ---
> > >  drivers/hid/hid-corsair-void.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
> > > index 6ece56b850fc..d1fd04264656 100644
> > > --- a/drivers/hid/hid-corsair-void.c
> > > +++ b/drivers/hid/hid-corsair-void.c
> > > @@ -553,7 +553,7 @@ static void corsair_void_battery_remove_work_handler(struct work_struct *work)
> > >  static void corsair_void_battery_add_work_handler(struct work_struct *work)
> > >  {
> > >         struct corsair_void_drvdata *drvdata;
> > > -       struct power_supply_config psy_cfg;
> > > +       struct power_supply_config psy_cfg = {};
> > >         struct power_supply *new_supply;
> > >
> > >         drvdata = container_of(work, struct corsair_void_drvdata,
> > > --
> > > 2.47.0
> > >

