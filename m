Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAB532077F
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 23:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhBTWWk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 17:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhBTWWh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 17:22:37 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FB7C061786
        for <linux-input@vger.kernel.org>; Sat, 20 Feb 2021 14:21:56 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id b15so1296368pjb.0
        for <linux-input@vger.kernel.org>; Sat, 20 Feb 2021 14:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RO14Cp3FXC1yWTtJS8oJfugEeL5Keo0tw1GCZitKpiI=;
        b=c2hit79K9y+D3ShQDArqceYgulyIfJU1GglCeOXMg053FZLmq6ER/HAOZY4cHtvHNA
         nvVAACFcuyprO+V0QW/OJ7j41QDYcMaOsxquQEaAPMwBElq9u3nVg5nqOhINHLLOzqyW
         K3pjZPEwQp1ZbILR1o0psjqkjeKCe+oCF7im6quw6hpZB7IPrrkHQbu/ClrX3iD1nocG
         dMijSvbX0t+AIPPawnmTKbpTfQeiq0Uv89Brl7DYZo3a9exbUb1El6P6Y3GmfZaYMCRv
         lxVLidCYSjUd6ydPPVtn7xYijDutyclRnA/DDCUWOTj7U/2O2mUB0WLXja7VSZb3NdzM
         FKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RO14Cp3FXC1yWTtJS8oJfugEeL5Keo0tw1GCZitKpiI=;
        b=odT2WabpSroECdXMkDjPdz2CMBUwVU5ndmYVXOuWhFu7EPYpRLnd3BZgWKXcdzx0BN
         7N23gnxdwreJ3s3qxeU5759Yq+l0wZ95yF1ePnO+hvX8367/arvudiX5k5CLbo+MO/rI
         C8JOcokvaquDLohJ1z5gPCpeo8r5b+o5zuQDXA56vx/Bs1f/41xmVeS240MeBvMoGeyj
         zLZZKVeHBy3S8O9U449ssE0RbRkb4AsdgG6BUa1qtm7mQVi5TNFw2fNS988fRwtKtgG+
         9ltJ5cGEMGpDV951VUukjHjP93ldfbtb2lBjb/0zhXBNBadQU4mwo+OoOZlNHCLk2QJa
         YuPQ==
X-Gm-Message-State: AOAM531JfwiN+rcHpmP/m6U25QBsWnMlg5gZwXK/WFX3jIG6fh3KRK83
        Elr00dbhlPvSaGbUv+fQOwk=
X-Google-Smtp-Source: ABdhPJyaXO8+3X8+3FI2SVwWM2jFqbv/YOK2NF5pMgodOjEJ1VoIXzDkTLwmHuPGHCWgHHD0gljIyg==
X-Received: by 2002:a17:90a:1616:: with SMTP id n22mr15529767pja.110.1613859716551;
        Sat, 20 Feb 2021 14:21:56 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b993:3e9c:7cd5:5a8e])
        by smtp.gmail.com with ESMTPSA id gk17sm12685744pjb.4.2021.02.20.14.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 14:21:55 -0800 (PST)
Date:   Sat, 20 Feb 2021 14:21:53 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     jzp0409 <jzp0409@163.com>
Cc:     linux-input@vger.kernel.org, jiangzhipeng <jiangzhipeng@yulong.com>
Subject: Re: [PATCH] input: adp5589-keys: Add err log
Message-ID: <YDGLgYMBX5LxtUsz@google.com>
References: <20210220172040.1559-1-jzp0409@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210220172040.1559-1-jzp0409@163.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sun, Feb 21, 2021 at 01:20:40AM +0800, jzp0409 wrote:
> From: jiangzhipeng <jiangzhipeng@yulong.com>
> 
> When devm_gpiochip_add_data() failed ,print err log
> 
> Signed-off-by: jiangzhipeng <jiangzhipeng@yulong.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 654e047..e99c0bd 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -526,8 +526,10 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
>  	mutex_init(&kpad->gpio_lock);
>  
>  	error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
> -	if (error)
> +	if (error) {
> +		dev_err(dev, "devm_gpiochip_add_data() failed, err: %d\n", error);
>  		return error;
> +	}

I believe devm_gpiochip_add_data() already provides enough diagnostic
when it fails, there is no need for additional diagnostic here.

>  
>  	for (i = 0; i <= kpad->var->bank(kpad->var->maxgpio); i++) {
>  		kpad->dat_out[i] = adp5589_read(kpad->client, kpad->var->reg(
> -- 
> 1.9.1
> 
> 

Thanks.

-- 
Dmitry
