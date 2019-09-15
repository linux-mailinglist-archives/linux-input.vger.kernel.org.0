Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30324B32A6
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 01:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbfIOXcA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 19:32:00 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45631 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIOXcA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 19:32:00 -0400
Received: by mail-io1-f65.google.com with SMTP id f12so74548473iog.12
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 16:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S2kep/1+JPP6zX9zUa/D921qTfaFD3lQCcuXBKOpOgg=;
        b=tAe+ZfuXEw/AgTz9X+HJgPP1wISx+87wDgDmI3tXHfzrd2NObjsC1DQkkI1Y6zV1PW
         DvVCmK17ZYYAVwJSHlHxWmVtyjhg6nfJB9MpAtrSC7RL10Duh7uQCRREHFI0Wwz4C6UG
         GAfA7K4+4TBB7tv/wZogEnBXpXfcEkNHD1Y9v3TkBQX7OBdnt2nR3j07RRvwnd28/ez4
         FALauCBzCwTwzjjMWen62/EkmbWKHYLK6Om3uwxE2hMbfcKx8dHocSHm6Nla38CjgS6v
         IODWBxoOA5tIf5OCV89JGxIoe2EBKjmpfqn5jOV+sNuOUiAkZ66pV8XuMz6R6UTlwl1x
         GHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S2kep/1+JPP6zX9zUa/D921qTfaFD3lQCcuXBKOpOgg=;
        b=ftgjZd3OW5MqolzTsVd7oBzwiCrDEhUXMs9QEEPH8Kfc4Dwp78YuZoSeza3W6yaOsQ
         x4Ntqkli67+lM+eo3vTkUSVmE+S/J8JvwyKFUFJB7m4sn2hwCXWpMs+ItZys/v691taA
         utIaqEHsnq5Y28+VgMM79aTzIJ2lh5YauRgnjy78kkHXzd+v/7w8rLFe2jj+UPZa6jhm
         JV/rOd/V1PnQ8qKT/FUePTomqAAQCx8b3Pf6hvw3xur61bP+P1kqhLNHOtnGQBg30rzz
         zBMzTV8E9BbvqWezoVeAQVIY5hZ/It6rPca3Brs0nbJtKQBCDOr3D422fnx1Znycfj2u
         yEGQ==
X-Gm-Message-State: APjAAAU7tk06s0fNvesa7EnVXthyihbN7lHDchqN4rFjMSLOoc24yXiK
        IC2v0xm2oa2rQ0uH+xT/X7ZLFxU1AOQ=
X-Google-Smtp-Source: APXvYqxTEiN4ZAA8BWInq1LQ5aI1u+91zyS6y1VZSu9EHevE+JqHZG5269mYSTDpI6ZL49Oz8d1Wgg==
X-Received: by 2002:a5e:9319:: with SMTP id k25mr13195907iom.290.1568590319041;
        Sun, 15 Sep 2019 16:31:59 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.81])
        by smtp.gmail.com with ESMTPSA id c12sm22620245ioo.67.2019.09.15.16.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 16:31:58 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v6 0/6] HID: joycon
Date:   Sun, 15 Sep 2019 18:31:34 -0500
Message-Id: <20190915233140.244347-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

Daniel J. Ogorchock (6):
  HID: joycon: add nintendo switch controller driver
  HID: joycon: add player led support
  HID: joycon: add power supply support
  HID: joycon: add home led support
  HID: joycon: add rumble support
  HID: joycon: improve subcommand reliability

 MAINTAINERS              |    6 +
 drivers/hid/Kconfig      |   24 +
 drivers/hid/Makefile     |    1 +
 drivers/hid/hid-ids.h    |    3 +
 drivers/hid/hid-joycon.c | 1461 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 1495 insertions(+)
 create mode 100644 drivers/hid/hid-joycon.c

-- 
2.23.0

