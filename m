Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FB521CD68
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 04:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGMCxX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jul 2020 22:53:23 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:65089 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728559AbgGMCxW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jul 2020 22:53:22 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36395012"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 13 Jul 2020 10:53:12 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(100989:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Mon, 13 Jul 2020 10:53:12 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2485:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Mon, 13 Jul 2020 10:53:09 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <phoenix@emc.com.tw>, <josh.chen@emc.com.tw>,
        <dave.wang@emc.com.tw>
References: <20200710054047.5473-1-jingle.wu@emc.com.tw> <20200712060846.GA3224245@dtor-ws>
In-Reply-To: <20200712060846.GA3224245@dtor-ws>
Subject: RE: [PATCH 1/2] Input: elan_i2c - Add ic type 0x11 0x13 0x14.
Date:   Mon, 13 Jul 2020 10:53:09 +0800
Message-ID: <000301d658c0$bdbc55d0$39350170$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFfRhhlA2l6ZyS8J6fW4qHcbJaTVwIg6JkiqeHm7UA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1mYjM3MzM4Yi1jNGIzLTExZWEtODE5YS1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcZmIzNzMzOGQtYzRiMy0xMWVhLTgxOWEtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIxODg5NSIgdD0iMTMyMzkwODIzODkxNDgwNDQ4IiBoPSI0VExheGIyclhVVjFWY0Y5eTRIa1VrRHV0L3M9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry:

1. Could you please tell me what devices this patch was tested with? I want
to be sure we are not only adding support for newer devices, but also not
breaking existing ones.
--> The device which this patch was tested with was "coral".
--> Its corresponding ic_type was 0xD, 0xE, 0x10, 0x11, 0x13 0x14.

2. Also, could you please split this patch in 2: one adding variable length
firmware page size support, and another adding the new IC types.
--> As a result, Do I need to up-stream in total 3 patches?

3. 
> +	case 0x14:
>  		*validpage_count = 1024;
>  		break;

I would prefer if we listed 0x14 separately below.
--> OK

4. Do we really need to check ic_type here in addition to iap_version?
--> Yes, different ic_type might feat with different iap version

I.e. IC 0x11 - can it have IAP 2? 
--> Yes

And will it be using 512 or 128 byte pages? In other words I am trying to
understand if we could determine page size solely by IAP version.
--> We need to have iap version and ic_type information to determine the
page size (512 or 128).

5. I think we have data->fw_page_size, we do not need to pass it separately
here.
--> OK

6.
> +
> +	if ((val[0] == 0xFF) && (val[1] == 0xFF))
> +		*pattern = 0;
> +	else
> +		*pattern = val[1];

This needs a comment explaining why we are doing it.
--> Some firmware of the IC_type did not create the pattern reading command,
they would get 0xFF 0xFF value if we trigger the pattern command.
As a result, we initial it as 0.

7. Haven't we queried IAP version already? Can we pass it in, along with
ic_type?
--> OK

