Return-Path: <linux-input+bounces-6645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FB97EEDD
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 18:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 443A0280FF4
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 16:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF70C8C07;
	Mon, 23 Sep 2024 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d2TH41g/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDC146A86
	for <linux-input@vger.kernel.org>; Mon, 23 Sep 2024 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727107527; cv=none; b=aKGtj0HL9EU1XfB+gtZD7pWweSnVRXlljtZ8ZHRe09FIG4PAw4d+BQxukwyeHAGDsUf+bAE6mdT9fvK2kTX2axnWOitX0DGJXS9lTbkzxlLQsqufl1gRBB80jf/ltSL9GX21QFa2s60kcSRLLugcfoVm13BNpc6b3Cfbfak6BiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727107527; c=relaxed/simple;
	bh=3dm23d3UBr6AgbK1ZyfpkZ7ivEUB4+p5JXV2h+mGMCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkpqLe5gU79QUf1Ntb9pwHxx31YbPJQRGCgrpP3C4mkfDxeBCQfFJyShCdL++AX2KiTd+sQ+aDbUWuU8yjo+xra7Vjvkejee82K8E6NuExnAgiJcmtoZiNJVCuE5yCg+vb817pIYCQ/BhSnVlaKGwy6Hgfa5T5KUjcsFks+y20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d2TH41g/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d64b27c45so843015366b.3
        for <linux-input@vger.kernel.org>; Mon, 23 Sep 2024 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727107524; x=1727712324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T5ThNOpQvmHVNlmYG5WFubjIFU1R+bynQv1DWPhuJ4=;
        b=d2TH41g/a/BYELTlyWMKprPWO4CdHOd+o14WYntcvH4odFspJfo/BqRsTT8tgfJLwf
         EARllfymz21EtHajL2X0Q8to+uVzE/C6Bj7CbGZLtMnO+WttwQje5nO8q7A7vI3Y8irJ
         nvOnR2nIdlNZd7Z0Co7BHS3hHD8rLCekIGmfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107524; x=1727712324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T5ThNOpQvmHVNlmYG5WFubjIFU1R+bynQv1DWPhuJ4=;
        b=AWkp1lM3r+gGW3IuZ7Fttri9n4+j+TxfIAtwVx4gXznfBaI84/NpGlcwdM0ZbcDBnQ
         KLNb9LYWbkdu14NcW/SjJlJ4IPX+JoSIkV+WvdPqAKoUcgoGp84H5tyKAIw4L+GTY9Hl
         /Z7BG9eBv8aY5eEUjLOpRGz2GXxJMA+KtepFDHkf6+W9mtrXPL3ORkwk7UaoYfECwePN
         FBvBvCJee9psYJALkc34txUPpY0qeAwXea7WR7WoPZBtUsXoGtgphN9Wl5Gj2np5uxZj
         EIjhPnA6pC4q6O+Uy5YeG0o+LIDWF+BovGDU72W5qSHqbn7RVXnWEud/H6zlk9vAdCyd
         r+WA==
X-Forwarded-Encrypted: i=1; AJvYcCVUcujWYuUrYQsawqHAzlTUdME8hZMVRLRbuHO/X3trqMkAxTNefAYpKRw2Oz8KcdkAzpSTjRLWxU3zBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mkBkny+i/KQYR4QuV18ZOt1gRdYzD4YB85bVA8EcEtYG8xv6
	HZ1lTWulp7ODp3OXzbRPF/fjT0pVaRg84FSGu5qdYDyeN9DDnhuqisqcswLvNE5uK9yfGGvJWTP
	ZCA==
X-Google-Smtp-Source: AGHT+IHXL1hgsTdPRJgV3KUDmQSv4GF2ijxFI2Xh+Af/AIvSzFhmBD/yzfdRCL03akempSmG62DeJg==
X-Received: by 2002:a17:906:7308:b0:a8d:29b7:ecea with SMTP id a640c23a62f3a-a90d5182575mr1216883666b.61.1727107523887;
        Mon, 23 Sep 2024 09:05:23 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906111aa91sm1246707066b.97.2024.09.23.09.05.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 09:05:22 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3787f30d892so2622060f8f.0
        for <linux-input@vger.kernel.org>; Mon, 23 Sep 2024 09:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWm96dycf2O7hCCIufSBXLFEBHA3bpTRm4WTr0JugdwkGyXEOo1OI1KTgaAxbaiShs3lZHtDQSOqnORsg==@vger.kernel.org
X-Received: by 2002:a05:6000:11c8:b0:378:c887:5874 with SMTP id
 ffacd0b85a97d-37a424939e8mr5134472f8f.59.1727107522244; Mon, 23 Sep 2024
 09:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920153430.503212-10-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240920153430.503212-10-u.kleine-koenig@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Sep 2024 09:05:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WV-wQOEfTFLhcHdhNuWreYGFbdXjmLG3iwW1UCiXujmg@mail.gmail.com>
Message-ID: <CAD=FV=WV-wQOEfTFLhcHdhNuWreYGFbdXjmLG3iwW1UCiXujmg@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid-of: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 20, 2024 at 8:35=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> While touching the initializer, also remove the comma after the sentinel
> entry.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

