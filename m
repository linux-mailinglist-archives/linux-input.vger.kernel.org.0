Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D1F8805D
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 18:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfHIQmG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 12:42:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40994 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIQmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 12:42:05 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so45016597pls.8;
        Fri, 09 Aug 2019 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JnZVScFHj49Q6mVwXwHRDa06slZcxFKU/u8dKS6qv3U=;
        b=gZap4cizFksLhuhlSXNfjHyuWri7R5fq/RDPKUNfHl4H1uXMUcwT4g/gq+Zc6KAz2U
         Wb8YGMed0dYLRJD2x6kKyKu58j4AhXCNE4DJVEcH8YerlzyJLe5ctVo6K7m74hJd3hot
         ICDE0hdJsieXP+cWUOsD/Pw2rL4e31PEw9XyK66erdrCzbMASqzR4mi3B3dlduaDpsbM
         Dm7aBbGVzTg76VIpNZ0T0ilj50VvFffaaLfxQT5X51HfknXvR9wpUGKsg4bN0TjOLkH+
         MafLqyKvxnzLyT5MviR5TQ/U1aXJ2r7Yp6DLQrGdxznAcaVTaNI/5Orc5p1oHGCyTv7b
         4oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JnZVScFHj49Q6mVwXwHRDa06slZcxFKU/u8dKS6qv3U=;
        b=CoPrYZZbAM5kwfsTcToCEXlwchZLMQxpIWSf43pu14oQ64UABkZVwgNWSVfldL5u6X
         CcrgvNSHtz98V/FYqlQhcjkhHRk498BGikUQMeJtsjXAS3lEGDbCgKRznl3u5OVE0q2Y
         UFUuOQOdCp+WzjwbpvqYbUsSCJuWydvzBvFqbLGiIGevLGJ3oM6TJeN3J6lCHrd9Tr/3
         MTCnxcydI4r2JmeAglXue8+Wi7rzwIb3QNkBfKNBcq7gOYRQbW/sGlDyQyAOdoFPlBHB
         xDLdrJ8XiEZKeOXKLQUBYminwH3ImdbRDqixWk3SoGtoeyMuC0O5fqp+MGMOpZ5vlOWW
         d/qg==
X-Gm-Message-State: APjAAAWRJ6jIP013MBDFK3naKsIleEYZjdO64OuOD2nUxlfWmEe1ysTn
        XABzAozl+vrRWO88FElkxCCH/FJA
X-Google-Smtp-Source: APXvYqzlrdORmNU54S0PFkAQjfK5Zn9oi/8vuzGrQxuKFN5VFWTzx1h16N4MHvoyzLenAwfE2leeRw==
X-Received: by 2002:a17:902:2baa:: with SMTP id l39mr20073867plb.280.1565368924178;
        Fri, 09 Aug 2019 09:42:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d189sm4370551pfd.165.2019.08.09.09.42.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 09:42:03 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:42:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: ads7846 - add support for general touchscreen
 bindings
Message-ID: <20190809164200.GJ178933@dtor-ws>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327133927.1340-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 27, 2019 at 02:39:27PM +0100, Marco Felsch wrote:
> A few vendor specific bindings are now covered by common bindings.
> 
> Let the driver parse the common bindings to make use of common
> inverting and swapping mechnism. Aslo make use of
> touchscreen_report_pos() to ensure the correct inverting-swapping
> order.
> 
> The vendor specific properties are used as default (backward
> compatibility) and gets overwritten by common bindings.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

