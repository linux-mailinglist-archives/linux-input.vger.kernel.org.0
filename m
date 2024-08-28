Return-Path: <linux-input+bounces-5926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C996236B
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 11:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3DAB28485C
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E762B1662F2;
	Wed, 28 Aug 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kd7w/fje"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647815B107
	for <linux-input@vger.kernel.org>; Wed, 28 Aug 2024 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837477; cv=none; b=gVuuYLodavL+vVxGVc+d3B+puyq1ZmIPv+LqlpVKkrtq04SzPlZV9g6KmMn4i00O4tmxq2RTiWDCrCkslnMeexj3+W6bu4ES+P3gJZXJYakvFY0MRIr9GhqJ4XQECnkP6OaOgklJmgh442HFbwDasSNBoxtTXzWQiAA6+t4sFHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837477; c=relaxed/simple;
	bh=zQqg7cbzkAAqq8El2KBhqA+3KnZohuXfc/S1tJbpDuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hVrSfsk52tB/ZYU9SUSwZVoh90ayLXy+Py7c0FlROq8KnK8j3iUtHGoG5XsLmcVYH/0fHfus3lbjZTI5xZhRlWan+4DaxAKoGBGeAAQwKHH1vKbGSlkATbU5iBYSDty9cWBO0RIn+Wio5Uzgs5jFnDTbCYv9fF5XDjN42UwDNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kd7w/fje; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so54222395e9.2
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2024 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724837472; x=1725442272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nztb8QTWKE8vCqoi2j1vz8Fswgv7hpm8l/u2GeDh0dg=;
        b=Kd7w/fjehnmRzxP8+5uAV3zYbfe2EuE28RcGTEKXUqMp1ycV6THrC/563lTiQmMgzn
         ei4eBLBDhTcpHPU/y4/vjhcHGolxGMSPSwsS+uOqRmyu2XtlAqsQy4fG65mVvYRRzq4G
         /RbzuN09r1pNvV9YzvVW/OCsjD4zp5UtCputf9gtXlSai51XCJHrk5zOeXeLTAoRqM4P
         nGKoDlVAgOJWBP6q9+ln1+RvB1EaqYFqGVDzhxz9FpMmSUkBws9lhkAJAcH44xnjTljL
         tjZVJgIn5CxRmxUgJbq6ZA8Ju5SOKIg1PRCXQn+Za2UB4OK4EVIO6tT2u1247maDkifN
         0qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837472; x=1725442272;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nztb8QTWKE8vCqoi2j1vz8Fswgv7hpm8l/u2GeDh0dg=;
        b=dX+rQ9OytQtSZifD0MijHdTQU7sFh9F5/40slbrqwglfvfGYPHjm/WM5QcJgZHp6OF
         Ug4I+lnlp52L/78Hml92GkHDeU4Hx3e9JJyQ6vhUT6QglC7eo+JX7gtAUyxqwxeCTakQ
         NbUpW55UYz2//1MvbsK2wNaM9nHW3hkmdESSegbLXJ7Fvj+JCsq/ZcuA2x6G46Yrn/Nc
         CtzYHKNDUSZcIwux7dVIXHkNmQSqilqD/xsFD3XZMJWDaHKqyIUJ5Alq+/3iU0YX6oGU
         uH4FPMsG4OZqPllgpmjRnnovF5rgQfYPLT4UTvytbTtIVqh3fFTakmlaRuC8gKe782MI
         u3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWQZJJ0IuzJS8maYgbaXvDxC0lrC6DRw44/LCeXm0sz1MyubwIPtdlE9CUUuD+bUNPGbEqMTWNONAzaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygOuhSdAOexMsmk2Dfh3p4pCJWSWYTdwpLQ6pwYoC/15MDc93x
	iqxHO4reloTVOT43OWScC+p3LtTlM9nf1/hQaia5EwtNkF46xEuRf0oF2PajyPg=
X-Google-Smtp-Source: AGHT+IF2qTvtGuAd4Hsxi0pkISJXFGgyQwIBCynnMQqBlF2Bo98neUQNmwhUdIKiZ3qtSZRVcHdVng==
X-Received: by 2002:a5d:4687:0:b0:371:7e73:eb43 with SMTP id ffacd0b85a97d-373118e35ccmr10622857f8f.42.1724837471143;
        Wed, 28 Aug 2024 02:31:11 -0700 (PDT)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813cdf2sm15169916f8f.38.2024.08.28.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:31:10 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mt6779-keypad - use devm_clk_get_enabled()
In-Reply-To: <Zs4UWGKt3hLjNmoP@google.com>
References: <Zs4UWGKt3hLjNmoP@google.com>
Date: Wed, 28 Aug 2024 11:31:08 +0200
Message-ID: <87r0a9q9ib.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Dmitry

Thank you for the patch.

On mar., ao=C3=BBt 27, 2024 at 11:00, Dmitry Torokhov <dmitry.torokhov@gmai=
l.com> wrote:

> Switch to using devm_clk_get_enable() helper instead of acquiring the
> clock with devm_clk_get(), enabling it, and defining and installing
> a custom devm action to call clk_disable().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mt6779-keypad.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keybo=
ard/mt6779-keypad.c
> index 19f69d167fbd..c13880103429 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -92,11 +92,6 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, =
void *dev_id)
>  	return IRQ_HANDLED;
>  }
>=20=20
> -static void mt6779_keypad_clk_disable(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static void mt6779_keypad_calc_row_col_single(unsigned int key,
>  					      unsigned int *row,
>  					      unsigned int *col)
> @@ -213,21 +208,10 @@ static int mt6779_keypad_pdrv_probe(struct platform=
_device *pdev)
>  	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
>  			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
>=20=20
> -	keypad->clk =3D devm_clk_get(&pdev->dev, "kpd");
> +	keypad->clk =3D devm_clk_get_enabled(&pdev->dev, "kpd");
>  	if (IS_ERR(keypad->clk))
>  		return PTR_ERR(keypad->clk);
>=20=20
> -	error =3D clk_prepare_enable(keypad->clk);
> -	if (error) {
> -		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
> -		return error;
> -	}
> -
> -	error =3D devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disabl=
e,
> -					 keypad->clk);
> -	if (error)
> -		return error;
> -
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> --=20
> 2.46.0.295.g3b9ea8a38a-goog
>
>
> --=20
> Dmitry

