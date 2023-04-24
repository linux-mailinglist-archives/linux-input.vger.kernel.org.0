Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E926ED431
	for <lists+linux-input@lfdr.de>; Mon, 24 Apr 2023 20:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbjDXSPv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Apr 2023 14:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjDXSPt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Apr 2023 14:15:49 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E2C49FF
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 11:15:12 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-32b102ca487so40117735ab.2
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682360110; x=1684952110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blVk5F8wi1jpNsCC6o8Ei6j9sVKcdv4aLvP/rqf73i4=;
        b=Hv6C9zeyJ7FAaoxMJTATINYuKa9zQsaQlTAzWbRmHNWnXWGihxKY6LHruRufkvsuzo
         5NO1FifkUkfHDEWWJPKKBrGcCWT1Fzp+X8pDNEv5dFHzVQwfyShlotWN/zj9Vx0eJr5z
         4Ei9KuT1drUAbMOHwRpzb8ev4T6f+o8CVRc50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682360110; x=1684952110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blVk5F8wi1jpNsCC6o8Ei6j9sVKcdv4aLvP/rqf73i4=;
        b=AiuEIf+Aln1T9kG1GMX5r7oSx6yeGzKr7TUFnZZZKI0bqpotK6gJjgoTFMYuDGAdiD
         REgNALC6zu2tumLTbUtcxf3qoWTFBsxsq/oO+989YmH1VQMUG2nPgTnS4S3Ckn5Gnx7Y
         eOkg2lNrOQVOkNQJcCq7beQFxooo7NUBwF+08m3jEIACuPnwWTgOsUzxw1dRndB1sevz
         61iQFkUYdz/oE34L8B3jxr+ng6KbbT3fdHWjiypw1g+B+7nU8ijIPTN3YIoGsujtxocQ
         HgHtOeWOr7shD7dOljx+2Ej4HKbdt1BIwx6E8M6IL3/vsnwyweHlAhtzbZWZL7g2x5xQ
         KJ2w==
X-Gm-Message-State: AAQBX9d4l03J79Hk9tYXz7M+B2pRnI4XHi7+bMrYq/pN3OwxMxIskHvB
        FjZKq2lKAho2fsq7Jt9GyilMDFtbxeElBjaphyg=
X-Google-Smtp-Source: AKy350bhZQlJwhuumFLh7pwd7RubXCIZwGMli11oMxI2bfyqRCRkLV8zzMe/LLFBNnT056qICNZ/7A==
X-Received: by 2002:a92:2804:0:b0:32b:681d:b1e7 with SMTP id l4-20020a922804000000b0032b681db1e7mr7259441ilf.8.1682360110285;
        Mon, 24 Apr 2023 11:15:10 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id m14-20020a923f0e000000b0032648a86067sm3155639ila.4.2023.04.24.11.15.08
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 11:15:09 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-329577952c5so1093285ab.1
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 11:15:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d09:b0:32e:561d:b42d with SMTP id
 i9-20020a056e021d0900b0032e561db42dmr34592ila.16.1682360107716; Mon, 24 Apr
 2023 11:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
 <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
 <ZEAGTiGyvynGA9P1@nixie71> <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
 <CAC=S1nj8VTXOovvianPWDYnsrbek0APD76SBNquFObaw8Vg4BQ@mail.gmail.com> <ZEX4BEVMf6GtvaAP@nixie71>
In-Reply-To: <ZEX4BEVMf6GtvaAP@nixie71>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 Apr 2023 11:14:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtrJDVB0gQp-O82V3mgU6MFVMSGrvzh0fRa7sYAt_Pqw@mail.gmail.com>
Message-ID: <CAD=FV=VtrJDVB0gQp-O82V3mgU6MFVMSGrvzh0fRa7sYAt_Pqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Fei Shao <fshao@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sun, Apr 23, 2023 at 8:31=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> Back-powering can come in two forms:
>
> 1. The one you've described, which is by far the most common. As you ment=
ion,
> it is not the case here since the issue happens only when we drive the GP=
IO
> low and not high.
>
> 2. Through a forbidden power supply sequence, an input pin of an IC with
> multiple power supplies becomes a weak power supply itself. Grounding the
> GPIO then sinks current into the SoC.
>
> This problem smelled like (2), especially since asserting the GPIO or pow=
ering
> down the supply alleviates the symptom. Most Goodix controllers I've work=
ed
> with have two or more supplies, and the datasheet requires them to be ena=
bled
> or disabled in a specific order.
>
> Based on Fei's feedback, however, this IC does not seem to be one of thos=
e
> since there is reportedly only a single rail. I guess either vdd or vddio=
 is
> tied to a dummy regulator? If so, then perhaps we can scratch this theory=
.

There is one rail provided from the main board, but there can be two
voltage levels involved depending on stuffings on the touchscreen
itself. I talked a bit about this in commit 1d18c1f3b7d9
("dt-bindings: HID: i2c-hid: goodix: Add mainboard-vddio-supply").


> Fair enough, I was simply sketpical that this was the _right_ workaround.
> Were this an issue of only supply A left on yet the IC datasheet requires
> supply B to remain on if supply A is on, I would rather see this solved b=
y
> updating a regulator dts node, trusted FW sequence, etc.

Right. That type of stuff was looked at in detail by two separate
teams, so I don't think this is the issue.


> Thanks for your due diligence; if this really is a silicon issue, then
> the driver should indeed accommodate it.
>
> That being said, the name 'powered-in-suspend' seems a bit conflated. We
> should not be duplicating regulator policy in this driver; the existing
> naming also may cause confusion for other HW configurations that do leave
> vdd and vddio on during suspend, but don't have this problem.
>
> Here, we actually mean to control the behavior of the reset GPIO through
> suspend and therefore something like 'goodix,no-reset-during-suspend' is
> closer to what I understand us to intend to do. I will add more details
> in patch [2/2].

I'd be fine with that name. ...ah, and adding the "goodix," prefix is
a good call.

-Doug
