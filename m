Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 094235F3F1F
	for <lists+linux-input@lfdr.de>; Tue,  4 Oct 2022 11:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiJDJDa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Oct 2022 05:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiJDJD3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Oct 2022 05:03:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F058356D7
        for <linux-input@vger.kernel.org>; Tue,  4 Oct 2022 02:03:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o7so12925812lfk.7
        for <linux-input@vger.kernel.org>; Tue, 04 Oct 2022 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cPUQKMQ52472PTvIXL4JBp6H6bJjgLa4qPT+B+CFn9g=;
        b=AzqV07ggUgW1QRRttdc/P8e19rCB2qQtt6Btx4C1ChE8LKAyRRsuy1aU8BSzZvtpRH
         5QNCe5YElzFsFJIuDcbBV6LoW/Y0wbVVICAZKdWdi71q299McdI5sN/q4wDebJD2TOme
         gD3bflFipgHwOCSs82hpNyOddvXeZHfZ6R9qWuRtukrEB4RWxb0pGUOo6qlpo5wOKBnp
         j6Mx651oV2lnNHWy+486g7zgUcWGXqQxB0I2L3Szkv/Y1Jnp0qqLUrkSdYEbdx6can7w
         QT70yk5ajL9iwocvkiBvzCxUZZE2JRpXLeUMu1OoiFGwULfTwwjHYZ0JtNBi+fX/VNv5
         vAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cPUQKMQ52472PTvIXL4JBp6H6bJjgLa4qPT+B+CFn9g=;
        b=v+97bTpmt/5GaghLjU0XHyX5pc3j+9whWo6peUi0g2ZyATy1y5kmzIyF3uESSz7DqX
         TAF5cDZIxG9cArhkck2XxuRe8E85I4K43L5nYQrg/Rg1JPv4dIo3soLiBXtTnu1h0Hmr
         iB3x6lVxEyW+SOjxyROu732vy+nfLFBt1Mk2Ysb01VkqTfaVjV4zBrT0u2l/UELliRKr
         ZUkJYVDTBBN6G3E1AYDk16w726muutjdXIPmz2ZQONhqUMpb+5Zmj28H22gI+2SXL4Yd
         pRvX9WkqUsGJ/TSCuLIVSULbgpZUk1b6Y0SGmLQBKUEJGmkBjlqPQtbvcz0VVPTF2B+H
         osWQ==
X-Gm-Message-State: ACrzQf19ZyRMptZTpLAwOxgnc2ERaQ6ofzqEnGazludXdyaQ3b02SAMA
        vMyx1bsddA5li6fQMmYp2M5TkA==
X-Google-Smtp-Source: AMsMyM48++19pfgzD1iCo7SHvucq8TAT5pl0hN7rV0tOquej/LMNJ1sRgQVsLu0bGAE9XojBy8+dDw==
X-Received: by 2002:ac2:5384:0:b0:4a2:3a45:520 with SMTP id g4-20020ac25384000000b004a23a450520mr3281663lfh.560.1664874205443;
        Tue, 04 Oct 2022 02:03:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y13-20020a19750d000000b00497a1f92a72sm1826435lfe.221.2022.10.04.02.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 02:03:24 -0700 (PDT)
Message-ID: <886d5a16-e3b2-608d-1163-ab112b2417de@linaro.org>
Date:   Tue, 4 Oct 2022 11:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 11/11] arm: dts: qcom: mdm9615: remove useless amba
 subnode
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v2-11-87fbeb4ae053@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-11-87fbeb4ae053@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04/10/2022 10:08, Neil Armstrong wrote:
> The separate amba device node doesn't add anything significant to the
> DT. The OF parsing code already creates amba_device or platform_device
> depending on the compatibility lists.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

