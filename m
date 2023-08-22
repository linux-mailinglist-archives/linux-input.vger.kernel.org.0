Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FCB78398E
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 07:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbjHVFyh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 01:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjHVFyg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 01:54:36 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9941D7
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 22:54:34 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so3238144a12.3
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692683673; x=1693288473;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TQX4y/uBks8nVow/iPGHdMMait3YhGPxYbRER/vAHI=;
        b=D2WKJgnPmiNc5DtPRLx3K/1bi+ALPO6Ox0BPf7MgWLCXGX+ugGmtbq6PTYiqkbsdXo
         pevGNinraFDgfmH0udKrxvA+87fIwn/o39IbxKDK2xuVdh69NujFmNtjV6Cq5YPe3Age
         Q6RtEx5OuvQRG7nuGwlY5HTkmtGbQbjM/IGdSlo/Mzlhiut4s3E5rxa726v6FRTlg5Oz
         hMkZ9FYIHP5yrD5OnYjsa1JLh6mAlcKh0DO0CakQeSXO6lVYNfvEd47N2rdrfhWQi8pl
         f6YhzJ6X+Re0bu/TQsYPyg6w1Wy5Az6uDAcKb+dcSpKEcX1OVcWO3AFd3nXE6gKAmToL
         lAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692683673; x=1693288473;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TQX4y/uBks8nVow/iPGHdMMait3YhGPxYbRER/vAHI=;
        b=bwmn/Sd53cl/8ORi+UUZ3AlU+SFYylw9hmKGMJ5duuAQC25sR3utgAjCd7FUsive2d
         1VxNGBx+YciPZ784wZlwxcV45XeyWH6xnSJ266nUaDAuXG2nPYy+FSZAAitAodGjok72
         xPmgCvZm2ufCa9MGpmxNzfeJ91AcnVeATpSlwOCkD0Z99vbhICUcPUj6fNU3V6cL6A5R
         7gaYSZYYCJDUNtQ0D6pgY3oLzzKEH/DofAttjMZ4ZDCXCD6nHJ0/IZPoTVdYouEf2hne
         c/HC0eGHv/4YClx7MeEz5egUZMG8GaIvl4cEAaT+vbbjSB8NzMszpBUK2V27cN/QygvE
         epew==
X-Gm-Message-State: AOJu0YyyTco7T31RXv1hdAPlEVro4TZ3iiw0MQvOGSp/4WuZbWTiR1Gc
        tHtChj879tIbAYMnVszk280Aaw==
X-Google-Smtp-Source: AGHT+IEhDWurn+BYTTaGcgwpERqWG0ysoExljMCFTqgXhHbhp9OQXV6bd64JEdpjuDYl/Vu3vIfg7g==
X-Received: by 2002:a17:907:a076:b0:99b:d2a9:9a01 with SMTP id ia22-20020a170907a07600b0099bd2a99a01mr6856980ejc.0.1692683673252;
        Mon, 21 Aug 2023 22:54:33 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906368600b0099bc038eb2bsm7588168ejc.58.2023.08.21.22.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 22:54:32 -0700 (PDT)
Message-ID: <07c6a89b-f545-a49a-db21-ec361811e4be@linaro.org>
Date:   Tue, 22 Aug 2023 07:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/4] dt-bindings: touchscreen: neonode,zforce: Use
 standard properties
Content-Language: en-US
To:     Andreas Kemnade <andreas@kemnade.info>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        rydberg@bitmath.org, u.kleine-koenig@pengutronix.de,
        Jonathan.Cameron@huawei.com, linus.walleij@linaro.org,
        heiko@sntech.de, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230821171151.555091-1-andreas@kemnade.info>
 <20230821171151.555091-3-andreas@kemnade.info>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821171151.555091-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21/08/2023 19:11, Andreas Kemnade wrote:
> Enable touchscreen orientation to be specified by using standard
> properties.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Rob reviewed yesterday v1 (although adding 3rd party tags might not work
with some tools):

Reviewed-by: Rob Herring <robh@kernel.org>

Best regards,
Krzysztof

