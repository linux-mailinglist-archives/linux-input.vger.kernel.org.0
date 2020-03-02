Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49BBF175991
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgCBLaz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:30:55 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:57655 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgCBLaz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:30:55 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2B3C9240013;
        Mon,  2 Mar 2020 11:30:52 +0000 (UTC)
Message-ID: <bc32be9b924170832aedd9661802f367bebdadca.camel@hadess.net>
Subject: Re: [PATCH resend 08/10] Input: goodix - Save a copy of the config
 from goodix_read_config()
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:30:52 +0100
In-Reply-To: <20200221164735.508324-8-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-8-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Save a copy of the config in goodix_read_config(), this is a
> preparation
> patch for restoring the config if it was lost after a supend/resume
> cycle.

Is "fix" really the best verb for this "calculate checksum"?

> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks fine apart from the nitpicks.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 51 ++++++++++++++++++++++++++
> ----
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 66d6bb74507d..21be33384d14 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -72,6 +72,7 @@ struct goodix_chip_data {
>  	u16 config_addr;
>  	int config_len;
>  	int (*check_config)(struct goodix_ts_data *, const struct
> firmware *);
> +	void (*fix_config)(struct goodix_ts_data *ts);
>  };
>  
>  struct goodix_ts_data {
> @@ -96,35 +97,42 @@ struct goodix_ts_data {
>  	unsigned long irq_flags;
>  	enum goodix_irq_pin_access_method irq_pin_access_method;
>  	unsigned int contact_size;
> +	u8 config[GOODIX_CONFIG_MAX_LENGTH];
>  };
>  
>  static int goodix_check_cfg_8(struct goodix_ts_data *ts,
>  			const struct firmware *cfg);
>  static int goodix_check_cfg_16(struct goodix_ts_data *ts,
>  			const struct firmware *cfg);
> +static void goodix_fix_cfg_8(struct goodix_ts_data *ts);
> +static void goodix_fix_cfg_16(struct goodix_ts_data *ts);
>  
>  static const struct goodix_chip_data gt1x_chip_data = {
>  	.config_addr		= GOODIX_GT1X_REG_CONFIG_DATA,
>  	.config_len		= GOODIX_CONFIG_MAX_LENGTH,
>  	.check_config		= goodix_check_cfg_16,
> +	.fix_config		= goodix_fix_cfg_16,
>  };
>  
>  static const struct goodix_chip_data gt911_chip_data = {
>  	.config_addr		= GOODIX_GT9X_REG_CONFIG_DATA,
>  	.config_len		= GOODIX_CONFIG_911_LENGTH,
>  	.check_config		= goodix_check_cfg_8,
> +	.fix_config		= goodix_fix_cfg_8,
>  };
>  
>  static const struct goodix_chip_data gt967_chip_data = {
>  	.config_addr		= GOODIX_GT9X_REG_CONFIG_DATA,
>  	.config_len		= GOODIX_CONFIG_967_LENGTH,
>  	.check_config		= goodix_check_cfg_8,
> +	.fix_config		= goodix_fix_cfg_8,
>  };
>  
>  static const struct goodix_chip_data gt9x_chip_data = {
>  	.config_addr		= GOODIX_GT9X_REG_CONFIG_DATA,
>  	.config_len		= GOODIX_CONFIG_MAX_LENGTH,
>  	.check_config		= goodix_check_cfg_8,
> +	.fix_config		= goodix_fix_cfg_8,
>  };
>  
>  static const unsigned long goodix_irq_flags[] = {
> @@ -442,6 +450,19 @@ static int goodix_check_cfg_8(struct
> goodix_ts_data *ts,
>  	return 0;
>  }
>  
> +static void goodix_fix_cfg_8(struct goodix_ts_data *ts)
> +{
> +	int i, raw_cfg_len = ts->chip->config_len - 2;
> +	u8 check_sum = 0;
> +
> +	for (i = 0; i < raw_cfg_len; i++)
> +		check_sum += ts->config[i];
> +	check_sum = (~check_sum) + 1;
> +
> +	ts->config[raw_cfg_len] = check_sum;
> +	ts->config[raw_cfg_len + 1] = 1;

Would be good to mention that this is the "config_fresh" bit, in this
function and others.

> +}
> +
>  static int goodix_check_cfg_16(struct goodix_ts_data *ts,
>  			const struct firmware *cfg)
>  {
> @@ -466,6 +487,19 @@ static int goodix_check_cfg_16(struct
> goodix_ts_data *ts,
>  	return 0;
>  }
>  
> +static void goodix_fix_cfg_16(struct goodix_ts_data *ts)
> +{
> +	int i, raw_cfg_len = ts->chip->config_len - 3;
> +	u16 check_sum = 0;
> +
> +	for (i = 0; i < raw_cfg_len; i += 2)
> +		check_sum += get_unaligned_be16(&ts->config[i]);
> +	check_sum = (~check_sum) + 1;
> +
> +	put_unaligned_be16(check_sum, &ts->config[raw_cfg_len]);
> +	ts->config[raw_cfg_len + 2] = 1;
> +}
> +
>  /**
>   * goodix_check_cfg - Checks if config fw is valid
>   *
> @@ -828,12 +862,11 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>   */
>  static void goodix_read_config(struct goodix_ts_data *ts)
>  {
> -	u8 config[GOODIX_CONFIG_MAX_LENGTH];
>  	int x_max, y_max;
>  	int error;
>  
>  	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
> -				config, ts->chip->config_len);
> +				ts->config, ts->chip->config_len);
>  	if (error) {
>  		dev_warn(&ts->client->dev, "Error reading config:
> %d\n",
>  			 error);
> @@ -842,15 +875,21 @@ static void goodix_read_config(struct
> goodix_ts_data *ts)
>  		return;
>  	}
>  
> -	ts->int_trigger_type = config[TRIGGER_LOC] & 0x03;
> -	ts->max_touch_num = config[MAX_CONTACTS_LOC] & 0x0f;
> +	ts->int_trigger_type = ts->config[TRIGGER_LOC] & 0x03;
> +	ts->max_touch_num = ts->config[MAX_CONTACTS_LOC] & 0x0f;
>  
> -	x_max = get_unaligned_le16(&config[RESOLUTION_LOC]);
> -	y_max = get_unaligned_le16(&config[RESOLUTION_LOC + 2]);
> +	x_max = get_unaligned_le16(&ts->config[RESOLUTION_LOC]);
> +	y_max = get_unaligned_le16(&ts->config[RESOLUTION_LOC + 2]);
>  	if (x_max && y_max) {
>  		input_abs_set_max(ts->input_dev, ABS_MT_POSITION_X,
> x_max - 1);
>  		input_abs_set_max(ts->input_dev, ABS_MT_POSITION_Y,
> y_max - 1);
>  	}
> +
> +	/*
> +	 * Ensure valid checksum and config_fresh bit being set for
> possible
> +	 * re-upload of config after suspend/resume.
> +	 */

I think that the explanation should ultimately be shorter if the vfunc
was better named.

> +	ts->chip->fix_config(ts);
>  }
>  
>  /**

