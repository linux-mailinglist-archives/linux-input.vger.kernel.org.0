Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69487A4C8D
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 17:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjIRPg3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 11:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjIRPgL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 11:36:11 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DFD1981
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 08:31:56 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-404732a0700so46883735e9.0
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695050915; x=1695655715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuVncYfyknrhNj8AwebunR5CYwD24eRmeOt3k3Ppp84=;
        b=mxliXYd4VtEu5Yjfa+8tXUSUhgUYx9/tum8Ir1TIDu+xwaYHrKlFws1nI2V/iu8/jF
         SovZBGgMlbrpq8dCDgDGHuug6gWococKSWGQxWSwhBO4+BHy9cM1vxUm2nSDx703dU3D
         yPCgJfNT76QjDhI9GbBr4A+mjERPuGF4X3mBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050915; x=1695655715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuVncYfyknrhNj8AwebunR5CYwD24eRmeOt3k3Ppp84=;
        b=QkfMmdeRrl+xCz1kDeB3Ayw+TTgl+QiYK9eUMeexZMPzqqjL7XT1h/pkwvMzI2waI7
         c/ZPfhp4b6qae9uSS3RHzy1zMEdpteNxKi9va0KETpSde84+Mjt7/bK2oLdsV/99Ieut
         tfSfk/KxSNO7QMMbp5cmhc3WIzRFBic162KLzCgZ+yLmP9sXbwCQLoLPOY2QHZnIF/RN
         +OvaDedVOA1x2ce8bUlMy8NrupWGVXQEZbP1WnCdWDeZtQX120awEVgHEdJEuIxX5dY8
         t63pI2rK7LhpIqmr97p/ZjF5GLYQ0C5HntRJ+FB7Ty//SgtWxFhCvZvo26BWETWNNLpu
         LbAA==
X-Gm-Message-State: AOJu0Yzm1Vc1n5cFP85tBnGosMVTBcZPsljbhrJLwCFubli5QIgJOaIV
        WC5PKGAfIjqAzJazMCBJptVKx6uXBmPz4Zeb364t2Q==
X-Google-Smtp-Source: AGHT+IEHQaDLaVmaPL06ut+3GeYg5ahAFtr//Wk0BDMxfQQ9WEK79KgXINitf6xGLqnBzPyGe6uhCg==
X-Received: by 2002:a17:907:7751:b0:9ad:891a:25a8 with SMTP id kx17-20020a170907775100b009ad891a25a8mr7786106ejc.52.1695049233976;
        Mon, 18 Sep 2023 08:00:33 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b0099bd453357esm6542666ejb.41.2023.09.18.08.00.33
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 08:00:33 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4047c6ec21dso112595e9.0
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 08:00:33 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8b:b0:404:7462:1f87 with SMTP id
 n11-20020a05600c3b8b00b0040474621f87mr191074wms.6.1695049231656; Mon, 18 Sep
 2023 08:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230918125851.310-1-johan+linaro@kernel.org>
