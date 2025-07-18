Return-Path: <linux-input+bounces-13589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18FB09A1C
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 05:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 609D07B9B16
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 03:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85ED1400C;
	Fri, 18 Jul 2025 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSkxrrwF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A70BA27;
	Fri, 18 Jul 2025 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752808616; cv=none; b=INX5/N0Q360leiQwHSyO3WfsyfAThK4aZIgCFyTpII/eG3EprRNW4SGg85cjCgA7Y3fEPIwC/4R5WlDqGGwZsq6PFnxN3GS3NiZ/HXKx2flNeymFdIVBRdZ67Fxh1oY0uV8on/GGH4Z2IR+GF1ZIQVzyCj8adha4Y+EwvlQIrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752808616; c=relaxed/simple;
	bh=BHE/f2XhvtPalYNkrnzjR50K/1vVTxvfy4teDpHZYx0=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=V/C3VT4rSK/d3hO0LCVZpOe1Z6IIAIuWvEnZi3F44B6buS6iZRMS/rHjaqi14d4BuHIyrLOYBIjrjj5TVUFQ47tY3dtdali7BP3UrXHy/MZ2OGvgkCEHHwAyDCDcf0p5ZcrKFBVURw3GG/be4Twt9v9bb/+1eF9rv/HI/bkID+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSkxrrwF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34a71d9208so1148329a12.3;
        Thu, 17 Jul 2025 20:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752808614; x=1753413414; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hWo3MjRjElSlM+vr74dLYKzPASj9Y2C0vM0sDb1jyM=;
        b=cSkxrrwF2zhafS/4jw8Wq36QrdS4UAYhqwgcUGo0lyD7M5aocKH4stFwa7z6okdjav
         n0lrizuUEmI0l7YXL2W7fLd8eCdP+Hu5tA7Z1FsinkiIQL6LguXJX+blZCNKZjjk70pj
         L9eDb3KiLaK6Inr4WP+0mrYS1hCjuw2hFiEUTOwJe1VDOg46IQZpOd5q+/wTIO70CozG
         VUsInF/8mNcbH5ufR9sJl3JS3Y7/qAmT7tzoFraIEWeRQMlBzvW/1chFyIrMOznLLnhy
         oLRsFa8YEqjYaA2tdDhrfUiabB7CPQz7an/+nU2v7WlM1Bfw/51Vg8sUhVen6j5R6UNo
         XsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752808614; x=1753413414;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hWo3MjRjElSlM+vr74dLYKzPASj9Y2C0vM0sDb1jyM=;
        b=OO5/TPwWBVBhm4D5L17r6tVDE02h2E9N3FaY38H4YVJoY8uvhA3qR8kkQj34ojCdHt
         AvkggLmIa6y8kjFBORQMSQLStJAhTTbwbee1gEKhkM+gEtKnEzCIga9DjIscjYI4nYwY
         CEKwWtP0XS1mB3TTtQxPKwWEn6E+CksRUmf7wdsypt2ZhDHCHYFBwEzdPc52u4+oMIAa
         Jt3s1UbScZeGwYYLJrKRJXm0/dRHYobmFuNZvsOAOBcUMZfH0LzRKlBu8sExNN3KUtxL
         BrRpy7TLn4PCK+wCV6GNaPbKIRBQlVbhhB9B+mAJDOSZZahILpRftEFsxf++H0/HwwKo
         Y3FA==
X-Forwarded-Encrypted: i=1; AJvYcCUEkdSm6fyFaHt5U4rKNxC+rJApGej3/ERJX2pF0C2VtwNnaP2e3AXIKCCrbwq26eqwOifvwb/qqR0nqw==@vger.kernel.org, AJvYcCWuT4AoTyfBriFrz2/yNnQ49EMCEI92auWs+UKfzhVFRxTIku15qBSOjnhGiVxo5qF9J0SsOvAM1nIikGxu@vger.kernel.org, AJvYcCXWZMMeLdzhAO1BMJQNaXI8NX/vd5Ln4smqACT6Mz58GQ3pKot1G5iB9ef60VxABsSzl3EJMBpA@vger.kernel.org
X-Gm-Message-State: AOJu0YzBzOW6N+t1AfIObjdw77NmyFoDm0H4qE/1r6i3B/WGl7RCo7V9
	XbXO7jSJt8jwEZsZVOWDtq3btRPKM/3+88gFGM+TlRzceQpKibNWZdeeBz9UUQ==
