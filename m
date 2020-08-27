Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F48254D31
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 20:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgH0Skm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 14:40:42 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44793 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0Skj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 14:40:39 -0400
Received: by mail-ej1-f67.google.com with SMTP id bo3so8996454ejb.11;
        Thu, 27 Aug 2020 11:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oDVzVcv1GncA1A9GcBvmV28MulHRr/qR43lfCwrJOTA=;
        b=M6z8y26Nrts5BQkTq1yXho7eO88kxt2CmOnsnGfCnXW5zJ7dVDwUQxoa7h8Bq1VgH4
         QW/vIgWiR5yWlElzh1IJsS+dnnHm4RKn6EnmGHeBSfIk5m4tAAG2k1sb8b+HcjERXdc0
         CQN1Y7x/spgc5YW39lGWPYKxJ/fx3dp6NXBZcsmmMQlD3Kkm7CptSoqScYbYNDnx7bAP
         sDBPjAq3zhNFnpYml29u1XGc8cm3GUnXV0sG8aaYePJmB/n+G+1Mx2eKCDpj3GM+JKGg
         cIEUmfK0hBPE21Sit7lx7VkNHeMUQmJCx2BIzb6TwD/82xjnwle8YWo3PkmdtADRZEoK
         hLvA==
X-Gm-Message-State: AOAM531YZJdbcnOvKefqKv8iCxAYDqKcbq1Q4CTEc/Qvp88u2skOeyan
        Ngan8bIW5N8iilqQ+KZ3ToqSx8i8WZvkwQfD
X-Google-Smtp-Source: ABdhPJzQQrQizKXpDDhYdOaCPsxpZIWrNGdEeJeRidRKKnvdNVG6McNFLXQexn76rx0LV0wDSyWK6A==
X-Received: by 2002:a17:906:1351:: with SMTP id x17mr21236951ejb.528.1598553636707;
        Thu, 27 Aug 2020 11:40:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id m4sm2609458ejn.31.2020.08.27.11.40.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 11:40:36 -0700 (PDT)
Date:   Thu, 27 Aug 2020 20:40:33 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 04/24] Input: gpio-vibra - Simplify with dev_err_probe()
Message-ID: <20200827184033.GA6196@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-4-krzk@kernel.org>
 <CAHp75Vey_w7m4TZM9+=df-FMO6YW5DiSMQsupZsMb92Awg_x1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75Vey_w7m4TZM9+=df-FMO6YW5DiSMQsupZsMb92Awg_x1Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 12:03:52PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 9:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> >         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> >         err = PTR_ERR_OR_ZERO(vibrator->vcc);
> > -       if (err) {
> > -               if (err != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev, "Failed to request regulator: %d\n",
> > -                               err);
> > -               return err;
> > -       }
> > +       if (err)
> > +               return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");
> 
> Can it be rather
>   if (IS_ERR())
>     return dev_err_probe(dev, PTR_ERR());
> w/o err be involved?

Good point.

Best regards,
Krzysztof
