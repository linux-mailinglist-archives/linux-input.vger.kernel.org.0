Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977715FDA70
	for <lists+linux-input@lfdr.de>; Thu, 13 Oct 2022 15:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJMNUa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Oct 2022 09:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJMNU2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Oct 2022 09:20:28 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237A1B03E9
        for <linux-input@vger.kernel.org>; Thu, 13 Oct 2022 06:20:26 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id b145so2048663yba.0
        for <linux-input@vger.kernel.org>; Thu, 13 Oct 2022 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1XUHjpXDuI76+2ILsDHFyte7Ohg7G0LNPqe2l1OVkQ=;
        b=dHZVz7iBL6un0JqRIdHhVCFjZlrcb4f4Q5WhpGIaQokUKkFORRr25x+mO1iKs0Lbno
         UnNvmatjeYDK+J6FXIs1g66BZm0aYXvYtDzNlZZt+MXCHxGczUaiSnxokHiRNRibXADd
         IEUQxFvMvAFqD0DQLGMmxn/D0W1onCCi5a5r/zYEluhzjUQgE1YEra81ZHU+JUVQTpP8
         g135kd+ZKXBqyJ19q4ZqOXwC88Nr8OQue6NebqfKYWauOUsDDWi9buiRp7CdkN8YTLpd
         AjWx4xlSe9Cp1UOVAFZ9OSvmvNdQ3A8IiO3lFeRom6+7zNqFfa5HqkrqXQ3NcvXg36kB
         K3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1XUHjpXDuI76+2ILsDHFyte7Ohg7G0LNPqe2l1OVkQ=;
        b=NOlnvlD81mXVrXF4iXuLGvuwIB76G5XvwRp2g4GVXfrmnnmnw6S2+Gbasp6dQkiSfQ
         YweUj0VVjBjoq6+sg7PcC1VG/6BOI4NBR9xB65A7HQMatRrYHGWFS1mGIqHWFECwGW/v
         QsXEdoLPhfC9yEnygltFxB3C47hQaDTLMktLw/6zQNkyiAj+eEHDcMpBlHgLjWjg+YKu
         M0LKm6OOM+SNXtZDm9huH1bFFvpyc5uDTZe8dSh+CpyFZ+gET51Ac8hC/a4d+nUJhgMJ
         ODX21hseWWwXZFZnbG5upzhRpEpH+hlOufdMWn1HwC6J6gfBkgYJP22oG9kmSuKYJoMY
         BO4w==
X-Gm-Message-State: ACrzQf3cMB0sOsKwR2tOrzxi2G8JBZS1bWPBkJoj/ICvaLPH4cxKxjmh
        fMmBorVmKWA+RBux4QJLNCQVWIsT8g7PCzOmPehWUe3fzvtMBw==
X-Google-Smtp-Source: AMsMyM43oWYpHSTuwipJATuk422CdcccypNUcEGFQKW5LD2JfP5boly3t84AaHZk3Rlv0LaF8MYb3lseUOXjin+AbNw=
X-Received: by 2002:a25:c08b:0:b0:6bf:b095:c192 with SMTP id
 c133-20020a25c08b000000b006bfb095c192mr27092913ybf.143.1665667225145; Thu, 13
 Oct 2022 06:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221007182945.1654046-1-acz@semihalf.com> <CAB4aORV87CJFo9VkJawgLDe4CfyhXiGzGmzcaCAkPWO4bvwy1Q@mail.gmail.com>
In-Reply-To: <CAB4aORV87CJFo9VkJawgLDe4CfyhXiGzGmzcaCAkPWO4bvwy1Q@mail.gmail.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Thu, 13 Oct 2022 15:20:14 +0200
Message-ID: <CAB4aORW2-Bgvgro4SzSNPBUHBLG4=w9-uD3kQ+87ZZ6dvqBNPA@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] *** Implement simple haptic HID support ***
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

any chance you will have some time to provide your feedback on this
series of patches?

Regards,
Angela


