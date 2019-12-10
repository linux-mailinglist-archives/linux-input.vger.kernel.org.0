Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858E7118391
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 10:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfLJJaG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 10 Dec 2019 04:30:06 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:62361 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfLJJaE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 04:30:04 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33219875"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 10 Dec 2019 17:30:00 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71511:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 10 Dec 2019 17:30:02 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101173:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 10 Dec 2019 17:30:00 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?big5?B?J1NUUkQyLb2ytGa8YCc=?= <jennifer.tsai@emc.com.tw>,
        <james.chen@emc.com.tw>,
        =?big5?B?J7Hns9W1vic=?= <paul.liang@emc.com.tw>,
        "'jeff'" <jeff.chuang@emc.com.tw>
References: <1574142739-24556-1-git-send-email-johnny.chuang@emc.com.tw> <003d01d59e9e$8b0a3120$a11e9360$@emc.com.tw> <20191203194806.GL50317@dtor-ws> 
In-Reply-To: 
Subject: RE: [PATCH] Input: elants_i2c - Add Remark ID check flow in firmware update function
Date:   Tue, 10 Dec 2019 17:29:57 +0800
Message-ID: <00aa01d5af3c$632d0110$29870330$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJWcJ1GfW6vkoLmumyMvYKuQq0ScAIT1IjnAR9//EimjmCYoIAJm8rw
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1hMGEwODIzNi0xYjJmLTExZWEtOGFiMy03YzVjZjg3NDk0NzhcYW1lLXRlc3RcYTBhMDgyMzgtMWIyZi0xMWVhLThhYjMtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIxNDcyNyIgdD0iMTMyMjA0NDM3OTcxMDY4MDE0IiBoPSJnQnV1eUk3YjNHaURqc3hhMmdzTzMxMjVnYkk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Please drop this patch.
I modified driver by your recommendation and commit a new patch.

