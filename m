Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD0DEB415D
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 21:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388409AbfIPTvI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 15:51:08 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45400 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732089AbfIPTvI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 15:51:08 -0400
Received: by mail-pg1-f196.google.com with SMTP id 4so564343pgm.12;
        Mon, 16 Sep 2019 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g4E1tZuRyh9MX/G+KID/ikEcNEvNneZ6YHmUSE3jTcI=;
        b=MIZz3UnQlgQ+lsRwFa6I4yKgciYkI0PrdxILWh1/7gvb+QZxmiK8R8umpSJ0ROCyN0
         Pwyf1wHEtmkEquOweso+6l150zNJYFy6E5vg/IykQgBIr2LWp+m9igoMnClMcxzc4xF/
         CfQRuNZcdxrfvfhwWEx/kPMjKFQakbC5Cxs8C2212GuRJHhPlzqLueQe3wfBp5tvFFX+
         m3rlF2twffnn0YtqaNDA3cxMxoo/jhWLtfnRoSBELoeFHsNHAULu6CiqdAs4wgxY8CPY
         UkBA5w6MPsZSo+S9o9BZJXNcAvkk5IM7faRGXQhcPbIm6pRaWEAHy2apsb1EwBlQM3mh
         Rffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g4E1tZuRyh9MX/G+KID/ikEcNEvNneZ6YHmUSE3jTcI=;
        b=YVJGZJ3yGsU3W1N489dO+fijDTIPw3/RO9fQkW5bR8J5jWkkC45GexlLJ4abb8zDKC
         EptkyuSXZX7kOHwN8VOwgZX9dTtsE7UEbemzlmNIsQL8f/HPt0+nyQsY1gFhM/s6Xyit
         qUxRNFf735cYWs1ncncEbKrBf/xARmtxfmlU+Wf1wZtwA6TzOD71IwI8pdLD/En0lvaZ
         ZtlMpeQsnGeu6S+LOPawK4DoMy6HYSGxjYDVd5xXBQxPDEfv6xNvFrvhM5/Vjw4qnjmc
         nqRJwVNqZ37j4V08AtObffhfOJT/Uk60DGFIDrgIB2miSCJFMI/R9mbL9Z1SHUsKA7/x
         2rRw==
X-Gm-Message-State: APjAAAUKEf/yMoRAOkDdebruf7QcY1ROvNPe/yPrB6uTFIB7aKAS5CSG
        gYcY4zHbkXUriQ8BHZcOVhQ=
X-Google-Smtp-Source: APXvYqwAXYIWawMNGuJoJuFBVQtnxHpkjZZyPoszz9jkTglmPqDsEfwlxj85eFlo/J7HhfGx2PHlUg==
X-Received: by 2002:a17:90a:248c:: with SMTP id i12mr983476pje.130.1568663467087;
        Mon, 16 Sep 2019 12:51:07 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 202sm71963434pfu.161.2019.09.16.12.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 12:51:05 -0700 (PDT)
Date:   Mon, 16 Sep 2019 12:51:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 4/4] Input: da9063 - fix capability and drop KEY_SLEEP
Message-ID: <20190916195103.GE237523@dtor-ws>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916140358.30036-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 16, 2019 at 04:03:58PM +0200, Marco Felsch wrote:
> Since commit f889beaaab1c ("Input: da9063 - report KEY_POWER instead of
> KEY_SLEEP during power key-press") KEY_SLEEP isn't supported anymore.
> So the input device don't report a key event if "dlg,disable-key-power"
> is set.
> 
> Fixes: f889beaaab1c ("Input: da9063 - report KEY_POWER instead of KEY_SLEEP during power key-press")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

> ---
>  drivers/input/misc/da9063_onkey.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
> index bc982fcc87eb..2362b1360a41 100644
> --- a/drivers/input/misc/da9063_onkey.c
> +++ b/drivers/input/misc/da9063_onkey.c
> @@ -242,10 +242,7 @@ static int da9063_onkey_probe(struct platform_device *pdev)
>  	onkey->input->phys = onkey->phys;
>  	onkey->input->dev.parent = &pdev->dev;
>  
> -	if (onkey->key_power)
> -		input_set_capability(onkey->input, EV_KEY, KEY_POWER);
> -
> -	input_set_capability(onkey->input, EV_KEY, KEY_SLEEP);
> +	input_set_capability(onkey->input, EV_KEY, KEY_POWER);
>  
>  	INIT_DELAYED_WORK(&onkey->work, da9063_poll_on);
>  
> -- 
> 2.20.1
> 

-- 
Dmitry
