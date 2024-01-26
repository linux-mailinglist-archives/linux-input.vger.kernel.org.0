Return-Path: <linux-input+bounces-1504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9EC83E0DF
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 18:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0DD81F23A1C
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 17:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070DC208B4;
	Fri, 26 Jan 2024 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MTgXyAQx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E62030F
	for <linux-input@vger.kernel.org>; Fri, 26 Jan 2024 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706291263; cv=none; b=U2VO+1fw1y6AspYrqY1mrvFYiOZFlpCgpkexTRUC6QXpIaFU+Gcd/row9nxcKrtTbKGag4jD6TFWqRe+lM5aGTO71eSiPiJ26md+xSn/rUdoKbt/l5PmYgxvuDS4F/YwqdfxIwjgFhIZ8BoDEtxtMZ2K8B2PWWOLRFZq2vs/EN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706291263; c=relaxed/simple;
	bh=mo0Zb5IxAaVSxuH7aZv0jdRMwxfn5IPdm6aKawjw1MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X38CN3ErpsAGto9jDQ9DEnTuNO3ARXuBXul+TDgky1F21fTIttZrDooucH1d3vEpZH90E68KBGdWEKreB9GRoQmTwA2ZrgCcz/CmguixsER+0JoUEd/Fej3vN/hhydLz1K/c/E9jIAgRKRcQ0B3yqTNO31xI9u+bt1m9oU6h4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MTgXyAQx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5100cb238bcso1176040e87.3
        for <linux-input@vger.kernel.org>; Fri, 26 Jan 2024 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706291259; x=1706896059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HynQcdHHZlfZlhzBvDS92YNUyRkwcuZt7YudJij5RKQ=;
        b=MTgXyAQxE2FFkNDQUzdqDV/c92db4fCZ3KQP90PlcP20J55v+LWEz2Nd0rYyQwiOcP
         21FifsORKrvfVFf7ztcdKCSlu6prsyZZwvOwbF8duHJDmKC2euGaRe8YULWUnzd9E7zR
         tu0tseOF5gGhiVZa3aCPT1bWT55qf2fDnbZtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706291259; x=1706896059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HynQcdHHZlfZlhzBvDS92YNUyRkwcuZt7YudJij5RKQ=;
        b=AEaQHJIWUftV52xHEn/0k/Xp8kAl0RdXgxL00C23w69oDe7/RUzxbeVzIVlIPLgIn0
         PiballPn27mA9xr42I8/DWNlnjs3ccYLpDpfpsKbGzuipHFHosrvlh9Vs69bg3xph3Sy
         DSJ8OhZchceG/68pvWi1VttR/kgl6aS7wEgrFL4Tp00/BPUIJLw2NDRpVc1y0ACF7OQ9
         vlEBaODz0WxVqLGVJMun0sJyySYK5ensZHR96/odrrSExC+FNjG/hYOFwfsTpf+lqxsw
         r/DvRIql2q97vPmSCRvl3DbqQ18LKTqUPcjWcHy4xCJItNEHwfd+hODAHBq9rUtRLeGA
         I6sQ==
X-Gm-Message-State: AOJu0Yyq5IU2SXkmybfbE4i6Xu77mLlpe3ZPRpzoBaAqtPCGroGR9Up9
	ZnTdSBgB9Lf3WdIubsfDCy7X1+0oGl9CXEolpjPEjE3E2axcMHIOPjtDsQDtmekYT9im5cAKSXi
	21D9u
X-Google-Smtp-Source: AGHT+IG1X39caSvdJ1wW5fUuPk6hOsrh751CkI5RgXeMIPLv2gdDqKMS3uOGiiUEbw0cQ9BUrMwAKA==
X-Received: by 2002:ac2:4e08:0:b0:510:ffd:31c9 with SMTP id e8-20020ac24e08000000b005100ffd31c9mr34265lfr.4.1706291259079;
        Fri, 26 Jan 2024 09:47:39 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id g16-20020a19ee10000000b0050e7e5d84e9sm237935lfb.68.2024.01.26.09.47.38
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 09:47:38 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-510206fc620so38e87.0
        for <linux-input@vger.kernel.org>; Fri, 26 Jan 2024 09:47:38 -0800 (PST)
X-Received: by 2002:a05:600c:510f:b0:40d:87df:92ca with SMTP id
 o15-20020a05600c510f00b0040d87df92camr164431wms.3.1706291257547; Fri, 26 Jan
 2024 09:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126170901.893-1-johan+linaro@kernel.org>
In-Reply-To: <20240126170901.893-1-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jan 2024 09:47:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UzGcneoL1d-DDXVugAeq2+YLCKrq8-5B7TfVAAKgF=SQ@mail.gmail.com>
Message-ID: <CAD=FV=UzGcneoL1d-DDXVugAeq2+YLCKrq8-5B7TfVAAKgF=SQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid-of: fix NULL-deref on failed power up
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 26, 2024 at 9:10=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> A while back the I2C HID implementation was split in an ACPI and OF
> part, but the new OF driver never initialises the client pointer which
> is dereferenced on power-up failures.
>
> Fixes: b33752c30023 ("HID: i2c-hid: Reorganize so ACPI and OF are separat=
e modules")
> Cc: stable@vger.kernel.org      # 5.12
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-h=
id-of.c
> index c4e1fa0273c8..8be4d576da77 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-of.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
> @@ -87,6 +87,7 @@ static int i2c_hid_of_probe(struct i2c_client *client)
>         if (!ihid_of)
>                 return -ENOMEM;
>
> +       ihid_of->client =3D client;

Good catch and thanks for the fix. FWIW, I'd be OK w/

Reviewed-by: Douglas Anderson <dianders@chromium.org>

That being said, I'd be even happier if you simply removed the
"client" from the structure and removed the error printout.
regulator_bulk_enable() already prints error messages when a failure
happens and thus the error printout is redundant and wastes space.

-Doug

