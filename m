Return-Path: <linux-input+bounces-757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D17810C3F
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 09:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F08D1F210FF
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1771E1D553;
	Wed, 13 Dec 2023 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fM4y0d0c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97118E
	for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 00:19:33 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5cece20f006so66555027b3.3
        for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 00:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702455573; x=1703060373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6rxuTC3v8jRY0wOAkclPJATZ6e2NhNTNKj/w0dio5Q=;
        b=fM4y0d0cXTaEY9B8x3S1jv9hCqEGwVlY/hfF+vr8A+wNMFsjyREjFhPMMpiWbaL8Ut
         4bi8REbeV/1WtWUvt2rJTLPP9tIZ9BLyDfa7VMWRyd3AIhT54ZQIcuyS0g3ktihVls1o
         dvYxjGuGNuea+VSA2UWoR9w+e1fofUAb2i1SCb8zro7QS9hiM/L6o9mnpFbPh60ubSXi
         nKFNktjvOZ5+tIGobsKpi3H5o3XnY1zCiV2+GiijzrjlKnP013yaqSjoc3K4G3LnC+U8
         Mb5e1s9Rx8c46P//E2L4P1IdoQ4aaDylF5m0+k9ir0sb8bTQa2Z9cUGCOFzBx+JXvmX5
         ApkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702455573; x=1703060373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6rxuTC3v8jRY0wOAkclPJATZ6e2NhNTNKj/w0dio5Q=;
        b=heB7LvqqS46KsjDx06b0QNOKjHa1h4UOEApMIiT+f46BU1mTRmLfQCoPvxAOR1aL/h
         CcQ5N8P4I6POkNnE3aRg8ztMrFYtCx6Llxcb5BRa6t/IxPEPawbJKJp1QuFyDWbE/UDR
         SvONko1GEFKnnir9A+QTSZi5KxaUoTkuN37bL5VB1cXUkDsHqRmmdlcAEjqmtr883iG1
         8IXKPn3oYp43ghBZWA8/krcbOh8YFV/LrU9lciQMKCGfeMZFDxM7lg2NabBhRfVWTZ1a
         gUjMggHrGz9XXPNZw+gz2dgxSbWSW8oWvEloIaVNmIz7lXobcyPSRmWVEoziXWHzgpj5
         XDDQ==
X-Gm-Message-State: AOJu0YxVo0PlN4UzbkCmZNEeZoFLPu91loy9RU+RkPzYQ2Wl6bzAuAcw
	Z6wGsQP9RrRhZ2+hOdRYLnbNGaC/8DZoBmtkxB4DvHF3Ba3HohwB
X-Google-Smtp-Source: AGHT+IG3ezB/0JKiWk8GtYCLj/xYiC0CrQMG/uA5s5ZnsG2k7UHq5Vdgcehl5L+ugfcTePL0gvbvUGgvf7eyqsL6Acg=
X-Received: by 2002:a05:6902:e07:b0:db5:42eb:3efd with SMTP id
 df7-20020a0569020e0700b00db542eb3efdmr5519496ybb.2.1702455572796; Wed, 13 Dec
 2023 00:19:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
 <20231129-descriptors-input-v1-3-9433162914a3@linaro.org> <ZXlY9rsBIF7OUjfv@google.com>
In-Reply-To: <ZXlY9rsBIF7OUjfv@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Dec 2023 09:19:21 +0100
Message-ID: <CACRpkdZLKmOo7mZXyhLgsQqnLV1DxkfmT5TqnyXmQ-x1x=_YKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] Input: omap-keypad - Drop optional GPIO support
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 8:10=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Nov 29, 2023 at 02:51:47PM +0100, Linus Walleij wrote:
> > @@ -180,7 +176,7 @@ static int omap_kp_probe(struct platform_device *pd=
ev)
> >       struct omap_kp *omap_kp;
> >       struct input_dev *input_dev;
> >       struct omap_kp_platform_data *pdata =3D dev_get_platdata(&pdev->d=
ev);
> > -     int i, col_idx, row_idx, ret;
> > +     int col_idx, row_idx, ret;
>
> col_idx and row_idx are not longer needed wither, I dropped them and
> applied the patch.

Thanks for fixing this up Dmitry!

Yours,
Linus Walleij

