Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2027F2AB1B
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2019 18:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfEZQTw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 May 2019 12:19:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42250 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfEZQTw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 May 2019 12:19:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id 33so4727533pgv.9;
        Sun, 26 May 2019 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fXlRZNcEP4F8WPTd31esv+LF/56xwIupnxT391VRU90=;
        b=oO3BCPCozi542Ht2j7sFL+U6TOnJZTsfJF9jzHp0tQeVtNbbKFzaNNFM/gumOsO6Xc
         uWpY2YY7oAVWfJCiMQ+KcRoXItwz/pdx02Aienqq6OS01dkJwzYqcPc90fQknx7Jn6Dt
         yDL1ireEYKLKCJbOeAbMHO3xbMdx+Jy/8avYnA09jfJN6AgxAJ/Ap8ERvSo2cPR0etLC
         na5Q3FW9icdLALaFSLVGCuwVCpybAqKAZQRby9xZV12tv0sZ+aX1FliRMGIEwdBLAj7H
         RphPbTTcWzGhjijVsZz8Rwas4+rfPTBf7W2mAwflYt2Hzlvg1HNsxs56T2lbTVHnRcuW
         EXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fXlRZNcEP4F8WPTd31esv+LF/56xwIupnxT391VRU90=;
        b=q5X0S4wwrhgQGkGtYKWySjkBB17IcTal53YV8+D+8/kPIz9KjRTHH8mDeoy6oWr3lJ
         93oNUAdqqsdOn5G8MZwRPdR158GJlPmlyBmXHXpVUxJ/8SDnq0+SL0g/383FOWlTC97Q
         CsduDE26yibqUB4ftIRi+mX8wHKPvyRFAJpZHMpLw+Fl8bmQWFKaar4wxNq6cZMxg+FR
         CjKstKnFDK8LxeqdImGQ5ijT2EIPejLeV5y7Y/HJg8xdny/NIpPsa98+iVLgj4QSrSYX
         Z6qvqBTm4bPLxD/8aNSphNaT9pAcdpt//3vzuaijk2B3ko8tbkRk04p6diWu5KV7NFRb
         mVrQ==
X-Gm-Message-State: APjAAAXU0VmLAVcmuaPfYFFyS54dzSndgnDkuyZ+UbG7YOIEmYx1Gzo9
        iqNE5IB+UF7TelSA9FTEB5c=
X-Google-Smtp-Source: APXvYqzMqjvEUEkHP+zNKu/eS325KBiM0HUe+6ypWP7FJmlJYDdV3JD6xSm5L090Q8oLh/Cm/B5ffQ==
X-Received: by 2002:aa7:9a8c:: with SMTP id w12mr44945770pfi.187.1558887591334;
        Sun, 26 May 2019 09:19:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f4sm8704963pfn.118.2019.05.26.09.19.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 May 2019 09:19:50 -0700 (PDT)
Date:   Sun, 26 May 2019 09:19:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH -next] Input: tca8418 - Remove set but not used variable
 ''
Message-ID: <20190526161949.GB256861@dtor-ws>
References: <20190525142921.18812-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525142921.18812-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 25, 2019 at 10:29:21PM +0800, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/input/keyboard/tca8418_keypad.c: In function tca8418_keypad_probe:
> drivers/input/keyboard/tca8418_keypad.c:269:24: warning: variable max_keys set but not used [-Wunused-but-set-variable]
> 
> It's not used since commit 16ff7cb1848a ("Input:
> tca8418-keypad - switch to using managed resources")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/tca8418_keypad.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
> index 6da607d3b811..3bbd7e652533 100644
> --- a/drivers/input/keyboard/tca8418_keypad.c
> +++ b/drivers/input/keyboard/tca8418_keypad.c
> @@ -266,7 +266,7 @@ static int tca8418_keypad_probe(struct i2c_client *client,
>  	struct tca8418_keypad *keypad_data;
>  	struct input_dev *input;
>  	u32 rows = 0, cols = 0;
> -	int error, row_shift, max_keys;
> +	int error, row_shift;
>  	u8 reg;
>  
>  	/* Check i2c driver capabilities */
> @@ -291,7 +291,6 @@ static int tca8418_keypad_probe(struct i2c_client *client,
>  	}
>  
>  	row_shift = get_count_order(cols);
> -	max_keys = rows << row_shift;
>  
>  	/* Allocate memory for keypad_data and input device */
>  	keypad_data = devm_kzalloc(dev, sizeof(*keypad_data), GFP_KERNEL);
> -- 
> 2.17.1
> 
> 

-- 
Dmitry
