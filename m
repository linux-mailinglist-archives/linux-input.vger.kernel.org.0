Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8662538AA
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgHZT6p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:58:45 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:35138 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgHZT6m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:58:42 -0400
Received: by mail-ej1-f68.google.com with SMTP id a26so4574013ejc.2;
        Wed, 26 Aug 2020 12:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FZCtI/sENbrZHnL80khwCXX1Nrs/RKTExkULdecFZeQ=;
        b=kWie/lbXdQRSFf4wtF4EtaM+sRfV++b+7IAOutHBdhLZDtsYhpjiNdoQ/27rm7F/wY
         LFZwHD1DIvEkNFMtbBULPDeCTJKEaibPuLw6okS5oUtwP8f/UEEpvBYw6eNrpK4cCmXV
         JDIwCSpPexYoH6oUQBWiVpr3dv+GlQuYYtHDZYWuTDffIahEZp+LM75JdYjc3UDb4LpJ
         5T4lNQDDZl98NGOoQO0nb7DkXrFDMC1tXMJDLQnzH1t0jY372jKeeMS+e5zpMqNoGUXp
         lewmmaxGEy0e4QUn0x3sgnQLfuQ0K0ng74PLj5mIz3G495jlkebFzPIid+dtA0+UnxU9
         6/uw==
X-Gm-Message-State: AOAM532tzWztA2GYakzPCl4OacVh2QX5Jc/ip42nkxEGOqiHs9zL9JtC
        s9CkHPBli4WR1erazM8NixE=
X-Google-Smtp-Source: ABdhPJwnXz/m9TCB6MQbPoDK31UoxUxZDLxLD/wiYix/QXCerD0snZBOuMIT1kfbdRyCJr493L4kIA==
X-Received: by 2002:a17:906:5914:: with SMTP id h20mr13321639ejq.346.1598471920276;
        Wed, 26 Aug 2020 12:58:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id v4sm3116939eje.39.2020.08.26.12.58.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 12:58:39 -0700 (PDT)
Date:   Wed, 26 Aug 2020 21:58:37 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
Message-ID: <20200826195837.GA29590@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-2-krzk@kernel.org>
 <20200826191334.GX1891694@smile.fi.intel.com>
 <20200826192256.GA14739@kozik-lap>
 <CAHp75VcrUKN5S1HUdfzijx8xNEaA75jRAV893Khzm83i47cqgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VcrUKN5S1HUdfzijx8xNEaA75jRAV893Khzm83i47cqgA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 10:39:12PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 10:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Wed, Aug 26, 2020 at 10:13:34PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 26, 2020 at 08:16:44PM +0200, Krzysztof Kozlowski wrote:
> > > > Common pattern of handling deferred probe can be simplified with
> > > > dev_err_probe().  Less code and also it prints the error value.
> > >
> > > > --- a/drivers/input/keyboard/gpio_keys.c
> > > > +++ b/drivers/input/keyboard/gpio_keys.c
> > > > @@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
> > > >                              */
> > > >                             bdata->gpiod = NULL;
> > >
> > > gpiod_get_optional()?
> > > Do not see much context though (but please double check your series for these
> > > kind of things).
> >
> > It would fit except it is devm_fwnode_gpiod_get() which does not have
> > optional yet.
> >
> > I can add it although the scope of the patch grows from simple
> > defer-path-simplification.
> 
> No need. My comment only about existing API per individual cases. SO,
> here it's fine then.

I checked the others and I didn't see such pattern anymore.

Best regards,
Krzysztof

