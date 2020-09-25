Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FF72789FF
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 15:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgIYNxD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 09:53:03 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:19050 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYNxD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 09:53:03 -0400
IronPort-SDR: c8wUFhdR6K6QGNG3SREYP8N0uOorI4VcCH0yVQrUMdbbqdDOcYoR+h4YMjqcTtMBcCmsvVsQDp
 UyJP5jVfbH8ZqnrAg4QwqxMmzEFeL2mA7P+dS/7nA8nkaeGcJnyNQJ2Ou/bj4FgMlAIu4Js5yD
 OW18WqJsaO0sGUDT7GcLINU45+0oI71yxWOmJcXk17MbN7xAs7nNMqPRUCI9C6DCTTcV8QfWBp
 D/IxTCtPSt2Yk6HJuqrmgJPJXpsnDA13gXZNzxskIaCNkLBowmCNI19BZ0lQH3zLvaNBAZdJ2F
 xSI=
X-IronPort-AV: E=Sophos;i="5.77,302,1596528000"; 
   d="scan'208";a="53316549"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 25 Sep 2020 05:53:02 -0800
IronPort-SDR: rdOEOuP9sZLVfj/gP4M2edaea4IT4kA/lU7bg7nEzuxt8UG6F/rnwDx4BOrYk84A8bzqUys1g7
 x3yexRdtFo/W/eXzwA8zAhWrgEw/sY4MMTBfuLvoUXnOL/4ONQN2Tgy3bzQN3RWMHxOskva6Jq
 Jcq2gcixwfIBRYQnDqD9HsYexlgPWp3gfuc/10rWT5OjkaXLN0f29oewY1DFSsOFDfciNvBgmX
 G1rnT5yVWB7xUR7J9c1xbng3Eo7SSoQIztzVujCVdX7oPGlLLaW5FwdPHX5rXILlsxXKCubLO7
 SB8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v2 0/3] implement I2C retries for mXT1368
Date:   Fri, 25 Sep 2020 22:52:54 +0900
Message-ID: <20200925135257.21138-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to datasheet, mXT1386 chip has a WAKE line, it is used
to wake the chip up from deep sleep mode before communicating with
it via the I2C-compatible interface.
    
if the WAKE line is connected to a GPIO line, the line must be
asserted 25 ms before the host attempts to communicate with the
mXT1386.
If the WAKE line is connected to the SCL pin, the mXT1386 will send
a NACK on the first attempt to address it, the host must then retry
25 ms later.
    
This patch adds compatible string "atmel,mXT1386" for mXT1386 controller,
when I2C transfer on mXT1386 fails, retry the transfer once after a
25 ms sleep.


Jiada Wang (3):
  dt-bindings: input: atmel: add compatible for mXT1386
  Input: atmel_mxt_ts - implement I2C retries for mXT1368
  ARM: tegra: add mXT1386 compatible

---
v2:
add bool retry_i2c_transfers to struct mxt_data,
to indicate whether retry is needed when i2c transfer fails

v1: initial version
---
 .../bindings/input/atmel,maxtouch.txt         |  1 +
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c      | 62 +++++++++++++++----
 3 files changed, 52 insertions(+), 13 deletions(-)

-- 
2.17.1

