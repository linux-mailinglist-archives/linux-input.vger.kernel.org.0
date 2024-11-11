Return-Path: <linux-input+bounces-8017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 288449C437E
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 18:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED431F21194
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 17:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F89A1A7253;
	Mon, 11 Nov 2024 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G/Zr5TEO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0D1A707E
	for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731345900; cv=none; b=YwCb6qMr5fdX8ua2I7Sm+1AjTBdSn4mCdtxs1GaLy7wbr0DCA6nErLCgm8VqJwbU7uf4lwOswuXH8sodwQvZX+2XcPQ9UGhZ41aDm8ONuAkCI+/sNj3A1fvHG6YhcU9muk2z5ZaMro+5efni1gp4RQ/TpXdELimwt/n/dWyAd1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731345900; c=relaxed/simple;
	bh=+bsSX+Ra+NomURtV4l48KCn7neeBpILpjUckN375Gyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gARWvgMpYGQtpPMQeab8cwrvUwVPo81Yekloivsl7fdnlGOrCsHTA3IL+QzPkN/Fv7wivy/Bz+tEGKvVghzOT5ZXzYQlhCqabI5+rvFm6xmH5vpCmJKNEIEjQ3ifRInvRkprOtezaL/ner0VvvgU/zuI73M/QRv6SSiIaCBUXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G/Zr5TEO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so39189571fa.1
        for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 09:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731345895; x=1731950695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tn3wlhPcjYAmpGIs9KYtyq4CcNrw701MWptcU9EAyJw=;
        b=G/Zr5TEO47ifms4u3ZzpqE7T0BShZjKFQeL3BebLzSn5VSvO0eKczad67up3AU5F6G
         8B/pKxG3mAxX6WakvSCeH4GUsD1T1NoV4dud8Snc6WVUc9sN4GnChvxYHXo1jZ0OT2dC
         XuaWnkKfvmHh/6qXPAE6aOhGk3XNFgbJUGLzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345895; x=1731950695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tn3wlhPcjYAmpGIs9KYtyq4CcNrw701MWptcU9EAyJw=;
        b=nInTkPZZxAXPeb6fKZ6msKKgpfxHIJW2wGGs2MSQ4kaSe2LPTy0YkZkKRMlOB2q8Qx
         xoXueGBksA4YgeTmhx1vSNEJu2lBKnnoC9IlGoUEx5CLkrNG8/SeF7I1anoKjjcB9Zs8
         zXynsJj94bG0RY6O5SAg16nnMbavCYKC6HPgNV+JysE66ne0B/xXFoRdIxCU5WdElcMZ
         1Dm5pD079uPxaVP8Ioc6EVQ4Po5teUSNpkJIy4znotn3kwcL4G+kYwRvetg5O7SYxYDE
         DJB7B9hVyu3oHRItMzZCb+4rF31U+o3I6+J76aB4J4LGbYXw6C3uQRce7nfnLUKBv8ml
         GUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa00FhwCN0HEiVg2iGvkAGipnXQz8PUT3i07K2BrUWZ1D5Fl6q2d4RMDgOglyDfq5gF/YhfmNUTLr3cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZgnGCusavvzgc3GF4Mi2KKsCyK/HZW6C0m/n+wIKLXE0uBh9
	CY+LeDHRsrOVxwCPejZCmFVFcHAyaVhuRkJ2r0Cs1uvMDIoD+GLPGYl92bSeSvNEtML78sikqs7
	nbw==
X-Google-Smtp-Source: AGHT+IEJR0avSFn/rD8XgI0LW29PhC+CLuGYTPIAA9jNNDaYvGcHQRDKlotl5uZOs7AsSUA3yi7rIA==
X-Received: by 2002:a2e:a99e:0:b0:2fb:8777:7359 with SMTP id 38308e7fff4ca-2ff2030c203mr72751351fa.39.1731345895366;
        Mon, 11 Nov 2024 09:24:55 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179069d5sm17481551fa.66.2024.11.11.09.24.54
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 09:24:54 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so4674387e87.2
        for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 09:24:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrTEftsxbQsqFA108vs8X+i1igMx0G3qbuptzWO6BBWjPGfpb98A44qzXqNjTNxnZ6T+Cxq93wQUkuWA==@vger.kernel.org
