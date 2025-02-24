Return-Path: <linux-input+bounces-10297-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B72A427C8
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 17:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C0633B0606
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 16:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AD426159C;
	Mon, 24 Feb 2025 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjR5Iyoz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21C25A35D;
	Mon, 24 Feb 2025 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740413977; cv=none; b=BFJdQWrFJJibsJwalEvEIJTs9uHu1dHSOBW+V7XWzvynOQ2iddvjzUkJy6+Fp427Vh3LU5ZNZ4fblKhx6TM1ssf7nDoCobZcSlv4KxKV2WH5bUpcxLjgZC3BtTGlwnnqx1jnzrotOitLQ+/eqKAZReJink+7O1fkZdgz4BMRy8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740413977; c=relaxed/simple;
	bh=4GzgfkJb2gmKexeq9dwq5MdgAoigbYl7qj0gsU2qFuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcoBb4ddsy66h2qvFJSrS+B56qVpaMz8ciC4lZigy+YAYOSgXZYWGzfcTOXSaUPOgnvsWmR7dBryS509oKTNego8tC0aQGS32vylwgM0p8dHds+IMuwup1PBqUaV8VIGahoK+Lq8dogOodPW0fSPlPnfZ2mLXfksZneu+rsxgN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjR5Iyoz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso9325397a91.2;
        Mon, 24 Feb 2025 08:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740413975; x=1741018775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWqm33tm+BoJJmuTVNeID7zEMxZd7DFzwDY9FfAP8Gs=;
        b=UjR5IyozaW0Mr3Dd2gV3GJpdsk8MwHODrZ9DRmcrSCjZ6Vk0bVbHLzTepLbTAT2wjg
         MfdR4H5hZzc80XIfF38oZvclN8YikBw5CoO2vntUOVmL9sVkTAYvw/TywKTIK+ChPBv7
         lEZFrzpQtGt6/XngKDEtAcWUBwtPCNR8Fxwx4ApbpKw7jCxCVCNT89L8Dt2KjL+yVOy4
         tJHJNgMrkXqkRdsZAB/q5mwErx2MyHKbnOM23AIGC0xTYaMfBi1T33u3yqhF9ztGm48h
         WXBPtLWJv7h6iEs9uEEUAoeiEBfYzrRkwvr1u9jv5jQMNlE4sD3gJRkdiG7Mk4UzjYij
         LuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413975; x=1741018775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWqm33tm+BoJJmuTVNeID7zEMxZd7DFzwDY9FfAP8Gs=;
        b=Cmi/KNWrcRtflTbbbKDWf+C4PhfJGU6bhAZnmbJ11xymJgewQjdDphq9Tp2lEUoZIt
         YjPukvgCUd9l3qEWHZn6ipiUtraHcHkYZlfugN4ODlCpG48IKDWpnD9pn5eLTmRo3mjr
         jZSH7LH8VJe03oO33BzB9gIBAFLAYjiO5KLpZYXRTET8Azxcam9mVW7mekfziDUTV5ku
         0uOsqAJ0B5sl4yx+kzxCoZNyG8/bnbSKLG20LpCiQLHi5uctUZnon4iQJtmAV6s5To4X
         qJ4pVdMSR3QF+95Ca0eQ8npW5LmD7foZLP6vDuJU2vN5yynRd/zb7k9DbBrILK11ESHM
         Y24A==
X-Forwarded-Encrypted: i=1; AJvYcCVZqxpFDiUIrxBqHTaywDU6VmORq1hKcQr5PL/k1ArdG4dwBhyiI5IuHKZrL+wLIRCz0lV41uvyPZXbdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb88GeJr/sLbHsq+v9rQg2opGZ64PxKwvzOyLpxJspRTysQzdm
	QuebN33ttAQ0nR4/725KAcAvmFIYmiRdVJc8RH1G4XabGNH2zy2OogF9OekrLhOeiUcdnSqUBhV
	1BcRKS2ZWDtrMkHukbKg84KibpoP7gbWA
X-Gm-Gg: ASbGncs9+EwZ9xZHTPHFa3XdH6kGSGgU7XYs+L482+cSrRUfOy0m0CucEVVM6itMjFy
	QA1cHclmBn/KTsr00u5QeGIHe/WPiS5EPfiGQ5r2oeT5SzywSboa9lkos2mL/nza0NvlDPspXVt
	IyYdKEJb0=
X-Google-Smtp-Source: AGHT+IHN3+7tc4CILBRG8b0xSgeYbA+sxSkEYT5Xr/Gx4lEYIQmkQKUDZdyZskgwXw75GXiXPMcjSu0+hBt4DcqVppA=
X-Received: by 2002:a17:90b:3946:b0:2f4:434d:c7ed with SMTP id
 98e67ed59e1d1-2fce78c7fd8mr26255470a91.16.1740413974738; Mon, 24 Feb 2025
 08:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202123351.86957-1-guille.rodriguez@gmail.com>
In-Reply-To: <20241202123351.86957-1-guille.rodriguez@gmail.com>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Mon, 24 Feb 2025 17:19:23 +0100
X-Gm-Features: AWEUYZnZqpr1FP9G-sfegvfp2isrZ6N1y1AiiaaSdkYjWRfT1uN6s1MBNMRAkDg
Message-ID: <CABDcavYkGAGA5CVsMZGE9g_HLTvE3kAM25Uu8h6ccqerLp5oWQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: evdev - fix wrong timestamp after SYN_DROPPED
To: linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Any comments on the patch below?

Thank you,

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com

El lun, 2 dic 2024 a las 13:34, Guillermo Rodr=C3=ADguez
(<guille.rodriguez@gmail.com>) escribi=C3=B3:
>
> Hi all,
>
> We are seeing an issue with gpio_keys where the first event after
> a SYN_DROPPED has the same timestamp as the SYN_DROPPED event itself.
> After some investigation it looks like this is an issue with evdev
> and not specific to gpio_keys.
>
> The issue was originally introduced in commit 3b51c44 ("Input: allow
> drivers specify timestamp for input events").
>
> This commit introduced input_set_timestamp and input_get_timestamp.
> The latter (despite the name) actually generates and stores a timestamp
> in dev->timestamp if the driver did not set one itself. This timestamp
> needs to be reset when events are flushed; otherwise the next event
> will use a stale timestamp. A partial fix was implemented in 4370b23
> ("Input: reset device timestamp on sync"), but this does not cover the
> case of SYN_DROPPED.
>
> If a SYN_DROPPED is generated (currently only done by evdev), the
> following happens:
>
> - evdev calls input_get_timestamp to generate a timestamp for the
>   SYN_DROPPED event.
> - input_get_timestamp generates a timestamp and stores it in
>   dev->timestamp
> - When the next real event is reported (in evdev_events), evdev
>   calls input_get_timestamp, which uses the timestamp already
>   stored in dev->timestamp, which corresponds to the SYN_DROPPED event
>
> How to fix:
>
> - When a SYN_DROPPED is generated, after calling input_get_timestamp,
>   the timestamp stored in dev->timestamp should be reset (same as is
>   currently done in input_handle_event). The attached patch does that.
>
> (Perhaps the underlying problem is that it is not expected that a
> function called input_get_timestamp will have side effects. The
> commit history of input.c shows that this has actually caused a
> few issues since 3b51c44.)
>
>
> Guillermo Rodr=C3=ADguez (1):
>   Input: evdev - fix wrong timestamp after SYN_DROPPED event
>
>  drivers/input/evdev.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
>
> base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
> 2.25.1
>

