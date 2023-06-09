Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39029729F39
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 17:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240625AbjFIPxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 11:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbjFIPxD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 11:53:03 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635F33592
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 08:53:01 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso3290095a12.1
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686325980; x=1688917980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iAP0SmI/FYeEKoI99g2LLIkQmUnSbpRNVnqT4Q7y3M=;
        b=DLp+eFhbuT4FsmpdQZoNar0XNhRZKfSTvUm+tu3lG3jazfnxd4xO3tc0s2hNFtXDKX
         xDOBiHHKZ8kG4boXzXDhB3znf3D3UL7pEzrE2bvF4ZupquI2Wf6qLAScWl1Fry6mKza9
         14fpkIOoCVvJmooeBvN87i9aB44A7YeVLubyJcDdCgwQIffCuTeN8PsI8VotonS6grSk
         9/UOhIronUd+rz8htLoWGoyD6BY36LNmLARjZ1dz8w1wYjrQ7NVv/Ev3af4okMiQlKdS
         FwnNVy8FpvqaUStW0uWVq1/hkBZAiQTL8RjpdRegzi94R7IFeKWnuH81N/jyPBY24qI8
         ZraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686325980; x=1688917980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iAP0SmI/FYeEKoI99g2LLIkQmUnSbpRNVnqT4Q7y3M=;
        b=YXbTnX7iS+NoATE0CK1yIIv/Nqn0WVqLbJlgzURcC23y8FeAFqCKHXawBz63TIDf1F
         uI07cOP+J9c/nt+qHlyIKKx7yscD4mmu5Zgsr5eWW7PlSxu1XJYTAEytI6Q5euC++QZV
         lr6qd9bw4xT4QnRciBbfB4NjIyEpSBtDxqXIJbNgZu3T8kVvY6RtfZDkwxSMItrOSRaT
         tHLibz+WJcuR1NJdSeokI7ueab/niV//9egBfxbsvt8oNKk0bpyhEJUIKd/Hl2AisWJI
         xQ1xmj7ZgvvdsDHMbzrxRAgfxE5d/bZZIAOiQRtdUEvnuki+yazEnpiTAXsBzXMHi0t7
         6k8g==
X-Gm-Message-State: AC+VfDyWol7FL0gZORN8EgFniVn7QPPrqPnDhwpqoxsZ0J528vCJ6F8t
        CYACNMC3qy4HeDheZbElFyUhIw==
X-Google-Smtp-Source: ACHHUZ5W1Pob4KsqhSAfksdi+2nie8sW/NY9N3SsiSrfUtfQEwuzln1zzb3qT4Q7eriMH8S3lpZfjw==
X-Received: by 2002:aa7:da51:0:b0:514:80d1:2790 with SMTP id w17-20020aa7da51000000b0051480d12790mr1460955eds.35.1686325979909;
        Fri, 09 Jun 2023 08:52:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7d84b000000b00514ad0e3167sm1924665eds.71.2023.06.09.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:52:59 -0700 (PDT)
Message-ID: <5ef644a6-4ea0-36b6-9abc-967dd45536ec@linaro.org>
Date:   Fri, 9 Jun 2023 17:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/2] dt-bindings: HID: i2c-hid: ilitek: Introduce
 bindings for Ilitek ili9882t
Content-Language: en-US
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230609063615.758676-1-yangcong5@huaqin.corp-partner.google.com>
 <20230609063615.758676-2-yangcong5@huaqin.corp-partner.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609063615.758676-2-yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/06/2023 08:36, Cong Yang wrote:
> The ili9882t touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that ili9882t needs to use
> vccio-supply instead of vcc33-supply. Doug's series[1] allows panels
> and touchscreens to power on/off together, let's add a phandle for this.
> 
> [1]: https://lore.kernel.org/r/20230607215224.2067679-1-dianders@chromium.org
> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>




> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset GPIO.
> +
> +  vccio-supply:
> +    description: The 1.8V supply to the touchscreen.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - panel
> +  - vccio-supply
> +
> +additionalProperties: false

My comment from previous version still applies.

Best regards,
Krzysztof

