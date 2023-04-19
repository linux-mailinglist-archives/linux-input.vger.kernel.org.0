Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E516E7CF2
	for <lists+linux-input@lfdr.de>; Wed, 19 Apr 2023 16:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbjDSOig (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Apr 2023 10:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjDSOic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Apr 2023 10:38:32 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED4F2D66
        for <linux-input@vger.kernel.org>; Wed, 19 Apr 2023 07:38:31 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54fbee98814so1375387b3.8
        for <linux-input@vger.kernel.org>; Wed, 19 Apr 2023 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681915109; x=1684507109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilxu6Q/jc5aOhDRIt3j6AWcNhm/qlHFPZW+HtjiMVA4=;
        b=Y4Dwi9Qjd7z55btxkOVIzDbrweoWBrZC0tXJKFLazw/HJwdo2SrulBS23eyI1GNc0Y
         vtkcBEBX01QiRtQrv3nvwelmqLNUCSDxDLr9X75fQEaJ3JhNV3WH7C8F6/DXNEhw95cu
         DXpqLmUHa+yl73oQMUtUrbaY+fHJf9vYv7nLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915109; x=1684507109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilxu6Q/jc5aOhDRIt3j6AWcNhm/qlHFPZW+HtjiMVA4=;
        b=VZd3Su8EdQMrpzpZ0v6uUprCJEkinoGMq/vFNnuRjKCPhXmhgzVh90zgI+5l3jXTtA
         4AtC43AP2WgF8EriGkNM9hCTdBRSkk2fBKtL4/MFeBD0y1hhL9jxl3nY6jdgvCiT0qdP
         HQiKQA2mzsmZPtDUH9wsCx9/KbcUbZMNKH1ExWOwLDEfhYVsKRdOpi9lJbHT51qFg1PN
         DUEW0k+MGHlmhJ9lgkKznFYb0Fx7s1ohV/YSGUosxyueb1rhUTllHMqtjGqJVoCpt+NX
         33d6RB2CcrOQS+hO0XA5wkirwbHQvI1q7acLfvd6pFHbR+m/7gUMp6+Y7joT3MxjGU3c
         R4xg==
X-Gm-Message-State: AAQBX9dOgObaSsVj6Qhh82uahd3gVXCcaau48GWH1XLDJbPj6fOgR3xr
        x8RnjcS92lFByEVNE5t9b6BD1E2YgOoYM60zU12Jiw==
X-Google-Smtp-Source: AKy350bjR7iXKtPsh6K0+3cfX783rMukDG/DK0epij/OkNpYc7FK/rQDwEVwpIZzOc9Wo8ZCPRBo8Q==
X-Received: by 2002:a81:83cb:0:b0:54f:e4d8:f4a6 with SMTP id t194-20020a8183cb000000b0054fe4d8f4a6mr3239734ywf.42.1681915108287;
        Wed, 19 Apr 2023 07:38:28 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v132-20020a81488a000000b0054fa99bed5asm4499255ywa.129.2023.04.19.07.38.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 07:38:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id b10so3972240ybk.9
        for <linux-input@vger.kernel.org>; Wed, 19 Apr 2023 07:38:26 -0700 (PDT)
X-Received: by 2002:a25:7687:0:b0:b96:7676:db4a with SMTP id
 r129-20020a257687000000b00b967676db4amr16246ybc.0.1681915105828; Wed, 19 Apr
 2023 07:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
In-Reply-To: <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 Apr 2023 07:38:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
Message-ID: <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To:     Fei Shao <fshao@chromium.org>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Apr 19, 2023 at 3:44=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi Jeff,
>
> On Wed, Apr 19, 2023 at 8:21=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> w=
rote:
> >
> > Hi Fei,
> >
> > On Tue, Apr 18, 2023 at 08:49:51PM +0800, Fei Shao wrote:
> > > We observed that on Chromebook device Steelix, if Goodix GT7375P
> > > touchscreen is powered in suspend (because, for example, it connects =
to
> > > an always-on regulator) and with the reset GPIO asserted, it will
> > > introduce about 14mW power leakage.
> > >
> > > This property is used to indicate that the touchscreen is powered in
> > > suspend. If it's set, the driver will stop asserting the reset GPIO i=
n
> > > power-down, and it will do it in power-up instead to ensure that the
> > > state is always reset after resuming.
> > >
> > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > ---
> >
> > This is an interesting problem; were you able to root-cause why the sil=
icon
> > exhibits this behavior? Simply asserting reset should not cause it to d=
raw
> > additional power, let alone 14 mW. This almost sounds like a back-power=
ing
> > problem during suspend.
> >
> There was a fix for this behavior before so I didn't dig into it on
> the silicon side.
> I can ask internally and see if we can have Goodix to confirm this is
> a known HW erratum.

Certainly it doesn't hurt to check, but it's not really that shocking
to me that asserting reset could cause a power draw on some hardware.
Reset puts hardware into a default state and that's not necessarily
low power. I guess ideally hardware would act like it's "off" when
reset is asserted and then then init to the default state on the edge
as reset was deasserted, but I not all hardware is designed in an
ideal way.


> > If this is truly expected behavior, is it sufficient to use the always_=
on
> > constraint of the relevant regulator(s) to make this decision as oppose=
d to
> > introducing a new property?
> >
> That sounds good to me. IIUC, for the existing designs, the boards
> that would set this property would also exclusively set
> `regulator-always-on` in their supply, so that should suffice.
> Let me revise the patch. Thanks!

Yeah, I thought about this too and talked about it in my original
reply. It doesn't handle the shared-rail case, but then again neither
does ${SUBJECT} patch. ...then I guess the only argument against it is
my argument that the regulator could be marked "always-on" in the
device tree but still turned off by an external entity (PMIC or EC) in
S3. In theory this should be specified by
"regulator-state-(standby|mem|disk)", but I could believe it being
tricky to figure out (what if a parent regulator gets turned off
automatically but the child isn't explicit?). Specifically, if a
regulator is always-on but somehow gets shut off in suspend then we
_do_ want to assert reset (active low) during suspend, otherwise we'll
have a power leak through the reset GPIO... :-P

...so I guess I'll continue to assert that I don't think peeking at
the regulator's "always-on" property is the best way to go. If
everyone else disagrees with me then I won't stand in the way, but IMO
the extra property like Fei's patch adds is better.

[1] https://lore.kernel.org/r/CAD=3DFV=3DV8ZN3969RrPu2-zZYoEE=3DLDxpi8K_E8E=
ziiDpGOSsq1w@mail.gmail.com
