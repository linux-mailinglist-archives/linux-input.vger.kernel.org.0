Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EF5611B68
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 22:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiJ1UKi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 16:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiJ1UKf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 16:10:35 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513B43B979;
        Fri, 28 Oct 2022 13:10:14 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id r18so5720562pgr.12;
        Fri, 28 Oct 2022 13:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iBZo/dC6Q+wzhKtQTU3L9ZaF2Ionm1WRsDT9YBpa+v4=;
        b=HHgnF2o76kVgjWHDEvsyd4pt+m4CEWY6TJyfGzouGmxQhaqpaUo4TlBRwKT5oyCZ9Q
         LQU+MNHbJBf9ZCeXGiVlO7xVcnePGEI6msSjHnqPEqFr4rIJnycFJci5T/bNDJHpxJ8X
         HT+rnD6u2SgZdr9lpoiu4YJ3aCzQllFGR9T9q00IyubQrEGtC/7q4VcvGb9cl73w/w+E
         ziSj+ViVR9kZ0Z4E7SpjF/74TCQBh8ssbF2UefHi8CN+rGl1yX0t1YExnLU7Cj2GFQ30
         FqbEKeWTtmvBS0lgd0d7jpTcPNkSKT4ubrn+Bn18NwJtEIB6LglvOMEp3CLAchCYFvLm
         6myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBZo/dC6Q+wzhKtQTU3L9ZaF2Ionm1WRsDT9YBpa+v4=;
        b=IqcCGPtPRUXPc5yn11M1cMFAEzxN/Q//LVRxaN2yuOo1exC4eZVg9iiOpYviJ0DPL1
         iPH+LnCHStKTR2uEuB60zcbuWMsyjoOw/la2M+it7bPlIG0bI7NZM+IeHhhNC1sLOwCX
         l2C4czypySuiZ69UyzHJxPtMuMKxUpnjqfvZwQ3i89RYmUb6CC0osx0RCFkYzrBtsIBS
         EjjKGVJqaVeCZJkZZPzV6RJ17fTD7tscx2x7lLXPb2PbDLfDjVo/x1yk1QR0Eg+rpbwx
         uc6j6CE5XAvNg6WBOv8IB1yFhALhUt54ceqIEWJ3aj2JpHebozcdndgBE+JqfaoCFWpT
         K9tQ==
X-Gm-Message-State: ACrzQf0lEA0ucZGvjGlmUKfzzcu0Do8jLk5ewlx6+TICwkHaHqX7qgKG
        LBmUzAQt+0FJHgT+/8EqG9w=
X-Google-Smtp-Source: AMsMyM6YSVyP0C6lt5etyLKbRx3bv0C6jh4sqOTHVjcTTF8i+MafKMFEPfFVg7i56XZsRJZSDQ+vhQ==
X-Received: by 2002:aa7:888b:0:b0:563:aa1:adae with SMTP id z11-20020aa7888b000000b005630aa1adaemr852470pfe.15.1666987813673;
        Fri, 28 Oct 2022 13:10:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea9a:801b:ed52:2db1])
        by smtp.gmail.com with ESMTPSA id m5-20020a170902bb8500b00186a8beec78sm3453919pls.52.2022.10.28.13.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:10:12 -0700 (PDT)
Date:   Fri, 28 Oct 2022 13:10:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v3 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <Y1w3IZniJ/4otMDX@google.com>
References: <20221010153522.17503-1-macroalpha82@gmail.com>
 <20221010153522.17503-4-macroalpha82@gmail.com>
 <87sfjhp9f6.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfjhp9f6.fsf@baylibre.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 21, 2022 at 03:56:29PM +0200, Mattijs Korpershoek wrote:
> Hi Chris,
> 
> Thank you for your patch.
> 
> On Mon, Oct 10, 2022 at 10:35, Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add support for the Hynitron cst3xx controller found on devices such
> > as the Anbernic RG353P and RG353V (the Hynitron CST340). This driver
> > was built from sources provided by Hynitron to Anbernic (possibly
> > via Rockchip as an intermediary) and marked as GPLv2 in the code.
> > This driver was written strictly for the cst3xx series, but in
> > most places was left somewhat generic so support could be easily
> > added to other devices in the future.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/input/touchscreen/Kconfig           |  12 +
> >  drivers/input/touchscreen/Makefile          |   1 +
> >  drivers/input/touchscreen/hynitron_cstxxx.c | 508 ++++++++++++++++++++
> >  3 files changed, 521 insertions(+)
> >  create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c
> >
> > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> > index 2d70c945b20a..9a9528e59c36 100644
> > --- a/drivers/input/touchscreen/Kconfig
> > +++ b/drivers/input/touchscreen/Kconfig
> > @@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called hycon-hy46xx.
> >  
> > +config TOUCHSCREEN_HYNITRON_CSTXXX
> > +	tristate "Hynitron touchscreen support"
> > +	depends on I2C
> 
> Since we include linux/of.h, I think we should also add:
> depends on OF

I think the driver should easily work on a non-OF system (ACPI for
example). Including OF is fine, but I'd rather we did not use
of_device.h and instead used device_get_match_data() from property.h

Thanks.

-- 
Dmitry
