Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E11570DD80
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 15:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236828AbjEWNcx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 09:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236815AbjEWNct (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 09:32:49 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF6CFD
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 06:32:47 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-76c75d32005so102459239f.1
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684848766; x=1687440766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO7uVfTZIwTK5eWidHNY3IE4aDCiaYIaf7Mtd0r6B0Y=;
        b=MhO0DJg/9HzO/B+nUIvHT52iFW5rA+8AxaylbwPKti1Wc0Ij0daryX7DEVxk30nRLA
         UILtaQ9VszoRh4OUZjg7cmL/8elE6ViN0cdPoDdfzY8KNI9y6nJcI2t0g3pN9BkaMb6h
         Oh+Lv2sDTW/SkX8kD26egOO0B4SVNYdLSiyRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848766; x=1687440766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO7uVfTZIwTK5eWidHNY3IE4aDCiaYIaf7Mtd0r6B0Y=;
        b=DBRg0mpSSep2hm2g1MPNhfmouaA8uEz7Ls6JD2YEFxntyJaoPPZNAn5ypR4jfjpPE8
         sQnUAY0BO8VAtLGLBeonpSeKprTiaRR0LUFF+iQI1I7q3RbOAWdZoKYBmAuBDkY2sRQa
         Mof4kZaXnQevv+pF2E2SKo61+z6Vx/tFPT07XXuoH6eeuxtV30/YI/Or8DrlAGxykOXX
         QFGyGwJbfkQIDRx/3zjAWGEy0+l69/lnOmpoGtLuHddDa7zVGrVUz/p+NiYz+86067ax
         04wrkW3TnyMK8MyS3ClWEMd5WufrmHQRLVFPcgz/DiQ0GkIJJuXTIfHnIPoF1r9Thn6i
         tMqA==
X-Gm-Message-State: AC+VfDzMX3jKtTtuuRve1e9RajQgzuC5wrx/ngVFIBhjLSDQyKHrj7Jv
        p03sDv3NFLtU5D+bztj7F6/4OXU6W47QeTfFb6U=
X-Google-Smtp-Source: ACHHUZ5vKkWQAyoQGkGpkL7xhXXHwEK3mQbUxemZ4AFH86l7jBgHmylhziok9tZ2q1GkLkmd84e9xQ==
X-Received: by 2002:a92:c051:0:b0:331:1c97:f679 with SMTP id o17-20020a92c051000000b003311c97f679mr8989012ilf.10.1684848765913;
        Tue, 23 May 2023 06:32:45 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id p34-20020a056638192200b00411baa5ec5asm2446756jal.154.2023.05.23.06.32.42
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 06:32:42 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-335d6260e9bso130145ab.1
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 06:32:42 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d0f:b0:329:333e:4e79 with SMTP id
 i15-20020a056e021d0f00b00329333e4e79mr252495ila.1.1684848762023; Tue, 23 May
 2023 06:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230427035656.1962698-1-fshao@chromium.org> <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
 <nycvar.YFH.7.76.2305231510270.29760@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2305231510270.29760@cbobk.fhfr.pm>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 May 2023 06:32:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UyEw5xViGreQb6+cLNLrMcT27ts5P87aR=FEYWNOBM_w@mail.gmail.com>
Message-ID: <CAD=FV=UyEw5xViGreQb6+cLNLrMcT27ts5P87aR=FEYWNOBM_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Fei Shao <fshao@chromium.org>, Jeff LaBundy <jeff@labundy.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, May 23, 2023 at 6:11=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Fri, 19 May 2023, Doug Anderson wrote:
>
> > > These changes are based on the series in [1], which modified the
> > > i2c-hid-of-goodix driver and removed the workaround for a power leaka=
ge
> > > issue, so the issue revisits on Mediatek MT8186 boards (Steelix).
> > >
> > > The root cause is that the touchscreen can be powered in different wa=
ys
> > > depending on the hardware designs, and it's not as easy to come up wi=
th
> > > a solution that is both simple and elegant for all the known designs.
> > >
> > > To address the issue, I ended up adding a new boolean property for th=
e
> > > driver so that we can control the power up/down sequence depending on
> > > that.
> > >
> > > Adding a new property might not be the cleanest approach for this, bu=
t
> > > at least the intention would be easy enough to understand, and it
> > > introduces relatively small change to the code and fully preserves th=
e
> > > original control flow.
> > > I hope this is something acceptable, and I'm open to any better
> > > approaches.
> > >
> > > [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chro=
mium.org/
> > >
> > > Changes in v4:
> > > - Minor coding style improvement
> > >
> > > Changes in v3:
> > > - In power-down, only skip the GPIO but not the regulator calls if th=
e
> > >   flag is set
> > >
> > > Changes in v2:
> > > - Use a more accurate property name and with "goodix," prefix.
> > > - Do not change the regulator_enable logic during power-up.
> > >
> > > Fei Shao (2):
> > >   dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
> > >     property
> > >   HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspe=
nd"
> > >     property
> > >
> > >  .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
> > >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 ++++++++++++++=
+-
> > >  2 files changed, 24 insertions(+), 1 deletion(-)
> >
> > Just double-checking if there is any work needed on this series. I
> > think it's ready to land but I wanted to double-check.
>
> I don't think I've been CCed on the dt-binding part (patch 1/2 I guess).
> Has it been Acked? If so, I will happily take it through hid.git, but
> please send it my way.

Yeah, Rob Acked it:

https://lore.kernel.org/r/168261692866.3205353.5077242811275926416.robh@ker=
nel.org/

Fei: can you repost the series with collected tags and make sure to CC Jiri=
?

Thanks!

-Doug
