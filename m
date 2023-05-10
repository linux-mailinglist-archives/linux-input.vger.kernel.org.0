Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902AF6FE0E3
	for <lists+linux-input@lfdr.de>; Wed, 10 May 2023 16:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237555AbjEJO7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 May 2023 10:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237432AbjEJO7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 May 2023 10:59:17 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D2176A6
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 07:59:15 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so13475077a12.2
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683730754; x=1686322754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aehoaVgCSePqbPoVe97WNYRMqFAtsRLIVpWyzt/4WLc=;
        b=FmOs1NFd1SUzPGky5Rpf7/Z8g9QRT97ttT6uYa3ubjDXQrP8hHxDo9RNsx971U3bCC
         N1NoF+W3vZRR426+tirpbFlYKcZTTe99FVS8DhCulR1WjTSxTRyRERIk818Yb1gDvwUp
         IyVsrIl2M57sqIM/nXeJdLKQODQeyrSCHt1hqodknn/UOtH7On/RIPGPi5zCarqscwf7
         K8kkURtLhoOxsVwbbkcJcsdLIr9itFchAUHdqp5TvxSm1S9f+Gktgy2fWG4l3NocjdPI
         QzA2KKSIZEJDuCXXthoBHGMuoSaPUdEnMbZFWX8Zm2W/w/0aj47jJxSouYII/vwdJQ9i
         GNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683730754; x=1686322754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aehoaVgCSePqbPoVe97WNYRMqFAtsRLIVpWyzt/4WLc=;
        b=UH5/uanAVqsjC0v8Q8JKr7jLkTqzrRltA/l2IleLiriq2D9ibrL0sApw9/gYhFkp4x
         DGUounWyiHYv90lyDxTJ6/eL0RtBs6DpbILUZs0PQCkJay8rS5f9l/tufuGv3BtqYznZ
         rgey607N8KdgsTsHDMJQS4g2c21p/l+Il8gUxSLh8IrA7EZPLMfN/PUW69haYxcasbhz
         L3E8Dj4yR1fEKZZ6HK4TO5naf6L3NslQqAv43AFpxdhyZPcQmTiTDG/iQFSU/BceFzDW
         rhQUxip/Zr2RuqbAYAprmdMXPgBLQ7Bb00EzajrWqyWFYoOErZVnlWj/BH0Xr9dh25Zf
         CYqA==
X-Gm-Message-State: AC+VfDyMKJU6Wb4kPYQkAYTHhhaWOeamJQE+TqSv3pXMoeGgKZ66FVD8
        pGIhrKgsbCURy7LPiBPSrPa5vA==
X-Google-Smtp-Source: ACHHUZ6aBvD/dAkRrEm1gMWqoodG9M6ZxMPCBaWChZGOxhPwLp0/OMEolD8JvPElBRGEK6s7TeDm9w==
X-Received: by 2002:a17:907:3183:b0:965:626a:26cc with SMTP id xe3-20020a170907318300b00965626a26ccmr15378746ejb.65.1683730754154;
        Wed, 10 May 2023 07:59:14 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id jz10-20020a17090775ea00b00965ef79ae14sm2738079ejc.189.2023.05.10.07.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 07:59:13 -0700 (PDT)
Date:   Wed, 10 May 2023 16:59:11 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Javier Carrasco <javier.carrasco@wolfvision.net>
Cc:     Bastian Hecht <hechtb@gmail.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: input: touchscreen: st1232: add example
 with ts-virtobj
Message-ID: <20230510145911.66jxevntvzrghoct@krzk-bin>
References: <20230510-feature-ts_virtobj_patch-v1-0-5ae5e81bc264@wolfvision.net>
 <20230510-feature-ts_virtobj_patch-v1-4-5ae5e81bc264@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230510-feature-ts_virtobj_patch-v1-4-5ae5e81bc264@wolfvision.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 10 May 2023 15:50:49 +0200, Javier Carrasco wrote:
> The st1232 driver supports the virtual-touchscreen and virtual-buttons
> objects defined in the generic touchscreen bindings and implemented in
> the ts-virtobj module. Add an example where nodes for a virtual
> touchscreen and virtual buttons are defined.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  .../input/touchscreen/sitronix,st1232.yaml         | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.example.dtb: touchscreen@55: Unevaluated properties are not allowed ('virtual-buttons', 'virtual-touchscreen' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml

See https://patchwork.ozlabs.org/patch/1779521

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
