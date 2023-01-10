Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B585663E0D
	for <lists+linux-input@lfdr.de>; Tue, 10 Jan 2023 11:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjAJKYE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Jan 2023 05:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238318AbjAJKXT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Jan 2023 05:23:19 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5CCA449
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 02:22:39 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bn26so11225108wrb.0
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 02:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctK7ZyN2QqifD5vli3AqrEm055mrM6gMAEL00lxhJZg=;
        b=razDtEVjbFgLq+LYEZKHsaTisUEBpVP1ZTmNc7dDUG5W6V4rEK8fppIk2sM2W+8QO/
         4kewjuRoiUyeOriGg3RTKmg+20zwsXd6pN6Sp3rmLtBroBmDrSjonzD0ew+zsbxERlYY
         taRLSJy5lRq3Zc1xlDfXmQChti3NoWDNnLF9LEVL4nNg6BrdTDdG1/0t5okuwyUbRgKK
         Es1u1J5DD6higs3IaU0nvOMoMOzaWvzOuTOtDudfGgLFRmA3SYSC3JYntXhOLgeDSZxD
         kd6O74uJ18EqgEMA7nixiNN/DQm9JkGYIFZTWmlByu6YygJl68Q9JJjT0HvmJaPG9q6U
         Ad7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctK7ZyN2QqifD5vli3AqrEm055mrM6gMAEL00lxhJZg=;
        b=begQfAD3f9sYQMF8Zya3kkZ7pCKoGiMOc6uLZjmbUyLzmzfDMs421fgRYfpP0EGIwb
         rGURzFQ2H+BlXTdlURyoOYqZkbMsdt4/DGC15RhVQZoWvMwhs8OGhavRuMFeZRWwpLhL
         CQD5Bl82yI66SlZXrWaIVk9wM/cuCO70iajf8q7OTPEjnlwQe+ekMpXkSgl9DcZ9YXs2
         rmETAQ7IxtB8hILJNiOMRHVON5whC32qvyUUKXRWkW509DmCDW1FlDoGTzXIH5aATUP3
         iqQ4GSVTfNBdMGN3S0p1QvpHRoTOijmDaRNuY+bX4AshJ13xjfZbcShgPBAwfTUVMogE
         vOAA==
X-Gm-Message-State: AFqh2kojdvhOmgcvCKiNeDEfYv6I1CxU0x7q/CYWJNG0dmhNz/xja4A0
        wCv3eTZV4s2Ly8jDMP80SaTWFg==
X-Google-Smtp-Source: AMrXdXsr5rGo+5MTh8YMx455vuw7O1viFs0yOXa+irSqZILtSqfJ5xTgwGtTGjwiFsT3Fi92hckBVw==
X-Received: by 2002:a05:6000:705:b0:267:e918:d1e6 with SMTP id bs5-20020a056000070500b00267e918d1e6mr42811873wrb.51.1673346158340;
        Tue, 10 Jan 2023 02:22:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a14-20020adff7ce000000b002549b649b62sm10689139wrq.50.2023.01.10.02.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:22:37 -0800 (PST)
Message-ID: <c45a7d39-eb09-a33c-5b91-8cb1d8effaac@linaro.org>
Date:   Tue, 10 Jan 2023 11:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/2] Input: cap11xx add support for cap1203, cap1293
 and cap1298
Content-Language: en-US
To:     Jiri Valek - 2N <jiriv@axis.com>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        u.kleine-koenig@pengutronix.de
References: <20230103134105.736346-3-jiriv@axis.com>
 <20230104135951.930783-1-jiriv@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230104135951.930783-1-jiriv@axis.com>
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

On 04/01/2023 14:59, Jiri Valek - 2N wrote:
> PATCH 1 - add compatible string for new models
> PATCH 2 - add support for new models into driver
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.


Best regards,
Krzysztof

