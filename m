Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FD4221C02
	for <lists+linux-input@lfdr.de>; Thu, 16 Jul 2020 07:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgGPFjQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jul 2020 01:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgGPFjQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jul 2020 01:39:16 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E600C061755;
        Wed, 15 Jul 2020 22:39:16 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so4266615pge.12;
        Wed, 15 Jul 2020 22:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mkDB3tdwP3ZrecyeuZ2HihfaUMSWIkxJsdLLCDHoVsk=;
        b=MzrX8p2+gdJ26geWwsRzsyc0TF1UDznhbV5hI3aNqJhCu+rv8D1lKeKroazYErM4Sd
         cbOOoWcsUBFoB3Lm8E36OV/EgQSKd4A46hXps+vvRDZpwmSYb+SEWgtMnGv5aDuUf0sV
         WQRvkBJOm0V1jt04PRm2tFazIHX3Vv6vjn6KHQDyrLVx1/2siRWXPafm8dRVTByOVMwZ
         +if5MKet5U72+VLkpezzfCIabqc6L3fdUV7OsKNG8fFLxJz9viafaRhnVhiuLnvGnEaf
         ZyV008Sw985wDIC9S+W6p6VAWmT3X4kypQC2HLrekV6PJnNslW6szh/7I25dOycUWUCH
         nAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mkDB3tdwP3ZrecyeuZ2HihfaUMSWIkxJsdLLCDHoVsk=;
        b=EqrbyXOs5V+2xvO1848aRsMBItZe4brO5Tt9cjddR8WKBJUEU3gIK5HQdPnhgcAQtw
         +tH34PHhe+WLzpDib7r9lYxjN8qgbF4yEkkmggn7S1TXs2nt26c3CTP45fSZy4UPbe5f
         4abfKdN8pgVh+038QA/5kFErdzx7ds6MWb4ljkPFryl3XhzqM1GdoSK03oRBt1nPH8/0
         T2Vw8wIPqeWoyBPIxGXbYpFH19kBErNPkM78dlnQGPFEbfDPwM4i7nNF1uVE2mM/yjJ4
         u52p50uCXxPwHUEplVz4CyNrpOOR0ToY4d514N3vlZfoIOJrr4YHqTZTEN8Jph8QXbYf
         V7dg==
X-Gm-Message-State: AOAM532BBonFQvcJH0Ftf3t/MMiGdAejziMHzsjOfXo+xAohMpoaeFkj
        Lxf0mUoxsLa2Tn55KWLQ6JY=
X-Google-Smtp-Source: ABdhPJz11bQpBPtDJEqYJOrjjIBcv+c6JOeKl8NgT+dN8p0yn3yWvlKdnfhGAPVVfM+3P+lRTsMXXQ==
X-Received: by 2002:aa7:9241:: with SMTP id 1mr2442967pfp.188.1594877955324;
        Wed, 15 Jul 2020 22:39:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b82sm3576371pfb.215.2020.07.15.22.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 22:39:14 -0700 (PDT)
Date:   Wed, 15 Jul 2020 22:39:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jingle Wu <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw,
        kai.heng.feng@canonical.com
Subject: Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related function
 for page sizes 128, 512 bytes.
Message-ID: <20200716053912.GB1665100@dtor-ws>
References: <20200714105641.15151-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714105641.15151-1-jingle.wu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Tue, Jul 14, 2020 at 06:56:41AM -0400, Jingle Wu wrote:
> +	if (!iap)
> +		cmd = ETP_I2C_FW_VERSION_CMD;
> +	else if (pattern_ver == 0)
> +		cmd = ETP_I2C_IAP_VERSION_CMD_OLD;

Just to confirm, the older devices (I assume that pattern 0 means older)
have version command that is numerically higher than the one for the
newer (pattern >= 1) devices?

> +	else
> +		cmd = ETP_I2C_IAP_VERSION_CMD;
>  
> -	error = elan_i2c_read_cmd(client,
> -				  iap ? ETP_I2C_IAP_VERSION_CMD :
> -					ETP_I2C_FW_VERSION_CMD,
> -				  val);
> +	error = elan_i2c_read_cmd(client, cmd, val);
>  	if (error) {
>  		dev_err(&client->dev, "failed to get %s version: %d\n",
>  			iap ? "IAP" : "FW", error);
>  		return error;
>  	}
>  
> -	if (pattern_ver == 0x01)
> +	if (pattern_ver >= 0x01)
>  		*version = iap ? val[1] : val[0];
>  	else
>  		*version = val[0];
> @@ -298,7 +316,7 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	if (pattern_ver == 0x01) {
> +	if (pattern_ver >= 0x01) {
>  		error = elan_i2c_read_cmd(client, ETP_I2C_IC_TYPE_CMD, val);
>  		if (error) {
>  			dev_err(&client->dev, "failed to get ic type: %d\n",
> @@ -324,7 +342,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
>  			return error;
>  		}
>  		*version = val[0];
> -		*ic_type = val[1];
> +
> +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD, val);
> +		if (error) {
> +			dev_err(&client->dev, "failed to get ic type: %d\n",
> +				error);
> +			return error;
> +		}

Could you please tell me why this chunk is needed?

Thanks.

-- 
Dmitry
