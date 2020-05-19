Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE671D9F56
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 20:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgESSZG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 14:25:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56198 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729001AbgESSZG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 14:25:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 2D9082A2607
Received: by jupiter.universe (Postfix, from userid 1000)
        id 894BD4800F8; Tue, 19 May 2020 20:25:01 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 0/5] EXC3000 Updates
Date:   Tue, 19 May 2020 20:24:42 +0200
Message-Id: <20200519182447.73405-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is (a much delayed, sorry!) PATCHv2 of the EXC80Hxx support
patchset. Here is the changelog since [PATCHv1]:

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

Properties look like this after applying the patchset:

$ cat /sys/class/input/input1/{name,fw_version,model}
EETI EXC80H60 Touch Screen
00_T6
Orion_1320

Thanks in advance for looking at the patches,

-- Sebastian

[PATCHv1] https://lore.kernel.org/linux-input/20191107181010.17211-1-sebastian.reichel@collabora.com/

Sebastian Reichel (5):
  dt-bindings: touchscreen: Convert EETI EXC3000 touchscreen to
    json-schema
  Input: EXC3000: switch to i2c's probe_new API
  Input: EXC3000: add EXC80H60 and EXC80H84 support
  Input: EXC3000: Add support to query model and fw_version
  Input: EXC3000: Add reset gpio support

 .../bindings/input/touchscreen/exc3000.txt    |  26 --
 .../bindings/input/touchscreen/exc3000.yaml   |  58 +++++
 drivers/input/touchscreen/exc3000.c           | 243 ++++++++++++++++--
 3 files changed, 281 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml

-- 
2.26.2

