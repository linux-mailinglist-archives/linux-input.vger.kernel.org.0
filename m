Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D10710AD8F
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 11:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfK0K25 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 05:28:57 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52130 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726664AbfK0K25 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 05:28:57 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xARARSCO025133;
        Wed, 27 Nov 2019 11:28:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=NGFn1INSjiFml8tyG7QtE320FjzT4hxnP0D7Gm8LUjM=;
 b=CHYiT5KJS0Tugi2Uic3ENpPMOFjtyZmwijWCu/l046fRACJXZugPjioFcf/uqHF+KCcc
 UheMnN7h5rfADvt9oPOixm2x3Iwegv0LGE7Fr/LYtMtQJRyZLh3l+vNc6poedJoCVSPu
 4sGd6WZianXOrxmgycP+sawyxhg9T7mkK+uGqh+JeFytqzjC+Ow9Wdwk9N5ZsCBF+nLD
 5ZpxpE7WlnENlBMauAKp4/jC2Fj8b/qB3qh/hhvecgmhOE7X/unXzSYWwjUYuoRtXCX3
 /53tLbtIzUB5FHsV7JkofJhdGi/3pgAuc+06aky7JPusU9KjoIk+zKGrYMQDP27kjvvK TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2whcxyb1fu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 11:28:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 150E6100039;
        Wed, 27 Nov 2019 11:28:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67F582B1869;
        Wed, 27 Nov 2019 11:28:50 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov 2019 11:28:49
 +0100
From:   Yannick Fertre <yannick.fertre@st.com>
To:     Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: goodix - support gt9147 touchpanel
Date:   Wed, 27 Nov 2019 11:28:46 +0100
Message-ID: <1574850526-13518-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Yannick Fertré <yannick.fertre@st.com>

Add support for it by adding compatible and supported chip data
(default settings used).
The chip data on GT9147 is similar to GT912, like
- config data register has 0x8047 address
- config data register max len is 240
- config data checksum has 8-bit

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/input/touchscreen/goodix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index fb43aa7..b470773 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1045,6 +1045,7 @@ static const struct of_device_id goodix_of_match[] = {
 	{ .compatible = "goodix,gt9271" },
 	{ .compatible = "goodix,gt928" },
 	{ .compatible = "goodix,gt967" },
+	{ .compatible = "goodix,gt9147",},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_of_match);
-- 
2.7.4

