Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF7B5F4CC
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2019 10:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfGDIqr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Jul 2019 04:46:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbfGDIqp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Jul 2019 04:46:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4EB32189E;
        Thu,  4 Jul 2019 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562230005;
        bh=qDsoNfsoAOs9wQLEjtZdH7zRe0ETNhvRROLwfA8DRXo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PJbNVZnmAt1ZI3t9MNgeTiHd9YW3QXIe1uyr34tZQYHwRF2nq0XSRknBh0l32lJsb
         5I0UkWP0ML13giLk3u8T8a/OMJirTipHyD+ubiVQydEdTPzeY4eS9W58Lb9mzLk4cZ
         9lPZiL3qq0EFpf7hnmwQISE0p03yd9LK4pGb75bA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 11/11] input: axp20x-pek: convert platform driver to use dev_groups
Date:   Thu,  4 Jul 2019 10:46:17 +0200
Message-Id: <20190704084617.3602-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" a sysfs group of attributes.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/input/misc/axp20x-pek.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index debeeaeb8812..baff6dcbe392 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -195,15 +195,12 @@ DEVICE_ATTR(startup, 0644, axp20x_show_attr_startup, axp20x_store_attr_startup);
 DEVICE_ATTR(shutdown, 0644, axp20x_show_attr_shutdown,
 	    axp20x_store_attr_shutdown);
 
-static struct attribute *axp20x_attributes[] = {
+static struct attribute *axp20x_attrs[] = {
 	&dev_attr_startup.attr,
 	&dev_attr_shutdown.attr,
 	NULL,
 };
-
-static const struct attribute_group axp20x_attribute_group = {
-	.attrs = axp20x_attributes,
-};
+ATTRIBUTE_GROUPS(axp20x);
 
 static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 {
@@ -356,13 +353,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 
 	axp20x_pek->info = (struct axp20x_info *)match->driver_data;
 
-	error = devm_device_add_group(&pdev->dev, &axp20x_attribute_group);
-	if (error) {
-		dev_err(&pdev->dev, "Failed to create sysfs attributes: %d\n",
-			error);
-		return error;
-	}
-
 	platform_set_drvdata(pdev, axp20x_pek);
 
 	return 0;
@@ -406,6 +396,7 @@ static const struct platform_device_id axp_pek_id_match[] = {
 MODULE_DEVICE_TABLE(platform, axp_pek_id_match);
 
 static struct platform_driver axp20x_pek_driver = {
+	.dev_groups	= axp20x_groups,
 	.probe		= axp20x_pek_probe,
 	.id_table	= axp_pek_id_match,
 	.driver		= {
-- 
2.22.0

