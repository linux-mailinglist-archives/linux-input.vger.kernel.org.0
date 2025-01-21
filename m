Return-Path: <linux-input+bounces-9417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A13A17EB6
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 14:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13CD018830FE
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 13:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBC91F2367;
	Tue, 21 Jan 2025 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BH3pmOlA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620C1E502;
	Tue, 21 Jan 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737465505; cv=none; b=p3kHZsw84Qt02g2iupWGXGpxUgdmtWIArP3VkqEwXllSAl30c8Em/Iq5nIVX6Dep8iJzYbHkWCmdqVZfHwozSmdw9OFYxvQ/LK+c4GkmJxNl1tYMuBFzsccA9YttyGC5kW9EutU93FydWY4o5qEjJ8JCCNJqs+BFBZ7TZgq3Aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737465505; c=relaxed/simple;
	bh=wasEGo/ru9owGNIy/X4YD3wZ9KExKy8oYScsF9XZuRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mb3dCtbd5bBOO7IuDpCkWi8ysidoXrlidxTsXgmS2N4wqbUlJSjxMLE7PRqs2IASYCYHerPkItK1JubUPbh3RM6TBwyV+cg5h6Ujp0HmItx844PAZfPZ5c4r3XbQAtdu6GkBLhTnW5i+fehTaFvSsTl2dPX6t+7J9b40qHRwQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BH3pmOlA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5da0c79ff85so906690a12.1;
        Tue, 21 Jan 2025 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737465502; x=1738070302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddWR/utTRGGEYrHHtFURjGFiLzq3Lu6rmS9hUEc8V4o=;
        b=BH3pmOlAv/bguNa6d4SwMOPKm1XlQY6PR3C4iONLUwGq3koUk1YpJ0hZvmFWcMvMNs
         SfVX6dD7ZhRpdzStn7aK2hEjTvvi5LV6UrM3WDxF/WQhahEfXqthKOKjRvRDd81KsFWG
         D6jBhrRGHL51cXDZa/ko8Ivua8OBrrPC+RZjvx4RmbA3zEEfCaFGrL/lI1wX5CHCyVCs
         lHVhPUuHqEpxquQ1F2IHApjklWmNUnICko7p8zViSn6FL3aGYIgNriaPSyHs9B728gJI
         j2Zx0162Bub6RSkkts22nISI7tTbR5s4zxdkdV7SXRE/Qb1J/E2BygLRstiLds9qI8hV
         hsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737465502; x=1738070302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddWR/utTRGGEYrHHtFURjGFiLzq3Lu6rmS9hUEc8V4o=;
        b=ixoFd3Vlz0vnN7jf/Ww7O3iq3MPxQdUTCTlJWPm8EDw43aGSqvC71t3MgCB8U6ZcRv
         NXofN9sxuxlXfWnCCZpWZEgQpONafCUHAVvuSMMYc6aE0xv2P9O20nzVQrUxt62ZnnVM
         oEX/Z7U2YWoggJcFpBV990Hb99K2imxr9PUBGtvun2N0pGqhhIZMhn9e2NVIu1MqPPut
         gxdIy7L+P7dcCxP+znq7mRQ21dVKxo3P4h9/LlfvKLG55ci0SI6Gg/vK7S8QCsGcJ4b7
         wvXyI6SGmwuCbb7PPsPJpc4chWJvo6RitlBi+d4RmTbbDX7pYc8ofbo4q9RDjcK8QJT0
         y9vA==