X-Received: by 2002:a05:6512:e88:b0:539:fb49:c47a with SMTP id
 2adb3069b0e04-53d862be63fmr7008281e87.4.1731345893812; Mon, 11 Nov 2024
 09:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111075000.111509-1-charles.goodix@gmail.com> <20241111075000.111509-3-charles.goodix@gmail.com>
In-Reply-To: <20241111075000.111509-3-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Nov 2024 09:24:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKU2Wwfwg1EACYgJtUKJjYH2OOQn6ELXbBK=B-jzbTZQ@mail.gmail.com>
Message-ID: <CAD=FV=WKU2Wwfwg1EACYgJtUKJjYH2OOQn6ELXbBK=B-jzbTZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] HID: hid-goodix: Add OF supports
To: Charles Wang <charles.goodix@gmail.com>
Cc: robh@kernel.org, krzk@kernel.org, hbarnor@chromium.org, 
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 10, 2024 at 11:50=E2=80=AFPM Charles Wang <charles.goodix@gmail=
.com> wrote:
>
> This patch introduces the following changes:
> - Adds OF match table.
> - Hardcodes hid-report-addr in the driver rather than fetching it
>   from the device property.
>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  drivers/hid/hid-goodix-spi.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
> index 6ae2300a6..80c0288a3 100644
> --- a/drivers/hid/hid-goodix-spi.c
> +++ b/drivers/hid/hid-goodix-spi.c
> @@ -20,6 +20,7 @@
>  #define GOODIX_HID_REPORT_DESC_ADDR    0x105AA
>  #define GOODIX_HID_SIGN_ADDR           0x10D32
>  #define GOODIX_HID_CMD_ADDR            0x10364
> +#define GOODIX_HID_REPORT_ADDR         0x22C8C
>
>  #define GOODIX_HID_GET_REPORT_CMD      0x02
>  #define GOODIX_HID_SET_REPORT_CMD      0x03
> @@ -701,12 +702,7 @@ static int goodix_spi_probe(struct spi_device *spi)
>                 return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
>                                      "failed to request reset gpio\n");
>
> -       error =3D device_property_read_u32(dev, "goodix,hid-report-addr",
> -                                        &ts->hid_report_addr);
> -       if (error)
> -               return dev_err_probe(dev, error,
> -                                    "failed get hid report addr\n");
> -
> +       ts->hid_report_addr =3D GOODIX_HID_REPORT_ADDR;
>         error =3D goodix_dev_confirm(ts);
>         if (error)
>                 return error;
> @@ -790,6 +786,14 @@ static const struct acpi_device_id goodix_spi_acpi_m=
atch[] =3D {
>  MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
>  #endif
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id goodix_spi_of_match[] =3D {
> +       { .compatible =3D "goodix,gt7986u-spifw", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, goodix_spi_of_match);
> +#endif
> +
>  static const struct spi_device_id goodix_spi_ids[] =3D {
>         { "gt7986u" },
>         { },
> @@ -800,6 +804,7 @@ static struct spi_driver goodix_spi_driver =3D {
>         .driver =3D {
>                 .name =3D "goodix-spi-hid",
>                 .acpi_match_table =3D ACPI_PTR(goodix_spi_acpi_match),
> +               .of_match_table =3D of_match_ptr(goodix_spi_of_match),

I can never quite remember what the current preference is in regards
to "OF" tables (whether to use #ifdef like you've done or mark them
`__maybe_unused`), so maybe someone will request you change it. ...but
IMO what you have is fine and looks to be properly guarded with
of_match_ptr(). As far as I'm concerned, this patch looks OK.

Oh, I guess the one "nit" is that I would have put "spi" in the
subject, making it "HID: hid-goodix-spi: Add OF supports". It might be
worth sending a v5 for that (after waiting a day or two) unless a
maintainer tells you not to.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

