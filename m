Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF38A514252
	for <lists+linux-input@lfdr.de>; Fri, 29 Apr 2022 08:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354498AbiD2Gcs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Apr 2022 02:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiD2Gcq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Apr 2022 02:32:46 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEB6B9F00
        for <linux-input@vger.kernel.org>; Thu, 28 Apr 2022 23:29:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id i19so13508929eja.11
        for <linux-input@vger.kernel.org>; Thu, 28 Apr 2022 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MWHSWTEKcv7Xi6sCry02KvjP0oi7MJ00AsTeELKYR1k=;
        b=QFNUUb7tg4MO3nPhOkcmFLcYBzSw8R4q4NyB2kULHhHKCiwDpwjty4GzN+1qHUVWXo
         fy/jgch+A3d/a/EsdCQt+WpAjKkOil9mJn0LhC+0+msC2IKjNqHyVzrE8sCRkUww67pG
         /WQXyoc2hMm6sFjyP9LRtNhazv/0fiQE1nHfG7sGYtcdEMrDVNkxPB3RdQruO3rbwogU
         jZRFUrgt419FWZ1gSUhPzs5kBvpi7sV8xWnL0mDAPl99Jx5VBLUOkKtQkcPLNC4ql919
         fl+IbUGz3T/k/cl9BWupoSBSyvEUdC39A2msPYGNS1W6/ENMH78IwgD3Tdad+P6OumoM
         fOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MWHSWTEKcv7Xi6sCry02KvjP0oi7MJ00AsTeELKYR1k=;
        b=TOJ6Y8pJMtaxURaHY7pDzYRmCNDpAX2ziOs4gEO0k/5m76lWblUE0SKfTZETLo7/Hj
         AGGN3QYiYoaS1PDqUCv1aMiRAs3UVkp157+kXpXCoZic/d787UkM/VDqE/D46Q8av7KR
         dv/J36+Q+F0bG2dDJwHktaFpv4KoM8pYUHcVHnU2rkoVint1Rlybk5nHkdRCuhIh4IoW
         UMMxTO7nBdu/oqdus8BLcqYdJe56zOiubQvSUrQy3fN6PwRBcP6eGUhxA/J+9qln+3v+
         8ckdq483EZwdtGvhOYzDzLaGE9Pav+hR5SWaWVplms5BpXx3MCiO3jMzgysBfFkGz9wG
         7SkQ==
X-Gm-Message-State: AOAM531P3HTmbDp9hELYXAoPklr68q6aPeRr+GVN+wfAVAEEzFdw2T96
        /35Osv4+gTzFeYO6HLCYm9TQBg==
X-Google-Smtp-Source: ABdhPJwF7kYhyBa2oQUWsOUhyejHYRH7OCesXxrrQ17b6ikVFNcVtOgzey85fp+uzN1oMC+KLH73MA==
X-Received: by 2002:a17:907:8a10:b0:6f0:51c6:3cee with SMTP id sc16-20020a1709078a1000b006f051c63ceemr34819381ejc.259.1651213768126;
        Thu, 28 Apr 2022 23:29:28 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hz13-20020a1709072ced00b006f3ef214db2sm333250ejc.24.2022.04.28.23.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 23:29:27 -0700 (PDT)
Message-ID: <993d74fa-be5b-6db2-6bba-2323de7757f3@linaro.org>
Date:   Fri, 29 Apr 2022 08:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/11] dt-bindings: serio: add Arm PL050 DT schema
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-6-andre.przywara@arm.com>
 <55574426-df20-cdd7-c97d-092726981a42@linaro.org>
 <20220428182708.0c1065f8@donnerap.cambridge.arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428182708.0c1065f8@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/04/2022 19:27, Andre Przywara wrote:

>>> +  clock-names:
>>> +    items:
>>> +      - const: KMIREFCLK  
>>
>> lowercase letters only
> 
> I am afraid this ship has sailed: the various DTs in the kernel tree use
> it in that way, and the Linux driver insists on that spelling. 

The driver is coming from ancient times, so it is understandable it has
some old coding style. But it definitely not sailed away. :)

> So by
> changing this we would break both the existing DT's compliance and also
> existing Linux kernels.
> So is lowercase something that is mandated by DT schema, or can we just
> make an exception here?

This uppercase clock name affects even ARM64 devices, so it seems the
device is still being used. Therefore I propose to add new clock name,
old as deprecated and support both in the driver:

	kmi->clk = clk_get(&dev->dev, "kmirefclk");
	if (IS_ERR(kmi->clk)) {
		kmi->clk = clk_get(&dev->dev, "KMIREFCLK");

and convert the DTS as well later on.

Best regards,
Krzysztof