In-Reply-To: <20230918125851.310-1-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 Sep 2023 08:00:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
Message-ID: <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: fix handling of unpopulated devices
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LinusW <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Sep 18, 2023 at 6:00=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> A recent commit reordered probe so that the interrupt line is now
> requested before making sure that the device exists.
>
> This breaks machines like the Lenovo ThinkPad X13s which rely on the
> HID driver to probe second-source devices and only register the variant
> that is actually populated. Specifically, the interrupt line may now
> already be (temporarily) claimed when doing asynchronous probing of the
> touchpad:
>
>         genirq: Flags mismatch irq 191. 00082008 (hid-over-i2c) vs. 00082=
008 (hid-over-i2c)
>         i2c_hid_of 21-0015: Could not register for hid-over-i2c interrupt=
, irq =3D 191, ret =3D -16
>         i2c_hid_of: probe of 21-0015 failed with error -16
>
> Fix this by restoring the old behaviour of first making sure the device
> exists before requesting the interrupt line.
>
> Note that something like this should probably be implemented also for
> "panel followers", whose actual probe is currently effectively deferred
> until the DRM panel is probed (e.g. by powering down the device after
> making sure it exists and only then register it as a follower).
>
> Fixes: 675cd877c952 ("HID: i2c-hid: Rearrange probe() to power things up =
later")
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 142 ++++++++++++++++-------------
>  1 file changed, 80 insertions(+), 62 deletions(-)

Ugh, sorry for the regression. :( It actually turns out that I've been
digging into this same issue on a different device (see
mt8173-elm-hana). I hadn't realized that it was a regression caused by
my recent change, though.

I haven't yet reviewed your change in detail, but to me it seems like
at most a short term fix. Specifically, I think the way that this has
been working has been partially via hacks and partially via luck. Let
me explain...

Currently, to make this work the `sc8280xp-lenovo-thinkpad-x13s.dts`
file has a hack in it. You can see that the `tpad_default` pinctrl
entry has been moved up to the i2c bus level even though it doesn't
belong there (it should be in each trackpad). This is because,
otherwise, you would have run into similar type problems as the device
core would have failed to claim the pin for one of the devices.

Currently, we're getting a bit lucky with
`sc8280xp-lenovo-thinkpad-x13s.dts` that there are no other shared
resources between the two devices besides the interrupt. Specifically
a number of trackpads / touchscreens also have a "reset" GPIO that
needs to be power sequenced properly in order to talk to the
touchscreen. In this case we'll be stuck again because both instances
would need to grab the "reset" GPIO before being able to confirm if
the device is there.

This is an old problem. The first I remember running into it was back
in 2015 on rk3288-veryron-minnie. We had a downstream hack to make
this work with -EPROBE_DEFER. https://crrev.com/c/266224. By the time
we shipped, though, we decided not to do the 2nd sourcing. After that
I always NAKed HW designs like this, but I guess that didn't help with
Mediatek hardware I wasn't involved with. :( ...and, of course, it
didn't help with devices that aren't Chromebooks like the Thinkpad
X13S.

FWIW: as a short term solution, we ended up forcing synchronous probe
in <https://crrev.com/c/4857566>. This has some pretty serious boot
time implications, but it's also very simple.


I'm actively working on coming up with a better solution here. My
current thought is that that maybe we want to do:

1. Undo the hack in the device tree and have each "2nd source" have
its own pinctrl entry.

2. In core pinctrl / device probing code detect the pinctrl conflict
and only probe one of the devices at a time.

...that sounds like a nice/elegant solution and I'm trying to make it
work, though it does have some downsides. Namely:

a) It requires "dts" changes to work. Namely we've got to undo the
hack that pushed the pinctrl up to the controller level (or, in the
case of mt8173-elm-hana, that just totally skipped the "pinctrl" entry
altogether). Unfortunately those same "dts" changes will actually make
things _worse_ if you don't have the code change. :(

b) It only handles the case where the resources shared by 2nd sourcing
are expressed by pinctrl. In a practical sense this seems to be most
cases, but conceivably you could imagine running into this situation
with a non-pin-related shared resource.

c) To solve this in the core, we have to make sure we properly handle
(without hanging/failing) multiple partially-conflicting devices and
devices that might acquire resources in arbitrary orders.

Though the above solution detecting the pinctrl conflicts sounds
appealing and I'm currently working on prototyping it, I'm still not
100% convinced. I'm worried about the above downsides.


Personally, I feel like we could add information to the device tree
that would help us out. The question is: is this an abuse of device
tree for something that Linux ought to be able to figure out on its
own, or is it OK? To make it concrete, I was thinking about something
like this:

/ {
  tp_ex_group: trackpad-exclusion-group {
    members =3D <&tp1>, <&tp2>, <&tp3>;
  };
};

&i2c_bus {
  tp1: trackpad@10 {
    ...
    mutual-exclusion-group =3D <&tp_ex_group>;
  };
  tp2: trackpad@20 {
    ...
    mutual-exclusion-group =3D <&tp_ex_group>;
  };
  tp3: trackpad@30 {
    ...
    mutual-exclusion-group =3D <&tp_ex_group>;
  };
};

Then the device core would know not to probe devices in the same
"mutual-exclusion-group" at the same time.

If DT folks are OK with the "mutual-exclusion-group" idea then I'll
probably backburner my attempt to make this work on the pinctrl level
and go with that.
