Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56343110576
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2019 20:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfLCTsL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Dec 2019 14:48:11 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44280 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfLCTsL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Dec 2019 14:48:11 -0500
Received: by mail-pl1-f196.google.com with SMTP id az9so2087805plb.11;
        Tue, 03 Dec 2019 11:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GwRYFX1quqenullRywg/FdnJHJWCumJ4VGyzYLzH/1M=;
        b=t/hAuxP10MiAoSWoGRP2QcpkWnK635lVD+pJdtItTxj0WW9yt3HCjsr0/dcafNgtPa
         /pZqI1KMaU7J/EuuKFmKeqtpE1RryABoQ4ZT3rw/BQzS3rQ12j+iub8qGutOVcJnXtlo
         vPKWElz5RkQoM6QkCphMDBaonhOggKE2cFm4tbGrfW1yCAjd9WmX9thRgqjX9twIbTtj
         BnBhBeuCW6sTn3Y+Lpdjpa1S9gaSfh+byMs1fN5XfyiIzOmgfu8Ew0QAm4CQBt8Ufi1P
         v8Dli6sS5h8uZrOaC99aHMXfhlicQCWeIRLsxvxNvrGHomGcpWstTO2lT8fQtPHZ5U6b
         2xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GwRYFX1quqenullRywg/FdnJHJWCumJ4VGyzYLzH/1M=;
        b=DuDFT/wNvYq5dWfUrmxGRoXOMQxjBhVmIO8HEPGqiHfPAn4Ajn5RByj6cf/BPJcfz/
         mtIbX1UCwo8DA4A8D08uIAuiMRLUI2i7sP/mqz0uGxWf5U9HHjNZFpb7LbZKRVjNfxxi
         +TjfaT1lmaVvXCQN0F7HXgm4a4lb5ZYwfa3ls0KWczOYBDLDEU/CjruxDg2jGpGjpgeR
         I1eVL+rA6h8/pQNnmESJ3X92qD3vvhqwYcVZKGgdCu2fHJMSfs6SVhCxlQyd1khxuDRZ
         jSBXC09UqBN3o/SLgOCXILKYY+zeFYmh5KMhhnjtB7pRofMJ4Hasea/8nfz6Y+BYLnbv
         x9wQ==
X-Gm-Message-State: APjAAAWDbjuvy+pezwlKOQ3+ORDM+2veDgJqrq2Ti+9QaC2LyxbP7AHe
        C0x+wOSmKXCv9xaJyK+oV/Xm5MTc
X-Google-Smtp-Source: APXvYqxaQhr88bAilOC5OMDrPWSHxggOTi8WjnxoNJR0aXPvu8CRAaEMYDwsYGitobYA3dBxiIw4fg==
X-Received: by 2002:a17:902:a516:: with SMTP id s22mr6536089plq.295.1575402489855;
        Tue, 03 Dec 2019 11:48:09 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l22sm4099015pjc.0.2019.12.03.11.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 11:48:08 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:48:06 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        =?utf-8?B?U1RSRDIt6JSh5oOg5ayL?= <jennifer.tsai@emc.com.tw>,
        james.chen@emc.com.tw,
        =?utf-8?B?J+aigeWNmue/lCc=?= <paul.liang@emc.com.tw>,
        'jeff' <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - Add Remark ID check flow in firmware
 update function
Message-ID: <20191203194806.GL50317@dtor-ws>
References: <1574142739-24556-1-git-send-email-johnny.chuang@emc.com.tw>
 <003d01d59e9e$8b0a3120$a11e9360$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003d01d59e9e$8b0a3120$a11e9360$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Johnny,

