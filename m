Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00272792DE
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 23:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgIYVCK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 17:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIYVCK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 17:02:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58D4C0613CE;
        Fri, 25 Sep 2020 14:02:09 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so4246662lfi.12;
        Fri, 25 Sep 2020 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k1LCKeXRxN/+JcNtQjihLS6rqftynWEhdCaK6WypRnU=;
        b=LK9ZC7teMcyPSnG/s7L9ew252xF+hS29QvkBWer4miEN0cx+zeSiSpaTpHCgTurR7H
         vWBBotNYWzjPwK/BoxXkeBw0gChmgequzj/InKGaYltjc46ZdoZygwtIt94bWQ5xzt2K
         SOAE+hcZ35D0wR39q9os+vy/FPwJAFJ+TIxQM6KmdqA3+L2zZuCDSa/Lbh8treM//4Wv
         2b9bN2PU6Hre5LY179eVwsopAUpJgmODAdq8C7fPugEUBvL+i2sdTGs+JLt/zS5yuMfa
         NamdyOaRgnXmQIdpPvFoVH/cc1aHWJ98jitkgg3YUbO5gm1DWPEppnREKhpCN67W8Y4m
         rX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k1LCKeXRxN/+JcNtQjihLS6rqftynWEhdCaK6WypRnU=;
        b=LWzr/vPYuNN2uKKflU1asnzP2uMhkwpw/vjjwVT683uBzxKStB0gvEwdHsc5ISHC+h
         uLbJMUMSFKibPwiO9HXkT0Gg+fpK7OZbv7Oh9x3vy0Uh5SKh0XoVSUe4ym8Z1gZd/7xq
         araC9RZ1o6c/fcuvjLhQ3CIyxx/boJ/i+ULXv4Dh2JvYNJ5vbhlKSAXI4SBkAxLtYJQe
         Ru3uT6bQoKUFijQ4mdL0fjRQ3x3h9nkctzazc8n3srGVF22tBqBWW4+/PA0kcPbC8AH8
         DoNVioeuGhVoYEJp5gkYG3ynzsUSKoKyWA3qu9CvRCIC5q0lqpRwwg0d1H232XI4vhEM
         2PNw==
X-Gm-Message-State: AOAM532u0QynPwAX+68GN3vWum3BnhGrG4PhB6ajExrUZs+isf885QRz
        gMhiYF2w5AGXm7ohWTJ/Hb8=
X-Google-Smtp-Source: ABdhPJxwJGsW5AMwcvHSbpE7F0UzfOw+jYGHNQdauxch0hlQ2OOfjID1uY9+z8RwdfbvJoa+FIaAgw==
X-Received: by 2002:a19:610a:: with SMTP id v10mr236702lfb.414.1601067728217;
        Fri, 25 Sep 2020 14:02:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id w4sm178305lff.231.2020.09.25.14.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 14:02:07 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] ARM: tegra: add mXT1386 compatible
To:     Jiada Wang <jiada_wang@mentor.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com
References: <20200925135257.21138-1-jiada_wang@mentor.com>
 <20200925135257.21138-4-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60afbb5b-0890-a0b0-2682-d5302e8e9130@gmail.com>
Date:   Sat, 26 Sep 2020 00:02:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925135257.21138-4-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.09.2020 16:52, Jiada Wang пишет:
> Add mXT1386 compatible for "touchscreen@4c".
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> index 2d683c9a1a5d..7915b6e9190e 100644
> --- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> +++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> @@ -428,7 +428,7 @@
>  		};
>  
>  		touchscreen@4c {
> -			compatible = "atmel,maxtouch";
> +			compatible = "atmel,mXT1386", "atmel,maxtouch";
>  			reg = <0x4c>;
>  
>  			atmel,cfg_name = "maxtouch-acer-iconia-tab-a500.cfg";
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