On Thu, Oct 13, 2022 at 3:18 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Hi Jiri,
>
> any chance you will have some time to provide your feedback on this series of patches?
>
> Regards,
> Angela
>
> On Fri, Oct 7, 2022 at 8:30 PM Angela Czubak <acz@semihalf.com> wrote:
>>
>> This patch series introduces changes necessary to support devices
>> using simple haptic HID pages.
>> Implementation attempts to follow the discussion below:
>> https://www.spinics.net/lists/linux-input/msg61091.html
>>
>> Introduce new haptic defines as specified in HID Usage Tables.
>>
>> Add new force feedback effect type in order to facilitate using
>> simple haptic force feedback.
>>
>> Add INPUT_PROP_HAPTIC_TOUCHPAD to mark touchpad exposing simple haptic
>> support.
>>
>> Add new struct hid_haptic_device so as to gather simple haptic related
>> configuration and current state of the device.
>>
>> Add new functions to be triggered during HID input mapping and
>> configuration in order to detect simple haptic devices.
>>
>> Modify HID input so that haptic output reports are parsed.
>>
>> Initialize a haptic device.
>>
>> Modify FF core so that effect IDs can be shared between multiple open file
>> handles.
>>
>> Add shared release and press effects for a simple haptic device.
>>
>> Calculate pressure resolution if units are grams or newtons.
>>
>> Add support for kernel-driven mode of simple haptic device.
>>
>> Toggle ABS_PRESSURE generation by input-mt on request.
>>
>> Implement functions allowing switching between kernel-managed mode
>> and autonomous mode.
>>
>> Add simple haptic support for hid-multitouch driver.
>>
>> Implement EVIOCFF(TAKE|RELEASE)CONTROL ioctls so that userspace can take
>> and release control of shared release and press effects.
>>
>> v2:
>> - Describe INPUT_PROP_HAPTIC_TOUCHPAD in
>>   Documentation/input/event-codes.rst
>> - Do not extract mt_get_feature(), use hid_hw_wait() instead
>> - Define HID_UNIT_GRAM and HID_UNIT_NEWTON
>> - Calculate pressure sum in input-mt if INPUT_MT_TOTAL_FORCE flags set
>> - Use u* instead of __u* in struct hid_haptic_device
>> - Solve problems with report IDS >= 0xF as Dmitry suggests
>>
>> v3:
>> - Get rid of INPUT_PROP_HAPTIC_TOUCHPAD property as haptic device does not
>>   gave to be a touchpad
>> - Introduce notion of haptic forcepads; generate haptic feedback in kernel
>>   mode only for forcepads
>> - Generate clicks based on maximum pressure across slots instead of the sum
>> - Fix off-by-one bug in hid_haptic_upload_effect()
>> - Fix resume/suspend: issue hid_haptic_resume() in mt_resume() and
>>   hid_haptic_suspend() in mt_suspend()
>> - Add reset callback for HID i2c devices
>> - Implement reset callback for HID multitouch haptic devices
>> - Implement lid handler triggering touchpad recalibration for Redrix
>>
>> v4:
>> - Fix mt_reset callback to end earlier if no input devices have been
>>   configured yet to avoid iterating over uninitialized hid->inputs list
>>
>> Angela Czubak (17):
>>   HID: add haptics page defines
>>   Input: add FF_HID effect type
>>   HID: haptic: introduce hid_haptic_device
>>   HID: input: allow mapping of haptic output
>>   HID: haptic: initialize haptic device
>>   Input: add shared effects
>>   HID: haptic: implement release and press effects
>>   HID: input: calculate resolution for pressure
>>   HID: haptic: add functions handling events
>>   Input: MT - add INPUT_MT_MAX_FORCE flags
>>   HID: haptic: add hid_haptic_switch_mode
>>   HID: multitouch: add haptic multitouch support
>>   Input: introduce EVIOCFF(TAKE|RELEASE)CONTROL
>>   HID: haptic: add hid_haptic_change_control
>>   HID: add HID device reset callback
>>   HID: haptic: implement HID haptic reset callback
>>   HID: multitouch: Add lid handler for touchpad on Redrix chromebook
>>
>>  drivers/hid/Kconfig                |  14 +
>>  drivers/hid/Makefile               |   1 +
>>  drivers/hid/hid-haptic.c           | 753 +++++++++++++++++++++++++++++
>>  drivers/hid/hid-haptic.h           | 152 ++++++
>>  drivers/hid/hid-input.c            |  18 +-
>>  drivers/hid/hid-multitouch.c       | 313 +++++++++++-
>>  drivers/hid/i2c-hid/i2c-hid-core.c |  21 +
>>  drivers/input/evdev.c              |   6 +
>>  drivers/input/ff-core.c            | 129 ++++-
>>  drivers/input/input-mt.c           |  16 +-
>>  include/linux/hid.h                |  31 ++
>>  include/linux/input.h              |   5 +
>>  include/linux/input/mt.h           |   1 +
>>  include/uapi/linux/input.h         |  26 +-
>>  14 files changed, 1469 insertions(+), 17 deletions(-)
>>  create mode 100644 drivers/hid/hid-haptic.c
>>  create mode 100644 drivers/hid/hid-haptic.h
>>
>> --
>> 2.36.0.550.gb090851708-goog
>>
