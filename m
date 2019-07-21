Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053196F218
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 09:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfGUHGf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 03:06:35 -0400
Received: from chill.innovation.ch ([216.218.245.220]:35958 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGUHGf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 03:06:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by chill.innovation.ch (Postfix) with ESMTP id 538F9640132;
        Sun, 21 Jul 2019 00:06:35 -0700 (PDT)
X-Virus-Scanned: amavisd-new at 
Received: from chill.innovation.ch ([127.0.0.1])
        by localhost (chill.innovation.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 42i9o8faoQmI; Sun, 21 Jul 2019 00:06:33 -0700 (PDT)
From:   =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 649CA6400F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1563692793;
        bh=QAAeQfn+GT6Ycdym7bMgSNGzFQaVDEpmXwaV8KE6194=;
        h=From:To:Cc:Subject:Date:From;
        b=W235MJOVlkP7VEVyIxeTch6ECmhHCHZadnpji9tlc+cqxloUjp1eOBq4LnZuR1KQf
         7l9vT16vF023HYuDUzbyyNitlXm+2Sc8ii7oR7rDzb/CeJOVVBJgfaW7Kq0rq7mRMi
         fvmLGK1eWXtXbuohYmWJV7DwtVFS0z+mT/bX8IbkMnX42MCX8il8bQgXAjim2hW0Zt
         iAAfixEm80olXHLY/YQ4/HkwB1xQEIhzn4G74sjUps0M56xnvBo/1Fe8lnN1M+rvUm
         /DyL+5g7ldp3d+7RPb4R8VMNf4MRqzwAahNHlSJ4ew2JmIgKeaxEVDfbkddvdDRMZ9
         fL9J/C9Too7yw==
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 2/2] Input: applespi: fix warnings detected by sparse
Date:   Sun, 21 Jul 2019 00:06:29 -0700
Message-Id: <20190721070629.24932-1-ronald@innovation.ch>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
---
 drivers/input/keyboard/applespi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index d5defdefbc34..00cd8dccd4f5 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -998,10 +998,14 @@ static inline int le16_to_int(__le16 x)
 static void applespi_debug_update_dimensions(struct applespi_data *applespi,
 					     const struct tp_finger *f)
 {
-	applespi->tp_dim_min_x = min_t(int, applespi->tp_dim_min_x, f->abs_x);
-	applespi->tp_dim_max_x = max_t(int, applespi->tp_dim_max_x, f->abs_x);
-	applespi->tp_dim_min_y = min_t(int, applespi->tp_dim_min_y, f->abs_y);
-	applespi->tp_dim_max_y = max_t(int, applespi->tp_dim_max_y, f->abs_y);
+	applespi->tp_dim_min_x = min_t(int, applespi->tp_dim_min_x,
+				       le16_to_int(f->abs_x));
+	applespi->tp_dim_max_x = max_t(int, applespi->tp_dim_max_x,
+				       le16_to_int(f->abs_x));
+	applespi->tp_dim_min_y = min_t(int, applespi->tp_dim_min_y,
+				       le16_to_int(f->abs_y));
+	applespi->tp_dim_max_y = max_t(int, applespi->tp_dim_max_y,
+				       le16_to_int(f->abs_y));
 }
 
 static int applespi_tp_dim_open(struct inode *inode, struct file *file)
@@ -1653,8 +1657,8 @@ static void applespi_save_bl_level(struct applespi_data *applespi,
 	efi_attr = EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
 		   EFI_VARIABLE_RUNTIME_ACCESS;
 
-	sts = efivar_entry_set_safe(EFI_BL_LEVEL_NAME, efi_guid, efi_attr, true,
-				    efi_data_len, &efi_data);
+	sts = efivar_entry_set_safe((efi_char16_t *)EFI_BL_LEVEL_NAME, efi_guid,
+				    efi_attr, true, efi_data_len, &efi_data);
 	if (sts)
 		dev_warn(&applespi->spi->dev,
 			 "Error saving backlight level to EFI vars: %d\n", sts);
@@ -2027,7 +2031,7 @@ static const struct acpi_device_id applespi_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, applespi_acpi_match);
 
-const struct dev_pm_ops applespi_pm_ops = {
+static const struct dev_pm_ops applespi_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(applespi_suspend, applespi_resume)
 	.poweroff_late	= applespi_poweroff_late,
 };
-- 
2.21.0

