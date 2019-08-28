Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D36B9FEE8
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfH1JyL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40082 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfH1JyL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so1181161pgj.7
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9dtC7/eaK/XYH+q5ZQPPbTngcUeszJrZS9FqzY3n7IY=;
        b=jftNxP6m/7TAIcJ0q7gi9saP6mq68zShoBs+rSTftyYtol9+1tI/XRWP+t1z44eCok
         qcW6pg5SSlSeXHK3cl6kx1bxHynJEejYdSsz6RCQpjvnfKl0sVavVAFv6FHVXCrc0fKi
         PDEpNgx+utyVs2t/hmLR49ZchSqe3tE+Nu4NHqs5Ezp6Wqdwezf3OWTr4JWZ6kX55kPc
         HVc/AuvGlhh3Im2t56PVbaUv0foAX4TLYruZsbzE/+lNNDm1TS3kj/Ziqy14Pqi3WEP6
         iObL3De0vRMnxVsUr7BSwlmqMLXg7OPfFnlGQKztVfFMv2FCmVEdzWwfw0/Jmo5Yr3Oz
         4TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9dtC7/eaK/XYH+q5ZQPPbTngcUeszJrZS9FqzY3n7IY=;
        b=A/ePUkdyoYMYVZuWx3uwhlYGarYWWcRHalilnVDpoWemB2+Skz5u5RMSV9mzOulcOe
         hfaX+gxAt9z804f/NtH/toyheDc0jet89dAdXvILq/mgPJzaYQlZ0XplmUrgii1WoioJ
         lFgrcpDmWZhAeXKu26ptfro5tncSWdM34s91Yb72GhitbQi0ciU4dMX0IyCTwKSGy2OG
         Qf92n9v8dbnpsQ4PDAK91Do/J16OdKO3iz1ikYX8xciwiv9sDEWRCmcXBlWyaH2paMY3
         VIXsxYEjkNnStsjE5OTnio+6dZ6ZZ7oEF9g+hYcUeapXt5WrQePu63yRN4/OO894rvzK
         bQNQ==
X-Gm-Message-State: APjAAAXS8JHipAYQ4vhOo62FTPwoT7Csp9+6wed4E3qVmbqoj6iY0Tkz
        XaZBkN47zdwkrTViyyKsXvk8+Sv0
X-Google-Smtp-Source: APXvYqwhUhsyGAQo/PiLNqhOP5ppnNRRpWQZvJastwkySkE9nbC+RyYRYf9/mcH6w4rWwIpmeNpinA==
X-Received: by 2002:a63:5b23:: with SMTP id p35mr2640193pgb.366.1566986050468;
        Wed, 28 Aug 2019 02:54:10 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:10 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 2/8] Input: atmel_mxt_ts - show info/confing checksum.
Date:   Wed, 28 Aug 2019 18:53:43 +0900
Message-Id: <20190828095349.30607-2-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

To check current touchscreen config, we need to read information and
config checksum.
With patch, we can check checksum in user space via sysfs easily.

Change-Id: I0328945cec10f142bd5670bfd7a3133de3f473db
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 4fe2059fa3c1..cabe746607fc 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2692,6 +2692,13 @@ static ssize_t mxt_calibrate_store(struct device *dev,
 	return ret ?: count;
 }
 
+static ssize_t mxt_config_csum_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->config_crc);
+}
+
 /* Firmware Version is returned as Major.Minor.Build */
 static ssize_t mxt_fw_version_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -2712,6 +2719,13 @@ static ssize_t mxt_hw_version_show(struct device *dev,
 			 info->family_id, info->variant_id);
 }
 
+static ssize_t mxt_info_csum_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->info_crc);
+}
+
 static ssize_t mxt_show_instance(char *buf, int count,
 				 struct mxt_object *object, int instance,
 				 const u8 *val)
@@ -2940,15 +2954,19 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 }
 
 static DEVICE_ATTR(calibrate, S_IWUSR, NULL, mxt_calibrate_store);
+static DEVICE_ATTR(config_csum, S_IRUGO, mxt_config_csum_show, NULL);
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
+static DEVICE_ATTR(info_csum, S_IRUGO, mxt_info_csum_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_calibrate.attr,
+	&dev_attr_config_csum.attr,
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
+	&dev_attr_info_csum.attr,
 	&dev_attr_object.attr,
 	&dev_attr_update_fw.attr,
 	NULL
-- 
2.17.1

