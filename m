Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B0D2D704C
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 07:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395534AbgLKGjO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 01:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389193AbgLKGiq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 01:38:46 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E727FC0613CF;
        Thu, 10 Dec 2020 22:38:05 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id r4so4101077pls.11;
        Thu, 10 Dec 2020 22:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IJn2NRnZ0htSfMKlDgbHkXiJqMLXOt5jVJuVSPBUT64=;
        b=eQbli3ygPRwDfXaOXZF67v4aJtTRF30JLr9F9Tl2mSghOY78nJiO3ibIk+MntnFAzE
         J5YHAhRCWjJ2zXa977npJbCRK7zZoOT+BDu5+a/bp8bgCRfCEqOERdKQCbe4CmXUgdSJ
         x3cF3fUJzzg2BO7vuuKIDsLj+frRO787CX+4jkowDnk8ZVq68zyXFhcXNL9hGmad/BBK
         mB5UpgnU2+mceImJ/LfxXT8tMtJBQRZh9mFhrUTJVL1YlnHeER2rBTh6K1Ve4t+Hcg5L
         LExlUg24xLsPLyMd+qvbyh8YTEu+9eZ5ACZiavTpxPMxONQelDmgbaI00kmBWjtUegWz
         f1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IJn2NRnZ0htSfMKlDgbHkXiJqMLXOt5jVJuVSPBUT64=;
        b=raEVOzTzNIC72PUYwLznip1X2S4qcvd2AFXm3EDQkjJN+fYvWZGZRX1aJmkcqbEj7X
         9J9IJMopyREnkXyS6RmYmfN5cMFfPpPeTzS1Aigc30piiIpizEMfkBqqHBfUNNTGXCjm
         Qfd3w4oWISQ93XhKDENispLOpFzT56q7DPzxyg4gw/QXt232yZpA5AwfP47QIqugtwSm
         uIfkxekuudm5dExkzBYT+7q8efdzCg4siYMrd37/xxNXM2yi7Lum9pBpyLWs5O2moCyQ
         4QbLj9t4F4XovOGqETwyUYx+G4Z29vERds1atdiyLe+yf00DQQkIJ+zQJcR0gNm66kFM
         k6SA==
X-Gm-Message-State: AOAM531Ymhb36cWtDuXe9BrjUvxq0PLWrPIfm8UHYVR9ujDUEBi8+bVk
        32aOOZhlv3QAEavujm0ccH4=
X-Google-Smtp-Source: ABdhPJwX0IF28Epz+bShVNIN0dR8vBODX1Qk2ntn+46/Bq3+55EkW9s1+ZwwPJenWRsAUPe/RyCgng==
X-Received: by 2002:a17:902:6b4a:b029:d8:d13d:14f with SMTP id g10-20020a1709026b4ab02900d8d13d014fmr9659742plt.24.1607668685371;
        Thu, 10 Dec 2020 22:38:05 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y23sm9104582pfc.178.2020.12.10.22.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 22:38:04 -0800 (PST)
Date:   Thu, 10 Dec 2020 22:38:02 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] input/rmi4: simplify the return expression of
 rmi_driver_of_probe()
Message-ID: <X9MTyoZTLISShiMh@google.com>
References: <20201210140024.1665-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210140024.1665-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 10, 2020 at 10:00:24PM +0800, Zheng Yongjun wrote:
> Simplify the return expression.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/input/rmi4/rmi_driver.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> index 258d5fe3d395..eec5d926da25 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -991,14 +991,8 @@ static int rmi_driver_remove(struct device *dev)
>  static int rmi_driver_of_probe(struct device *dev,
>  				struct rmi_device_platform_data *pdata)
>  {
> -	int retval;
> -
> -	retval = rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
> +	return rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
>  					"syna,reset-delay-ms", 1);
> -	if (retval)
> -		return retval;
> -
> -	return 0;

The idea of this function is to potentially handle several device
properties, so I would prefer leaving it as is.

Thanks.

-- 
Dmitry
