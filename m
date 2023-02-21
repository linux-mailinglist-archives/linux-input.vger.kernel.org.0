Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF53169DD1D
	for <lists+linux-input@lfdr.de>; Tue, 21 Feb 2023 10:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbjBUJpq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Feb 2023 04:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbjBUJpp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Feb 2023 04:45:45 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400DF222F8
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 01:45:44 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id h32so14829875eda.2
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PK2BfkpiLdNJHc78+c5wCnYytKxPCOH9JODGsT+Sq0=;
        b=wjkgqNVhSpIjWrfFumTFJx9NgMl4d88J9tYLaPJDVzMEUrhFTXm1gbEnWULzRpmMF5
         tJ/H+k0EdaDoQr3mK2J+xP/gUt09/9hOFyEmwcakSn76K8tTqtNhLx+WMLjHoLuo9OGg
         CUA2x5PRVmk49bQyUljQv7HTxTO/jU1bnSh013iGeOin2d+60yafhbq68gT/VB2cZOaG
         aQRgAYMKMQ1Kw8YlxOPt9gaHiW85l47o6nfcZ1EoVffLPLYAPbo0SFlRXXgBMnFqWnFX
         JKYKWVDob4LI9A6+ZiYTZn05TzyByK2Kyw/KJsBTIpK8chqvyfLI1rUw2SBcB8LXxkxW
         Wodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PK2BfkpiLdNJHc78+c5wCnYytKxPCOH9JODGsT+Sq0=;
        b=eUpTSgk615kzAWkBBSAj647gPMlQQbEn/7aSFCEdcRbYkAtKIYONTxOLcrBqjfmRTF
         fqBgLpW7TWSGP4paXCq1M1L2OBorwQTwkERpRLNmUJHO6t1gJjctea5nFH5YqVwgt2zl
         M1bBJyrz9wylOEIM7SENGTraEt0KLT0T5q8D8icTIe3ZEqy1hgxQzNqLHnaGXhpM1yPX
         um/pGZ5NSM4T6hz/TD2PyAKMGugSOcaBHnn5ZENiuKvZZcaus0pQXqHA/pWMfv/HK237
         ZMmD4JmfYj5GKPVz83m6jE8ubzXUF+a1dmZ+Ip9QgdAHeF4lC7auEwpHezDwmuEaBzk2
         4eUg==
X-Gm-Message-State: AO0yUKVpKwK+jaTEVGa0xAGnP199gVeSrAR9jKTnc3roUwp+auO2nmoN
        Une6mzxccq9WIOzuvbB7pWoPZA==
X-Google-Smtp-Source: AK7set/nhtES+EmSr0ewBQL+bKcLDyq0xL+oiEJyxDgGr5e9Gv8UiNern63ikKa/1KSjV/+Z76+aVw==
X-Received: by 2002:a05:6402:b38:b0:4ac:bd6e:9975 with SMTP id bo24-20020a0564020b3800b004acbd6e9975mr4367614edb.20.1676972742739;
        Tue, 21 Feb 2023 01:45:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y21-20020a056402359500b004ab33d52d03sm2782953edc.22.2023.02.21.01.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 01:45:42 -0800 (PST)
Message-ID: <1478c506-de42-e7a6-c652-a569968c8c29@linaro.org>
Date:   Tue, 21 Feb 2023 10:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: google,cros-ec-keyb: Fix spelling error
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230220135531.1987351-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220135531.1987351-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20/02/2023 14:55, Linus Walleij wrote:
> The dependency had an obvious spelling error. Fix it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

