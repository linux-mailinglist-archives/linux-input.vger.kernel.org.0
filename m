Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4685F7247C9
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 17:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238642AbjFFPck (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 11:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237968AbjFFPcc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 11:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8B3E6B
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686065507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i1t0pmKIt5vaJFpwmXmGq+ZDjgfyGlSjiNP3LMD+ACA=;
        b=LMSyfGdjxoPgJDkQzHDa4j7GEmSYX3mbxtJZtPMc1pVphLtjnDLBn9SDtaNzflIVbcJir6
        AqGiVf2q597TaFlmEKvghmtSnOEwagw6prd9VleJsChv4tXwmcMyS/fL/7n5BQ9KUobfGF
        vDlwNH47amhCvYl74Tb1Pz7ToQ+2FDY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-u1wC_utMMA-9cm36CVK70g-1; Tue, 06 Jun 2023 11:31:45 -0400
X-MC-Unique: u1wC_utMMA-9cm36CVK70g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355cf318so517024266b.2
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 08:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686065501; x=1688657501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1t0pmKIt5vaJFpwmXmGq+ZDjgfyGlSjiNP3LMD+ACA=;
        b=M6R4FNyKWgFb8bUG/4HiZZpeM8wGlcSwFJc3wSMrFpLvtoNxQ2QV18u96d5inCEUZ2
         TSuUMVrkMU2TJN2c7D93xJTJZo6jZXQey9ouzkWFzSk5gskhRANgDhGlmdt6hWpU2CSB
         2q8TlHgnShzHGkJE/fTog+U/HvqOnvgou1n6eINIT2OUmf8Z2sfRL0CC8EOCx2vrOnRy
         oD1DTsylBsVe4IAqHNtNBGv4tvWleMFUao7fF7bRyKrWpIuRYdNlBA6WETX3vvYP7C/w
         1ktpdxLclW0JT5DPpuTOS8YzAB56cBVuYBa702DBcdGWwgyISmZr4uMnfYglmuEoq6FP
         yDdQ==
X-Gm-Message-State: AC+VfDwpMvezXN5Fpq7ox0m5D9ysk+2/gmHOTGwh7rl+A1/ixmQeh8DK
        0RjlCbls25AODG9hOzoW43XqaUmBlii9CT1DPr622OBIDD6L/qV0/3ODfU0mZ4OO1rMqfqVuNUP
        wfMlfCUOG8OzBTjCwTEt0Bt4=
X-Received: by 2002:a17:907:948c:b0:96f:f6a6:58cc with SMTP id dm12-20020a170907948c00b0096ff6a658ccmr2663392ejc.15.1686065501295;
        Tue, 06 Jun 2023 08:31:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fmsq+XYgnJ2EVJ0RhRfL6yxjqnq4cY+vHlsWelX09825PP4Sa5cKe57yjCaKRFE9J9fQwCQ==
X-Received: by 2002:a17:907:948c:b0:96f:f6a6:58cc with SMTP id dm12-20020a170907948c00b0096ff6a658ccmr2663381ejc.15.1686065501036;
        Tue, 06 Jun 2023 08:31:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709060a5600b0096f6a131b9fsm5689719ejf.23.2023.06.06.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 08:31:40 -0700 (PDT)
Message-ID: <f5f20de8-851a-fe20-4664-62b6de14ebd7@redhat.com>
Date:   Tue, 6 Jun 2023 17:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC 0/4] input: touchscreen: add initial support for
 Goodix Berlin touchscreen IC
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Neil,

On 6/6/23 16:31, Neil Armstrong wrote:
> These touchscreen ICs support SPI, I2C and I3C interface, up to
> 10 finger touch, stylus and gestures events.
> 
> This initial driver is derived from the Goodix goodix_ts_berlin
> available at [1] and [2] and only supports the GT9916 IC
> present on the Qualcomm SM8550 MTP & QRD touch panel.
> 
> The current implementation only supports BerlinD, aka GT9916.
> 
> Support for advanced features like:
> - Firmware & config update
> - Stylus events
> - Gestures events
> - Previous revisions support (BerlinA or BerlinB)
> is not included in current version.
> 
> The current support will work with currently flashed firmware
> and config, and bail out if firmware or config aren't flashed yet.

What I'm missing here / in the commit msg of
"input: touchscreen: add core support for Goodix Berlin Touchscreen IC"

is an explanation why this is a new driver instead of adding
support to the existing goodix.c code.

I assume you have good reasons for this, but it would be good
if you can write the reasons for this down.

Regards,

Hans



> 
> [1] https://github.com/goodix/goodix_ts_berlin
> [2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (4):
>       dt-bindings: input: document Goodix Berlin Touchscreen IC
>       input: touchscreen: add core support for Goodix Berlin Touchscreen IC
>       input: touchscreen: add I2C support for Goodix Berlin Touchscreen IC
>       input: touchscreen: add SPI support for Goodix Berlin Touchscreen IC
> 
>  .../bindings/input/touchscreen/goodix-berlin.yaml  |  81 ++
>  drivers/input/touchscreen/Kconfig                  |  33 +
>  drivers/input/touchscreen/Makefile                 |   3 +
>  drivers/input/touchscreen/goodix_berlin.h          | 228 +++++
>  drivers/input/touchscreen/goodix_berlin_core.c     | 935 +++++++++++++++++++++
>  drivers/input/touchscreen/goodix_berlin_i2c.c      |  76 ++
>  drivers/input/touchscreen/goodix_berlin_spi.c      | 183 ++++
>  7 files changed, 1539 insertions(+)
> ---
> base-commit: 6db29e14f4fb7bce9eb5290288e71b05c2b0d118
> change-id: 20230606-topic-goodix-berlin-upstream-initial-ba97e8ec8f4c
> 
> Best regards,

