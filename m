Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C003397F43
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 17:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfHUPoh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 11:44:37 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35883 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfHUPog (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 11:44:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id w2so1688460pfi.3
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oDutW/I35TP+jX1O/z5kU6iTGS5iSehx2vcFXJv5b5I=;
        b=UCoMZT1CeGIB6kqbX8RgNf36WSiKEsxNpsU1oEf+H6+lALhE3VVgCD+opMVaKEksTf
         kbmFYSDZfWGxvuXdwfAzyfBFyeZqx+kfUARWGufaV6inhcI2CtnPUPLuteYaLHMLBshj
         iiUXVORALrqWrHuC/3fSbKMBYSPTIAIF2MqmRYW8N7MPzKgNpMXEmUR4ol8U8+otxsHl
         9rCU2kb3Q5M9VJzdLvEv9EXUYkTTVJUIXGbbocEV0yz7PhAvNaOV1E4b7+74LtCruzlL
         MoS88ZlfInYNE2b4T3yckDQNrtCNI2DSvZrVFxtxxjeBBUZ96218hG5Z61YsyxK7FwYh
         jdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oDutW/I35TP+jX1O/z5kU6iTGS5iSehx2vcFXJv5b5I=;
        b=mLvi+ucmu6LImEEJEo7WGUcSIjA71Ez/qM6eileVwD/uBzQrufYLCk3yJX0lNPOMhx
         EdHSzIfErcXJoMew+d/2wCDFPBAxH+fbaloLCfC/ur+HG3Aq/KjIySQrqiUyNSQ4HJ2U
         TjnL4bEPaI+adMz63o2pBnkGja+EVrreew0/NkeJqxXbrB8OJqL+9meIhUvOs7e8nIfO
         K3C9ICNW5IX4n1rcg9yt6zl6efkpNgew3/sJr1hwMbl2GHE7xnwDQa2jbjvfAbBtEUgE
         li2dgZNR06mkeh+3EVXducsaLZ1Cgi9/WAqx4rdH1ESkkarY8cAIa/8DnpfFCysTz3xS
         //6g==
X-Gm-Message-State: APjAAAX/ASBeB8hY8Nv14oaHpj0KvL5vRqLvwJ2WjLDbmRUaecUpQXEd
        ta6VmSDA6oKnyRur41PGJ+w=
X-Google-Smtp-Source: APXvYqzLY9zWRFMxwQpByTGyw3hhxj8tPBVrYmen1stsrfuOs5M16rZTUl59Nx5s7+sFh9f0sRp73w==
X-Received: by 2002:a62:cec4:: with SMTP id y187mr36026625pfg.84.1566402275934;
        Wed, 21 Aug 2019 08:44:35 -0700 (PDT)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net. [184.188.36.2])
        by smtp.gmail.com with ESMTPSA id j6sm40452491pfg.158.2019.08.21.08.44.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 08:44:34 -0700 (PDT)
Date:   Tue, 20 Aug 2019 22:10:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     linux-input@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] Input: wacom_w8001 - Allocate additional space for 'phys'
Message-ID: <20190821051007.GB566@penguin>
References: <20190816184927.24525-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816184927.24525-1-jason.gerecke@wacom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 11:49:27AM -0700, Jason Gerecke wrote:
> GCC warns that the output of our call to 'snprintf' in 'w8001_connect'
> may be truncated since both 'serio->phys' and 'w8001->phys' are 32 bytes
> in length. Increase the amount of space allocated for the latter to
> compensate.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/wacom_w8001.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
> index 3715d1eace92..691285ace228 100644
> --- a/drivers/input/touchscreen/wacom_w8001.c
> +++ b/drivers/input/touchscreen/wacom_w8001.c
> @@ -27,6 +27,8 @@ MODULE_AUTHOR("Jaya Kumar <jayakumar.lkml@gmail.com>");
>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_LICENSE("GPL");
>  
> +#define W8001_MAX_PHYS		42
> +
>  #define W8001_MAX_LENGTH	13
>  #define W8001_LEAD_MASK		0x80
>  #define W8001_LEAD_BYTE		0x80
> @@ -89,7 +91,7 @@ struct w8001 {
>  	unsigned char response_type;
>  	unsigned char response[W8001_MAX_LENGTH];
>  	unsigned char data[W8001_MAX_LENGTH];
> -	char phys[32];
> +	char phys[W8001_MAX_PHYS];
>  	int type;
>  	unsigned int pktlen;
>  	u16 max_touch_x;
> -- 
> 2.22.1
> 

-- 
Dmitry
