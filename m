Return-Path: <linux-input+bounces-17120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C0D25B63
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 17:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93B50301B74C
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B835287503;
	Thu, 15 Jan 2026 16:21:51 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9EA23B63C
	for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494111; cv=none; b=Spf/QZyV48D2t+YkXyKcUmZ/UiFen7rvHN8yxNKJN5cJe0BK6aWGOFAmsQV/MJaHh8BDA7luMqV9j/M5wMwH9EAuj+ojNVkouywSZJXD4G2x6P7btsEMlSOpEMG4algKWO+wvihDbm/07kIytOua747xwhuzZijYctSXwdTkbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494111; c=relaxed/simple;
	bh=hitHd2IIQqesxEsJnpDWb44stsIjIR62E9k/vG2AAV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOTtQ8MOULvE+vPwbSNdm+WVwxLT7I5trbKuyIOnf9Pf9M8X0yuh65uZwAX6DPMNDNLA1eMUxmZhlgvi59WcO8kbaR9SXdZU/TauFTS7on0IY4MYoBRdvsd7vWl8glD55VPnDDJi07HMzjOAhHNGo0cZoak/Zdm1ZbB8TDsH2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b6a66f155so490097e0c.3
        for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 08:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494108; x=1769098908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRbj20xJBk8ykfBXjY0ZjfkbgaBRPnB6+tkn0mmWYmw=;
        b=rZi6/7c6iHxRkn+CG/ooi6OjWo+SUwrS1/6A4DQ9gAYLYeaxuMYxeQUbrs+NaWXSsK
         c17iE+YzB2j9CwR47n7ZVYCNl8J4OnsA+LrUyI8Km67UwurDfeUME6CnOT+CiyZf7sQV
         hCezJbEaxOjC3PqOuYeN7HFOSqkyUl7MPRHxafLIEUKYAkHTGnkrxWBNd99gZgrKurkw
         GbrVK9AMBzIkm2VLT0Phxm+WaXEaOcvhwvqjQc/geXa7i/M0OIIc4k3IJFkU/A3eH+HN
         D3EGxwZxYdkAE6hKVa700YCizsk0igR0pN1Xe7d1YVZ3TP9H+kN2X94tHqBRE/AsRzRJ
         IX/g==
X-Gm-Message-State: AOJu0YwfyKsc80iXaREFTp639ZaN0hTAg3Xbg5dx0deAJAW/zmguV49T
	Bv+ouUVywW/nB1b6NSjbvZoTG3UcU9pmmnBIwYFREkhy4o1hfnv7wAjlseJDwLnhCGE=
X-Gm-Gg: AY/fxX4YX33OEg0wxl1ZNcjJYB+nvY0th/8gvqsneNPOwz3+wbHiTH+x53RHRBGwAPU
	PSZLfDy2E173u6I1NcZZ0sMIuSuItzFupzc/0nc7IaAYkXDVEOd6GM8f7F0p7X2mukv6qczooRS
	M464WrnZJvaw4xQMg+b3x4RBqpH1KPv4MU0ifXsKCCqr7Gt7jbXzbtneA6Kz8Kq5sFYR4uqmmdO
	k1SRN5bX7S7+7rqsjxpqlUZXrZ74+CbDCQnsx/pvBhZ5+mf/TUeOg97rcK1W2Pn15d3eBbxhTiq
	IBc9UrZdDVGKMJHhO2O7eoimEo4PsTmlXIXjaHRzzrIs8IBHP94wJ1WDbhRrcZ+GyEXTxLjHhLS
	kAlsmTHCgeQxqqnKSB5bghhepaAaQHM7kkyVoApdfpG99fUSLQ4nuPqWZf+INIrRNABRsM9w4R7
	Findiyf97D2xaZ1RwpsA9mFV0rCXn5RllrXpUNVaeCv5Xb+WOMoSRD
X-Received: by 2002:a05:6122:1789:b0:55b:305b:4e35 with SMTP id 71dfb90a1353d-563b5cee37emr191441e0c.21.1768494108353;
        Thu, 15 Jan 2026 08:21:48 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563995311fbsm7689187e0c.11.2026.01.15.08.21.47
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 08:21:48 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5634feea416so832550e0c.2
        for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 08:21:47 -0800 (PST)
X-Received: by 2002:a05:6122:4589:b0:556:9cb9:65cd with SMTP id
 71dfb90a1353d-563b5bc906bmr213478e0c.6.1768494107680; Thu, 15 Jan 2026
 08:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org> <20260115161858.20226-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115161858.20226-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 17:21:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUd9TNWixxEYjEdOVLoR982tn4jgZXEnWKhnUTObYXuZQ@mail.gmail.com>
X-Gm-Features: AZwV_QiAnYTQRClR1ygbi92hWJ4Px5AfRbcO4422KM0HMSiCwiA5sOF5jHCdcfA
Message-ID: <CAMuHMdUd9TNWixxEYjEdOVLoR982tn4jgZXEnWKhnUTObYXuZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Input: ili210x - convert to dev_err_probe()
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 15 Jan 2026 at 17:19, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -942,15 +942,11 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>         chip = device_get_match_data(dev);
>         if (!chip && id)
>                 chip = (const struct ili2xxx_chip *)id->driver_data;
> -       if (!chip) {
> -               dev_err(&client->dev, "unknown device model\n");
> -               return -ENODEV;
> -       }
> +       if (!chip)
> +               return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
>
> -       if (client->irq <= 0) {
> -               dev_err(dev, "No IRQ!\n");
> -               return -EINVAL;
> -       }
> +       if (client->irq <= 0)
> +               dev_err_probe(dev, -EINVAL, "No IRQ!\n");

Missing return.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

