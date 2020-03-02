Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6DDB1759B2
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgCBLp1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:45:27 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41195 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbgCBLp0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:45:26 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B8F08C000A;
        Mon,  2 Mar 2020 11:45:24 +0000 (UTC)
Message-ID: <5835e5f3c2a5e1ed525f0aaa4dbcac581fa47afc.camel@hadess.net>
Subject: Re: [PATCH v2] Input: goodix: fix touch coordinates on Cube I15-TC
From:   Bastien Nocera <hadess@hadess.net>
To:     "Sergei A. Trusov" <sergei.a.trusov@ya.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Date:   Mon, 02 Mar 2020 12:45:24 +0100
In-Reply-To: <e39e5cca-fec5-512f-0a33-f3dd20a33ff9@ya.ru>
References: <e39e5cca-fec5-512f-0a33-f3dd20a33ff9@ya.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2018-08-31 at 15:44 +1000, Sergei A. Trusov wrote:
> The touchscreen on the Cube I15-TC don't match the default display,
> with 0,0 touches being reported when touching at the top-right of
> the screen.
> 
> Add a quirk to invert the x coordinate.
> 
> Reported-and-tested-by: Arkadiy <arkan49@yandex.ru>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sergei A. Trusov <sergei.a.trusov@ya.ru>

Some patch queue draining/grave digging. Sorry for taking so long to
get back to you.


If that still applies, please add my:

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
> 
> Changes in v2:
>  - Commit message fix
>  - Removed extra linefeeds
> 
>  drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index f2d9c2c41885..27adf216f230 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -145,6 +145,22 @@ static const struct dmi_system_id
> rotated_screen[] = {
>  	{}
>  };
>  
> +/*
> + * Those tablets have their x coordinate inverted
> + */
> +static const struct dmi_system_id inverted_x_screen[] = {
> +#if defined(CONFIG_DMI) && defined(CONFIG_X86)
> +	{
> +		.ident = "Cube I15-TC",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Cube"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
> +		},
> +	},
> +#endif
> +	{}
> +};
> +
>  /**
>   * goodix_i2c_read - read data from a register of the i2c slave
> device.
>   *
> @@ -709,6 +725,12 @@ static int goodix_configure_dev(struct
> goodix_ts_data *ts)
>  			"Applying '180 degrees rotated screen'
> quirk\n");
>  	}
>  
> +	if (dmi_check_system(inverted_x_screen)) {
> +		ts->prop.invert_x = true;
> +		dev_dbg(&ts->client->dev,
> +			"Applying 'inverted x screen' quirk\n");
> +	}
> +
>  	error = input_mt_init_slots(ts->input_dev, ts->max_touch_num,
>  				    INPUT_MT_DIRECT |
> INPUT_MT_DROP_UNUSED);
>  	if (error) {

