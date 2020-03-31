Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3526199444
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730619AbgCaKxn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:43 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730946AbgCaKxm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:42 -0400
IronPort-SDR: cs4m7RbYzpTVVfnPAxKfUQDAlJkAHFQqqDTBIwGhOVCG4Fee/1Ne8/A3JMfF/HAbr6970xsfwc
 XHeQli4H6kpmY1dU5YNab0ITiyd64IOolSo90slStPlnd3Fy5RGds//9sevPKF0qpd8Ji5oYQ5
 mMBgFD5mxTFVxLfbtr2QN2FA3DsjLap1PC8bCCaSutAhcQLWVgwp0hHjmO43mzt5VWSK6USztx
 wm53Jne3+hRBOKvgtHpQB+JHOu5Lt7ZNiIOuWMLStyH1CdwDodW6Tk2kPo1MYs/d/KdzEtyQbk
 qzQ=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330838"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:42 -0800
IronPort-SDR: +bMCQJJLPyqQABm5RnUXGfLNY9Hj6Vn8Rgt5hxaSnEmP2wMyR4frc0uc8Wfk1nE2wYwkH6W45y
 fNH8eckyDYA9xgoBi4n6uLU295Nhxjux1peD7SqJ1zzLtEgT0uw4dclDHtd37lVAF90JgjIY1G
 gBrmKAdZKB92z+RZwDsnCfiRoHSHCmxf3SvzttomhG5/ijL6MFc1YwoOlLv8pHd//T+LluRGQn
 W2+UWOTbenVP8qVFClPHDRak+gYf3DIx8Jwahvj+ubFfOll8kuGThmToKU0Z/3oJhVH26Waxd0
 7Hw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 44/55] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Tue, 31 Mar 2020 03:50:40 -0700
Message-ID: <20200331105051.58896-45-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dean Jenkins <Dean_Jenkins@mentor.com>

mxt_process_messages_until_invalid() failed to propagate the error
code from mxt_read_and_process_messages() so return the error code.

Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 384b53717139..bbec5a8e0bb6 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1561,6 +1561,8 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	/* Read messages until we force an invalid */
 	do {
 		read = mxt_read_and_process_messages(data, count);
+		if (read < 0)
+			return read;
 		if (read < count)
 			return 0;
 	} while (--tries);
-- 
2.17.1

