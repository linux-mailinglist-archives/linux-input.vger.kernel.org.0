Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586C32EB7C0
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 02:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbhAFBoU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jan 2021 20:44:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbhAFBoU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jan 2021 20:44:20 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE1FC061574
        for <linux-input@vger.kernel.org>; Tue,  5 Jan 2021 17:43:39 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id r9so1617695otk.11
        for <linux-input@vger.kernel.org>; Tue, 05 Jan 2021 17:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8190Rw9nFurXvpyVpr5H2heqLA3Td/3zauNq8uzsNzM=;
        b=MKfJ7zGxTH1maYa7wKycTAhSCe7iU3Dy08HvTas4FA/zUjsnZ6Hjc05jcStbPpGZ/B
         g7TV1HRXxJ+RX79sAOjh9NV09M2ekhu2NPTSuTTHO9ncVhG+jBvzCjpGxG+wKMSgiOtu
         ZdPYyd4Chi2Xa6auJVV/rnzWGMTaQgVoK9zy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8190Rw9nFurXvpyVpr5H2heqLA3Td/3zauNq8uzsNzM=;
        b=qsdQenBJKYYNVOGE8X3PeQIyl3JdQxSH5T8RxE05D6doij64QLY7xPJDGF+L1I2/bG
         O9LimwLkUj8cDCzykweNw79FWe2XH9uYEvz1gcMM7KxNXUql2ihDNQJsljq2uZd72TjW
         GpE4Aol7Tde/F8PlziQTWogNTfWPAz01ayRlc2bw44VNfi8zNbIJgAsR2wlrxmlfAiCO
         GZi6jwM8bQdDORStgRU1Q+rSWKVRt8CncXfaVFEyY4QwUo24X7yF2F4fBke2DZNSZA4v
         kNIDVMflf7oEIn45IokcfeolDsIWVoqiyZxxpA4wpwSANMmIlcwgERIjgIS314pOr95t
         9Ycw==
X-Gm-Message-State: AOAM532iz0P4gvOMTRpjWJDEqoEkNflf5oy7VRs7a6l+2jhp7ozxH6o+
        QkVKRlgWVOFOTRdKz//HZRLVgSvdyh+qfw==
X-Google-Smtp-Source: ABdhPJxaD7Kb8VvjxJPnmuGv9HqPEWcSoCUAWIwnlG96N30ikqDBF7+6KBl1L/8pE12nbCNLGO8/cA==
X-Received: by 2002:a05:6830:17cc:: with SMTP id p12mr1745118ota.102.1609897418833;
        Tue, 05 Jan 2021 17:43:38 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id o64sm287496oif.43.2021.01.05.17.43.38
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 17:43:38 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id r9so1617676otk.11
        for <linux-input@vger.kernel.org>; Tue, 05 Jan 2021 17:43:38 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr1914472uaa.104.1609896944481;
 Tue, 05 Jan 2021 17:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20201211222448.2115188-1-dianders@chromium.org>
In-Reply-To: <20201211222448.2115188-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Jan 2021 17:35:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ve4wGJ=KxQjraYsiAQZHG_5qEeFW0ZhmBBkRmtdm7Gwg@mail.gmail.com>
Message-ID: <CAD=FV=Ve4wGJ=KxQjraYsiAQZHG_5qEeFW0ZhmBBkRmtdm7Gwg@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] HID: i2c-hid: Reorganize to allow supporting goodix,gt7375p
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Jiri Kosina <jikos@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Max Krummenacher <max.oss.09@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Pavel Balan <admin@kryma.net>, Shawn Guo <shawnguo@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Benjamin,

On Fri, Dec 11, 2020 at 2:24 PM Douglas Anderson <dianders@chromium.org> wrote:
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
> I believe the plan is for Benjamin to land the whole series.  Will
> said this about the arm64 defconfig change (and provided his Ack):
> > ...there are a few things I really care about
> > in defconfig (e.g. things like page size!), generally speaking we don't
> > need to Ack everything that changes in there.
> >
> > That said, might be worth checking whether arm-soc have any defconfig
> > changes queued in -next so you don't end up with conflicts.
>
> Changes in v8:
> - Mark suspend/resume as static as per patches robot.
>
> Changes in v7:
> - Rebase atop commit afdd34c5fa40 ("HID: i2c-hid: show the error ...")
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

I think this series is ready to land.  The "defconfig" has a trivial
conflict with commit 74b87103b3d0 ("arm64: defconfig: Enable HID
multitouch") against linuxnext, but it's so simple that hopefully
folks will be OK with that when it lands.

Please let me know if there's anything else you need me to do.  :-)

-Doug
