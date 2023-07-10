Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A9D74CFB6
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 10:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjGJIS6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 04:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjGJISq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 04:18:46 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97FC10CB
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 01:16:28 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51e5672d580so1501634a12.2
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688976987; x=1691568987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMLmMaZJgTWbdr7iu08+YxmrJrzzyrvyScsuEmXQMU0=;
        b=ui2kaeF9PYa/Y37muhMqmi4heVoP/Emkm2QiR+dAsILcy+nqSGF/XJwdDYhiKHD/Lq
         2144ThLdThkS7QfU/Aw7uJ3lSnFBePZ0z5VhWzshfhd2V+89BDBJElg96gwER24lqgut
         JR7S4yJs+OwVqNnaRaQpbnKzohLDlKXLdaSkkanEW0C6+iYtQBUJL3nqwCR80y7sLpC3
         nRU0XGfKKwUKLnox/XZR5Y5SzArrwyGMKnHjQR6cirKd7wwP0ArDtpjbDtossteb1Y6M
         78bvrYpeSFFOUvkgdahyQ2VdsTKxWWZOixFCHCdI2Qqxed3QvAOqAyy1cDqlagboyCUe
         XsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976987; x=1691568987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMLmMaZJgTWbdr7iu08+YxmrJrzzyrvyScsuEmXQMU0=;
        b=GIoga2YrVK9MAZnlqvrOmf0Bi1WPJeM4F3Rr6xKA62BMW0SrdVZDonQp/84RW7CJ5C
         FwTCWulzvJXJGBjoV9BTIUOUOkZa+xhZ8wQsh+Q34uqMwEgIBfFz0MKzVYN8Xzgd/vPG
         DuytGnZTyJ9RbVSRbrw1162Sd1F4dVTn2VeapT7z8aPQk3zLhIkhR1H1uYMxrbnauwFc
         A+jS3s3yU6W8wMRh9TRbfv+mrwJ0mfyyK4Ytr0k1R4T07wBm47EqlkUfsVedODGP5O6p
         FGjWJ7CDDzAGpKmCyKJwq6qbE0jg6SJep9C1GnnhhfQhEqFO9fgbaaIfsdftTxcSTXq2
         odIw==
X-Gm-Message-State: ABy/qLa3+7AZS8yqQOnupX/aL2t9LtZYTR0sV6x6Bydrk+0wLoUIRQon
        e/kNtzHOmvv16giL/qiKiPBxyQ==
X-Google-Smtp-Source: APBJJlFpCl2lMBJm4AwwSsZiNhirOmNG6YKiBNL40mvo1ELlc6tnT2tXOvMAMwDm5B13rEnVtJQOqQ==
X-Received: by 2002:a17:906:b055:b0:96f:b58e:7e21 with SMTP id bj21-20020a170906b05500b0096fb58e7e21mr12991028ejb.52.1688976987335;
        Mon, 10 Jul 2023 01:16:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a27-20020a17090640db00b00977cad140a8sm5739856ejk.218.2023.07.10.01.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 01:16:26 -0700 (PDT)
Message-ID: <4848fef7-d836-b7c0-7446-699cc486d58d@linaro.org>
Date:   Mon, 10 Jul 2023 10:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/4] dt-bindings: input: iqs7222: Define units for
 slider properties
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <ZKrotyhz7eueujys@nixie71> <ZKrpMekZBt95Gmnr@nixie71>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZKrpMekZBt95Gmnr@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/07/2023 19:06, Jeff LaBundy wrote:
> The units assumed by the 'azoteq,top-speed', 'azoteq,bottom-speed'
> and 'azoteq,gesture-dist' properties are unspecified; define them
> according to the device's datasheet.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

