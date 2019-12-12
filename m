Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77DE211D6F8
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 20:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfLLTWZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 14:22:25 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42229 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730168AbfLLTWY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 14:22:24 -0500
Received: by mail-pl1-f193.google.com with SMTP id x13so1053575plr.9;
        Thu, 12 Dec 2019 11:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LvLfIJp9MypidvTfcdZxgV+AoFkGkwsQDQrYIj5+Vr8=;
        b=MDHWfK5IIZvQn0VpiF62Hbi0edP2tKWk3SU2ihw9kVYIlQOBNDjbNi38ViWorr3dTT
         TN6cKmtoYnHvAmxV3xSVPKIrcbZzBWpcr8oZzbJksxtccOsUFgr8/8CPB/V2U0pdl3nR
         eO6qB8b1slS5GBZc41J9YlAZ9K8Jdpi6eBGIojLJhS3MIu4k6Gcg4D+Sg7ytXkLt5k+/
         W5/by7Yv7iYUosM/Y6r/QiOQ58wL7pXrExIvSUKeqePnH06prz4ICrZmG7nwoj4Y3rad
         wYqyHHjdOiNr2GU4Np1H3lVm0pB5dfUn1IfXuuoDYjtsENhvCLopB4bBgCSR5bnpazmS
         9Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LvLfIJp9MypidvTfcdZxgV+AoFkGkwsQDQrYIj5+Vr8=;
        b=dNDPH9tUMfDVVlkGzXWya/OM6u6cbq58AjHmzbaF01ioNu3sKgULqyNxcmaxfha04o
         NU0sROvQMzt3jfsMochEVe1CtrLcOVLGM3YY2RwCsP/2cCuwke7lf+lvFee9BbuRnjMj
         Bbkdi+5ZggbtAef1GKd431HUE2kHaYCH6j4zp/gJ0Uta0rpjpvgkSsOcINo1xvYLZTuR
         bLUSmEzxJ8Yd25HpgtZ6m+sitYnITdIrVXMt6RWAFINh1990jZ8Pq7zlGWFk5LWug0dF
         DLM6qvOn91fidnrJ35eDxMrXJ2CmJ4o39yu/b2bq4ov8GXLPgSGLr7MXf0URmUm/JdUx
         Kk3Q==
X-Gm-Message-State: APjAAAWs3QKX5oduXSbHOZYozCxDgJlIxRzZT+/SW/rYCi6i5+04/tCX
        Aide5ve4fP+hyzZTKxNgXiA=
X-Google-Smtp-Source: APXvYqwWlw1Y8Lom4wbc/Uc/m/DzgzN5MC+vJ6aXIq10BKLqbl9NiDAckgHB2YKMWVLzZA8qdhJorA==
X-Received: by 2002:a17:902:fe10:: with SMTP id g16mr5876603plj.66.1576178543641;
        Thu, 12 Dec 2019 11:22:23 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z23sm7426870pgj.43.2019.12.12.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:22:22 -0800 (PST)
Date:   Thu, 12 Dec 2019 11:22:20 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        =?utf-8?B?U1RSRDIt6JSh5oOg5ayL?= <jennifer.tsai@emc.com.tw>,
        james.chen@emc.com.tw,
        =?utf-8?B?J+aigeWNmue/lCc=?= <paul.liang@emc.com.tw>,
        'jeff' <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - Add Remark ID check flow in firmware
 update function
Message-ID: <20191212192220.GC101194@dtor-ws>
References: <1575969632-18703-1-git-send-email-johnny.chuang@elan.corp-partner.google.com>
 <00a901d5af3c$193e9cd0$4bbbd670$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a901d5af3c$193e9cd0$4bbbd670$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Johnny,

On Tue, Dec 10, 2019 at 05:27:53PM +0800, Johnny.Chuang wrote:
> This patch add Remark ID check flow to firmware update function of
> elan touchscreen driver.
> 
> It avoids firmware update with mismatched Remark ID.
> 
> This function is supported by our latest version of boot code,
> but it cooperates well with earlier versions.
> 
> Our driver will decide if enable Remark ID check with boot code version.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>

Applied, but please next time do not use outlook (or gmail for that
matter) to send patches as I have to edit them manually to undo the
line-wrapping damage done by the mailers. Please consider setting up
"git send-email" or mutt for this.

Thanks!

> ---
>  drivers/input/touchscreen/elants_i2c.c | 77
> ++++++++++++++++++++++++++++++----
>  1 file changed, 69 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c
> b/drivers/input/touchscreen/elants_i2c.c
> index d4ad24e..4911799 100644
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
> @@ -200,6 +202,10 @@ static int elants_i2c_execute_command(struct i2c_client
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
> @@ -556,6 +562,8 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  
>  	/* hw version is available even if device in recovery state */
>  	error2 = elants_i2c_query_hw_version(ts);
> +	if (!error2)
> +		error2 = elants_i2c_query_bc_version(ts);
>  	if (!error)
>  		error = error2;
>  
> @@ -564,8 +572,6 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  	if (!error)
>  		error = elants_i2c_query_test_version(ts);
>  	if (!error)
> -		error = elants_i2c_query_bc_version(ts);
> -	if (!error)
>  		error = elants_i2c_query_ts_info(ts);
>  
>  	if (error)
> @@ -613,39 +619,94 @@ static int elants_i2c_fw_write_page(struct i2c_client
> *client,
>  	return error;
>  }
>  
> +static int elants_i2c_validate_remark_id(struct elants_data *ts,
> +					 const struct firmware *fw)
> +{
> +	struct i2c_client *client = ts->client;
> +	int error;
> +	const u8 cmd[] = { CMD_HEADER_ROM_READ, 0x80, 0x1F, 0x00, 0x00, 0x21
> };
> +	u8 resp[6] = { 0 };
> +	u16 ts_remark_id = 0;
> +	u16 fw_remark_id = 0;
> +
> +	/* Compare TS Remark ID and FW Remark ID */
> +	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> +					resp, sizeof(resp));
> +	if (error) {
> +		dev_err(&client->dev, "failed to query Remark ID: %d\n",
> error);
> +		return error;
> +	}
> +
> +	ts_remark_id = get_unaligned_be16(&resp[3]);
> +
> +	fw_remark_id = get_unaligned_le16(&fw->data[fw->size - 4]);
> +
> +	if (fw_remark_id != ts_remark_id) {
> +		dev_err(&client->dev,
> +			"Remark ID Mismatched: ts_remark_id=0x%04x,
> fw_remark_id=0x%04x.\n",
> +			ts_remark_id, fw_remark_id);
> +		return -EINVAL;
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
> +		if (check_remark_id) {
> +			error = elants_i2c_validate_remark_id(ts, fw);
> +			if (error)
> +				return error;
> +		}
> +
>  		error = elants_i2c_send(client, enter_iap2,
> sizeof(enter_iap2));
> +		if (error) {
> +			dev_err(&client->dev, "failed to enter IAP mode:
> %d\n",
> +				error);
> +			return error;
> +		}
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
> +		if (check_remark_id) {
> +			error = elants_i2c_validate_remark_id(ts, fw);
> +			if (error)
> +				return error;
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

-- 
Dmitry
