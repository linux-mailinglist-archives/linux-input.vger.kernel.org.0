Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD49345F49
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 14:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhCWNP2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 09:15:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231604AbhCWNPC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 09:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D31161990;
        Tue, 23 Mar 2021 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616505299;
        bh=oZWMWFmkjgEXpfFZpnhWD7nZruvCO/j1q+o49Q6vXsI=;
        h=From:To:Cc:Subject:Date:From;
        b=gJi5SVgZwxCnk/OsOMJBb/xRicHFr1hntHN72DxBJb7F8o3Pqs2ZZ1dD70pQP8caU
         9/6AzducHf/9WDhtkWdRgNF6jdmZCPl77JzYmkZF5mnNVmT3KCGQj26ZbsVtx7EixN
         5Jdh+ddoxe2vy8Zbi2zb6Ztgs7X5F2ffC4GkjlKbfzbeSe5nonSNCdLO/WUfBA21s2
         DSAAXFCQ3UG/5w80ftGe0ecxnN+7X10QOFPzCkhge4Y5mfdb6NIHasbAGfpX3TetnO
         GP09XUfJbmmEsyQrHxbBLqIIEt2k3MHofwIfUBuqdDfhsAoaBdkd42i/SBDkOL1j9p
         s9JhcwPmlzOag==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: analog - fix invalid snprintf() call
Date:   Tue, 23 Mar 2021 14:14:50 +0100
Message-Id: <20210323131456.2600132-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

overlapping input and output arguments to snprintf() are
undefined behavior in C99:

drivers/input/joystick/analog.c: In function 'analog_name':
drivers/input/joystick/analog.c:428:3: error: 'snprintf' argument 4 overlaps destination object 'analog' [-Werror=restrict]
  428 |   snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  429 |     analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/joystick/analog.c:420:40: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
  420 | static void analog_name(struct analog *analog)
      |                         ~~~~~~~~~~~~~~~^~~~~~

Change this function to just use the offset it already knows.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/joystick/analog.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index f798922a4598..8c9fed3f13e2 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -419,14 +419,16 @@ static void analog_calibrate_timer(struct analog_port *port)
 
 static void analog_name(struct analog *analog)
 {
-	snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
+	int len;
+
+	len = snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
 		 hweight8(analog->mask & ANALOG_AXES_STD),
 		 hweight8(analog->mask & ANALOG_BTNS_STD) + !!(analog->mask & ANALOG_BTNS_CHF) * 2 +
 		 hweight16(analog->mask & ANALOG_BTNS_GAMEPAD) + !!(analog->mask & ANALOG_HBTN_CHF) * 4);
 
 	if (analog->mask & ANALOG_HATS_ALL)
-		snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
-			 analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
+		len += snprintf(analog->name + len, sizeof(analog->name) - len, "%d-hat",
+			 hweight16(analog->mask & ANALOG_HATS_ALL));
 
 	if (analog->mask & ANALOG_HAT_FCS)
 		strlcat(analog->name, " FCS", sizeof(analog->name));
-- 
2.29.2

