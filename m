Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B5117D36
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 02:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfLJBej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 20:34:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38080 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfLJBei (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 20:34:38 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so17880156ljh.5;
        Mon, 09 Dec 2019 17:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PQna/XPf8c16BsDpXm+ibEkwCJpB2q8be04A7j7c/us=;
        b=NN0hu+Jb5vYKVTElID1jsombs6qsGfBm2XtU6LKXnM2/iTKRVpWPbcMoJYV4TkfvTW
         /m5+kU9MTUIgT4ubd38kFzQ7on82BuAhMDXKkIz4McR/CYUwCCmuz0HcT84M3imZbNbH
         45saCY5RvUg1akP5lrns9ArD7XxflWHWfy0/q5Wfx9W64CNvsK5oKMipXMgJxPyNXrLw
         iTie8RqChK7OHMbOtwip+O7W+m4LDKdDWt7a8l96vr4ZJSqqQkztXFDRFlry/C7X9e9M
         zdGpjXf3Tq/E0+da9gAIdw0AgbJ9lPyalRlU2SYTrrIYPAXaQgBpg9X37vxUQGnVx4O5
         p0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PQna/XPf8c16BsDpXm+ibEkwCJpB2q8be04A7j7c/us=;
        b=WqVaZmrVaIJO0DYNgRzvby+2eXZBzn121BAJT2+Z1FgQp7sr91VrvkPGz3g20QJ0uG
         H7bW8/XNOb1SS+h8sy7MaH2NCTba8UgpsMVGH69Vewnas6fDAtORxedWYU9oI8vcrRTb
         41pJmqAnrimDiLV5+hY7PqgOpytHaprMfn83oJjupVwiweqHD+JQnFB3O+vW2LIwd/FA
         Q1GCwGCmelj8b/xJhJbxOAhBIu4zYkTom5yXCwG5XIO5PxqmsfbexeYqVgiiy7mo7l3l
         Bc3t2a9h2/D9nEieGaXygK14x2z/ON9a3Q2BKrstZ1iqNnZyWYnrb9Ys2q/AXEuk09+Y
         WMCA==
X-Gm-Message-State: APjAAAVzZeNkiAbof/xWj+zrjPNCBEy5szduZMVoLpWXTnymY36kNcPg
        qPExJdhwfiBjk7qfu5oYcs0FwkFg
X-Google-Smtp-Source: APXvYqzwthzBkjX+2aJvjzfCMtR0Dq3uFFMWjPMXJeSBnPluvYPwrmkbnW2gridVfbQwiSoymqO/Sg==
X-Received: by 2002:a2e:7009:: with SMTP id l9mr14238725ljc.96.1575941675118;
        Mon, 09 Dec 2019 17:34:35 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id r26sm516424lfm.82.2019.12.09.17.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 17:34:34 -0800 (PST)
Subject: Re: [PATCH 5/6] input: elants: refactor elants_i2c_execute_command()
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <d0901ff04ddfe2f0c5d531db68dd493187a16d81.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5f24b14b-75b0-52d5-eb0a-da17f3c45742@gmail.com>
Date:   Tue, 10 Dec 2019 04:34:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d0901ff04ddfe2f0c5d531db68dd493187a16d81.1575936961.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 03:19, Michał Mirosław пишет:
> Apply some DRY-ing to elants_i2c_execute_command() callers.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 182 +++++++++++++------------
>  1 file changed, 93 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 2e6c9aa60496..27aca3971da5 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -201,7 +201,8 @@ static int elants_i2c_read(struct i2c_client *client, void *data, size_t size)
>  
>  static int elants_i2c_execute_command(struct i2c_client *client,
>  				      const u8 *cmd, size_t cmd_size,
> -				      u8 *resp, size_t resp_size)
> +				      u8 *resp, size_t resp_size,
> +				      int retries, const char *cmd_name)
>  {
>  	struct i2c_msg msgs[2];
>  	int ret;
> @@ -217,30 +218,55 @@ static int elants_i2c_execute_command(struct i2c_client *client,
>  		break;
>  
>  	default:
> -		dev_err(&client->dev, "%s: invalid command %*ph\n",
> -			__func__, (int)cmd_size, cmd);
> +		dev_err(&client->dev, "(%s): invalid command: %*ph\n",
> +			cmd_name, (int)cmd_size, cmd);
>  		return -EINVAL;
>  	}
>  
> -	msgs[0].addr = client->addr;
> -	msgs[0].flags = client->flags & I2C_M_TEN;
> -	msgs[0].len = cmd_size;
> -	msgs[0].buf = (u8 *)cmd;
> +	for (;;) {
> +		msgs[0].addr = client->addr;
> +		msgs[0].flags = client->flags & I2C_M_TEN;
> +		msgs[0].len = cmd_size;
> +		msgs[0].buf = (u8 *)cmd;
>  
> -	msgs[1].addr = client->addr;
> -	msgs[1].flags = client->flags & I2C_M_TEN;
> -	msgs[1].flags |= I2C_M_RD;
> -	msgs[1].len = resp_size;
> -	msgs[1].buf = resp;
> +		msgs[1].addr = client->addr;
> +		msgs[1].flags = client->flags & I2C_M_TEN;
> +		msgs[1].flags |= I2C_M_RD;
> +		msgs[1].len = resp_size;
> +		msgs[1].buf = resp;
>  
> -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -	if (ret < 0)
> -		return ret;
> +		ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +		if (ret < 0) {
> +			if (--retries > 0) {
> +				dev_dbg(&client->dev,
> +					"(%s) I2C transfer failed: %d (retrying)\n",
> +					cmd_name, ret);
> +				continue;
> +			}
>  
> -	if (ret != ARRAY_SIZE(msgs) || resp[FW_HDR_TYPE] != expected_response)
> -		return -EIO;
> +			dev_err(&client->dev,
> +				"(%s) I2C transfer failed: %d\n",
> +				cmd_name, ret);
> +			return ret;
> +		}
>  
> -	return 0;
> +		if (ret != ARRAY_SIZE(msgs) ||
> +		    resp[FW_HDR_TYPE] != expected_response) {
> +			if (--retries > 0) {
> +				dev_dbg(&client->dev,
> +					"(%s) unexpected response: %*ph (retrying)\n",
> +					cmd_name, ret, resp);
> +				continue;
> +			}
> +
> +			dev_err(&client->dev,
> +				"(%s) unexpected response: %*ph\n",
> +				cmd_name, ret, resp);
> +			return -EIO;
> +		}
> +
> +		return --retries;
> +	}
>  }
>  
>  static int elants_i2c_calibrate(struct elants_data *ts)
> @@ -313,27 +339,20 @@ static u16 elants_i2c_parse_version(u8 *buf)
>  static int elants_i2c_query_hw_version(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
> -	int error, retry_cnt;
> +	int retry_cnt = MAX_RETRIES;
>  	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_FW_ID, 0x00, 0x01 };
>  	u8 resp[HEADER_SIZE];
>  
> -	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
> -		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> -						   resp, sizeof(resp));
> -		if (!error) {
> -			ts->hw_version = elants_i2c_parse_version(resp);
> -			if (ts->hw_version != 0xffff)
> -				return 0;
> -		}
> +	while (retry_cnt) {
> +		retry_cnt = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> +						       resp, sizeof(resp),
> +						       retry_cnt, "read fw id");
> +		if (retry_cnt < 0)
> +			return retry_cnt;
>  
> -		dev_dbg(&client->dev, "read fw id error=%d, buf=%*phC\n",
> -			error, (int)sizeof(resp), resp);
> -	}
> -
> -	if (error) {
> -		dev_err(&client->dev,
> -			"Failed to read fw id: %d\n", error);
> -		return error;
> +		ts->hw_version = elants_i2c_parse_version(resp);
> +		if (ts->hw_version != 0xffff)
> +			return 0;
>  	}
>  
>  	dev_err(&client->dev, "Invalid fw id: %#04x\n", ts->hw_version);
> @@ -344,26 +363,28 @@ static int elants_i2c_query_hw_version(struct elants_data *ts)
>  static int elants_i2c_query_fw_version(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
> -	int error, retry_cnt;
> +	int retry_cnt = MAX_RETRIES;
>  	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_FW_VER, 0x00, 0x01 };
>  	u8 resp[HEADER_SIZE];
>  
> -	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
> -		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> -						   resp, sizeof(resp));
> -		if (!error) {
> -			ts->fw_version = elants_i2c_parse_version(resp);
> -			if (ts->fw_version != 0x0000 &&
> -			    ts->fw_version != 0xffff)
> -				return 0;
> -		}
> +	while (retry_cnt) {
> +		retry_cnt = elants_i2c_execute_command(client, cmd,
> +						       sizeof(cmd),
> +						       resp, sizeof(resp),
> +						       retry_cnt,
> +						       "read fw version");
> +		if (retry_cnt < 0)
> +			return retry_cnt;
>  
> -		dev_dbg(&client->dev, "read fw version error=%d, buf=%*phC\n",
> -			error, (int)sizeof(resp), resp);
> +		ts->fw_version = elants_i2c_parse_version(resp);
> +		if (ts->fw_version != 0x0000 && ts->fw_version != 0xffff)
> +			return 0;
> +
> +		dev_dbg(&client->dev, "(read fw version) resp %*phC\n",
> +			(int)sizeof(resp), resp);
>  	}
>  
> -	dev_err(&client->dev,
> -		"Failed to read fw version or fw version is invalid\n");
> +	dev_err(&client->dev, "Invalid fw ver: %#04x\n", ts->fw_version);
>  
>  	return -EINVAL;
>  }
> @@ -371,25 +392,20 @@ static int elants_i2c_query_fw_version(struct elants_data *ts)
>  static int elants_i2c_query_test_version(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
> -	int error, retry_cnt;
> +	int error;
>  	u16 version;
>  	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_TEST_VER, 0x00, 0x01 };
>  	u8 resp[HEADER_SIZE];
>  
> -	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
> -		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> -						   resp, sizeof(resp));
> -		if (!error) {
> -			version = elants_i2c_parse_version(resp);
> -			ts->test_version = version >> 8;
> -			ts->solution_version = version & 0xff;
> +	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> +					   resp, sizeof(resp), MAX_RETRIES,
> +					   "read test version");
> +	if (error >= 0) {
> +		version = elants_i2c_parse_version(resp);
> +		ts->test_version = version >> 8;
> +		ts->solution_version = version & 0xff;
>  
> -			return 0;
> -		}
> -
> -		dev_dbg(&client->dev,
> -			"read test version error rc=%d, buf=%*phC\n",
> -			error, (int)sizeof(resp), resp);
> +		return 0;
>  	}
>  
>  	dev_err(&client->dev, "Failed to read test version\n");
> @@ -406,13 +422,10 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
>  	int error;
>  
>  	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
> -					   resp, sizeof(resp));
> -	if (error) {
> -		dev_err(&client->dev,
> -			"read BC version error=%d, buf=%*phC\n",
> -			error, (int)sizeof(resp), resp);
> +					   resp, sizeof(resp), 1,
> +					   "read BC version");
> +	if (error)
>  		return error;
> -	}
>  
>  	version = elants_i2c_parse_version(resp);
>  	ts->bc_version = version >> 8;
> @@ -444,12 +457,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
>  	error = elants_i2c_execute_command(client,
>  					   get_resolution_cmd,
>  					   sizeof(get_resolution_cmd),
> -					   resp, sizeof(resp));
> -	if (error) {
> -		dev_err(&client->dev, "get resolution command failed: %d\n",
> -			error);
> +					   resp, sizeof(resp), 1,
> +					   "get resolution");
> +	if (error)
>  		return error;
> -	}
>  
>  	rows = resp[2] + resp[6] + resp[10];
>  	cols = resp[3] + resp[7] + resp[11];
> @@ -457,36 +468,29 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
>  	/* Process mm_to_pixel information */
>  	error = elants_i2c_execute_command(client,
>  					   get_osr_cmd, sizeof(get_osr_cmd),
> -					   resp, sizeof(resp));
> -	if (error) {
> -		dev_err(&client->dev, "get osr command failed: %d\n",
> -			error);
> +					   resp, sizeof(resp), 1, "get osr");
> +	if (error)
>  		return error;
> -	}
>  
>  	osr = resp[3];
>  
>  	error = elants_i2c_execute_command(client,
>  					   get_physical_scan_cmd,
>  					   sizeof(get_physical_scan_cmd),
> -					   resp, sizeof(resp));
> -	if (error) {
> -		dev_err(&client->dev, "get physical scan command failed: %d\n",
> -			error);
> +					   resp, sizeof(resp), 1,
> +					   "get physical scan");
> +	if (error)
>  		return error;
> -	}
>  
>  	phy_x = get_unaligned_be16(&resp[2]);
>  
>  	error = elants_i2c_execute_command(client,
>  					   get_physical_drive_cmd,
>  					   sizeof(get_physical_drive_cmd),
> -					   resp, sizeof(resp));
> -	if (error) {
> -		dev_err(&client->dev, "get physical drive command failed: %d\n",
> -			error);
> +					   resp, sizeof(resp), 1,
> +					   "get physical drive");
> +	if (error)
>  		return error;
> -	}
>  
>  	phy_y = get_unaligned_be16(&resp[2]);
>  
> 

Is this really needed? Could you please try to set IRQ_TYPE_EDGE_FALLING
in the device-tree for the interrupt type? I don't think think that
downstream kernel is correct and I've seen weird I2C problems when
IRQ_TYPE_LEVEL_LOW is used.
