Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1167143D149
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbhJ0S5L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:57:11 -0400
Received: from box.trvn.ru ([194.87.146.52]:56457 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhJ0S5K (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:57:10 -0400
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id CD5B540479;
        Wed, 27 Oct 2021 23:54:40 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1635360881; bh=BonGhLg84CWois0icg8TpND/lf5KoZP4O0tUhZHbQ1Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f2IPSOYrc3Qvp6aQhgRc039cAxfHFxb+20amdVK1WvyBS/PEoBK3kqon9kPAemIyo
         YRuKX5WNqnTxP5X8FF8IKUUk45c3A0zzuaJ9EWi7Y5FtpOgRGfHUN3Ar8bmF6TcavC
         GGXuIm/TXLvGTAnBKFTTpGAkcGI7tfsJKMwrmL/EigNRNnVgOInDjwa2GYy+s6eGN7
         42LWEWidS2FsZ6ahg5pFvqugnwlExfDzioqdWEDGbNsS1skflbBlsoP0+W4DWCR130
         W08T1yfmi/maBxRqnK0BDvLLy8uzHtUSRDBjPfQ3j0TCXFZV6D6WSDpsWaaljoonTc
         jyJ3Xnn6iqptQ==
MIME-Version: 1.0
Date:   Wed, 27 Oct 2021 23:54:38 +0500
From:   Nikita Travkin <nikita@trvn.ru>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     dmitry.torokhov@gmail.com, ~postmarketos/upstreaming@lists.sr.ht,
        robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: input: zinitix: Document touch-keys
 support
In-Reply-To: <4350691.LvFx2qVVIh@g550jk>
References: <20211027181350.91630-1-nikita@trvn.ru>
 <20211027181350.91630-6-nikita@trvn.ru> <4350691.LvFx2qVVIh@g550jk>
Message-ID: <351bd499d1326fda5ed9d5c06dce344e@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Luca,

Luca Weiss писал(а) 27.10.2021 23:33:
> Hi Nikita,
> 
> On Mittwoch, 27. Oktober 2021 20:13:49 CEST Nikita Travkin wrote:
>> In some configrations the touch controller can support the touch-keys.
>> Doucument the linux,keycodes property that enables those keys and
>> specifies the keycodes that should be used to report the key events.
>> 
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>>  .../bindings/input/touchscreen/zinitix,bt400.yaml         | 8 
>> ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
>> b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
>> index b4e5ba7c0b49..40b243c07fd4 100644
>> --- 
>> a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
>> +++
>> b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml 
>> @@
>> -79,6 +79,14 @@ properties:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      enum: [1, 2]
>> 
>> +  linux,keycodes:
>> +    description: |
>> +      This property specifies an array of keycodes assigned to the
>> +      touch-keys that can be present in some touchscreen 
>> configurations.
>> +    $ref: /schemas/input/input.yaml#/properties/linux,keycodes
>> +    minItems: 1
> 
> I think this would suggest all devices using the driver must have at 
> least
> keycode declared which doesn't seem to be the desired behavior?

As I haven't added the property to the "required" list I'd read this as
"If the property is defined it must contain from one to eight elements"
so I think that *technically* the schema is correct. (Otherwise the
dt_schema_check would fail verifying the example) However this indeed
may be true that I could give a better description than "can be present
in some touchscreen configurations."

Thanks,
Nikita

> Regards,
> Luca
> 
>> +    maxItems: 8
>> +
>>    touchscreen-size-x: true
>>    touchscreen-size-y: true
>>    touchscreen-fuzz-x: true
