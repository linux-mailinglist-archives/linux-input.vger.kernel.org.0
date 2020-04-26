Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828D21B8C77
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDZFK5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZFK5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:10:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCBBC061A0C;
        Sat, 25 Apr 2020 22:10:57 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ms17so5883164pjb.0;
        Sat, 25 Apr 2020 22:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dGOXYNUtGWFSvGEk6fEuFq7c+3+hAT6RDQ7QZDx0K2w=;
        b=L9zKbVNtn9GO8FVuER5Gcn7JNwUgaVP4JZNRgSmVmlgMzjVDv9QbLkPvArufOFxJJL
         +hRypfTxJFVz1h93ULHpjRt0gfkipIcE7aP+OlWmcWJPe7Q2Zii7vdlQ7pf1B5qrlXD9
         2J01KLm4/AKcD8XY0dm8ZI43etbsW5kMxKEskjQusJazF7Gm8gavAsioFyqQzb6ggdGc
         6IHVBcOwQZBXG9bwqehGX5CQqeAiwuSo6kUUBpOdp1j/u4Ieyh2ffoRmM+uPUv2Q/ebO
         52dU08VNbNO4ec78nIcUrhLKvCKkkF00vwKlhMHRcBMsQOxlr8dVSc0+bgNSUjfZU5X1
         LA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dGOXYNUtGWFSvGEk6fEuFq7c+3+hAT6RDQ7QZDx0K2w=;
        b=H39TIJQroHHrtXb3q26yW7KVoDeWcdHq8KMbpnsMZs8kr15G8XLQx93t+ndRmGEPKq
         bTQopG5WjMgNhJcptI7768xrGgnjgL/FTYkCBWBGSPj+IsErSJqzLB9+j+Lyvq6lFWnd
         EWmfqyD9DNbf4E+ONNVDGZ3RKxTeijboYaa01c48GUo3+6AV57dzLD2HGaTy2YGrH05j
         UwLSikcW8906ObvJEddmErqLstYdTXiFWxAk5QxWp5qnW3ugLY5ILD9+ay3MqhYth8eC
         L5Gtk3U0dAHjRzv69RYQiMzKIbMSSmDyomrsMYLVwzzaPsuKy9QyyPR2L0dZED5TtyEm
         I/BQ==
X-Gm-Message-State: AGi0PuavCaXWBPv2yhk3lwnEUoSwhD3ly0HG+TIzidlkDsJplVWyK2rb
        KHcYAQBJhtkA7zmiejmow74=
X-Google-Smtp-Source: APiQypJDimzFhMPWLs6OHtpXqlRtRBJVOWxFLiVTTdODzYID5Y2p5BCNGdXROhN6V5ZQdB2FkeY7LQ==
X-Received: by 2002:a17:90a:dd45:: with SMTP id u5mr15569393pjv.19.1587877856420;
        Sat, 25 Apr 2020 22:10:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 198sm9475248pfa.87.2020.04.25.22.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 22:10:56 -0700 (PDT)
Date:   Sat, 25 Apr 2020 22:10:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] input: elants: read touchscreen size for EKTF3624
Message-ID: <20200426051053.GP125362@dtor-ws>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <d9cbc59382496172555bcbbb4044813b60534374.1586784389.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9cbc59382496172555bcbbb4044813b60534374.1586784389.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 03:32:25PM +0200, Michał Mirosław wrote:
> EKTF3624 as present in Asus TF300T tablet has touchscreen size encoded
> in different registers.

Is this property of chip or property of the device? Johnny, I really
need your input here.

Thanks.

> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 82 ++++++++++++++++++++++++--
>  1 file changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index b0f083f7f2a9..2b936e920874 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -34,7 +34,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
>  #include <linux/acpi.h>
> -#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <asm/unaligned.h>
> @@ -42,6 +42,10 @@
>  /* Device, Driver information */
>  #define DEVICE_NAME	"elants_i2c"
>  
> +/* Device IDs */
> +#define EKTH3500	0
> +#define EKTF3624	1
> +
>  /* Convert from rows or columns into resolution */
>  #define ELAN_TS_RESOLUTION(n, m)   (((n) - 1) * (m))
>  
> @@ -164,6 +168,7 @@ struct elants_data {
>  
>  	bool wake_irq_enabled;
>  	bool keep_power_in_suspend;
> +	u8 chip_id;
>  
>  	/* Must be last to be used for DMA operations */
>  	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
> @@ -442,7 +447,58 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
>  	return 0;
>  }
>  
> -static int elants_i2c_query_ts_info(struct elants_data *ts)
> +static int elants_i2c_query_ts_info_ektf(struct elants_data *ts)
> +{
> +	struct i2c_client *client = ts->client;
> +	int error;
> +	u8 resp[4];
> +	u16 phy_x, phy_y;
> +	const u8 get_xres_cmd[] = {
> +		CMD_HEADER_READ, E_INFO_X_RES, 0x00, 0x00
> +	};
> +	const u8 get_yres_cmd[] = {
> +		CMD_HEADER_READ, E_INFO_Y_RES, 0x00, 0x00
> +	};
> +
> +	/* Get X/Y size in mm */
> +	error = elants_i2c_execute_command(client, get_xres_cmd,
> +					   sizeof(get_xres_cmd),
> +					   resp, sizeof(resp), 1,
> +					   "get X size");
> +	if (error)
> +		return error;
> +
> +	phy_x = resp[2] | ((resp[3] & 0xF0) << 4);
> +
> +	error = elants_i2c_execute_command(client, get_yres_cmd,
> +					   sizeof(get_yres_cmd),
> +					   resp, sizeof(resp), 1,
> +					   "get Y size");
> +	if (error)
> +		return error;
> +
> +	phy_y = resp[2] | ((resp[3] & 0xF0) << 4);
> +
> +	if (!phy_x || !phy_y) {
> +		dev_warn(&client->dev,
> +			 "invalid size data: %d x %d mm\n",
> +			 phy_x, phy_y);
> +		return 0;
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
> +static int elants_i2c_query_ts_info_ekth(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
>  	int error;
> @@ -593,8 +649,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  		error = elants_i2c_query_fw_version(ts);
>  	if (!error)
>  		error = elants_i2c_query_test_version(ts);
> -	if (!error)
> -		error = elants_i2c_query_ts_info(ts);
> +
> +	switch (ts->chip_id) {
> +	case EKTH3500:
> +		if (!error)
> +			error = elants_i2c_query_ts_info_ekth(ts);
> +		break;
> +	case EKTF3624:
> +		if (!error)
> +			error = elants_i2c_query_ts_info_ektf(ts);
> +		break;
> +	default:
> +		unreachable();
> +		break;
> +	}
>  
>  	if (error)
>  		ts->iap_mode = ELAN_IAP_RECOVERY;
> @@ -1245,6 +1313,9 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	ts->client = client;
>  	i2c_set_clientdata(client, ts);
>  
> +	if (client->dev.of_node)
> +		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);
> +
>  	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
>  	if (IS_ERR(ts->vcc33)) {
>  		error = PTR_ERR(ts->vcc33);
> @@ -1470,7 +1541,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
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

-- 
Dmitry
