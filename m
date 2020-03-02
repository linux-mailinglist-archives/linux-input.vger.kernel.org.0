Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D91A1759A1
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgCBLeT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:34:19 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49185 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgCBLeT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:34:19 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5A9C6200011;
        Mon,  2 Mar 2020 11:33:56 +0000 (UTC)
Message-ID: <55c1159deb1b7b43bb8b404ab9467eaae9ebbb85.camel@hadess.net>
Subject: Re: [PATCH resend 09/10] Input: goodix - Make goodix_send_cfg()
 take a raw buffer as argument
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:33:55 +0100
In-Reply-To: <20200221164735.508324-9-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-9-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Make goodix_send_cfg() take a raw buffer as argument instead of a
> struct firmware *cfg, so that it can also be used to restore the
> config
> on resume if necessary.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 46 ++++++++++++++------------
> ----
>  1 file changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 21be33384d14..0f39c499e3a9 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -71,7 +71,7 @@ enum goodix_irq_pin_access_method {
>  struct goodix_chip_data {
>  	u16 config_addr;
>  	int config_len;
> -	int (*check_config)(struct goodix_ts_data *, const struct
> firmware *);
> +	int (*check_config)(struct goodix_ts_data *ts, const u8 *cfg,
> int len);

Any way to make the length a uint instead of an int? That way, we
wouldn't need to add < 0 guards, and the "len > MAX_LENGTH" check would
be enough.

Looks good otherwise:

Reviewed-by: Bastien Nocera <hadess@hadess.net>

>  	void (*fix_config)(struct goodix_ts_data *ts);
>  };
>  
> @@ -101,9 +101,9 @@ struct goodix_ts_data {
>  };
>  
>  static int goodix_check_cfg_8(struct goodix_ts_data *ts,
> -			const struct firmware *cfg);
> +			      const u8 *cfg, int len);
>  static int goodix_check_cfg_16(struct goodix_ts_data *ts,
> -			const struct firmware *cfg);
> +			       const u8 *cfg, int len);
>  static void goodix_fix_cfg_8(struct goodix_ts_data *ts);
>  static void goodix_fix_cfg_16(struct goodix_ts_data *ts);
>  
> @@ -426,22 +426,21 @@ static int goodix_request_irq(struct
> goodix_ts_data *ts)
>  					 ts->irq_flags, ts->client-
> >name, ts);
>  }
>  
> -static int goodix_check_cfg_8(struct goodix_ts_data *ts,
> -			const struct firmware *cfg)
> +static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8
> *cfg, int len)
>  {
> -	int i, raw_cfg_len = cfg->size - 2;
> +	int i, raw_cfg_len = len - 2;
>  	u8 check_sum = 0;
>  
>  	for (i = 0; i < raw_cfg_len; i++)
> -		check_sum += cfg->data[i];
> +		check_sum += cfg[i];
>  	check_sum = (~check_sum) + 1;
> -	if (check_sum != cfg->data[raw_cfg_len]) {
> +	if (check_sum != cfg[raw_cfg_len]) {
>  		dev_err(&ts->client->dev,
>  			"The checksum of the config fw is not
> correct");
>  		return -EINVAL;
>  	}
>  
> -	if (cfg->data[raw_cfg_len + 1] != 1) {
> +	if (cfg[raw_cfg_len + 1] != 1) {
>  		dev_err(&ts->client->dev,
>  			"Config fw must have Config_Fresh register
> set");
>  		return -EINVAL;
> @@ -463,22 +462,22 @@ static void goodix_fix_cfg_8(struct
> goodix_ts_data *ts)
>  	ts->config[raw_cfg_len + 1] = 1;
>  }
>  
> -static int goodix_check_cfg_16(struct goodix_ts_data *ts,
> -			const struct firmware *cfg)
> +static int goodix_check_cfg_16(struct goodix_ts_data *ts, const u8
> *cfg,
> +			       int len)
>  {
> -	int i, raw_cfg_len = cfg->size - 3;
> +	int i, raw_cfg_len = len - 3;
>  	u16 check_sum = 0;
>  
>  	for (i = 0; i < raw_cfg_len; i += 2)
> -		check_sum += get_unaligned_be16(&cfg->data[i]);
> +		check_sum += get_unaligned_be16(&cfg[i]);
>  	check_sum = (~check_sum) + 1;
> -	if (check_sum != get_unaligned_be16(&cfg->data[raw_cfg_len])) {
> +	if (check_sum != get_unaligned_be16(&cfg[raw_cfg_len])) {
>  		dev_err(&ts->client->dev,
>  			"The checksum of the config fw is not
> correct");
>  		return -EINVAL;
>  	}
>  
> -	if (cfg->data[raw_cfg_len + 2] != 1) {
> +	if (cfg[raw_cfg_len + 2] != 1) {
>  		dev_err(&ts->client->dev,
>  			"Config fw must have Config_Fresh register
> set");
>  		return -EINVAL;
> @@ -506,16 +505,15 @@ static void goodix_fix_cfg_16(struct
> goodix_ts_data *ts)
>   * @ts: goodix_ts_data pointer
>   * @cfg: firmware config data
>   */
> -static int goodix_check_cfg(struct goodix_ts_data *ts,
> -			    const struct firmware *cfg)
> +static int goodix_check_cfg(struct goodix_ts_data *ts, const u8
> *cfg, int len)
>  {
> -	if (cfg->size > GOODIX_CONFIG_MAX_LENGTH) {
> +	if (len > GOODIX_CONFIG_MAX_LENGTH) {
>  		dev_err(&ts->client->dev,
>  			"The length of the config fw is not correct");
>  		return -EINVAL;
>  	}
>  
> -	return ts->chip->check_config(ts, cfg);
> +	return ts->chip->check_config(ts, cfg, len);
>  }
>  
>  /**
> @@ -524,17 +522,15 @@ static int goodix_check_cfg(struct
> goodix_ts_data *ts,
>   * @ts: goodix_ts_data pointer
>   * @cfg: config firmware to write to device
>   */
> -static int goodix_send_cfg(struct goodix_ts_data *ts,
> -			   const struct firmware *cfg)
> +static int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg,
> int len)
>  {
>  	int error;
>  
> -	error = goodix_check_cfg(ts, cfg);
> +	error = goodix_check_cfg(ts, cfg, len);
>  	if (error)
>  		return error;
>  
> -	error = goodix_i2c_write(ts->client, ts->chip->config_addr,
> cfg->data,
> -				 cfg->size);
> +	error = goodix_i2c_write(ts->client, ts->chip->config_addr,
> cfg, len);
>  	if (error) {
>  		dev_err(&ts->client->dev, "Failed to write config data:
> %d",
>  			error);
> @@ -1058,7 +1054,7 @@ static void goodix_config_cb(const struct
> firmware *cfg, void *ctx)
>  
>  	if (cfg) {
>  		/* send device configuration to the firmware */
> -		error = goodix_send_cfg(ts, cfg);
> +		error = goodix_send_cfg(ts, cfg->data, cfg->size);
>  		if (error)
>  			goto err_release_cfg;
>  	}

