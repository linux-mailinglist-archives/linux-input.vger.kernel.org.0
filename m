Return-Path: <linux-input+bounces-11688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4EA83C2E
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 10:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4453AD3AF
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 08:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4918A1DF987;
	Thu, 10 Apr 2025 08:08:59 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA511E32DD;
	Thu, 10 Apr 2025 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272539; cv=none; b=C2LLMg23gXdCWZATILrATHSplYhlZqLUadkmS8WOex29BULx3E7E2G5w2enuorCmAVy6sam1kzqJGsd+j234vWdwmnqOfxO/lESuws1TnevsNpOYxW44jitRt7uvg7mbKyuP3JaBwbupB7mmxkZpb43mnbUhT9cHVuBZ12Ntpgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272539; c=relaxed/simple;
	bh=tYJzy7K8Lbk50EctEw6yYwXsykNptvm/ujUZclpGsSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4f9QPi6UJDj5eAQLJFE10rwUNoHLMi1ph3zVa1vt88QdHZ51OdEeIWcTGXyAnoW0oZazSFm7dlBvUvvg1e9PrSUnPdKUqPWoxtFEOJb8XrE8gS0lWDZ53Mpk3M0psU33V+VeH4dl8lUkf2EycF/7tUE8zQQHAlziZ4yNDISYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so203171241.3;
        Thu, 10 Apr 2025 01:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272535; x=1744877335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE9i9/hSR7yVs606Y3SPlKOukZV76vfY1owdrP3mBCc=;
        b=UU5rA5N0wKlVWR8WaqPb8HWgnYp7b2GyWukwM8fUUJKpylqTtUy4DA/LvtLlrHhrGE
         bljSDKuT5q5dqtLdJuXChadvOthGjT609OphGCS7R4TojI9JT9ByDYmU8CtiPyIPx/pG
         xBRbl0lhFthNuEOxHqbhQ88hk9UCSVEnDlC7kYdGTR/fRSN3r4GMgY00eihX+HVavj56
         MuxDyUUT6OKu9hjytn63eLR7aWLoJD8n3IFWyqgHAEaGsFiDC0gg5gT+vKr8CPzQVBsI
         1Y8zaoaDvjq2sN4YuCtHI7Ehge4ezp4XGxYD5kQetUL5zzhJ8AfhUY2M9T97OXAB+PSe
         RmnA==
X-Forwarded-Encrypted: i=1; AJvYcCU40KLjVekNa+6O6rF5zeGb6gDFGMsNQAx7YHL3sZ0J8oi8QXNUYcwcgUB5WseVA6ReS99QsMl/pQl05zCh@vger.kernel.org, AJvYcCW7sIPz8qw99z7NqgFU5dIV4Gx3y4qXenRfp0uDATTmZRtW+JBiOudibxKOg1gXWV+WfledkwMcGcRKfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5SkCb5Gew1BuKOtCmQXo95TgFx5fyeMgd2O6Yq74T3G55siK
	yoaIDYonUYXMiqdTjqhEcCkvMsLlU9lnA9SeHtzYx9nhndXoM6eTauO1RVIADC4=
X-Gm-Gg: ASbGncu1StKo952L0rghieDuv/eYxIBR+CZzg0QT6wv4KfZACF5HGo3HaER3Ef3JW3U
	aDvt6HV0SHjnN2Ua3+A5NMsBhr3uNGmA1iTsUrCuiNpHYy46Az+PeDgHg9DaUFW++a8b6i1z/cc
	MAAV1mLKWxffN8JmZTk4xut82tABWdk5csVNkduP4lX8XNYPqAbL8wfz1CAIPFI4vcD7Eg2Rp14
	6Euu1SilXxTfHZaXyticceTfGreIn8IZhCKskRzXqrtLoyvyUYyBIr7ArKmUtU00ITUkUtbT7ux
	DSf4tgxcGbYzKkHIN0aNXHAC9GUQDt4/lrwtRMd5TIqg0towg/I4u1HR2EwzhlHe77RfWFzICbu
	Or+TyUGnslnYm3A==
X-Google-Smtp-Source: AGHT+IHng/+wBTUA9Lw8divSpHiav27x/4FhzjK4jOSR2pIBEaCpRMJzv4Q1J64M9KXZVbBOh0b1tA==
X-Received: by 2002:a05:6102:3f05:b0:4c5:1c43:7cb3 with SMTP id ada2fe7eead31-4c9d64cb667mr484319137.25.1744272535450;
        Thu, 10 Apr 2025 01:08:55 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c979cfa2sm503746137.13.2025.04.10.01.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 01:08:55 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so210519241.1;
        Thu, 10 Apr 2025 01:08:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMzxYJJ2WhJz5skt1Pob5TE6B/QIEiyRD2jBNc5axEapto/fE6Uq4J8Dv7MIclxUetRTBZngeaQVRvvg==@vger.kernel.org, AJvYcCWuzZ60eKoHQCHC0dwKBnk2VKlJvKmc5ovSAAHN0iJ39UWy1PaTGNfMsfDRqWCbrtVPoEWLgur+3O9u9GZ1@vger.kernel.org
X-Received: by 2002:a05:6102:8008:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4c9d61ef6afmr559483137.2.1744272534799; Thu, 10 Apr 2025
 01:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be>
 <PN0PR01MB95889912BB81D1B1B579C7FEB8B42@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN0PR01MB95889912BB81D1B1B579C7FEB8B42@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 10:08:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdttY-dfyvNX1rWTrL8zQdW=X+wXguK7djM06QPgGmdw@mail.gmail.com>
X-Gm-Features: ATxdqUGAzfxXecFc0njVPSeh_FOxEd6Z9YFyzKHGLz57nYGg9ZXTBqr1eaedv-M
Message-ID: <CAMuHMdWdttY-dfyvNX1rWTrL8zQdW=X+wXguK7djM06QPgGmdw@mail.gmail.com>
Subject: Re: [PATCH] HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on X86
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Kerem Karabay <kekrby@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Aditya,

On Wed, 9 Apr 2025 at 16:35, Aditya Garg <gargaditya08@live.com> wrote:
> On 09-04-2025 02:51 pm, Geert Uytterhoeven wrote:
> > The Apple Touch Bar is only present on x86 MacBook Pros.  Hence add a
> > dependency on X86, to prevent asking the user about this driver when
> > configuring a kernel for a different architecture.
> >
> > Fixes: 1fd41e5e3d7cc556 ("HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars")
> > Fixes: 93a0fc48948107e0 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
>
> Nit:
>
> The commit SHA should have only the first 12 characters.
>
> https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

"at least the first 12 characters"
(I know, because I made that change lately ;-)

> Also, hid-appletb-kbd fix should be:
>
> Fixes: 8e9b9152cfbd ("HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch Bars")
>
> I would also prefer having them as 2 separate patches.

OK, will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

