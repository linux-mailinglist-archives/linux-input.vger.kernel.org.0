Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20BC6400F76
	for <lists+linux-input@lfdr.de>; Sun,  5 Sep 2021 14:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237804AbhIEMEG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Sep 2021 08:04:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:34214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237703AbhIEMEF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Sep 2021 08:04:05 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3231660249;
        Sun,  5 Sep 2021 12:02:55 +0000 (UTC)
Date:   Sun, 5 Sep 2021 13:06:18 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, bcousson@baylibre.com,
        Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Ryan Barnett <ryan.barnett@collins.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Reeder <jreeder@ti.com>
Subject: Re: [PATCH v2 11/46] mfd: ti_am335x_tscadc: Ensure a balanced
 number of node get/put
Message-ID: <20210905130618.4f682c8d@jic23-huawei>
In-Reply-To: <20210902215144.507243-12-miquel.raynal@bootlin.com>
References: <20210902215144.507243-1-miquel.raynal@bootlin.com>
        <20210902215144.507243-12-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu,  2 Sep 2021 23:51:09 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> of_node_put() should be called after a successful of_get_child_by_name().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
I suppose you 'could' move this to the front of the series as a fix, but
it's probably not critical so fine to keep it here.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/mfd/ti_am335x_tscadc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
> index 858bd22c60f0..763bbc33fc3f 100644
> --- a/drivers/mfd/ti_am335x_tscadc.c
> +++ b/drivers/mfd/ti_am335x_tscadc.c
> @@ -134,6 +134,7 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
>  	node = of_get_child_by_name(pdev->dev.of_node, "tsc");
>  	of_property_read_u32(node, "ti,wires", &tsc_wires);
>  	of_property_read_u32(node, "ti,coordiante-readouts", &readouts);
> +	of_node_put(node);
>  
>  	node = of_get_child_by_name(pdev->dev.of_node, "adc");
>  	of_property_for_each_u32(node, "ti,adc-channels", prop, cur, val) {
> @@ -141,10 +142,13 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
>  		if (val > 7) {
>  			dev_err(&pdev->dev, " PIN numbers are 0..7 (not %d)\n",
>  				val);
> +			of_node_put(node);
>  			return -EINVAL;
>  		}
>  	}
>  
> +	of_node_put(node);
> +
>  	total_channels = tsc_wires + adc_channels;
>  	if (total_channels > 8) {
>  		dev_err(&pdev->dev, "Number of i/p channels more than 8\n");

