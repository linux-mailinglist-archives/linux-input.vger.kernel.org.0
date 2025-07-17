Return-Path: <linux-input+bounces-13578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F8B08328
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 04:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66603188A4BB
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 02:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF0E1DACA1;
	Thu, 17 Jul 2025 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfdjJpKq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA5186A;
	Thu, 17 Jul 2025 02:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752721145; cv=none; b=XMgrAX9BkI13EdRERO5VbmFyN2WDFFX5m+fhBxDARtIFuzQal0sB6NeR3ltGtvVMwy7RmfS+3phGhxtr+z1mSdsb+nNK5wJw4ZMX8qUcbw7frnwn3fnTtwW7oyqV0ClHOsOk0vrlUn5bN2Ee9hWHuVPaa5QwPN3J88YkKtiPGgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752721145; c=relaxed/simple;
	bh=J8NxDYqNRS3td2p5zf9A9nQdj/Fs2SUaqUULwZMUj4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DukjGICf68yAfGZS6MihJLLU6NsVyW9GU3bGmelbHO9qgRF0ZeB9EPFA1EZPdbfZz3ODL9ilA8O4xOxWKY80bHRRpQnSozZYqX9s8zbWqxta6xBQ3MLVBbqxNCluWiJldqV1uEIL4ShMQ/bXUcQhFGcnxBZqGaC1VBjmI/wEuOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfdjJpKq; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so363531a91.3;
        Wed, 16 Jul 2025 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752721143; x=1753325943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8NxDYqNRS3td2p5zf9A9nQdj/Fs2SUaqUULwZMUj4Y=;
        b=VfdjJpKqBArzp/TUjTCDNdO5onnoF9OdLbUcTH6m+sHoLUiEURAXWmHZc2aQndVD+b
         nqO2oj8LwvulM6PAhSicaZimZhkjjE1FDpWGpfi8eFfQXeH4SguR26/B+aYgWv2nyy/E
         IOj8YFB/zBKr22tcZpLoRs2e1ilgAj/sSI5CJireLoiyI0fFQBYk/RvbSLtLO9ZQX/AR
         JziZmGzSScryUjyxC2luaonI1G5cInlIAvZBH1/iB6kLuzpuA+IvB1785Fih/+S6pZPY
         BPdyQInJjM4ijaphcWTW91E2sKOAHZcNLyA9HKI1/VOKFBp0w1JfNK1pyMxtOGxJwDdy
         lomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721143; x=1753325943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8NxDYqNRS3td2p5zf9A9nQdj/Fs2SUaqUULwZMUj4Y=;
        b=nl5r+gyiAlTKSZnSIj8DdAj5Aa0MAC7H7rXVbITbvrdAvMeQouWgJ8ZjnSe+0+/cZq
         372TAN3RhlGXczvTobyKPU0zTtRCsqpi5Yi8hNBmD38geno7mtFtrshkO190zylq0sqn
         ICVMD4mwYN/7jWGSCU3Ze0DB8JPhzJpmSE554e5+6L5KizcXrWu/sIfOiSEDsJbfUqXI
         6RRAhVZqyiAG/3VS37VFaEkKKHYH+Ro30ahjQ4/n+afALBitbAfz1UUg8o+VJL4CP3S+
         kIH877m713HsuhiD1X37t/lPn6fMm2LNgmbE6cmD/1ol5PDJWPV28BLfo9AinHqZ7qnF
         tVtA==
X-Forwarded-Encrypted: i=1; AJvYcCW8bfHYNkRV6t0wIs8Q8YSuVh9NjjFbtd4GEGVY6kOw3YaFsRw6XqXKqWTHdK5+9y+zDAQFNSpGUS5oK7ko@vger.kernel.org, AJvYcCXXE0hSA1U7QqlXI/VXHB6WBWt8lK86azAFsQVcfOqv7qvIu44Xol/5zo5aHuI5p13hb68urunzpWUKSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJPa4dsuhVSixBrG6hLJ5SXy58UWi3QwP5mlf1jd4n52Bc3gB
	B3amiKTWe/119+nYkzgRLGRb9D4lrCed8hkA/HOvpom4nXWSiVKj9wK5d05qN8KopNZqDKA6vTy
	3JpCniBGP1e1y6KetTDBVLoZSfdcisC8=
X-Gm-Gg: ASbGncsbCZ4zwSsT4UGNEUTyCgSGtGwbAhMcYinzxK+Gd0CqeRS1OFaQkwSOAaBxH3c
	+mMZDs/0H21T/z7mOIH1pQAciJUo9+Dt4Ll/P5iFab1LelIMn9dK3G0yK6Zf6uPeab40Yda3U3V
	j9zJdYUFQcHloWfTMUSx7pDjnHZb9mgU+rbXib/BMaVfXOVbaxQwNwHlzTHdfapndYCuif9oFns
	KzKBAM=
X-Google-Smtp-Source: AGHT+IGhU3+cHx3McOX0HZJJaPmsdsE54wVEYSQDzzaT3uNGo0CTSZpnt3CDNo+fOrSDGvgjR/LYX81+4nV3gKzo0ec=
X-Received: by 2002:a17:90b:2747:b0:2ff:58c7:a71f with SMTP id
 98e67ed59e1d1-31c9e799ca0mr6109619a91.32.1752721142901; Wed, 16 Jul 2025
 19:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716172221.1360886-1-aha310510@gmail.com> <CAHQ1cqHwN2KHS0SaWCVxOviscQQpK5TBApkcmTGV9eTCOa=Rfg@mail.gmail.com>
In-Reply-To: <CAHQ1cqHwN2KHS0SaWCVxOviscQQpK5TBApkcmTGV9eTCOa=Rfg@mail.gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 17 Jul 2025 11:58:51 +0900
X-Gm-Features: Ac12FXw1D7t9VIFW3L3F6v4eDpMfpCeiVrBWrIhjfM16hx1C6racE5e-Yd0gX58
Message-ID: <CAO9qdTHBqTvsSXuj_MO3oxtD_dXv1c1cuX6iYpfS=PVGiwAPFg@mail.gmail.com>
Subject: Re: [PATCH] HID: microsoft: add a call hid_hw_stop() in probe()
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, juha.kuikka@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> On Wed, Jul 16, 2025 at 10:22=E2=80=AFAM Jeongjun Park <aha310510@gmail.c=
om> wrote:
> >
> > If hid_hw_start() succeeds but ms_init_ff() fails, it will return witho=
ut
> > calling hid_hw_stop(), which will cause a memory leak. So to prevent th=
is,
> > we need to change probe() to call hid_hw_stop().
> >
>
> If I recall correctly (and it's been a _long_ time since I've looked
> at this code) we intentionally didn't call `hid_hw_stop()` so that
> you'd still have a functional device even if FF feature initialization
> failed. What's the leak mechanism here?
>

I misinterpreted the code.

Thanks for letting me know that ms_init_ff() is designed not to stop the
HW if it fails!

Regards,

Jeongjun Park

