Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFA7A22BE
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 19:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbfH2Ruo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 13:50:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38492 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Ruo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 13:50:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id o70so2569047pfg.5;
        Thu, 29 Aug 2019 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=C0c3Z1paEgDZynzXFK49rQPn2NcgrpyMRJRXJjSfdS0=;
        b=EXqjVb4y/WwUgZeTgYtqQrj2s+pCQQ3Wd5fATC2hSxen/zrMsXPZ/8WjzNYuJYUotp
         DxUq01LQs7mDdr3uRa7nxQ88FJYxvayxO+Op3t91FrFw47BggasnQWWmVP1WjZ36UPUB
         gWcP84+R19b0xsQIaMhbY329hqAhc2rVpmEGFd8LXH9S9f/8S3KqrXJF7k2Ahsi6OO/Z
         D31LZX7+vskardnB0PUtFvCPxfCt+RLH3uzDMFEmJceVCT4AAlbdWajSKHuVUTvnOLcu
         dmPMH+H/HY4KpmRJKQSL5vqMpTlc8F4ac04iH3mW5oOkoHEQixwJOtei+ipQjOXJC3l9
         toog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=C0c3Z1paEgDZynzXFK49rQPn2NcgrpyMRJRXJjSfdS0=;
        b=ZvrZIao3UBlFgPt0+V+lwGxzp4wC9Xll24D5pESGC7VWij7LYi6tOQUSqQCPN/bC82
         5+vd/2rm5tp3UxbFToOvETOlUEzWm5lwg9MrcXYk+YuEK0p3BP1esL5zGLs/kTPPmpf0
         /hfwFIGRdk8zvqUSqSlLWkhAvWx+DVinG1GeiTY1l2E9Uq8Jg9+wyX8GCwu3hWyIdVAI
         fFl0UjZ4EreCn3n8uv4TZOhdJiZLVP7yaLLuBWI7niuzRR1uUrXAJ2nEoPgJFJ22xFrh
         9HkZSKHOuCfh4HUB1ah1f0YWGcVI0Sugo0FyrRwbroOeuvi8LySCjX6uboVoeMEe02bh
         CbYA==
X-Gm-Message-State: APjAAAWf0DCQ47ZeHGXVW1/62EyOtB+tNsV1VwqaT+8hC6aCm15g8Q4m
        1fZy7LNEiLzx32Hl3mrZVsI=
X-Google-Smtp-Source: APXvYqzz6aYtL303net0Q2XoobY3+IfZ+KjkTCCRv9mGfinoCAHvvn/eFJl3hSKth/9/3+Rithx5Ng==
X-Received: by 2002:aa7:9112:: with SMTP id 18mr13054322pfh.127.1567101043175;
        Thu, 29 Aug 2019 10:50:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p10sm3618213pff.132.2019.08.29.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:50:42 -0700 (PDT)
Date:   Thu, 29 Aug 2019 10:50:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Denis Efremov <efremov@linux.com>
Cc:     linux-kernel@vger.kernel.org,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 09/11] Input: alps - remove unlikely() from IS_ERR*()
 condition
Message-ID: <20190829175039.GA187474@dtor-ws>
References: <20190829165025.15750-1-efremov@linux.com>
 <20190829165025.15750-9-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190829165025.15750-9-efremov@linux.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 29, 2019 at 07:50:23PM +0300, Denis Efremov wrote:
> "unlikely(IS_ERR_OR_NULL(x))" is excessive. IS_ERR_OR_NULL() already uses
> unlikely() internally.

The keyword here is _internally_.

https://lore.kernel.org/lkml/20190821174857.GD76194@dtor-ws/

So please no.

> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> Cc: "Pali Rohár" <pali.rohar@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-input@vger.kernel.org
> ---
>  drivers/input/mouse/alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 34700eda0429..ed1661434899 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
>  		/* On V2 devices the DualPoint Stick reports bare packets */
>  		dev = priv->dev2;
>  		dev2 = psmouse->dev;
> -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
> +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
>  		/* Register dev3 mouse if we received PS/2 packet first time */
>  		if (!IS_ERR(priv->dev3))
>  			psmouse_queue_work(psmouse, &priv->dev3_register_work,
> -- 
> 2.21.0
> 

-- 
Dmitry
