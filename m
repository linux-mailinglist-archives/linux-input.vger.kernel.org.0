Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C462D70C6
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 08:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390720AbgLKHW7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 02:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391921AbgLKHWx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 02:22:53 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D045C0613CF;
        Thu, 10 Dec 2020 23:22:13 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id s21so6437472pfu.13;
        Thu, 10 Dec 2020 23:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=x15/E2zxfoWyB0nURKVzZoQUKE+qXLh9tvP9NzX5GI4=;
        b=mzEcW4nir0OhQR8urUJ5UvH0WeSCQzEIHoiFp1NJpmRibRB3zug+aRa4AQwaiCQiTH
         46OBlicq1vMa/MjFIGLH9QJETDEdezpGAmPNaAjGrh2HCcjCfXxFImGil76NAJI3YSJG
         xGv0w7RduqqdluYAYWjy92JSxDdGzYYEeYJs9EduN2m/9eT6aDq0FWMXcp914g8V8wFt
         l0PRTnVEz2DzagtNStR6qIRU3yAXuftjkbvCu7ZpXZTD/ltUIGYmwl+Y2iWRNK09lEEr
         O+22smj8u8ZgAhYO+LVHIDe0Y92iMEKoY4wTtY6g724Pc/rRQe7D5ie4eZ87ycUg+8OG
         LLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x15/E2zxfoWyB0nURKVzZoQUKE+qXLh9tvP9NzX5GI4=;
        b=jtvpSQTescgHjskaP21TbwUr7+t6XygHDsdcxZiS+UAeCKycU1wBjX7sbS138+hOos
         fQa8i44tNcCt6yeacMLRQouEwsYUvcck8Ut/+8hTEy5QNMGqvyRiWcNgPbhbxyOJQsim
         UMPi+dGTUKLMzLmJxkuhDeJ719PHdPDUbFfvUT2LAhyLZpRfYdQrIm0+MEByVXWcd9zN
         vVB3bhQN+vMduJBF2U+AMK5k/pPgLbBnu1lkQhy6wSoCbFY/4Vke6p9mvp6gCR2wDXnP
         HORlDmJXRlInC5636Sc0O7G1yWlshEMiCjyTo6c9JBRQEp1HDIR52qBA+MwZaxWZMBru
         gPbA==
X-Gm-Message-State: AOAM5321x9wFHWK1Hg1hpA4xra3uiURSAhwdMnokXe/m0WeWuZFgkJXz
        R76CWsXT99CHEDHX3KegQVo=
X-Google-Smtp-Source: ABdhPJzdPZHX6fs6c9ONKRXmAVqyQgmshu98KkmMEAbEYABevukbtYFWDIfkR9UfRvCNOa52Bz5uIw==
X-Received: by 2002:a62:37c4:0:b029:197:bfa9:2078 with SMTP id e187-20020a6237c40000b0290197bfa92078mr10298961pfa.15.1607671332468;
        Thu, 10 Dec 2020 23:22:12 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z5sm8315119pgv.53.2020.12.10.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 23:22:11 -0800 (PST)
Date:   Thu, 10 Dec 2020 23:22:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 3/4] input: elants: read touchscreen size for
 EKTF3624
Message-ID: <X9MeISZqBcvcnYXe@google.com>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <fa6a0e3f95803d6eab39cd0e3ba188842274a1e0.1607669375.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa6a0e3f95803d6eab39cd0e3ba188842274a1e0.1607669375.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michał,

On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
> +
> +	if (!phy_x || !phy_y) {
> +		dev_warn(&client->dev,
> +			 "invalid size data: %d x %d mm\n",
> +			 phy_x, phy_y);
> +		return 0;

Given we are not treating this as hard error mind dropping this "return"
and making the below an "else" branch?

> +	}
> +
> +	dev_dbg(&client->dev, "phy_x=%d, phy_y=%d\n", phy_x, phy_y);
> +
> +	/* calculate resolution from size */
> +	ts->x_max = 2240-1;
> +	ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
> +
> +	ts->y_max = 1408-1;
> +	ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
> +
> +	return 0;
> +}
> +

>  
> +	if (client->dev.of_node)
> +		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);

Why don't we add EKTH3500 tag to the ACPI entry and make this
unconditional device_get_match_data()?

> +
>  	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
>  	if (IS_ERR(ts->vcc33)) {
>  		error = PTR_ERR(ts->vcc33);
> @@ -1495,7 +1568,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id elants_of_match[] = {
> -	{ .compatible = "elan,ekth3500" },
> +	{ .compatible = "elan,ekth3500", .data = (void *)EKTH3500 },
> +	{ .compatible = "elan,ektf3624", .data = (void *)EKTF3624 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, elants_of_match);
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
