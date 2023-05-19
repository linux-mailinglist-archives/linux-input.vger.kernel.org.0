Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1D97098E5
	for <lists+linux-input@lfdr.de>; Fri, 19 May 2023 16:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjESOCQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 May 2023 10:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbjESOCP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 May 2023 10:02:15 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DBE13A
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 07:02:14 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-25355609a04so2277961a91.0
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684504933; x=1687096933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCA4W0aVo+e8OjY3tSgSqtBniuKM9TjrVDSu+ILRZQc=;
        b=Bg9nRp05HKSac059eWYprVr6lJ/+b0B+UILS05+xSInpAngdcPodsSEj/zMxV7V7XX
         dKI8YlYKriVfCArinytzG5AJlCuDfAGfGol1lsOXK72Zsizu8Dip08IXvSAlMtnWdp1c
         fJTuUAO9RIuyWOd7y/FXnVyWnVKHsrsdMVNS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684504933; x=1687096933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCA4W0aVo+e8OjY3tSgSqtBniuKM9TjrVDSu+ILRZQc=;
        b=SfBMaqTVVtBvlkUrOLEGN6QfUgDgN5QXtVSHj9NSG0HSF2rNkgqpAnAy7DV9LUD5Qz
         3LUtwm55FzWZhj7VsRLg/2SWU70Iy+XIrQNonTucfyJDa3UmX1hK1bQCWmFOMF2W5aBO
         D6nB2eG+YRmbXjvEQOYhpT2VsXUget0hqlyx9bY9TfUOHknFUo2FvLQ9FCGZOjEVTCsm
         9kBdcp19S365QfVOUHbB1mSqflm01j5BY+IAm2HUY3nDH6oiuhHT0F4MrWtA9IR+SHFn
         pReSkDPZ5dLfpODJWueTI66qx8mVG7GXXQxx9Bp7IZOpHR1DUS3bK4k8RSa80yeBclCw
         fhxA==
X-Gm-Message-State: AC+VfDwp6n78n/sRe16SwrzoG77Wg7/r8jjMSpFxHVT26LYYOEddn4jl
        qfYY5/EKOngwxNN0uZtOn0tYlwAXsan6ed/ZRhU=
X-Google-Smtp-Source: ACHHUZ4Wwv4TLcPQD6tPDxtfhai117S7z89Wrkt2OQSH0nhhrAHXtJXYuNO9uj3PZs67j7VMZhT/Bw==
X-Received: by 2002:a17:90a:fa8f:b0:24e:3b69:a87f with SMTP id cu15-20020a17090afa8f00b0024e3b69a87fmr2316079pjb.25.1684504933116;
        Fri, 19 May 2023 07:02:13 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id hi2-20020a17090b30c200b0025023726fc4sm1506229pjb.26.2023.05.19.07.02.09
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:02:09 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ae64580e9fso114675ad.1
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 07:02:09 -0700 (PDT)
X-Received: by 2002:a17:902:cec6:b0:1a9:343c:76e5 with SMTP id
 d6-20020a170902cec600b001a9343c76e5mr199210plg.18.1684504928906; Fri, 19 May
 2023 07:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230519090149.4407-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230519090149.4407-1-yangcong5@huaqin.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 19 May 2023 07:01:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
Message-ID: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: goodix: Add ili9882t timing
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, mka@chromium.org,
        dmitry.torokhov@gmail.com, hsinyi@google.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
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

On Fri, May 19, 2023 at 2:02=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The ili9882t is a TDDI IC ((Touch with Display Driver)). It requires the
> panel reset gpio to be high before i2c commands. Use a longer delay in
> post_power_delay_ms to ensure the poweron sequence.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Two comments:

1. You need to submit a bindings patch to document your
"ilitek,ili9882t" compatible string.

2. I would tend to add the support to the "i2c-hid-of-elan.c" driver
instead of the goodix one. Probably the drivers need to combined again
(I'll see if I can post a patch for that before too long), but if I
were picking one I'd pick the elan one, I think.

-Doug
