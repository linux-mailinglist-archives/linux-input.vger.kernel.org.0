Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D9457CCB4
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 15:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiGUNvo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 09:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbiGUNvY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 09:51:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AAD30F70
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 06:51:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so2901092lfn.5
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kecr5i+5DLqDAmpCrXdI3okGZBctpe1q4C972GZbARg=;
        b=t+T9FmxDSET1eznoCZFy5FwJ1ygGlaE91MHfg567RS5eq0HIIhoshGcZqgbcPUTPs0
         DML/HMp9i7WzlYCUCDXr/j8xjWMaPLeurgwe0nr3WvKcjnX6/D3dqvvNQ530f0OMBeKD
         Ql4RQyM4kGU+93SJTClpPoh0X3m7iukKfp3+3Fv5gZdgA+XwE5bZsJujIfQ3Z4hRXFX3
         FRsPzQZsR9BDjhLvA2c0rI1gMapeAJgxaVhFRh1OlyTS2mnwbQO/NbyuNfYm13Y1c+PQ
         RFfFE+z5+1QfwTc9GMQq4q/jCF5DHw8DGJKfssxwJiWHg+vVpfY9HsFL22Mp0enGyREU
         Yfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kecr5i+5DLqDAmpCrXdI3okGZBctpe1q4C972GZbARg=;
        b=M2XVkx9O2TQ61A9qgVRY04VeoTF+yVhcI6Paa1KHFH4O1c7yUbHQ7Os7IorS5kXvZI
         TgNisOpROA1+nT/FvfzlINHTfPgYeZuqz453ScmS1oel+53+uySraXxtWoBw9+m3Yr4T
         xLbxKcC7c4LjZabuxmwzbkbSYxkwK8KsUie3sRa7QCM+rbfObDpkohMxiOtL/00UZgfh
         9sa2HupOou7wkp5l7QDOkpxHoPDJxLrn40RbDlJXOgHbblRyHD4+nwmHSOKMN+Vt6c08
         MrHr38nNP0jo8gWT9m7jinwSyEfxbAzDlk1c8H0DfsA5PgoY/UThuQo6IsJkXITo1QDL
         HOrA==
X-Gm-Message-State: AJIora9J5VWU4kXJm+occleytzOZtjHlQEd8eYFxPnthbb7jiz9kB9Nz
        KzL308YgXQe6d5+L8Ddfvhh2rA==
X-Google-Smtp-Source: AGRyM1skXS9BzdqmFA82kATV7e6ORmNPtgRU6LtaPvd+9FfzbJu0HXQ5nPVqtz0xd98CkqRG+GjCRw==
X-Received: by 2002:ac2:4bc1:0:b0:48a:ad3:f1af with SMTP id o1-20020ac24bc1000000b0048a0ad3f1afmr21039314lfq.240.1658411472064;
        Thu, 21 Jul 2022 06:51:12 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512314400b00488333b6515sm448587lfi.305.2022.07.21.06.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 06:51:11 -0700 (PDT)
Message-ID: <4084d7e6-e722-a4a7-1a34-c50983f7d93a@linaro.org>
Date:   Thu, 21 Jul 2022 15:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
Content-Language: en-US
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
 <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
 <87r12eh9qe.fsf@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87r12eh9qe.fsf@baylibre.com>
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

On 21/07/2022 15:32, Mattijs Korpershoek wrote:
>>> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>> index ca8ae40a73f7..03c9555849e5 100644
>>> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>> @@ -49,6 +49,12 @@ properties:
>>>      maximum: 256
>>>      default: 16
>>>  
>>> +  mediatek,double-keys:
>>
>> Do you think there could be another MT keypad version with triple-keys?
> 
> Of all the SoC's i've worked on (MT8167, MT8183, MT8365, MT8195) I've
> never seen a "triple-keys" keypad.

OK, but the binding you create now would be poor if MT comes with such
tripe-key feature later...


Best regards,
Krzysztof
