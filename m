Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8356729F76
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjFIQAI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 12:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242096AbjFIQAF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 12:00:05 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AC1213C
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 09:00:03 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5147f5efeb5so3429306a12.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686326402; x=1688918402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmrAWEdTpAeUeR5jc+sXk5q7UDP7Hqefj8kJ8Wfci+g=;
        b=EF1aDuVS0spbASUoWKBw3ObmFq+ketWV5bhRQZTs1rDLKXm9bmoPjD4VzhM/i78O3x
         d9sHnlZamwbhbeZOf6xv7rfURhkIL+cvIh7UyCbQcjydGeYXQcKtF4uYQpy3wvDikKQ8
         Clp1zQyBY9IVZhFuZxE57JlY8/I019ajLCsKNQT4Q18pmqxAC3BfmK1WlIAiWbJbIoa7
         Qmib7m6g1y2yiz6fkRrQOuALm3KZnoyKgHMS/NPrClXH/xgh/wRAOrfnZ4Utt4KHBPbV
         E+aOLn0N9SNlP9kTkma2D41KqD12caxw1PoaAPcO9Lu2cFtXKZaxV11Pwox6p7yE8EYA
         iMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686326402; x=1688918402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmrAWEdTpAeUeR5jc+sXk5q7UDP7Hqefj8kJ8Wfci+g=;
        b=D/itHhs3iXicTTwjSx0eJ3cAu0WeYBG+eQbfYDhkYgyDAovUpl1RaE35D6u6Tbj7B3
         G4ZUk0LQJmlb0xnBjs9y7hRrGrC6I+tdNPSX9F3ZY+KWE1nARJVttD5R5K3j+V99JzZ7
         A4YuvcrAyX7w8Z29MH8NBT848Rk+WnGlrRU3MsWGnZBtzrXu/I5MqneRirMhqnF/cxx1
         eDGVtQU8Q6nI+91vZ9fOptPJ7Z8skxYcOoLXV2FxxJhCHDPZ+zJufZNRx1LXnNztJqMe
         1fm1CRMVVYU4sgJKQYMOuSVqqL1T5dToDQgKqnQpq9fKpq0crqvHlpqwDzPbiaUvAQkU
         hkvg==
X-Gm-Message-State: AC+VfDzHFMGzQYOdggj11bDySUK7P1JNfAW2iWShkF8DpA9yWS3QMEz1
        Nw0Rk4f1fVr07BzfKjwBcT/lHA==
X-Google-Smtp-Source: ACHHUZ6GwVdCIRU7CfRXzPk7HYiBLG2sXksC6LHRwueZZm3/HF/GmbGsFA2i7pItACSHSVlJmuP9Tw==
X-Received: by 2002:a17:907:748:b0:974:5ce6:f9f6 with SMTP id xc8-20020a170907074800b009745ce6f9f6mr2365505ejb.10.1686326402437;
        Fri, 09 Jun 2023 09:00:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i16-20020aa7c9d0000000b0050d83a39e6fsm1940293edt.4.2023.06.09.09.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 09:00:01 -0700 (PDT)
Message-ID: <ce119df1-f846-2556-dc52-a54e7a0635be@linaro.org>
Date:   Fri, 9 Jun 2023 17:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 1/2] dt-bindings: HID: i2c-hid: ilitek: Introduce
 bindings for Ilitek ili9882t
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hsinyi@google.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230608130147.2835818-1-yangcong5@huaqin.corp-partner.google.com>
 <20230608130147.2835818-2-yangcong5@huaqin.corp-partner.google.com>
 <77dce4ec-89aa-8802-b169-744f6c11b177@linaro.org>
 <CAD=FV=UxQPWm6BNSeTAJWq1Cc8qFL2WTJHFiOrca5mnTEPHMvQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=UxQPWm6BNSeTAJWq1Cc8qFL2WTJHFiOrca5mnTEPHMvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/06/2023 17:56, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 9, 2023 at 8:50 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>> +  vccio-supply:
>>> +    description: The 1.8V supply to the touchscreen.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - vccio-supply
>>> +
>>> +additionalProperties: false
>>
>> Why do you disallow all properties from toouchscreen.yaml? Aren't they
>> applicable?
> 
> This matches what hid-over-i2c.yaml does. It only picks
> `touchscreen-inverted-x` and `touchscreen-inverted-y` from the common
> file, which aren't needed here. I assume that the rest of the things
> from the common file can be probed using the i2c-hid protocol?

OK

Best regards,
Krzysztof

