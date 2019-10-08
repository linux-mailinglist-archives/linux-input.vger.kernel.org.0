Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282C1CF6C8
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 12:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbfJHKLY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 06:11:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55448 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbfJHKLY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 06:11:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98ABHaq088138;
        Tue, 8 Oct 2019 05:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570529477;
        bh=9CLnw9a03P/vES/zPGGSAns8+cUndEmimpUWId7qn0g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=A2eUToM4NmDV+T4iLWH/T84XdaHocS4YNOKsuNwKmr4esXeMZ2qaCHY4q8jF1LEw0
         uUY+9MG3NyAK+EDJejzrVENPpLzLpLokw9/sVXx8K7pQ04J2tg5/e8OARWLSodGS1l
         1Ht+DdC9A4KiAm2ApbvZkmf6owB+6QOYDHFXTGM0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98ABHM0036608
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 05:11:17 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 05:11:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 05:11:14 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98ABFxR125225;
        Tue, 8 Oct 2019 05:11:16 -0500
Subject: Re: [PATCH 1/5] Input: pixcir_i2c_ts - Remove unneeded gpio.h header
 file
To:     Fabio Estevam <festevam@gmail.com>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <jcbian@pixcir.com.cn>
References: <20191007121607.12545-1-festevam@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <ce6d29b1-1a7c-9fa4-da07-1b1d8c2a0efa@ti.com>
Date:   Tue, 8 Oct 2019 13:11:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007121607.12545-1-festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 07/10/2019 15:16, Fabio Estevam wrote:
> The touchscreen device is a GPIO consumer, not a GPIO controller,
> so there is no need to include <linux/gpio.h>.
> 
> Remove the unneeded header file.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

For all 5 patches,

Reviewed-by: Roger Quadros <rogerq@ti.com>

> ---
>   drivers/input/touchscreen/pixcir_i2c_ts.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
> index e146dfa257b1..4561d65e7a1e 100644
> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
> @@ -13,7 +13,6 @@
>   #include <linux/input.h>
>   #include <linux/input/mt.h>
>   #include <linux/input/touchscreen.h>
> -#include <linux/gpio.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/of_device.h>
>   #include <linux/platform_data/pixcir_i2c_ts.h>
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
