Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8425BD0729
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 08:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbfJIG3A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 02:29:00 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45330 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfJIG3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 02:29:00 -0400
Received: by mail-io1-f66.google.com with SMTP id c25so2404947iot.12
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 23:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aSvvfT2UXbirE2MPj8ZUc6i78OGIx4tlIoxmf5fj2U4=;
        b=A+TD2mzYCQs2rvgM1o14rhBNU5C0oJ9GdlNBurOTI1VAOJxNZLS3FcR9RMxbkuUjGb
         i0QShHoOhRx/m3nlgsNUwPHAW21pO12pbQseZu05NQQZvKUAwkC0hp34980vT7qVHqjP
         a3LKLZZddTJT6FzgMf01XVkG9CwXnfj8XoP7kIcD9MZLbUNcB1KDcmbawkizu53nWRpW
         iOSAj7kG+4V4ro8RlibvnvHWVoWz1uoAv4pv+d6qzMAccshhH9pmSe3Xf2xKGRTN2KJH
         WY1HGyIMiaF6pR8tw2vccVE55QKe4p8JHmLnFYHZr30QfBim0tUCWSjg9ehpykVqv27x
         ae3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aSvvfT2UXbirE2MPj8ZUc6i78OGIx4tlIoxmf5fj2U4=;
        b=dIbHztZbKS6hBN+13+fZlRNfalGPuOYgL/1DeR8pRKiaf+CBGIZbLxbYdZoJ0ZphD9
         aYMzyPojGWUtaM0GeNeIz/C5So3yC1cZJhvObzVdYD10MiHJMoov/iSsEvVz3AI4V3zy
         uuaaLIWhLhjD3E9TV6WBGnHWA6aQBthhWJAGDohKaXmu6ftw/1c42X3VLk7wiQkjCPtQ
         XkJXVEIF31Day/L6rx277aXYzOzxgALQW3fwR6SnXYgcwxKrWewGE/T7zUrGhqgWXCF9
         RFsrfuAsZ6z7s4jG3mDgKAoQOxkBDs5n3nPJu/Z6cfGWYudNYuJgKWvtZj9U/ItZEW4I
         kAdQ==
X-Gm-Message-State: APjAAAWpkoKSORwlcdsN9D8wmQGh4WDimfODyZet464U/YGmpfZTh4CR
        twIbPlIxeZ+7CGUTzV/CTxv8VFPbPnE=
X-Google-Smtp-Source: APXvYqwIempWg3IttaafGLj5G/sfgKhJUJBOvhSIcAOODXuidaBhhmTQgrgJvr7zIWfroxGQiG1gaQ==
X-Received: by 2002:a5d:9d52:: with SMTP id k18mr1127569iok.99.1570602539304;
        Tue, 08 Oct 2019 23:28:59 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id r22sm880844ilb.85.2019.10.08.23.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 23:28:58 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v7 0/8] HID: nintendo
Date:   Wed,  9 Oct 2019 01:28:25 -0500
Message-Id: <20191009062833.3599398-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

Daniel J. Ogorchock (8):
  HID: nintendo: add nintendo switch controller driver
  HID: nintendo: add player led support
  HID: nintendo: add power supply support
  HID: nintendo: add home led support
  HID: nintendo: add rumble support
  HID: nintendo: improve subcommand reliability
  HID: nintendo: send subcommands after receiving input report
  HID: nintendo: reduce device removal subcommand errors

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    3 +
 drivers/hid/hid-nintendo.c | 1496 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1530 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.23.0

