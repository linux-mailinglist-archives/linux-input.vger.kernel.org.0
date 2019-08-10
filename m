Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A6D88AE7
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 12:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfHJK5h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Aug 2019 06:57:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:36672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfHJK5h (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Aug 2019 06:57:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E939A217F4;
        Sat, 10 Aug 2019 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565434656;
        bh=MlubR8WiazBwJAzIaibqdKKtOmt9G6jh8YN6P+cFsHY=;
        h=Date:From:To:Cc:Subject:From;
        b=djHQE548zMBUUJyYppa2h18NZq1h7gBYzEX2AWyaaRiKi9ITMdslOK62jESHUoLVt
         82X49nK/FJzumt1Rbsx/Gyj45RPzNik0wvWPPf44snD6VbS1XsbPHPpL+DBgC32+vC
         tzTUBOyH87uBJq4RTYdoS1cdWgvxrVx9cWB1Dv/k=
Date:   Sat, 10 Aug 2019 12:57:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mao Wenan <maowenan@huawei.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH] input: applespi: no need to check return value of
 debugfs_create functions
Message-ID: <20190810105734.GA27563@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ronald Tschalär" <ronald@innovation.ch>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mao Wenan <maowenan@huawei.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/input/keyboard/applespi.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index 548737e7aeda..c822a5d2a85d 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1794,30 +1794,12 @@ static int applespi_probe(struct spi_device *spi)
 
 	/* set up debugfs entries for touchpad dimensions logging */
 	applespi->debugfs_root = debugfs_create_dir("applespi", NULL);
-	if (IS_ERR(applespi->debugfs_root)) {
-		if (PTR_ERR(applespi->debugfs_root) != -ENODEV)
-			dev_warn(&applespi->spi->dev,
-				 "Error creating debugfs root entry (%ld)\n",
-				 PTR_ERR(applespi->debugfs_root));
-	} else {
-		struct dentry *ret;
-
-		ret = debugfs_create_bool("enable_tp_dim", 0600,
-					  applespi->debugfs_root,
-					  &applespi->debug_tp_dim);
-		if (IS_ERR(ret))
-			dev_dbg(&applespi->spi->dev,
-				"Error creating debugfs entry enable_tp_dim (%ld)\n",
-				PTR_ERR(ret));
-
-		ret = debugfs_create_file("tp_dim", 0400,
-					  applespi->debugfs_root, applespi,
-					  &applespi_tp_dim_fops);
-		if (IS_ERR(ret))
-			dev_dbg(&applespi->spi->dev,
-				"Error creating debugfs entry tp_dim (%ld)\n",
-				PTR_ERR(ret));
-	}
+
+	debugfs_create_bool("enable_tp_dim", 0600, applespi->debugfs_root,
+			    &applespi->debug_tp_dim);
+
+	debugfs_create_file("tp_dim", 0400, applespi->debugfs_root, applespi,
+			    &applespi_tp_dim_fops);
 
 	return 0;
 }
-- 
2.22.0

