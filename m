Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC3060AA93
	for <lists+linux-input@lfdr.de>; Mon, 24 Oct 2022 15:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiJXNf7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Oct 2022 09:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbiJXNfF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Oct 2022 09:35:05 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5641957BEE
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 05:35:33 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pb15so8012181pjb.5
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOSw6HyzDXd6T9bIHKMemW84XmwEX2OWIHL3hg014Hw=;
        b=rwWxulayUNkvSg6kDFf08uTBPpUSZ/IYeVBnQiCr9k+T1YRm5WyitPxgxeJN9HbCTW
         4+a0ELQ0vLiBrXX3O61fzgM2rHm/WV61KEB6bBZnElFxsNruJ6ttFnbct4WfXp3M5pEO
         +83QmZGzW4O+/OMK1tUYo+4EM9XK/pcYlmKcPmEH1X0Ny6q9WwVOh3aMa+4QbocL7L+B
         o47VDcFxPLSccrWy7f3m5e4ahXoZVDI+yYdcQ9+zMWrb+izByH+MkXsq8TDdVSNyGYsH
         459wFqHKbYJ9GG2GqM5DTmbD13gtwRdz7J1bRtjCoomInEI7m1LM9+U/78jPJsuRPAoI
         Z9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOSw6HyzDXd6T9bIHKMemW84XmwEX2OWIHL3hg014Hw=;
        b=2ApoTr7MbYd7DvqTZAq9Z6wxom9z6+EW3KpaW3j+JbYMQ8ImKxCUSP/Bq1Gnrc9RI+
         vSjHKlmrQzsLxLA6hP5eB1lGKGV4vXhBiT+f2eonhycIkeWOe/jvvKBHt2hUsHguCcNt
         OlXlXSpjner1qbWg6PFfny4zL3pEa92jyK3msoD8q2nF3eeEjYtkXJvooOY8FYt7TMgY
         qlOyJs8qxNEeM0jRu+qL+Pt/gT9uadenUwABb/RJyXzMDvBA7tI/k8FFao8VEEOGnzpl
         /kbprXlE+xR6WvtFc1cQ1QYnHOMCoLy4/7FWtsJ7hf3pOpop03wq1KgTgGra+xlMFwRT
         Gumw==
X-Gm-Message-State: ACrzQf0u63HpDer+keiNlt8k9y/EI24wzjjb60MNsR3GiPkqs/P0hkoT
        g/BeLvoeL1q+GdI4Ukv0YxXm/L9w0BSUcQ==
X-Google-Smtp-Source: AMsMyM5xsPJvTm6ytp7WbglXJWWL6VoIXSqpBEGU/DXhNFgkOJaIi2tzS5QDxbioL3bw+F4X/JN4kg==
X-Received: by 2002:ad4:5949:0:b0:4b3:cfb6:5ef9 with SMTP id eo9-20020ad45949000000b004b3cfb65ef9mr27894806qvb.103.1666614108923;
        Mon, 24 Oct 2022 05:21:48 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id y9-20020a37f609000000b006ce7cd81359sm14467492qkj.110.2022.10.24.05.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:21:47 -0700 (PDT)
Message-ID: <08cb81ce-7ebd-d79f-3f5c-4df596b5cb95@linaro.org>
Date:   Mon, 24 Oct 2022 08:21:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v9 3/4] ARM: imx_v6_v7_defconfig: Enable the cyttsp5
 touchscreen
To:     Alistair Francis <alistair@alistair23.me>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linus.walleij@linaro.org, s.hauer@pengutronix.de,
        robh+dt@kernel.org, andreas@kemnade.info,
        krzysztof.kozlowski+dt@linaro.org, alistair23@gmail.com,
        dmitry.torokhov@gmail.com, rydberg@bitmath.org, shawnguo@kernel.org
References: <20221024111017.43859-1-alistair@alistair23.me>
 <20221024111017.43859-4-alistair@alistair23.me>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024111017.43859-4-alistair@alistair23.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 24/10/2022 07:10, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

you miss here commit msg explaining why you want to enable this.

Best regards,
Krzysztof

