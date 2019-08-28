Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB279FEEA
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfH1JyO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:14 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:41492 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1JyO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:14 -0400
Received: by mail-pf1-f181.google.com with SMTP id 196so1378467pfz.8
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4WJHzd9uWBViuZ9IZrTOSPHXv7sk2NICbX2PeiAv/jI=;
        b=DYAVmy+7u2oRkFjPDU15rdBpykd0dOzsSMJtloA3Mtt9hSUh3zl12HUGVRQIQ93Qvf
         xhrZ8P4tZ+1NJRIwCkyfJly0a53gEzEsxUaYshroMfUHgiz2wV6Rb0J80lQjWM4Om9JH
         bVKcdH44Ri5N5Hcnyjv2o/pAHngv5Ch8CdV5xPECP8069p4ZZRFkDXhabCCkpROj0QoM
         mwHAVtkgQbvstZd2PlC4n8ksBScZ8KmlGbEc4+RoyAEVosZyG8HbdgNM4y8MigxXN1ME
         aGhy9RcXdWzNPgT8jtIFVwU0Ho6CdprIqncAC+eTC9cnUpE9/SVhr9XM6ZAeSkLlIR5+
         fMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4WJHzd9uWBViuZ9IZrTOSPHXv7sk2NICbX2PeiAv/jI=;
        b=TdNGcIUjwfpdy+uIAPMRDpnYGA+lJqIn65P+9gK0EeoEd3IihfD+MaNgMgV5Q9aPMa
         ibmZ4YgloieTJmXArrC/SNxgRs/tx9/bPmvm/C1zwX+/hl8MBuhgE871GpPsfOGhYizZ
         TiEnLMq8utZ+Xkmuw1szD1x2kiPRMBrOe/7DKkVC/vGzEALc0U4h2n8WFvWrgOKBKB3N
         GFtJdpLubzwHeO0RiIk5e2Q3Zw6FB8RN/II/uA2MhjESlv5kX4os9H4yK4OFtxt/tB2B
         ft1izCL5MPVJ3tKKxKq9m5neix06ol5Plc+ThX644OEjIH4LGCiPvoSWpJXG8tB6OANZ
         mK4A==
X-Gm-Message-State: APjAAAVKp13UV1b4+9DJN1V0M6CtBrOUN462XxhZqnNbIGHDu8bTQp9l
        FEG0a/tzsX+fir5G4xLiPIKc18n5
X-Google-Smtp-Source: APXvYqxmqFn+HgRuaoOieJAwGzJcw3XPs+Y5Guz/Xe5xEXAWXd3m8etlcNkSfaoMwR6Pya91Hs0xmA==
X-Received: by 2002:a62:144b:: with SMTP id 72mr3687239pfu.42.1566986053010;
        Wed, 28 Aug 2019 02:54:13 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:12 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 3/8] Input: atmel_mxt_ts - add interface to backup current cfg to nvram.
Date:   Wed, 28 Aug 2019 18:53:44 +0900
Message-Id: <20190828095349.30607-3-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

To backup current config, we can store current config into nvram.

Change-Id: Ibea246526a9e586d89e226cfb058d40829fb2a42
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index cabe746607fc..cb3a608f60bf 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2679,6 +2679,23 @@ static int mxt_configure_objects(struct mxt_data *data,
 	return 0;
 }
 
+static ssize_t mxt_backupnv_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	/* Backup non-volatile memory */
+	ret = mxt_write_object(data, MXT_GEN_COMMAND_T6,
+			       MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE);
+	if (ret)
+		return ret;
+	msleep(MXT_BACKUP_TIME);
+
+	return count;
+}
+
 static ssize_t mxt_calibrate_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf, size_t count)
@@ -2953,6 +2970,7 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
+static DEVICE_ATTR(backupnv, S_IWUSR, NULL, mxt_backupnv_store);
 static DEVICE_ATTR(calibrate, S_IWUSR, NULL, mxt_calibrate_store);
 static DEVICE_ATTR(config_csum, S_IRUGO, mxt_config_csum_show, NULL);
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
@@ -2962,6 +2980,7 @@ static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_attrs[] = {
+	&dev_attr_backupnv.attr,
 	&dev_attr_calibrate.attr,
 	&dev_attr_config_csum.attr,
 	&dev_attr_fw_version.attr,
-- 
2.17.1

