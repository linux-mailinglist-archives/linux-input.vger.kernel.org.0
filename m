Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEC15FB513
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 16:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiJKOvC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 10:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiJKOuq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 10:50:46 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D7897ED7
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:50:37 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id hh9so8351438qtb.13
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARkoPd8M29kPGeM8qAWkfi6M8hZhp8t8SkTlUe/Jc3A=;
        b=IWg6YoA+R7v4mauRKQrSCQgXgONUNjMUZKf3hMdGFKBs19oQlccYIH3Dt2H4nqXjd5
         lyjnDsbUVM+rt9nzkHZ72mOwr1YCjZegGE+b6ne+0pVvaId/nRqZXlTMpELUPvnMq6CJ
         shbVvHkkms9M6CjpMI7Mzpy9Z7x9Z7rGGKWZw1Q24qIToaAxY4eJjd3X1G5RLusItVuK
         SjYbH4pqcO0jddEDpyHPmrUO43xhn/xWrRlbkGsQjzpdwNxx+FIjYJ/GthD0DXo96RhW
         mseHa48tNZGf4FlCcr8Zhm6IPzmXeZWgCtNHBMMAmdUrEmZSecNEIUvPiBUmTuPh9yB2
         DK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARkoPd8M29kPGeM8qAWkfi6M8hZhp8t8SkTlUe/Jc3A=;
        b=jON7c8hLj2Hgeuk/Lw/noZyR3sO4sqh43iEAx9W1fqnVGMDsU2AUVcIRv5Jg33bWdO
         X0LSUlfZr/snQSfpoL73SP/z+iRZVLBSTCArAI38763VrUmdwN8xwyGVfgqIpy3h9xwR
         eOjOz9zTknc8E/iT1a53zUK5/+Q8nw6uLHHdQXgarn+o7lxecs4THM/3vAwjmCWL4oey
         qaKTPBYxWB2n3xY2lH/LYy78omd4KBxH1WO0VlUfY9mrupvDLMV9BEEKZ9HGyRpsrCzA
         bBWkAHMSIYQiRqsPV8Ww88LzMe2Doex1VGFlAAbG2X4ICZMryWaUgIhFW4zwOM7vL/wt
         1i7Q==
X-Gm-Message-State: ACrzQf1fOxZfgrA5j2tvnC9GKs9yD5zRSKxhOEUleA2+E/I+2ShymlPM
        x8lH/MrkS03AgacV4LgIFJtu1w==
X-Google-Smtp-Source: AMsMyM4+tXXvWkoKLCPUTn8kj2gzDJcsSI7tHkYr4xYjw4DcJe9MBSvtRF/eE+iCFLqTtili11742g==
X-Received: by 2002:a05:622a:138e:b0:399:2b42:5ff1 with SMTP id o14-20020a05622a138e00b003992b425ff1mr10561720qtk.361.1665499835495;
        Tue, 11 Oct 2022 07:50:35 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id a18-20020a05622a02d200b0039543f89109sm11383713qtx.96.2022.10.11.07.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 07:50:34 -0700 (PDT)
Message-ID: <72b9809e-d6d7-862a-26b8-221d14ea4322@linaro.org>
Date:   Tue, 11 Oct 2022 10:48:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Add tps65219 as modules
Content-Language: en-US
To:     Jerome Neanne <jneanne@baylibre.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
        kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-7-jneanne@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011140549.16761-7-jneanne@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/10/2022 10:05, Jerome Neanne wrote:
> This adds defconfig option to support TPS65219 PMIC, MFD, Regulators

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> and power-button.

You explained what you did, which is easily visible. You did not explain
why you are doing it.

Best regards,
Krzysztof

