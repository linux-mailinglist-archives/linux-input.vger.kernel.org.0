Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23DEFF0EB3
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbfKFGG4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:06:56 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:39003 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbfKFGG4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:06:56 -0500
Received: by mail-yw1-f68.google.com with SMTP id k127so9211516ywc.6
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ddTvOK3qkIEnK+p6TDMXkrczXr459WF5fnS4lr0Fpac=;
        b=lNxaoa0noHLrXfLMe4VMMkBfZjPq+DPNbNmUPJTaQupkPZ3HfxyzlFikvLt+FDqagI
         xbrPjaN5Y92NrH6ozKEZ0oH77ymq1YRBLh/Je0t8Ox8vHjSyjkNPYl48uMsmBb4m5g7V
         38xIinz632g2dobYMHiFrzCK2Lo5eJZCGjq7nHegDcrQw89LdL4QSEcMJOjckeEo6VsO
         BZgwsG4R0ADN+rQcYnZ6jBdStvPbBdCoJwOko3ityf7teOupsuwcpNQBYoJLUQ1vcx48
         HaN9T7I0Eepy37pDzUb3q03eSbWPw4pMLYd561zKHvGltchZu6QQ8EoPEag+ZJ+b8Tg6
         WL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ddTvOK3qkIEnK+p6TDMXkrczXr459WF5fnS4lr0Fpac=;
        b=Kht7lsCtP08wYxyyYcQC0m5dh0nrv9427G27dLKIywuhwO/NKMW61RsL2hdwDSGF7v
         IvanrojSyxERanCm+JCbCABwD5Vv54epePvPffqLweqyCY62rD06Cscugn+0Pli1DmCC
         kuWjEkiR64leNX4u9/QLBMkrubtvQDe0Ma65/1GNDhExbg7KEGFFo73xNy6wDCspAkR6
         64vbo/tdf11OCH2iOXhgcGRQJWQh3CXeYGJqs25U65WReiLHRLpjuGgj0VVo27+1Xzf3
         IbR+cy9UVT3Iv5Z5YgY8RB9C1yKgdB/vmF5tDdpCyx1L+iaNoA4vP8NGO9B22QkI+mKM
         2NNg==
X-Gm-Message-State: APjAAAX9JOPcKYgSM6XiqHxbsIeWOMLU/ZTKNxaRdCzcreo2GHo6mTlF
        3kNx1eeA6J7g6lZC7Bqpk/MqiQp9Luc=
X-Google-Smtp-Source: APXvYqzHGwJVAyEZkauyqAa3OnAQCXBzXWxUx7dFFqPTqO8rJ9CN75ZSAOXk9NqdQjUdTRD+bxraDw==
X-Received: by 2002:a81:4bc4:: with SMTP id y187mr437317ywa.41.1573020414424;
        Tue, 05 Nov 2019 22:06:54 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:06:53 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 00/10] HID: nintendo
Date:   Wed,  6 Nov 2019 00:06:38 -0600
Message-Id: <20191106060648.3018478-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a pretty minor change. Importantly it resolves a couple compiler
errors when building the driver with a version of gcc prior to 8. It
seems that gcc 8 and above are more relaxed about using const integers
to initialize other const values and in case statement matching.

It also sets the input device's uniq value to the controller's MAC
address. This will be useful once gyro/accelerometer support is added in
the future (likely as a second input device). Since the joy-cons can
also be used via uart on the nintendo switch's serial rails, this is
also a useful mechanism for associating one joy-con between two drivers
(hid-nintendo and any serdev joy-con driver written to run on the
nintendo switch itself).

Version 9 changes:
  - Fixed compiler errors on gcc versions older than 8.2
  - Set input device's uniq value to the controller's MAC address

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

Daniel J. Ogorchock (10):
  HID: nintendo: add nintendo switch controller driver
  HID: nintendo: add player led support
  HID: nintendo: add power supply support
  HID: nintendo: add home led support
  HID: nintendo: add rumble support
  HID: nintendo: improve subcommand reliability
  HID: nintendo: send subcommands after receiving input report
  HID: nintendo: reduce device removal subcommand errors
  HID: nintendo: patch hw version for userspace HID mappings
  HID: nintendo: set controller uniq to MAC

 MAINTAINERS                |    6 +
 drivers/hid/Kconfig        |   24 +
 drivers/hid/Makefile       |    1 +
 drivers/hid/hid-ids.h      |    3 +
 drivers/hid/hid-nintendo.c | 1558 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1592 insertions(+)
 create mode 100644 drivers/hid/hid-nintendo.c

-- 
2.23.0

