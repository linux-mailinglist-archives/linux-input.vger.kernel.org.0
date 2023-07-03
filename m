Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2E7460B2
	for <lists+linux-input@lfdr.de>; Mon,  3 Jul 2023 18:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjGCQ0A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jul 2023 12:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjGCQ0A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jul 2023 12:26:00 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D46AD
        for <linux-input@vger.kernel.org>; Mon,  3 Jul 2023 09:25:58 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6985de215so74896961fa.2
        for <linux-input@vger.kernel.org>; Mon, 03 Jul 2023 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688401557; x=1690993557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLv2uWzJasxuSdcQw7JIN9VIEqZpX0OvW+/IpBA42Bg=;
        b=pxLSTHP2kLhaBPto7N/da1Td5PMEIp/F4IhpRVKT5wqLf9/dXxELa7I3Oedri08xZj
         ZjPJtcYchvQ+jJTZGt4QD5oDGRmxlKRaS9EVD5GJt7/EXsQSBud67yeztSQMmjX5xqLQ
         fBUZIf5Qp/lp0V0gouMpiWVhUFKxd3hGqcJE0PWj4E5i6L1Csa6MyqLWlWzKm4wHbWwe
         GXuvYJk5QV9JQkuwfAgUkbUXyVZljCAP110UCd77x8/ZsuDnCsdqwb10kcBWnCpGSLVI
         KS8L+94L1zYzI+AVjClkypxuAPP3xI7njeatU/5aAg2TUOn6WDbZhnEM/xm2NquK+qGQ
         mqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688401557; x=1690993557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLv2uWzJasxuSdcQw7JIN9VIEqZpX0OvW+/IpBA42Bg=;
        b=SHe4pVOFX0fynV4MWdoT/WhKoNHd0/emWIC17sdMCeciJ9q0kY41OWmiYzYtxwpJW+
         V5NxuYW9jKvwjxeD3/wLFbUko1mCdxvib7RgFLDJ7w3V9/qAh074cXZbIIWY1QnsnvcM
         BvKVkgQb6Ki67874uLYjparYLdQ5rgRLaZ2ZsIz5JklOedWhfjI/yZI6AQI9AmH1p6Kd
         y2HsJv3subaPBNdzl43v1F3BV3NeJ2ePK8ZZ3HZTynLvKRbEKBXmCAFERvSmSy2YmXzV
         sjIdn0qmyVx3Pk1BJlTW4K6GFzJBzABP0xPEPZLNIaZU+qpsq4pGTiuEXF3IuzXZoRqa
         CqLQ==
X-Gm-Message-State: ABy/qLYiAYO2UCbk6dYhhWKsIQF1j/qnp8nnPNfnvo7eGVfyY1TdV7qp
        MxHaY2GlmmXKb4tJU+K7uiVfFQ==
X-Google-Smtp-Source: APBJJlEs+9BsDopoZSFTmox3BWETANFQ9MyoDgY4nbY58873k3/S3elO73G5V2sgOfEe4/H/ZhvEeQ==
X-Received: by 2002:a2e:91ce:0:b0:2af:25cf:92ae with SMTP id u14-20020a2e91ce000000b002af25cf92aemr8360233ljg.22.1688401556888;
        Mon, 03 Jul 2023 09:25:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v24-20020a1709064e9800b00992ca779f42sm5348151eju.97.2023.07.03.09.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 09:25:56 -0700 (PDT)
Message-ID: <91fff80d-7f6f-2d97-46fa-d6a258e0e48d@linaro.org>
Date:   Mon, 3 Jul 2023 18:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: Input: exc3000 - Support power supply
 regulators
Content-Language: en-US
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.056940e6-2612-4bc3-a2f6-33121e64866d@emailsignatures365.codetwo.com>
 <20230703084536.8429-1-mike.looijmans@topic.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703084536.8429-1-mike.looijmans@topic.nl>
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

On 03/07/2023 10:45, Mike Looijmans wrote:
> Add power supply regulator support to the exc3000 devices.
> This provides the devicetree bindings.

If there is going to be next version/resend, you could skip the last
sentence. It is a bit redundant.

In any case:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

