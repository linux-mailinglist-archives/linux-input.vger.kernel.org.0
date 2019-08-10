Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF3588AE5
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 12:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfHJK4A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Aug 2019 06:56:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:36382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726024AbfHJK4A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Aug 2019 06:56:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57105217F4;
        Sat, 10 Aug 2019 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565434559;
        bh=JTXpcPbxi8zq8+ur3MVA6u1sYK6zAN0B4FMWwInN5sU=;
        h=Date:From:To:Cc:Subject:From;
        b=NnufLDHRZsLq0VHVVYhLscg/Bg5K854ecROM3x1jE5+vtfKwoXbdT6TTpsv72FqHC
         Df3TwO2+XSOBxu3pBVGL8kIEF7CxAy6xgYwW5BBqMXyQbYZlDO8NUHu74Mzr+2pD3a
         7uGu8/lBh4tSLw7mn+pZ50VVt8k29A8vf6InonSo=
Date:   Sat, 10 Aug 2019 12:55:57 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH] input: edt-ft5x06: no need to check return value of
 debugfs_create functions
Message-ID: <20190810105557.GA27295@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/input/touchscreen/edt-ft5x06.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 3cc4341bbdff..5525f1fb1526 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -764,8 +764,6 @@ edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata,
 			      const char *debugfs_name)
 {
 	tsdata->debug_dir = debugfs_create_dir(debugfs_name, NULL);
-	if (!tsdata->debug_dir)
-		return;
 
 	debugfs_create_u16("num_x", S_IRUSR, tsdata->debug_dir, &tsdata->num_x);
 	debugfs_create_u16("num_y", S_IRUSR, tsdata->debug_dir, &tsdata->num_y);
-- 
2.22.0

