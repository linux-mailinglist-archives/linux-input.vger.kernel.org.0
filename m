Return-Path: <linux-input+bounces-13628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F29B0D425
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FC363A6BB9
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 08:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3648928C5CA;
	Tue, 22 Jul 2025 08:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpFz6Snq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523A288C97;
	Tue, 22 Jul 2025 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171790; cv=none; b=Fl1iNbVEKzGLxhETd2/TtMQt2tFO3Of47M/biEXAnQX2uw1fF9mZ94oczKAO/2WBHANaMoA4mt4UEiLp97t7UPfXEA2U71u1Ur2+LO02BVHwyoHsikkJWqgrf3DTo3/yorM0sz6lG1YB3Jv0wu5P6dxpu8+3UZ75OD2zP40a/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171790; c=relaxed/simple;
	bh=gn+iuOkeXx5CXapSR8JX4rx1rvfdQeO7EY0UGX2skyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlcEzHf4OpIZheOeFCNgPq6K60mFp2VnVqNdD2NNowTuUDmOIc22gOEoIiAuYOSFP7bJKM5cg+9lJBsw5WUvudPC1CJaC9hpVhfBa9g01lKYean9hQpaSqUxBypQccjs8LO/savDNuyyAOE5Emj9yG8Me/P1VcRvtCVZ12KpcOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpFz6Snq; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e182e4171bso550134085a.3;
        Tue, 22 Jul 2025 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753171787; x=1753776587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMRut42JbXCcjzEF/zhUxhw62vCyXsodJ4Y7LczqSg=;
        b=GpFz6SnqGhDC3Gi/h/UOySdZA32ramjNnKx07up0ld7agvd4D1QcfAA0X7nUAJZS1l
         x2fTGhlhTF+WC9hOk20Q78SE1A81OHsKOAIEUMMvpg6zzW7tPIHBa0A38upfJy6JWs5i
         0A/bXrOqBDhbcrysIBbU6H/axADaviHnP6aUfyT7xn1U7c1VycWiZAwANlnsk5mUmMyJ
         7jE+w/wrqh+78FJ6DV3UCfSpU9BUQ3enR0iPkmv7iXTJLrkhAmCOTNAq93wc75g4Th3u
         vj4b/SvwR5yq3R3WYr5m55eauxt4BB1R7917USOfs01tOAxo43JfeXiC5Sn9fn11JZpg
         +iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171787; x=1753776587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkMRut42JbXCcjzEF/zhUxhw62vCyXsodJ4Y7LczqSg=;
        b=Zz/grrw7KIz6QuDP/imQi7dKI4tIpeSN8Aoz9p4jQZ7Q0p6zs5TV/s1wzm426yhgZm
         1BxHgB3mgOWCEn+c8WpqPlpgE74k+1me2XW2RGMSHHwnMStRSNuft21ms/g6zMuZQV9o
         IIw2WpiLJdvN4h7FX+6wjsuch3cyEOedVHMDYYp/hwsyY7YPmeH/KuSo2Jox2Ci4ZbhM
         5mLIWx67SUpjRShb1NTl8KhZw5ouRQ21jb2rmAZsAwYg8por6iriXh+tBw0KasTwDIJt
         HW2F5r0da54ezPA2ypH3EdGso6mdr/0nhmrCL5brdVfJ+PJ92p+/myEdCv7HAQkMxPLi
         ZE7g==
X-Forwarded-Encrypted: i=1; AJvYcCUElC8yLir+S/YFhoHjc9BtupeTJkQPyupzZnUiQ9C8n4/lDg/xTcUfVb4yzq50ULGrw7vzHssrsH+CwA==@vger.kernel.org, AJvYcCUWUZp4xYWcbSrCNBxEM4nmW4xAqGs5FGa/2++31t9ObS5FA5FzBysgNT8wJFYS39rRuCJMmNIxpALLDSZ4@vger.kernel.org, AJvYcCUbY9Z0iaZBHPb1+2YqO0ePz3VvVEu71fWH3qUWpapAeszSuoSERhukKLOlDvCdhxZzNWaC563J@vger.kernel.org
X-Gm-Message-State: AOJu0YzaVzE0b0HOj8CaLp7DdYg9zs7Mn+RUGCdzF9pweCq8FQBrHQge
	yzCRLfAIIR9Xgrmwry1PKz4e6BOvD0lN/UNP3KpZT6h/qtvS4mikbgD0IGt36gaaFwIi+ptPNNn
	Eky9eSdIeNhu6wZmhu9ExpJswpQon4tU=
X-Gm-Gg: ASbGnctY09WGd9+gGp3srN1bk6woFp5Vi3j+WB/QYIIofYvAsW0yaFdvixV93HNi6To
	2VaWFJJdqqCKswFw7WIAXTLvgtyCL5+e5sK5081vXf6ZHIPHNog2+3equVUbRSS+A7qXvMWj3qH
	UyTKCtVqpWA961ONjskhqjNMkUx5tK5Fh5/kKGxBrejSoXv5wUE+keOC5a20ZRpLy1QjJG4LoEM
	F4lGm2tDQaGOaKuEQjkYwccPrW5m9ymeUgdvkgf
