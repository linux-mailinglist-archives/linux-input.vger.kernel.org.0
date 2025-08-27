Return-Path: <linux-input+bounces-14350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDCB383E3
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 15:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52FB73A7F52
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CD7352FF6;
	Wed, 27 Aug 2025 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCL9JgtT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F9341ABD
	for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302204; cv=none; b=jQoKgBpQKl+gcj69kmc3RCC8G3aDvNkwbcRHKzYSelZg3RnRAtmVpG0ItjYd8M5uGg5pXfRZT7js66GFkeg03WJUwe0JMlYc42xewxtpkYYfYncBx2/b/jyBDVrU4sG7RTaYRBhh5opp5udNB8RXnmgysHkxbRyC1L1hJVk5Lrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302204; c=relaxed/simple;
	bh=ROC+BxYJvxo4Ra+SaImrJ8k/XraQYmEOGcoclXesz9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3U1sF9aWNxrqmxsbi3GK6Xj/P6cmMbWTbE+3lr7ALq5x+kAYJuIiushRrxRGdlua/xiVctB/ikDVWFihA80zEZlrOAqnw5vHRHnxMRduDdLwS18eE9njQuQ2FHjMRez9OLav8FsDGXUpCbf8cSsKjKvcWa0pVo487LA4A7iVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HCL9JgtT; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74526ca79c2so958926a34.3
        for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756302201; x=1756907001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOO5DJiHFR3uaAgcdyHCL1QPgCU//KGOS5fO6obbhFo=;
        b=HCL9JgtTNHQfyCP2h1cHz7pMZqma08BRAAK2+mSUQVzTxiI30rAvL+8tHZTZoOJxsh
         fIXrTLohDpP3ymWNnK7jvPbfV9godm63Gqgakqqi1qmPV00xbO1G8ZMQZVRSS/pF6Y3D
         OPe/93TvkXwVSp4hSUocup6eE7cYMcLyclMYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756302201; x=1756907001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOO5DJiHFR3uaAgcdyHCL1QPgCU//KGOS5fO6obbhFo=;
        b=AXEFiK9F+DS/rFKvIvp0Ao33frVNfME1UpplpwJqWfkt96mO+be81Vq7riSao5jVeR
         a5wIbMF+ykaLaDLxmvv7jNtjGRNAevoCEETVHR6ldQZH87hoZzMg5qFZati4hbiwfLaH
         Q6sUQkJR0b0DibirakS91dIkm0vayaD/yjbCwLa4IqGMhAXqE8m4Mbs8hZ4Zj02TGjDt
         FNVMcU+gC0RzmRRLvA/+ORUaIrEIcMI0Tb+EXeGql8bnvPVvQsp7T39Qhody1umAUX99
         9I1jm39cxumGe264PkVGPjxXm8qKPGc3svFUDQk1f6I1TLs3d0UJFX885nSycUm2jNCY
         RWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Yml3sM1m0xHiMIBQxjGFNCOUdQkw95mf89nEaPrvPzLEjaI2aPy+oTRD0LEppDROMIECFUhYq/fzZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2roNTvtX6/2tI3gnic52BhexWvhzgO8zQSzjrxY0NlNebcCm
	SS0PpIUD30gjN7OemlRkSVR7vX6kWF3uJ0UjU6NWGWkZgH1Tw0Ew012jw0suGUMzQFjpZ4pEm2c
	w0RaTFq/9onc2nmAYi9OX0Z1SJC87SPn/lu1oX8PE
X-Gm-Gg: ASbGncv29iyQF40sQpaMcn/YL0EjQ/lO9dFEXTOsuXdf+Hd27uRFXwxQxYEIcLDNlGB
	Sg7LNkWRJPMoYomFAFe3aTssadW3ghouDgCeHYiNWMMPSnnd/Ny58WMqn0kihhsGfWQdw0keQx6
	kBxYnAWpwpWNVu6FyCNBLbZg2SJxZPEk+T8rma90BdDrzSyz0qB3qwTrhZpYCNYxDD6M9vrhmsX
	gNf4BTTl5UFWb2KbtfxCfRfHvQ+vC0HPEU=
X-Google-Smtp-Source: AGHT+IFML09d6OTln5JwHTjKrkwtVYwzmCr1Bxp6r1uvPPk8T241FrUzKZ8dLpbh9eYjr9tFvagSaaECgl+Ih/FJIJg=
X-Received: by 2002:a05:6830:d18:b0:742:fd7f:e105 with SMTP id
 46e09a7af769-74500aafdb9mr10828847a34.19.1756302201636; Wed, 27 Aug 2025
 06:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aK8Au3CgZSTvfEJ6@stanley.mountain>
In-Reply-To: <aK8Au3CgZSTvfEJ6@stanley.mountain>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 27 Aug 2025 21:43:10 +0800
X-Gm-Features: Ac12FXwM35V_oehyXQvReVca6XRrKSLZotqLpHmniBQa5j8YidPWQocMII9oIgU
Message-ID: <CAEXTbpcpJsL0te+DA=5PEJjkawZ23Di3v20hdMqUj3SeB_Y82w@mail.gmail.com>
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
	Wentao Guan <guanwentao@uniontech.com>, 
	=?UTF-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Aug 27, 2025 at 8:57=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Bitwise AND was intended instead of OR.  With the current code the
> condition is always true.
>
> Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power on =
after panel is enabled")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 99ce6386176c..30ebde1273be 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1189,7 +1189,7 @@ static int i2c_hid_core_register_panel_follower(str=
uct i2c_hid *ihid)
>         struct device *dev =3D &ihid->client->dev;
>         int ret;
>
> -       if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGH=
T)
> +       if (ihid->hid->initial_quirks & HID_QUIRK_POWER_ON_AFTER_BACKLIGH=
T)
>                 ihid->panel_follower.funcs =3D &i2c_hid_core_panel_follow=
er_enable_funcs;
>         else
>                 ihid->panel_follower.funcs =3D &i2c_hid_core_panel_follow=
er_prepare_funcs;
> --
> 2.47.2
>

Reviewed-by:  Pin-yen Lin <treapking@chromium.org>

Thanks for catching this!

Regards,
Pin-yen

