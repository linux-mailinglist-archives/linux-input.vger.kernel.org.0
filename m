Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0AE665C3E
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 14:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbjAKNOp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Jan 2023 08:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbjAKNOk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Jan 2023 08:14:40 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6526B1A069
        for <linux-input@vger.kernel.org>; Wed, 11 Jan 2023 05:14:39 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bs20so14982943wrb.3
        for <linux-input@vger.kernel.org>; Wed, 11 Jan 2023 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxczFsSNSjmSDy5ASaWPpETpn1NDyzoZSG+SbIRKv9g=;
        b=fynurd1+7sZWpgX+ZBdpBjtsKnuUoSuqj3uA3CuKnWLWE+bk1QRL8qUBS8iMIgGsPx
         sXR1ys2awo5NjCWEVTj/Zt9heSMLqRyMrCxeDG7i2Xun6mPils6JkAa/Oa7mcoCnhLcd
         uwmzYykP3Sqy0cd7C5SwkzTkXDHfdH4v9pWPNoR9fUegDpO0zDWogYEuDN2XH5VpTEOC
         FInVHxwwT9G2F2mVGh7tt0mwLGCPrBOHFEvAFDmKtesHhIqZrMT1Apo8eYdOzBlQ/PHH
         w5U/NtzIFtM2MxKo9n0UsgG1v8XAfikImT5g2yuw7W+svRUvMjjWuDf34Q+ehJbPGwiG
         s+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxczFsSNSjmSDy5ASaWPpETpn1NDyzoZSG+SbIRKv9g=;
        b=vtdXfOJyUFZyaz1s4dGgVfzE0SdK9jxJHIuWbeADTNXF3RmzyHEv+s0GdFrIw0lHv/
         S8v0Yk2th+oFj3wJirVB2FOKRuhGUm1VmdvP/Sb2mMvbvZun/+6QJHnkWntgRVtffAU6
         3OC+H9jkwruTlE4wPbKlmLBcUl988TYSv80ZO/pGRKQCO871zjluRlMxAmsgQO7JTu9r
         GfHtof1pRrZwxzp3mDC5rTQV/yhGUmSEru6IMubQcNJzbh1WWEPUyiJ+Wq0JsG//71rB
         lw0MA7cIrdDUH72dRC4Qoc+HbeFD604+6o+Vw2TVtPtfFN/knXZJQbPMuEuES8Svu5E/
         CtCw==
X-Gm-Message-State: AFqh2ko1oyfxBq25MSbzC8PHsAu/mBcaxhp0DbVCZ3I7+3MhLrNXmYe/
        6lu36BnmQVgjGnr1IAUqa3wqWw==
X-Google-Smtp-Source: AMrXdXsW3LDZcyrpb098mF2zeNcNAfbkyBw94enf2jW/DYdPwLD3ZbTLnrJ8rmSQ3rlSjxTEzR192Q==
X-Received: by 2002:adf:e8c9:0:b0:2ba:53cd:7558 with SMTP id k9-20020adfe8c9000000b002ba53cd7558mr11512354wrn.61.1673442877980;
        Wed, 11 Jan 2023 05:14:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r4-20020adff704000000b0022e57e66824sm15616633wrp.99.2023.01.11.05.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 05:14:37 -0800 (PST)
Message-ID: <606af582-e4fa-09ad-a65a-8d15fc86f5ad@linaro.org>
Date:   Wed, 11 Jan 2023 14:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/2] dt-bindings: input: microchip,cap11xx: add
 cap1203, cap1293 and cap1298
To:     Jiri Valek - 2N <jiriv@axis.com>, linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, u.kleine-koenig@pengutronix.de
References: <20230111131111.475270-1-jiriv@axis.com>
 <20230111131111.475270-2-jiriv@axis.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111131111.475270-2-jiriv@axis.com>
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

On 11/01/2023 14:11, Jiri Valek - 2N wrote:
> Add support for cap1203, cap1293 and cap1298.
> 
> Signed-off-by: Jiri Valek - 2N <jiriv@axis.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

