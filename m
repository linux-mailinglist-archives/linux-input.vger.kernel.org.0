Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A01DF0F8F
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731640AbfKFHDh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:37 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:9041 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731619AbfKFHDg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:36 -0500
IronPort-SDR: iRc+L2Nm3wDWpmGQHoOhkRdNZJbF1XeA+F7w6AsSXqxLx7waeTaVFTG3QbYPXLq7Ke4aD3LLBN
 RnOESY+RsOIre3mCghqvXXej95g0vUg5xXgFcDcZGUDg38Oczt13fOCf1OUbf0TKLG23U9kJuo
 RmEv6xHPFRz9dN+zif7n6tSNQc+Cs7RjdUj6+AijJRivJwCbV2UF2JeMq+BW9DaJRzwv9ZNP3h
 I7Y4twCUw6ktZGDo070YhgGtg9oHLR8x4sEGDogDzv05yVBuKZAA4cmDL9WHGyeaXcCVyCcDP6
 71w=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42848287"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:36 -0800
IronPort-SDR: A/vkHwjPJR4GzAt5gDjSmwtDvlEm4zF48qU/7QP5M6qMp0aVo0gQuhy1TEuu6/nQ21gJZu/e67
 3HAjcumixp0KBpdTi+mBGOSSTsb8AcUy8v/H879ZQcWQZk3nUXV6tVZGoZN+/9+GihfuGak/4F
 4o4J5GdJaYt5jVU+JBDOS/1HATSQxhQJk5NJjUG8srVVB/dox1XG4Znbc0NmdWoV5+646lxr+q
 MawbW3GMdpJ7E4Ci7JTz+VnGhvUdGKayxct+r6ExlIvTo6HrS6jwge4H2vTvQRvw02ZndZ27DR
 vkY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 27/48] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Wed, 6 Nov 2019 16:01:25 +0900
Message-ID: <20191106070146.18759-28-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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
index fc2f804e5293..de77079e3324 100644
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

