Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6678376733A
	for <lists+linux-input@lfdr.de>; Fri, 28 Jul 2023 19:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjG1RY7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Jul 2023 13:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjG1RY6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Jul 2023 13:24:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24243A97
        for <linux-input@vger.kernel.org>; Fri, 28 Jul 2023 10:24:53 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9936b3d0286so339857966b.0
        for <linux-input@vger.kernel.org>; Fri, 28 Jul 2023 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690565092; x=1691169892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OksjTSbasaKDlLBRiSbrJQqC1q20sr1fdGQKMyKb9RQ=;
        b=ioM7av1YzBaFvfjIOPF/f2zM1OSDbDtHwJBng+JaV3GrX8NcGb39/dabdNWrq1XyrR
         Y4Ex/6wFZL21InBLOLzmmb6ATsrs5s1cfyqmE4MY8MAdNypLB0nDvVs7DRepi9KvJc61
         mod6RIUS8zYoTctpxzT2aoNAVqUm409uFPR/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690565092; x=1691169892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OksjTSbasaKDlLBRiSbrJQqC1q20sr1fdGQKMyKb9RQ=;
        b=YIDJr+D6vNfTg1mUu77t0bLGzwxlo4aw7xm8tE8f4XV6wCDE+UU5hMPv27dcG6uHo/
         dg7ywzgq0CIiae/dF02/lXH8h9U09b221gmSmo7N1oRdZBee9Ere4JL2O4FUKl4iyLL0
         d6VwnSuA5veGI3jo62Wj1R2BDMDTYJYSWMywSaonQE45VgtXWnxl6uCBGhWyf3tJ3K53
         rGtSXyi6Mk6TastL5gO2mNVQ5CP/1UoULr3fnvLDaeCnv9vOBOvhWAA6VnoErYIB7YwY
         Mstzz1w3TvC+lhrhflPbQrMiwU7kR/iOXhHDSz0N+g297EaoGScle62oQj95QhbauITK
         wDtQ==
X-Gm-Message-State: ABy/qLYVA7coUG0x0YC/9Xvkua4e5LBT5jUBiFx5/2EiPZUWbeLjZtq7
        H56CApXRO6/tum6Jhfj5Z2FNG6UClwyAivjQGwq7Bg==
X-Google-Smtp-Source: APBJJlE58akUFCBNBS4u4aCs1/bw7zgsSPOvirsFWZ8MAo04XnASpJGZxkfu93g7tFsz/r40sOzFxw==
X-Received: by 2002:a17:906:5dc1:b0:99b:65fa:fc2b with SMTP id p1-20020a1709065dc100b0099b65fafc2bmr21818ejv.35.1690565091988;
        Fri, 28 Jul 2023 10:24:51 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id q24-20020a17090622d800b0098d2f703408sm2244004eja.118.2023.07.28.10.24.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 10:24:51 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe0e132352so5335e9.0
        for <linux-input@vger.kernel.org>; Fri, 28 Jul 2023 10:24:51 -0700 (PDT)
X-Received: by 2002:a05:600c:690f:b0:3fd:e15:41e3 with SMTP id
 fo15-20020a05600c690f00b003fd0e1541e3mr5980wmb.2.1690565071086; Fri, 28 Jul
 2023 10:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230727171750.633410-1-dianders@chromium.org> <nn6cs4zvf27cxmtd3qcficyoyalcxi2iry6kgszb5oraplgaxy@sryeyseucdb3>
In-Reply-To: <nn6cs4zvf27cxmtd3qcficyoyalcxi2iry6kgszb5oraplgaxy@sryeyseucdb3>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 28 Jul 2023 10:24:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wo5H-XohCz_sLnV=oT5cRm2tFrSAG9kpCGzK7pjSW_Xg@mail.gmail.com>
Message-ID: <CAD=FV=Wo5H-XohCz_sLnV=oT5cRm2tFrSAG9kpCGzK7pjSW_Xg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Fri, Jul 28, 2023 at 8:31=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> On Jul 27 2023, Douglas Anderson wrote:
> >
> > The big motivation for this patch series is mostly described in the pat=
ch
> > ("drm/panel: Add a way for other devices to follow panel state"), but t=
o
> > quickly summarize here: for touchscreens that are connected to a panel =
we
> > need the ability to power sequence the two device together. This is not=
 a
> > new need, but so far we've managed to get by through a combination of
> > inefficiency, added costs, or perhaps just a little bit of brokenness.
> > It's time to do better. This patch series allows us to do better.
> >
> > Assuming that people think this patch series looks OK, we'll have to
> > figure out the right way to land it. The panel patches and i2c-hid
> > patches will go through very different trees and so either we'll need
> > an Ack from one side or the other or someone to create a tag for the
> > other tree to pull in. This will _probably_ require the true drm-misc
> > maintainers to get involved, not a lowly committer. ;-)
> >
> > Version 4 of this series adds a new patch that suspends i2c-hid
> > devices at remove time even for non panel-followers to make things
> > consistent. It also attempts to isolate the panel follower code a bit
> > more as per Benjamin's feedback on v3 and adds an item to the DRM todo
> > list as per Maxime's request. As per Maxime's response to my v3 cover
> > letter, I added his Reviewed-by tag to all 10 patches that were part
> > of v3 (but left it off of the new i2c-hid patch in v4).
> >
> > Version 3 of this series was a long time coming after v2. Maxime and I
> > had a very long discussion trying to figure out if there was a beter
> > way and in the end we didn't find one so he was OK with the series in
> > general [1]. After that got resolved, I tried to resolve Benjamin's
> > feedback but got stuck [2]. Eventually I made my best guess. The end
> > result was a v3 that wasn't that different from v2 but that had a tiny
> > bit more code split out.
> >
> > Version 2 of this patch series didn't change too much. At a high level:
> > * I added all the forgotten "static" to functions.
> > * I've hopefully made the bindings better.
> > * I've integrated into fw_devlink.
> > * I cleaned up a few descriptions / comments.
> >
> > As far as I can tell, as of v4 everyone is on the same page that this
> > patch series looks like a reasonable solution to the problem and we
> > just need to get all the nits fixed and figure out how to land it.
>
> Thanks a lot for the new version. I like it much more on the HID side:
>
> for the HID part:
> Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
>
> I wouldn't mind having this series taken from the drm tree if that is
> easier. i2c-hid is a low patch rate driver, so having it updated through
> DRM should not be an issue.
>
> In that case:
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Thanks for your reviews and your help getting this whipped into shape.

Lading through drm makes sense to me. I'm a drm committer, so with
your Ack I believe it should be fine for me to land the series (minus
the dts) in drm-misc-next. This series has been around for a while,
has been reviewed by relevant folks, and the last few changes haven't
fundamentally changed anything about the design, so I'm not going to
twiddle my thumbs too long. That being said, I'll still plan to wait
until early next week (Tuesday?) before landing to allow for any last
minute shouts.

Given how drm-misc works [1] and the fact that mainline is currently
at v6.5-rc3 (it will be -rc4 when I land it), I'd expect that these
commits will find their way into v6.6.

[1] https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
