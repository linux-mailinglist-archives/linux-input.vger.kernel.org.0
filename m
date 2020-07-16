Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBCC221C72
	for <lists+linux-input@lfdr.de>; Thu, 16 Jul 2020 08:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgGPGPd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 16 Jul 2020 02:15:33 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:60598 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgGPGPc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jul 2020 02:15:32 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36456287"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 16 Jul 2020 14:15:28 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(162485:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 16 Jul 2020 14:15:26 +0800 (CST)
Received: By OpenMail Mailer;Thu, 16 Jul 2020 14:15:23 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
Reply-To: "jingle.wu" <jingle.wu@emc.com.tw>
Subject: Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related functio
        n for page sizes 128, 512 bytes.
Message-ID: <1594880123.69588.jingle.wu@emc.com.tw>
In-Reply-To: <20200716053912.GB1665100@dtor-ws>
References: <20200714105641.15151-1-jingle.wu@emc.com.tw>
        <20200716053912.GB1665100@dtor-ws>
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     "linux-kernel" <linux-kernel@vger.kernel.org>,
        "linux-input" <linux-input@vger.kernel.org>,
        "phoenix" <phoenix@emc.com.tw>, "josh.chen" <josh.chen@emc.com.tw>,
        "kai.heng.feng" <kai.heng.feng@canonical.com>
Date:   Thu, 16 Jul 2020 14:15:23 +0800 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Dmitry:

Just to confirm, the older devices (I assume that pattern 0 means older)
 have version command that is numerically higher than the one for the
 newer (pattern >= 1) devices?

>> Yes, Pattern 1, 2 are newer devices.

> @@ -324,7 +342,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
>  			return error;
>  		}
>  		*version = val[0];
> -		*ic_type = val[1];
> +
> +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD, val);
> +		if (error) {
> +			dev_err(&client->dev, "failed to get ic type: %d\n",
> +				error);
> +			return error;
> +		}

Could you please tell me why this chunk is needed?
>> Modify the old pattern IC firmware read the correct ic_type.

In the elan_i2c_core.c, move this code to elan_i2c_i2c.c. 
static int elan_query_device_info(struct elan_tp_data *data)
{
	.....
	if (data->pattern == 0x01)
		ic_type = data->ic_type;
	else
		ic_type = data->iap_version;
	.....
	return 0;
}

THANKS

-----Original message-----
From:Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:Jingle Wu <jingle.wu@emc.com.tw>
Cc:linux-kernel@vger.kernel.org,linux-input@vger.kernel.org,phoenix@emc.com.tw,josh.chen@emc.com.tw,kai.heng.feng@canonical.com
Date:Thu, 16 Jul 2020 13:39:12
Subject:Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related function for page sizes 128, 512 bytes.

Hi Jingle,

On Tue, Jul 14, 2020 at 06:56:41AM -0400, Jingle Wu wrote:
> +	if (!iap)
> +		cmd = ETP_I2C_FW_VERSION_CMD;
> +	else if (pattern_ver == 0)
> +		cmd = ETP_I2C_IAP_VERSION_CMD_OLD;

Just to confirm, the older devices (I assume that pattern 0 means older)
have version command that is numerically higher than the one for the
newer (pattern >= 1) devices?

> +	else
> +		cmd = ETP_I2C_IAP_VERSION_CMD;
>  
> -	error = elan_i2c_read_cmd(client,
> -				  iap ? ETP_I2C_IAP_VERSION_CMD :
> -					ETP_I2C_FW_VERSION_CMD,
> -				  val);
> +	error = elan_i2c_read_cmd(client, cmd, val);
>  	if (error) {
>  		dev_err(&client->dev, "failed to get %s version: %d\n",
>  			iap ? "IAP" : "FW", error);
>  		return error;
>  	}
>  
> -	if (pattern_ver == 0x01)
> +	if (pattern_ver >= 0x01)
>  		*version = iap ? val[1] : val[0];
>  	else
>  		*version = val[0];
> @@ -298,7 +316,7 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	if (pattern_ver == 0x01) {
> +	if (pattern_ver >= 0x01) {
>  		error = elan_i2c_read_cmd(client, ETP_I2C_IC_TYPE_CMD, val);
>  		if (error) {
>  			dev_err(&client->dev, "failed to get ic type: %d\n",
> @@ -324,7 +342,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
>  			return error;
>  		}
>  		*version = val[0];
> -		*ic_type = val[1];
> +
> +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD, val);
> +		if (error) {
> +			dev_err(&client->dev, "failed to get ic type: %d\n",
> +				error);
> +			return error;
> +		}

Could you please tell me why this chunk is needed?

Thanks.

-- 
Dmitry
