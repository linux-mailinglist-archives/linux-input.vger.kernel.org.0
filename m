Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61D704FB5B7
	for <lists+linux-input@lfdr.de>; Mon, 11 Apr 2022 10:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343626AbiDKIRW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Apr 2022 04:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343622AbiDKIRU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Apr 2022 04:17:20 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65FF3E0C7
        for <linux-input@vger.kernel.org>; Mon, 11 Apr 2022 01:15:06 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id t11so2190860eju.13
        for <linux-input@vger.kernel.org>; Mon, 11 Apr 2022 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=RIVhF17ZHyHEkRri4xITDP87S8vJ9Qvq5E0aaRqPUqo=;
        b=HpaD939JeDZag7GNabmmQUbDl6GkCFHqziohJsuZGD+aNbU1ARxNfXa3i2WnDYA538
         fW9gwz8E+m/NaeSym75ztYGKWgO37LMloV/o3DijSlF0lFfIn9CSK9f8puk6IHC1AoZ6
         um4jHwLJyvHVr3qBulK72R6/IdOk7gQBN1mmoB+Fw6FHinX1mNOOJ+GRx4Q87yrxXzpe
         SBFoJYhlOgONfzWDahBatGtSgcpfv7I9amynwL7I1O+Y4Hd3Zldqm+2fZdtslt227Dz+
         WNKYlVr9HNypLGyRgcqTVJ5R7lB87i0atreNYS0WipI3cJ4Vl8BxRfBeyKzCdACYKpX9
         nlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=RIVhF17ZHyHEkRri4xITDP87S8vJ9Qvq5E0aaRqPUqo=;
        b=Bq7buL3gV/iZJdWlRH4oMflOu0Ry6Teu+/ORW4RFnwqHdFdrU//BpGcO2ZPDO9l7cH
         8kSkVU270FzTh/qlAbVfQL1d4sdty/H4eHCh4pnXYgt77Ojon1Cz/hD4J10UoMsNuI9i
         e6kmrX3yMVnsojLczh7bv7hVqOldjOrzQfzJ8xN3xcqkr6vnOI0UWj8GdZQqnDcSiXK6
         gsiNoLxWshKRbr1ipyIYezTqaqTqLucSTPaN/eBKkhZzcKJ04G1MbkOAyV25HCqfRAST
         3iAy/kO+8Eh3rDX5myU3z+LPGUS8vgH53BsNmKI33L3PCNdvt0rxNSO2lb4Hz2ccpSwU
         5rGQ==
X-Gm-Message-State: AOAM532uUhLXd+HHASC55Kyw38/z/g60tA/GGfCm1Dc7EJ5p29gpe5D5
        iGlEZZ5aIw5UsJMkekpUsWDfyw==
X-Google-Smtp-Source: ABdhPJzRz84+mPotUb9JXXoXBsuHqdyI4MsyzEKZLWh+RTv0i4v5vUAvX5V9WgyUrO7Z4GDU8ed/3A==
X-Received: by 2002:a17:907:c0c:b0:6d1:8c46:6415 with SMTP id ga12-20020a1709070c0c00b006d18c466415mr29329284ejc.326.1649664905140;
        Mon, 11 Apr 2022 01:15:05 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709060e8300b006d0e8ada804sm11609969ejf.127.2022.04.11.01.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 01:15:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 11 Apr 2022 10:15:04 +0200
Message-Id: <CJ79EIW9Z89J.YZTZ6AU91TGE@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: input: Add bindings for Awinic AW8695
 haptics
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        <linux-input@vger.kernel.org>
X-Mailer: aerc 0.9.0
References: <20220408115311.237039-1-luca.weiss@fairphone.com>
 <1a45984a-752b-6bad-0320-f0946d83f2b9@linaro.org>
In-Reply-To: <1a45984a-752b-6bad-0320-f0946d83f2b9@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Krzysztof,

thanks for the review, replies are inline!

On Fri Apr 8, 2022 at 5:05 PM CEST, Krzysztof Kozlowski wrote:
> On 08/04/2022 13:53, Luca Weiss wrote:
> > Add a document describing the bindings for the AW8695 LRA Haptic Driver=
.
>
> (...)
>
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to RSTN pin (active high)
> > +
> > +  awinic,f0-preset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Default value for the f0 of LRA
> > +
> > +  awinic,f0-coefficient:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Coefficient between actual f0 and the value in the re=
gisters
> > +
> > +  awinic,f0-calibration-percent:
> > +    maxItems: 1
> > +    description: Limit of f0 deviation from awinic,f0-preset
> > +
> > +  awinic,drive-level:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Level of drive waveform in normal driving
> > +
> > +  awinic,f0-detection-play-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Drive waveform play times in the first period in the =
f0 detection
>
> Use standard unit suffixes for known units (e.g. time).

While the datasheet doesn't mention any time unit, the value is used to
calculate the f0_trace_ms variable (which is milliseconds) but the
result also depends on the awinic,f0-preset value, so it's not a raw
time value.

>
> > +
> > +  awinic,f0-detection-wait-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Waveform wait times in the f0 detection
>
> Ditto.
>
> > +
> > +  awinic,f0-detection-repeat:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Repeat times in the f0 detection
> > +
> > +  awinic,f0-detection-trace:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Drive waveform play times in the second period and la=
ter in the f0 detection
> > +
> > +  awinic,boost-debug:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    minItems: 3
> > +    maxItems: 3
> > +    description: Values for BSTDBG1-3 registers
>
> Do not encode device programming model (registers) into the binding. You
> need to define it as a property related to hardware itself, not its
> registers (e.g. boost value in mV).

Unfortunately I couldn't figure the meaning for this and the two values
below.

The datasheet doesn't mention these registers at all and the downstream
driver doesn't do anything meaningful with them (other than setting them)
nor has any comment to indicate what they do.
In the datasheet there's only BSTDBG4 mentioned where bits [5:1] mean
PVDD output voltage setting so for these registers it could really be
anthing :(

Maybe someone with more knowledge about LRAs might be able to decipher
what tset and r_spare is at least? I unfortunately didn't manage.

Regards
Luca

>
> > +
> > +  awinic,tset:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: Value for TSET register
>
> Ditto.
>
> > +
> > +  awinic,r-spare:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: Value for R_SPARE register
>
> Ditto.
>
>
> Best regards,
> Krzysztof

