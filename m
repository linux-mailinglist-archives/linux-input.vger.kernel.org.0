Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0331F530
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 15:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfEONMg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 09:12:36 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1044 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725977AbfEONMT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 09:12:19 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4FDBBEr031840;
        Wed, 15 May 2019 15:12:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8NQw4ybPrTmbk6atvWzEug5p4ly6IPD/vByobMwQlWs=;
 b=e8yA7GkuwUcHC8QJYOGT8O1YoxLYncnlRByUHHNUM9lp8CmbJhlaZ0Tcimuib+Kd+o3j
 d9wdsyRaC7zQycrq4LVU0a8n/j37ao0UeUNV4uqcs7fzqZ+IlqmfsrEiTGZQmfPwxtKj
 agjUF5W0v4vQSbKHqFnCF8K4EMUNVVJRC6PXOIRAW+kM1JD8QAcabrUiuGZrpKFkyud2
 fmgIAyj3E8esjWDtKCQWa+0vDCCa+bYIcDKjYoTgACs109MJiQ6F6DfCSl12cqPuOaOv
 pFGxp9om4w13kCeu/X2etTnhrHqBM3v77JAlRpUvz05i4g7Zwi4vainoclLczKLyyOgm bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sg0an6gk1-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 15 May 2019 15:12:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4356A34;
        Wed, 15 May 2019 13:12:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23ED727F6;
        Wed, 15 May 2019 13:12:07 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:06 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:06
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
Subject: [PATCH v2 5/5] input: goodix - Call of_device_links_add() to create links
Date:   Wed, 15 May 2019 15:11:54 +0200
Message-ID: <20190515131154.18373-6-benjamin.gaignard@st.com>
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

Add a call to of_device_links_add() to create links with
suspend dependencies at probe time.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/input/touchscreen/goodix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index f57d82220a88..49fd4763f17b 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/unaligned.h>
 
 struct goodix_ts_data;
@@ -812,6 +813,8 @@ static int goodix_ts_probe(struct i2c_client *client,
 
 	ts->chip = goodix_get_chip_data(ts->id);
 
+	of_device_links_add(&client->dev);
+
 	if (ts->gpiod_int && ts->gpiod_rst) {
 		/* update device config */
 		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
-- 
2.15.0

