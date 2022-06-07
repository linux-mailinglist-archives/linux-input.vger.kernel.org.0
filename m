Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB8E453DC7B
	for <lists+linux-input@lfdr.de>; Sun,  5 Jun 2022 17:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbiFEPMx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Jun 2022 11:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349987AbiFEPMv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Jun 2022 11:12:51 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE331570D
        for <linux-input@vger.kernel.org>; Sun,  5 Jun 2022 08:12:45 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id n28so15760362edb.9
        for <linux-input@vger.kernel.org>; Sun, 05 Jun 2022 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x+fdYMlfBqjJsfTMeBXwmbk6chP7/1R1+jVisQRo6VE=;
        b=Y1Dch9GREjMHFir6ioGvURLkQcuw1g/GFu4AvifmbQxrXTFtiEQQQwOnIa1DupKNs8
         LFmAJFhsUYiH18tTruEBMCG2jUj/pYHTjOxm9t3f/o1LVjRzYdE4i8srROR12Bi/Rf34
         Z+BDwI09IuDxRGyOcGLNNh8D8cGSNMue7TpiVtw0lTI9BAovmCEqhgeqwQutCJQoGrmy
         DKgX5V7hA/FsrlpDmH0LFzjtso0R02MT3VCy569uPDn6Gc7s9q32MwAtkE+iYMYBJj64
         rOG9eB9wJ/ttxnw0dk2/p1LGwy0OA8MZVOSb/6AmJ70Vvx4qyf9raZcGkfG9mkVHdK3g
         lWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x+fdYMlfBqjJsfTMeBXwmbk6chP7/1R1+jVisQRo6VE=;
        b=6F9n/o7EIITqLo1J8b3/EWxmf5l37q8vsl7VHp+dcy9wMSiGS2RTK/KIbwSGwQQ3If
         RI8Pw1gbLKK+ZWlA5Em9K2ZeQUsOdkkMq48ZCRfUwMzvfyh7pti2w6WG6g/z/BzfV2O8
         E9WbXcbW7vLdYQtNS221JNLIWKDJAFwNk+1BkOwM8wRYaCuLPyMfnSiQ4XPHuAnC8frB
         3F5Ae7+hOb+jxsfooxfN/bQxkUNjPKvAlTHPqiWgroMVePGTh4Gcc0koy7wR9ld0TfFN
         yqfTkcPRYQsqFTFtDN0zPxdfilxzKibLx7jkfwYz28RV+z4z9bNBIDKruaee/JBs2Q1W
         2z0A==
X-Gm-Message-State: AOAM531De326ix3GNtIjZymNnz0sqZKfGmNSMJY33sxw+iV9RvXDwoNJ
        T2EKOSzJZfq8l4ECs/gYrrPG2Q==
X-Google-Smtp-Source: ABdhPJwIRqpcVDFlSRzOMhcXpNy5cRM9nogH70w6WrtmyUcI5vpHYq4qgXyi/wc8+zavNqoYDH36ng==
X-Received: by 2002:a05:6402:c08:b0:42d:d005:13c1 with SMTP id co8-20020a0564020c0800b0042dd00513c1mr21453363edb.187.1654441964278;
        Sun, 05 Jun 2022 08:12:44 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r25-20020aa7cb99000000b0042a5a39ba7esm6892714edt.25.2022.06.05.08.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 08:12:43 -0700 (PDT)
Message-ID: <fd5833ac-2f8c-98ce-a9bd-188c90cda6f5@linaro.org>
Date:   Sun, 5 Jun 2022 17:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/2] dt-bindings: input: gpio-keys: enforce node names
 to match all properties
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbie13xd@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>
References: <20220603101601.542054-1-krzysztof.kozlowski@linaro.org>
 <20220603101601.542054-2-krzysztof.kozlowski@linaro.org>
 <20220604030455.GA12308@nixie71>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220604030455.GA12308@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04/06/2022 05:04, Jeff LaBundy wrote:
>> -      dependencies:
>> -        wakeup-event-action: [ wakeup-source ]
>> -        linux,input-value: [ gpios ]
>> -
>> -      unevaluatedProperties: false
>> +  "^(key|key-[a-z0-9-]+|[a-z0-9-]+-key)$":
> 
> Maybe this would be better as:
> 
> "^((key|switch|axis)|(key|switch|axis)-[a-z0-9-]+|[a-z0-9-]+-(key|switch|axis))$":
> 
> ...or perhaps a more efficient version of my counter-proposal.
> 
> The reason is because it is confusing to see a lid or dock switch named
> as "key-lid", etc.

Nice point. "switch" I understand, but can you really have "axis" on
GPIO keys? I had impression axis is related to joysticks.


Best regards,
Krzysztof
