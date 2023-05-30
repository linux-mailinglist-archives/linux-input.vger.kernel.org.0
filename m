Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36412716A38
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 18:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbjE3Q6a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 12:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbjE3Q6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 12:58:22 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EA6FE
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 09:58:18 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-397f13944f2so3190599b6e.0
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685465897; x=1688057897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQLTtDtW2MQvZzbg1+YtroMwuASMRT+NGV7h3iEinfc=;
        b=KPpV7KIHiRgRhCfSurWnefrgFdQCOOriY0eGtUYd/Ws3Zuuzj8nr0tetWLK4t52294
         zC4x6UXLkfWqQNoUTI4nMh9JIxDnk6iBcBO5ypSj5hda711h1cVNNg/8NrYqGhDNblY6
         64h/UMnQC7+tpxQA42y6DKoFmh2R7jw6wKPWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465897; x=1688057897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQLTtDtW2MQvZzbg1+YtroMwuASMRT+NGV7h3iEinfc=;
        b=WmORPFxpJvQKwsVzInIFg7DXLwf9noCZYJjXxIZZyztLXbh2113XlfQeBtF7kqXh+c
         ecOLsodll5tM5b+OHFKTcNkMyejVlvUmyHQji+kHsgppqRRQWyRS0N1cyP2Wbkw0JchJ
         DSXby/E2tgbfXbz2YI7FUMSwTr38NJIHpLA5037bkymk2GvzrlA/Fidd3QrUOSMwAJqI
         2S38DSoXrl77GknR7Qcf9YhQ+viznB9iWhYuksYFd4c6ZWmuqXp36rzQWCXZgfDajYqD
         kW5i/GwQHQZlIz2Lqu2laeDBgzorglZYU/rB+ETeQbJyuBVctJpe6MboNWsRlTy1vYkR
         arFQ==
X-Gm-Message-State: AC+VfDyDh1OfjcWpqLSUeHypF/Sb2jKPQYBHep6LwKf8Sy5u4KN2GsWD
        9Lc1wZZwGIzeCq+y2ONXn1WWtZ/EA4K/kcAcQ38=
X-Google-Smtp-Source: ACHHUZ6wuCyna8Zd52txRCV6SXmAXpW7Yv9f5w+CMBxHE5Pws5O/yqTzShmqNG6iN4lOxBgWZBrV/A==
X-Received: by 2002:a05:6808:1b0b:b0:396:3b9d:7ee0 with SMTP id bx11-20020a0568081b0b00b003963b9d7ee0mr1717418oib.41.1685465896808;
        Tue, 30 May 2023 09:58:16 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id z36-20020a0293a7000000b00418af04e405sm801963jah.116.2023.05.30.09.58.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 09:58:14 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-33baee0235cso3205ab.1
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 09:58:14 -0700 (PDT)
X-Received: by 2002:a05:6e02:b24:b0:338:9f6a:d546 with SMTP id
 e4-20020a056e020b2400b003389f6ad546mr181095ilu.20.1685465893122; Tue, 30 May
 2023 09:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
 <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com>
 <20230520050649.2494497-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Wm_SK0V6WJUkuvu8yFfiP60JBuOdw9cy=0Ck2Jbn-X2A@mail.gmail.com> <bd19f71b-59ee-80e7-9ff1-1cc26ecc49a7@kernel.org>
In-Reply-To: <bd19f71b-59ee-80e7-9ff1-1cc26ecc49a7@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 May 2023 09:58:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaVXUr8=4MrZQgA7t=yUBDt-iMvOFSeWhsKZ8XHJAREA@mail.gmail.com>
Message-ID: <CAD=FV=WaVXUr8=4MrZQgA7t=yUBDt-iMvOFSeWhsKZ8XHJAREA@mail.gmail.com>
Subject: Re: [v2 2/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, hsinyi@google.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, May 30, 2023 at 4:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/05/2023 17:33, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 19, 2023 at 10:07=E2=80=AFPM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> >>
> >> Add an ilitek touch screen chip ili9882t.
> >>
> >> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> >> ---
> >>  .../devicetree/bindings/input/elan,ekth6915.yaml         | 9 +++++++-=
-
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > I'm curious about the DT maintainers opinion here. Should this be a
> > new bindings file, or should it be together in the elan file. If
> > nothing else, I think the secondary voltage rail name is wrong. I took
> > a quick peek at a datasheet I found and I don't even see a 3.3V rail
> > going to the ili9882t. That makes it weird to reuse "vcc33-supply" for
> > a second supply...
>
> It's easier if they are CCed...

Crud. I just assumed and didn't check the CC list. Cong: can you
resend and make sure you're CCing the people that get_maintainers
points at. One way to find that would be:

./scripts/get_maintainer.pl -f
Documentation/devicetree/bindings/input/elan,ekth6915.yaml
