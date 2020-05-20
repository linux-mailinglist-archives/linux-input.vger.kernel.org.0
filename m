Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D798A1DB871
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 17:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgETPjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 11:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgETPjt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 11:39:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E01C061A0F;
        Wed, 20 May 2020 08:39:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 39A2F2A0313
Received: by jupiter.universe (Postfix, from userid 1000)
        id 5A9CF4800F8; Wed, 20 May 2020 17:39:45 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv3 0/5] EXC3000 Updates
Date:   Wed, 20 May 2020 17:39:31 +0200
Message-Id: <20200520153936.46869-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is PATCHv3 of the EXC80Hxx support patchset.

Changes since [PATCHv2]:
 - add #include <linux/size.h> for SZ_4K and SZ_16K (kbuild test bot)
 - fw_version_show must be ssize_t (kbuild test bot)
 - rename YAML binding file to include eeti, prefix (Enric)
 - noise from gpio-reset patch (Enric)
 - add comment for the retry loop (Enric, Martin)
 - document sysfs entries (Enric)

Changes since [PATCHv1]:
 - prepend new patch converting binding document to YAML
 - prepend new patch switching to I2C probe_new
 - append new patch adding reset-gpio support
 - use explicit compatible values for the touchscreen chips instead of
   a wildcast. Since the documentation, that I have is very vague let's
   use different values for exc80h60 and exc80h84. This avoids wildcard
   DT entries and means we are prepared when noticing differences
   between the chips.
 - add accidently removed terminator entry in exc3000_id
 - use device structure with max_xy and name (suggested by Martin)
 - use SZ_4K, SZ_16K defines (suggested by Dmitry)
 - harden event check, so that MT1 and MT2 based chips only allow
   their own event type.
 - write more detailed commit description in the fw_version/model
   sysfs patch to explain why the values are not cached and why
   the simpler read(); sleep(); write() approach has not been used
 - use DEVICE_ATTR_RO() in fw_version/model patch to improve readability
 - fw_version/model: replace memcpy + null termination with strlcpy
 - fw_version/model: increase buffer size for weird firmware versions
 - fw_version/model: use sizeof() instead of hardcoded buffer sizes
 - simplify exc3000_query_interrupt() by moving the complete() call to
   the exc3000_interrupt().

I think I only ignored one review feedback, that the fw_version and
model sysfs nodes are attached to the input device instead of the
i2c device. This was done to avoid being racy:

http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/

Thanks in advance for looking at the patches,

-- Sebastian

[PATCHv2] https://lore.kernel.org/linux-input/20200519182447.73405-1-sebastian.reichel@collabora.com/
[PATCHv1] https://lore.kernel.org/linux-input/20191107181010.17211-1-sebastian.reichel@collabora.com/

Sebastian Reichel (5):
  dt-bindings: touchscreen: Convert EETI EXC3000 touchscreen to
    json-schema
  Input: EXC3000: switch to i2c's probe_new API
  Input: EXC3000: add EXC80H60 and EXC80H84 support
  Input: EXC3000: Add support to query model and fw_version
  Input: EXC3000: Add reset gpio support

 .../ABI/testing/sysfs-driver-input-exc3000    |  15 ++
 .../input/touchscreen/eeti,exc3000.yaml       |  58 +++++
 .../bindings/input/touchscreen/exc3000.txt    |  26 --
 drivers/input/touchscreen/exc3000.c           | 245 ++++++++++++++++--
 4 files changed, 301 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-input-exc3000
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.txt

-- 
2.26.2

