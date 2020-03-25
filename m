Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2C2192A35
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgCYNhV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:37:21 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34681 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgCYNhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:37:20 -0400
IronPort-SDR: EnQ15c651USx5bSveWBlSwn4rviqqjOGj7Y2ileG/lXeq+m3rv5Aum/9jfMiWNC0QAxcf7ckf4
 CdPbKK/GddCdZo7myDml14d0nk12kXX7gXFFtFAhwOf7H7Hqo43PU3WSABja9IQZ/T1jHdGHai
 2u7EMScla6hsGc97NNvg80vFovSdd0vVaOLUEa8a66QZSpkVAZl06fUHMzikQfEMG5j+7Wl66O
 k8obzPnYf7QI8K23I6e1HK0SFLdp+VQLzrL1k4Gp0IxFga82CSwa91evzyVfG0imkyroBU7FbI
 pkI=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47143580"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:37:20 -0800
IronPort-SDR: ljHn8vTxJIQ5G1NvGM0TNMXytrpYp25TluGS9uV2rvLzawDAXvssAyDyhFzzxf4O0g0yyT3C4Q
 TFXjMfWMU9Cuuzhs63iTMJSqdfBWbGN5xYacCVljiTks5bTEaXAyq6BDysJ/pOr3mzutLAPgl/
 XDOYtFelgnf7+9HieaVd6Xhfq2fuPkHEYLS14u5tztzPFCQU91Nxbhg88DPeur4LvM7B56rVrG
 sCkcdaneJ0G/dFnlHz3JSAjBpx6TOyVsxAGO5O6yYbhsIXpdiGHKjwSN1nu6YQL/pmw6MVUF5q
 phQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 55/55] Input: atmel_mxt_ts - Fix compilation warning
Date:   Wed, 25 Mar 2020 06:33:34 -0700
Message-ID: <20200325133334.19346-56-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

fix "make W=1" compilation warnings from Atmel driver
as per the compilation logs.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 7bd926f04e9f..c6e3905bb50f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2048,7 +2048,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.17.1

