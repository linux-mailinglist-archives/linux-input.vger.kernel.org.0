Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A91B7C3FC
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 15:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbfGaNtl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 09:49:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46699 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbfGaNtl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 09:49:41 -0400
Received: by mail-pl1-f196.google.com with SMTP id c2so30493625plz.13;
        Wed, 31 Jul 2019 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=opJOEuBf5z8nrf90rqRO+j908pMzRnqzq5ZrkM42fSM=;
        b=m6gTq0Oe2lP6FzEyyez0/yWj61/yEz8jEvzbcVWTNvSRVZIFxdZJ6cerV2kVt7jQDK
         cdKSIife2bS2Mo6+6+GnO/nCj17l5ia//WejVgNaCB+DZfdjcyV04VEc1lz/5CiQiCym
         XJbSvtlV64ICi7Aq+a7TiEJPboQaDfOVzPBVWgj4YIFUG6Y2Wdp7mU+UvWJTqoKSoB/w
         0DIbG1aujRq2pej408Maim3fMjQ3C8fubYS6hxXV6F8GXrkqAri6q0scW65KPGNymIwe
         84cWX2CW/IZYnLzdfhlQ4PhlNe0wekOSeCHOPEeHAqKmMkjZAjJx9Nk7V4pcH/2PgCq/
         48Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=opJOEuBf5z8nrf90rqRO+j908pMzRnqzq5ZrkM42fSM=;
        b=PuedDXLhJZ53y/c4wDspmd/r5WEAT8WLWGJnXsAeZLJb4zlOfnsRKLxYT+4kgtCse2
         VY3mNfvvi230WyHwwb07p2Ub1UNNrjDu2HOYfP4IbnetOmHmsr09qNf16eVF8QCayvy0
         s0B/urJx585A8gqC9acYsYPD1XbAEJZUNJKotKO2BI7+oKNSD4sJezKseVJVGHEKNyeV
         +raReinauHLHTJ36SeEzXqFtfxu27EhqbGlLh0wHJi/EbXuH72uYS0ZnmOQAK8+ZVnIe
         8LK84uN2k2SJ1qKh+Q2T/EHLecmnTcyorxKFU/p0SKj5gRKbrOCzmyu2p9L25YPNX/Wd
         utJQ==
X-Gm-Message-State: APjAAAVHbJ7vKtWDD1cF3s+wdOednBa5AFbTUETdcJE4ScC8wPklVRGA
        DaGqAndht9b+Ajut+Mzcd7Q=
X-Google-Smtp-Source: APXvYqxTldSjNmHAee84xyYJi10KeWfdb6zUmWwUjd9rawIzMJ5XUM+aTQXYjS6EcdgZRPk/9T/INw==
X-Received: by 2002:a17:902:9a04:: with SMTP id v4mr117048224plp.95.1564580980257;
        Wed, 31 Jul 2019 06:49:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s24sm23379780pgm.3.2019.07.31.06.49.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 06:49:39 -0700 (PDT)
Date:   Wed, 31 Jul 2019 06:49:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     ronald@innovation.ch, nikolas@gnu.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: applespi - Fix build error
Message-ID: <20190731134937.GE147138@dtor-ws>
References: <20190729031455.59400-1-yuehaibing@huawei.com>
 <20190730133414.49008-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730133414.49008-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 30, 2019 at 09:34:14PM +0800, YueHaibing wrote:
> If CONFIG_KEYBOARD_APPLESPI=y but CONFIG_LEDS_CLASS=m
> building fails:
> 
> drivers/input/keyboard/applespi.o: In function `applespi_probe':
> applespi.c:(.text+0x1fcd): undefined reference to `devm_led_classdev_register_ext'
> 
> Add "depends on LEDS_CLASS" to the Konfig
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.

> ---
> v2: use 'depends on LEDS_CLASS'
> ---
>  drivers/input/keyboard/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index ebb19e2..90e8a7f 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -76,6 +76,7 @@ config KEYBOARD_APPLESPI
>  	depends on ACPI && EFI
>  	depends on SPI
>  	depends on X86 || COMPILE_TEST
> +	depends on LEDS_CLASS
>  	select CRC16
>  	help
>  	  Say Y here if you are running Linux on any Apple MacBook8,1 or later,
> -- 
> 2.7.4
> 
> 

-- 
Dmitry
