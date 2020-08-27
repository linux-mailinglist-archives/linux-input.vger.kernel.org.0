Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32488254D3A
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 20:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgH0Slo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 14:41:44 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:43082 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0Slo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 14:41:44 -0400
Received: by mail-ej1-f66.google.com with SMTP id m22so8993770eje.10;
        Thu, 27 Aug 2020 11:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ax6LGCiUmSw6MKcxCSVlqCa9MowaOxKPyFGXWHlS6hM=;
        b=rgsta2SdiAZ3Udxv6ulDO3o19cHY4Fu/EWczPVCToJUxNIBXqn6/irl0zjE+/gJPq+
         Nj0Eq9Qu2w6V3bkkvc0ynZjaQuwsOp4OjYHg4J16rW0XLZbLtoX6J3RpyB0AqlcpDXag
         fXKJsMYeEt8Db/RVV01IMkuTplv1lOd3fm0bv2igMaXMLs45kzn0R/bqOwhzIG6NomoA
         RJPiWIr9mbYeiRS8i+YHh8vyZEgpJ88xWHa/wYXRvJn4ry8RT/OuV6XqI/d1R8gGgbO7
         gC8uxjGIzx37D6pw82/b+M27jy642QOlbgssExh1uY60C8UTAF22zsPxJcC5sx/iyE5Y
         wzUA==
X-Gm-Message-State: AOAM533BeaTSQVSrp5hdfp5rsupPvWlU7J5I+1TfZjLfTQ2v0MYdakEa
        9HRmNX6FK8M2IpkhN+9Aavw=
X-Google-Smtp-Source: ABdhPJxi9owINqZhQhD/JlP4gUZYT7WL7sqV3wP9DCcgCXLMxmSr6ptNGSi/qDxN4Re/s+iJUaT2jQ==
X-Received: by 2002:a17:906:b2c3:: with SMTP id cf3mr23389786ejb.387.1598553702433;
        Thu, 27 Aug 2020 11:41:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id j10sm2263699ejf.116.2020.08.27.11.41.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 11:41:41 -0700 (PDT)
Date:   Thu, 27 Aug 2020 20:41:39 +0200
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
Subject: Re: [PATCH 09/24] Input: bu21013_ts - Simplify with dev_err_probe()
Message-ID: <20200827184139.GC6196@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-9-krzk@kernel.org>
 <CAHp75VevroOYYYBnCAHUqhkkeYcAHLrSwnT3wnxj1Mc4k8sfng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VevroOYYYBnCAHUqhkkeYcAHLrSwnT3wnxj1Mc4k8sfng@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 12:10:38PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 9:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> >         ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> >         error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
> 
> > +       if (error)
> > +               return dev_err_probe(&client->dev, error, "failed to get CS GPIO\n");
> > +
> 
> if (IS_ERR())
>  return ... PTR_ERR()...

Indeed.

Best regards,
Krzysztof

