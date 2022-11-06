Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CACB61E0DA
	for <lists+linux-input@lfdr.de>; Sun,  6 Nov 2022 09:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiKFI0A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Nov 2022 03:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiKFIZ7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Nov 2022 03:25:59 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BDFA47C;
        Sun,  6 Nov 2022 01:25:58 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id q9so23128244ejd.0;
        Sun, 06 Nov 2022 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMkkVzTjokrGWbF60wePAUHPChBzzzz4VP13xe+Pvl4=;
        b=VkQHyBRVLM3X/7q9r4x+KFZ3krHyQtPrjhPFn7ae/KZ/TqT2OmbLJEkqSy1gPyWiZs
         o+/X0cLgik/Yf7Vgkb021OCvwActcxXhFDyrfkykPBJ4k/pmFjpkWIP/yrUnMxMPWrt5
         zJ5OOrkjVE8k5Jsk9OXuS0TfUWIg6HERB5HR4ayxdMU6A7ff/uO62lviQ9rX4kvBTwut
         uJ2XsryPQFVxCfaMOPLEuDlRz/Kmravra1aLuwzJXQmrZPZWE/kw+qb1f/gy3WYP5rb1
         6ZLXbWoOLNc/EZTzrT29YmS/quh4w5/2YcATJlpjV4X2H4JTEGGf6xAh7g6ZI610oOFg
         xnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMkkVzTjokrGWbF60wePAUHPChBzzzz4VP13xe+Pvl4=;
        b=QGSFo2lG9/wiba5lFWmC834hR5vHFO7BOV8BIBbPe1SrbN4zWsljSOkMdMSPkrNYz3
         68DSQ452YFJf+p5mEQxgAFTKbNDVCV9QRXI/xqILKJ1YQaRYE5FEiMvkE4n4xbxL429a
         4eeQtJChAiGWgE8Q6xCL90MWdYMEh5Vm6Iy59Q27h7orCuRcrhVoYJhItBWYD5uamXcD
         nxn2ceBaR7fJTY71hTc2Q7ZMQwZRQblYSxG4SnnX7YnR2p/NqyCCOIPLGtkjfQ//mc6O
         cosmhtGDjtEnCJ+EeoOaID35sickaIsq3Cl7PqYFPgqnTbg3gc86A8Vur8I473Pq8Aru
         eCGQ==
X-Gm-Message-State: ACrzQf2PM+jY0MbuWbfEuRac1V+N5zIYXBb/CRn2d8ORN6y0anrRwXXi
        6W0V2JSubEPkOvGW0UuK0b8=
X-Google-Smtp-Source: AMsMyM47mGYqM7uM25Nj6eKtulEjXm3wNmW2uNtAL8wo8j6Up4cBvqLEI6qqJbWvwFQXObbvEik9mA==
X-Received: by 2002:a17:906:9bd4:b0:7ad:2d86:418c with SMTP id de20-20020a1709069bd400b007ad2d86418cmr42896478ejc.380.1667723156918;
        Sun, 06 Nov 2022 01:25:56 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id em3-20020a056402364300b00458824aee80sm2334858edb.38.2022.11.06.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:25:56 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 9/9] ARM: dts: suniv: f1c100s: add LRADC node
Date:   Sun, 06 Nov 2022 09:25:55 +0100
Message-ID: <45074583.fMDQidcC6G@jernej-laptop>
In-Reply-To: <20221101141658.3631342-10-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dne torek, 01. november 2022 ob 15:16:58 CET je Andre Przywara napisal(a):
> The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
> compatible to the version in other SoCs.
> The manual doesn't mention the ratio of the input voltage that is used,
> but comparing actual measurements with the values in the register
> suggests that it is 3/4 of Vref.
> 
> Add the DT node describing the base address and interrupt. As in the
> older SoCs, there is no explicit reset or clock gate, also there is a
> dedicated, non-multiplexed pin, so need for more properties.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index d29b48f23b89a..03592c8e63fed
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -262,6 +262,14 @@ ir: ir@1c22c00 {
>  			status = "disabled";
>  		};
> 
> +		lradc: lradc@1c23400 {
> +			compatible = "allwinner,suniv-f1c100s-
lradc",
> +				     "allwinner,sun8i-a83t-r-
lradc";
> +			reg = <0x01c23400 0x100>;

User manual says 0x400 is reserved for this peripheral. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +			interrupts = <22>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@1c25000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x01c25000 0x400>;




