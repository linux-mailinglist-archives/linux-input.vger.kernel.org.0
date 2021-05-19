Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6C2388539
	for <lists+linux-input@lfdr.de>; Wed, 19 May 2021 05:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352978AbhESD3I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 23:29:08 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:42900 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352980AbhESD3I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 23:29:08 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 4FBD7CD5DA;
        Wed, 19 May 2021 11:27:40 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.207.172.18])
        by smtp.263.net (postfix) whith ESMTP id P31747T140095115986688S1621394617351821_;
        Wed, 19 May 2021 11:24:16 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8d48550458bea6c8e04709089b6d10f3>
X-RL-SENDER: maqianga@uniontech.com
X-SENDER: maqianga@uniontech.com
X-LOGIN-NAME: maqianga@uniontech.com
X-FST-TO: dmitry.torokhov@gmail.com
X-RCPT-COUNT: 5
X-SENDER-IP: 111.207.172.18
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Qiang Ma <maqianga@uniontech.com>
To:     dmitry.torokhov@gmail.com, wangxiongfeng2@huawei.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] Input: psmouse - fix psmouse detect function is a NULL pointer
Date:   Wed, 19 May 2021 11:23:35 +0800
Message-Id: <20210519032335.19326-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a check for psmouse_do_detect(), when the detect is NULL pointer,
returning false, avoiding this possible NULL pointer exception.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/input/mouse/psmouse-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 0b4a3039f312..86b095728587 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1006,6 +1006,9 @@ static bool psmouse_do_detect(int (*detect)(struct psmouse *, bool),
 	if (set_properties)
 		psmouse_apply_defaults(psmouse);
 
+	if (!detect)
+		return false;
+
 	return detect(psmouse, set_properties) == 0;
 }
 
-- 
2.20.1



