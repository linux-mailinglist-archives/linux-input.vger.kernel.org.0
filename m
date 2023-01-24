Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE46679F44
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 17:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbjAXQ4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 11:56:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbjAXQ4V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 11:56:21 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB5A45F7E
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 08:56:17 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so11431458wmc.1
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 08:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSf9EDZbCk9ILTR8VX45RnJZiyt2oS/z0sFs3inXgHo=;
        b=ic5anKfbZlTHVJvTprKR69JrIKaGO9+bAEoTHZQtwfHzBVUJgDs18Ubfg33NMigsdt
         UV+m75pcKtNFKf2ZazEYxHzHjBoLgyZ9CmhgPMvLo2lA/mxL/kGx176cV/8dCW50w+Lb
         DSbyI0w4/1yXbD/XvV/FyywO1m1TFPPEPQ7cUFWnOxnLJceeQMBWlfkE10z3jzRqBiU3
         P8gUwo0rq1RmQi5MEmuwrxpUOssHdYnpJimOAD+IBYe9SiNdMn9OoQoAmhpUgJJkAEQy
         eUU4IM7OnaGsv+AORzOAwgK4lQS4dXf3xQooFwfD0YY0Rs22P02vf83hNEkBicWPZ1eB
         WhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSf9EDZbCk9ILTR8VX45RnJZiyt2oS/z0sFs3inXgHo=;
        b=n8R79lbmpcpH97abX+GYobpVtBM2k2dZkakNj6JJrpcktMk0lAC6y4387OE9ojnhAL
         i22aew12NqCpEExWDqYF8CLuBLvwqSBFwhFMJ2EWWgSealZHXaFLmM5HEUD8WCXB5ZJq
         RlWrO6+Ep9iGrbbEZV2Fp1pkUHNavWcXlR2WcP8SIvFW38pgiC7vQf1oTbQl2mBrYxVV
         ooO27lFzS0r9hYWDmEcSx6G3IWNha/zjUci6I3jUFxIkA6Y/s1xCc0zs4UR00IjnW5dJ
         QInC/00jmwIRarIAcaXBgfL22o350b8RypucEGWw2mey1bPnEtMSMfLdFbDYZtDTUMF2
         9G3g==
X-Gm-Message-State: AFqh2kpiCBeGjdohvJJRgLXVhrfc6WB7okdXslJKO8kwavAypnpeiUuX
        b1cNkq/Zj1tlPGVNNZ6iKcyuRg==
X-Google-Smtp-Source: AMrXdXsgji39wGRQLP97ZZxCisKBfhuTXsSUWSzlQpQyc7a9xrC512LRIzndKfV4HjGtaUphsxfi5Q==
X-Received: by 2002:a05:600c:202:b0:3da:f80d:7230 with SMTP id 2-20020a05600c020200b003daf80d7230mr28444666wmi.8.1674579375802;
        Tue, 24 Jan 2023 08:56:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b003d990372dd5sm15695314wms.20.2023.01.24.08.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 08:56:15 -0800 (PST)
Message-ID: <3f62e91b-b132-aaf0-a6f4-87191a49448d@linaro.org>
Date:   Tue, 24 Jan 2023 17:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 0/5 v7] input: pwm-beeper: add feature to set volume
Content-Language: en-US
To:     Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org
References: <Y9AIq3cSNzI9T/dU@mt.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9AIq3cSNzI9T/dU@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 24/01/2023 17:34, Manuel Traut wrote:
> This series implements volume control for the pwm-beeper via sysfs.
> 
> The first patch changes the devicetree documentation from txt to yaml.

Your emails are:
1. Not properly threaded which messes inboxes.
2. Not cc-ed proper people (just use get_maintainers.pl).


Best regards,
Krzysztof

