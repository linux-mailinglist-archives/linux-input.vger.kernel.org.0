Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3F7623E5
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 22:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjGYUtc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 16:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGYUtb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 16:49:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62B61B0
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:49:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9936b3d0286so1028102566b.0
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690318168; x=1690922968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDQQ0x4yX7qC7HV6JyhQDa1Oq53Li9ajB2nF2Gu9ICA=;
        b=ofoCl0Nr0jtUcFZFZhlffepQM7cvST1kRKwh2E4SYoXm1IHgo6aaq8l8Tb20DHNK7K
         9rOZ+hpCctbvZ2IJxIP9inqRz2jtCCzU0Gl0Yzqijl7bGPFmGMZzPA2EJHgomxZ29HfX
         5fDMFqnc3QxSwsAP3LzrcKJMS2OvCq6TKJBsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690318168; x=1690922968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDQQ0x4yX7qC7HV6JyhQDa1Oq53Li9ajB2nF2Gu9ICA=;
        b=BLkP1DyewB+Xvnl4zkvRwX734+4jOItoCgL0PK7cN3h5ZZtl5+IJA9XpEVqA9JUB7O
         f29F3oe0GbeJPrDMzZ5fO7OMpFxLefVyyfDFNzJrWYczuvEyrROGmQHcQmxWae2obz9E
         C5XgLiwqwmMd3ojGs4d0e/JKofhgDJwMIbzoTG6HUpZI3Fm3FJdwxj9L0yfqgcsZm8U4
         EwN2Ndjxngjau0mpsV2aEfJZHD2RhEJtWezkK7uhLih22TgsLZgwmUCEk02yZk22gEzw
         0n1qI1lX3TRgf8JD4gm7NU/Fc35jl0y5ZmSPLv+pvhYgQTXUHM7ukIqNZ3bCMdGbwGRH
         s2uw==
X-Gm-Message-State: ABy/qLY9soPD5XaCgygyLOABHBXw+RmIfaXWifCvQT4ym5BiBvOKsGxU
        4TgCzYSJa7LOGcMxuQH10H48+nBQ0EUSMbOnbfF2GYjo
X-Google-Smtp-Source: APBJJlECX3Xtx2OwM99r+66NOI5nipvUOKy9nmoXc8l4na+Bh4y8R0p4Gq+/+wBZkrn7iQkemcEF+Q==
X-Received: by 2002:a17:906:cc11:b0:993:e2ba:55a2 with SMTP id ml17-20020a170906cc1100b00993e2ba55a2mr760ejb.19.1690318167963;
        Tue, 25 Jul 2023 13:49:27 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id s6-20020a170906960600b0098cf565d98asm8595403ejx.22.2023.07.25.13.49.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 13:49:27 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so807a12.1
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:49:27 -0700 (PDT)
X-Received: by 2002:a50:ccc4:0:b0:521:d274:fc81 with SMTP id
 b4-20020a50ccc4000000b00521d274fc81mr183614edj.2.1690317674563; Tue, 25 Jul
 2023 13:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
 <CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com> <CAD=FV=UUdc5xi-HoOye-a1Oki3brcX3V1+=zuxQKLAcrd3iTSA@mail.gmail.com>
In-Reply-To: <CAD=FV=UUdc5xi-HoOye-a1Oki3brcX3V1+=zuxQKLAcrd3iTSA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 13:41:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmpH6cB0oZOxbL+TUxjLRf3PM+kKvuYRAZSiEhS4o37A@mail.gmail.com>
Message-ID: <CAD=FV=WmpH6cB0oZOxbL+TUxjLRf3PM+kKvuYRAZSiEhS4o37A@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
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
        dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>
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

