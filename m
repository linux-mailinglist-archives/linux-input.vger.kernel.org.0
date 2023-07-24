Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B5B75FCFA
	for <lists+linux-input@lfdr.de>; Mon, 24 Jul 2023 19:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjGXRPa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jul 2023 13:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjGXRP3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jul 2023 13:15:29 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD481E66
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 10:15:27 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so6891081e87.2
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690218926; x=1690823726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tx54cOY+neWzrvf0/88Ir6VNDJKus8S+yogDkessELg=;
        b=axrbNQcYXXe3XWxYcPXZfywT+d4YRo9PRJmGLrntnHvpWQCYeePb0FQh633zalGec8
         C1P2FpDDng2IIyye73IVibZhfsHcni3GhQaoJ/hRtsM7lsUtOUh039jB0RXNz6souzNZ
         xEQDt1p/MyPMkTwAmWbT0pwPc5GrQMccqLB9YwWJyGOZVxUScgsoGZu1aUBx+2W8RfBN
         T11/y4zxkNStzdTOpENm5bBJ3FtlRHbjmT+C4oN28Bcigw/82QiDIkUWfD4y9DwY6IEN
         U3QXG+LNXZ1i0NYf6BOn9tzh2pom+sY9x2tY66XFvuf+4zlFymtdgsiJjxCb1Uf8ppdp
         aKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218926; x=1690823726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx54cOY+neWzrvf0/88Ir6VNDJKus8S+yogDkessELg=;
        b=gWtc0sfG91Ik1Y5YssFMA/Fj3ZLeITdx4hBa3buu500GT5UFvlj/F3gnZ9tdIa+ybO
         E7/AOn48sofSR+LK9HUlJRGJfeFqRSzZ2kxxKxbAByWlvaQSXNqX2ujNkdJRWD2zPSWV
         Pcv3f4lALcGJmM6/t8cOTjE58GdgZ9YV0WZ6VdVF7ASMRNwAoPFnN1kqIz/9d+ijwx/L
         ILPIZgU9bdJ1YkMVdop75BlAn1wpBTokvhIqxPlzZTPjiRVkExRmPBCLQ+zyrT6FwSWb
         Bi97rmH9GxrxM8D3L7uCnTd1l/Zi1fPZtHQEHxpdIKRD0C3ZE4jpt+coDMl3D+QA9Qaj
         MTnA==
X-Gm-Message-State: ABy/qLY1GwYTRTUvq5O52h33Cs/TdmdzdJ4CBedV+6mQ+EkdHqTnMtro
        zFrrx72kSVjwDeng1ropNNEgzg==
X-Google-Smtp-Source: APBJJlHe8pLXiLrwGLxil9/si6KhJS7OlHyG5NCZrIzE8+xVOfSNKHouT+DLprz+aqmn0hYgLD9+ZQ==
X-Received: by 2002:a19:8c59:0:b0:4f9:5592:7450 with SMTP id i25-20020a198c59000000b004f955927450mr6127528lfj.23.1690218926146;
        Mon, 24 Jul 2023 10:15:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c5-20020a056402100500b0051dd19d6d6esm6504714edu.73.2023.07.24.10.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 10:15:24 -0700 (PDT)
Message-ID: <e76df506-4c8c-aaca-93f8-807f09a23613@linaro.org>
Date:   Mon, 24 Jul 2023 19:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: input: convert syna,rmi4 to DT schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230720110008.133359-1-krzysztof.kozlowski@linaro.org>
 <20230724155802.GA3609728-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724155802.GA3609728-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 24/07/2023 17:58, Rob Herring wrote:
> On Thu, Jul 20, 2023 at 01:00:08PM +0200, Krzysztof Kozlowski wrote:
>

>> +    required:
>> +      - reg
>> +
>> +  "^rmi4-f[0-9a-z]+@[0-9a-z]+$":
> 
> a-f in both places.
> 

Ack

Best regards,
Krzysztof

