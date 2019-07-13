Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686926795B
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfGMIuD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:50:03 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45441 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfGMIuD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:50:03 -0400
Received: by mail-pl1-f196.google.com with SMTP id y8so5907940plr.12;
        Sat, 13 Jul 2019 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jn3UuQzimHMWa4tVnjT6FvlQuhUCl2KxI+GQSZJ4Hz8=;
        b=Agz7Wc3mldUgkAnDYW5aJpuiERe8fef3XMAjSIvJS9H/UeNjuP5kmAAdTpEHQ78Uks
         U+Kt/1V1bSeqED/fuC+ZqwCG3ytmIDKZGLeO0ZPuu4LzYxvi9K4p/bG2zucdHIo6ASfj
         U+m7Yaa+LonQzkP0uBmgoy8sPpB3dOg0IjeTeANjzQn6+h+roMhajgi0fIi9UsRAFfz3
         u2RNOUHAiEouHSjCiX19Az7GPiVWcD7JXPVSJ1l3hGw8vZ5XpwDK7TBebto4hnjWFLrY
         FqgJWa/6gvLn+jn/o4I4QiHOW6shGOHk4CtPnKJc2qzK65ZygoCcapcYoKellnGjlSfc
         GJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jn3UuQzimHMWa4tVnjT6FvlQuhUCl2KxI+GQSZJ4Hz8=;
        b=RK8lKpNNVbS/GoBRIGfzdOVDKooi8DWa/ix1SF57gCJgfBRlxC8yve3wQ3JDF8EsS3
         61sxz4JuImc2aCbj5VayLAHlHW/cF6ZMccDCE/v69YTcYL/S07ledIdyEN9pHjcSFy9q
         +1l6io/HCT4xOXB0wdxfw08Nibqye5mEKUImYqNVxKT4Irctc3Hidjp8d3W0vkiLfE0o
         JHcUjHywbhJi3R6Rvhec28/bbTQpHS27+qc2CU2DCTqx9rJTgFAnurfzylkdy4YeYiPT
         Gf/1nTHUQWYVBVQtAsHJEASiEwQLgpSqNJWElDietSGcQPSaURbMV7+Vz91IIRWa5ter
         ev3w==
X-Gm-Message-State: APjAAAX04GCYDIm8n/2OPxfx9wpe+gR2oNN6ecxGqxnP8trx6U0k2p9C
        AqJQSWFWdP1S5dcicaTyOis=
X-Google-Smtp-Source: APXvYqyP2IvVry+Dq7i3BJ2ZVxg+1U4YTaoeX+b62lwzdtAqHpNCJF/gpRYgSXj9dWNBA532K8plcw==
X-Received: by 2002:a17:902:8a8a:: with SMTP id p10mr17003088plo.88.1563007802340;
        Sat, 13 Jul 2019 01:50:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j20sm10837292pfr.113.2019.07.13.01.50.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 01:50:01 -0700 (PDT)
Date:   Sat, 13 Jul 2019 01:49:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] Input: auo-pixcir-ts - Replace devm_add_action()
 followed by failure action with devm_add_action_or_reset()
Message-ID: <20190713084959.GA103820@dtor-ws>
References: <20190708123347.12081-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708123347.12081-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 08, 2019 at 08:33:47PM +0800, Fuqian Huang wrote:
> devm_add_action_or_reset() is introduced as a helper function which 
> internally calls devm_add_action(). If devm_add_action() fails 
> then it will execute the action mentioned and return the error code.
> This reduce source code size (avoid writing the action twice) 
> and reduce the likelyhood of bugs.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/auo-pixcir-ts.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
> index 8e48fbda487a..8e9f3b7b8180 100644
> --- a/drivers/input/touchscreen/auo-pixcir-ts.c
> +++ b/drivers/input/touchscreen/auo-pixcir-ts.c
> @@ -602,9 +602,8 @@ static int auo_pixcir_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	error = devm_add_action(&client->dev, auo_pixcir_reset, ts);
> +	error = devm_add_action_or_reset(&client->dev, auo_pixcir_reset, ts);
>  	if (error) {
> -		auo_pixcir_reset(ts);
>  		dev_err(&client->dev, "failed to register reset action, %d\n",
>  			error);
>  		return error;
> -- 
> 2.11.0
> 

-- 
Dmitry
