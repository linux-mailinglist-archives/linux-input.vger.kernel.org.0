Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD392F9635
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbhAQXY3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbhAQXY1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:24:27 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C88C061573
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:23:47 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id h19so10134823qtq.13
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eNfsnWiu8szuTMGd2sOAbu96KRb+SJGV448eeWs/gYU=;
        b=QJ+I541Ju6CiAPnD/HK7AGs6djorTeyhZDHYBfebhUweRn8mlvEDEag+ryjxvizpwL
         nt9oKUaXJfMuRxB3AZz1M+1nIeqLh4ZbmDxe5ravacUNCR6cli0QMWmcj85FgnA8ItkZ
         HVv/keylclhgIGMMi2MYFf1hOyaQQqbivPcfTYSURF7O9auAp7Be2KY4XJx+8NzdAhTf
         Z9xyjHGpy09yIjb8ytISbUPRGgqKUVfHFfKmB5UG3Zb6dZc935r0ugGYrLC8wCOHw0Ln
         fUKIdMoCABNRSAbZXqrW+A7BdOqn+eTaIBRpxjY1O3EyZDAsCBfmfOonH3of5O/y4WQ5
         FPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eNfsnWiu8szuTMGd2sOAbu96KRb+SJGV448eeWs/gYU=;
        b=SsSKg3i9+DtUEpDfHyxbNOtFNLPEXOREefcFeQ/EZ8ITyjmoOaTpgwzexGMrVD8BMH
         BbPEvkYc08U9boZ/AqEaiq4DhD/d3Fm6hweOOzDpVU06X3zBWeU13fwY2jvv8w4dOjGB
         LGle6NSLnzD+2fdi13nB5n/hfIiKEeJt0iarKO9tyacfBoVQheNwRNE3M8e8AS3oIbQY
         Z/eLBmebn+dD68Ip0VMfFst0t10LqhWaB7SL/z2nye8sT63Ocq39KzpiAsW+O+d5LmOD
         OasECFwi3R0japOcCFP5sxSPKAfVvbpufdG90t78eyM6SMuvTRsG+MyFXloCAaOF0uz7
         Qx3Q==
X-Gm-Message-State: AOAM532Ajd/snTSqB2+Ac3NwSK2QEV1SEfk3JEQmly8Wtp8TY9mzKqCh
        mVdLUALBzQlcB1bGvLt1K1rWaHUPfJ1pXN4H33fg1g==
X-Google-Smtp-Source: ABdhPJxOiOAO+ntkkNBUSt7eAH4TU3hGjx0FflSljMp+Al1xip5hPgcvc4vfXv02nEqGFYXrx7uWf8y7OxmqXJhAXh8=
X-Received: by 2002:ac8:6657:: with SMTP id j23mr20876021qtp.204.1610925826369;
 Sun, 17 Jan 2021 15:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20210117230956.173031-1-roderick@gaikai.com>
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sun, 17 Jan 2021 15:23:35 -0800
Message-ID: <CANndSKnYF6yW6iABtkJvaGHP1P13UpQYyTNJyQBw+retRy5YEQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] HID: new driver for PS5 'DualSense' controller
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Please ignore v3. Somehow during a last minute rebase, the sensors
patch got folded into the touchpad patch. I will separate that out
ASAP. I'm a little annoyed at myself for letting that slip through.

Thanks,
Roderick

On Sun, Jan 17, 2021 at 3:10 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Hi,
>
> I would like to share an updated version of the hid-playstation driver.
> This new revision contains a few bug fixes, but mostly features small
> code changes and minor improvements.
>
> In terms of bugs there were bugs in the sensor code. There was an overflow
> issue and EV_MSC/MSC_TIMESTAMP were not set on the device. In addition,
> the ps_device spinlock was not initialized.
>
> The biggest change in the driver was the addition of a new 'ps_get_report'
> helper function. It handles GET_FEATURE report retrieval and any error handling
> including CRC checks for PlayStation Bluetooth devices. This greatly simplified
> all the functions (dualsense_get_mac_address, dualsense_calibration_info, ..)
> dealing, which used their own report handling and error checking.
>
> Aside for these changes, there were mostly little code style changes like defining
> magic constants, cleaning up comments, cleaning up log messages, static_assert
> checks etcetera.
>
> Thanks to everyone who provided feedback through the mailing list or privately.
>
> Changes since v2:
> - Removed !Expert setting for hid-playstation from Kconfig.
> - Removed DualSense from hid-quirks table.
> - Added report size checks to dualsense_parse_report.
> - Moved mac address endianess comment to struct ps_device.
> - Added static_asserts for packed structure size checks.
> - Improved readability of battery capacity calculation using 'min'.
> - Added spin_lock_init to dualsense_create to initialize ps_device lock.
> - Fixed sensors timestamp overflow.
> - Fixed missing MSC_TIMESTAMP and EV_MSC capabilities in ps_sensors_create.
> - Used DIV_ROUND_CLOSEST for timestamp calculations to minimize rounding errors.
> - Switched to devm_kmalloc_array for lightbar allocation.
> - Added CRC32 and NEW_LEDS dependency to Kconfig.
> - Added defines for crc32 seed constants.
> - Added crc32 check for dualsense_get_mac_address and increased report size to 20.
> - Added new ps_get_report call to obtain feature reports.
> - Switched to ARRAY_SIZE in dualsense_parse_reports for touch points, accel and gyro data.
> - Changed touch point parse loop to use "struct dualsense_touch_point".
> - Improved consistency of info and error messages.
> - Unified comment style.
>
> Thanks,
>
> Roderick Colenbrander
> Sony Interactive Entertainment, LLC
>
> Roderick Colenbrander (13):
>   HID: playstation: initial DualSense USB support.
>   HID: playstation: use DualSense MAC address as unique identifier.
>   HID: playstation: add DualSense battery support.
>   HID: playstation: add DualSense touchpad support.
>   HID: playstation: add DualSense accelerometer and gyroscope support.
>   HID: playstation: track devices in list.
>   HID: playstation: add DualSense Bluetooth support.
>   HID: playstation: add DualSense classic rumble support.
>   HID: playstation: add DualSense lightbar support
>   HID: playstation: add microphone mute support for DualSense.
>   HID: playstation: add DualSense player LEDs support.
>   HID: playstation: DualSense set LEDs to default player id.
>   HID: playstation: report DualSense hardware and firmware version.
>
>  MAINTAINERS                   |    6 +
>  drivers/hid/Kconfig           |   21 +
>  drivers/hid/Makefile          |    1 +
>  drivers/hid/hid-ids.h         |    1 +
>  drivers/hid/hid-playstation.c | 1492 +++++++++++++++++++++++++++++++++
>  5 files changed, 1521 insertions(+)
>  create mode 100644 drivers/hid/hid-playstation.c
>
> --
> 2.26.2
>


-- 
Roderick Colenbrander
Senior Manager of Hardware & Systems Engineering
Sony Interactive Entertainment LLC
roderick.colenbrander@sony.com
