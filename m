Return-Path: <linux-input+bounces-3486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B424B8BCD70
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 14:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69E901F23F7D
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 12:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113E91422C3;
	Mon,  6 May 2024 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY1Fro45"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4323D2;
	Mon,  6 May 2024 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997193; cv=none; b=DHCIHl+RdDAECf6gE6RFqf2TrCJM+BsAyVcjYnfL9/dNLvWHSAEMj7+jSeR62GcLACFvAEQ0qolU70v11YG18rgtX7pQQCLQ359QgpFWkuv32wOaduwL+R0yPBQGS6PB2WZt8+YOxG2bWWzix1+bFvMn2iFuN9iHOnTXdip3kVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997193; c=relaxed/simple;
	bh=HA03VMTWx7hFRDjISikCd5rAe3inSqQv3U+JhT9BpIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkXH1yZstpfOr650WvxNmX/9oGWFEy8SJ4ZtjiW7JKEbm7ouDh5rNpz8/xNye8AQ67d+xCArt91nzimheWg1qLfs9H9KofDc4SRJLvxtaE190AZYXvCOJM78m5mQXzGt9PbmI3LTBxAWrrs8SyJtjPKBpxyjq5QTFAl5V1nCXSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY1Fro45; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a599a298990so464281366b.2;
        Mon, 06 May 2024 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714997189; x=1715601989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/7y05oOvga1AY6RWQLcXXp5qLqEnvKHODSbHeXVGyU=;
        b=MY1Fro45MT109KR8h4CFKw/UXXkT1iQTF42niuo58YBUxvMaDtRbKZZbMgfruxXmaY
         VvQzHECIrXViUiaTpi42n4jc0kL2xxMVRfXkXGIFztWRDeDitdt05zwgn8nZpucSxxSj
         RDOf09UhiTc7YjLfm0/WWDFHfwrxleA1Tztu6xxPdvVnJIfKusCIY2H0ptrwNC/7qR74
         85trjinFv53Qgh+XjUiaE9k8uWtKhrdt8VxhgbgsA4e0LZ9oLVESS/1hoqSFcovdypEy
         7k0YpIvI1wt6Wj5SFXC6IpHVngB2s/7woRmKs5JUXdqNGA39asX06lY4fQHmnlXZr61N
         Kzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997189; x=1715601989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/7y05oOvga1AY6RWQLcXXp5qLqEnvKHODSbHeXVGyU=;
        b=szvDHpeZqomSKcQ4X46OMpHSJEmMrpcmIs66g6YHO9ZlQkD9SVE0YOoq4xNT4I1gjj
         iePlqYxKKovEZWIn1Pv5kFlHLQN2/AAIaJhnCPZj2W7USMjz9v9t3UWFUfqpGowHF+Fk
         tIdPhTrcb2/z7uoBAxk1WZO3fPdFqG4xifKcwEGxdV/DsD36+2nt4yuw/AEbLtdvJb6T
         uOlLeDnIttSnMXCVEk+f5ptInLQ+ZAWCm2l0BXqWeol4Pc9TAUT7kZ55FRZAttj2iMBC
         uIjqVETm70P2pU8jfmJFmAmrcsvzET2Ce49AC1fFKVYgspOojWqBSgVld4NIlUP2b2Jf
         Oejw==
X-Forwarded-Encrypted: i=1; AJvYcCVq2lwU8X1t4JWJm9jpu+M2OS9DAcw5ZroIELUKNJsEo22QFTn7ux5cRn1LFPpvZou0g+evYSDOnq0sEyFyyDeQpwStVcQCZPpycRBjA35UxRueFPfzF7jRPr5rDD2zyhakQpD9ztd3TvnOJcK1S5T5gEtUJijMdfRjPME6bM8sI+g4Wb69
X-Gm-Message-State: AOJu0YzwC9aZUxpbXXpwPyl7uYTMsQQCdjARpTisBOMMTx4niWF4z5X1
	1F3r8SiUbGkHtVUhiP5ufYC9U+606CkaZUJ70TKXLlIzma+LFChh96tylJTqDkjM9Mm6Mt9wlhn
	1uEhNjMy8reVgOdsv2FRrZAogzXQ=
X-Google-Smtp-Source: AGHT+IHYOQvdfPTTFrBUuHnnjBKaOyDGpkO8KwvWSje/sq7Hj4iOQq8UdxFrfB58gd/0Nlr4haiivWWz7SMhit2xpHg=
X-Received: by 2002:a17:906:5482:b0:a55:a072:1ab8 with SMTP id
 r2-20020a170906548200b00a55a0721ab8mr6220034ejo.27.1714997188685; Mon, 06 May
 2024 05:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505214754.891700-1-andreas@kemnade.info> <20240505214754.891700-4-andreas@kemnade.info>
In-Reply-To: <20240505214754.891700-4-andreas@kemnade.info>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 15:05:52 +0300
Message-ID: <CAHp75Vdnwrxw96prr9hyLdZ2u6t1uNcj6pyxCp52UoVOpatTpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Input: ektf2127 - add ektf2232 support
To: Andreas Kemnade <andreas@kemnade.info>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@pengutronix.de, hdegoede@redhat.com, 
	siebren.vroegindeweij@hotmail.com, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:48=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> The chip is similar, but has status bits at different positions,
> so use the correct bits.

...

> @@ -46,6 +47,11 @@ struct ektf2127_ts {
>         struct input_dev *input;
>         struct gpio_desc *power_gpios;
>         struct touchscreen_properties prop;
> +       int status_shift;
> +};
> +
> +struct ektf2127_i2c_chip_data {
> +       int status_shift;
>  };
>
>  static void ektf2127_parse_coordinates(const u8 *buf, unsigned int touch=
_count,

I'm wondering if you are using --histogram diff algo when preparing the pat=
ches.

...

> +       chip_data =3D device_get_match_data(&client->dev);
> +       if (!chip_data)
> +               chip_data =3D (const struct ektf2127_i2c_chip_data *)id->=
driver_data;
> +       if (!chip_data) {
> +               dev_err(&client->dev, "missing chip data\n");
> +               return -EINVAL;

First of all, there is a special combined API for this, please use it
instead. Second, use dev_err_probe().

> +       }

...

>  #ifdef CONFIG_OF

Side note: Ideally we should kill this ugliness. But it can be done later o=
n.


--
With Best Regards,
Andy Shevchenko

