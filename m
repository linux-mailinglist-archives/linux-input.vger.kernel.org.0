Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4C56DFE2F
	for <lists+linux-input@lfdr.de>; Wed, 12 Apr 2023 20:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjDLS6X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Apr 2023 14:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjDLS6T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Apr 2023 14:58:19 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4836769D
        for <linux-input@vger.kernel.org>; Wed, 12 Apr 2023 11:57:53 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54f64b29207so128787697b3.8
        for <linux-input@vger.kernel.org>; Wed, 12 Apr 2023 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681325871; x=1683917871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLPVyVyh1naFGGGdQWTlNg7aPFWgWp48jVuerCkLK8k=;
        b=YX6vruZXxs4t7i3/Y3ZN20RjXb7a8Wv1ok+TUlaUgvtzf1kzgNdu/vbj0TqjpK+UCc
         2f6Fz0UpB+ydwu1iVLQ1n68HqAzIgVe0d2pCzNRiyGNIUuYCVLhYBGQy6WgLk5bYdM7G
         5Mhh5N2EdLjn1eqqBC5JiEeY9bupRu6LPXd9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325871; x=1683917871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLPVyVyh1naFGGGdQWTlNg7aPFWgWp48jVuerCkLK8k=;
        b=faJ6aYoGZhTpuVbtuq4eP4RR+paRjicy6w3CxMkwL4F/f1JHktpRImbdQf3urFqyy3
         6Eu9rB0zhP5ABstqPJ1CKtufJZCCgUSr17js5k/0FDNQIYT+lWILxdqNk/IjNHG//XR3
         HgsheZ31ju961RyKaExPOe9yX47GiH0TkPIeiACD8rAH2GzoShCKFd/TrQQVL4L4wRso
         BhEx9hjKPM1tC83vpa1Fw7HBxVt8SeYl4mpORWWzHPZW9LuX+h3S1bYgkJ2UDET6lsRC
         TiMzeKBhTjtEs0yCP8K6yZ6C/KKho4Bs3igP7D/3nViHaw8H/ErqMcpHtWrVSZ1IrK9D
         h5VQ==
X-Gm-Message-State: AAQBX9exSkEW8iAGvTVZvXIFgtSNGq9DpIMNy7h5UrIsnutoiAJD9F0I
        ReQoEDPE9O5hSPeNh8myLmJU8tYN9mO12UxHnMs=
X-Google-Smtp-Source: AKy350bqaZGcTZmPuGUMCTWPP0cn76XUo3TDwSqVSBmwU/j9AHaYQgDuR5RdjlADeiREnzzJO4mibA==
X-Received: by 2002:a81:6d8d:0:b0:54f:8e9e:fed9 with SMTP id i135-20020a816d8d000000b0054f8e9efed9mr3205374ywc.27.1681325870602;
        Wed, 12 Apr 2023 11:57:50 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id l200-20020a0de2d1000000b00545a0818487sm4374040ywe.23.2023.04.12.11.57.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 11:57:49 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54fb615ac3dso23918207b3.2
        for <linux-input@vger.kernel.org>; Wed, 12 Apr 2023 11:57:49 -0700 (PDT)
X-Received: by 2002:a81:b547:0:b0:544:b9b2:5c32 with SMTP id
 c7-20020a81b547000000b00544b9b25c32mr8829720ywk.7.1681325868697; Wed, 12 Apr
 2023 11:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230409144243.25360-1-hdegoede@redhat.com> <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
 <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com> <20230411125036.3ojjdrjzxhasu5du@mail.corp.redhat.com>
 <eafe8744-49d4-31e3-2329-ddd452358915@redhat.com> <20230411165653.rw3ivfjdhjv5dmc3@mail.corp.redhat.com>
In-Reply-To: <20230411165653.rw3ivfjdhjv5dmc3@mail.corp.redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Apr 2023 11:57:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFXS_RYmZeOfPBnZR2Y+KWBQGEM53HhXyUxhyp1bNtfg@mail.gmail.com>
Message-ID: <CAD=FV=UFXS_RYmZeOfPBnZR2Y+KWBQGEM53HhXyUxhyp1bNtfg@mail.gmail.com>
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Apr 11, 2023 at 9:57=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> > Either way is fine with me really. So you get to chose. If you
> > let me know which route you prefer, I'll go and prepare either
> > a v2 of this series, or a whole new patch for the new specialized
> > driver.
>
> Sorry for being a PITA, but having those driver separated allowed to
> move forward without having to have a spaghetti plate in i2c-hid, which
> was the case before the split (because *everything* was entangled: ACPI,
> DT, OF, properties). So that's why I'm trying to understand and
> minimize the changes.
>
> Also, before you sending v2 and involving too much, we could try to wait =
a
> few days for Doug to answer, and hear if he has an opinion. But if you
> rather send v2 right away, that's your choice obviously :)

I can test things if need be, but I want to make sure we're on the
right approach before going too deep into testing...

I guess a few notes here:

In general, I think DT maintainers are pretty leery of anything in the
device tree that tries to be "generic" and then a whole pile of
"kitchen sink" properties added to actually describe the device. Even
if it starts with just a few properties, the worry is that it will end
up being more and more over time. They would much rather specify which
exact device is present on the board and imply all the properties
based on knowing the device. Then the only things that are in the
device tree as properties are things that are board-specific. For
instance, if there was a hardware strapping that let you choose two
different hid descriptor addresses then that would be something to put
in the device tree.

The "post-power-on-delay-ms" was something that the DT maintainers
weren't too happy with. They would have much rather inferred this from
the specific compatible. You can actually see that the bindings say
that "Just "hid-over-i2c" alone is allowed, but not recommended."

Now, that being said, it's not always a hard-and-fast rule. For
instance, after years of needing to list every eDP panel directly in
device tree (often lying about it when multiple sources were listed),
we finally did manage to get the generic "panel-edp" bindings accepted
that has "just a few" properties needed to power up a device. ...then
the rest of the things we need are inferred once we start talking to
the device and get it to self-identify.

Bringing it back to i2c-hid-of: even though today the "goodix" and
"elan" drivers are largely the same, it wasn't always the case. For a
little while we had a whole pile of special logic in the "goodix"
driver to deal with the fact that if the touchscreen is powered up
(because it's shared or always-on) but the reset line is held asserted
that it draws a bunch of extra power. I had to end up taking that
logic out because it was too hard to reconcile with the second voltage
rail that I needed to add for a different board. See commit
557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line to the
regulator") and eb16f59e8e58 ("HID: i2c-hid: goodix: Add
mainboard-vddio-supply"). The need for this special logic is, as far
as I know, Goodix specific. I'm not aware of other touchscreens
holding themselves in a high power state if they are powered while
their reset line is held low. I don't think upstream would have liked
a DT properly like "avoid-holding-reset-low-while-powered;"
Ironically, there is actually more work to be done here. It turns out
that a different Chromebook that I wasn't aware of (and that wasn't
upstream yet) actually was relying on behavior to not assert reset and
we still need to figure out how to reconcile all of this. :(

I guess in general the idea of combining the drivers vs. coming up
with generic bindings is actually two separate things. We could have
separate bindings and still have one driver. At the time I made
i2c-of-goodix I was specifically requested to make separate drivers
for it. If maintainers want to re-combine them now, I won't object.
...but at least at the time it was a conscious decision and a specific
request to make them separate.

Looking at i2c-of-goodix and i2c-of-elan, we could probably combine
_those_ two drivers at this point, unless we actually end up needing
to go back again and do something goodix-specific for the reset line
again.

-Doug
