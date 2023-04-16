Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1D356E361D
	for <lists+linux-input@lfdr.de>; Sun, 16 Apr 2023 10:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjDPIml (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Apr 2023 04:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjDPImk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Apr 2023 04:42:40 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4028E53
        for <linux-input@vger.kernel.org>; Sun, 16 Apr 2023 01:42:38 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dx24so12490573ejb.11
        for <linux-input@vger.kernel.org>; Sun, 16 Apr 2023 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681634557; x=1684226557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqq+eYxLKmqhmd5LaiASaZTg9uvXAN3PWoh+nYWuMCg=;
        b=zMwiXZdP/jKXpT6gKopu1anaiiVIxNM48UHNK3IMwrXVTmW2eHNeLY/mWgBO3hmb9/
         4BcLE0MzbhexGA42zE+RgXFUNg34SlJ9W+lb2R3mchYaZmyWJuYysZoiA51OyqKXTvvq
         aCDEajkatGrLk6ZhzSDPKCUulC2zPQME/QwMjjeKQvzciorbcXMqtmk/4ygGA+GZSDlS
         3emf9MwtJPK7Q/SUHUjHBz1MxJuCAeTY/T2GVZ219g3CdGzJI7oB3ANtLw8FGRa3gxeB
         fe7EZmxMMQeFPoZLZR52U/rAf/VXYyGIjJiSZlTulcU86rTdne3i7LYT20XkLh61XQFH
         FIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681634557; x=1684226557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqq+eYxLKmqhmd5LaiASaZTg9uvXAN3PWoh+nYWuMCg=;
        b=XIfDNKm7fEm/X85mNl8RFxzFY3yb0qEJ9nwpa7sF91bYrjr4P3M40boWaS+N6Rjcvu
         hpyXPKYC88N+Hu6EH3mSCgWAcI6UCRYF+C6kar2DHAen7DQhGscFg2/gYcMMH/FPnRPD
         6sgRlU7Mw+kiMY46imgzaIBdUVLVARDr1HwhpXHFS4ycfKdQv6z3GQCr3xrVgprx+k53
         TS+OEZzxIkgsknDuZ4vLPYnyHU61NkvHj9BzD/F0ExJHV86O6eznPbAWX/R+P8Eiw6i0
         5NJLBeaLlBldRC6YwyuHHW6FgA00lasZqvMqAPw7Tn7nw0v70b1P8o+u4VZv/OGrnzUx
         mrNw==
X-Gm-Message-State: AAQBX9c6/ejOVrbgZcvUVwkB5fVta/Bgi9eHukfyjAMgkbWgCBpxsCtU
        UI3h8tfKje3D/wgjvwT5irPBrg==
X-Google-Smtp-Source: AKy350YmwV0JiTy6NU+GKSTqxxFOs6/3hOvoxtfaH7q6nvSq2pks1/HUnrJLWXt9TN+yzpgJLuQAzQ==
X-Received: by 2002:a17:906:ad8a:b0:94e:6f2d:d1c9 with SMTP id la10-20020a170906ad8a00b0094e6f2dd1c9mr4154864ejb.68.1681634557504;
        Sun, 16 Apr 2023 01:42:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id w3-20020a170906b18300b0094b5ce9d43dsm4792678ejy.85.2023.04.16.01.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 01:42:37 -0700 (PDT)
Message-ID: <9ffb88fa-6cda-2740-77c6-d4985ebaace7@linaro.org>
Date:   Sun, 16 Apr 2023 10:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/5] dt-bindings: input: touchscreen: add
 focaltech,fts5452 touchscreen
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230415020222.216232-1-joelselvaraj.oss@gmail.com>
 <20230415020222.216232-2-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415020222.216232-2-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/04/2023 04:02, Joel Selvaraj wrote:
> Document the Focaltech FTS touchscreen driver.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../input/touchscreen/focaltech,fts5452.yaml  | 71 +++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

