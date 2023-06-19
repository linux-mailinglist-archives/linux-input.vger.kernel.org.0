Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0299B735C6E
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 18:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjFSQvb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jun 2023 12:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjFSQva (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jun 2023 12:51:30 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D4CCC
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 09:51:29 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76241c98586so281879585a.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687193488; x=1689785488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gScQU+xkOHU0bdCn9mprbn93oFdgYf/fzvTScYy2R+w=;
        b=QtCzfhNXYYua4xlOc5x5kq1YI/NeXLy9oubdR9lpZi3FLMHbfO600jyPJjcwe5i9r1
         LdSA99elSf0Hb7vXSt/qUnkdiNwY8BihhyQExRf3CBP5gvv9bDlTVr42qZCwaAjFXxgq
         bqxwv0Qpk9eOkx4k3ssqVHVrfCfWQKExpdvTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687193488; x=1689785488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gScQU+xkOHU0bdCn9mprbn93oFdgYf/fzvTScYy2R+w=;
        b=heG1mUCNK2g06N9My+m2ZfLQU+3BFwE749PVVLKD8fOSTPdojmHffV64Zm0RCQASvF
         eWtJ5kt15Qow98o94P5TlydgPF8a7OKniHfgXvppuMluS5ar2R614pYtklzw47BOVlse
         oslf4SQlYn1oNvwa+b19nB7oF2uhACIL8hrTHkmE4SeYVYlOprSMOKNH4DCHuYswyTAT
         YjK//ZSZshlJIvGL79t5Y7XVtMFW/70f7c5U1GQYBXXsY8wFT+DdlNQ06h2s45wLnbuF
         kUfl8YYXkDCECOUGl6O4UK38u1EQrmvzFqscHzBR5zHaW5otiBAOR8da6uuUwfT+fMsr
         AD1w==
X-Gm-Message-State: AC+VfDxYLBdRsQMdgsYpj53qDPBsb9nvsRtk94lSRSCrx4DsVZ5wUz4I
        eogQqhCdsHa13mL1rgK/VrREq/2AJwRqnEy1EyMaNQ==
X-Google-Smtp-Source: ACHHUZ7iWkxuZgK3RulbEo6k2ClMBXK6zDB5cJsjAXt2oDApKCFLpBeM7OtiaSn2Swipk3RQdsyTrQ==
X-Received: by 2002:a05:6214:2aa4:b0:631:eb39:b7a6 with SMTP id js4-20020a0562142aa400b00631eb39b7a6mr1671245qvb.33.1687193488210;
        Mon, 19 Jun 2023 09:51:28 -0700 (PDT)
Received: from seobrien.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id m1-20020a0ce6e1000000b006238b37fb05sm115428qvn.119.2023.06.19.09.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 09:51:27 -0700 (PDT)
From:   Sean O'Brien <seobrien@chromium.org>
To:     acz@semihalf.com
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        upstream@semihalf.com
Subject: Re: [PATCH v4 00/17] *** Implement simple haptic HID support ***
Date:   Mon, 19 Jun 2023 16:51:24 +0000
Message-ID: <20230619165124.2308303-1-seobrien@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <CAB4aORW2-Bgvgro4SzSNPBUHBLG4=w9-uD3kQ+87ZZ6dvqBNPA@mail.gmail.com>
References: <CAB4aORW2-Bgvgro4SzSNPBUHBLG4=w9-uD3kQ+87ZZ6dvqBNPA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 7, 2022 at 8:30 PM Angela Czubak <acz@semihalf.com> wrote:
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
> v4:
> - Fix mt_reset callback to end earlier if no input devices have been
>   configured yet to avoid iterating over uninitialized hid->inputs list
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

Hello Jiri,

Will you be able to review this series?

Best,
Sean
