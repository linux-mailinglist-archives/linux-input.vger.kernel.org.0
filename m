Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B461440540
	for <lists+linux-input@lfdr.de>; Sat, 30 Oct 2021 00:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhJ2WGE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 18:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhJ2WGD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 18:06:03 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D82C061570;
        Fri, 29 Oct 2021 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=oXpheV6aWkS+8lL5uEEzklnzS1V0HmKPeToiG0EuwnQ=; b=yqG8QZRcMN0bAxJ2kAZy1loRkA
        hW8gIF9wdHAH1IxNQmm1+lgzlf+lGFClJiSaI1AK5v9q+HABnhdfJNP2G6AcZn40ofAOmrpKekn92
        Tz2SGSQHS31pBCAhETTA1bX3jGlOeaee0ZojMWFGDk13428TG2kErYo9peBe716JFjh+KiatKLutM
        rMwFJaN5vsCDoi4RztA76nz9cltmfJqtDhrGZw3sqAkw3OoDzJieuCk59/I5pEIX4xLy65yhyncNY
        WTYxqqNG6EW57EZ3ZIIz2Pa13piNsN/aDPLGiPeV3SXaM6HB5YUSxOOiyXLvE8TVU9howsSumdbFR
        UOMZ4Rdw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgZy9-00CQVv-Io; Fri, 29 Oct 2021 22:03:25 +0000
Subject: Re: [PATCH 2/5] drivers/input/joystick: sensehat: Raspberry Pi Sense
 HAT joystick driver
To:     Charles Mirabile <cmirabil@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Serge Schneider <serge@raspberrypi.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>,
        linux-rpi-kernel@lists.infradead.org, fedora-rpi@googlegroups.com,
        Mwesigwa Guma <mguma@redhat.com>,
        Joel Savitz <jsavitz@redhat.com>
References: <20211029215516.801593-1-cmirabil@redhat.com>
 <20211029215516.801593-3-cmirabil@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <45c2b206-bc7b-ac73-4d3e-d18160b1e333@infradead.org>
Date:   Fri, 29 Oct 2021 15:03:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029215516.801593-3-cmirabil@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/29/21 2:55 PM, Charles Mirabile wrote:
> This patch implements support for the joystick.
> It supports left/right/up/down/enter and is
> attached via i2c and a gpio pin for irq.
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Mwesigwa Guma <mguma@redhat.com>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
>   drivers/input/joystick/Kconfig             |   8 ++
>   drivers/input/joystick/Makefile            |   1 +
>   drivers/input/joystick/sensehat-joystick.c | 135 +++++++++++++++++++++
>   3 files changed, 144 insertions(+)
>   create mode 100644 drivers/input/joystick/sensehat-joystick.c
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 3b23078bc7b5..d2f78353b74c 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -399,4 +399,12 @@ config JOYSTICK_N64
>   	  Say Y here if you want enable support for the four
>   	  built-in controller ports on the Nintendo 64 console.
>   
> +config JOYSTICK_SENSEHAT
> +	tristate "Raspberry Pi Sense HAT joystick"
> +	depends on GPIOLIB && INPUT

I think also:
	depends on I2C

since this one:

> +	select MFD_SENSEHAT_CORE

also depends on I2C and 'select' does not follow any
dependency chains.

Same comment applies to patch 3/5 for SENSEHAT_DISPLAY.

> +
> +	help
> +	  This is the joystick driver for the Raspberry Pi Sense HAT
> +
>   endif


-- 
~Randy
