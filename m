Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623BBD58F4
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 02:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfJNAWr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 20:22:47 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36212 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbfJNAWr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 20:22:47 -0400
Received: by mail-io1-f66.google.com with SMTP id b136so34287331iof.3
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eAWzHU02QrIg+bhG/iMKBCX2ceiJYJeWnFbLUuBLe6I=;
        b=mU1tnvgj6fmXKuYpOOB/s6TNGgZ9BZ0IEiPv0eEvH9yNoTCSlXftKn7WpXUd7aFtPN
         JRPhRYpsEuTloecJRPKWU7fYp10e2AH/tCUbODfK92X168PVsZCg5/KAJvRFO2AunWUT
         D0Y+zwRCm3zDl3PvalEYyD518zGpajc4+Gtoy0MkOY4eiiRfFe3qcMYkd26h2iEMWMhX
         l3ZTdrnln2GGQgufnm425JQTA5Tc2847L1vwNioOBllv8qtTJTXOi0kABNQc60HS4sPV
         5tjqcfpC5yyBO5fq16Vo1a/Bvf/nOVYLXvoQYIgG+U36Kex9laF3z2rig3KZcC5bVzfe
         onDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eAWzHU02QrIg+bhG/iMKBCX2ceiJYJeWnFbLUuBLe6I=;
        b=jfcmcnJlgQqh9yOIauAsRqcENOOYFWLTfI5wvX9UX25zaHJe/HqeqwbX/ty8d+BIeY
         5AMXTRDRskw6iJ4o/bWF8k9EeEbQeFe/DPuqu3erD930JWLreohG70CulIFHgAdHrJBg
         a8qTR0ihM7qQgRGVgLHDOblA35qy/x4fxdcSG9gtvGeNzS1ixBEcf7ibNhwClHpzsndX
         GCDFSpJFFUBYA+Eytjw9mO667atfvAQx7VVOFaU9yCx1kw0RYPYkIunSxAdya71QDY0Y
         ZSIz3UahhXyTg0AWN9ZNe5acLvo+QowSqgaoLcq3nMxjX025mq0QeKR49xqidrN046s5
         1DLg==
X-Gm-Message-State: APjAAAU3j36kIpWkrzxS6pz6zJ9DbCv2114/tqOUVKm5Oia/a4imsTFr
        xoMcqsGhknSvTOwXOY+gz4xoa1Di
X-Google-Smtp-Source: APXvYqypSvmEFVxcWxGDnI0yHXA9WY5XYOWVaSFA7LenL8eC2TdZ4fRB/68ZzPHz+kLc0VcrzMJdRw==
X-Received: by 2002:a6b:f30f:: with SMTP id m15mr11839741ioh.44.1571012565689;
        Sun, 13 Oct 2019 17:22:45 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id s201sm22103963ios.83.2019.10.13.17.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 17:22:44 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v8 0/9] HID: nintendo
Date:   Sun, 13 Oct 2019 19:22:32 -0500
Message-Id: <20191014002241.2560195-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I think I'm finally satisfied with the subcommand sending reliability.
I've left a controller plugged in for hours constantly blinking the
player LEDs and sending rumble data without any dropped subcommands.
Unless someone finds an issue or something to improve with this
patchset, I think it's in a stable place.

Version 8 changes:
  - Corrected the handshaking protocol with USB pro controllers. A
    handshake now occurs both prior and after the baudrate set. This
    doesn't appear to have a noticeable difference, but it more
    accurately follows documentation found online.
  - Fixed potential race condition which could lead to a slightly longer
    delay sending subcommands in rare circumstances.
  - Moved the rumble worker to its own workqueue, since it can block.
    This prevents it from having a negative impact on the default kernel
    workqueue. It also prevents dropped subcommands due to something
    else blocking the kernel workqueue. The benefit is most obvious when
    using multiple controllers at once, since the controller subcommand
    timings are very picky.
  - Added a patch to set the most significant bit of the hid hw version.
    Roderick had mentioned needing to probably do this awhile ago, but I
    had forgotten about it until now. This is the same thing hid-sony
    does. It allows SDL2 to have different mappings for the hid-nintendo
    driver vs the default hid mappings.

Version 7 changes:
  - Changed name to hid-nintendo to fit modern naming conventions
  - Removed joycon_ctlr_destroy(), since it wasn't needed an could
    potentially invalidate a mutex while it could be in use on other
    threads
  - Implemented minor code improvements suggested by Silvan
  - The driver now waits to send subcommands until after receiving an
    input report. This significantly reduces dropped subcommands.
  - Reduced the number of error messages when disconnecting a
    controller.

Version 6 changes:
  - Improved subcommand sending reliabilty
  - Decreased rumble period to 50ms
  - Added rumble queue to avoid missing ff_effects if sent too quickly
  - Code cleanup and minor refactoring
  - Added default analog stick calibration

Version 5 changes:
  - Removed sysfs interface to control motor frequencies.
  - Improved rumble reliability by using subcommands to set it.
  - Changed mapping of the SL/SR triggers on the joy-cons to map to
    whichever triggers they lack (e.g. a left joycon's sl/sr map to
    TR and TR2). This allows userspace to distinguish between the
    normal and S triggers.
  - Minor refactors

Version 4 changes:
  - Added support for the Home button LED for the pro controller and
    right joy-con
  - Changed name from hid-switchcon to hid-joycon
  - Added rumble support
  - Removed ctlr->type and use hdev->product instead
  - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translating
    to capacity percentages
  - Misc. minor refactors based on v3 feedback

Version 3 changes:
  - Added led_classdev support for the 4 player LEDs
  - Added power_supply support for the controller's battery
  - Made the controller number mutex static
  - Minor refactoring/style fixes based on Roderick's feedback from v2

Version 2 changes:
  - Switched to using a synchronous method for configuring the
        controller.
  - Removed any pairing/orientation logic in the driver. Every
    controller now corresponds to its own input device.
  - Store controller button data as a single u32.
  - Style corrections

Daniel J. Ogorchock (9):
  HID: nintendo: add nintendo switch controller driver
  HID: nintendo: add player led support
  HID: nintendo: add power supply support
  HID: nintendo: add home led support
  HID: nintendo: add rumble support
  HID: nintendo: improve subcommand reliability
  HID: nintendo: send subcommands after receiving input report
  HID: nintendo: reduce device removal subcommand errors
  HID: nintendo: patch hw version for userspace HID mappings

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    3 +
 drivers/hid/hid-nintendo.c | 1518 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1552 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.23.0

