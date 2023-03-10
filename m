Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411A46B52CC
	for <lists+linux-input@lfdr.de>; Fri, 10 Mar 2023 22:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjCJV0e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 16:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjCJV0c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 16:26:32 -0500
X-Greylist: delayed 392 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 10 Mar 2023 13:26:28 PST
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD094AD25
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 13:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1678483193; bh=dhzjW8+aXUX5wUaGkgyx2SXeoBzAyYJXVCsIFW+1Lk8=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=TOd08ciLutdy6F/J9iKmmHHBrYSaImphD2eOfge/FCt98Lg55pgP8Cs4ok4umi/MT
         zuqkuI/5CUYKcJy2H3UuETzltTTjwEyU+Z228FYtQxGGoUvFDbA/w6r+c2SFXeS0tf
         vRJ1bQsTgzU1wHJxnZ93vh5ZkB2OBYC2jzLPhEiI=
Date:   Fri, 10 Mar 2023 22:19:52 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To:     Jan Jasper de Kroon <jajadekroon@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] input: goodix: Add option to power off the controller
 during suspend
Message-ID: <20230310211952.6luidpglk2glqti5@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230310170026.415739-1-jajadekroon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310170026.415739-1-jajadekroon@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jan,

On Fri, Mar 10, 2023 at 06:00:26PM +0100, Jan Jasper de Kroon wrote:
> From: Ondřej Jirman <megi@xff.cz>
> 
> For whatever reason the controller is not suspended on Pinephone
> by the default procedure. It consumes quite a bit of power (~40mW)
> during system sleep, and more when the screen is touched.
> 
> Let's power off the controller during system sleep instead.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> 
> input: goodix: Don't disable regulators during suspend

I don't think you should concatenate commit messages like this.
Also what the change actually does is that it holds the controller
in reset during sleep, and doesn't try to power it off.

> It does no harm to disable them, but on Pinephone we have other
> peripherals attached to the same power supplies, whose drivers
> will not reference the regulator, so powering down the regulators
> from Goodix driver will break those other devices.
> 
> Until those drivers gain the regulator support, don't disable
> the regulators in Goodix driver.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
> ---
>  drivers/input/touchscreen/goodix.c | 23 +++++++++++++++++++++++
>  drivers/input/touchscreen/goodix.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index b348172f19c3..e6d054ede960 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1284,6 +1284,7 @@ static void goodix_disable_regulators(void *arg)
>  
>  static int goodix_ts_probe(struct i2c_client *client)
>  {
> +	struct device_node *np = client->dev.of_node;
>  	struct goodix_ts_data *ts;
>  	const char *cfg_name;
>  	int error;
> @@ -1303,6 +1304,7 @@ static int goodix_ts_probe(struct i2c_client *client)
>  	i2c_set_clientdata(client, ts);
>  	init_completion(&ts->firmware_loading_complete);
>  	ts->contact_size = GOODIX_CONTACT_SIZE;
> +	ts->poweroff_in_suspend = of_property_read_bool(np, "poweroff-in-suspend");

If you're adding a new DT property, you need to document it in the device tree
bindings of the driver.

>  	error = goodix_get_gpio_config(ts);
>  	if (error)
> @@ -1410,6 +1412,13 @@ static int goodix_suspend(struct device *dev)
>  	if (ts->load_cfg_from_disk)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  
> +	if (ts->poweroff_in_suspend) {
> +		goodix_free_irq(ts);
> +		goodix_irq_direction_output(ts, 0);
> +		gpiod_direction_output(ts->gpiod_rst, 0);
> +		return 0;
> +	}
> +
>  	/* We need gpio pins to suspend/resume */
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
>  		disable_irq(client->irq);
> @@ -1455,6 +1464,20 @@ static int goodix_resume(struct device *dev)
>  	u8 config_ver;
>  	int error;
>  
> +	if (ts->poweroff_in_suspend) {
> +		error = goodix_reset(ts);
> +		if (error) {
> +			dev_err(dev, "Controller reset failed.\n");
> +			return error;
> +		}
> +
> +		error = goodix_request_irq(ts);
> +		if (error)
> +			return error;
> +
> +		return 0;
> +	}
> +
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
>  		enable_irq(client->irq);
>  		return 0;
> diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
> index 87797cc88b32..dc358bcda698 100644
> --- a/drivers/input/touchscreen/goodix.h
> +++ b/drivers/input/touchscreen/goodix.h
> @@ -104,6 +104,7 @@ struct goodix_ts_data {
>  	u8 main_clk[GOODIX_MAIN_CLK_LEN];
>  	int bak_ref_len;
>  	u8 *bak_ref;
> +	bool poweroff_in_suspend;

Hold reset in suspend?

kind regards,
	o.

>  };
>  
>  int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
> -- 
> 2.34.3
> 
