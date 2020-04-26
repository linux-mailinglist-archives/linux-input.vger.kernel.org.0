Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39B61B8C75
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDZFIw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZFIw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:08:52 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE273C061A0C;
        Sat, 25 Apr 2020 22:08:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v2so5552274plp.9;
        Sat, 25 Apr 2020 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rpZ5LwReb/9bMLIyvEWIc7AGSe/rSazqQUWR6wLf4XA=;
        b=UbIXIRSSMkFQT14epHkXyv9nCOGc9zgxUeXmY+F1Y1+5wSANnbIG6THndtM6w5bEBs
         7O68VFAmTOlAKSPq5rTUTUAxLe8wocyaM9SWScQTj9Xeyo9TNPYqnxuOJtxcD8eIL+51
         jee9ze140dMw64Oo+CXD/JU99lzTJqQl+4E6fzGUKG2R/YWRE/oNNT8AOEdT3fulj8Gw
         H2NV3Ykf8JAOsFrlgP94afKo8rBXnla9kcG3ZVWry4sIVeSG/BC9Z4/tk5ZWzmyONpr7
         I31TVSG71IItg3SnWIeeSnfwIkSs3JJWlh2RDl/iJThdl3kXIq0UjXFIpiA1ktHcpcTm
         H08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rpZ5LwReb/9bMLIyvEWIc7AGSe/rSazqQUWR6wLf4XA=;
        b=M1N9oJrzrCQsNjYnluAhTQHeQJi7Xw0QLmtx4jodnibu5RzRGeQsWKjt0KNTMiImK4
         bc7rCYof3ujsL+SrRT5qt8/tHePdvSfrJGtq+xT2L+5FJteHNfZMX9ZOGszCUC5rYr0o
         qFN2iDwPxdV9htNbfmgi666zcOGNWrpXsHCdFf+UNW3iFSQ9SJ3/9QjCvSMi7/ARWEHx
         1kQBL4waIm50NWHmxqWgJv3iNJtLL0aMVpr88/YK8ud0hDYuE0/XR74xPAS3t8Xfmhfn
         rLy9Mlquq/arwI1oP3+hbPzSG2LfzYM8+9HyzVaJNA5MT08Pxf5nmTetDRUp5b33e6Im
         /lBw==
X-Gm-Message-State: AGi0PubeqKgw/T7iQXnoqG2ojjRz34cUTovSXidxjlpd9GBGHNgGIp7O
        lrER7Z5FmgCVB+VuX+ynZNc=
X-Google-Smtp-Source: APiQypJhGHgCIyM1CLnNkmfcWtjD0/L21d7b83pcF5MEhqmD3mYsbOFEoRUkQXFrW9Eaq5GV9gl6Pg==
X-Received: by 2002:a17:90b:3751:: with SMTP id ne17mr16007306pjb.114.1587877730225;
        Sat, 25 Apr 2020 22:08:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id k12sm8056164pgj.33.2020.04.25.22.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 22:08:49 -0700 (PDT)
Date:   Sat, 25 Apr 2020 22:08:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] input: elants: refactor
 elants_i2c_execute_command()
Message-ID: <20200426050847.GO125362@dtor-ws>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <934e4ed8808de930f7380ce50cb3063c4039514e.1586784389.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934e4ed8808de930f7380ce50cb3063c4039514e.1586784389.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 03:32:24PM +0200, Michał Mirosław wrote:
> Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
> polling and error printk()s into a single function.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 189 +++++++++++++------------
>  1 file changed, 96 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 87d686ce08f2..b0f083f7f2a9 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -205,7 +205,8 @@ static int elants_i2c_read(struct i2c_client *client, void *data, size_t size)
>  
>  static int elants_i2c_execute_command(struct i2c_client *client,
>  				      const u8 *cmd, size_t cmd_size,
> -				      u8 *resp, size_t resp_size)
> +				      u8 *resp, size_t resp_size,
> +				      int retries, const char *cmd_name)
>  {
>  	struct i2c_msg msgs[2];
>  	int ret;
> @@ -225,30 +226,55 @@ static int elants_i2c_execute_command(struct i2c_client *client,
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

I'd prefer if we returned 0 on success and I'd be OK when flashing
firmware to have separate retry counters for the command themselves and
for checking the response.

Thanks.

-- 
Dmitry
