Return-Path: <linux-input+bounces-7679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA09AD96E
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 03:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23EEDB22257
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 01:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC88450276;
	Thu, 24 Oct 2024 01:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGlfckmX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9456B8C
	for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 01:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729734693; cv=none; b=XYV+LcFJ2/SUjMp/LwP1zboakzGsHRizwfv2cohswMZmVThcHKB8jLrxthOhqHbRgXA3W4wigysWo51PcwPsPgZQPTkwN3tixeh45S8gFDuzDfHIQbeqOYoZjCuBwab+eaw1wqlR1ZmGtXB+R+zexNluWq0o5kb+9OHWTZzh4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729734693; c=relaxed/simple;
	bh=FqXOZ8xVP+F6vL8uD3i0wKbllHt1rn59v3iDS/uLxj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tls03fdxVB8+eL0aPThR2xrJQvtTo+FJJp4O04WuIrZGqmKGtvSbJq5Eshi4ALvsAbcw0QcpXX6OH+b4csKkw7m6v/GkvwDDFSBHYc8bGIu/qWJgTJpXNrJfUo7wmyebnZiD45d7W+Hy4RofSaERxaoXvyHKY9O4unaThnGnsGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGlfckmX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315eac969aso2384515e9.1
        for <linux-input@vger.kernel.org>; Wed, 23 Oct 2024 18:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729734690; x=1730339490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjRAQZBdNwF+W6Ju9uMdhbVK8MOr0irBeeNzqJwDrL4=;
        b=GGlfckmXTdbXGW+O4gLtRwm1ETa2KVwDBjfSvPrvpWt0DzWFdyzPH6LCojDG5LB7xP
         YOAPdB8CP7urgeCF3Hg7JpmD4MsaWvj3+zcrPUNCRKvfgqyn+tYU1J+NDLwkGQo+jeTS
         exuHts8z5Z8BJX99ub54J3Geelj6FsKxCc/9F43ucqfGmZrlqAaS4JrQDJFxmwJCTvJt
         UIHRHdF0BlfxayrZqsoHKzZIAj0pY6GKBAcaiwlfjy60WHedXIih02neiGm9pIvY2N2Q
         jif1OJI1bIH3y8YV4hQ4BQQredBx3Sm8qHszzHrq+dATEvrexEB6SRFQo4XbKNbnJHDY
         spcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729734690; x=1730339490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjRAQZBdNwF+W6Ju9uMdhbVK8MOr0irBeeNzqJwDrL4=;
        b=E4jSHlvM/lvazeHLnu1eOYAu0oihjLge6qLI4plLb1yfLLGhlOWBzAwp+p1ogUoqWF
         9MyOb2YvAe/fT3ztrWH9AyFDlMKA0NN0WqgauPnrw0uuK4DWJVas9+I/ZHt5jIHUJsXM
         nEVYyT7UBOf2oDnNKq7ENn78uU+pfof5VcuLG24ke+WqbIh1XPFaciumHIOXQ1+w0MHP
         UzYTustPcsRnEPZCdyTQ7u8JF6nTulPQsAd4SpMp73x8ZQTLmjEioqMl7G18fzSJmuSN
         vshHq2uW0B+PJFciertMVQ3+jI6TGOnh6Vp79DGPxC1VjVsgidTp33fq85jUPUUbVTMP
         TM7g==
X-Gm-Message-State: AOJu0Yz0uMWp3fojF4ebCvEkC/U7x78L5Wel2FZ76LJ81cr8DsALPgQm
	LvCLw6cBxU1qU3WCxhScuJ+CD6Rac4pw/WKnHVpd2efutvooIwaqcXYDMr77Fl72d0Mr4Jn6BB0
	zILEvYEUH+w1sdbjNk+Zv3vzOsiGi5h42
X-Google-Smtp-Source: AGHT+IFD6AA8Ofloh2AkSCoTtfJ6p79gpuJlCo0rkxh4H7B9ANDEJR6zxDYvunLTAEIeBemFtersP3G6OnYuwAPnmGA=
X-Received: by 2002:a05:600c:4f03:b0:431:55af:a220 with SMTP id
 5b1f17b1804b1-4318bc877c1mr1829605e9.12.1729734689663; Wed, 23 Oct 2024
 18:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241020195717.CD7CC17525E@bout3.ijzerbout.nl>
In-Reply-To: <20241020195717.CD7CC17525E@bout3.ijzerbout.nl>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Thu, 24 Oct 2024 02:51:18 +0100
Message-ID: <CALTg27kQOjBkX+W4L+EntReUkRSiPKKB4jhoB05f1LGvTNgyFg@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Add missing initializer
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Good catch, thanks

Are you aware of 'scripts/get_maintainer.pl'? It might tell you to CC
Jiri Kosina and Benjamin Tissoires, as they can actually apply this.

Stuart

On Sun, 20 Oct 2024 at 20:57, Kees Bakker <kees@ijzerbout.nl> wrote:
>
> This was detected by Coverity, CID 1600743
>
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  drivers/hid/hid-corsair-void.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
> index 6ece56b850fc..d1fd04264656 100644
> --- a/drivers/hid/hid-corsair-void.c
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -553,7 +553,7 @@ static void corsair_void_battery_remove_work_handler(struct work_struct *work)
>  static void corsair_void_battery_add_work_handler(struct work_struct *work)
>  {
>         struct corsair_void_drvdata *drvdata;
> -       struct power_supply_config psy_cfg;
> +       struct power_supply_config psy_cfg = {};
>         struct power_supply *new_supply;
>
>         drvdata = container_of(work, struct corsair_void_drvdata,
> --
> 2.47.0
>

