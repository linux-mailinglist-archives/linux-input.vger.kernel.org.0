Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45EDA760C06
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 09:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbjGYHgK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 03:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjGYHfE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 03:35:04 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153222118
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 00:34:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3174aac120aso2025107f8f.2
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270458; x=1690875258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDGnj8E3hyVERnnPmi0+OR2KS7yE69P/gg3JEe0kCmw=;
        b=TlcCv3r+21MtMVb5A8K/NLO8fQ8h8l+y4kP/EbvetnIgoXORNiqaD/6zqCXbDgouwv
         owi575Vwe2Xj0CTVc4Zc0SbvuyuKkDLvgeLnoHLiTJBZSvFLIz4C55aMwO8DG9WEB4H2
         042pg7XEaGwDkuNn+tPjJbNvLMYv6O5EFDJiwPnTNaLtPDuvfiGre2RKUDbc9k+lb+3Z
         H0HYHrK4VVYLxDlSWNDWdAY2T1JV7/+9/qAcggtFcucW3O2WIFvGpDN1fb3b3X28QKbk
         lQthahjxqe+w1A/F2Bpzvd/RZsPVsRk/8M3IukRIBCuv6Em7KolCyYXVn7V6rJUbj1bp
         R2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270458; x=1690875258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDGnj8E3hyVERnnPmi0+OR2KS7yE69P/gg3JEe0kCmw=;
        b=Iz07iE4rq1STVjBNfCoKvaD1aa0B6U7avqePdEYQY25P36otpGO58fUQFZIrwdnZqX
         fI7+YEsFfHmU4fwDQPaMy/XLM+f/JXXMdsZITJ5YfGvoNJSYQQ1PPlLFOGml/hncyuHo
         pR4iTxFRkvvTQetEanD9IlMm2GGY+iyyzI8gZ5+xGA3d0iRO8hJxq08ZyiaMTKWc0aHN
         PQh/GZlXIMW+z9a1u+qA80wVp4oaOi2SKQ6Xg1Q9r29dwO6/LrIvPz6FD9q3/6+/tnaq
         Ira8WV8Mu4pJnWsiEhjm59Yqhrb19FBgD4/Y3zH0TlwuhtWCI9mPxtpMPkrFvNSf+NhU
         dr+g==
X-Gm-Message-State: ABy/qLZwF1ndSry5Cmm2fSwbOgK20fT9dt2C9E7UszDrEjEezkB/ktJ7
        R+uH2NPadyQ0DzqGrohQpJjt7A==
X-Google-Smtp-Source: APBJJlGleX5XZxoJnhR1vJzLx6A099QP8YxZB9OyiN955KOB/2yaWckeRZ6hXvmNOT311YutWCoVDA==
X-Received: by 2002:a5d:6204:0:b0:315:a17d:dbc6 with SMTP id y4-20020a5d6204000000b00315a17ddbc6mr7952152wru.14.1690270458478;
        Tue, 25 Jul 2023 00:34:18 -0700 (PDT)
Received: from linaro.org ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id r5-20020a5d52c5000000b003143bb5ecd5sm15439765wrv.69.2023.07.25.00.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 00:34:17 -0700 (PDT)
Date:   Tue, 25 Jul 2023 10:34:15 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, kernel@pengutronix.de,
        Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Mark Brown <broonie@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: clock: imx6ul: Support optional
 enet*_ref_pad clocks
Message-ID: <ZL969wWEhZkWNLy5@linaro.org>
References: <20230621093245.78130-1-o.rempel@pengutronix.de>
 <20230621093245.78130-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621093245.78130-5-o.rempel@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 23-06-21 11:32:44, Oleksij Rempel wrote:
> Extend the 'clocks' and 'clock-names' properties to support optional
> 'enet1_ref_pad' and 'enet2_ref_pad' clocks to resolve the following
> dtbs_check warning:
> imx6ul-prti6g.dtb: clock-controller@20c4000: clocks: [[17], [18], [19], [20], [21]] is too long
> imx6ul-prti6g.dtb: clock-controller@20c4000: clock-names: ['ckil', 'osc', 'ipp_di0', 'ipp_di1', 'enet1_ref_pad'] is too long
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/clock/imx6ul-clock.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
> index be54d4df5afa2..3b71ebc100bf6 100644
> --- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
> @@ -28,18 +28,24 @@ properties:
>      const: 1
>  
>    clocks:
> +    minItems: 4
>      items:
>        - description: 32k osc
>        - description: 24m osc
>        - description: ipp_di0 clock input
>        - description: ipp_di1 clock input
> +      - description: Optional lenet1_ref_pad or enet2_ref_pad clocks
> +      - description: Optional lenet1_ref_pad or enet2_ref_pad clocks

s/lenet1_ref_pad/enet1_ref_pad/g

with that:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

>  
>    clock-names:
> +    minItems: 4
>      items:
>        - const: ckil
>        - const: osc
>        - const: ipp_di0
>        - const: ipp_di1
> +      - pattern: '^enet[12]_ref_pad$'
> +      - pattern: '^enet[12]_ref_pad$'
>  
>  required:
>    - compatible
> -- 
> 2.39.2
> 
