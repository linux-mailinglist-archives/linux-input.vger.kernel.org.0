Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007ED307195
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 09:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhA1Id4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 03:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43782 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhA1Ide (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 03:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611822721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IBdtIUDwfWamCpwn+H9Amb/H5XKi8QMaCRngaX+sBFc=;
        b=Lc2n5+4jB6VhMLKRJCwa9o+J3iCkHsIdy4o1TVYfv//fXgps2GglEyW+4r6e26hpUsaQA6
        dwHOdVctLeL8pWLX+fHFkXKbEPgTqIgnzYKTIL0QRadi0evQMykkQfCthDBpSs1/tu+bd9
        44RDdvZ0PtUDooVu4d8KgmZqntyyENM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-uqnHAIxYMXmI6bIe49RxGw-1; Thu, 28 Jan 2021 03:31:59 -0500
X-MC-Unique: uqnHAIxYMXmI6bIe49RxGw-1
Received: by mail-pl1-f198.google.com with SMTP id c18so2787721pls.8
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 00:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IBdtIUDwfWamCpwn+H9Amb/H5XKi8QMaCRngaX+sBFc=;
        b=g2UP1QAqilkHvkBQKXUITLbD1n1002j3n13B6VuOKV0Q8yRwFJANKlDsTRgy8idlMj
         MN8OnOFIreSYqD7zkONKVO44BNcGvmj/O4kTNDXVLmHlD9EGd4EJ9LVeZau1s7FH+lUu
         xQdcOSLpjGD4a10M0iHZ3Z0cb3dtDWV40o96JIIX6BCRAp8EKYqxgSsY6LV52QFAOdoo
         ecEYCCnW+/Tcre3lQE1DJZZ75amzIB8PZIragsJydOMQryJsmcaHdv2B3w4kDjo8SntY
         3gCl0xFrZXtLtspVjicV61IMPpQ50A01+bBPmLN3tbiu/I9LY9LeShWSwmmsTWZZrPv/
         X/LA==
X-Gm-Message-State: AOAM530qGT4ZljvNuOqynj2vysRq53bPhMPQRC69S2AAxCmSeUGi93Ut
        czByLKcAsxN0FPaOTDAOJGECN3rfPLTdaWUomxFIy2r7DUPYTaHykxwm0UdXcI30dwi/BLOO9zB
        UCuDGK6uADusLqfE92UkwcrMA7IcvLOm4o08yrL4=
X-Received: by 2002:a17:90b:fd3:: with SMTP id gd19mr10132899pjb.129.1611822715183;
        Thu, 28 Jan 2021 00:31:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoKoamlqIyOuKFkbSsIxcPNMNQew6/YFkOfMueEe5U/0VN+M3Hi1z6fwB2Y/ZziaiM1IQCI197GkNCz7TIgNk=
X-Received: by 2002:a17:90b:fd3:: with SMTP id gd19mr10132876pjb.129.1611822714819;
 Thu, 28 Jan 2021 00:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20210117234435.180294-1-roderick@gaikai.com>
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 28 Jan 2021 09:31:43 +0100
Message-ID: <CAO-hwJJ5r0hBNEhKvZkLevyG8mf6rQVL_7nf4XcjUi0mgErF5w@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] HID: new driver for PS5 'DualSense' controller
To:     Roderick Colenbrander <roderick@gaikai.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?Q?Florian_M=C3=A4rkl?= <linux@florianmaerkl.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

On Mon, Jan 18, 2021 at 12:44 AM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Hi,
>
> This is the same code as v3. Due to a misstake during a last minute
> rebase, the touchpad and sensors patch got combined while fixing a confli=
ct.
> The new v4 corrects that issue. There are no additional code changes.
>
> This new revision contains a few bug fixes, but mostly features small
> code changes and minor improvements relative to v2.
>
> In terms of bugs there were bugs in the sensor code. There was an overflo=
w
> issue and EV_MSC/MSC_TIMESTAMP were not set on the device. In addition,
> the ps_device spinlock was not initialized.
>
> The biggest change in the driver was the addition of a new 'ps_get_report=
'
> helper function. It handles GET_FEATURE report retrieval and any error ha=
ndling
> including CRC checks for PlayStation Bluetooth devices. This greatly simp=
lified
> all the functions (dualsense_get_mac_address, dualsense_calibration_info,=
 ..)
> dealing, which used their own report handling and error checking.
>
> Aside for these changes, there were mostly little code style changes like=
 defining
> magic constants, cleaning up comments, cleaning up log messages, static_a=
ssert
> checks etcetera.
>
> Thanks to everyone who provided feedback through the mailing list or priv=
ately.

From a rough review, the code looks good to me. However, I'd like to
have Baranab=C3=A1s reviewed-by tag at least given all the work he has been
doing. There were other people involved in the various versions, and
it would be nice if we can get some credits for them too.

So for anyone involved in the discussions, could you give us your
reviewed-by or tested-by if you feel like?

[Roderick, as a general rule of thumb, it's better IMO to keep Cc-ed
the people who gave feedback, so they are notified of a new version.]

Cheers,
Benjamin



>
> Changes since v3:
> - Separated touchpad and sensors into separate patches due to rebase miss=
take.
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
> - Fixed missing MSC_TIMESTAMP and EV_MSC capabilities in ps_sensors_creat=
e.
> - Used DIV_ROUND_CLOSEST for timestamp calculations to minimize rounding =
errors.
> - Switched to devm_kmalloc_array for lightbar allocation.
> - Added CRC32 and NEW_LEDS dependency to Kconfig.
> - Added defines for crc32 seed constants.
> - Added crc32 check for dualsense_get_mac_address and increased report si=
ze to 20.
> - Added new ps_get_report call to obtain feature reports.
> - Switched to ARRAY_SIZE in dualsense_parse_reports for touch points, acc=
el and gyro data.
> - Changed touch point parse loop to use "struct dualsense_touch_point".
> - Improved consistency of info and error messages.
> - Unified comment style.
>
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
>  drivers/hid/hid-playstation.c | 1485 +++++++++++++++++++++++++++++++++
>  5 files changed, 1514 insertions(+)
>  create mode 100644 drivers/hid/hid-playstation.c
>
> --
> 2.26.2
>