X-Google-Smtp-Source: AGHT+IHLdTP29vGvUZLmpbgdjueMPFa6ju4C/ky1Y5qT2wkgHAQc0YoCIuQb3roEVQW6tc9ak88IWATJBWQrGV46Nxw=
X-Received: by 2002:a05:6214:419c:b0:6fd:4cd1:c79a with SMTP id
 6a1803df08f44-704f6adc103mr357084356d6.21.1753171787424; Tue, 22 Jul 2025
 01:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722080003.3605-1-qasdev00@gmail.com>
In-Reply-To: <20250722080003.3605-1-qasdev00@gmail.com>
From: Dmitry Savin <envelsavinds@gmail.com>
Date: Tue, 22 Jul 2025 09:09:35 +0100
X-Gm-Features: Ac12FXwaASSHloXD55ijQi_eIPwUCNTSkE1tUTMXeaCahvY7RWmwi-wYMnuFwEg
Message-ID: <CAP+4zOfi4v-MZoOeQmkD99-QhV45KEyHSXV2CSGtAaqOyGb6CQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Dmitry Savin <envelsavinds@gmail.com>

On Tue, 22 Jul 2025 at 09:00, Qasim Ijaz <qasdev00@gmail.com> wrote:
>
> A malicious HID device can trigger a slab out-of-bounds during
> mt_report_fixup() by passing in report descriptor smaller than
> 607 bytes. mt_report_fixup() attempts to patch byte offset 607
> of the descriptor with 0x25 by first checking if byte offset
> 607 is 0x15 however it lacks bounds checks to verify if the
> descriptor is big enough before conducting this check. Fix
> this vulnerability by ensuring the descriptor size is
> greater than or equal to 608 before accessing it.
>
> Below is the KASAN splat after the out of bounds access happens:
>
> [   13.671954] ==================================================================
> [   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
> [   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
> [   13.673297]
> [   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
> [   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
> [   13.673297] Call Trace:
> [   13.673297]  <TASK>
> [   13.673297]  dump_stack_lvl+0x5f/0x80
> [   13.673297]  print_report+0xd1/0x660
> [   13.673297]  kasan_report+0xe5/0x120
> [   13.673297]  __asan_report_load1_noabort+0x18/0x20
> [   13.673297]  mt_report_fixup+0x103/0x110
> [   13.673297]  hid_open_report+0x1ef/0x810
> [   13.673297]  mt_probe+0x422/0x960
> [   13.673297]  hid_device_probe+0x2e2/0x6f0
> [   13.673297]  really_probe+0x1c6/0x6b0
> [   13.673297]  __driver_probe_device+0x24f/0x310
> [   13.673297]  driver_probe_device+0x4e/0x220
> [   13.673297]  __device_attach_driver+0x169/0x320
> [   13.673297]  bus_for_each_drv+0x11d/0x1b0
> [   13.673297]  __device_attach+0x1b8/0x3e0
> [   13.673297]  device_initial_probe+0x12/0x20
> [   13.673297]  bus_probe_device+0x13d/0x180
> [   13.673297]  device_add+0xe3a/0x1670
> [   13.673297]  hid_add_device+0x31d/0xa40
> [...]
>
> Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> Reviewed-by: Dmitry Savin <envelsavinds@gmail.com>
> ---
>  drivers/hid/hid-multitouch.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 7ac8e16e6158..af4abe3ba410 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1461,18 +1461,25 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>         if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
>             (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
>              hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
> -               if (rdesc[607] == 0x15) {
> -                       rdesc[607] = 0x25;
> -                       dev_info(
> -                               &hdev->dev,
> -                               "GT7868Q report descriptor fixup is applied.\n");
> +               if (*size >= 608) {
> +                       if (rdesc[607] == 0x15) {
> +                               rdesc[607] = 0x25;
> +                               dev_info(
> +                                       &hdev->dev,
> +                                       "GT7868Q report descriptor fixup is applied.\n");
> +                       } else {
> +                               dev_info(
> +                                       &hdev->dev,
> +                                       "The byte is not expected for fixing the report descriptor. \
> +                                       It's possible that the touchpad firmware is not suitable for applying the fix. \
> +                                       got: %x\n",
> +                                       rdesc[607]);
> +                       }
>                 } else {
>                         dev_info(
>                                 &hdev->dev,
> -                               "The byte is not expected for fixing the report descriptor. \
> -It's possible that the touchpad firmware is not suitable for applying the fix. \
> -got: %x\n",
> -                               rdesc[607]);
> +                               "GT7868Q fixup: report descriptor only %u bytes, skipping\n",
> +                               *size);
>                 }
>         }
>
> --
> 2.39.5
>