> ---
>  drivers/input/touchscreen/ads7846.c | 38 +++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index 5a7a8425d619..2fe3b91f1db8 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -23,6 +23,7 @@
>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/input.h>
> +#include <linux/input/touchscreen.h>
>  #include <linux/interrupt.h>
>  #include <linux/slab.h>
>  #include <linux/pm.h>
> @@ -132,6 +133,8 @@ struct ads7846 {
>  
>  	u16			penirq_recheck_delay_usecs;
>  
> +	struct touchscreen_properties core_prop;
> +
>  	struct mutex		lock;
>  	bool			stopped;	/* P: lock */
>  	bool			disabled;	/* P: lock */
> @@ -826,17 +829,13 @@ static void ads7846_report_state(struct ads7846 *ts)
>  	if (Rt) {
>  		struct input_dev *input = ts->input;
>  
> -		if (ts->swap_xy)
> -			swap(x, y);
> -
>  		if (!ts->pendown) {
>  			input_report_key(input, BTN_TOUCH, 1);
>  			ts->pendown = true;
>  			dev_vdbg(&ts->spi->dev, "DOWN\n");
>  		}
>  
> -		input_report_abs(input, ABS_X, x);
> -		input_report_abs(input, ABS_Y, y);
> +		touchscreen_report_pos(input, &ts->core_prop, x, y, false);
>  		input_report_abs(input, ABS_PRESSURE, ts->pressure_max - Rt);
>  
>  		input_sync(input);
> @@ -1188,6 +1187,7 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
>  	struct ads7846_platform_data *pdata;
>  	struct device_node *node = dev->of_node;
>  	const struct of_device_id *match;
> +	u32 value;
>  
>  	if (!node) {
>  		dev_err(dev, "Device does not have associated DT data\n");
> @@ -1226,10 +1226,18 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
>  	of_property_read_u16(node, "ti,x-max", &pdata->x_max);
>  	of_property_read_u16(node, "ti,y-max", &pdata->y_max);
>  
> +	/*
> +	 * touchscreen-max-pressure gets parsed during
> +	 * touchscreen_parse_properties()
> +	 */
>  	of_property_read_u16(node, "ti,pressure-min", &pdata->pressure_min);
> +	if (!of_property_read_u32(node, "touchscreen-min-pressure", &value))
> +		pdata->pressure_min = (u16) value;
>  	of_property_read_u16(node, "ti,pressure-max", &pdata->pressure_max);
>  
>  	of_property_read_u16(node, "ti,debounce-max", &pdata->debounce_max);
> +	if (!of_property_read_u32(node, "touchscreen-average-samples", &value))
> +		pdata->debounce_max = (u16) value;
>  	of_property_read_u16(node, "ti,debounce-tol", &pdata->debounce_tol);
>  	of_property_read_u16(node, "ti,debounce-rep", &pdata->debounce_rep);
>  
> @@ -1314,10 +1322,7 @@ static int ads7846_probe(struct spi_device *spi)
>  	ts->model = pdata->model ? : 7846;
>  	ts->vref_delay_usecs = pdata->vref_delay_usecs ? : 100;
>  	ts->x_plate_ohms = pdata->x_plate_ohms ? : 400;
> -	ts->pressure_max = pdata->pressure_max ? : ~0;
> -
>  	ts->vref_mv = pdata->vref_mv;
> -	ts->swap_xy = pdata->swap_xy;
>  
>  	if (pdata->filter != NULL) {
>  		if (pdata->filter_init != NULL) {
> @@ -1368,6 +1373,23 @@ static int ads7846_probe(struct spi_device *spi)
>  	input_set_abs_params(input_dev, ABS_PRESSURE,
>  			pdata->pressure_min, pdata->pressure_max, 0, 0);
>  
> +	/*
> +	 * Parse common framework properties. Must be done here to ensure the
> +	 * correct behaviour in case of using the legacy vendor bindings. The
> +	 * general binding value overrides the vendor specific one.
> +	 */
> +	touchscreen_parse_properties(ts->input, false, &ts->core_prop);
> +	ts->pressure_max = input_abs_get_max(input_dev, ABS_PRESSURE) ? : ~0;
> +
> +	/*
> +	 * Check if legacy ti,swap-xy binding is used instead of
> +	 * touchscreen-swapped-x-y
> +	 */
> +	if (!ts->core_prop.swap_x_y && pdata->swap_xy) {
> +		swap(input_dev->absinfo[ABS_X], input_dev->absinfo[ABS_Y]);
> +		ts->core_prop.swap_x_y = true;
> +	}
> +
>  	ads7846_setup_spi_msg(ts, pdata);
>  
>  	ts->reg = regulator_get(&spi->dev, "vcc");
> -- 
> 2.20.1
> 

-- 
Dmitry
