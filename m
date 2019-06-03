Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B78A132849
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 08:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbfFCGGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 02:06:55 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:39973 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfFCGGz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 02:06:55 -0400
Received: by mail-it1-f193.google.com with SMTP id h11so24771262itf.5
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2019 23:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlNMFFxZ+0TymNIZUF0P3o7jz7i5MO2/cD8mQ8ReaRo=;
        b=MSqGHZZBktfXDaDjbCbDqETgGPvC7iKTHrrVWBVukV6UVrjo3//6VYVellRB13ovEl
         e9Zv4gJvCSYasNJTS1kGalU3NYnr6kx6VJO4gp/9DXohx9aW+JlS5DePbuVMBpQEWKhV
         vTqSx3aYHq9xcRuN3rF56Pgu414b/qUSN0qJ++SKBevg5UgoFSXkp/cdSrdRde8vFt17
         AhISfTy+QH7L0E/k0RYAMco/vSP5xryJnFebdfl/pS4FjQMUYfKW3B+K/eKgs04nOJkC
         IOascr6oH2JAjtQLVUn7RJwm2ZS1ne7MA7HCbidQW8dMW7zQA6U/VSodJWLthR4/EReg
         tRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlNMFFxZ+0TymNIZUF0P3o7jz7i5MO2/cD8mQ8ReaRo=;
        b=VIuGE/jxByuC88VDra7eNGTuOeqhehgbfqRbSPq3TEypOYe5q56Czo/KHggvhguLkX
         QWg1/2+EaRde6gaOkXSy0KfxKlVO3EZFvdxEgOt63tJw7L1RFZE/ooSuI4oQwFSYaoV7
         AdF3/i8DiWUup+MRmkvJlEJdc8/BBw7XTX8MszAZ+NUp3ISS7HCNQ5zmq+19EvlLiPID
         ZR8AcwsSkzg5ej1Fy/zOCds6RIXhKGhYkfqnmtssN1ap8VWNnMkSxU+/yrTM6QEyJJgr
         uE9yj0obAUFkrC6HjieSnizPnlAViayOmh6zJo7ONRP6vpJK5+Br2R3wbiDla5E+JF4u
         gSEg==
X-Gm-Message-State: APjAAAVDpAQImHugCANz5KBU0MygEzwlLoH7Es0Wx+ggghi0sYdXR441
        a47FtKgSAOqbU4HSjN98Tdd0rgGTcv4=
X-Google-Smtp-Source: APXvYqxyS5NO65fBxmrSgCJOIQPYM8vC1gNO7qK7WNuXYsdU75K49RPUiCnPwf2rlT8NANIoq1LEyA==
X-Received: by 2002:a24:56d1:: with SMTP id o200mr15714057itb.93.1559542014390;
        Sun, 02 Jun 2019 23:06:54 -0700 (PDT)
Received: from localhost.localdomain ([136.61.179.39])
        by smtp.gmail.com with ESMTPSA id 14sm6124808itl.1.2019.06.02.23.06.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 23:06:53 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v5 0/5] HID: joycon
Date:   Mon,  3 Jun 2019 01:06:39 -0500
Message-Id: <20190603060644.10338-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

Daniel J. Ogorchock (5):
  HID: joycon: add nintendo switch controller driver
  HID: joycon: add player led support
  HID: joycon: add power supply support
  HID: joycon: add home led support
  HID: joycon: add rumble support

 MAINTAINERS              |    6 +
 drivers/hid/Kconfig      |   24 +
 drivers/hid/Makefile     |    1 +
 drivers/hid/hid-ids.h    |    3 +
 drivers/hid/hid-joycon.c | 1414 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 1448 insertions(+)
 create mode 100644 drivers/hid/hid-joycon.c

-- 
2.21.0

