Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8F92C5A3F
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 18:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403877AbgKZRKJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 12:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403791AbgKZRKJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 12:10:09 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61195C0613D4;
        Thu, 26 Nov 2020 09:10:09 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id m6so607409vkl.2;
        Thu, 26 Nov 2020 09:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eiVvdawmrHkkFbsTAsLVy02rzVF/6bcsRLkbJ87vgq4=;
        b=jqIvnc/J0peqmBZs3k7obuCMl2j29mfgb4YUuBWNztlZGYaIhpWfy6SGuarIeesLKN
         d1wy50SZ/TprSJSAWhLiHdQG93Lh4qKVZhpPjXe4HC/hrOp2okCFluI3XP3+hS2Gq8U+
         pz4NDHGDUKC7qLr9JbK5AHtiE9ysmyxoPi4KBav1txbU+fC1GEw/Rdp42yzqODTPpMZ+
         QtJWnBLyRIl09y5YnGIiRpIEb3RNU2eCDEvYuaJgANV6b/TyKUbvjW3obbqBsIAwCeWh
         QMLrAYlO0+iGL8JgVyqCiyBvv7ws+5whZ9uhw0S367VyPWp+AvOlsaget9wtHuo3kmXd
         mH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eiVvdawmrHkkFbsTAsLVy02rzVF/6bcsRLkbJ87vgq4=;
        b=uSaMN30uASs5sEoQsVMmDtAs1WU4dE12BD75MCBENsUVlE2VK+UG9eOv7u43+76H1C
         2Gdx484yOgvrbFLs2pN38qwlhSd3/n6qGVPzfOI733CGHIDuEUgHsiUW3oivngZpUnhR
         bDex42HnuM2Ici7tk07yoUzfIZTt6KV8lbrWehCIJ8bPIMJ9J2HtOxh98wvxY2Q3PU5R
         oJvo2TC5m0rtccbOs0OItHyalVP+3I/8g7mMeB1QXP9qBISfHLLqEp5e6bxtyqnOCwj8
         JmW7p7hYejzJVipT2UGBFrj1fcchhy/cWBL7VoWxsgQasCso/nHl1xv0+rTwBdfny7s3
         yfzQ==
X-Gm-Message-State: AOAM533xvL5qKkV+PGwW/Tm4aMFEYqS0I6fZM2UXLC6po1Za/mE2eaLX
        YoPI1W+eenbNwN1/HO5C7YZNGL6xbYsVYkUqi1Q=
X-Google-Smtp-Source: ABdhPJyBK5JvfFayn6xTjWYBLJT53TYMBwMWS0VfffWnSMcMiikLUZqjlHbyJDFIv9mPlR+t/ORQ2ppJO8dBmi2qn14=
X-Received: by 2002:a1f:1e46:: with SMTP id e67mr2668290vke.8.1606410608466;
 Thu, 26 Nov 2020 09:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20201028221302.66583-1-kholk11@gmail.com> <CAMi1Hd1hh3NYuFTs3C39ha1Jy_0LxQ4Akg36sm0x1+uicWYRjQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd1hh3NYuFTs3C39ha1Jy_0LxQ4Akg36sm0x1+uicWYRjQ@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Thu, 26 Nov 2020 18:09:57 +0100
Message-ID: <CAK7fi1a3m_5aT=G4BpPFqU53Z4j9s_FkVtp0qQ8C3xbQ8W4Y1Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add Novatek NT36xxx touchscreen driver
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org, dt <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Il giorno lun 23 nov 2020 alle ore 11:13 Amit Pundir
<amit.pundir@linaro.org> ha scritto:
>
> Hi,
>
> On Thu, 29 Oct 2020 at 06:32, <kholk11@gmail.com> wrote:
> >
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > This patch series adds support for the Novatek NT36xxx Series' In-Cell
> > touchscreen (integrated into the DriverIC).
> >
> > This patch series has been tested against the following devices:
> >  - Sony Xperia 10        (SDM630 Ganges Kirin)
> >  - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)
>
> Tested the patch series on Xiaomi Poco F1 (SDM845 Beryllium) using
> Novatek NT36672A IC. May I suggest adding "novatek,nt36672a" in the
> list of compatible of_device_id{} as well.
>
> Regards,
> Amit Pundir
>
>
> >
> > Changes in v2:
> > - Fixed sparse warnings from lkp kernel test robot
> >
> > Changes in v3 (as requested by Dmitry Torokhov):
> > - Using shorthand u16/u32 (sorry for the overlook!)
> > - Now using more input and touchscreen APIs
> > - Fixed useless workqueue involvements
> > - Removed useless locking
> > - Switched reads and writes to use regmap
> > - Moved header contents to nt36xxx.c
> > - Fixed reset gpio handling
> > - Other cleanups
> > - P.S.: Thanks, Dmitry!
> >
> > Changes in v4:
> > - Fixed regmap read length for CRC_ERR_FLAG final check
> > - Fixed YAML binding, as requested by Krzysztof Kozlowski
> >
> > Changes in v5:
> > - Replaced subsystem maintainer's name with .. mine,
> >   usage of additionalProperties to unevaluatedProperties
> >   and a typo fix for reset-gpios as per Rob Herring's review
> > - Changed compatible string as per Krzysztof K. request
> > - Renamed the novatek,nt36xxx.yaml file to just nt36xxx.yaml
> >   in order to now reflect the driver name instead of the DT
> >   compatible
> > - Fixed blank line at EOF
> >
> > Changes in v6:
> > - Removed include of_gpio.h, added mod_devicetable.h and
> >   gpio/consumer.h
> > - Added kerneldoc to relevant functions/enum
> > - Used traditional patterns for error checking where possible
> > - Documented calls to usleep/msleep
> > - Using be16_to_cpu / get_unaligned_be16 where possible
> > - Added helper for CRC error check on retrieved buffer
> > - Decreased indentation in the CRC reboot recovery function
> > - Removed instances of error code sum
> > - Dropped all likely/unlikely optimization as per request
> > - Removed redundant reset_gpio checks
> > - Dropped of_match_ptr and ifdefs for CONFIG_OF
> >
> > Changes in v7:
> > - Fixed typo in nt36xxx.c
> >
> > Changes in v8:
> > - Fixed typo reset-gpio -> reset-gpios in dt-bindings
> >
> > Changes in v9:
> > - Includes are now sorted
> > - Used proposed sizeof variable instead of sizeof type
> > - Fixed a return value check for common pattern
> > - Added NULL check to devm_kasprintf call
> > - Returning ret on probe function to be consistent
> >
> > AngeloGioacchino Del Regno (3):
> >   dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
> >   Input: Add Novatek NT36xxx touchscreen driver
> >   dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
> >     driver
> >
> >  .../bindings/input/touchscreen/nt36xxx.yaml   |  59 ++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  drivers/input/touchscreen/Kconfig             |  12 +
> >  drivers/input/touchscreen/Makefile            |   1 +
> >  drivers/input/touchscreen/nt36xxx.c           | 894 ++++++++++++++++++
> >  drivers/input/touchscreen/nt36xxx.h           | 122 +++
> >  6 files changed, 1090 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
> >  create mode 100644 drivers/input/touchscreen/nt36xxx.c
> >  create mode 100644 drivers/input/touchscreen/nt36xxx.h
> >
> > --
> > 2.28.0
> >
Mind releasing a Tested-By tag for this?

Anyway, I was suggested to add a compatible only for the "oldest" IC that
is supported in this driver, since there is autodetection, that's why you see
only the 36525 compatible here!

Yours,
Angelo
