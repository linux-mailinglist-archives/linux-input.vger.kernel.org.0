Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC45543A47F
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 22:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbhJYU0L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 16:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234122AbhJYUZy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 16:25:54 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5D6C04A426;
        Mon, 25 Oct 2021 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=CsvL4v/RYNVoKdvqUcUJV/dOSJi7VMO3ULrp0raf47I=; b=Ad1wd4ZCdG3bF5K8R/GIxj9gT+
        +qc4aPpJh0nheolbsuvwq0sEwjgliRNepbViB3fgXi0kxJCP4613Dh0Vc14Efs4cBqtKxu5ta5va6
        ILmypmASyKNmhtiq2ePEgGwrbTdDSVwW4DYwBYrWsHb0LNYHpCk013UvMAlvDWZqLYLS4SMAqiBKM
        HbDZlaAL3kLoBtbPnz8CJRW5x6VSxV3icyxcWVeGePlWR7dOqFpFBtCPj42tpJWDO2IrkiBlEQeR8
        Y8lYlKad4DJauPJtmClDMTagREPFZGp7bwLxzzTNVcTmuqNRvyRAWTaWYOgRGrUKz8GuqyIj0HTO6
        mVkOhfXg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mf6Ip-00HYjn-Rb; Mon, 25 Oct 2021 20:10:39 +0000
Subject: Re: [PATCH 1/4] Input: Add driver for Cypress Generation 5
 touchscreen
To:     Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andreas@kemnade.info, alistair23@gmail.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, rydberg@bitmath.org,
        mylene.josserand@free-electrons.com,
        =?UTF-8?Q?Myl=c3=a8ne_Josserand?= <mylene.josserand@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
References: <20211025114214.44617-1-alistair@alistair23.me>
 <20211025114214.44617-2-alistair@alistair23.me>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <896cd7b2-57c8-e777-0e12-4f319c43f49e@infradead.org>
Date:   Mon, 25 Oct 2021 13:10:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025114214.44617-2-alistair@alistair23.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/25/21 4:42 AM, Alistair Francis wrote:
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index d4e74738c5a8..231cb0c1750b 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -284,6 +284,20 @@ config TOUCHSCREEN_CYTTSP4_SPI
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called cyttsp4_spi.
>   
> +config TOUCHSCREEN_CYTTSP5
> +	tristate "Cypress TrueTouch Gen5 Touchscreen Driver"
> +	depends on OF
> +	select REGMAP_I2C
> +	select CRC_ITU_T
> +	help
> +	  Driver for Parade TrueTouch Standard Product
> +	  Generation 5 touchscreen controllers.
> +	  I2C bus interface support only.
> +	  Say Y here if you have a Cypress Gen5 touchscreen.
> +	  If unsure, say N.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cyttsp5.

Hi,
Why is there no line:
	depends on I2C
here?

thanks.
-- 
~Randy
