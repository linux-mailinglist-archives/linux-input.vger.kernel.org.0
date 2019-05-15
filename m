Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B93B1F537
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 15:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfEONMg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 09:12:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:60882 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727279AbfEONMT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 09:12:19 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4FDBiB6004311;
        Wed, 15 May 2019 15:12:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Nushr9Q4ATrGXX1cBhEzuz9GYEidZFGLJO4tbBczcbM=;
 b=Db2STe7UxW1FEPSN2ItGT+VUAYbPjDC1xrsS1tpWJ7Tv2hE3wen+CCsnWMIHe9ShUpqf
 onpkGHkNa/6Yuda/EDs3zbtZxspgLtQtNg12lK2joxVNplB/LtJwOneWk+7sThnXtZAT
 6OGLPg7WXkEFTPPnRKJ5JuUbMlc4dcFB/QwxXKvC3uxGvJqGAr6HbhhZG3y+sJN8moqt
 huIkibREvpjfkJ0lNE/k0dfNkv0m/t2zS7XfECGz0osM1iZBzQ9E4ReAxbO2Ly4JA8Da
 1z9bDngVfndzZBdF+XtTb5ls4RUjtHdUzdBNm0ZYRbPLdIEdGK4937XbD2otIkpd77kf TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sdn9g0yej-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 15 May 2019 15:12:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D352E34;
        Wed, 15 May 2019 13:12:02 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A844127F6;
        Wed, 15 May 2019 13:12:02 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:02 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:01
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <rafael.j.wysocki@intel.com>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <hadess@hadess.net>,
        <frowand.list@gmail.com>, <m.felsch@pengutronix.de>,
        <agx@sigxcpu.org>, <arnd@arndb.de>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <broonie@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2 1/5] of/device: Add of_device_link_add function
Date:   Wed, 15 May 2019 15:11:50 +0200
Message-ID: <20190515131154.18373-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190515131154.18373-1-benjamin.gaignard@st.com>
References: <20190515131154.18373-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_07:,,
 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use 'suspend-dependencies' property from device node to ensure that
the listed devices will suspended after it and resumed before it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
version 2:
- only keep of_device_links_add() and use 
  DL_FLAG_PM_RUNTIME and DL_FLAG_AUTOREMOVE_CONSUMER flags to follow Rafael
  advices
- reword function description
- try to use a more explicit property name
  
 drivers/of/device.c       | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/of_device.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 3717f2a20d0d..44ec84eee310 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -336,3 +336,40 @@ int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
+
+/**
+ * of_device_links_add - Create links between a consumer device
+ * and it listed dependencies from device tree data
+ *
+ * @consumer: consumer device
+ *
+ * Ensure that consumer's dependencies will be suspended after it
+ * and resumed before it.
+ *
+ * Returns 0 on success, < 0 on failure.
+ */
+int of_device_links_add(struct device *consumer)
+{
+	struct device_node *np;
+	struct platform_device *pdev;
+	int i = 0;
+
+	np = of_parse_phandle(consumer->of_node, "suspend-dependencies", i++);
+	while (np) {
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev)
+			return -EINVAL;
+
+		device_link_add(consumer, &pdev->dev,
+				DL_FLAG_PM_RUNTIME |
+				DL_FLAG_AUTOREMOVE_CONSUMER);
+		platform_device_put(pdev);
+
+		np = of_parse_phandle(consumer->of_node, "suspend-dependencies",
+				      i++);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_device_links_add);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 8d31e39dd564..83f24c386d51 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -41,6 +41,8 @@ extern int of_device_request_module(struct device *dev);
 extern void of_device_uevent(struct device *dev, struct kobj_uevent_env *env);
 extern int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env);
 
+extern int of_device_links_add(struct device *consumer);
+
 static inline void of_device_node_put(struct device *dev)
 {
 	of_node_put(dev->of_node);
@@ -91,6 +93,11 @@ static inline int of_device_uevent_modalias(struct device *dev,
 	return -ENODEV;
 }
 
+static int of_device_links_add(struct device *consumer)
+{
+	return 0;
+}
+
 static inline void of_device_node_put(struct device *dev) { }
 
 static inline const struct of_device_id *__of_match_device(
-- 
2.15.0

