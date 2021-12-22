Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479D047D4FF
	for <lists+linux-input@lfdr.de>; Wed, 22 Dec 2021 17:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhLVQRR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Dec 2021 11:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233896AbhLVQRQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Dec 2021 11:17:16 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F162C061574
        for <linux-input@vger.kernel.org>; Wed, 22 Dec 2021 08:17:16 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id y68so8218747ybe.1
        for <linux-input@vger.kernel.org>; Wed, 22 Dec 2021 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=My1rPklHk3pMY7yidI1fnwAebi914opKirFtYScQP6c=;
        b=Lg0CLmjUs1S9AhW88gdsKz7WG60oNEcO2je98utcfbefPUAG9fWok7czjY+0A3Bta5
         05ozLU1NYy7bGlz5beaZO60M6irZTqBTlbRgtlZBgTgw7foDgyyA9NZzAm5yByD93V8O
         0NNmN1S93J1+JItdCE09l/aMS+VHPXVs2+OCueuwPCckaA0IQAS7EAzn3M3tVLxk8fl5
         Cvq0H+PeAYmZBbC/klmLRSnB/8YQpevyc0VuAFI3s5Alm1tgY0jHPsAj9EzPalTLjtv0
         mvq0mtloZMmbkSf1qB6Pr0STPJ36+p/L1x5z/TMEUhKVJ9rcQveGg27n1tGnLqHzsIbV
         2THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=My1rPklHk3pMY7yidI1fnwAebi914opKirFtYScQP6c=;
        b=SoJsZJsEdbOmOI1LnZGOW98JDOolDXOT9oTiy1my8Yo4PjxE3AIB6rLx3xoYQNvjer
         +jjhdrOGDLbFikuXx/RtaSsEultpphU659Y7gZLN5oZufisK9CxE5TyZ8SEpS5Su4Pmt
         QDFHThO5O3FmKOJ/7cekMalFVQle2rI4t1KgFYzrZK/ZINMNrAANQipoT7i3iTOcu3Kf
         +WFKk00SM07W3mLJoFFFjHNbLBeG4x7YF+VqVuquAaBz5yYy9RCNJbYFSrtJSlZcmQTQ
         3b+X+SFOi1lCfcd8prfIMZJvbljs4QGXr/rEalQjKXa0tDSImM8voCwWmCB1h7bqhcNV
         p4kw==
X-Gm-Message-State: AOAM531mgNzah9aINJ6xGXgshHS6q1zGhot21vJCDkAPdWPahVt1sU+a
        hOr9dwahs0rrJyL0Q3n+wYF1aAagVnwtbWsFc7gUuznI
X-Google-Smtp-Source: ABdhPJyHiGPKSPz0CVlxG12CNTBfinFDXRhpnmEl22+vlYizrcmYl3ieMx+ujL0Ov6uSVthJBi8JxzXigasCbcghvaU=
X-Received: by 2002:a25:2d6d:: with SMTP id s45mr5143494ybe.532.1640189835570;
 Wed, 22 Dec 2021 08:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com>
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Wed, 22 Dec 2021 08:17:04 -0800
Message-ID: <CAEc3jaD97Oq2uJ4g=5hOzHmOBCvyj2k=++cMSFGhvp8GBadedg@mail.gmail.com>
Subject: Re: [PATCH 00/18] *** Implement simple haptic HID support ***
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input <linux-input@vger.kernel.org>, upstream@semihalf.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

