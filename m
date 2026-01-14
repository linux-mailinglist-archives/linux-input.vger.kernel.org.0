Return-Path: <linux-input+bounces-17093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52586D1E61E
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 12:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EC173028FF0
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 11:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAACB38A9AA;
	Wed, 14 Jan 2026 11:25:37 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937092F12A5
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768389937; cv=none; b=Tvtk31SPrlFyhk6hdCSDCOl1hWF9+pniieCAwnY2uI92wosGJbJaHYjzKLck1I+Xo7/b0pYBZUFGLMw9w095ZV4W/mw5FehNkqpBJtyW55KdscLvihNcRgX+/75b2fObUgUlgm0DJk1ScS/8s0LqFADdP6iNM8YItSMo7j+nVbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768389937; c=relaxed/simple;
	bh=CiDHpss1hVeyB4RZ3H82ibrygcnDTVOy55OV2SWKALE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uC6EIckCvNqQoCP2Kv1N+ZhrzDP3eu/L8+NEieH3nqI0yDetZUyUU7F7TIigpU/nnL1D+7aU1XvvtxIw9hpQam4JZaqjLAhi8mVrCT3kbDLAg9RuAZ4mKfh6QM3tRQLb4VCPxi9oEkrzlLYjd1u27GPyYT9g9YtaPCz9+oT2RgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-121a0bcd376so7336472c88.0
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 03:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768389936; x=1768994736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlUeVi88PIKWMzTWAKceP+tOAwQMJqEvuH7YKzydUAQ=;
        b=DulvbVboVqKcegk4+X2dr22wFbZ8LUh6u7Ct90804JiQtkvfu0hTfc/Kvm/35Uf3rY
         lAiVgT445Pf+t4ENpLwmCs1pvbIF4LzVUhM73pPNCu1qmqQo6M4k9DPwMzYue55X4bCp
         8dhtL8xb2u3fmQhvUkkrxFpdMpBfB3FTyJ3Bp/Z7o7ZLvvnsgVwxDNIVSjz3vInAgzcC
         knFlAn8WF5TuSqMr4tXWygbBHuiS4zoD97QqEKGsMNVjeWlUlNTmqWP4tv8s1I3HMVQu
         RLWFowSSgtYmr8EyFOTPB9ngGp3UKZ6uALNcsAa4v3ZoaoPY4T8Cd9Vch4sG+Bo63jUv
         Sz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2UpK3IYc8MaYxShAIUWM64PgbZJi6AeyJ3uznCzAgoUbUkmT0xvXRlopPWU5IRcAoHtxZYBHtq967VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi2R7Su4iKgIM+89dvsDCEb/Uc9e28W7T8dzuST8q86/Z8Aa5B
	QCIKN61kO/3BTDg6AEzP27eSCvygclfPLptLuM4RWVY7i7wotAe3RdgorLpmUDiN
X-Gm-Gg: AY/fxX6/3sPT0SN2iwdOkUlOimEG5cS8zfiXiEqbkxd4RTJt/jdHa1mSvMfgcbYf2sM
	b/EyoFPE4QbbaA2Vj9nNx2z03e0ZN3QheAtwai3zXsoVSi0ibrO0+QWHeZz6NhQ4oYtjAuSdX9W
	fsVRbQARwlDdbflDZbc3/5hvxbvFMbZvEysimxGQB7qE7B3HYCybebhLFU4RQlJb77pr88DXPCE
	s5+oDSzxY6KRPfro1i1+mdvPyrsd8TYsjI4LMmY6JODgdFUiysCLnvSO/m6WR5CCx/mmophEIX0
	akziTGsffXLrD9h7Lay9V5hcPdoAm7odGHG6n1WKH9P4JSX8fi1DverE3Ho3FfonIeQWRIsfGIX
	UWgJSSfXtZ5hrRUPHiT+xoUbTQ+5Rg+dQ5W95C5FQaGctaNQKhERpxFNZYaB4luGYTN48Us2A0/
	YijeSIe0STC2hrF6t326DTOtHZiCBTzfsr201uyhRsVhK/u3P2
X-Received: by 2002:a05:6102:80a0:b0:5ef:a390:58fb with SMTP id ada2fe7eead31-5f17f6302d7mr712740137.31.1768383446989;
        Wed, 14 Jan 2026 01:37:26 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm22702990137.11.2026.01.14.01.37.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:37:26 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-943d0cafe77so2768999241.3
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 01:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOTBeuN4Y8OIQjhcG5Icf7Xr6X8g0IGksnmSdzVAvJ/3ghiwioTIZYg5Rm+ianF233kHH8GeqldC9WvA==@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:5ed:bc1:823a with SMTP id
 ada2fe7eead31-5f17f6592aemr793700137.33.1768383446392; Wed, 14 Jan 2026
 01:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
 <20260112234534.225954-2-marek.vasut+renesas@mailbox.org> <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
In-Reply-To: <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 10:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXb3-EFy8WA9FTAqvyYHaF4nGch60bUQ6bbKu6Dzbh6YQ@mail.gmail.com>
X-Gm-Features: AZwV_QixtfIM8YCIiXj7v0fzbdqd9QL-Kw8ynN88vc69gt7t-8CBMGxLdXH8t2o
Message-ID: <CAMuHMdXb3-EFy8WA9FTAqvyYHaF4nGch60bUQ6bbKu6Dzbh6YQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add support for polling mode
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-input@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Tue, 13 Jan 2026 at 17:41, Frank Li <Frank.li@nxp.com> wrote:
> On Tue, Jan 13, 2026 at 12:44:57AM +0100, Marek Vasut wrote:
> > There are designs incorporating Ilitek ILI2xxx touch controller that
> > do not connect interrupt pin, for example Waveshare 13.3" DSI display.
> > To support such systems use polling mode for the input device when I2C
> > client does not have interrupt assigned to it.
> >
> > Factor out ili210x_firmware_update_noirq() to allow conditional scoped
> > guard around this code. The scoped guard has to be applied only in case
> > the IRQ line is connected, and not applied otherwise.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c

> > @@ -1003,12 +1027,24 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> >               return error;
> >       }
> >
> > -     error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> > -                                       IRQF_ONESHOT, client->name, priv);
> > -     if (error) {
> > -             dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> > -                     error);
> > -             return error;
> > +     input_set_drvdata(input, priv);
> > +
> > +     if (client->irq) {
>
> 0 is validated irq number
>
> https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L284

Not anymore ;-)

https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L299

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

