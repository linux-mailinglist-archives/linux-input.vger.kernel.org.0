Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B525F9D4B
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 13:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiJJLGn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 07:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbiJJLGm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 07:06:42 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33775EDEE
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 04:06:38 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id f22so2281551qto.3
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 04:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qLfkh3nuU6Ka/OP3hjAffMuHsumXScWzDebeiU99Q8=;
        b=xRX2mWvjy6iLzYrkox0cONugvJGLzWxyDJjYjYgwtqQXfAUWOH0Drq05tENlHAhB8O
         a4/ii5BUsgP4aaBG3wf0V2fj5xXp1Q6OUfxh3BcDVq6NqfGU20V1B15TaZVHBK0T54g8
         wrwu3x0zh/6GNXdvJCOBHovVbWiz60W5lZZXKyN9tZTb2mQ8d4fhB9zG2He/khGYwDEL
         cvPXnjY7aOt2eHPlSC2uF1mWP+94PLmfFIQWjrwJyf+lpXk8/NBoS76NsHRmqA/LpSQ5
         eyftWc7wyVM8V5cnZu+qMW6VDy6fybmQTYF6vGsf2wRK/oeCkjWjojCzH8dA58vdITcv
         gMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qLfkh3nuU6Ka/OP3hjAffMuHsumXScWzDebeiU99Q8=;
        b=2BIspf/TwtDjTu9jM7wT06y7CLjHI4Paegc17NaUaKyOmUd/oXou6Gjx3uSjI/aL0u
         O9Nr/XFf2lSb+Uv6vyzptA1PmzV19Wt7NKax9jC9AsxGCulCdaNNoen45TzM11z/o8A+
         xd9R6TDCamYFpL8zGEz59u8IWje8XssmLny4cI7BcG5cpg4IyC1NnKeusf0j+eRgFWed
         s5Sr3IGilmWE6caRToCobh2+3jMiUSIrW0PvCGGLgKyPlC83h3C1bZ33YXVLMnPh/C3A
         /lbb3omhczJm0xDe9zTioWW6oqvi9IKSjHiBE9MXcP50m2Ow2pv6UU66yBAiOKxIFrAZ
         8dCg==
X-Gm-Message-State: ACrzQf3aCHugBXSxQjUbM25oalZUTpKUt3czAsITuDuuftjZK92zeGsj
        VqxRsHaDeTnsYe7qr2U+1jhC4Q==
X-Google-Smtp-Source: AMsMyM51oAqQLcZw2xz4SYWn7cDC6BSKCuoXtWwktjJA50ZtK8BENmXQjejKSiXx6Xjn4kHz3HLdtw==
X-Received: by 2002:a05:622a:651:b0:398:5034:9e85 with SMTP id a17-20020a05622a065100b0039850349e85mr7502651qtb.277.1665399996684;
        Mon, 10 Oct 2022 04:06:36 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id ey23-20020a05622a4c1700b0035cf31005e2sm8282037qtb.73.2022.10.10.04.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:06:35 -0700 (PDT)
Message-ID: <eb066d99-f0b6-96db-1f37-dec99b3abdf0@linaro.org>
Date:   Mon, 10 Oct 2022 07:06:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/3] dt-bindings: input: touchscreen: Add Hynitron
 cstxxx
Content-Language: en-US
To:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
References: <20221007184710.6395-1-macroalpha82@gmail.com>
 <20221007184710.6395-3-macroalpha82@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007184710.6395-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 07/10/2022 14:47, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the Hynitron cstxxx touchscreen bindings.
> Hynitron makes a series of touchscreen controllers, however for
> now this is expected to only be compatible with the cst3xx series,
> specifically the CST340, CST348, and CST356.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