On Mon, Jul 17, 2023 at 11:15=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Benjamin,
>
> On Mon, Jun 26, 2023 at 3:49=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Benjamin,
> >
> > On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > > +static const struct drm_panel_follower_funcs i2c_hid_core_panel_fo=
llower_funcs =3D {
> > > > +     .panel_prepared =3D i2c_hid_core_panel_prepared,
> > > > +     .panel_unpreparing =3D i2c_hid_core_panel_unpreparing,
> > > > +};
> > >
> > > Can we make that above block at least behind a Kconfig?
> > >
> > > i2c-hid is often used for touchpads, and the notion of drm panel has
> > > nothing to do with them. So I'd be more confident if we could disable
> > > that code if not required.
> >
> > Now that other concerns are addressed, I started trying to write up a
> > v3 and I found myself writing this as the description of the Kconfig
> > entry:
> >
> > --
> > config I2C_HID_SUPPORT_PANEL_FOLLOWER
> > bool "Support i2c-hid devices that must be power sequenced with a panel=
"
> >
> > Say Y here if you want support for i2c-hid devices that need to
> > coordinate power sequencing with a panel. This is typically important
> > when you have a panel and a touchscreen that share power rails or
> > reset GPIOs. If you say N here then the kernel will not try to honor
> > any shared power sequencing for your hardware. In the best case,
> > ignoring power sequencing when it's needed will draw extra power. In
> > the worst case this will prevent your hardware from functioning or
> > could even damage your hardware.
> >
> > If unsure, say Y.
> >
> > --
> >
> > I can certainly go that way, but I just wanted to truly make sure
> > that's what we want. Specifically:
> >
> > 1. If we put the panel follower code behind a Kconfig then we actually
> > have no idea if a touchscreen was intended to be a panel follower.
> > Specifically the panel follower API is the one that detects the
> > connection between the panel and the i2c-hid device, so without being
> > able to call the panel follower API we have no idea that an i2c-hid
> > device was supposed to be a panel follower.
> >
> > 2. It is conceivable that power sequencing a device incorrectly could
> > truly cause hardware damage.
> >
> > Together, those points mean that if you turn off the Kconfig entry and
> > then try to boot on a device that needed that Kconfig setting that you
> > might damage hardware. I can code it up that way if you want, but it
> > worries me...
> >
> >
> > Alternatives that I can think of:
> >
> > a) I could change the panel follower API so that panel followers are
> > in charge of detecting the panel that they follow. Today, that looks
> > like:
> >
> >        panel_np =3D of_parse_phandle(dev->of_node, "panel", 0);
> >        if (panel_np)
> >                /* It's a panel follower */
> >        of_node_put(panel_np);
> >
> > ...so we could put that code in each touchscreen driver and then fail
> > to probe i2c-hid if we detect that we're supposed to be a panel
> > follower but the Kconfig is turned off. The above doesn't seem
> > massively ideal since it duplicates code. Also, one reason why I put
> > that code in drm_panel_add_follower() is that I think this concept
> > will eventually be needed even for non-DT cases. I don't know how to
> > write the non-DT code right now, though...
> >
> >
> > b) I could open-code detect the panel follower case but leave the
> > actual linking to the panel follower API. AKA add to i2c-hid:
> >
> >        if (of_property_read_bool(dev->of_node, "panel"))
> >                /* It's a panel follower */
> >
> > ...that's a smaller bit of code, but feels like an abstraction
> > violation. It also would need to be updated if/when we added support
> > for non-DT panel followers.
> >
> >
> > c) I could add a "static inline" implementation of b) to "drm_panel.h".
> >
> > That sounds great and I started doing it. ...but then realized that it
> > means adding to drm_panel.h:
> >
> > #include <linux/device.h>
> > #include <linux/of.h>
> >
> > ...because otherwise of_property_read_bool() isn't defined and "struct
> > device" can't be dereferenced. That might be OK, but it looks as if
> > folks have been working hard to avoid things like this in header
> > files. Presumably it would get uglier if/when we added the non-DT
> > case, as well. That being said, I can give it a shot...
> >
> > --
> >
> > At this point, I'm hoping for some advice. How important is it for you
> > to have a Kconfig for "I2C_HID_SUPPORT_PANEL_FOLLOWER"?
> >
> > NOTE: even if I don't add the Kconfig, I could at least create a
> > function for registering the panel follower that would get most of the
> > panel follower logic out of the probe function. Would that be enough?
>
> I'd love to send a new version of this patch series, but I'm still
> stuck with the above issue. I'm hoping you might have a minute to
> provide your thoughts. If I don't hear anything, I'll try a v3 where I
> don't have the Kconfig for "I2C_HID_SUPPORT_PANEL_FOLLOWER" but just
> try to pull a little more of the code out of the probe function.

To provide breadcrumbs, I posted the v3 which pulls a bit more code
out of the probe function but is otherwise largely unchanged. The
cover letter for v3 can be found at:

https://lore.kernel.org/r/20230725203545.2260506-1-dianders@chromium.org/
