Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6C996673B
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 08:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfGLGuV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 02:50:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46471 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfGLGuV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 02:50:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id c73so3865677pfb.13
        for <linux-input@vger.kernel.org>; Thu, 11 Jul 2019 23:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nunM8EbMx8v6iauP2cPpdPNrk0NnDajKR4vWDYT01Xk=;
        b=iBft0C0HVos4tltf5LODpwQDILpaS8gGULpyrrSpgR2rrBFNotQ5rRfkQjeyhAUXKN
         /zUFfzkOcsFSuF76M8WstPCXUBey8SdLYYYSi9h0QR/WQ/EO4CgqoYM/ebyRq6XMdXNo
         TT3JHx9HR21hObmgoJqw7CIJBjp9XgpHkd74s4RRIFzvCRM7kNByB9tqvIitkVuWdBeN
         Z4JZcwkxGTie4QAVczcWFSwigA7H3Ip9cwr/QyyhP6TNgckO9tzJ1NodTzODYolHdPcB
         UbJEgCNv6g529cBZVjZXYWIViqCmUlsq/eFnNCUVJfbrV945+qyfkneSdQG6OwpLBfdB
         YF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nunM8EbMx8v6iauP2cPpdPNrk0NnDajKR4vWDYT01Xk=;
        b=hX7NH28PvPNjeCOaMn81uHKImxZAEZmvfW+pzOwZFT8dcHrrnDzBjO9ZUdSPELxXNX
         /kZtDYi3oV9iqW619/O8F+B0xLutQs4MrHLkpKXo3qX36qnK1WuHR6jF2Z84ESw2FpON
         5i++h/gCZwT0ekK8vcNvk6Ij3bDRSp3p35fuhUX8CgeQULVGaR2viVai0tIr3OvfxC8i
         Wt+huDHByzsidbO3qB8RqKck1DMMK3uJJag2MShnwRWp6xzwl+u+8yGT8LcoBv/jATmC
         Qk7OwSNB44kJTR8IUZKrUey/R2cGa+n6448nWGBSdwbOgcFTupL4Mcsfk87AUuNj8oyR
         rZuQ==
X-Gm-Message-State: APjAAAWnJvS8Z1TTbBdlaHeeKGSTHGmbqm0ZQYh6l58eubinkiAE67ND
        gq9hrdRa/9GlrCot0XOYlGY=
X-Google-Smtp-Source: APXvYqzK1qh1Vj/ulA4pekaBdPxj0EeE2flqAmPZtwiASLmygbcbdwa0L7WHSYjzYLBaONH9v/hNfw==
X-Received: by 2002:a63:ab08:: with SMTP id p8mr9230016pgf.340.1562914220292;
        Thu, 11 Jul 2019 23:50:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 3sm8494091pfg.186.2019.07.11.23.50.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 23:50:19 -0700 (PDT)
Date:   Thu, 11 Jul 2019 23:50:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     matthias.bgg@gmail.com, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] input: keyboard: mtk-pmic-keys: Add of_node_put() before
 return
Message-ID: <20190712065017.GF150689@dtor-ws>
References: <20190709180019.14339-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709180019.14339-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 09, 2019 at 11:30:19PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in three places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 746ff06eaf8d..62391d6c7da6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -277,8 +277,10 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
>  
>  		keys->keys[index].irq = platform_get_irq(pdev, index);
> -		if (keys->keys[index].irq < 0)
> +		if (keys->keys[index].irq < 0) {
> +			of_node_put(child);
>  			return keys->keys[index].irq;
> +		}
>  
>  		error = of_property_read_u32(child,
>  			"linux,keycodes", &keys->keys[index].keycode);
> @@ -286,6 +288,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  			dev_err(keys->dev,
>  				"failed to read key:%d linux,keycode property: %d\n",
>  				index, error);
> +			of_node_put(child);
>  			return error;
>  		}
>  
> @@ -293,8 +296,10 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  			keys->keys[index].wakeup = true;
>  
>  		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
> -		if (error)
> +		if (error) {
> +			of_node_put(child);
>  			return error;
> +		}
>  
>  		index++;
>  	}
> -- 
> 2.19.1
> 

-- 
Dmitry
