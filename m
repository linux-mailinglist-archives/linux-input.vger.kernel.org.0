Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CD12661A6
	for <lists+linux-input@lfdr.de>; Fri, 11 Sep 2020 16:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgIKO6Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 10:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgIKO5c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 10:57:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217D4C0612F3;
        Fri, 11 Sep 2020 07:50:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so12634400ljj.12;
        Fri, 11 Sep 2020 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=keOmaMSC1f/6krcZUSHtu67VeNUhv2XTpQaabLC7Uxs=;
        b=HcIv65g3o85yTMO5d3Qd2bJTGTIMibPKbLp5vphXPbT4Z7r0lWk1X0Uz+UoXX84Ojc
         b/XSw2GCGUC49nK5TjR5jvIX/Ow0ZISBu/xcF51fJva9kl3M9raYXOVw4bQnqwI9wG1n
         2JCZ5smTAliiSx49/jqQb/JAWawe4McWQTTCE5JW+zM0gdCIQnwwg/hn561LyS7fVCpB
         NzsrvmP3f+uJZF7tqYGzFPI6VrC6T32EreOMJDA9jDLmapUACXuhIz5VMS4nFfoOUVWD
         IHD1RZqyBn30jzBhpKkj2ijgp3UWakWvJDuMLSmw+a1B/ORRwIcO/mjmvhZii5zKrhAY
         vVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=keOmaMSC1f/6krcZUSHtu67VeNUhv2XTpQaabLC7Uxs=;
        b=L2+H0KUH23US/mbmo7NIkqaIKe6h5rUqzXSXVSQy8A7yqnqSQAqPANIHvBcBFUCcT9
         CgFrRMWLRy5YRlIllA8O5J282My9OPcsk8EAXPqYmGsgCFzeO5DBCIluQOUvbAC8lEVT
         TSJo5PZP+4fp6Huu/R/Lz7dAvL7a6wiFh/sz7siR/FOIiHD333LH+tXuscxT9ROuC/bY
         tNkJqQe1DVsv4xfz7dkay+CScwWTn+/1xw6ltaOrPjV9nNETe0Hbi2cQ5+rZ+gWjKkpx
         fhF+obsBR2o++xa67Ozt4J/Kg1rbrLFxcFDA+cZOftLQk3Lv/ofAWEn+OnTxmedHpvHz
         Dt9Q==
X-Gm-Message-State: AOAM531lvRC8I5uLDoY76s26aX7OuHqq3ZSWvd2wsIKC4o+APp1e/Iqv
        k8ExT2rlTcxPF/jRL7I3mso=
X-Google-Smtp-Source: ABdhPJz96jWQ7avP9u0tV5ffhgxC3hXOAhFpEQMWJnI4tOBpx9/gReMaiGE6y+nOqEHgQUuQctGwoQ==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr974424ljj.268.1599835829537;
        Fri, 11 Sep 2020 07:50:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 18sm465533lfg.29.2020.09.11.07.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 07:50:28 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew_Gabbasov@mentor.com, erosca@de.adit-jv.com
References: <20200908151617.12199-1-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6041c677-592b-388e-2eb6-3287a3d92e4b@gmail.com>
Date:   Fri, 11 Sep 2020 17:50:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151617.12199-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

08.09.2020 18:16, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> when they are in a sleep state. It must be retried after a delay for the
> chip to wake up.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Yufeng Shen <miletus@chromium.org>

> (cherry picked from ndyer/linux/for-upstream commit 63fd7a2cd03c3a572a5db39c52f4856819e1835d)

Hello, Jiada!

In the comment to v2 Andy Shevchenko suggested that it should be better
to remove the "cherry picked from ..." info from the commit message
because that commit can't be found in the kernel.org git repo, and thus,
it's not a very useful information.

Also, please note that the original ACK from Yufeng Shen probably isn't
valid anymore since you modified the patch. Hence it should be better to
remove it.


You may also add my r-b and t-b tags to the commit message that I gave
to the v2.

> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [jiada: return exact errno when i2c_transfer & i2c_master_send fails,
> 	add "_MS" suffix MXT_WAKEUP_TIME]
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
>  1 file changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f..145780f78122 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -196,6 +196,7 @@ enum t100_type {
>  #define MXT_CRC_TIMEOUT		1000	/* msec */
>  #define MXT_FW_RESET_TIME	3000	/* msec */
>  #define MXT_FW_CHG_TIMEOUT	300	/* msec */

> +#define MXT_WAKEUP_TIME_MS	25	/* msec */

I think Andy Shevchenko meant here that the "/* msec */" comment won't
be needed and should be removed if _MS postfix is added to the name.

But I think you should keep this hunk as it was in v2 and then there
could be a new separate patch which renames all those timeouts at once.
This will keep code consistent in regards to the chosen naming convention.

>  /* Command to unlock bootloader */
>  #define MXT_UNLOCK_CMD_MSB	0xaa
> @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>  	struct i2c_msg xfer[2];
>  	u8 buf[2];
>  	int ret;
> +	bool retry = false;
>  
>  	buf[0] = reg & 0xff;
>  	buf[1] = (reg >> 8) & 0xff;
> @@ -642,17 +644,22 @@ static int __mxt_read_reg(struct i2c_client *client,
>  	xfer[1].len = len;
>  	xfer[1].buf = val;
>  
> -	ret = i2c_transfer(client->adapter, xfer, 2);
> -	if (ret == 2) {
> -		ret = 0;
> -	} else {
> -		if (ret >= 0)
> -			ret = -EIO;
> -		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
> -			__func__, ret);
> +retry_read:
> +	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> +	if (ret != ARRAY_SIZE(xfer)) {
> +		if (!retry) {
> +			dev_dbg(&client->dev, "%s: i2c retry\n", __func__);
> +			msleep(MXT_WAKEUP_TIME_MS);
> +			retry = true;
> +			goto retry_read;
> +		} else {
> +			dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
> +				__func__, ret);
> +			return ret < 0 ? ret : -EIO;
> +		}

Andy also suggested that it could be a cleaner to write such code like this:

if (ret != ARRAY_SIZE(xfer)) {
	if (!retry) {
		...
		goto retry_read;
	}

	dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
		__func__, ret);

	return ret < 0 ? ret : -EIO;
}

>  	}
>  
> -	return ret;
> +	return 0;
>  }
...
