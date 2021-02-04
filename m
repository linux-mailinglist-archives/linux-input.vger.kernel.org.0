Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E8530EC5A
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 07:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBDGOO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 01:14:14 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:53468 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229741AbhBDGOM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Feb 2021 01:14:12 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UNpVxFp_1612419192;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UNpVxFp_1612419192)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 04 Feb 2021 14:13:20 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] Input: aiptek - convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Thu,  4 Feb 2021 14:13:11 +0800
Message-Id: <1612419191-1078-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following coccicheck warning:

./drivers/input/tablet/aiptek.c:1629:8-16: WARNING: use scnprintf or
sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/input/tablet/aiptek.c | 80 ++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 47 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index e08b0ef..fcb1b64 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1036,9 +1036,9 @@ static ssize_t show_tabletSize(struct device *dev, struct device_attribute *attr
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%dx%d\n",
-			input_abs_get_max(aiptek->inputdev, ABS_X) + 1,
-			input_abs_get_max(aiptek->inputdev, ABS_Y) + 1);
+	return sysfs_emit(buf, "%dx%d\n",
+			  input_abs_get_max(aiptek->inputdev, ABS_X) + 1,
+			  input_abs_get_max(aiptek->inputdev, ABS_Y) + 1);
 }
 
 /* These structs define the sysfs files, param #1 is the name of the
@@ -1064,9 +1064,8 @@ static ssize_t show_tabletPointerMode(struct device *dev, struct device_attribut
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(pointer_mode_map,
-					aiptek->curSetting.pointerMode));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(pointer_mode_map,
+						      aiptek->curSetting.pointerMode));
 }
 
 static ssize_t
@@ -1101,9 +1100,8 @@ static ssize_t show_tabletCoordinateMode(struct device *dev, struct device_attri
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(coordinate_mode_map,
-					aiptek->curSetting.coordinateMode));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(coordinate_mode_map,
+						      aiptek->curSetting.coordinateMode));
 }
 
 static ssize_t
@@ -1143,9 +1141,8 @@ static ssize_t show_tabletToolMode(struct device *dev, struct device_attribute *
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(tool_mode_map,
-					aiptek->curSetting.toolMode));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(tool_mode_map,
+						      aiptek->curSetting.toolMode));
 }
 
 static ssize_t
@@ -1174,10 +1171,9 @@ static ssize_t show_tabletXtilt(struct device *dev, struct device_attribute *att
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
 	if (aiptek->curSetting.xTilt == AIPTEK_TILT_DISABLE) {
-		return snprintf(buf, PAGE_SIZE, "disable\n");
+		return sysfs_emit(buf, "disable\n");
 	} else {
-		return snprintf(buf, PAGE_SIZE, "%d\n",
-				aiptek->curSetting.xTilt);
+		return sysfs_emit(buf, "%d\n", aiptek->curSetting.xTilt);
 	}
 }
 
@@ -1216,10 +1212,9 @@ static ssize_t show_tabletYtilt(struct device *dev, struct device_attribute *att
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
 	if (aiptek->curSetting.yTilt == AIPTEK_TILT_DISABLE) {
-		return snprintf(buf, PAGE_SIZE, "disable\n");
+		return sysfs_emit(buf, "disable\n");
 	} else {
-		return snprintf(buf, PAGE_SIZE, "%d\n",
-				aiptek->curSetting.yTilt);
+		return sysfs_emit(buf, "%d\n", aiptek->curSetting.yTilt);
 	}
 }
 
@@ -1257,7 +1252,7 @@ static ssize_t show_tabletJitterDelay(struct device *dev, struct device_attribut
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", aiptek->curSetting.jitterDelay);
+	return sysfs_emit(buf, "%d\n", aiptek->curSetting.jitterDelay);
 }
 
 static ssize_t
@@ -1286,8 +1281,7 @@ static ssize_t show_tabletProgrammableDelay(struct device *dev, struct device_at
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			aiptek->curSetting.programmableDelay);
+	return sysfs_emit(buf, "%d\n", aiptek->curSetting.programmableDelay);
 }
 
 static ssize_t
@@ -1316,7 +1310,7 @@ static ssize_t show_tabletEventsReceived(struct device *dev, struct device_attri
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%ld\n", aiptek->eventCount);
+	return sysfs_emit(buf, "%ld\n", aiptek->eventCount);
 }
 
 static DEVICE_ATTR(event_count, S_IRUGO, show_tabletEventsReceived, NULL);
@@ -1355,7 +1349,7 @@ static ssize_t show_tabletDiagnosticMessage(struct device *dev, struct device_at
 	default:
 		return 0;
 	}
-	return snprintf(buf, PAGE_SIZE, retMsg);
+	return sysfs_emit(buf, retMsg);
 }
 
 static DEVICE_ATTR(diagnostic, S_IRUGO, show_tabletDiagnosticMessage, NULL);
@@ -1375,9 +1369,8 @@ static ssize_t show_tabletStylusUpper(struct device *dev, struct device_attribut
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(stylus_button_map,
-					aiptek->curSetting.stylusButtonUpper));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(stylus_button_map,
+						      aiptek->curSetting.stylusButtonUpper));
 }
 
 static ssize_t
@@ -1406,9 +1399,8 @@ static ssize_t show_tabletStylusLower(struct device *dev, struct device_attribut
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(stylus_button_map,
-					aiptek->curSetting.stylusButtonLower));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(stylus_button_map,
+						      aiptek->curSetting.stylusButtonLower));
 }
 
 static ssize_t
@@ -1444,9 +1436,8 @@ static ssize_t show_tabletMouseLeft(struct device *dev, struct device_attribute
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(mouse_button_map,
-					aiptek->curSetting.mouseButtonLeft));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(mouse_button_map,
+						      aiptek->curSetting.mouseButtonLeft));
 }
 
 static ssize_t
@@ -1474,9 +1465,8 @@ static ssize_t show_tabletMouseMiddle(struct device *dev, struct device_attribut
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(mouse_button_map,
-					aiptek->curSetting.mouseButtonMiddle));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(mouse_button_map,
+						      aiptek->curSetting.mouseButtonMiddle));
 }
 
 static ssize_t
@@ -1504,9 +1494,8 @@ static ssize_t show_tabletMouseRight(struct device *dev, struct device_attribute
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			map_val_to_str(mouse_button_map,
-					aiptek->curSetting.mouseButtonRight));
+	return sysfs_emit(buf, "%s\n", map_val_to_str(mouse_button_map,
+						      aiptek->curSetting.mouseButtonRight));
 }
 
 static ssize_t
@@ -1535,10 +1524,9 @@ static ssize_t show_tabletWheel(struct device *dev, struct device_attribute *att
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
 	if (aiptek->curSetting.wheel == AIPTEK_WHEEL_DISABLE) {
-		return snprintf(buf, PAGE_SIZE, "disable\n");
+		return sysfs_emit(buf, "disable\n");
 	} else {
-		return snprintf(buf, PAGE_SIZE, "%d\n",
-				aiptek->curSetting.wheel);
+		return sysfs_emit(buf, "%d\n", aiptek->curSetting.wheel);
 	}
 }
 
@@ -1568,8 +1556,7 @@ static ssize_t show_tabletExecute(struct device *dev, struct device_attribute *a
 	/* There is nothing useful to display, so a one-line manual
 	 * is in order...
 	 */
