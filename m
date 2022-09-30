Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C205F100A
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 18:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbiI3QcS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 12:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiI3QcR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 12:32:17 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256399A9F0
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 09:32:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c2so1311675lfb.10
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ue4laGY5FoP2Mfg7r8jyegUpo8gtYdbsjMlIFQZ92ks=;
        b=yk65nk3SPtLKdZIyDHWd3l8fLfdkCbeyz+fArVxfgtoyZ3Qy5RoMDW6I1v1TovY8Wo
         eYunQBpgx9VDgZob62JmtV9qAS4Xx14SPmJEd7jSJ+NLrvewdUg+kVAtsdvEmooLeeul
         M9d6moztjz2sXzoHTRMpZMxdqI7yuMt9e6dEcYC5ZoMB87Wbt76pfHlpRcSPm+lOy6bu
         utuqfcccfhWDJPiE/BHZTVw/wUaSXK5hOqxHWlIrGqpf/DHVf344xbzqxDxlbwewVsRR
         BhbT/x7eiP4biaorGNlFwLOCCWpPjs43tKwp29pQI5DD9SyWgWNrol/N3w9VKppXpWdW
         iboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ue4laGY5FoP2Mfg7r8jyegUpo8gtYdbsjMlIFQZ92ks=;
        b=xCg2WltKZ077VgF7zB2feCHOQHFl52HZzoHkBSVXgpc0iVrQ98f8iTjgrG4sUKjry9
         dAzKGFF5sgfQY8SN1Nps7iIr6MEikUJ2XxL+XaSaN1LppCUA4CxAoizgvvTNXe+J6qoI
         OOy4VXirk8p6GW9fKmIZ2XENxS9Gqf9ZlZo3m70YYexX3wZ/WAeI5GP6soCfCGdCFgC4
         ddB1jLe7gfCshh8alLhw7zzhr1LK18hlonLBPhEeIQ1O4ueeWMVFdAw2mvwjPYoUN6cF
         QGO9bNJFKzsRaiy4x06m3bhlHQn9MCIkwJClKu/A7H8Djpp1sTJy8/BfV3k29wAxSK3V
         exhw==
X-Gm-Message-State: ACrzQf0uOD6yVWI4kyU2lxkvZ2yevcAKLKe1ZCFr9GZRH9oBqVtdVYWp
        e/4NOy8pWJjkKo9T28GBns1RNg==
X-Google-Smtp-Source: AMsMyM4Wq6E0irIhyr/IETDNH7BruSFrjjpngW0YMyJxLETN7/bgD5zEju3en9kAmwSo+NkxO9WV0Q==
X-Received: by 2002:ac2:5fac:0:b0:4a1:faff:53a8 with SMTP id s12-20020ac25fac000000b004a1faff53a8mr3458256lfe.587.1664555534421;
        Fri, 30 Sep 2022 09:32:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p11-20020ac246cb000000b00497a7dfe6a9sm344718lfo.64.2022.09.30.09.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 09:32:13 -0700 (PDT)
Message-ID: <f9eb873a-91b5-1bca-ac7b-109adc3372ae@linaro.org>
Date:   Fri, 30 Sep 2022 18:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx
 bindings
Content-Language: en-US
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com
References: <20220928214806.13572-1-macroalpha82@gmail.com>
 <20220928214806.13572-3-macroalpha82@gmail.com>
 <bcf0e3fe-ba69-2898-ed99-49afd08d1f72@linaro.org>
 <SN6PR06MB5342305DA33462161BC7020DA5569@SN6PR06MB5342.namprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SN6PR06MB5342305DA33462161BC7020DA5569@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 30/09/2022 17:21, Chris Morgan wrote:
>>> +maintainers:
>>> +  - Chris Morgan <macromorgan@hotmail.com>
>>> +
>>> +allOf:
>>> +  - $ref: touchscreen.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - hynitron,cst3xx
>>
>> Isn't the panel CST3240? No wildcards in compatibles.
>>
> 
> The controller IC I'm using is CST348. This driver SHOULD
> also work with a CST340 and a CST356 (untested though).
> 

Whether drivers works or not is rather orthogonal question. What if
FreeBSD driver does not work with CST356? What if U-boot driver works
with all three and few more?

> Should I just have 3 compatible strings then, one for each IC?
> I could also just have cst340 as the compatible and note it
> should work for the 3 ICs listed.

Choose either:
1. The only the one compatible for which you have datasheet or hardware.
2. Choose all three separate compatibles which you believe should have
same hardware properties thus one binding fits them (based on
experience, datasheet, other drivers).


Best regards,
Krzysztof

