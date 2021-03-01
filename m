Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD7832772C
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 06:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbhCAFcT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 00:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbhCAFcP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Mar 2021 00:32:15 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2D3C061786;
        Sun, 28 Feb 2021 21:31:35 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id p5so9159693plo.4;
        Sun, 28 Feb 2021 21:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DWE2oaEcv/Vrm8DiUfdqFuMGqFu5B5IgJph0bkFVTfQ=;
        b=SVR7PDv2YJ3DG5uLeoxFl6BsZxSXMHqt858g+3/bEc7niCvw2MyT8igsFt+S8fqPEN
         aY/l+EeA5+XiAypAWrFswHGiqAHzjKFJQFKhYVyfajpdTcUTWhMoHrj07jnCDjvbKZHp
         dNHM/SL3xChH7DMmqM3A+1FkKusD8QsrP4Up/0JWKnhpGVvPwyFY5mWHEyHfCYqruCsH
         qgafyQ8YO3dSxUm7XZlCNrnJHQMU/LPoZxrTht9lcy4mNhiFlmu3jvs8jwU3nPJkLEVr
         IyqPy33D4WJSrJdNSeWH5dbVHwQXMFooSy055FMb5RQ61XRmWASv5yy2+1Sd2GTZfGAQ
         Dr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DWE2oaEcv/Vrm8DiUfdqFuMGqFu5B5IgJph0bkFVTfQ=;
        b=K7SNZzRHSRGNqQOb49ScA+KBoqSxrWzT/9Ag0wgAc2i85bKzgXeh0SyJ2IjsNHS6EA
         KE18HTi4uJpI6mgndpNiJwcyF2SlX+BJtpHZ1vnR8qfFwlF+6hJRphyaSRXQ0xYc97EZ
         6LB7DKnvfe6DaQh1OOyUvCsVN8hPD0T9gKh35jzixL06CQtMAfnIe5tZvwH8UFXBe7aj
         XIH+jdokT+Ep3D3/IVpeG4DUiSVDGxd8oIdhDkmn2ihGmKhT8aeJB4rV/bPKSSULNllq
         tI49K/xZcS93zULR/AkJsqnuprV3nM84+EnxEj9ejk8MtiHfFLNWQxV+qfd9txW4oz7t
         pyjw==
X-Gm-Message-State: AOAM532WRs4R+f690eZFUKG4NwPz/EYFNkclEM+Qo5JE2feznid/HTT2
        3iY/GmY1KyUgpYg+JcA9iT4=
X-Google-Smtp-Source: ABdhPJxPBDl5256gAoO5B9cfNTDJ3Q9Xo7MUP7YIpU/K3Hj1MsINQPvjcCK8pfVCaI9gPUJujn7Ddg==
X-Received: by 2002:a17:902:7e82:b029:e4:bba8:bb3 with SMTP id z2-20020a1709027e82b02900e4bba80bb3mr1240826pla.66.1614576694706;
        Sun, 28 Feb 2021 21:31:34 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc4a:36c8:19a:eb9e])
        by smtp.gmail.com with ESMTPSA id c6sm16692028pfc.94.2021.02.28.21.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 21:31:33 -0800 (PST)
Date:   Sun, 28 Feb 2021 21:31:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new devices
Message-ID: <YDx8M4Rhdi8hW4EO@google.com>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226073537.4926-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Fri, Feb 26, 2021 at 03:35:37PM +0800, jingle.wu wrote:
> @@ -273,10 +318,12 @@ static int __elan_initialize(struct elan_tp_data *data)
>  	bool woken_up = false;
>  	int error;
>  
> -	error = data->ops->initialize(client);
> -	if (error) {
> -		dev_err(&client->dev, "device initialize failed: %d\n", error);
> -		return error;
> +	if (!(data->quirks & ETP_QUIRK_SET_QUICK_WAKEUP_DEV)) {
> +		error = data->ops->initialize(client);
> +		if (error) {
> +			dev_err(&client->dev, "device initialize failed: %d\n", error);
> +			return error;
> +		}

So data->ops->initialize(client) essentially performs reset of the
controller (we may want to rename it even) and as far as I understand
you would want to avoid resetting the controller on newer devices,
right?

My question is how behavior of older devices differ from the new ones
(are they stay in "undefined" state at power up) and whether it is
possible to determine if controller is in operating mode. For example,
what would happen on older devices if we call elan_query_product() below
without resetting the controller?

I also think that while I can see us skipping reset in resume paths we
probably want to keep it in probe as we really do not know the state of
the device (was it powered up properly earlier, etc).

>  	}
>  
>  	error = elan_query_product(data);
> @@ -366,6 +413,8 @@ static int elan_query_device_info(struct elan_tp_data *data)
>  	if (error)
>  		return error;
>  
> +	data->quirks = elan_i2c_lookup_quirk(data->ic_type, data->product_id);
> +
>  	error = elan_get_fwinfo(data->ic_type, data->iap_version,
>  				&data->fw_validpage_count,
>  				&data->fw_signature_address,
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
