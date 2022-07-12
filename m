Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9924E57287B
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 23:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbiGLVXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 17:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbiGLVXJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 17:23:09 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A929BE0FB
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 14:23:07 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u15so451747lji.10
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n1ZO8TXDHj3NsRlYlgOrOAr4N9XXMzuVm8SErIjEja0=;
        b=G0DVQSIdqHZsCsaIpwrgBp9xO7Z9fBrXqTnXm35zly+Y2omB3PNW30Df/fy2YCFNzT
         hDPe9xQaP9GAZYOzC6trs+pVFPhnJuPDS17m5GnLbbfCp96wTbij+KYWAWpxfvmAgO3F
         6BnO7GKZsa9/gEqXo61az4GaB97Sa2Fa8OyfME3TKqNdrE9CyPTj534e66EuEdqyEgoF
         bjkiggsOtqz2/vVvh/w3DGXsJCBvVabmzSQ91yA7OA7hzq9139Aa3ex79AWBfXGo2xX1
         Xl9/OzyAK2m7y5/pevJmeJQ6y5s3F95Quew8QXi/JAPW3PH1UKgakCHrNQZRzQSmJjNR
         ew5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n1ZO8TXDHj3NsRlYlgOrOAr4N9XXMzuVm8SErIjEja0=;
        b=02LNximKUgYFboEatPWNhNmk2Y1pZeiI2GIZlvq2eU4NV8frk83CYkhRe+MduBRYsE
         AIUD3A1315JXYIE52pKrzuXFxwof9UsF6/z+udZAeMMZQfHOXgst8IREtLvnTJ1K7g3n
         oN9hnAm0J3z/AJLWVwU8kv9Ob8LtyurNI93fo1QpKmL8YbwpGWWdxfJp3ZpPwig2v3tN
         bJYAMu1QHVbRoTMPL5fLCMiQKIHBdRlSb+ePjRT8fjLvMUIiHg9QLym70kMf1qeu/d1H
         oiz+w8v5Ocq7a66YEw0wc34XYb11bGlD21ZxunMP3Tag357y45X5Wt9ItdLY7Oo6EfyO
         JD3Q==
X-Gm-Message-State: AJIora/pI4KF4airo9aG0oNyCDOt3czE5TUSIG25wqTOn+Am/BRZn1ad
        yIcOHzZCrpSNeF7D5ML+dSLkLw==
X-Google-Smtp-Source: AGRyM1to15pqtVLZPOLGpxX3l4iWMrE8kKqgE4uwbm35HVvBXfvAgzeYWcrKDc9+GtNgEUnP+M8V2w==
X-Received: by 2002:a2e:bc18:0:b0:25d:735c:b57f with SMTP id b24-20020a2ebc18000000b0025d735cb57fmr11742ljf.118.1657660985757;
        Tue, 12 Jul 2022 14:23:05 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id z18-20020a056512371200b00489da512f5asm1770549lfr.86.2022.07.12.14.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:23:05 -0700 (PDT)
Message-ID: <7aca3568-aeea-478b-caa5-d1a7d9e72f3d@linaro.org>
Date:   Tue, 12 Jul 2022 23:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/5] dt-bindings: gpio: stmpe: Remove node name
 requirement
Content-Language: en-US
To:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-4-francesco.dolcini@toradex.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712163345.445811-4-francesco.dolcini@toradex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/07/2022 18:33, Francesco Dolcini wrote:
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
