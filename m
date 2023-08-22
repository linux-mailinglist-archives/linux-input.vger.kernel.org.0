Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CB078398B
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 07:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbjHVFxc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 01:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjHVFxc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 01:53:32 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4CAD7
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 22:53:30 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so8359131fa.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 22:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692683608; x=1693288408;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YclWG5r8FOwzKxdmQ7yoGnwhJn4JvlTIe9J5LgNQq7U=;
        b=WSS+g6A6q+xua6xPjBLSyt5939/WFW5rR6kW4ACicPv26Jj3S5ME7qad2B+/QdO4tl
         XWA3vrX/hNzoC+jdWjBBqvv2PcvKIZYGzCRgB0iGWm7Q5Xd6NxAXmO5SjYnQSXG3sMtm
         EHQCWYmcnvUc6Das+KODUiDYCxg/LcYb3mO6lQFJgKCuwKrY+bTs8YgQ72R3rbMX+uij
         JXTd9eL/cvgAkTweKjawQECBsFvymVn8oactmFssC2O+frFYBAAfvQxiWDpQlCcHNOy9
         skoBzIk36tJwJJ+tE3yaa8WHJWzPnGCq7TfMGXwN7VVk1fJpiLhKYiC0qp7gcQs8M7QO
         y6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692683608; x=1693288408;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YclWG5r8FOwzKxdmQ7yoGnwhJn4JvlTIe9J5LgNQq7U=;
        b=YSdUIhQdrNbJ9uD32NT/rj/kvRbh8AkY7reRrlkIGVPoU0qt84nviWhn4heMUidCOx
         rStJYBz23sbAQmRSFtdj9km5ZNpQw5jA/tKZqaseRC8slyu9SIr2B2SvzlRS2tj0hf/p
         7c0REuF/jWMkq3WON0c0CugFzQjucWfxPZ07oOyfi57SQQZ1PGBuwIpGxfLOS02GoitE
         aho9fFZ/h1lJlzsm0uFQXNOamLTqXd41St89PlkokDB6+1bczSYEOHuGgu2Rb2cTDV5Q
         JrFV/REGPC0AzJPPa1B6/qU7f13gv8/d1jPwI3zVjcczPGN0os6JbjFz95/nf89MjYOJ
         GHeQ==
X-Gm-Message-State: AOJu0Yyhzz9WQtjtyC6G/S2n4wK/ArbEWp70Vw06slqjrvEUbKn/lN2Z
        9nt2EiDFRxflyloen110A96ruw==
X-Google-Smtp-Source: AGHT+IGwzUrCGIQEn6gDwZlnstlzuErkxJ9bkfS7lUv6kaL8GC3cD1kuDouQOUNIiEhJ+s8ddkA1ug==
X-Received: by 2002:a2e:8283:0:b0:2bb:94e4:49f with SMTP id y3-20020a2e8283000000b002bb94e4049fmr5399822ljg.32.1692683608683;
        Mon, 21 Aug 2023 22:53:28 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id n23-20020a170906841700b0099ce23c57e6sm7545498ejx.224.2023.08.21.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 22:53:28 -0700 (PDT)
Message-ID: <da281686-a187-4363-ad97-015ae93ca5ac@linaro.org>
Date:   Tue, 22 Aug 2023 07:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/4] dt-bindings: touchscreen: convert neonode,zforce
 to json-schema
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
 <20230821171151.555091-2-andreas@kemnade.info>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821171151.555091-2-andreas@kemnade.info>
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
> Convert Neonode infrared touchscreen controller binding to DT schema.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

