Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E294B7744
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 21:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242075AbiBORB5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 12:01:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242070AbiBORB4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 12:01:56 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01167117C80
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 09:01:46 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D27894004A
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644944504;
        bh=6A/iTuzJN7RYXq4i8TAWxW9tcqq87v/WRpExFN3KMZw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Z/bI4jRVp0iV8LjMy2nKanT4TQmlrU9FZfOisWCupNJvsIMFLBJ2f8Mdj8PGfpbKb
         QWooHcXbmpr2stcSun4CqAWxA9lwY6b4p6kGKnZEpExtfibRJ5t40FDFL1teO5j8rl
         cfh3yhYzGo1BMVLYosnQhtkvqazJS6fWW00tFSu/5tg8cMRshESremzk7WFWmJbeF/
         DdMcmcKqCnNiXyWXMhfRSLgFfSZkuuAWwf8tzH4zCB5tcjUqUD+RELvzeIyiJ6Typl
         puXqGoNms38lqM4kgvWHSa7srI9zPwN70D62CG91D1SRWZzuWFY5xhLI+SYkC21oe8
         at1and6+Coq7Q==
Received: by mail-ej1-f72.google.com with SMTP id hc39-20020a17090716a700b006ce88cf89dfso2696951ejc.10
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 09:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6A/iTuzJN7RYXq4i8TAWxW9tcqq87v/WRpExFN3KMZw=;
        b=UTzaN+BYmyWZzJYGfCQBMFXcQcQcNUuNT9Zt4stzpx1M/uTGBQBR9/JVI+pMOkCniX
         rj9xDFHvpezi35pAFjmIADzaAVjFdPXHwQZ2klQUzgtJsv3r5gIoLLBfY4CaR8HocELb
         Zn161sCMPQ1yUkxXsEoRYoUDUZ9jdL1+jfXNB3A4/Jhy0SLD28B0cdf4M0gKfaNwSqae
         PmEkGQr1msgGehD5Cgyv402WmAvGoUOZtPiksEMJ9dAQQub+EY6DTy/5MIs4UbSGmdTQ
         MYlEVK2qC6qZeAWlLcKlFnwsvaZXCQ9Q3TpaZaYks5i0awvZZ4jR+Dq+U0zey4ay0n/P
         Cuag==
X-Gm-Message-State: AOAM531X0GgKU05Fmd/NUZ+VL++LzRwJXy6u7ZfaaLIE1BNm/I90HPIp
        1k64rF9PligVyoTerq9vutWZsMokR0+K8+CT0B5MhqOlI/ETbN6ufKzJqxJgM24jMS89knUwXnB
        ONZO2tbxFujDmcTGwVPOqC8YlckVfB3XjZ0aZ4Ilm
X-Received: by 2002:a17:906:dc92:: with SMTP id cs18mr7307ejc.656.1644944504435;
        Tue, 15 Feb 2022 09:01:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMfu8uzDlw79VM9qAXnSGrPIDJXnTQ1CzhlI1Ng6oF7bX2eWB0r/zeyGYCkcHmpFYe06/6Vg==
X-Received: by 2002:a17:906:dc92:: with SMTP id cs18mr7284ejc.656.1644944504213;
        Tue, 15 Feb 2022 09:01:44 -0800 (PST)
Received: from [192.168.0.109] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id y16sm208777edd.0.2022.02.15.09.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 09:01:43 -0800 (PST)
Message-ID: <33c226ca-334c-7458-62d5-5480d6657ebc@canonical.com>
Date:   Tue, 15 Feb 2022 18:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dt-bindings: ps2-gpio: document bus signals open
 drain
Content-Language: en-US
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
References: <20220215165113.52659-1-danilokrummrich@dk-develop.de>
 <20220215165113.52659-3-danilokrummrich@dk-develop.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215165113.52659-3-danilokrummrich@dk-develop.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/02/2022 17:51, Danilo Krummrich wrote:
> The PS/2 bus defines data and clock line to be open drain, this should
> be reflected in the gpio flags set in the binding.
> 
> Especially, this is important since the clock line sometimes is driven
> by the host while being used as interrupt source.
> 
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---
>  .../devicetree/bindings/serio/ps2-gpio.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
