Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE23C5669CE
	for <lists+linux-input@lfdr.de>; Tue,  5 Jul 2022 13:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiGELjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jul 2022 07:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiGELju (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jul 2022 07:39:50 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D266613F57
        for <linux-input@vger.kernel.org>; Tue,  5 Jul 2022 04:39:49 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a11so14149950ljb.5
        for <linux-input@vger.kernel.org>; Tue, 05 Jul 2022 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=XqGBUv2bVR1BBSn8EmBr/HQnR9EoIw7gIb/DairnNFs=;
        b=PFKl7oPUIaa88zrn/8CuiC9DcDwgPU9BOA7TQp+ajBf9ok1bO4vKFtl3kvuBJPJOI9
         dGDn0fLKhP3juMGTXuKIiFXoOdfxnMm2KHHC16ifNTHxSOhAuF0P6WHNEOEdyTJeNFS7
         Sojpv2Dk21v+58u6CN8JG2J6KojXC/82auKbdYzsNcLeRI2+qPR6/pA8QCHkOHJfTX//
         doEauC0AzOHgVVSRHJCNmRebm4ur3hyPl4J51ByC6D/TgttQF/ZKMahwaA96xbXxp81R
         X3yTggTyd0ULkcukRCKknDBWI/aQaR9f04EdfHXP1jDVcZ30YYXsf6mbxSzj/iIUpjqS
         lXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XqGBUv2bVR1BBSn8EmBr/HQnR9EoIw7gIb/DairnNFs=;
        b=oBf830QfwgFxPM/WJ/kG42DwSNlMYME0uQW7B56QX3C/1QPnRKAVFUaAxGRqx2qYYN
         hZMU8P0ogx2hITyYbvygdLolmRkNngSybNJhRxCs/ZTTB+6Kq5SuQN7T1emowSpfiuEu
         I5Ms9QQyYJ4ZcqOx9BwzNoqqdCoc30wfZfuKbcJNEyqI4LgWXutSmYblZ4sCohXQ90l+
         hSf+wRHNVBQm4cwbSPNw9Xl+KpFRLumUqMkndJXPjuLtq2eyREssjrzlaEaQgGC/t4IM
         dDCNKxu74lnhxf5rY+ZaMRa/30QFr+61k/uRDUSFpNQapTHNLP9lCc4B5XzbRdKErci9
         BAWw==
X-Gm-Message-State: AJIora/V0Iu2/V8/ReuLSuN/Ou+0fTal+qyM69IecmgxEBkMalRg0KyA
        S7w5NKPkdguNU2IZZo74gNdYYA==
X-Google-Smtp-Source: AGRyM1u/pjN+NyojeJVROuh8VlGN3O/Cf8pqXVDdLH/73GyJfjJZGzyKzW5enrA3dEZc9SxANQukzw==
X-Received: by 2002:a2e:bc22:0:b0:25b:c3b6:eb11 with SMTP id b34-20020a2ebc22000000b0025bc3b6eb11mr20157656ljf.122.1657021188242;
        Tue, 05 Jul 2022 04:39:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm5663357lfs.67.2022.07.05.04.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:39:47 -0700 (PDT)
Message-ID: <c2c1cf0c-9462-9ba5-a297-70d13a063de1@linaro.org>
Date:   Tue, 5 Jul 2022 13:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/40] dt-bindings: input: gpio-keys: enforce node
 names to match all properties
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     soc@kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>, arm@kernel.org,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-1-krzysztof.kozlowski@linaro.org>
 <cab6fd96-4b8e-42a3-4dce-db63656df92c@linaro.org>
In-Reply-To: <cab6fd96-4b8e-42a3-4dce-db63656df92c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/06/2022 10:17, Krzysztof Kozlowski wrote:
> On 16/06/2022 02:52, Krzysztof Kozlowski wrote:
>> The gpio-keys DT schema matches all properties with a wide pattern and
>> applies specific schema to children.  This has drawback - all regular
>> properties are also matched and are silently ignored, even if they are
>> not described in schema.  Basically this allows any non-object property
>> to be present.
>>
>> Enforce specific naming pattern for children (keys) to narrow the
>> pattern thus do not match other properties.  This will require all
>> children to be properly prefixed or suffixed (button, event, switch or
>> key).
>>
>> Removal of "if:" within patternProperties causes drop of one indentation
>> level, but there are no other changes in the affected block.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../devicetree/bindings/input/gpio-keys.yaml  | 157 +++++++++---------
>>  1 file changed, 77 insertions(+), 80 deletions(-)
>>
> 
> Dmitry,
> 
> Any comments from your side? Are you planning to pick up the dt-bindings
> here (patch 1-3)?

Hmmm, I guess this should go via dt-bindings then...

Best regards,
Krzysztof