On Tue, Nov 19, 2019 at 01:59:45PM +0800, Johnny.Chuang wrote:
> This patch add Remark ID check flow to firmware update function of elan
> touchscreen driver.
> 
> It avoids firmware update with mismatched Remark ID.
> 
> This function is supported by our latest version of boot code, but it
> cooperates well with earlier versions.
> 
> Our driver will decide if enable Remark ID check with boot code version.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 108
> ++++++++++++++++++++++++++++++---
>  1 file changed, 100 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c
> b/drivers/input/touchscreen/elants_i2c.c
> index d4ad24e..9a17af6 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -59,8 +59,10 @@
>  #define CMD_HEADER_WRITE	0x54
>  #define CMD_HEADER_READ		0x53
>  #define CMD_HEADER_6B_READ	0x5B
> +#define CMD_HEADER_ROM_READ	0x96
>  #define CMD_HEADER_RESP		0x52
>  #define CMD_HEADER_6B_RESP	0x9B
> +#define CMD_HEADER_ROM_RESP	0x95
>  #define CMD_HEADER_HELLO	0x55
>  #define CMD_HEADER_REK		0x66
>  
> @@ -128,6 +130,7 @@ struct elants_data {
>  	u8 bc_version;
>  	u8 iap_version;
>  	u16 hw_version;
> +	u16 remark_id;

We only use this during firmware version check phase, no need to store
it in the device data structure.

>  	unsigned int x_res;	/* resolution in units/mm */
>  	unsigned int y_res;
>  	unsigned int x_max;
> @@ -200,6 +203,10 @@ static int elants_i2c_execute_command(struct i2c_client
> *client,
>  		expected_response = CMD_HEADER_6B_RESP;
>  		break;
>  
> +	case CMD_HEADER_ROM_READ:
> +		expected_response = CMD_HEADER_ROM_RESP;
> +		break;
> +
>  	default:
>  		dev_err(&client->dev, "%s: invalid command %*ph\n",
>  			__func__, (int)cmd_size, cmd);
> @@ -556,6 +563,8 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  
>  	/* hw version is available even if device in recovery state */
>  	error2 = elants_i2c_query_hw_version(ts);
> +	if (!error2)
> +		error2 = elants_i2c_query_bc_version(ts);

Can you please explain why this change is done? This does not seem to
relate to the "remark id" functionality. Should it be a separate change?

>  	if (!error)
>  		error = error2;
>  
> @@ -564,8 +573,6 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  	if (!error)
>  		error = elants_i2c_query_test_version(ts);
>  	if (!error)
> -		error = elants_i2c_query_bc_version(ts);
> -	if (!error)
>  		error = elants_i2c_query_ts_info(ts);
>  
>  	if (error)
> @@ -613,39 +620,124 @@ static int elants_i2c_fw_write_page(struct i2c_client
> *client,
>  	return error;
>  }
>  
> +static int elants_i2c_query_remark_id(struct elants_data *ts) {
> +	struct i2c_client *client = ts->client;
> +	int error;
> +	const u8 cmd[] = { CMD_HEADER_ROM_READ, 0x80, 0x1F, 0x00, 0x00, 0x21
> };
> +	u8 resp[6] = { 0 };
> +
> +	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> +					resp, sizeof(resp));
> +	if (error) {
> +		dev_err(&client->dev, "get Remark ID failed: %d.\n", error);
> +		return error;
> +	}
> +
> +	ts->remark_id = get_unaligned_be16(&resp[3]);
> +	dev_info(&client->dev, "remark_id=0x%04x.\n", ts->remark_id);

I do not think we need be this noisy. Either dev_dbg, or drop it
completely.

> +
> +	return 0;
> +}
> +
> +static int elants_i2c_validate_remark_id(struct elants_data *ts,
> +					 const struct firmware *fw)
> +{
> +	struct i2c_client *client = ts->client;
> +	int error;
> +	u16 fw_remark_id = 0;
> +
> +	/* Compare TS Remark ID and FW Remark ID */
> +	error = elants_i2c_query_remark_id(ts);
> +	if (error) {
> +		dev_err(&client->dev, "failed to query Remark ID: %d\n",
> error);
> +		return error;
> +	}
> +
> +	fw_remark_id = get_unaligned_le16(&fw->data[fw->size - 4]);
> +	dev_info(&client->dev, "fw_remark_id=0x%04x.\n", fw_remark_id);

Please drop this dev_info().

> +	if (fw_remark_id != ts->remark_id) {
> +		dev_err(&client->dev,
> +			"Remark ID Mismatched: ts_remark_id=0x%04x,
> fw_remark_id=0x%x.\n",

You can use "%#04x" to format with prefix.

> +			ts->remark_id, fw_remark_id);
> +		return -ENODATA;

I'd say -EINVAL here.

> +	}
> +
> +	return 0;
> +}
> +
>  static int elants_i2c_do_update_firmware(struct i2c_client *client,
>  					 const struct firmware *fw,
>  					 bool force)
>  {
> +	struct elants_data *ts = i2c_get_clientdata(client);
> +	static const u8 w_flashkey[] = { 0x54, 0xC0, 0xE1, 0x5A };
>  	const u8 enter_iap[] = { 0x45, 0x49, 0x41, 0x50 };
>  	const u8 enter_iap2[] = { 0x54, 0x00, 0x12, 0x34 };
>  	const u8 iap_ack[] = { 0x55, 0xaa, 0x33, 0xcc };
> -	const u8 close_idle[] = {0x54, 0x2c, 0x01, 0x01};
> +	const u8 close_idle[] = { 0x54, 0x2c, 0x01, 0x01 };
>  	u8 buf[HEADER_SIZE];
>  	u16 send_id;
>  	int page, n_fw_pages;
>  	int error;
> +	bool check_remark_id = ts->iap_version >= 0x60;
>  
>  	/* Recovery mode detection! */
>  	if (force) {
>  		dev_dbg(&client->dev, "Recovery mode procedure\n");
> +
> +		if (check_remark_id == true) {

Simply
		if (check_remark_id) {


> +			/* Validate Remark ID */

This comment is not needed, you named the function that you are calling
below well and its name describes what we are trying to do perfectly.

> +			error = elants_i2c_validate_remark_id(ts, fw);
> +			if (error) {
> +				dev_err(&client->dev,
> +					"failed to validate Remark ID:
> %d\n",
> +					error);

elants_i2c_validate_remark_id() already gives necessary diagnostic, this
message is not needed.

> +				return error;
> +			}
> +		}
> +
> +		error = elants_i2c_send(client, w_flashkey,
> sizeof(w_flashkey));
> +		if (error)
> +			dev_err(&client->dev, "failed to write flash key:
> %d\n",
> +				error);

Sending flashkey in this chunk seems to be another change not directly
related to the remark id. Why do we need this? Should it be split out?

> +
>  		error = elants_i2c_send(client, enter_iap2,
> sizeof(enter_iap2));
> +		if (error) {
> +			dev_err(&client->dev, "failed to enter IAP mode:
> %d\n",
> +				error);
> +			return error;
> +		}
> +		msleep(20);

We already have msleep(20) in the common path below, do we really need
2nd one here?

>  	} else {
>  		/* Start IAP Procedure */
>  		dev_dbg(&client->dev, "Normal IAP procedure\n");
> +
>  		/* Close idle mode */
>  		error = elants_i2c_send(client, close_idle,
> sizeof(close_idle));
>  		if (error)
>  			dev_err(&client->dev, "Failed close idle: %d\n",
> error);
>  		msleep(60);
> +
>  		elants_i2c_sw_reset(client);
>  		msleep(20);
> -		error = elants_i2c_send(client, enter_iap,
> sizeof(enter_iap));
> -	}
>  
> -	if (error) {
> -		dev_err(&client->dev, "failed to enter IAP mode: %d\n",
> error);
> -		return error;
> +		if (check_remark_id == true) {

		if (check_remark_id) {

> +			/* Validate Remark ID */

Drop comment.

> +			error = elants_i2c_validate_remark_id(ts, fw);
> +			if (error) {
> +				dev_err(&client->dev, "failed to validate
> Remark ID: %d\n",
> +					error);

Drop message.

> +				return error;
> +			}
> +		}
> +
> +		error = elants_i2c_send(client, enter_iap,
> sizeof(enter_iap));
> +		if (error) {
> +			dev_err(&client->dev, "failed to enter IAP mode:
> %d\n",
> +				error);
> +			return error;
> +		}
>  	}
>  
>  	msleep(20);
> --
> 2.7.4
> 

Thanks.

-- 
Dmitry
