Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C320E8234
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732605AbfJ2HVx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:21:53 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41262 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727931AbfJ2HVw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:21:52 -0400
IronPort-SDR: zr5Ic6eedZnra8IVwJFpfLWpIzjUFGhptJLiixCBqD+w2/77jbd6oQ9IR/sxO1KIw0m+o1NJmm
 DAM27jSJvqruQ7wdVBXmMv1GguOsOHyzE2Ny6GcBROfeewbbrR4ktpE3NOcZTSYibsQuvAs9Wf
 kdBXwG8jWRzSp9voo5roWfz4rG4RJuct/pFH3g/QomTa0AgAYthNUebydPgPhVYHJbWUrEdKAX
 yqUPQPQOP6shIMfm2o2ygmxsfhP9maVfncdlIP0s8q10uuyCIdZS3eLQIMbwDqaxHblEdjSEWx
 ryQ=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663277"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:21:52 -0800
IronPort-SDR: 2ctaEyQX+QpT73um1U0gNbbJ+IPRxmmVcKL48E6byS1AVsuBrNVVdjFWGDUBVI0Rph2PR8/XJf
 0jRSqrfViMgcoZpSSQlY+xFtdTiRYRLicOEwnkxY0h0nKNp7fGmeGiquHrrZI98cechYM/wN54
 OdMqUol3f8ky2ZtUpGqeSeHVofO7QmKyeu9IulPFcFhO8sUXVhsAOT36S9b6wEGGQsELFw78OI
 V3oWrhMAlApGDl7e3g0NQWb2sAkc9MwTDbP9gja7V3QZvEMg0ZaRrRUbk92ojRyBOEGWJfkwOZ
 9uQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 27/48] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Tue, 29 Oct 2019 16:19:49 +0900
Message-ID: <20191029072010.8492-28-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

When in hover, the orientation information is not sent

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 0c885d5bd276bd9240c43aa046fc407cbe2ae864)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 0039a1804a8c..6685bda243ed 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1029,10 +1029,6 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 			distance = MXT_DISTANCE_HOVERING;
 			hover = true;
 			active = true;
-
-			if (data->t100_aux_vect)
-				orientation = message[data->t100_aux_vect];
-
 			break;
 
 		case MXT_T100_TYPE_FINGER:
-- 
2.17.1

