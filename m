Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0474874E7EB
	for <lists+linux-input@lfdr.de>; Tue, 11 Jul 2023 09:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjGKHYf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jul 2023 03:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjGKHYR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jul 2023 03:24:17 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B5E1A7
        for <linux-input@vger.kernel.org>; Tue, 11 Jul 2023 00:24:15 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so82321681fa.2
        for <linux-input@vger.kernel.org>; Tue, 11 Jul 2023 00:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689060254; x=1691652254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTq38/S18hZd0KGlzS9xkJXGKTtksdKBMn9BiBZEp24=;
        b=VbPFNv9QF1Wr8EzacHNyt7F6X3L3e50DHwmCaKpq+7WQoeyZ9YMUgiYGHPpO/K7XRg
         e9xNtILqgZDRDuHlMelT+XTNbQN2vfUoVGC8KW7yqmMxqgG7TNajhMf5dX3xZ2UJrWbm
         UQMqs7zEl9biyWIkRebz+Vus1VzDKRCM+ApawlbQtCRezJTuaxTvWavBcR93CrB5tAXE
         kUHwIjiFW4VHTXx8p9DHPoef1RBjWYKuc0l9KXU8AonwAacTbQdNYcerUSEZBVkQqqk/
         JfE3e+mQZ0YxG4TX/kulRjciXH4v6PAwgVJSaPP8rOICdWXxH0+5GpeI4GwZiPQHcrjU
         e1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689060254; x=1691652254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTq38/S18hZd0KGlzS9xkJXGKTtksdKBMn9BiBZEp24=;
        b=Ajd3LlV5ryyReOP5tMCnBm2io8OnneGFTc95JOd7oauXZDHx/dk/yRNdY0MVgRnYRe
         Jw2TgmIf+14NLHM+rpYl290zirkmwA059M7Uyr6+vToMtct6mqiFRPIoOD+yhp1t20ZR
         fimkT1812QzDqh7Xn8tgX/GpxnNq0iuMlnEiHsCWvLlAI1haqM/MtcTHv9aVKR8qwrgx
         4dYloUtYzuGvFV9fW/En/Z5YhWgkDFAGzsRAi+qqO34v+nRGeQeLMP7tArwlUZkDl7xm
         MXnu7SsFNmwvKo51HmldFBZ2ZHElnWGmTFh4c7l991zgFbNrrAMKzkhOUr87XXiDUWDc
         08eg==
X-Gm-Message-State: ABy/qLYGpeIywAjjmPpk2E5cdMJuPTRcegijSJsw76jrXxHIkrf29AD6
        gcSDeDBeVfeiwxKDDBLbD3OzJg==
X-Google-Smtp-Source: APBJJlEZ+nd91wwS87UraG2ybQ3Xxz8aPKBEprlK8AoIrpraAPPp6tHASiRtaKYbU5VAbm6H+Bdilg==
X-Received: by 2002:a2e:2e17:0:b0:2b6:df00:b3d1 with SMTP id u23-20020a2e2e17000000b002b6df00b3d1mr11622958lju.51.1689060254262;
        Tue, 11 Jul 2023 00:24:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709061dcb00b00986211f35bdsm755578ejh.80.2023.07.11.00.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 00:24:13 -0700 (PDT)
Message-ID: <58ca32da-c496-1f50-6aae-ad380d0cf7cb@linaro.org>
Date:   Tue, 11 Jul 2023 09:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fix Input: bcm-keypad - Correct dev_err_probe() error
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20230711072254.43273-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711072254.43273-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/07/2023 09:22, Krzysztof Kozlowski wrote:
> Pass proper PTR_ERR as dev_err_probe() argument.

I need to fix subject. :(

Best regards,
Krzysztof

