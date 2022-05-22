Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3BD530510
	for <lists+linux-input@lfdr.de>; Sun, 22 May 2022 19:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiEVR6A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 May 2022 13:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350192AbiEVRz7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 May 2022 13:55:59 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEFDB3D
        for <linux-input@vger.kernel.org>; Sun, 22 May 2022 10:55:57 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2fed823dd32so127019487b3.12
        for <linux-input@vger.kernel.org>; Sun, 22 May 2022 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t1IBd1I7jqgkWTOf1jpHS7QvhKpfuArg4XlVJVFytWI=;
        b=wTxh61Qxo/0L1MPgV/121YPBxCOzMDEVJIvXQGwRKZ6gnI0qBQk1bSYboz0vtlNcM+
         KNMd9tUv6+A/Mo4PBXwZLFt9hqrT4DgmodKAAsiwdHMx/ipedz8G3VT3YQDmRs6hm0bt
         +oA7mANBdkukRWQodyfxvunKf3rOXlQFcrsvtJO6DOwcpQBk0HT9A9R4Kl4nJDl1Grny
         8EXU3sIVEnuyVjGeWxA+C3SJW34Mdyp5KR46vKVOFTTWypnaSHsgY9R9Cj/Mm7J0asOo
         b1py5fZuABLu5kmRaBLbWzlL15bsevjuGjb9hrKBOZyUrvmRntx2qolEEW1/6MXmkIZO
         W7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1IBd1I7jqgkWTOf1jpHS7QvhKpfuArg4XlVJVFytWI=;
        b=QAT2FmbFl3mblPRila8OnaBEBUDKGc3lXWHy/DzBSxb5viU98vhvlP0Vb3067a8CoB
         GHVIZ081zhZmEzjijoxVMBuZHTwhApErS5WVQCK0dZgv0WI2mfiUeBn4Sq1/8OM8aPVG
         a2pcnTGUEtxLv577qU3VGS/HhCmcjez9cf2SCHhf8notGmp9Y3l+Svg1vxYqRBIMaabP
         xSWEhcLyxRcQSGTr0VlmBt7xxKsr6uUie/UUam6f9aIllvBiyD7TogyFBn/C4/e2ZQih
         O9jItZ99NYYmFDBakuXC1LlmYtL6RAYrty3eZfrAjnRXOIzcnmnCE9+CBJ7KHF1o6YKX
         c8nw==
X-Gm-Message-State: AOAM532BCci7HSEfo/6ITVaFPsW5pnqarAC1HCUvqU1xrA+Nsw/zreH6
        0d+j8UfkGwTCBFffzy61CBDNRad8+k4rSPjS1OWHHakCJQ4=
X-Google-Smtp-Source: ABdhPJxaucVH3Gn+susEU8C/TSrVh7M18shIf3try382RLs2A3YFgZUcI7cc7RbEmVplQGzz9oBN3OeYPyKQ9Vnt9q8=
X-Received: by 2002:a0d:d603:0:b0:2ff:111b:37ab with SMTP id
 y3-20020a0dd603000000b002ff111b37abmr20729539ywd.380.1653242157136; Sun, 22
 May 2022 10:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220513093927.1632262-1-acz@semihalf.com>
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Sun, 22 May 2022 19:55:46 +0200
Message-ID: <CAB4aORVxapNDHjFW5pRM1tExPX6661oPmmt3N8JxhqELhDs86Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] *** Implement simple haptic HID support ***
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 13, 2022 at 11:39 AM Angela Czubak <acz@semihalf.com> wrote:
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
> Fix i2c hid sending and getting report so that report IDs larger than 0xF
> are handled correctly.
>
> v2:
> - Describe INPUT_PROP_HAPTIC_TOUCHPAD in
>   Documentation/input/event-codes.rst
> - Do not extract mt_get_feature(), use hid_hw_wait() instead
> - Define HID_UNIT_GRAM and HID_UNIT_NEWTON
> - Calculate pressure sum in input-mt if INPUT_MT_TOTAL_FORCE flags set
> - Use u* instead of __u* in struct hid_haptic_device
> - Solve problems with report IDS >= 0xF as Dmitry suggests
>
> v3:
> - Get rid of INPUT_PROP_HAPTIC_TOUCHPAD property as haptic device does not
>   gave to be a touchpad
> - Introduce notion of haptic forcepads; generate haptic feedback in kernel
>   mode only for forcepads
> - Generate clicks based on maximum pressure across slots instead of the sum
> - Fix off-by-one bug in hid_haptic_upload_effect()
> - Fix resume/suspend: issue hid_haptic_resume() in mt_resume() and
>   hid_haptic_suspend() in mt_suspend()
> - Add reset callback for HID i2c devices
> - Implement reset callback for HID multitouch haptic devices
> - Implement lid handler triggering touchpad recalibration for Redrix
>
> Angela Czubak (17):
>   HID: add haptics page defines
>   Input: add FF_HID effect type
>   HID: haptic: introduce hid_haptic_device
>   HID: input: allow mapping of haptic output
>   HID: haptic: initialize haptic device
>   Input: add shared effects
>   HID: haptic: implement release and press effects
>   HID: input: calculate resolution for pressure
>   HID: haptic: add functions handling events
>   Input: MT - add INPUT_MT_MAX_FORCE flags
>   HID: haptic: add hid_haptic_switch_mode
>   HID: multitouch: add haptic multitouch support
>   Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
>   HID: haptic: add hid_haptic_change_control
>   HID: add HID device reset callback
>   HID: haptic: implement HID haptic reset callback
>   HID: multitouch: Add lid handler for touchpad on Redrix chromebook
>
>  drivers/hid/Kconfig                |  14 +
>  drivers/hid/Makefile               |   1 +
>  drivers/hid/hid-haptic.c           | 753 +++++++++++++++++++++++++++++
>  drivers/hid/hid-haptic.h           | 152 ++++++
>  drivers/hid/hid-input.c            |  18 +-
>  drivers/hid/hid-multitouch.c       | 313 +++++++++++-
>  drivers/hid/i2c-hid/i2c-hid-core.c |  21 +
>  drivers/input/evdev.c              |   6 +
>  drivers/input/ff-core.c            | 129 ++++-
>  drivers/input/input-mt.c           |  16 +-
>  include/linux/hid.h                |  31 ++
>  include/linux/input.h              |   5 +
>  include/linux/input/mt.h           |   1 +
>  include/uapi/linux/input.h         |  26 +-
>  14 files changed, 1469 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/hid/hid-haptic.c
>  create mode 100644 drivers/hid/hid-haptic.h
>
> --
> 2.36.0.550.gb090851708-goog
>

Hi, could I get any feedback? :) Or should I wait for some features to
land in the upstream kernel?

Regards,
Angela
