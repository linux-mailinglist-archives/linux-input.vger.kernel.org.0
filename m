Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2B46B6B72
	for <lists+linux-input@lfdr.de>; Sun, 12 Mar 2023 21:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjCLUsi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Mar 2023 16:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjCLUsg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Mar 2023 16:48:36 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA17124111
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 13:48:23 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id j11so41014362edq.4
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678654102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSuu62ZtrCDKkOlmQUYQACQgoTEHCbw8LO0DFEfyOYI=;
        b=B43oLgAITueP6GEec2rIrhCf8+qS+0h2b6xYUnGJF254Av1FgGuGTXsitKkqpSAjfs
         fvqGRPWmKVD0qPUNUw/9DLdakSggBGrOZ9FDe/WUpmeJLoIqCETd13fK1PxXkp2uBxMd
         F6k8jZM5E0vRz+xu1wuayOO0sCekV28IUjEf2xvynwW3I73ib2dO8yXc3UswB1e+l92J
         eHtEHMc1eq5/wp5w2qoXdWOCAXvIG1eVTCBooMkNHymxyFn14rtUwcdTuUHFwxKA0Qqp
         oo+tH98j/LGk1V8UHtcMNaFm8f/ValnFD673qDbkzyZ5mFXBHvOU79joCmRhRIC2oTkR
         C47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678654102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSuu62ZtrCDKkOlmQUYQACQgoTEHCbw8LO0DFEfyOYI=;
        b=7BhJC+EYp5j+p2bfI/9BLPtYIUWuXJteYI5D8Sf5SdPUCL9ZfJAf9Cw8hNX3HYOJ/Y
         IwTqKA4EX4ea9rddrMjMf4ejI/quAXdzZKE+ZmbN97Ic27PGz6UKiCaWTYdClrwNb2JQ
         BH6+AxEq/EsqimESZhX21nZ5upxG2uy8Z15BnPeyV+/FRc10hjJM+TIOHb7xXqmxEX67
         zx+iJH+TljJCDXF06U64FsuiOUAZyL4nnKAhpbVSFOqDdyvTjKTs+rNaoM812cKlSgGr
         kqGQOZsuOJ2+mOCSZV7oc/828B896D7Nfx7YH13Fmd0QE9b9aD/Fx5xFXo3yIKG4EyU+
         UFMQ==
X-Gm-Message-State: AO0yUKVuUryVZqLNiWC1IuHZrlbvJAMO5G44OzlVRX7Cdk8CLSl+gVhZ
        YXs6/FFZF5oxI1bq+OuAu+jcrw==
X-Google-Smtp-Source: AK7set86YBGLHhii08oOoSKY0zWmcztYRGX+cZDo0CWEBHvRVtn8lz1i+Y8Bbobgt4g9uQHZt35EnQ==
X-Received: by 2002:a17:906:b882:b0:8b2:3e72:1022 with SMTP id hb2-20020a170906b88200b008b23e721022mr31771384ejb.29.1678654102186;
        Sun, 12 Mar 2023 13:48:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906685200b00926b944676esm932476ejs.131.2023.03.12.13.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 13:48:21 -0700 (PDT)
Message-ID: <ad9ce095-deff-a191-baa3-d3778efe9846@linaro.org>
Date:   Sun, 12 Mar 2023 21:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce support for fts touchscreen
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230312093249.1846993-1-joelselvaraj.oss@gmail.com>
 <20230312093249.1846993-5-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312093249.1846993-5-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/03/2023 10:32, Joel Selvaraj wrote:
> The Poco F1 EBBG variant uses Focaltech FTS touchscreen. Introduce
> support for it.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> index 76931ebad065..a23be4c8e1bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> @@ -13,3 +13,30 @@ &display_panel {
>  	compatible = "ebbg,ft8719";
>  	status = "okay";
>  };
> +
> +&i2c14 {
> +	status = "okay";
> +
> +	dmas =  <&gpi_dma1 0 6 QCOM_GPI_I2C>,
> +		<&gpi_dma1 1 6 QCOM_GPI_I2C>;
> +	dma-names = "tx", "rx";
> +
> +	touchscreen: focaltech@38 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof

