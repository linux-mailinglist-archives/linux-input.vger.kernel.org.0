Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BF1691E62
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 12:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbjBJLe5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 06:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjBJLez (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 06:34:55 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699D671F07
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 03:34:53 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h16so4741965wrz.12
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iZefKHFfg3m84QtR47LQ0OruubfGuWPKR7O/25P2ag=;
        b=L8DiLdQGcOdtxDAVw1hK3HGwFJfh11HumpMagveWXuYzR871EfMzWSgsR6PUUZrqJS
         fvhLq7yUOoTszIXzr7SJNf7GEuqsfXNxIaVcW1+w4uelu70UVVrqoi28+Iii7WjEFsTN
         SBJl5PXSXrAR/DJUGSaa1f9vdMBisXjoksq7LmmpIlAD3J3Szw1/yV+LGErPgt56g9jS
         hXgiUq9nO6RdVM6PE2K228BcGpHmbx35Zzeguw5STJatqgIpaJ1uVGqv4zPHBHdWctup
         KidLnLSdISx7rMVkqJZ5RaghY8h22mHC2+TNcIwNI99Uq0gUUI4AhIiQ9qEQT+gmu9u8
         VaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iZefKHFfg3m84QtR47LQ0OruubfGuWPKR7O/25P2ag=;
        b=8FwIsyTXghYmIL0qcy+Gnc5ASY7oS1rJjebguaxPHNoRvT4WQi5Wo06UoIMlXyYmMJ
         kjli1O1Kzmc/fnIyE40sml+KNVtDChC4J+WDaw0fQoLN3WWyMhiOIZ7zfPu4Rsk+3GwO
         0z5AcO2eqhecGjEZ9USDrSpLkcs+/XD5jCw374bH5elKNz8Q5Y9HpjEgNMdgR7dYBD8B
         nQe9p/N2o/+xwB9cC2217FlCzPldhf+/TYjNXClWyZRJfItHY5oV/vOdKNdgs7f7poby
         fGH9UaAhJsODMCUXuch9f55RCiB/KXLXf3ogZ8QsNwFsd1wpAMU2q6p2fwI43qyE5Rbr
         UJZQ==
X-Gm-Message-State: AO0yUKW+OfezUmcAzWsKUMzDUuv8uAe8FqLBSMeANGu+qqKIzXonwewf
        clORYWnQ38hVs58GeNs+8exbvg==
X-Google-Smtp-Source: AK7set9JHxoe6V/nF4xeMImn70xcIfjsLsAlIpM8+zqsq9NT/XLQVN6VnlUnHu3rNlm8M94DasQ9PA==
X-Received: by 2002:a5d:6504:0:b0:2c5:4c7d:53b1 with SMTP id x4-20020a5d6504000000b002c54c7d53b1mr497455wru.16.1676028891962;
        Fri, 10 Feb 2023 03:34:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a5d574e000000b002bfb02153d1sm3446275wrw.45.2023.02.10.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:34:51 -0800 (PST)
Message-ID: <f076ea5f-6535-f7fe-3c32-fe30a9972a43@linaro.org>
Date:   Fri, 10 Feb 2023 12:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/3] Add tri-state-key for oneplus6
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
References: <20230209232510.91431-1-soyer@irl.hu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209232510.91431-1-soyer@irl.hu>
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
> V1 -> V2: rebase to qcom/for-next
> 
> Gergo Koteles (3):
>   Input: gpio-keys - add support for linux,input-value dts property
>   Input: add ABS_SND_PROFILE
>   arm64: dts: qcom: sdm845-oneplus: add tri-state-key

OK, here they are. Your mail threading is broken.

Best regards,
Krzysztof

