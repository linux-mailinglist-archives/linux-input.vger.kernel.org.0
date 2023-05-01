Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC2E6F2EE6
	for <lists+linux-input@lfdr.de>; Mon,  1 May 2023 08:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbjEAGsm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 02:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjEAGsl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 02:48:41 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF931704
        for <linux-input@vger.kernel.org>; Sun, 30 Apr 2023 23:48:39 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94f3df30043so352776566b.2
        for <linux-input@vger.kernel.org>; Sun, 30 Apr 2023 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682923718; x=1685515718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEzqDqyF1fkxeu46gQQXf499e+tBTdeKbHMx5PIiC9U=;
        b=he27vMCmazRDCdP2UIZDMqSmRu8TLSNe7lqyN3gL/yfk1FWjGq8PRIhKfKpmJjcdxv
         LYhgCGplEeAStVi9ShBeV3NWuE85Dz2oTQlr8d93JUyDeuHyU4urA4HUdPvir7vbY2jC
         cx2MYsjJ/kw1xStTxVsHiEOHu/OCH2VNUtE+hK/tiyLyFqNok8Cse3vAdj/LpQ+M8NRR
         ZOo04tqTGO2ASeVO3OLzBbFfDiWYtSEIw2cBTOK6k7N0fL7bu2zTsa547kKYFpmgFfoq
         YX9JkYrkFXREHuTaTuqTP2MDm9LtvsMEtmkW8ZDIJ05PMb9vg8Ov83FqFfSDaQKIVdUe
         e4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682923718; x=1685515718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEzqDqyF1fkxeu46gQQXf499e+tBTdeKbHMx5PIiC9U=;
        b=ZPOEUz7J78QeXj4hcaFuuifyN5BlKImkZXhNJb4Ner0WAYf3eoYZvTbxbBkradlpVX
         WlhQqYb+wOWer298UijmYMfQVJz4DkQmUa10D0ZJqEPUYKGgf6/hlpilQswgh4IPN+le
         +yXpVPVWSwL1eRqlTrkJYDPdYNEZ0ZpgYZaa4HiL0/2FuNiz9SXoaCA3s8j5fzP6Q+wj
         wYIT6iS2KvEeiIZu4ZgtVidml9l/mvNl+9jD6uV+b0qQLCJSw2R5uyeeDSGgv2H5REWN
         raSTVNDoUL+AXIL1tJPMN//5z9o4YhxO4o1wHev9+20uOmQpkq8xC7lfHVv/nkVp43Tv
         r2Gw==
X-Gm-Message-State: AC+VfDzy1pQKVtPI7N1+lX7r3Lv8i+UfEfMnNwrMPZhu3KFKNqXS9lzE
        YHU0JyGks3UMAJXIY1HXI+8wCA==
X-Google-Smtp-Source: ACHHUZ4Q6p/XHwNyndmaEJ23rDH49qKuDWOaJMg5SeJLPfTlqJWWYjlFBfjnVbuzkWtuvL9+SogO6Q==
X-Received: by 2002:a17:907:60cc:b0:94d:69e0:6098 with SMTP id hv12-20020a17090760cc00b0094d69e06098mr12514106ejc.45.1682923718401;
        Sun, 30 Apr 2023 23:48:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id ww9-20020a170907084900b0095847a49ce7sm11671109ejb.55.2023.04.30.23.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 23:48:37 -0700 (PDT)
Message-ID: <deb69f7f-f0bf-f354-6388-b23dbeeff90e@linaro.org>
Date:   Mon, 1 May 2023 08:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] dt-bindings: input: pwm-vibrator: Add enable-gpio
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-1-e87eeb94da51@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230427-hammerhead-vibra-v1-1-e87eeb94da51@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/04/2023 22:34, Luca Weiss wrote:
> Some pwm vibrators have a dedicated enable GPIO that needs to be set
> high so that the vibrator works. Document that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

