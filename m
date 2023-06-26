Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBFA73EECA
	for <lists+linux-input@lfdr.de>; Tue, 27 Jun 2023 00:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjFZWt4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 18:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjFZWty (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 18:49:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B2312B
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 15:49:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98e011f45ffso241761566b.3
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687819790; x=1690411790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dAnLf/XZMv1d7lTmYjxhUjdD/xdtixhtUmJbq4ft4k=;
        b=dDw+eX6K/vh8b0HbBx4l/X0kgljdOf7QO1SSibMe9aq5R+Ge1Rwu2qC7VSwWNMI1/5
         j8PVEqJS+OB3B9ZoPant2S2fqjOVAudbX1xTy8gIPBFnxLHVCrXvurxeydRVImddVVlL
         DPYN9CZW2zjTxIeUEqxW8ioD3WDEtIKSGjzwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687819790; x=1690411790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dAnLf/XZMv1d7lTmYjxhUjdD/xdtixhtUmJbq4ft4k=;
        b=TWE7J1EjfKuiGP5siA12PRGX/SRZ+hKqo2L9nwY4WXOT1QiFE8BPUHcr/hQoY6QR4/
         cp3Jl3h9lqepbtWYSufOXKlpFQ2ryS/yyenIiKNN5zCywVhPxjdHOUh3J9e2xpIS48Go
         T6i/5xO5GHT/7QH3FjEY09U1UtzVNRA1zDsjQF8wBN2/8HLuVLVuqrrb6Wa9ExT1rdPs
         niYBNuDku6peb99JDnO7ldvTCDK7kWQsJXd6MMMiDn/cbjE9Q6oSDCmCAzfIlTuYU9nb
         KLaJ2K3N4T62B+k3V8JkPHCgfE7QglB1lGfa87oUnmGow396/gr2SwXMQoQoAUFugtlS
         gpMg==
X-Gm-Message-State: AC+VfDxzF7TkoAObSW288HdCZFdzARHbWh1azDOd0i7ItbkMXs2JdtOx
        g19McWJebSbXKLXUxnTKlthOHfbEpQTQIOy1n43pB90s
X-Google-Smtp-Source: ACHHUZ6hC2ttdOTzHorv0T84sxdb51T9sYhgc4MvzIf1ZUiOJlYhAPXEeq5uX7Cq3p6H1wHw1uj3jQ==
X-Received: by 2002:a17:906:d542:b0:982:7505:fafa with SMTP id cr2-20020a170906d54200b009827505fafamr23877691ejc.47.1687819789891;
        Mon, 26 Jun 2023 15:49:49 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b009894b476310sm3771089ejb.163.2023.06.26.15.49.47
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 15:49:48 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51d9372f027so3571a12.0
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 15:49:47 -0700 (PDT)
X-Received: by 2002:a50:9fa4:0:b0:51a:1f15:9ddc with SMTP id
 c33-20020a509fa4000000b0051a1f159ddcmr207492edf.6.1687819787201; Mon, 26 Jun
 2023 15:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid> <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
In-Reply-To: <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 26 Jun 2023 15:49:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com>
Message-ID: <CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Benjamin,

On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> > +static const struct drm_panel_follower_funcs i2c_hid_core_panel_follow=
er_funcs =3D {
> > +     .panel_prepared =3D i2c_hid_core_panel_prepared,
> > +     .panel_unpreparing =3D i2c_hid_core_panel_unpreparing,
> > +};
>
> Can we make that above block at least behind a Kconfig?
>
> i2c-hid is often used for touchpads, and the notion of drm panel has
> nothing to do with them. So I'd be more confident if we could disable
> that code if not required.

Now that other concerns are addressed, I started trying to write up a
v3 and I found myself writing this as the description of the Kconfig
entry:

--
config I2C_HID_SUPPORT_PANEL_FOLLOWER
bool "Support i2c-hid devices that must be power sequenced with a panel"

Say Y here if you want support for i2c-hid devices that need to
coordinate power sequencing with a panel. This is typically important
when you have a panel and a touchscreen that share power rails or
reset GPIOs. If you say N here then the kernel will not try to honor
any shared power sequencing for your hardware. In the best case,
ignoring power sequencing when it's needed will draw extra power. In
the worst case this will prevent your hardware from functioning or
could even damage your hardware.

If unsure, say Y.

--

I can certainly go that way, but I just wanted to truly make sure
that's what we want. Specifically:

1. If we put the panel follower code behind a Kconfig then we actually
have no idea if a touchscreen was intended to be a panel follower.
Specifically the panel follower API is the one that detects the
connection between the panel and the i2c-hid device, so without being
able to call the panel follower API we have no idea that an i2c-hid
device was supposed to be a panel follower.

2. It is conceivable that power sequencing a device incorrectly could
truly cause hardware damage.

Together, those points mean that if you turn off the Kconfig entry and
then try to boot on a device that needed that Kconfig setting that you
might damage hardware. I can code it up that way if you want, but it
worries me...


Alternatives that I can think of:

a) I could change the panel follower API so that panel followers are
in charge of detecting the panel that they follow. Today, that looks
like:

       panel_np =3D of_parse_phandle(dev->of_node, "panel", 0);
       if (panel_np)
               /* It's a panel follower */
       of_node_put(panel_np);

...so we could put that code in each touchscreen driver and then fail
to probe i2c-hid if we detect that we're supposed to be a panel
follower but the Kconfig is turned off. The above doesn't seem
massively ideal since it duplicates code. Also, one reason why I put
that code in drm_panel_add_follower() is that I think this concept
will eventually be needed even for non-DT cases. I don't know how to
write the non-DT code right now, though...


b) I could open-code detect the panel follower case but leave the
actual linking to the panel follower API. AKA add to i2c-hid:

       if (of_property_read_bool(dev->of_node, "panel"))
               /* It's a panel follower */

...that's a smaller bit of code, but feels like an abstraction
violation. It also would need to be updated if/when we added support
for non-DT panel followers.


c) I could add a "static inline" implementation of b) to "drm_panel.h".

That sounds great and I started doing it. ...but then realized that it
means adding to drm_panel.h:

#include <linux/device.h>
#include <linux/of.h>

...because otherwise of_property_read_bool() isn't defined and "struct
device" can't be dereferenced. That might be OK, but it looks as if
folks have been working hard to avoid things like this in header
files. Presumably it would get uglier if/when we added the non-DT
case, as well. That being said, I can give it a shot...

--

At this point, I'm hoping for some advice. How important is it for you
to have a Kconfig for "I2C_HID_SUPPORT_PANEL_FOLLOWER"?

NOTE: even if I don't add the Kconfig, I could at least create a
function for registering the panel follower that would get most of the
panel follower logic out of the probe function. Would that be enough?

Thanks!

-Doug