8.
> +	if ((ic_type >= 0x0D) && (iap_version >= 1)) {

No need for parenthesis around simple comparisons. Also, do we really need
to check both ic type and iap version?
--> Yes

Is there ICs less than 0x0d with newer IAP versions?
--> There have not been the ICs less than 0x0d with newer IAP versions so
far.

9.
> -	u8 page_store[ETP_FW_PAGE_SIZE + 4];
> +	u8 *page_store = kcalloc(1, fw_page_size + 4, GFP_KERNEL);

Why kcalloc()? kzalloc() if you want cleared memoryi, but I think kmalloc
would be fine.
--> Yes, we want to clear the memory.

THANKS



-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Sunday, July 12, 2020 2:09 PM
To: Jingle Wu
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
phoenix@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw
Subject: Re: [PATCH 1/2] Input: elan_i2c - Add ic type 0x11 0x13 0x14.

Hi Jingle,

On Fri, Jul 10, 2020 at 01:40:47AM -0400, Jingle Wu wrote:
> Modify the iap method for all IC.
> Get the correct value of ic_type for old and new pattern of firmware.

Could you please tell me what devices this patch was tested with? I want to
be sure we are not only adding support for newer devices, but also not
breaking existing ones.

Also, could you please split this patch in 2: one adding variable length
firmware page size support, and another adding the new IC types.

> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c.h       |   6 +-
>  drivers/input/mouse/elan_i2c_core.c  |  52 ++++++++-----
>  drivers/input/mouse/elan_i2c_i2c.c   | 109 ++++++++++++++++++++++-----
>  drivers/input/mouse/elan_i2c_smbus.c |  10 +--
>  4 files changed, 134 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c.h 
> b/drivers/input/mouse/elan_i2c.h index a9074ac9364f..f28b747978f5 
> 100644
> --- a/drivers/input/mouse/elan_i2c.h
> +++ b/drivers/input/mouse/elan_i2c.h
> @@ -33,6 +33,8 @@
>  #define ETP_FW_IAP_PAGE_ERR	(1 << 5)
>  #define ETP_FW_IAP_INTF_ERR	(1 << 4)
>  #define ETP_FW_PAGE_SIZE	64
> +#define ETP_FW_PAGE_SIZE_128	128
> +#define ETP_FW_PAGE_SIZE_512	512
>  #define ETP_FW_SIGNATURE_SIZE	6
>  
>  struct i2c_client;
> @@ -72,8 +74,8 @@ struct elan_transport_ops {
>  	int (*iap_get_mode)(struct i2c_client *client, enum tp_mode *mode);
>  	int (*iap_reset)(struct i2c_client *client);
>  
> -	int (*prepare_fw_update)(struct i2c_client *client);
> -	int (*write_fw_block)(struct i2c_client *client,
> +	int (*prepare_fw_update)(struct i2c_client *client, u16 ic_type);
> +	int (*write_fw_block)(struct i2c_client *client, u16 fw_page_size,
>  			      const u8 *page, u16 checksum, int idx);
>  	int (*finish_fw_update)(struct i2c_client *client,
>  				struct completion *reset_done);
> diff --git a/drivers/input/mouse/elan_i2c_core.c 
> b/drivers/input/mouse/elan_i2c_core.c
> index 3f9354baac4b..0703f7d0d02d 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -89,7 +89,8 @@ struct elan_tp_data {
>  	u8			mode;
>  	u16			ic_type;
>  	u16			fw_validpage_count;
> -	u16			fw_signature_address;
> +	u16			fw_page_size;
> +	u32			fw_signature_address;
>  
>  	bool			irq_wake;
>  
> @@ -100,8 +101,10 @@ struct elan_tp_data {
>  	bool			middle_button;
>  };
>  
> -static int elan_get_fwinfo(u16 ic_type, u16 *validpage_count,
> -			   u16 *signature_address)
> +static int elan_get_fwinfo(u16 ic_type, u8 iap_version, 
> +                           u16 *validpage_count,
> +			   u32 *signature_address,
> +			   u16 *page_size)
>  {
>  	switch (ic_type) {
>  	case 0x00:
> @@ -124,18 +127,34 @@ static int elan_get_fwinfo(u16 ic_type, u16
*validpage_count,
>  		*validpage_count = 640;
>  		break;
>  	case 0x10:
> +	case 0x14:
>  		*validpage_count = 1024;
>  		break;

I would prefer if we listed 0x14 separately below.

> +	case 0x11:
> +		*validpage_count = 1280;
> +		break;
> +	case 0x13:
> +		*validpage_count = 2048;
> +		break;
>  	default:
>  		/* unknown ic type clear value */
>  		*validpage_count = 0;
>  		*signature_address = 0;
> +		*page_size = 0;
>  		return -ENXIO;
>  	}
>  
>  	*signature_address =
>  		(*validpage_count * ETP_FW_PAGE_SIZE) -
ETP_FW_SIGNATURE_SIZE;
>  
> +	if ((ic_type == 0x14) && (iap_version >= 2)) {
> +		*validpage_count /= 8;
> +		*page_size = ETP_FW_PAGE_SIZE_512;

Do we really need to check ic_type here in addition to iap_version?
I.e. IC 0x11 - can it have IAP 2? And will it be using 512 or 128 byte
pages? In other words I am trying to understand if we could determine page
size solely by IAP version.

> +	} else if ((ic_type >= 0x0D) && (iap_version >= 1)) {
> +		*validpage_count /= 2;
> +		*page_size = ETP_FW_PAGE_SIZE_128;
> +	} else
> +		*page_size = ETP_FW_PAGE_SIZE;
>  	return 0;
>  }
>  
> @@ -312,7 +331,6 @@ static int elan_initialize(struct elan_tp_data 
> *data)  static int elan_query_device_info(struct elan_tp_data *data)  
> {
>  	int error;
> -	u16 ic_type;
>  
>  	error = data->ops->get_version(data->client, false,
&data->fw_version);
>  	if (error)
> @@ -336,13 +354,10 @@ static int elan_query_device_info(struct
elan_tp_data *data)
>  	if (error)
>  		return error;
>  
> -	if (data->pattern == 0x01)
> -		ic_type = data->ic_type;
> -	else
> -		ic_type = data->iap_version;
> -
> -	error = elan_get_fwinfo(ic_type, &data->fw_validpage_count,
> -				&data->fw_signature_address);
> +	error = elan_get_fwinfo(data->ic_type, data->iap_version, 
> +				&data->fw_validpage_count,
> +				&data->fw_signature_address,
> +				&data->fw_page_size);
>  	if (error)
>  		dev_warn(&data->client->dev,
>  			 "unexpected iap version %#04x (ic type: %#04x),
firmware update 
> will not work\n", @@ -430,14 +445,14 @@ static int
elan_query_device_parameters(struct elan_tp_data *data)
>   * IAP firmware updater related routines
>   **********************************************************
>   */
> -static int elan_write_fw_block(struct elan_tp_data *data,
> +static int elan_write_fw_block(struct elan_tp_data *data, u16 
> +page_size,

I think we have data->fw_page_size, we do not need to pass it separately
here.

>  			       const u8 *page, u16 checksum, int idx)  {
>  	int retry = ETP_RETRY_COUNT;
>  	int error;
>  
>  	do {
> -		error = data->ops->write_fw_block(data->client,
> +		error = data->ops->write_fw_block(data->client, page_size,
>  						  page, checksum, idx);
>  		if (!error)
>  			return 0;
> @@ -460,21 +475,22 @@ static int __elan_update_firmware(struct
elan_tp_data *data,
>  	u16 boot_page_count;
>  	u16 sw_checksum = 0, fw_checksum = 0;
>  
> -	error = data->ops->prepare_fw_update(client);
> +	error = data->ops->prepare_fw_update(client, data->ic_type);
>  	if (error)
>  		return error;
>  
>  	iap_start_addr = get_unaligned_le16(&fw->data[ETP_IAP_START_ADDR * 
> 2]);
>  
> -	boot_page_count = (iap_start_addr * 2) / ETP_FW_PAGE_SIZE;
> +	boot_page_count = (iap_start_addr * 2) / data->fw_page_size;
>  	for (i = boot_page_count; i < data->fw_validpage_count; i++) {
>  		u16 checksum = 0;
> -		const u8 *page = &fw->data[i * ETP_FW_PAGE_SIZE];
> +		const u8 *page = &fw->data[i * data->fw_page_size];
>  
> -		for (j = 0; j < ETP_FW_PAGE_SIZE; j += 2)
> +		for (j = 0; j < data->fw_page_size; j += 2)
>  			checksum += ((page[j + 1] << 8) | page[j]);
>  
> -		error = elan_write_fw_block(data, page, checksum, i);
> +		error = elan_write_fw_block(data, data->fw_page_size,
> +						page, checksum, i);
>  		if (error) {
>  			dev_err(dev, "write page %d fail: %d\n", i, error);
>  			return error;
> diff --git a/drivers/input/mouse/elan_i2c_i2c.c 
> b/drivers/input/mouse/elan_i2c_i2c.c
> index 058b35b1f9a9..91ef0c7bda43 100644
> --- a/drivers/input/mouse/elan_i2c_i2c.c
> +++ b/drivers/input/mouse/elan_i2c_i2c.c
> @@ -19,6 +19,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
> +#include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <asm/unaligned.h>
>  
> @@ -43,6 +44,7 @@
>  #define ETP_I2C_RESOLUTION_CMD		0x0108
>  #define ETP_I2C_PRESSURE_CMD		0x010A
>  #define ETP_I2C_IAP_VERSION_CMD		0x0110
> +#define ETP_I2C_IAP_VERSION_CMD_OLD		0x0111
>  #define ETP_I2C_SET_CMD			0x0300
>  #define ETP_I2C_POWER_CMD		0x0307
>  #define ETP_I2C_FW_CHECKSUM_CMD		0x030F
> @@ -53,6 +55,8 @@
>  #define ETP_I2C_CALIBRATE_CMD		0x0316
>  #define ETP_I2C_MAX_BASELINE_CMD	0x0317
>  #define ETP_I2C_MIN_BASELINE_CMD	0x0318
> +#define ETP_I2C_IAP_TYPE_REG	0x0040
> +#define ETP_I2C_IAP_TYPE_CMD	0x0304
>  
>  #define ETP_I2C_REPORT_LEN		34
>  #define ETP_I2C_DESC_LENGTH		30
> @@ -249,7 +253,11 @@ static int elan_i2c_get_pattern(struct i2c_client
*client, u8 *pattern)
>  		dev_err(&client->dev, "failed to get pattern: %d\n", error);
>  		return error;
>  	}
> -	*pattern = val[1];
> +
> +	if ((val[0] == 0xFF) && (val[1] == 0xFF))
> +		*pattern = 0;
> +	else
> +		*pattern = val[1];

This needs a comment explaining why we are doing it.

>  
>  	return 0;
>  }
> @@ -259,6 +267,7 @@ static int elan_i2c_get_version(struct i2c_client 
> *client,  {
>  	int error;
>  	u8 pattern_ver;
> +	u16 iap_cmd;
>  	u8 val[3];
>  
>  	error = elan_i2c_get_pattern(client, &pattern_ver); @@ -266,9 
> +275,14 @@ static int elan_i2c_get_version(struct i2c_client *client,
>  		dev_err(&client->dev, "failed to get pattern version\n");
>  		return error;
>  	}
> +	
> +	if (pattern_ver >= 0x01)
> +		iap_cmd = ETP_I2C_IAP_VERSION_CMD;
> +	else
> +		iap_cmd = ETP_I2C_IAP_VERSION_CMD_OLD;

Can we make it

	if (!iap)
		cmd = ETP_I2C_FW_VERSION_CMD;
	else if (pattern_ver == 0)
		cmd = ETP_I2C_IAP_VERSION_CMD_OLD;
	else
		cmd = ETP_I2C_IAP_VERSION_CMD;

>  
>  	error = elan_i2c_read_cmd(client,
> -				  iap ? ETP_I2C_IAP_VERSION_CMD :
> +				  iap ? iap_cmd :
>  					ETP_I2C_FW_VERSION_CMD,
>  				  val);
>  	if (error) {
> @@ -277,7 +291,7 @@ static int elan_i2c_get_version(struct i2c_client
*client,
>  		return error;
>  	}
>  
> -	if (pattern_ver == 0x01)
> +	if (pattern_ver >= 0x01)
>  		*version = iap ? val[1] : val[0];
>  	else
>  		*version = val[0];
> @@ -298,7 +312,7 @@ static int elan_i2c_get_sm_version(struct i2c_client
*client,
>  		return error;
>  	}
>  
> -	if (pattern_ver == 0x01) {
> +	if (pattern_ver >= 0x01) {
>  		error = elan_i2c_read_cmd(client, ETP_I2C_IC_TYPE_CMD, val);
>  		if (error) {
>  			dev_err(&client->dev, "failed to get ic type: %d\n",
@@ -324,7 
> +338,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
>  			return error;
>  		}
>  		*version = val[0];
> -		*ic_type = val[1];
> +
> +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD,
val);
> +		if (error) {
> +			dev_err(&client->dev, "failed to get ic type: %d\n",
> +				error);
> +			return error;
> +		}
> +		*ic_type = val[0];
>  
>  		error = elan_i2c_read_cmd(client, ETP_I2C_NSM_VERSION_CMD,
>  					  val);
> @@ -507,13 +528,53 @@ static int elan_i2c_set_flash_key(struct i2c_client
*client)
>  	return 0;
>  }
>  
> -static int elan_i2c_prepare_fw_update(struct i2c_client *client)
> +static int elan_read_write_iap_type(struct i2c_client *client) {
> +	int error;
> +	u16 constant;
> +	u8 val[3];
> +	int retry = 3;
> +
> +	do {
> +		error = elan_i2c_write_cmd(client, ETP_I2C_IAP_TYPE_CMD,
> +				ETP_I2C_IAP_TYPE_REG);
> +		if (error) {
> +			dev_err(&client->dev,
> +					"cannot write iap type: %d\n",
error);
> +			return error;
> +		}
> +
> +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_TYPE_CMD,
val);
> +		if (error) {
> +			dev_err(&client->dev,
> +				"failed to read iap type register: %d\n",
> +				error);
> +			return error;
> +		}
> +		constant = le16_to_cpup((__le16 *)val);
> +		dev_dbg(&client->dev, "iap type reg: 0x%04x.\n", constant);
> +
> +		if (constant == ETP_I2C_IAP_TYPE_REG)
> +			return 0;
> +
> +	} while (--retry > 0);
> +
> +	dev_err(&client->dev, "cannot set iap type.\n");
> +	return -EIO;
> +}
> +
> +static int elan_i2c_prepare_fw_update(struct i2c_client *client, u16 
> +ic_type)
>  {
>  	struct device *dev = &client->dev;
>  	int error;
>  	enum tp_mode mode;
>  	u8 val[3];
>  	u16 password;
> +	u8 iap_version;
> +	
> +	error = elan_i2c_get_version(client, true, &iap_version);
> +	if (error)
> +		return error;

Haven't we queried IAP version already? Can we pass it in, along with
ic_type?

>  
>  	/* Get FW in which mode	(IAP_MODE/MAIN_MODE)  */
>  	error = elan_i2c_iap_get_mode(client, &mode); @@ -546,6 +607,12 @@ 
> static int elan_i2c_prepare_fw_update(struct i2c_client *client)
>  		dev_err(dev, "wrong mode: %d\n", mode);
>  		return -EIO;
>  	}
> +	
> +	if ((ic_type >= 0x0D) && (iap_version >= 1)) {

No need for parenthesis around simple comparisons. Also, do we really need
to check both ic type and iap version? Is there ICs less than 0x0d with
newer IAP versions?

> +		error = elan_read_write_iap_type(client);
> +		if (error)
> +			return error;
> +	}
>  
>  	/* Set flash key again */
>  	error = elan_i2c_set_flash_key(client); @@ -572,45 +639,51 @@ static

> int elan_i2c_prepare_fw_update(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int elan_i2c_write_fw_block(struct i2c_client *client,
> +static int elan_i2c_write_fw_block(struct i2c_client *client, u16 
> +fw_page_size,
>  				   const u8 *page, u16 checksum, int idx)  {
>  	struct device *dev = &client->dev;
> -	u8 page_store[ETP_FW_PAGE_SIZE + 4];
> +	u8 *page_store = kcalloc(1, fw_page_size + 4, GFP_KERNEL);

Why kcalloc()? kzalloc() if you want cleared memoryi, but I think kmalloc
would be fine.

>  	u8 val[3];
>  	u16 result;
> -	int ret, error;
> +	int ret, error = 0;
>  
>  	page_store[0] = ETP_I2C_IAP_REG_L;
>  	page_store[1] = ETP_I2C_IAP_REG_H;
> -	memcpy(&page_store[2], page, ETP_FW_PAGE_SIZE);
> +	memcpy(&page_store[2], page, fw_page_size);
>  	/* recode checksum at last two bytes */
> -	put_unaligned_le16(checksum, &page_store[ETP_FW_PAGE_SIZE + 2]);
> +	put_unaligned_le16(checksum, &page_store[fw_page_size + 2]);
>  
> -	ret = i2c_master_send(client, page_store, sizeof(page_store));
> -	if (ret != sizeof(page_store)) {
> +	ret = i2c_master_send(client, page_store, fw_page_size + 4);
> +	if (ret != fw_page_size + 4) {
>  		error = ret < 0 ? ret : -EIO;
>  		dev_err(dev, "Failed to write page %d: %d\n", idx, error);
> -		return error;
> +		goto exit;
>  	}
>  
>  	/* Wait for F/W to update one page ROM data. */
> -	msleep(35);
> +	if (fw_page_size == ETP_FW_PAGE_SIZE_512)
> +		msleep(50);
> +	else
> +		msleep(35);
>  
>  	error = elan_i2c_read_cmd(client, ETP_I2C_IAP_CTRL_CMD, val);
>  	if (error) {
>  		dev_err(dev, "Failed to read IAP write result: %d\n",
error);
> -		return error;
> +		goto exit;
>  	}
>  
>  	result = le16_to_cpup((__le16 *)val);
>  	if (result & (ETP_FW_IAP_PAGE_ERR | ETP_FW_IAP_INTF_ERR)) {
>  		dev_err(dev, "IAP reports failed write: %04hx\n",
>  			result);
> -		return -EIO;
> +		error = -EIO;
> +		goto exit;
>  	}
>  
> -	return 0;
> +exit:
> +	kfree(page_store);
> +	return error;
>  }
>  
>  static int elan_i2c_finish_fw_update(struct i2c_client *client, diff 
> --git a/drivers/input/mouse/elan_i2c_smbus.c 
> b/drivers/input/mouse/elan_i2c_smbus.c
> index 8c3185d54c73..1e762c90c894 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -340,7 +340,7 @@ static int elan_smbus_set_flash_key(struct i2c_client
*client)
>  	return 0;
>  }
>  
> -static int elan_smbus_prepare_fw_update(struct i2c_client *client)
> +static int elan_smbus_prepare_fw_update(struct i2c_client *client, 
> +u16 ic_type)
>  {
>  	struct device *dev = &client->dev;
>  	int len;
> @@ -414,7 +414,7 @@ static int elan_smbus_prepare_fw_update(struct 
> i2c_client *client)  }
>  
>  
> -static int elan_smbus_write_fw_block(struct i2c_client *client,
> +static int elan_smbus_write_fw_block(struct i2c_client *client, u16 
> +fw_page_size,
>  				     const u8 *page, u16 checksum, int idx)
{
>  	struct device *dev = &client->dev;
> @@ -429,7 +429,7 @@ static int elan_smbus_write_fw_block(struct i2c_client
*client,
>  	 */
>  	error = i2c_smbus_write_block_data(client,
>  					   ETP_SMBUS_WRITE_FW_BLOCK,
> -					   ETP_FW_PAGE_SIZE / 2,
> +					   fw_page_size / 2,
>  					   page);
>  	if (error) {
>  		dev_err(dev, "Failed to write page %d (part %d): %d\n", @@
-439,8 
> +439,8 @@ static int elan_smbus_write_fw_block(struct i2c_client 
> *client,
>  
>  	error = i2c_smbus_write_block_data(client,
>  					   ETP_SMBUS_WRITE_FW_BLOCK,
> -					   ETP_FW_PAGE_SIZE / 2,
> -					   page + ETP_FW_PAGE_SIZE / 2);
> +					   fw_page_size / 2,
> +					   page + fw_page_size / 2);
>  	if (error) {
>  		dev_err(dev, "Failed to write page %d (part %d): %d\n",
>  			idx, 2, error);
> --
> 2.17.1
> 

Thanks.

-- 
Dmitry

