Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2137E334BFF
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 23:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbhCJWyV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 17:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhCJWxu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 17:53:50 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E4BC061574;
        Wed, 10 Mar 2021 14:53:49 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id hs11so42159731ejc.1;
        Wed, 10 Mar 2021 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OawhDM8ZpV0RjPs6QqjlTWNfo7z6flHF8PYYLIyQhBU=;
        b=ESe3vrbzB/UATj9ZSi4SVtJXCrxBT2El4u51f+/a8jwg3003uoE/GvE314CsC/n/Bk
         Qw3pzPdiYEofaqzAGjH1BWBwp/rckWHb27ZGGdIetB3hcLTD/MmgsBIYHURgkTdrvHuJ
         05TUcuJUuC+fPdhSnPNVfy8RB3rDo4geneyEh7XpjLD7NiHrJAtFD2qNUmaaHe9gixIX
         79/ztvkHsYNlFemgB79g7WIiBKxlsMr2K7lLD+lp7oeR2UA7Q3btM5kBfLw3spdG7E/c
         L4ERYBcnn/shw2DakCn8/Dr94Y2vhZKiy2tuvhmNyrKoJcm/HO4NGzeuXRDx0z0Ac1Ml
         mfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OawhDM8ZpV0RjPs6QqjlTWNfo7z6flHF8PYYLIyQhBU=;
        b=fxz1ls+1rNV2Kt78uzIiyROG3NrU1bC3BqofQHOWn7S2Jt+U6rMk6SJfwwymTsWIQV
         bT1HogxBiqYNkOrFaWQALAat0XIfG8JVQWFtIJIhF1c6JK0iefBFygu796OK3Bhn2lGq
         qzAn/ZWJ+kMsjlwgUWL9DHD3FNH9QbHCTDuEnsiqoE276TxVDnIojDXuFrTrx/X0L0NA
         E5BK1GNU7XeQPce4hcV4PO+5IAqwUGNSsTAnzTZtyoT9y0ltf9pok3HDik7e6Mqe8Uk7
         8AudSsuSGUyuuN78T9VbDiTRJ7aDAyW0ZvGs0LZRoVjCyS8IU5Lzd1eqasGtIPhZPyLa
         A6Qg==
X-Gm-Message-State: AOAM531PuyhFE+LLtDDFuj6RGBRkqsBACGv+w9lmAtQbqxAGk2MO3LiS
        SBWGV+o3LeHF2hz0HjYs13I=
X-Google-Smtp-Source: ABdhPJwthSqDLc2yVwkUwn1vd6m3L0O4bHOthhrXQX310jPT7nQepjJF+t1Z9H6VG41lfhqJbF5RuQ==
X-Received: by 2002:a17:906:3052:: with SMTP id d18mr191649ejd.530.1615416827897;
        Wed, 10 Mar 2021 14:53:47 -0800 (PST)
Received: from xws.localdomain ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id lu5sm377286ejb.97.2021.03.10.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 14:53:47 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] HID: Add support for Surface Aggregator Module HID transport
Date:   Wed, 10 Mar 2021 23:53:27 +0100
Message-Id: <20210310225329.2393372-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds support for the Surface System Aggregator Module (SSAM)
HID transport subsystem.

The SSAM is an embedded controller, found on 5th- and later generation
Microsoft Surface devices. On some of these devices (specifically
Surface Laptops 1, 2, and 3, as well as Surface Book 3), built-in input
devices are connected via the SSAM. These devices communicate (mostly)
via normal HID reports, so adding support for them is (mostly) just a
matter of implementing an HID transport driver.

SSAM actually has two different HID interfaces: One (legacy) interface
used on Surface Laptops 1 and 2, and a newer interface for the rest. The
newer interface allows for multiple HID devices to be addressed and is
implemented in the first patch. The older interface only allows a single
HID device to be connected and, furthermore, only allows a single output
report, specifically one for the caps lock LED. This is implemented in
the second patch.

See the commit messages of the respective patches for more details.

Regards,
Max

Note: This patch depends on the

    platform/surface: Add Surface Aggregator device registry

series. More specifically patch

    platform/surface: Set up Surface Aggregator device registry

The full series has been merged into the for-next branch of the
platform-drivers-x86 tree [1]. The commit in question can be found at
[2].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde

Maximilian Luz (2):
  HID: Add support for Surface Aggregator Module HID transport
  HID: surface-hid: Add support for legacy keyboard interface

 MAINTAINERS                                |   7 +
 drivers/hid/Kconfig                        |   2 +
 drivers/hid/Makefile                       |   2 +
 drivers/hid/surface-hid/Kconfig            |  42 +++
 drivers/hid/surface-hid/Makefile           |   7 +
 drivers/hid/surface-hid/surface_hid.c      | 253 +++++++++++++++++
 drivers/hid/surface-hid/surface_hid_core.c | 272 +++++++++++++++++++
 drivers/hid/surface-hid/surface_hid_core.h |  77 ++++++
 drivers/hid/surface-hid/surface_kbd.c      | 300 +++++++++++++++++++++
 9 files changed, 962 insertions(+)
 create mode 100644 drivers/hid/surface-hid/Kconfig
 create mode 100644 drivers/hid/surface-hid/Makefile
 create mode 100644 drivers/hid/surface-hid/surface_hid.c
 create mode 100644 drivers/hid/surface-hid/surface_hid_core.c
 create mode 100644 drivers/hid/surface-hid/surface_hid_core.h
 create mode 100644 drivers/hid/surface-hid/surface_kbd.c

-- 
2.30.1