X-Gm-Gg: ASbGnctoMn+TijlSfLZUPxOSOYgeWzVJIIHxgmQc/OkZuoYvICYzQe5NZfaIgJK25N/
	MnlT6vh231zVaW9JTLgCH+vhtI259pqfYSbW7k6MEoGKRfd4eA2hBs3EAPqD3QbvSzrXwOO/zsC
	Soef4KdfePC2PIqDxz710b+Y6eRRO0mKmmB8qKF5OA5+yaSoV9Vjp1DHGkqCxXu38fw0Opxdqdo
	uZukbaQo/6EUlcmt/YDF+YUSyEqDWDwq4cg7Dje76ymR+Su+a5aBUjoz6HX9OhKrK476R82cgE6
	a9SJRcrAY7CR7mSnQRh/NoBpFvI4krcQfuf12+a9MZBS0inUvpizP4teusArtnToktHIlbC8XGm
	jrDRTObeaVZcbiZZOFHxHjh7n6sWDgDxg2oudBAELOW9IISgncDYmhMw+UvNi0XMu6Ov8VDanqt
	ruMu6YHuU1vmkV
X-Google-Smtp-Source: AGHT+IF5VQDbZ+QqzLcQV5X7C1m3C1oQGwCBnO6TLpGH4bUjsW0xcL1s9B2UZhZYWOMpD8bRAGEOXQ==
X-Received: by 2002:a17:90b:2788:b0:311:e8cc:4255 with SMTP id 98e67ed59e1d1-31c9f4dfa9amr11377244a91.31.1752808614088;
        Thu, 17 Jul 2025 20:16:54 -0700 (PDT)
Received: from smtpclient.apple (pa49-199-174-195.pa.vic.optusnet.com.au. [49.199.174.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e6a8bsm4203212a91.18.2025.07.17.20.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 20:16:53 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] HID: apple: validate feature-report field count to prevent NULL pointer dereference
Date: Fri, 18 Jul 2025 13:16:41 +1000
Message-Id: <68CBB472-565A-4CA8-9ECF-E0F278B10F19@gmail.com>
References: <20250713233008.15131-1-qasdev00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, gargaditya08@live.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20250713233008.15131-1-qasdev00@gmail.com>
To: Qasim Ijaz <qasdev00@gmail.com>
X-Mailer: iPhone Mail (22F76)

Hi Qasim,

> On 14 Jul 2025, at 9:31=E2=80=AFam, Qasim Ijaz <qasdev00@gmail.com> wrote:=

> ...
>  [   15.164723] Oops: general protection fault, probably for non-canonical=
 address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
>  [   15.165691] KASAN: null-ptr-deref in range [0x0000000000000030-0x00000=
00000000037]
>  [   15.165691] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0=
 #31 PREEMPT(voluntary)
>  [   15.165691] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.2-debian-1.16.2-1 04/01/2014
>  [   15.165691] RIP: 0010:apple_magic_backlight_report_set+0xbf/0x210
>  [   15.165691] Call Trace:
>  [   15.165691]  <TASK>
>  [   15.165691]  apple_probe+0x571/0xa20
>  [   15.165691]  hid_device_probe+0x2e2/0x6f0
>  [   15.165691]  really_probe+0x1ca/0x5c0
>  [   15.165691]  __driver_probe_device+0x24f/0x310
>  [   15.165691]  driver_probe_device+0x4a/0xd0
>  [   15.165691]  __device_attach_driver+0x169/0x220
>  [   15.165691]  bus_for_each_drv+0x118/0x1b0
>  [   15.165691]  __device_attach+0x1d5/0x380
>  [   15.165691]  device_initial_probe+0x12/0x20
>  [   15.165691]  bus_probe_device+0x13d/0x180
>  [   15.165691]  device_add+0xd87/0x1510
>  [...]
>=20
> To fix this issue we should validate the number of fields that the
> backlight and power reports have and if they do not have the required
> number of fields then bail.
>=20
> Fixes: 394ba612f941 ("HID: apple: Add support for magic keyboard backlight=
 on T2 Macs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

I haven't had a chance to test this on my laptop but Aditya has the same Mac=
book model anyway. As long as this fixes the null deref you got with the spo=
ofed hid device in qemu, this seems fine.

Reviewed-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> ---
> drivers/hid/hid-apple.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index ed34f5cd5a91..183229ae5f02 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -890,7 +890,8 @@ static int apple_magic_backlight_init(struct hid_devic=
e *hdev)
>    backlight->brightness =3D report_enum->report_id_hash[APPLE_MAGIC_REPOR=
T_ID_BRIGHTNESS];
>    backlight->power =3D report_enum->report_id_hash[APPLE_MAGIC_REPORT_ID_=
POWER];
>=20
> -    if (!backlight->brightness || !backlight->power)
> +    if (!backlight->brightness || backlight->brightness->maxfield < 2 ||
> +        !backlight->power || backlight->power->maxfield < 2)
>        return -ENODEV;
>=20
>    backlight->cdev.name =3D ":white:" LED_FUNCTION_KBD_BACKLIGHT;
> --
> 2.39.5
>=20