Many thanks,
Johnny
-----Original Message-----
From: Johnny.Chuang [mailto:johnny.chuang@emc.com.tw] 
Sent: Wednesday, December 04, 2019 3:10 PM
To: 'Dmitry Torokhov'
Cc: 'linux-kernel@vger.kernel.org'; 'linux-input@vger.kernel.org'; 'STRD2-½²
´f¼`'; 'james.chen@emc.com.tw'; '±ç³Õµ¾'; 'jeff'
Subject: RE: [PATCH] Input: elants_i2c - Add Remark ID check flow in
firmware update function

Hi Dmitry,

I had modified driver and responded you inline.

Many thanks,
Johnny

diff --git a/drivers/input/touchscreen/elants_i2c.c
b/drivers/input/touchscreen/elants_i2c.c
index 9a17af6..4911799 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -130,7 +130,6 @@ struct elants_data {
        u8 bc_version;
        u8 iap_version;
        u16 hw_version;
-       u16 remark_id;
        unsigned int x_res;     /* resolution in units/mm */
        unsigned int y_res;
        unsigned int x_max;
@@ -620,47 +619,33 @@ static int elants_i2c_fw_write_page(struct i2c_client
*client,
        return error;
 }

-static int elants_i2c_query_remark_id(struct elants_data *ts) -{
-       struct i2c_client *client = ts->client;
-       int error;
-       const u8 cmd[] = { CMD_HEADER_ROM_READ, 0x80, 0x1F, 0x00, 0x00, 0x21
};
-       u8 resp[6] = { 0 };
-
-       error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-                                       resp, sizeof(resp));
-       if (error) {
-               dev_err(&client->dev, "get Remark ID failed: %d.\n", error);
-               return error;
-       }
-
-       ts->remark_id = get_unaligned_be16(&resp[3]);
-       dev_info(&client->dev, "remark_id=0x%04x.\n", ts->remark_id);
-
-       return 0;
-}
-
 static int elants_i2c_validate_remark_id(struct elants_data *ts,
                                         const struct firmware *fw)  {
        struct i2c_client *client = ts->client;
        int error;
+       const u8 cmd[] = { CMD_HEADER_ROM_READ, 0x80, 0x1F, 0x00, 0x00, 0x21
};
+       u8 resp[6] = { 0 };
+       u16 ts_remark_id = 0;
        u16 fw_remark_id = 0;

        /* Compare TS Remark ID and FW Remark ID */
-       error = elants_i2c_query_remark_id(ts);
+       error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+                                       resp, sizeof(resp));
        if (error) {
                dev_err(&client->dev, "failed to query Remark ID: %d\n",
error);
                return error;
        }

+       ts_remark_id = get_unaligned_be16(&resp[3]);
+
        fw_remark_id = get_unaligned_le16(&fw->data[fw->size - 4]);
-       dev_info(&client->dev, "fw_remark_id=0x%04x.\n", fw_remark_id);
-       if (fw_remark_id != ts->remark_id) {
+
+       if (fw_remark_id != ts_remark_id) {
                dev_err(&client->dev,
-                       "Remark ID Mismatched: ts_remark_id=0x%04x,
fw_remark_id=0x%x.\n",
-                       ts->remark_id, fw_remark_id);
-               return -ENODATA;
+                       "Remark ID Mismatched: ts_remark_id=0x%04x,
fw_remark_id=0x%04x.\n",
+                       ts_remark_id, fw_remark_id);
+               return -EINVAL;
        }

        return 0;
@@ -671,7 +656,6 @@ static int elants_i2c_do_update_firmware(struct
i2c_client *client,
                                         bool force)  {
        struct elants_data *ts = i2c_get_clientdata(client);
-       static const u8 w_flashkey[] = { 0x54, 0xC0, 0xE1, 0x5A };
        const u8 enter_iap[] = { 0x45, 0x49, 0x41, 0x50 };
        const u8 enter_iap2[] = { 0x54, 0x00, 0x12, 0x34 };
        const u8 iap_ack[] = { 0x55, 0xaa, 0x33, 0xcc }; @@ -686,29 +670,18
@@ static int elants_i2c_do_update_firmware(struct i2c_client *client,
        if (force) {
                dev_dbg(&client->dev, "Recovery mode procedure\n");

-               if (check_remark_id == true) {
-                       /* Validate Remark ID */
+               if (check_remark_id) {
                        error = elants_i2c_validate_remark_id(ts, fw);
-                       if (error) {
-                               dev_err(&client->dev,
-                                       "failed to validate Remark ID:
%d\n",
-                                       error);
+                       if (error)
                                return error;
-                       }
                }

-               error = elants_i2c_send(client, w_flashkey,
sizeof(w_flashkey));
-               if (error)
-                       dev_err(&client->dev, "failed to write flash key:
%d\n",
-                               error);
-
                error = elants_i2c_send(client, enter_iap2,
sizeof(enter_iap2));
                if (error) {
                        dev_err(&client->dev, "failed to enter IAP mode:
%d\n",
                                error);
                        return error;
                }
-               msleep(20);
        } else {
                /* Start IAP Procedure */
                dev_dbg(&client->dev, "Normal IAP procedure\n"); @@ -722,14
+695,10 @@ static int elants_i2c_do_update_firmware(struct i2c_client
*client,
                elants_i2c_sw_reset(client);
                msleep(20);

-               if (check_remark_id == true) {
-                       /* Validate Remark ID */
+               if (check_remark_id) {
                        error = elants_i2c_validate_remark_id(ts, fw);
-                       if (error) {
-                               dev_err(&client->dev, "failed to validate
Remark ID: %d\n",
-                                       error);
+                       if (error)
                                return error;
-                       }
                }

                error = elants_i2c_send(client, enter_iap,
sizeof(enter_iap));

-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com]
Sent: Wednesday, December 04, 2019 3:48 AM
To: Johnny.Chuang
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; STRD2-½²´f¼`;
james.chen@emc.com.tw; '±ç³Õµ¾'; 'jeff'
Subject: Re: [PATCH] Input: elants_i2c - Add Remark ID check flow in
firmware update function

