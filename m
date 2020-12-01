Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1C12CAE4F
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 22:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgLAVVf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 16:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725967AbgLAVVe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 16:21:34 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D463AC0613CF
        for <linux-input@vger.kernel.org>; Tue,  1 Dec 2020 13:20:48 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id x15so3130190otp.4
        for <linux-input@vger.kernel.org>; Tue, 01 Dec 2020 13:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rz75KRIu/W04B+gDDU2G3NLHnpqmRKEC0PqjBnYvfAg=;
        b=SkXGruEgApjXBuPBIG+CsTvCnChZ0p6ZTkGXqFgatMkL0SZw0FE8KL0qzUBQa5l4h5
         6etNrreqVrIO5yxLmbc6CXbsSscrR12TJc20LAm0+qHNVdsu7dlyRNu2ReilQMX7VqxA
         qUySfC2XqfuAakxzDFuvA+ZUgBX1Qd3kEjn4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rz75KRIu/W04B+gDDU2G3NLHnpqmRKEC0PqjBnYvfAg=;
        b=REHvMMaL0dWn+6UDH4BWEPfS/k+0yNGrHgDcKuU/p0FFBHC9in9TwdMXj6urIrreWu
         XDvdGIeAyxqQ9eqEL02MB3T7sWjQt6fuI/veYhNV/7atrHbiH0Qy08zWyZNhkLYBXuqH
         NZ7DBgF6GbfxxtdeYANlLFrolwYjVk/NvY28c/JtFUAwL4b42cc+YKh1G94mgmYdg6Pv
         KhokixtCh/jge74lrhujpkWwk04YXHKTJGyDceE3j+A1YwPyonfVtuuPesPh2g/5Rw7n
         mtYMmciZolBwgSUfMxdF7xp36fE4kW1CaeK2gXtiAFefMb03LPBXav1nu+V8xHuqrJyt
         T01w==
X-Gm-Message-State: AOAM531hd/fLm1RlwTcYE0xP2DY8MwUu+UL33sh6BsTdBVCJUrKisRDN
        +cngr08Y/P7kSEHVOSH7EtgmrWXMfRM7MA==
X-Google-Smtp-Source: ABdhPJyoZspsHfbalQ/7XFFcNVB9psQXhSdH7rGu5MKnW5zwSRYfaXFgzeZGxe1kDS4x1TbL2/psYA==
X-Received: by 2002:a9d:d4a:: with SMTP id 68mr3389493oti.101.1606857647723;
        Tue, 01 Dec 2020 13:20:47 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id m81sm185619oib.37.2020.12.01.13.20.47
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 13:20:47 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id j21so2994796otp.8
        for <linux-input@vger.kernel.org>; Tue, 01 Dec 2020 13:20:47 -0800 (PST)
X-Received: by 2002:a9f:3dcc:: with SMTP id e12mr4780191uaj.121.1606857148640;
 Tue, 01 Dec 2020 13:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20201112004130.17290-1-dianders@chromium.org>
In-Reply-To: <20201112004130.17290-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Dec 2020 13:12:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W122aWPbg7Fo=zg+QmK7DHBcYTQ6CjPawLhucd4Rtw9A@mail.gmail.com>
Message-ID: <CAD=FV=W122aWPbg7Fo=zg+QmK7DHBcYTQ6CjPawLhucd4Rtw9A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] HID: i2c-hid: Reorganize to allow supporting goodix,gt7375p
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andrea Borgia <andrea@borgia.bo.it>,
        Rob Herring <robh+dt@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>, Pavel Balan <admin@kryma.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Nov 11, 2020 at 4:41 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The goal of this series is to support the Goodix GT7375P touchscreen.
> This touchscreen is special because it has power sequencing
> requirements that necessitate driving a reset GPIO.
>
> To do this, we totally rejigger the way i2c-hid is organized so that
> it's easier to jam the Goodix support in there.
>
> This series was:
> - Tested on a device that uses normal i2c-hid.
> - Tested on a device that has a Goodix i2c-hid device.
> - Tested on an ACPI device, but an earlier version of the series.
>
> Changes in v6:
> - ACPI probe function should have been "static"
> - Don't export suspend/resume, just export dev_pm_ops from core.
> - Fixed crash in ACPI module (missing init of "client")
> - No need for regulator include in the core.
> - Removed i2c_device_id table from ACPI module.
> - Suspend/resume are no longer exported from the core.
>
> Changes in v5:
> - Add shutdown_tail op and use it in ACPI.
> - Added mention of i2c-hid in the yaml itself as per Rob.
> - Adjusted subject as per Rob.
> - i2chid_subclass_data => i2chid_ops.
> - power_up_device => power_up (same with power_down).
> - subclass => ops.
>
> Changes in v4:
> - ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.
> - Fully rejigger so ACPI and OF are full subclasses.
> - Totally redid based on the new subclass system.
>
> Changes in v3:
> - Fixed compatible in example.
> - Removed Benjamin as a maintainer.
> - Rework to use subclassing.
> - Updated description.
>
> Changes in v2:
> - ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.
> - Get timings based on the compatible string.
> - Use a separate compatible string for this new touchscreen.
>
> Douglas Anderson (4):
>   HID: i2c-hid: Reorganize so ACPI and OF are separate modules
>   arm64: defconfig: Update config names for i2c-hid rejigger
>   dt-bindings: input: HID: i2c-hid: Introduce bindings for the Goodix
>     GT7375P
>   HID: i2c-hid: Introduce goodix-i2c-hid using i2c-hid core
>
>  .../bindings/input/goodix,gt7375p.yaml        |  65 +++++
>  arch/arm64/configs/defconfig                  |   3 +-
>  drivers/hid/Makefile                          |   2 +-
>  drivers/hid/i2c-hid/Kconfig                   |  47 +++-
>  drivers/hid/i2c-hid/Makefile                  |   6 +-
>  drivers/hid/i2c-hid/i2c-hid-acpi.c            | 159 +++++++++++
>  drivers/hid/i2c-hid/i2c-hid-core.c            | 254 +++---------------
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 116 ++++++++
>  drivers/hid/i2c-hid/i2c-hid-of.c              | 143 ++++++++++
>  drivers/hid/i2c-hid/i2c-hid.h                 |  22 ++
>  include/linux/platform_data/i2c-hid.h         |  41 ---
>  11 files changed, 596 insertions(+), 262 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
>  create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
>  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
>  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
>  delete mode 100644 include/linux/platform_data/i2c-hid.h

Are there any additional changes that folks would like with this
series?  It's not crazy urgent to get it in, but it touches enough
lines of code that it'd be nice to get it in before other patches land
and it gets merge conflicts.

Hrm, I just checked and there actually is already one merge conflict
with commit afdd34c5fa40 ("HID: i2c-hid: show the error when failing
to fetch the HID descriptor") but that commit (and thus the
resolution) is trivial.  If there are no other comments I can re-post
atop that patch.  ...or I'm also happy if a maintainer is OK w/
resolving when landing my series.  Just let me know!

...or, if you want me to just shut up for a while and wait until your
tryptophan hangover wears off, that's fine too--just let me know.

-Doug