-	return snprintf(buf, PAGE_SIZE,
-			"Write anything to this file to program your tablet.\n");
+	return sysfs_emit(buf, "Write anything to this file to program your tablet.\n");
 }
 
 static ssize_t
@@ -1600,7 +1587,7 @@ static ssize_t show_tabletODMCode(struct device *dev, struct device_attribute *a
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%04x\n", aiptek->features.odmCode);
+	return sysfs_emit(buf, "0x%04x\n", aiptek->features.odmCode);
 }
 
 static DEVICE_ATTR(odm_code, S_IRUGO, show_tabletODMCode, NULL);
@@ -1613,7 +1600,7 @@ static ssize_t show_tabletModelCode(struct device *dev, struct device_attribute
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%04x\n", aiptek->features.modelCode);
+	return sysfs_emit(buf, "0x%04x\n", aiptek->features.modelCode);
 }
 
 static DEVICE_ATTR(model_code, S_IRUGO, show_tabletModelCode, NULL);
@@ -1626,8 +1613,7 @@ static ssize_t show_firmwareCode(struct device *dev, struct device_attribute *at
 {
 	struct aiptek *aiptek = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%04x\n",
-			aiptek->features.firmwareCode);
+	return sysfs_emit(buf, "%04x\n", aiptek->features.firmwareCode);
 }
 
 static DEVICE_ATTR(firmware_code, S_IRUGO, show_firmwareCode, NULL);
-- 
1.8.3.1

