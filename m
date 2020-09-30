Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC03F27EC12
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 17:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgI3PNH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 11:13:07 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:9476 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgI3PNE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 11:13:04 -0400
IronPort-SDR: 6Anc4nr5oU8XvQrGJJniItZuZKLBgVjp9y8pQsOOXIhcz3X96H0iqamr7kiuuHwXErsx22z5fO
 UUnSvCjMNewlzRS/Zx3hHQkbrAP3Ev46pNhfglEZoXpAZhMw18IDUMoV4VNWKRTK+WBHB41HEj
 Ts+yuwBZlfgu1Wot8VeuSsBfPAHYwoVaceF7sZzlW7NwWRpxbgNcKrEr3Dz0kgL46BoHQN4B0p
 vYqn+jBgKSkbNy/sHII7419GL+m0FiWE4/3EvQNF2QPa+ZG/3+6OU9KvzzuHE/vp/hBIOv6dZM
 5LU=
X-IronPort-AV: E=Sophos;i="5.77,322,1596528000"; 
   d="scan'208";a="53484658"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 30 Sep 2020 07:13:04 -0800
IronPort-SDR: 6IY6l9bHcwso4ZDr9MYtr+cFNKFn7ryaW26lQzqGIP6ASGpVymFV1EBcrR0J03wYz64Qiir+uL
 OPWaBI3XB+j5JlzPZ35mwqoR9KV1uIBnxRhruzptSbZuqWEnTertrCaUqlMp7PkKlnhR7+0FGq
 fZ4zwiYx5T2h9C8iAch/46SuXOZ0I7Nf4+AaYRHJzCxRt8eDr9UhfIgPxwiS0Vm45t+sEltX7L
 UcpmSl/K2BOUVLYPY1smNK8NtzWzz5ukIrFX0jCUBKMeCzdEx61ZIDbvg694MFsI2jCRc88h+D
 R4w=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 0/3] implement I2C retries for mXT1368
Date:   Thu, 1 Oct 2020 00:12:56 +0900
Message-ID: <20200930151259.18119-1-jiada_wang@mentor.com>
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
v3:
change compatible string to lowercase

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

