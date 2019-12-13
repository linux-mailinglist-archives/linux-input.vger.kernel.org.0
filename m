Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C589611DBC4
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 02:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731591AbfLMBlO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 12 Dec 2019 20:41:14 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:8673 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731736AbfLMBlN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 20:41:13 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33262031"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 13 Dec 2019 09:41:07 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71486:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 13 Dec 2019 09:41:07 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101175:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 13 Dec 2019 09:41:04 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?big5?B?J1NUUkQyLb2ytGa8YCc=?= <jennifer.tsai@emc.com.tw>,
        <james.chen@emc.com.tw>,
        =?big5?B?J7Hns9W1vic=?= <paul.liang@emc.com.tw>,
        "'jeff'" <jeff.chuang@emc.com.tw>
References: <1575969632-18703-1-git-send-email-johnny.chuang@elan.corp-partner.google.com> <00a901d5af3c$193e9cd0$4bbbd670$@emc.com.tw> <20191212192220.GC101194@dtor-ws>
In-Reply-To: <20191212192220.GC101194@dtor-ws>
Subject: RE: [PATCH] Input: elants_i2c - Add Remark ID check flow in firmware update function
Date:   Fri, 13 Dec 2019 09:41:03 +0800
Message-ID: <003301d5b156$61da06c0$258e1440$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Content-Language: zh-tw
Thread-Index: AQKU6CCR3y2ZDKNDJHcdSmqZJZrY9wKTdKsnAt2xsxumDVHmIA==
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05ZjExY2MzZS0xZDQ5LTExZWEtOTg4My03YzVjZjg3NDk0NzhcYW1lLXRlc3RcOWYxMWNjNDAtMWQ0OS0xMWVhLTk4ODMtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSI2MTc4IiB0PSIxMzIyMDY3NDg2MzcwOTUyOTYiIGg9ImJlVGZPZ3V1TTUwRnMwcnFSTmhkYlJnNks4OD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Sorry for the inconvenience. Next time I will send patches via
git-send-email or mutt.

Many thanks,
Johnny
-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
Sent: Friday, December 13, 2019 3:22 AM
To: Johnny.Chuang
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; STRD2-½²´f¼`;
james.chen@emc.com.tw; '±ç³Õµ¾'; 'jeff'
Subject: Re: [PATCH] Input: elants_i2c - Add Remark ID check flow in
firmware update function

Hi Johnny,

On Tue, Dec 10, 2019 at 05:27:53PM +0800, Johnny.Chuang wrote:
> This patch add Remark ID check flow to firmware update function of 
> elan touchscreen driver.
> 
> It avoids firmware update with mismatched Remark ID.
> 
> This function is supported by our latest version of boot code, but it 
> cooperates well with earlier versions.
> 
> Our driver will decide if enable Remark ID check with boot code version.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>

Applied, but please next time do not use outlook (or gmail for that
matter) to send patches as I have to edit them manually to undo the
line-wrapping damage done by the mailers. Please consider setting up "git
send-email" or mutt for this.

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
> @@ -200,6 +202,10 @@ static int elants_i2c_execute_command(struct 
> i2c_client *client,
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
> @@ -556,6 +562,8 @@ static int elants_i2c_initialize(struct 
> elants_data *ts)
>  
>  	/* hw version is available even if device in recovery state */
>  	error2 = elants_i2c_query_hw_version(ts);
> +	if (!error2)
> +		error2 = elants_i2c_query_bc_version(ts);
>  	if (!error)
>  		error = error2;
>  
> @@ -564,8 +572,6 @@ static int elants_i2c_initialize(struct elants_data
*ts)
>  	if (!error)
>  		error = elants_i2c_query_test_version(ts);
>  	if (!error)
> -		error = elants_i2c_query_bc_version(ts);
> -	if (!error)
>  		error = elants_i2c_query_ts_info(ts);
>  
>  	if (error)
> @@ -613,39 +619,94 @@ static int elants_i2c_fw_write_page(struct 
> i2c_client *client,
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
sizeof(enter_iap2));
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
sizeof(close_idle));
>  		if (error)
>  			dev_err(&client->dev, "Failed close idle: %d\n",
error);
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