Thanks for sharing. I would like to have a look as well at this
series. As I briefly mentioned in another thread at Sony we have a
need for haptics as well for our DualSense controller for the
PlayStation 5. There is some overlap and differences. For our use
case, FF is really showing its limits (it really doesn't work). The
key question I have is whether FF is really a good fit for your use
case or not. I don't understand this type of device well enough yet.
There might be enough demand for either a new framework (or it is the
end of the road for evdev).

Thanks,
Roderick

On Wed, Dec 22, 2021 at 7:59 AM Angela Czubak <acz@semihalf.com> wrote:
>
> This patch series introduces changes necessary to support devices
> using simple haptic HID pages.
> Implementation attempts to follow the discussion below:
> https://www.spinics.net/lists/linux-input/msg61091.html
>
> Introduce new haptic defines as specified in HID Usage Tables.
>
> Add new force feedback effect type in order to facilitate using
> simple haptic force feedback.
>
> Add INPUT_PROP_HAPTIC_TOUCHPAD to mark touchpad exposing simple haptic
> support.
>
> Add new struct hid_haptic_device so as to gather simple haptic related
> configuration and current state of the device.
>
> Function mt_get_feature() gets renamed to hid_get_feature() and is moved
> to hid-core.c as it is not specific to hid multitouch driver and may be
> reused, for instance by simple haptic specific source.
>
> Add new functions to be triggered during HID input mapping and
> configuration in order to detect simple haptic devices.
>
> Modify HID input so that haptic output reports are parsed.
>
> Initialize a haptic device.
>
> Modify FF core so that effect IDs can be shared between multiple open file
> handles.
>
> Add shared release and press effects for a simple haptic device.
>
> Calculate pressure resolution if units are grams or newtons.
>
> Add support for kernel-driven mode of simple haptic device.
>
> Toggle ABS_PRESSURE generation by input-mt on request.
>
> Implement functions allowing switching between kernel-managed mode
> and autonomous mode.
>
> Add simple haptic support for hid-multitouch driver.
>
> Implement EVIOCFF(TAKE|RELEASE)CONTROL ioctls so that userspace can take
> and release control of shared release and press effects.
>
> Fix i2c_hid_set_or_send_report so that report IDs larger than 0xF are
> handled correctly.
>
> Angela Czubak (18):
>   HID: add haptics page defines
>   Input: add FF_HID effect type
>   Input: add INPUT_PROP_HAPTIC_TOUCHPAD
>   HID: haptic: introduce hid_haptic_device
>   HID: introduce hid_get_feature
>   HID: haptic: add functions for mapping and configuration
>   HID: input: allow mapping of haptic output
>   HID: haptic: initialize haptic device
>   Input: add shared effects
>   HID: haptic: implement release and press effects
>   HID: input: calculate resolution for pressure
>   HID: haptic: add functions handling events
>   Input: MT - toggle ABS_PRESSURE pointer emulation
>   HID: haptic: add hid_haptic_switch_mode
>   HID: multitouch: add haptic multitouch support
>   Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
>   HID: haptic: add hid_haptic_change_control
>   HID: i2c-hid: fix i2c_hid_set_or_send_report
>
>  drivers/hid/Kconfig                    |  15 +
>  drivers/hid/Makefile                   |   1 +
>  drivers/hid/hid-core.c                 |  39 ++
>  drivers/hid/hid-haptic.c               | 745 +++++++++++++++++++++++++
>  drivers/hid/hid-haptic.h               | 150 +++++
>  drivers/hid/hid-input.c                |  18 +-
>  drivers/hid/hid-multitouch.c           | 109 ++--
>  drivers/hid/i2c-hid/i2c-hid-core.c     |  12 +-
>  drivers/input/evdev.c                  |   6 +
>  drivers/input/ff-core.c                | 129 ++++-
>  drivers/input/input-mt.c               |  18 +-
>  include/linux/hid.h                    |  24 +
>  include/linux/input.h                  |   5 +
>  include/linux/input/mt.h               |   4 +
>  include/uapi/linux/input-event-codes.h |   1 +
>  include/uapi/linux/input.h             |  26 +-
>  16 files changed, 1247 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/hid/hid-haptic.c
>  create mode 100644 drivers/hid/hid-haptic.h
>
> --
> 2.34.1.307.g9b7440fafd-goog
>
