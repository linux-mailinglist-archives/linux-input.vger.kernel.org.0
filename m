Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1DA76AE54
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 20:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbfGPSRP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 14:17:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34703 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388107AbfGPSRP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 14:17:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so22027404wrm.1;
        Tue, 16 Jul 2019 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Zq7itVI0zgBux6L2SAmb7XsZyE777LsuJ1iUs203KU=;
        b=H2etgebBES8IPTYVJuASvaWnPKgnCoEYuzO1hbvfJtR7I6SQ6AfW0s1RJQzOFdYIin
         6WxfdZGsTE6S9Th+Qz2yc0s10kIoacjG3HW9cZm90rfmiI6ST/N+HEgeoq/5dUyyrpjx
         XevJpCO4Chs/Nq/X4+MFWk6x0dvdfuwLgzYeo8+mS77H7TH/ysoJlmr+f7949ou/AebM
         XVgeEc4vxQOsVgGIaohM52kobhy39eNdqgioWPYVomG9TXaHfQdsSZnewhxyT1mL871C
         pw9Syx22dD/CfSRpwwpPOUD6qxgFgn4bTW/02bA0hkdbEp5leUlcGRGOPVa48izgy/FZ
         rWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Zq7itVI0zgBux6L2SAmb7XsZyE777LsuJ1iUs203KU=;
        b=QdNji/leohHnal6gHrztVYX8Wq9a1ZN+ZKmSYrMwlqYbphN6THcrDmHLCdsIJoKQ9E
         wCIw3Uq10nCreOmJYf5VOHvAzsytDqb2Q51J+EsbJoODAYTF5xAhudPy8JzKqHEbPh45
         kzuSUaRYqJEsuwkhzKn0DHECeaYcG2a77sH/+3rgt7r9FQAPhRkoa1mfGJ9/4vls7mIZ
         fhOuP1JOgYvS6kHMVgLE4YXQNvoHEw7XurXXyFC4NNe+tcav2apHDwwGJWK0BbdVj7Hc
         KyPpJjMRXx2m158AQ/u/QjAglvaN/a9+DR2u1CRP5zfNcfZsIrxmBeTpqS/AJUxEjqBA
         4SXA==
X-Gm-Message-State: APjAAAVu6P2N/66spugTkQS0TC1oF67skyQAo4C9C5V3iNSAyCVoxU6u
        U78yIQD3cNgi9hZlquMCZaEdrOd1gpc=
X-Google-Smtp-Source: APXvYqz+32zdEI/E/bW4WadsjPhFzURrHtQ6Al9NPbuRx6vEW3pfWmBfsQueWLlNuMqeFEcrVSB2jA==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr36359435wru.156.1563301032301;
        Tue, 16 Jul 2019 11:17:12 -0700 (PDT)
Received: from localhost (smb-adpcdg1-05.hotspot.hub-one.net. [213.174.99.133])
        by smtp.gmail.com with ESMTPSA id p3sm19704019wmg.15.2019.07.16.11.17.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 11:17:09 -0700 (PDT)
Date:   Tue, 16 Jul 2019 20:17:06 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] keyboard: remove set but not used variables 'sts'
Message-ID: <20190716181706.GA1140@penguin>
References: <20190716085423.19443-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716085423.19443-1-maowenan@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 16, 2019 at 04:54:23PM +0800, Mao Wenan wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/input/keyboard/applespi.c: In function applespi_set_bl_level:
> drivers/input/keyboard/applespi.c:902:6: warning: variable sts set but not used [-Wunused-but-set-variable]
> 
> Fixes: b426ac0452093d ("Input: add Apple SPI keyboard and trackpad driver")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/applespi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index c1a6843..548737e 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -899,7 +899,6 @@ static void applespi_set_bl_level(struct led_classdev *led_cdev,
>  	struct applespi_data *applespi =
>  		container_of(led_cdev, struct applespi_data, backlight_info);
>  	unsigned long flags;
> -	int sts;
>  
>  	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
>  
> @@ -916,7 +915,7 @@ static void applespi_set_bl_level(struct led_classdev *led_cdev,
>  			 KBD_BL_LEVEL_MIN);
>  	}
>  
> -	sts = applespi_send_cmd_msg(applespi);
> +	applespi_send_cmd_msg(applespi);
>  
>  	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
>  }
> -- 
> 2.7.4
> 

-- 
Dmitry
