Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1740D2AFEE0
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 06:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbgKLFhP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 00:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgKLBrz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 20:47:55 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C989C0613D6;
        Wed, 11 Nov 2020 17:47:54 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q5so3013964pfk.6;
        Wed, 11 Nov 2020 17:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JbYWKdC0GT7oKO4tgl2u0b3N+QRGFv6VgZAa97ZnqKw=;
        b=DT1Ans6VVrStLvNSh5CpmQgWav6Eeh7ObmoTzfHH5QbPIuNGQhmcW8+Q3qav+YrWny
         jp1kuv3ooKHgkruAkEKUpnlLc4C4rFILDQF0WPh4jykLNM5fHWCglWmmItoTFm3hUkmq
         eHAmPzWpP7qQyYDZiLhDb0rBg8iMuPE/gNrD2hZEWOjm/4EmsFe251v11SGXkRPqwFId
         Tm56q+JCU23YiqeFL7GLtfoXU+kFwB3jlY6/rnv8m5Vp4T4XIX6CURe+X3W627aa5MyN
         o7PE0ZDTeFlieywC2FNiJTAdTqxw7PKg7eeqQgDxbQr5WIN4uOToN2IKm1U0cIt8UUa/
         RalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JbYWKdC0GT7oKO4tgl2u0b3N+QRGFv6VgZAa97ZnqKw=;
        b=uNrv9y4aGeIAoVkMz6flk1Au9Fe/u37kfKgf2vyPA6Tgu3fnOHVMsSHkC298VSvoS+
         GyJ7n192Boszu7k0nSWt1cJ7DM98ChEkKykyOj+J5dw8WJ0vJNkkx4Yq6R+xvalXZ/fV
         q9Chm0fkHVqaanRTtIHjNSBTAs7ucPji2v2+E555JRXXkWbp+1PTEyckGNogfzU0Fkha
         iZXK/pM8YqyJjuCdqvlAmy0qvhECJswum5GAb+J19mMSx04fZo78CbtAf8x8uFflghBm
         CXFgGCdzW9Le263EImFs+q1clPeIo5QAVRArfGXCQp9Urob7FJOUyPPyukZ2DIqaeL8S
         BEPg==
X-Gm-Message-State: AOAM531ro7VzRBUuuOFGhQG+Iprnjj3o+cDHRUeTlCkx+n0g7On5UiJ3
        MBuhqls9JXgMqoFZzjdrgd01Z5UtJ3U=
X-Google-Smtp-Source: ABdhPJwFmoMXOc5X/VTPyE4Jg1ytlHItTf+jXCSSx84H/EtfhKJAsJniCDVSvu5GpYXAmvtdIl+LnA==
X-Received: by 2002:a17:90a:f00a:: with SMTP id bt10mr6443969pjb.91.1605145673475;
        Wed, 11 Nov 2020 17:47:53 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a10sm3780384pjq.17.2020.11.11.17.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 17:47:52 -0800 (PST)
Date:   Wed, 11 Nov 2020 17:47:50 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw
Subject: Re: [PATCH] Input: elan_i2c - Modify the correct input of the iap
 page type command.
Message-ID: <20201112014750.GB1003057@dtor-ws>
References: <20201104070804.32044-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104070804.32044-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Wed, Nov 04, 2020 at 03:08:04PM +0800, jingle.wu wrote:
> The iap page type command of the parameter is page_size.

You need to supply your "Signed-off-by: " for me to apply this patch.

Thanks!

> ---
>  drivers/input/mouse/elan_i2c.h       |  2 +-
>  drivers/input/mouse/elan_i2c_core.c  |  3 ++-
>  drivers/input/mouse/elan_i2c_i2c.c   | 10 +++++-----
>  drivers/input/mouse/elan_i2c_smbus.c |  2 +-
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
> index c75b00c45d75..36e3cd908671 100644
> --- a/drivers/input/mouse/elan_i2c.h
> +++ b/drivers/input/mouse/elan_i2c.h
> @@ -78,7 +78,7 @@ struct elan_transport_ops {
>  	int (*iap_reset)(struct i2c_client *client);
>  
>  	int (*prepare_fw_update)(struct i2c_client *client, u16 ic_type,
> -				 u8 iap_version);
> +				 u8 iap_version, u16 fw_page_size);
>  	int (*write_fw_block)(struct i2c_client *client, u16 fw_page_size,
>  			      const u8 *page, u16 checksum, int idx);
>  	int (*finish_fw_update)(struct i2c_client *client,
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index c599e21a8478..61ed3f5ca219 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -497,7 +497,8 @@ static int __elan_update_firmware(struct elan_tp_data *data,
>  	u16 sw_checksum = 0, fw_checksum = 0;
>  
>  	error = data->ops->prepare_fw_update(client, data->ic_type,
> -					     data->iap_version);
> +					     data->iap_version,
> +					     data->fw_page_size);
>  	if (error)
>  		return error;
>  
> diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
> index 5a496d4ffa49..13dc097eb6c6 100644
> --- a/drivers/input/mouse/elan_i2c_i2c.c
> +++ b/drivers/input/mouse/elan_i2c_i2c.c
> @@ -517,7 +517,7 @@ static int elan_i2c_set_flash_key(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int elan_read_write_iap_type(struct i2c_client *client)
> +static int elan_read_write_iap_type(struct i2c_client *client, u16 fw_page_size)
>  {
>  	int error;
>  	u16 constant;
> @@ -526,7 +526,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
>  
>  	do {
>  		error = elan_i2c_write_cmd(client, ETP_I2C_IAP_TYPE_CMD,
> -					   ETP_I2C_IAP_TYPE_REG);
> +					   fw_page_size / 2);
>  		if (error) {
>  			dev_err(&client->dev,
>  				"cannot write iap type: %d\n", error);
> @@ -543,7 +543,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
>  		constant = le16_to_cpup((__le16 *)val);
>  		dev_dbg(&client->dev, "iap type reg: 0x%04x\n", constant);
>  
> -		if (constant == ETP_I2C_IAP_TYPE_REG)
> +		if (constant == fw_page_size / 2)
>  			return 0;
>  
>  	} while (--retry > 0);
> @@ -553,7 +553,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
>  }
>  
>  static int elan_i2c_prepare_fw_update(struct i2c_client *client, u16 ic_type,
> -				      u8 iap_version)
> +				      u8 iap_version, u16 fw_page_size)
>  {
>  	struct device *dev = &client->dev;
>  	int error;
> @@ -594,7 +594,7 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client, u16 ic_type,
>  	}
>  
>  	if (ic_type >= 0x0D && iap_version >= 1) {
> -		error = elan_read_write_iap_type(client);
> +		error = elan_read_write_iap_type(client, fw_page_size);
>  		if (error)
>  			return error;
>  	}
> diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
> index 8ff823751f3b..1820f1cfc1dc 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -340,7 +340,7 @@ static int elan_smbus_set_flash_key(struct i2c_client *client)
>  }
>  
>  static int elan_smbus_prepare_fw_update(struct i2c_client *client, u16 ic_type,
> -					u8 iap_version)
> +					u8 iap_version, u16 fw_page_size)
>  {
>  	struct device *dev = &client->dev;
>  	int len;
> -- 
> 2.17.1
> 

-- 
Dmitry
