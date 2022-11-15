Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53FAA62AE42
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 23:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiKOW0E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 17:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbiKOW0D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 17:26:03 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752302B613
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 14:26:02 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so462715pji.1
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 14:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0uftbK3o2kwR2nvD90dsb+LA1y7S9LzGYBR1hgiw/w=;
        b=3OQE6HZuMO9NsuB8h2KP0ks4Mb7A24Dl/DwHpvYG/zFCCXrHewWatCGCwTqGwtmn96
         mBwkfuqgJQDAcw/DPMSE0wauiEDF2Aas3AcTCh3s0jdZPEJHrP+YKDTMay2TNcNj/Sc+
         u9CP4ZeOjWrDvl+1ze/CtjUMH1YuD+UnusJdtetFPFd/zeDNFIIuJJnpuwgeOCJGgWdJ
         9aamQf0Ca3gzq4PncdDKBBXQswdpvdbTKMfXze2hmxc3ULlBS/Zlie1Ct2MRBQappZtJ
         cZZnkbGJCKjqRwM6sdbbsD8nP7Edh8MOTIeGoZgn/jaT6/zT6kqLoKGHQPwvx3dsWY2Y
         gYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0uftbK3o2kwR2nvD90dsb+LA1y7S9LzGYBR1hgiw/w=;
        b=attnmjl3pZmjAB8H4cBzn+OGG1IVIL/zGpNDgWOCZaSeOHAoiwDZ2wIkWLuE9onf2t
         jVm9WWN0tgT6SmJx50FAW2NDNYOAwUgkLcphHVmAo806D40LZf0Y2C4XFD89zm3vFd5n
         vDWT/lnUyjEnNPdMPYxIukawWokQbqqW7lKZlwZKq2/Kj+td3caVKVRWLh/j8VNjOq0x
         WG6jWNXuEQMcVJV09al3R1jtZsRvn474ty1oTxzmDP7zojBJm2XHWaACcy96PZqcdmap
         ln4sN62CcmQMAp9D6yzz8Wh8mGUZ8YmrlIiofTeRkaRWvLgtWBYEVnqvw4dxrrZrbkut
         bWlw==
X-Gm-Message-State: ANoB5pm1Nkx/ighHKPYzxezzsJwYnedgb4yPP64ZRmQbTnQZBXB++mKA
        vCtRRFQOg3M0xnSDKgm35Ai31g==
X-Google-Smtp-Source: AA0mqf47a30/4xfvQ8xdYjMqpWcqKOa1MCIfcsC6qf7Cqyo3EXErMIWsi12Jr+Vs1Fztc2Jenh8cUA==
X-Received: by 2002:a17:903:484:b0:188:82fc:e284 with SMTP id jj4-20020a170903048400b0018882fce284mr5998436plb.76.1668551161846;
        Tue, 15 Nov 2022 14:26:01 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id i8-20020a170902c94800b00187197c4999sm10547723pla.167.2022.11.15.14.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 14:26:01 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Jerome Neanne <jneanne@baylibre.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
        kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 4/6] mfd: tps65219: Add driver for TI TPS65219 PMIC
In-Reply-To: <20221104152311.1098603-5-jneanne@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
 <20221104152311.1098603-5-jneanne@baylibre.com>
Date:   Tue, 15 Nov 2022 14:26:00 -0800
Message-ID: <7h1qq3am87.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

Jerome Neanne <jneanne@baylibre.com> writes:

> The TPS65219 is a power management IC PMIC designed to supply a wide
> range of SoCs in both portable and stationary applications. Any SoC can
> control TPS65219 over a standard I2C interface.
>
> It contains the following components:
> - Regulators.
> - Over Temperature warning and Shut down.
> - GPIOs
> - Multi Function Pins (MFP)
> - power-button
>
> This patch adds support for tps65219 PMIC. At this time only
> the functionalities listed below are made available:
>
> - Regulators probe and functionalities
> - warm and cold reset support
> - SW shutdown support
> - Regulator warnings via IRQs
> - Power-button via IRQ
>
> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Acked-for-mfd-by: Lee Jones <lee@kernel.org>

You've ack'd this for mfd, and Dmitry acked the input one (PATCH 5/6)
but suggested it be merged via the mfd tree.

Could you please take patches 4 & 5 of this series? Then the DT
patch can go via arm-soc.

Thanks,

Kevin