X-Forwarded-Encrypted: i=1; AJvYcCVAwFilfRCCKJQ5YVjPIoIvfWrxqH+2uKjSAGZeVmgPUkYPlSISf94kQJInh5WCFvL5xzT0Oc46VqNnsA==@vger.kernel.org, AJvYcCVhukD88839TO/xTbfe2yNR2U6SC9hP3K0Af2vFA7tfWE+LtXINw9ccDWQaeWBgv/o4TL8gzesAKfBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5LL9SBMWlZei3BTSBaFjxR0AMJ0Lu1dLAlCDdXF1WO1Wrrqy
	YWKNxBtBXjF/LABOQPDEfzUyPPSC2JCT/ZDFKPaImiVcbmz3eh/R1YnKwi9k8YD7GirVwFqBorC
	ZqtKZQlhqaW38fvCzpe28zWXxGTY=
X-Gm-Gg: ASbGncvBEU89LKJ4X+j+H2mi8UXFDochK+5eU8xXLqyYmrUH/69nSlm8af+ATRhhCc/
	EVICKLpz1yRDVSAezCeL8KUtMKZ1PdbNR9iwumINZGMMemuxC1A==
X-Google-Smtp-Source: AGHT+IEJB73RC805UtPBGlFhoyKHQmRGWJ+3Lh8OqPEpxLLf2jjpMjQCsA1U2MLFQSqz8Mst3rVVYZ119mp+0PwISaI=
X-Received: by 2002:a05:6402:40cd:b0:5d4:35c7:cd70 with SMTP id
 4fb4d7f45d1cf-5db7d2f892cmr5534258a12.4.1737465501635; Tue, 21 Jan 2025
 05:18:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com> <32945abd-060b-4da8-aa1b-1e45dbe2d4d2@suse.com>
In-Reply-To: <32945abd-060b-4da8-aa1b-1e45dbe2d4d2@suse.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Tue, 21 Jan 2025 14:18:08 +0100
X-Gm-Features: AbW1kvbXlnBOuib3Ibx3O3MgeWA08fh9ZCuDR1tIGRx4hWF9uBffGC63gJ7SmPE
Message-ID: <CAFqprmwfoBsLFsvG5NGWZ_jS6BHi8DnXRvbbbC+ZoxbExVSvRA@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] HID: pidff: Stop all effects before enabling actuators
To: Oliver Neukum <oneukum@suse.com>
Cc: jikos@kernel.org, bentiss@kernel.org, anssi.hannula@gmail.com, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jan 2025 at 11:10, Oliver Neukum <oneukum@suse.com> wrote:
>
> On 19.01.25 14:13, Tomasz Paku=C5=82a wrote:
> > Some PID compliant devices automatically play effects after boot (i.e.
> > autocenter spring) that prevent the rendering of other effects since
> > it is done outside the kernel driver.
> >
> > This makes sure all the effects currently played are stopped after
> > resetting the device.
> > It brings compatibility to the Brunner CLS-P joystick and others
>
> Hi,
>
> it seems to me that the same thing would happen upon resumption
> from S4. Will this be handled?
>
>         Regards
>                 Oliver
>

(Terribly sorry for double mailing, I mistakenly hit reply instead of reply=
 all)

I just tested this with my devices and it sadly doesn't handle sleep proper=
ly.
If a device is powered off then back on during sleep, the driver seems to b=
e
unaware of it and keeps on chugging along like nothing happened.

This causes two things to happen:
1. FFB breaks in programs that have been running when going to sleep
2. Possible auto centering forces are back on and won't go away without a
   power cycle or a disconnect/connect.

Moreover, I noticed that the PID reset routine is only called upon during
device initialisation, while most other PID driver implementations don't do=
 it
during device init and only call:
1. reset + enable actuators if an application initialises force feedback.
2. reset + stop all effects + disable actuators if there aren't any more
   effects left on the device after effect removal.

I'll update the reset function and access it differently, to better manage
device state and maybe hook up .suspend, .resume and .reset_resume
in the universal driver.

Managing this in the generic way will necessitate more extensive changes in=
 the
hid-core but resetting every time when an application actually takes contro=
l
should be enough for now.

This driver is very old and I plan on chipping away at it more in the futur=
e
to make it less strict and work even better with all sorts of USB PID devic=
es.

Tomasz

