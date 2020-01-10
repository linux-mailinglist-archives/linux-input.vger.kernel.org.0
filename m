Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21413137606
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 19:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgAJSan (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 13:30:43 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39852 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgAJSan (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 13:30:43 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so1157980plp.6;
        Fri, 10 Jan 2020 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2MLWB+VELLlq0wMcKq+XkHGiD3q/IxvQaVGfRiGmonk=;
        b=IO9T0yg4ydrb35q0ooBVnp0n7unfx9Y9Fy9zTrdT5tabhRFK8WlrTVSEPyDorq3FFa
         c6ovMoBrHzlbnGWGiGzI/TiYat0sNQAWrEbDyqXiNLyICk8mIklTlsj3Z9c2cUy6ZGNc
         3L+3vN/lDlX3iX0XhnFeZ04LFjVsZgEQpgdWWBdU5iDkJ+/MOIrtsGwB9PpQROFUU85V
         vdgfDijTDnYULmvgco5+nEfO06tZMvJkH5vDHJ/aOJfUFL/8c5ePno9s0PeJtlKEmzvh
         tcWJhuhP+LqCsVaAaI0EsFZX5cwFr6vKFCGJoUm7t8WTC2HzIxxO2cCZ+kkKbJ7m33Wt
         lEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2MLWB+VELLlq0wMcKq+XkHGiD3q/IxvQaVGfRiGmonk=;
        b=pJ501gd+NWj/eW04VUSHlOrXFS4NHz+ZiB4g8JSoXZGfufwHJDWaOTCofzEAjKqtvn
         hGasBLbB5qVpva3KOXXO8mHKLsserW6pY/qwHSpc/vMtiDg78mr1Ta771kJ1b3V3T6mk
         ZMeIQLc6Fwy6moTmE4M0S5TMNK3EIFuO6lSbSe5FiuLNQixGFqPbhs4KGHSlrapW24nc
         7LGGhUahdcntwc8bSofuLOwEy67afM0dbeUMOtPHcc9cQH2cXqe53i0wzA9HgTu2b5c1
         GzXA65QVG/HzOENuQ7gnAJcD5rYMZNFH8XP/999s6Fg7nv3jcpPTh9LIMxhB1iKZtQ5O
         F/4Q==
X-Gm-Message-State: APjAAAVYOZPWmJHJnUs2blr7yTE8PjQxnP9HhutYd5pxkeB1oXRwlAHb
        8clDH17vd8jWL7sOvrbQeUJYzwaY
X-Google-Smtp-Source: APXvYqzqeW7byawmap6bSb/B/RJacb9Z8R9ZQUQyQ5r0w7sQ9QIStqmWbjRGnG1bFtk1ZGkGfknskQ==
X-Received: by 2002:a17:902:820b:: with SMTP id x11mr5880582pln.196.1578681042024;
        Fri, 10 Jan 2020 10:30:42 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b12sm3693774pfi.157.2020.01.10.10.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 10:30:41 -0800 (PST)
Date:   Fri, 10 Jan 2020 10:30:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: sun4i-ts - add a check for
 devm_thermal_zone_of_sensor_register
Message-ID: <20200110183039.GU8314@dtor-ws>
References: <20191210091401.23388-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210091401.23388-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 10, 2019 at 05:14:01PM +0800, Chuhong Yuan wrote:
> The driver misses a check for devm_thermal_zone_of_sensor_register().
> Add a check to fix it.
> 
> Fixes: e28d0c9cd381 ("input: convert sun4i-ts to use devm_thermal_zone_of_sensor_register")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/sun4i-ts.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
> index 0af0fe8c40d7..742a7e96c1b5 100644
> --- a/drivers/input/touchscreen/sun4i-ts.c
> +++ b/drivers/input/touchscreen/sun4i-ts.c
> @@ -237,6 +237,7 @@ static int sun4i_ts_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct device *hwmon;
> +	struct thermal_zone_device *thermal;
>  	int error;
>  	u32 reg;
>  	bool ts_attached;
> @@ -355,7 +356,10 @@ static int sun4i_ts_probe(struct platform_device *pdev)
>  	if (IS_ERR(hwmon))
>  		return PTR_ERR(hwmon);
>  
> -	devm_thermal_zone_of_sensor_register(ts->dev, 0, ts, &sun4i_ts_tz_ops);
> +	thermal = devm_thermal_zone_of_sensor_register(ts->dev, 0, ts,
> +						       &sun4i_ts_tz_ops);
> +	if (IS_ERR(thermal))
> +		return PTR_ERR(thermal);
>  
>  	writel(TEMP_IRQ_EN(1), ts->base + TP_INT_FIFOC);
>  
> -- 
> 2.24.0
> 

-- 
Dmitry
