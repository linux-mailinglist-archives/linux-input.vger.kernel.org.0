Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C474C2D57C8
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 10:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731569AbgLJJ6c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 04:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgLJJ63 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 04:58:29 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B84C0613CF;
        Thu, 10 Dec 2020 01:57:49 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id a9so7355703lfh.2;
        Thu, 10 Dec 2020 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q6Rle7Zfp/9fsnXTrVMeXSLbIqeu6VGUS6bZlipo6Yg=;
        b=NEk+KrylcayZ4ow/7WzuzE6tE/6MradNdXkAzkkhcgBfjZQFdrfvd/jLCzSH93DnEj
         +4Xkj0bZ6+Zrnr8E7L7ZIXLoB9bjSTJEt8jC//nuhHJNhxlYRqBfOSlwY4vGPTe0aOSf
         rISRBnNwWKoVBd77/QlhMvCgjukH/hk2j9OBIjKS9d1g3iSCDlD+iHlKVTb0w2PgbQsK
         TNanYeC/6qr42I4x4UPz4EgX/WcuFKdC1RehDFqZolXxCqlyHHxOKh/lhfmXvlfEHWwm
         /vNgPPOwuXCwILVP6gM3mtvIdvM7Hzknb11MNsNgTbXDKir28Zu5PaejGr7arYW9ymLP
         Ahew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q6Rle7Zfp/9fsnXTrVMeXSLbIqeu6VGUS6bZlipo6Yg=;
        b=gHoOZwky2w70Szo68LcPFmF+r/WfyVqzvDk0tAxJSUqXg1nzoiRB8g4d6Dk9K0jEbv
         adho8qlbbn2Ql6fbsoMOVcPHOHk4PVxUs7lASWjit/FCuoQyMxUoMGP/T69jBCXfUpak
         ukkmlZ80VzMDlATnSv40TCF9w7ciyowM9GdBVbzYush1QAl6jNLdH+Jjl+7vVNA4I0IS
         jWoGIDMhokdIK9I33gaykGxDmH0T0J88+02uwTlfOWXf/KPmf2LffsbdkVEL4Bg1kuLb
         jqL6ukfTaF4ahOBNqrrPTTtOYpbmHvp1o+Oj/acNWTLMpBVOZNSR5M5Y5NDqJTIsWPvi
         qSQA==
X-Gm-Message-State: AOAM531/TDQkmtf+9SMbxuy2B2OXOffVKJ4FtBW6pFmYzdJfym/lHys/
        Uv3TvZ93HtSS7hzqj/n7tEhszA1zH8k=
X-Google-Smtp-Source: ABdhPJx7LLXbSh3NSdhxr7eHO60gCHKufiN0jhXXLcVnoC8vpIK+i7AFVsSDACuQJY7h/KC+WJht9w==
X-Received: by 2002:a19:d86:: with SMTP id 128mr2453180lfn.317.1607594267393;
        Thu, 10 Dec 2020 01:57:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-205.dynamic.spd-mgts.ru. [109.252.193.205])
        by smtp.googlemail.com with ESMTPSA id m17sm459131lfo.132.2020.12.10.01.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:57:46 -0800 (PST)
Subject: Re: [PATCH v3 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and wake-GPIO
To:     Rob Herring <robh@kernel.org>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201206212217.6857-1-digetx@gmail.com>
 <20201206212217.6857-2-digetx@gmail.com>
 <20201210034420.GA1615537@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea36d902-b158-981a-f144-2878784bf079@gmail.com>
Date:   Thu, 10 Dec 2020 12:57:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201210034420.GA1615537@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2020 06:44, Rob Herring пишет:
> On Mon, Dec 07, 2020 at 12:22:15AM +0300, Dmitry Osipenko wrote:
>> Some Atmel touchscreen controllers have a WAKE line that needs to be
>> asserted low in order to wake up controller from a deep sleep. Document
>> the wakeup methods and the wake-GPIO properties.
> 
> wake-GPIO?

The "wake-gpios" is the new property and it has "maxItems: 1", hence the
wake-GPIO.

>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/input/atmel,maxtouch.yaml        | 29 +++++++++++++++++++
>>  include/dt-bindings/input/atmel-maxtouch.h    | 10 +++++++
>>  2 files changed, 39 insertions(+)
>>  create mode 100644 include/dt-bindings/input/atmel-maxtouch.h
>>
>> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>> index 8c6418f76e94..e6b03a1e7c30 100644
>> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>> @@ -39,6 +39,13 @@ properties:
>>        (active low). The line must be flagged with
>>        GPIO_ACTIVE_LOW.
>>  
>> +  wake-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Optional GPIO specifier for the touchscreen's wake pin
>> +      (active low). The line must be flagged with
>> +      GPIO_ACTIVE_LOW.
>> +
>>    linux,gpio-keymap:
>>      $ref: /schemas/types.yaml#/definitions/uint32-array
>>      description: |
>> @@ -53,6 +60,26 @@ properties:
>>        or experiment to determine which bit corresponds to which input. Use
>>        KEY_RESERVED for unused padding values.
>>  
>> +  atmel,wakeup-method:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      The WAKE line is an active-low input that is used to wake up the touch
>> +      controller from deep-sleep mode before communication with the controller
>> +      could be started. This optional feature used to minimize current
>> +      consumption when the controller is in deep sleep mode. This feature is
>> +      relevant only to some controller families, like mXT1386 controller for
>> +      example.
>> +
>> +      The WAKE pin can be connected in one of the following ways:
>> +       1) left permanently low
>> +       2) connected to the I2C-compatible SCL pin
>> +       3) connected to a GPIO pin on the host
>> +    enum:
>> +      - 0 # ATMEL_MXT_WAKEUP_NONE
>> +      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
>> +      - 2 # ATMEL_MXT_WAKEUP_GPIO
>> +    default: 0
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -63,6 +90,7 @@ additionalProperties: false
>>  examples:
>>    - |
>>      #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/input/atmel-maxtouch.h>
>>      #include <dt-bindings/gpio/gpio.h>
>>      i2c {
>>        #address-cells = <1>;
>> @@ -75,6 +103,7 @@ examples:
>>          reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
>>          vdda-supply = <&ab8500_ldo_aux2_reg>;
>>          vdd-supply = <&ab8500_ldo_aux5_reg>;
>> +        atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
>>        };
>>      };
>>  
>> diff --git a/include/dt-bindings/input/atmel-maxtouch.h b/include/dt-bindings/input/atmel-maxtouch.h
>> new file mode 100644
>> index 000000000000..7345ab32224d
>> --- /dev/null
>> +++ b/include/dt-bindings/input/atmel-maxtouch.h
>> @@ -0,0 +1,10 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#ifndef _DT_BINDINGS_ATMEL_MAXTOUCH_H
>> +#define _DT_BINDINGS_ATMEL_MAXTOUCH_H
>> +
>> +#define ATMEL_MXT_WAKEUP_NONE		0
>> +#define ATMEL_MXT_WAKEUP_I2C_SCL	1
>> +#define ATMEL_MXT_WAKEUP_GPIO		2
>> +
>> +#endif /* _DT_BINDINGS_ATMEL_MAXTOUCH_H */
>> -- 
>> 2.29.2
>>

