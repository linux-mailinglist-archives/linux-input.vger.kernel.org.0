Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0C86F41E3
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 12:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbjEBKjp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 06:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbjEBKjR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 06:39:17 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A28A49C5
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 03:39:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f00d41df22so27393593e87.1
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683023953; x=1685615953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfApgfkvfKa0zHY7COCQ25fltZLWlP80il9qIf2gk38=;
        b=i/VabHSiZcXg+qtH7T6Zx/wUpNCbz5CC7Y/wzTiHYu4jVuPlfKQPFc3Iq2UR0mc/cf
         3XF3U8tNh+1Keb3TKi0Awm4wfDctOlRxXJQ0AAnHTWymY34R+PYWcOSE7WZq8y9K5XN+
         QqfRHhdxpkkv45U9C2cZU96bjMveYgTmEWWcBhurZCAKtonLtUHz1rsTOhVLeE11afbF
         28H/YsGYHl8nwIKeCqjkGkUO51rMlDez/ZwMCUjhKqjuiQ39UVJi5aeWs/jEOyT5fcxR
         t0pdes+teZYn40Uu1dfokTvAxReMsY10GxF5q0e/LXS+nvl06gQpaoLshwOVmCSzJJH+
         28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683023953; x=1685615953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfApgfkvfKa0zHY7COCQ25fltZLWlP80il9qIf2gk38=;
        b=bsmQf/zDzQEHFqKjV3hcvP2J3jta1TPK6lUzxd9sCGHVKAGu7ZE4wIXUwN4NZUFAlF
         RByVlOYa825u4oj4Q2U9dkhbcTLXFjgNiUs2JCNFSdMvkXIv2HAwJ0yDidwOqWZYFiDg
         K+GqWmAVZcnOvZIq/p+UrspibR4ZG5FioUUzv26rDtasET+nuInD3tPq45HKzXTO4vxg
         mPk8ROWPBFPzjiWR7xgMwiMKhgtXQLcKDx4WnwNQoRhCiBDDvKMidR3W7DuQzVuUZbR+
         l/PLL87WoYvCY7BzldHIYTmp6LuRhGIaEWWfknICET5o9gO1Spwir3B22X3B+mxZOBYR
         e8OA==
X-Gm-Message-State: AC+VfDyntrIke1MZ87lWrWKXUiCwdfQRkHIPy4ILw1yUBcOChCVZqzWf
        NGOZeWLtWUdxCQi3FmeJ6knHkg==
X-Google-Smtp-Source: ACHHUZ4ibU291EnaEYZSAU8X9eaDv/XrNqaT8luwOQFNrvkj6gGfjpZyNvAi/9lSSfCRUw4pKQxbJg==
X-Received: by 2002:ac2:44a2:0:b0:4ec:9310:ad4e with SMTP id c2-20020ac244a2000000b004ec9310ad4emr4833335lfm.33.1683023952816;
        Tue, 02 May 2023 03:39:12 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id w3-20020ac254a3000000b004f0c9120a41sm1349688lfk.214.2023.05.02.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:39:12 -0700 (PDT)
Message-ID: <8a54d0ec-8a22-9ffd-43a4-55da988fbeb1@linaro.org>
Date:   Tue, 2 May 2023 12:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/4] Input: pwm-vibra - add support for enable GPIO
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Brian Masney <bmasney@redhat.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-3-e87eeb94da51@z3ntu.xyz> <ZEsFV6F4CEh2/av8@x1>
 <8250064.NyiUUSuA9g@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8250064.NyiUUSuA9g@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 28.04.2023 18:06, Luca Weiss wrote:
> On Freitag, 28. April 2023 01:29:27 CEST Brian Masney wrote:
>> On Thu, Apr 27, 2023 at 10:34:28PM +0200, Luca Weiss wrote:
>>> Some pwm vibrators have a dedicated enable GPIO that needs to be set
>>> high so that the vibrator works. Add support for that optionally.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>
>> Hi Luca,
>>
>> Thank you for picking up this work!
>>
>>> +	vibrator->enable_gpio = devm_gpiod_get_optional(&pdev->dev, 
> "enable",
>>> +							
> GPIOD_OUT_LOW);
>>> +	err = PTR_ERR_OR_ZERO(vibrator->enable_gpio);
>>> +	if (err) {
>>> +		if (err != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "Failed to request enable 
> gpio: %d\n",
>>> +				err);
>>> +		return err;
>>> +	}
>>> +
>>
Looks like your email client messes with the replies.. perhaps it tries
to round them to n characters forcefully?

Konrad
>> Take a look at dev_err_probe() to remove the -EPROBE_DEFER check.
> 
> The input subsystem doesn't like dev_err_probe for some reason, you should 
> quickly find examples of that being rejected on the mailing list (or see   
> "git grep dev_err_probe drivers/input/")
> 
>>
>> With that fixed:
>>
>> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Thanks for the reviews!
> 
> 
