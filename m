Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4244317D2
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 13:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhJRLta (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 07:49:30 -0400
Received: from mail-vk1-f171.google.com ([209.85.221.171]:39899 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhJRLt3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 07:49:29 -0400
Received: by mail-vk1-f171.google.com with SMTP id m199so8424689vka.6;
        Mon, 18 Oct 2021 04:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=41YRmB8CyGiXEaoxvPxP09LoXDT5L6K5fs5InVZb2qU=;
        b=XsGkoxlmSHLwFYZJo9VU1fjYRlyet/3xi8lSQtC3n8eju67gvoZuxebLvcZjHCXBoj
         ufip/IID23FwxrX6PdN6fFK4gqTzJ1ct+xAQ8Tu+Vq0X1ivftIMBCwNPcGy5jbEQ5T+q
         Rhja/FWN/AcypEXSFH45wQP29lGWfCCLW0ZCtiKcpgMjYJwVoZIrtR9tt2H5nx4EiDOo
         p2Sgo+hsla5odNhW4I3M6V9UcmLa8nDmARVqJiOTxEk3Hrjl4T27nz2sQFxcCXzoMw7G
         JWyyjlgBS9SI+G6SOtOsMmq41Lu1USJF/odnhRO/vNvyQ6IY4x7nd+5HF5MqcbQaZ4Xa
         FeSQ==
X-Gm-Message-State: AOAM531ysDB/ySyuxLNm8LU5U+E1Hkmm0pDHtjTyyGSTUrRkloKdqCQx
        Djfh3NV0mfjgFvNrmiPt1XDFE4HcWRZbaA==
X-Google-Smtp-Source: ABdhPJyy8zH6WVMdUXUcggK3HuF5v4WrQ0Yz8JSmRg0bP+qMuX7mt/0HYMfA3j0gFglOtaoscMhMyQ==
X-Received: by 2002:a1f:9d09:: with SMTP id g9mr23884849vke.4.1634557638286;
        Mon, 18 Oct 2021 04:47:18 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id v3sm8754913vkv.19.2021.10.18.04.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:47:17 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 34so8396071vkl.13;
        Mon, 18 Oct 2021 04:47:17 -0700 (PDT)
X-Received: by 2002:a05:6122:d05:: with SMTP id az5mr7503109vkb.19.1634557637704;
 Mon, 18 Oct 2021 04:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <f1728883a5bf4481eb1d45e7b7a71005e29e259a.1632467859.git.geert+renesas@glider.be>
 <YWpkYWCFMtR40A6m@google.com>
In-Reply-To: <YWpkYWCFMtR40A6m@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Oct 2021 13:47:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+-_xPiR+wsUOqyprV8-A8151b35ej7nXdHJwGMGSoPw@mail.gmail.com>
Message-ID: <CAMuHMdV+-_xPiR+wsUOqyprV8-A8151b35ej7nXdHJwGMGSoPw@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio-keys - print button label in IRQ button error messages
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sat, Oct 16, 2021 at 7:34 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Sep 24, 2021 at 09:18:02AM +0200, Geert Uytterhoeven wrote:
> > When an error message related to IRQ buttons is printed, no clue is
> > given about the actual button that caused the failure.  Fix this by
> > including the button label, to make it more obvious which button has an
> > incomplete or incorrect hardware description.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/input/keyboard/gpio_keys.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> > index 0f2250c6aa4978d5..fc706918d7b103cb 100644
> > --- a/drivers/input/keyboard/gpio_keys.c
> > +++ b/drivers/input/keyboard/gpio_keys.c
> > @@ -617,14 +617,16 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
> >               }
> >       } else {
> >               if (!button->irq) {
> > -                     dev_err(dev, "Found button without gpio or irq\n");
> > +                     dev_err(dev, "Found button %s without gpio or irq\n",
> > +                             desc);
>
> I do not believe description is mandatory, so we may end up printing
> "gpio_keys" here. I wonder if it would not be more reliable to print the
> index of the problematic key?

The description (label) is indeed not mandatory, so without that it is
as good as before ;-)

For the index, I'm wondering if the iteration order is unambiguous,
and cannot change?

So perhaps we want to print both ("button %u (%s)")?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
