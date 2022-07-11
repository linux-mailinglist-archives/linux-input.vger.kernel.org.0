Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F212A560892
	for <lists+linux-input@lfdr.de>; Wed, 29 Jun 2022 20:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiF2SG0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jun 2022 14:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiF2SGN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jun 2022 14:06:13 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A818E38D8E
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 11:04:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eq6so23260866edb.6
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=QRZYmSHd0fW/0rpKcJtjnCBCEHtOGHUlfGPqix1nutc=;
        b=ThZpLHHCYeErIFg5jTXT9AIBzy+wXkgTCdbI2QBz4l+DLSPb1qzWv24LA3DXPXhFnW
         RJQdy5+uJ6M5W5K66xyKoerW9EFAP/d4HJbLB2VwkWhTIEMAs+m5ulY6iWC9F3hxAWmo
         uugnOlR6F+Wy+Zp98wbz8/PEgSUUn3b620eXRt24aPlItB/fFZYjam67/wgShtsncLmW
         drX+QbIPmSWiMIIeEwhRnJcSjd+vNv0a9NTAwP8ZQPLvIuWIYnJo87suP9/Mj6+e3BNb
         8cb6F4pX4S6F23/3hWy456xx+z66DoruzIHSz89+5lnPTklNIQ7sNwNV+q1Vse9u88k/
         JEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QRZYmSHd0fW/0rpKcJtjnCBCEHtOGHUlfGPqix1nutc=;
        b=l1jJOLpr6APExuFg75NtOAmgMzjidUi7RMJ/idrYpAn+e4sstyT9zCWDbtV1F047Q7
         nQTu5VlgQZ5WJ2d9NRGu3dcHXYN5LFT1oKGa8dCFmQ9vBpjxFosw0b4WTASAUus6IN0J
         xsKBGfbVe+rLMnWaZzCeF4ly3T9CW7WbBdhg63mMy/5xBEcFxmecfWoX7b6qmHkmgzj7
         zgcrl2PNMWV2KR8s8Ge8yroNunaSmaUW3OXf309/2h/eFosDmeoRTRxOCdvYpr4ROseJ
         xVjKsNOlxnmdlGTcNz9JTuEwvVwXyDDMptI/kLks0Cfv9p1MG1YK62d5noEMM7sMbF7e
         ff0w==
X-Gm-Message-State: AJIora8WeUXiXh/xotlx4jfgzAa8OiGnxSSmkPeiM5xFxbZjMlAN6B7v
        w+Q0ROgSXw0eTY0bPRMcX4JIzA==
X-Google-Smtp-Source: AGRyM1uLlaIJ84yFjxXGzoRXlEP7Pzi5XHwdwaqh+uTAtWmoP+HFK1BiziFP1dsleEiquWrv6JaGMg==
X-Received: by 2002:a05:6402:5256:b0:435:9017:e5d3 with SMTP id t22-20020a056402525600b004359017e5d3mr5974705edd.258.1656525886229;
        Wed, 29 Jun 2022 11:04:46 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906454200b006fe9ec4ba9esm8130608ejq.52.2022.06.29.11.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:04:45 -0700 (PDT)
Message-ID: <483d5115-4027-e811-8bce-15da6c7c660f@linaro.org>
Date:   Wed, 29 Jun 2022 20:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 10/14] arm64: dts: freescale: imx8qxp: Remove
 unnecessary clock related entries
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
 <20220629164414.301813-11-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-11-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> "clocks" and "clock-names" are not used the driver, so
> remove them in order to match the yaml definition.

So this explains the unexpected change in the bindings... but actually
it does not explain whether it is correct or not. Just because driver
does not use it, is not a proof that clocks are not there. In different
OS/implementation this DTS might break stuff, so basically it is ABI
break. DTS should describe the hardware fully, so if the clocks are
there, should be in DTS regardless of the driver.


Best regards,
Krzysztof