Hi Johnny,

On Tue, Nov 19, 2019 at 01:59:45PM +0800, Johnny.Chuang wrote:
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

We only use this during firmware version check phase, no need to store it in
the device data structure.
[J]: I remove remark_id and move work of elants_i2c_query_remark_id() into
elants_i2c_validate_remark_id().

>  	unsigned int x_res;	/* resolution in units/mm */
>  	unsigned int y_res;
>  	unsigned int x_max;
> @@ -200,6 +203,10 @@ static int elants_i2c_execute_command(struct 
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
> @@ -556,6 +563,8 @@ static int elants_i2c_initialize(struct 
> elants_data *ts)
>  
>  	/* hw version is available even if device in recovery state */
>  	error2 = elants_i2c_query_hw_version(ts);
> +	if (!error2)
> +		error2 = elants_i2c_query_bc_version(ts);

Can you please explain why this change is done? This does not seem to relate
to the "remark id" functionality. Should it be a separate change?
[J]: We use ts->iap_version as check_remark_id to run validate remark id
flow or not. Hence we need to get iap_version by elants_i2c_query_bc_version
not only on normal mode but also on recovery mode.

>  	if (!error)
>  		error = error2;
>  
> @@ -564,8 +573,6 @@ static int elants_i2c_initialize(struct elants_data
*ts)
>  	if (!error)
>  		error = elants_i2c_query_test_version(ts);
>  	if (!error)
> -		error = elants_i2c_query_bc_version(ts);
> -	if (!error)
>  		error = elants_i2c_query_ts_info(ts);
>  
>  	if (error)
> @@ -613,39 +620,124 @@ static int elants_i2c_fw_write_page(struct 
> i2c_client *client,
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

I do not think we need be this noisy. Either dev_dbg, or drop it completely.
[J]: drop done.

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
[J]: drop done.

> +	if (fw_remark_id != ts->remark_id) {
> +		dev_err(&client->dev,
> +			"Remark ID Mismatched: ts_remark_id=0x%04x,
> fw_remark_id=0x%x.\n",

You can use "%#04x" to format with prefix.
[J]: Thanks for your recommendation. I still keep 0x%04x as other in this
driver. I will submit another patch for all prefix change later.

> +			ts->remark_id, fw_remark_id);
> +		return -ENODATA;

I'd say -EINVAL here.
[J]: change done.

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
[J]: change done.


> +			/* Validate Remark ID */

This comment is not needed, you named the function that you are calling
below well and its name describes what we are trying to do perfectly.
[J]: drop done.

> +			error = elants_i2c_validate_remark_id(ts, fw);
> +			if (error) {
> +				dev_err(&client->dev,
> +					"failed to validate Remark ID:
> %d\n",
> +					error);

elants_i2c_validate_remark_id() already gives necessary diagnostic, this
message is not needed.
[J]: drop done.

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
[J]: drop done. It's for another change.

> +
>  		error = elants_i2c_send(client, enter_iap2,
sizeof(enter_iap2));
> +		if (error) {
> +			dev_err(&client->dev, "failed to enter IAP mode:
> %d\n",
> +				error);
> +			return error;
> +		}
> +		msleep(20);

We already have msleep(20) in the common path below, do we really need 2nd
one here?
[J]: drop done. It's typo.

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
> +		if (check_remark_id == true) {

		if (check_remark_id) {

> +			/* Validate Remark ID */

Drop comment.
[J]: drop done.

> +			error = elants_i2c_validate_remark_id(ts, fw);
> +			if (error) {
> +				dev_err(&client->dev, "failed to validate
> Remark ID: %d\n",
> +					error);

Drop message.
[J]: drop done.

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

