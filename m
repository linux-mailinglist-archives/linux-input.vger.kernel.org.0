Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A102253837
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgHZTXD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:23:03 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45975 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgHZTXC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:23:02 -0400
Received: by mail-ed1-f67.google.com with SMTP id i17so1228367edx.12;
        Wed, 26 Aug 2020 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YoSbFEE6WxawXijyPOSjl6BnMKpo5u+32xWA9EukxUc=;
        b=eDkd129y5p8wfoSExAwj4DezugO6ajkHBYeJA8JjXkf9Pk3or28D89ZBRliielkvlZ
         o/EoAtOjrSt5MuX+1XoXw8OmzZu8cdnDvKiWAQykLceLtAxZ6h0TDTZLyM2BAKvYBQ/O
         WbdrK/m1aAV8LvbBY4s1N+Bwv1J9C2VUDOr9/VKSUb2we+4DwpeGc3WA9shf7to0IqPX
         NvwAZ01udl/4qtNou0KMP1y3WXgrTzHKp6PjgEsRePFrt6Cusr+J421Jcew4iM9pzgg9
         raiCOF07Yvi+NMyBtibhff66N26Z1JdmRSOeBqHIjhp1vdH0Lzmc2X1YCioLtNCoc7Tu
         714w==
X-Gm-Message-State: AOAM533ZfAezDHFmI1WtZJFqawzTS3zCbCbAYCldT3HixtT9TeBdQ5zj
        zHeNfehOgxMtO0sB/cRpewA=
X-Google-Smtp-Source: ABdhPJx8/pzC23/MfkOErm5NZndYQOVvm0SrUDOipckwuovfnOyFr2pW/5b6DcISQkKxPM6zKPgt0g==
X-Received: by 2002:a05:6402:1591:: with SMTP id c17mr16230169edv.111.1598469780133;
        Wed, 26 Aug 2020 12:23:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id b9sm940428edw.93.2020.08.26.12.22.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 12:22:59 -0700 (PDT)
Date:   Wed, 26 Aug 2020 21:22:56 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
Message-ID: <20200826192256.GA14739@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-2-krzk@kernel.org>
 <20200826191334.GX1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826191334.GX1891694@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 10:13:34PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 08:16:44PM +0200, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> > --- a/drivers/input/keyboard/gpio_keys.c
> > +++ b/drivers/input/keyboard/gpio_keys.c
> > @@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
> >  				 */
> >  				bdata->gpiod = NULL;
> 
> gpiod_get_optional()?
> Do not see much context though (but please double check your series for these
> kind of things).

It would fit except it is devm_fwnode_gpiod_get() which does not have
optional yet.

I can add it although the scope of the patch grows from simple
defer-path-simplification.

Thanks for the feedback.

Best regards,
Krzysztof
