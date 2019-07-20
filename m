Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6922B6EFB8
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2019 17:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfGTPFv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jul 2019 11:05:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55110 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfGTPFv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jul 2019 11:05:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so31236339wme.4;
        Sat, 20 Jul 2019 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SgTZjNZcK7fh7PMsMi2FbcQDp65/1AY4zVRFhCApHSI=;
        b=QBXl8MlgOZyILQgUg4aDW/K7ySz/UG9/TIrFTn1PBeJUy6FKZxV72JeD0mLs6bkIO+
         CFiHhP1WaEZQHc7K0ovi2iE6uqYCNSMEZg0ra8cOkSp06GAlZOxaKAH8kW3AaCXEL43r
         Uv3aIsdwIUqiFn0n794yJrN8cAFpbA9NWWJgC5VHTdzux/FkMDTHLewWpfS9bzaP5VYy
         folmex7VJFIVIxg2jkEPchn1FiV+vDmiX638Rrr54sucxXooN9E5nyX9E1h3VON2G/CC
         lCoiHDRtZfoIMthFtCfdX1CFEPkccs9yOHnML2hR68hNNOW4qnL5D8fDQjZskRVQ8QQ7
         oZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SgTZjNZcK7fh7PMsMi2FbcQDp65/1AY4zVRFhCApHSI=;
        b=LuJL5ynlEP8FCnwIzqcFCj5838EciG2mdYUGcyJWMDaj58STqqyEA/GCLuG1EQlhCF
         QjAMSwPJrZxB1U/Lu9u/+u9x15H77N8sINgmWsM+TeAyQNVKBs0BAkgjUI0ve7X0nFum
         +rBswFEHZsjikxlWDsbrp9NeX4CmL0sd9dR6jKosWxGFSIUNFnq7YyXs8g9Y9Y/ZOktM
         8V3SS4JRdKnv8rEjQN1B72Tzlcb0op55X/Po1JNgmfgjOZz58BcKHiz6UKrn5+a29lrZ
         1a18w4ZraMkdVhTmuKEb8bN/MQ1IRR6hLcrqT6nhOu1EO5p8z4HF24wTi/1NRkF6D2ks
         exGg==
X-Gm-Message-State: APjAAAU/n3Kv02H6J7UC3MPC7fLQ7+/e+/3v8xnyT78TyyBkxLCgIg9S
        nfOrq5e/6Q9E43mJcoZ8FHvR/noK
X-Google-Smtp-Source: APXvYqz3MZTl2tY4a2Z9LDc0IrkyNvcJQqV36Oxo1GXsjzaWn+3w25IYlgRwFhECJDhO2DjGad97MQ==
X-Received: by 2002:a7b:cb94:: with SMTP id m20mr51720738wmi.144.1563635147979;
        Sat, 20 Jul 2019 08:05:47 -0700 (PDT)
Received: from xws.fritz.box (pD9EA3BA8.dip0.t-ipconnect.de. [217.234.59.168])
        by smtp.gmail.com with ESMTPSA id g8sm38326864wme.20.2019.07.20.08.05.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 20 Jul 2019 08:05:47 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v3 0/2] Support for buttons on newer MS Surface devices
Date:   Sat, 20 Jul 2019 17:05:09 +0200
Message-Id: <20190720150511.95076-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds support for power and volume buttons on 5th and 6th
generation Microsoft Surface devices. Specifically, it adds support for
the power-button on the Surface Laptop 1 and Laptop 2, as well as
support for power- and (on-device) volume-buttons on the Surface Pro 5
(2017), Pro 6, and Book 2.

These devices use the same MSHW0040 device as on the Surface Pro 4,
however, whereas the Pro 4 uses an ACPI notify handler, the newer
devices use GPIO interrupts to signal these events.

The first patch of this series ensures that the surfacepro3_button
driver, used for MSHW0040 on the Pro 4, does not probe for the newer
devices. The second patch adapts soc_button_array to implement the
actual button support.

Changes in v3:
  - [PATCH 1/2] platform/x86: surfacepro3_button: Fix device check
    - Changed subject line to fit conventions.
    - Added comments to clarify ACPI/DSM specific behavior.
    - Change return type of introduced device check function to bool.

  - [PATCH 1/2] Input: soc_button_array - Add support for newer
      surface devices
    - Changed subject line to fit conventions.
    - Explicitly require CONFIG_ACPI via Kconfig instead of guarding
      with #ifdef CONFIG_ACPI in code.
    - Add supported Surface devices to module description in Kconfig.
    - Allow -EPROBE_DEFER and other errors to be propagated from
      gpiod_get.
    - Fix deferral process in case GPIO subsystem is not initialized.

Changes in v2:
  - [PATCH 1/2] platform: Fix device check for surfacepro3_button
    No changes.

  - [PATCH 2/2] input: soc_button_array for newer surface devices
    Ensure the patch compiles without CONFIG_ACPI.

Maximilian Luz (2):
  platform/x86: surfacepro3_button: Fix device check
  Input: soc_button_array - Add support for newer surface devices

 drivers/input/misc/Kconfig                |   6 +-
 drivers/input/misc/soc_button_array.c     | 141 ++++++++++++++++++++--
 drivers/platform/x86/surfacepro3_button.c |  47 ++++++++
 3 files changed, 178 insertions(+), 16 deletions(-)

-- 
2.22.0

