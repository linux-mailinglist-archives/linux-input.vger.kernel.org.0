Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471956DD23C
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 07:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjDKF4q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 01:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjDKF4e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 01:56:34 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC93230E0
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 22:56:06 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id qa44so17176538ejc.4
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 22:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681192563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuWGcELmkJJ9H6v4hiFoJ9aS9O/S4iDSa8U1Z3FSqWk=;
        b=mSBugSjYIIU21dzWXZVxrW7D5jwgfpQCx7VIz5BrooQi2P6sqO33aSgyyqhHyspvYx
         uNz+BHtb2n7F0ISccM8VIRfpFJV9nI8U6lVEOyudI6Bw5v+vNkTl6jF0WLppsNKGafc3
         oZ76qFL+jbddmA7QSzXaK/J1mxlmB/9U5805LBHBiroGvCV9jRoyvAP3B9kdUT3Al5Ki
         bkx2NuRGJjIXbs2t5bJk7VF/PhRbvyD2PzY4f5icKR9JowCHd2wzFqByduQ03WoQte/+
         C0W1M49zvmu9vYWb76390e7QblxKW6Fk5LfA1jBcC9x1nTlMT3FoM2B7KKI3kMcKkHGF
         WFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuWGcELmkJJ9H6v4hiFoJ9aS9O/S4iDSa8U1Z3FSqWk=;
        b=aj9rUbG/CT5ggu2beVAQpghTM5WOjyhR3KiI4FQZtrGtVmfMK8brNXwz2uOy8uij7G
         EeZPh197i6bHhb7S4rdGE8A6vkC2jfFqTXmflc2OWKtgtJvi1yKCyQyl/j8vKpUItc7Y
         s+M6Rn1ADX292luXIZgeVHp6PDRUvcEM7+hTq6HaUrhltWdYnr81JayZ+q75rYp6F05u
         C9W9Ox7KcKpJWGECagIduAxhVUz1X8+X9sz/3l0dMuWISIeI+JUPR/5xWn7Yp+NduxYV
         wuSS7/m8nc0ZriMmj8YJipX6JLqYWYGAdBEF2oY6b87kswyTnN/ByH3d3PAiyJWUvBZ+
         eWjQ==
X-Gm-Message-State: AAQBX9e1d/GdDiqW7N4AbqYfSYc6UbWmCP6PWWXC69AbcBU1SrxNuDcr
        wRxDzQo9BIBJYndAP6xMEMyMvg==
X-Google-Smtp-Source: AKy350Zgh7+AJbj5GNY3YkdS+0PmuubpT+AqluelGe7HYgpQv9YcEZZP+9h5/lpgQ278sEaZKEohiQ==
X-Received: by 2002:a17:906:c206:b0:948:112e:c49a with SMTP id d6-20020a170906c20600b00948112ec49amr10760963ejz.24.1681192563301;
        Mon, 10 Apr 2023 22:56:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id sa30-20020a1709076d1e00b0094c784f64fbsm967957ejc.66.2023.04.10.22.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:56:02 -0700 (PDT)
Message-ID: <87ef069e-eaaf-9ba3-50a1-9d401494e20a@linaro.org>
Date:   Tue, 11 Apr 2023 07:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
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
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230410160200.57261-1-joelselvaraj.oss@gmail.com>
 <20230410160200.57261-4-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410160200.57261-4-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/04/2023 18:01, Joel Selvaraj wrote:
> Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
> touchscreen. Also add pinctrl configurations needed for touchscreen.
> These are common for both the tianma and ebbg touchscreen variant.
> In the subsequent patch, we will initially enable support for the focaltech
> touchscreen used in the EBBG variant. This is done in preparation for that.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
>  .../qcom/sdm845-xiaomi-beryllium-common.dtsi  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 5ed975cc6ecb..b580a32fdc3b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -268,6 +268,10 @@ &gmu {
>  	status = "okay";
>  };
>  
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  
> @@ -376,6 +380,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	status = "okay";
>  
> @@ -481,6 +489,37 @@ sdc2_card_det_n: sd-card-det-n-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	ts_int_default: ts-int-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +		input-enable;

input-enable is not valid.

> +	};
> +
> +	ts_reset_default: ts-reset-default-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-high;
> +	};
> +
> +	ts_int_sleep: ts-int-sleep-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		input-enable;

input-enable is not valid.

Best regards,
Krzysztof

