Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F14691E5D
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 12:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbjBJLeA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 06:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBJLeA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 06:34:00 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674AA72DDA
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 03:33:46 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id by3so3455051wrb.10
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L24ZYQXVUaFcxVZjnJ4h/yK6UJ8A4vFjYSvIAf+wKNo=;
        b=FTcH6VwikNtTRT5l1ycXuunT71/9B1P0kYVP741ljPnx4rR3IjD58WeoSRura4RH+9
         7KjIHJmAFk1ISxjrBtNxJ4P4rezuOXmNrW1gFWetK3KYTukBHozP4xxite+6eLgRIUj5
         pdYkpBFq4Ahp1apaPJQryi84MQE4UeBSWPjaYDcIS5X4T6JqobAGeiQ/eEWm+Sx9GyTx
         DDaOlt9XLfSfpiA+SDTsvo+Vk5RyF6AXqxKrKDrl+xu+v65MUBNR+H755joPc5U0388J
         4Ddypl4z19Y2JK+nVHWsrBq6L3Ha3vUVNNX3mlOM0gyCZ93uEcEmeKc1CAwz0Qm+QddY
         7hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L24ZYQXVUaFcxVZjnJ4h/yK6UJ8A4vFjYSvIAf+wKNo=;
        b=1B8vhdvwwyrOgWHcxPjkbCQmn1srLydHJxmJlYV4ihgTznUMomGoWTrfaExPzXAzeu
         uC8muo3OA6a5pI3hf4mNMdPm5lnin53888nb7wcEzAaUx+nOpHC1tygiXWv8hDmQeT5F
         Xw1Er+WSe5lWCZ+gbI1vqnOsVX4xto6Kb97Qoh57x6hBOSOLKiDLtJtwpqyIG4ZtN+0b
         28FTskumKUkDXd6OJ9+JP2AFvb82TtRlq7iMh3Y6w7Jh3pu4WeIWLdNmRVI3V7gyEnya
         uTowv5aVjMR1j/bgd1kYVbxnTtGTTYu42rPnOxVeKgh1+8V9Lp7VGsDj1DUIvHEzBapH
         pxwQ==
X-Gm-Message-State: AO0yUKVdNjUM+78lNNpCqxGFgBQPogMTza45VeY6uNOeTO1MUefcQZZj
        E/eSOFRCdh95SY/EdMqtyK3AcA==
X-Google-Smtp-Source: AK7set/HaqsvPluiOKrBX5uvMfObqaydOBTJS3Q4mwFA4S735gUUTGtca0BfR0u4UUvsxuOrqdinyA==
X-Received: by 2002:a05:6000:1803:b0:2bf:afaf:9d71 with SMTP id m3-20020a056000180300b002bfafaf9d71mr13338512wrh.48.1676028824975;
        Fri, 10 Feb 2023 03:33:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n10-20020adffe0a000000b002c3ec35f360sm3321345wrr.56.2023.02.10.03.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:33:44 -0800 (PST)
Message-ID: <dd77a886-5ab4-c6d3-bb84-5849c411aa7b@linaro.org>
Date:   Fri, 10 Feb 2023 12:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm845-oneplus: add
 tri-state-key
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>
References: <20230209232556.91554-1-soyer@irl.hu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209232556.91554-1-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/02/2023 00:25, Gergo Koteles wrote:
> The tri-state-key is a sound profile switch found on the OnePlus 6,
> Android maps the states to "mute", "vibrate" and "ring". Expose them as
> ABS_SND_PROFILE events.
> The previous GPIO numbers were wrong. Update them to the correct
> ones.
> 
> Co-developed-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Where are other patches? I got only 3/3.

> ---
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 39 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 64638ea94db7..e45d4fdead82 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -52,6 +52,43 @@ key-vol-up {
>  		};
>  	};
>  
> +	tri-state-key {
> +		compatible = "gpio-keys";
> +		label = "Tri-state key";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tri_state_key_default>;

Missing blank line.

> +		state-top {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).


Best regards,
Krzysztof

