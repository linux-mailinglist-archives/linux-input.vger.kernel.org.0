Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB0473E055
	for <lists+linux-input@lfdr.de>; Mon, 26 Jun 2023 15:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjFZNQt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 09:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjFZNQm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 09:16:42 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75D0E5B
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 06:16:39 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3094910b150so3980904f8f.0
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687785398; x=1690377398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y9SuCibQ/WU7SG8dia+NMu74S1vOkTFRHqLbc73KGlY=;
        b=Dfs9vVW3Q/TN2c0BsoihP4tI0oBCwDaXojV9rgCuNjHguAvNJ4cx8nzEX2CiJBZcxJ
         kiF/vvIYe6Cl0B5Xkulvz1m0GZrDOB38OHwZ7oGMeYNzKhN8OGVu3BUmeg6w/pMhW0cU
         mzmWzt+D4G8EueMUyyoLfL4Lin6cOKP0mUpHNyiGys26al1U+p6Jh9zmHy0LWt0IIc9N
         R2H0wetqKssEwK7nJ/gMLvBO6T6zVtwmEGL2sMX8tjxgTaPhJkZtjXV+976F04bG9dmy
         PuFcqF4VhPlclqMPuPG3C+g0R1Gv+cPQRmrBytpCUuXzJqEMEgac5ak0QqzMXLZ1C3oB
         J/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687785398; x=1690377398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9SuCibQ/WU7SG8dia+NMu74S1vOkTFRHqLbc73KGlY=;
        b=k2YHkIOK8/Ml1XgDso4q+pNeYgofUqSS08SUy4X15LtodQMJ9zagd7KYWINTs4rmhT
         nQb0cDmzE9TSvVkON/Kt8U/QnMDzbgGQgqfRfW65UqNXY8RD9m6POpPJJ+dm3m57pN1W
         mFCOjS+v0rG8fmsJ7s/YKxODMW7x3WGq2r3lJlAuQ7WPUrXuEp8fScw2wzIVVIDIKffk
         cy0Azywwfb9uRxfdVDJczKM3PLf+i15Od+/U6cjeqCpwaQP6eW241RLZHy+ez5wZOLtP
         XKOkJgRm2QTUQf9tubxwHBGfeR8punI/ewZ1PHwvdSyeX+mJyop8qKB7QsuGT2PGriT/
         WUtg==
X-Gm-Message-State: AC+VfDzx/TYX14HjYRjdR/1OeQqLOo0dXknq9X0xMW6wWp+Zv8UmHyuD
        Tdod9yqcGT7Igj+Hkq+qfjZE2A==
X-Google-Smtp-Source: ACHHUZ5FEjMo0HPmxKwdNDorF8tMOeiRn03K/IDhQjOEGS1OgnCuScRzPMfHoqMD6lH0sZDtMBzYGA==
X-Received: by 2002:a5d:4fcf:0:b0:30f:bfa0:3eab with SMTP id h15-20020a5d4fcf000000b0030fbfa03eabmr23008423wrw.21.1687785398311;
        Mon, 26 Jun 2023 06:16:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d5682000000b00313ec7dd652sm4527923wrv.44.2023.06.26.06.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:16:37 -0700 (PDT)
Message-ID: <bd78bed6-b351-4e1a-b1cf-29391f9ba264@linaro.org>
Date:   Mon, 26 Jun 2023 15:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: microchip,cap11xx: add
 advanced sensitivity settings
Content-Language: en-US
To:     Jiri Valek - 2N <jiriv@axis.com>,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        u.kleine-koenig@pengutronix.de
References: <20230626113740.809871-1-jiriv@axis.com>
 <20230626113740.809871-2-jiriv@axis.com>
 <0503b8fd-e8ce-ffda-577a-b851a9eebb07@linaro.org>
 <cd833975-7dd8-95a5-4bde-3dcdf9cf65a1@linaro.org>
 <a6d6e4cb-b4d1-8ef3-31ce-2d09c9535dc1@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a6d6e4cb-b4d1-8ef3-31ce-2d09c9535dc1@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 26/06/2023 15:14, Jiri Valek - 2N wrote:
> On 6/26/23 14:41, Krzysztof Kozlowski wrote:
>> On 26/06/2023 14:36, Krzysztof Kozlowski wrote:
>>> On 26/06/2023 13:37, Jiri Valek - 2N wrote:
>>>> Add support for advanced sensitivity settings and signal guard feature.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> What? How did you get it?!?
>>
>> To clarify - your previous patch was not working, not tested and not
>> correct. I pointed this out and I really wonder how from pointing out
>> errors, you figured out that I give your patch green light!
>>
>> Best regards,
>> Krzysztof
>>
> Sorry I incorrectly used "Reviewed-by" tag. I wanted to add you as reviewer
> and give you some credits. I hope that "Reported-by" is better, but I'd
> rather put no tags.

https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L500

Best regards,
Krzysztof

