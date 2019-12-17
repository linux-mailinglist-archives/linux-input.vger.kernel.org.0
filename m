Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE59E123039
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 16:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbfLQPZr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 10:25:47 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:50766 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727459AbfLQPZr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 10:25:47 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihEjH-00045u-M8; Tue, 17 Dec 2019 15:25:43 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihEjH-0095lf-6x; Tue, 17 Dec 2019 15:25:43 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: axp20x-pek - make device attributes static
Date:   Tue, 17 Dec 2019 15:25:41 +0000
Message-Id: <20191217152541.2167080-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The two device attrbitues are not declared outside this file
so make them static to avoid the following warnings:

drivers/input/misc/axp20x-pek.c:194:1: warning: symbol 'dev_attr_startup' was not declared. Should it be static?
drivers/input/misc/axp20x-pek.c:195:1: warning: symbol 'dev_attr_shutdown' was not declared. Should it be static?

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/input/misc/axp20x-pek.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 17c1cca74498..4454f1e5a0d3 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -191,9 +191,10 @@ static ssize_t axp20x_store_attr_shutdown(struct device *dev,
 				 axp20x_pek->info->shutdown_mask, buf, count);
 }
 
-DEVICE_ATTR(startup, 0644, axp20x_show_attr_startup, axp20x_store_attr_startup);
-DEVICE_ATTR(shutdown, 0644, axp20x_show_attr_shutdown,
-	    axp20x_store_attr_shutdown);
+static DEVICE_ATTR(startup, 0644, axp20x_show_attr_startup,
+		   axp20x_store_attr_startup);
+static DEVICE_ATTR(shutdown, 0644, axp20x_show_attr_shutdown,
+		   axp20x_store_attr_shutdown);
 
 static struct attribute *axp20x_attrs[] = {
 	&dev_attr_startup.attr,
-- 
2.24.0

