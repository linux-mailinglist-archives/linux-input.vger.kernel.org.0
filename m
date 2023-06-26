Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A29B73E071
	for <lists+linux-input@lfdr.de>; Mon, 26 Jun 2023 15:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjFZNUp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 09:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjFZNUo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 09:20:44 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879EC1AD
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 06:20:39 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fa96fd79f0so14496265e9.3
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687785638; x=1690377638;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rzH/phEV5FFH4VJebivIaHv6IvSXO334jauJCGgoVNw=;
        b=OjeVPFBYXxz83MG1Y+zMagxiBHQuuC88K7CNfaQno7uAPvU9HqktQRw2j1LEQHSv6L
         38uRhT7/oOdOmRi6A3bL4g0b/dLSJOxJXjBQE1grKu4GECEyB9gmmooY1yT5WX0qppAR
         uTNn91nF7UNQPqutWSt4gqF0mc/qWOW/lTpSoTXy5fyyWjr/QBMzpc9f/0h17AzonFat
         TZuMsPB+Ybb0FVhLV0pHnsIpTxrysJtseV6BY8giitGb6XFpm6Y1D10EdgXFX9sCo6Yi
         LFkDWfkSpAKFod7hyoiFcLMYB3X8Ov6tAOuz42LLJ06EWWhS2KdJTI/mErXIbCuRuJiU
         UUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687785638; x=1690377638;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzH/phEV5FFH4VJebivIaHv6IvSXO334jauJCGgoVNw=;
        b=GQis1Vo2DxUk4UW+ZIJMPLxRO/Nfc5ykyfN2K+r9IH//e92RiLkpp9Tu9k8lKVrqz7
         VXC5t9DyUnAXxRFf7rDdDS8d8ZnKOP2S5rB/h8FmPlhoEl9KT04wJ4df7g2mev8+bRnn
         L731XMnXrAG2Y6I1ODCEAMdt8DjSYKgC5eiYpHJqFZaHjM0t4RR3vRAbXQC6sUjWpiGJ
         fAlRBwUS7hTgN4g2CuFtQi/d3HYqQEy09k7p4d9fYntuzmhlom0tQGY1BUX1PGcUe01Z
         GYtygM2F/Yk2X72zYnM0FXZWS3xsJD8YXXpob3YQHFUHh3jgAVHiOTv1/B1hC8mNb3a0
         Y7xg==
X-Gm-Message-State: AC+VfDw0JN2O9YfC2hssgRM9gne+E4oNiwRq5hO5W4/9km8lu1gne3dF
        duQIpWjTmkUqFVktTqYTwzT6RQ==
X-Google-Smtp-Source: ACHHUZ6VAv9Ii8BNvTiNZE1BmxRf1Dmrc1N5HfUif3fDB6cBlSktml54K6be0NfHwO3e1lny1iG1+g==
X-Received: by 2002:a05:600c:3645:b0:3f9:255e:ee3b with SMTP id y5-20020a05600c364500b003f9255eee3bmr27690199wmq.30.1687785637888;
        Mon, 26 Jun 2023 06:20:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25a:b26e:71f3:870c? ([2a01:e0a:982:cbb0:b25a:b26e:71f3:870c])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c22d500b003f9cb3c8958sm10755952wmg.3.2023.06.26.06.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:20:37 -0700 (PDT)
Message-ID: <94e80a49-11ae-e5b0-7eea-6ed4ec6d2ac8@linaro.org>
Date:   Mon, 26 Jun 2023 15:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/4] input: touchscreen: add SPI support for Goodix
 Berlin Touchscreen IC
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606-topic-goodix-berlin-upstream-initial-v3-0-f0577cead709@linaro.org>
 <20230606-topic-goodix-berlin-upstream-initial-v3-4-f0577cead709@linaro.org>
 <ZJiXopmFr4dPbqll@nixie71> <e36a697f-a54d-7bdf-1e18-38f72ec2966c@linaro.org>
 <ZJmMJxXxLrC9Xevi@nixie71>
Organization: Linaro Developer Services
In-Reply-To: <ZJmMJxXxLrC9Xevi@nixie71>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 26/06/2023 15:01, Jeff LaBundy wrote:
> Hi Neil,
> 
> On Mon, Jun 26, 2023 at 09:02:16AM +0200, Neil Armstrong wrote:
> 
> [...]
> 
>>>> +static int goodix_berlin_spi_probe(struct spi_device *spi)
>>>> +{
>>>> +	struct regmap_config *regmap_config;
>>>> +	struct regmap *regmap;
>>>> +	size_t max_size;
>>>> +	int error = 0;
>>>> +
>>>> +	regmap_config = devm_kmemdup(&spi->dev, &goodix_berlin_spi_regmap_conf,
>>>> +				     sizeof(*regmap_config), GFP_KERNEL);
>>>> +	if (!regmap_config)
>>>> +		return -ENOMEM;
>>>
>>> Is there any reason we cannot simply pass goodix_berlin_spi_regmap_conf to
>>> devm_regmap_init() below? Why to duplicate and pass the copy?
>>>
>>> For reference, BMP280 in IIO is a similar example of a device with regmap
>>> sitting atop a bespoke SPI protocol; it does not seem to take this extra
>>> step.
>>
>> The goodix_berlin_spi_regmap_conf copy is modified after with the correct
>> max raw read/write size, and I'm not a fan of modifying a global structure
>> that could be use for multiple probes, I can make a copy in a stack variable
>> if it feels simpler.
> 
> Ah, that makes sense; in that case, the existing implementation seems fine
> to me. No changes necessary.
> 
> Correct me if I'm wrong, but the stack variable method wouldn't work since
> that memory is gone after goodix_berlin_spi_probe() returns.

The config is only needed for the devm_regmap_init() duration, so keeping
the memory allocated for the whole lifetime of the device seems useless.

Neil

> 
> Kind regards,
> Jeff LaBundy

