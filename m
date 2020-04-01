Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EBA19AE14
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 16:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732843AbgDAOjC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 10:39:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46859 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732791AbgDAOjC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 10:39:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id q5so20649477lfb.13;
        Wed, 01 Apr 2020 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ms88Fagr1+fPi3uSiQm0/UTpXQVGW/BeEu2iATuEKU=;
        b=DYE9DTbzBSe5rlV3aXuF8hXHYDR+LUvProqQENESdWtbnF0+OkSU2I7+iJ0VDBJomE
         wZDM7UlNbbAJ8WCKj4pO/N1FFC8ioMwbNRIzGq6TLyf6HTubSRMwFjA4oIJgVoyj/UrB
         V36ZftMWmlTMIPkA9dvVFmQ2IQGcC5D0gdB1Oy9cYQrrQqRZ9uyZQZ08zCggyJdEONjb
         7BhCtEsm8K4UVWWxPITlnlf9hpAoRBNhyhF9fl+MibQOBhS6GcD5cGMhlrdYBYARCBmC
         alo1cuWhfbNYtWoJo99iHm9wONJGQ0oc70oy310JpGpU7/b1Oly1BrhAOlujKYTL2xE8
         4Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ms88Fagr1+fPi3uSiQm0/UTpXQVGW/BeEu2iATuEKU=;
        b=hRaIPId4Tkudgc1vN2IC5zFpo1RshWDX7mh/VutCt6OxGFlIwR6HqK52QabjHJHNTN
         1z7HN9IMqrcCQi2LLQ+CX7xMHxHzXIHvlZwoBpEKESZ7yV7bmCovia2axLze/ZitEHMD
         l8JulOKpg541kKXyhft1xvT2XzMFwO+sJzpGhkDhZquLyyxz9UdLNqVhapwZLW8nad4c
         qYidenRTqwSfmFMprxtw+szUhVLDwGsitT3h92mzNumeYmgmhGMF069xj1CQH9hyUQ4B
         CVY0/1DRH9b6i+OaeFB9VN19DLkv02El8tjjIbGip4H1/cSXSrk48GI2De5zOuR+1/sA
         1I5w==
X-Gm-Message-State: AGi0PubaCgAzguYbQ6L06aSfREYD5kkiPI0J9/5zBGenesC7FpPmojAN
        9yeQrNGiN8WBJ8j7L2G9ggM=
X-Google-Smtp-Source: APiQypLpP/QQSR7cYkCfdkqhWQO7i7zf05IPgfBgnHJQnqy1ouCUBKcXCKi78mRkHApg3IcY6ec71w==
X-Received: by 2002:a19:ee09:: with SMTP id g9mr15143581lfb.11.1585751939484;
        Wed, 01 Apr 2020 07:38:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id h16sm1303197ljl.73.2020.04.01.07.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 07:38:58 -0700 (PDT)
Subject: Re: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max
 bytes transferred
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-44-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
Date:   Wed, 1 Apr 2020 17:38:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-44-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
> Add support to set max bytes transferred in an i2c transaction
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> index 126266891cdc..37a798cab0dd 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> @@ -45,6 +45,8 @@ Optional properties for main touchpad device:
>  
>  - atmel,input_name: Override name of input device from the default.
>  
> +- atmel,mtu: Maximum number of bytes that can read/transferred in an i2c transaction
> +
>  Example:
>  
>  	touch@4b {
> @@ -52,4 +54,5 @@ Example:
>  		reg = <0x4b>;
>  		interrupt-parent = <&gpio>;
>  		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
> +		atmel,mtu = <200>
>  	};
> 

Is this a software (firmware) limitation which varies from version to
version?

If the limitation is per-hardware version, then perhaps should be better
to have a hardcoded per-hardware table of limits in the driver?
