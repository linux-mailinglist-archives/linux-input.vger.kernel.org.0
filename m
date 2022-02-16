Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C754B816B
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 08:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiBPHUB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 02:20:01 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiBPHUB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 02:20:01 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E63DBD2D
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 23:19:48 -0800 (PST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2D27D40811
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 07:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644995987;
        bh=3QteeCZRrYGG8lRD/0x4vggPgtmzvyjVPqyeuzYI/CI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=amsve6dJUYAvb9iA92K/zo+JR23UrvQuNPZ5wtE/CVmmvVK9rP6rg5TpvNDhVuNk3
         g8BDuylbvJb6eikk0E4urKjlTmrtnkEXaZXsi5589rUeh2XU+t3A2oCVcLA9pkPz6E
         iAdxGY80N8yisxMl/0BgRY8BMpQWNFObIoFuKsTcPi+Yyt9yW7X/XdUtKezZxRa1XF
         YNESHwwFqyXgxJdXdmNXm76pEkh62yr0ccWxPH/aym+xVKeZq0uqj4QwoSpAUP5YtK
         rVWvl7B6dIIEEOE0JZObENMJwhVDKBa79Zw0S1u7peohPC65SeaAkzGNLyX8HZ7AhG
         4Kc9KuUNB/gKQ==
Received: by mail-wr1-f70.google.com with SMTP id c9-20020adfa709000000b001dde29c3202so665467wrd.22
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 23:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3QteeCZRrYGG8lRD/0x4vggPgtmzvyjVPqyeuzYI/CI=;
        b=XXTf4tl3MwBupNZY0ULOIUVRdJ+inVsvc6UzUubLy+hnK9AVt7EZQc5F91CD5ZIuY9
         Jo5VC7hw75K/rcEubT0n0KPVctPx0Ft6HjeOwm4LhWrsN5DF7zbKVUevWeQz2OcoUEU9
         cf3+IEDoETtiukYee5xIPeK8AABkiv3yzunQDAZwdFS93GqYraMzi/yib2v2OMrbOMzK
         r2qbAXD/5R5C+/nvXinfqsh2Qm5RWyjJYZmGAWnjM6ujtpiEV+eLxcL9LJxBiG9YBUZV
         irBuQY1nq24grLl7MXXfgqRhfHaN6a/AYiOTUKo/i+MWnG/DV6YvozjPkXCWuw+EJxIo
         gR9A==
X-Gm-Message-State: AOAM5312uncUTsnhZUQOEpBQzNFaYmoAdb6izvd2rqTlfRebwZJSKJDX
        cMvhIl3g9pXaUtLM27ClUc72cl52Ryr4ryyaU3OoeJNKC9FdTXXK4xTtMKaiuL8pLjIPT/MIzKQ
        5xIr6WMEWN6fxN3t23a5kXklHmtE2KqQskWUiTwop
X-Received: by 2002:a05:600c:2502:b0:37b:ce43:9ac0 with SMTP id d2-20020a05600c250200b0037bce439ac0mr251773wma.37.1644995986826;
        Tue, 15 Feb 2022 23:19:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0qUMxjV+5o8oLXBCBqBJN8fqGl7V096OWi35LZe9vA29ZRLzI2LtWlImYQream3SgUc8SdQ==
X-Received: by 2002:a05:600c:2502:b0:37b:ce43:9ac0 with SMTP id d2-20020a05600c250200b0037bce439ac0mr251757wma.37.1644995986615;
        Tue, 15 Feb 2022 23:19:46 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id az2sm26332158wmb.2.2022.02.15.23.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 23:19:46 -0800 (PST)
Message-ID: <275a4a2e-e8e2-b398-3574-73eae7cc6505@canonical.com>
Date:   Wed, 16 Feb 2022 08:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] dt-bindings: ps2-gpio: convert binding to
 json-schema
Content-Language: en-US
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
References: <20220215180829.63543-1-danilokrummrich@dk-develop.de>
 <20220215180829.63543-2-danilokrummrich@dk-develop.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215180829.63543-2-danilokrummrich@dk-develop.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/02/2022 19:08, Danilo Krummrich wrote:
> Convert the ps2-gpio dt-binding documentation to DT schema format using
> the json-schema.
> 
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---
>  .../devicetree/bindings/serio/ps2-gpio.txt    | 23 --------
>  .../devicetree/bindings/serio/ps2-gpio.yaml   | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serio/ps2-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
