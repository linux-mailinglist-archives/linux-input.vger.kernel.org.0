Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8BD173927
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 15:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgB1N6L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Feb 2020 08:58:11 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45200 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725892AbgB1N6L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Feb 2020 08:58:11 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01SDvEF7018288;
        Fri, 28 Feb 2020 14:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sQGS3ajcizRpXz7eztz3fMHKRX1ok8Cx3ATqa3t8sXI=;
 b=vpujZh9hfVYYlWUBbS8oSxHfGRCy2GfcEAt1BI1uN7+mFa93ncdXlB9wBNfU9WqOrhAc
 3xb+TXjcfeGfZziVC3lYIkK/Imxyie+wAQbXtPytjuiMV+rl39zDIwrUk4jgLyS9t83v
 Bhl+PeR5nEUfigrpurqzT/vlrJzhlVZ5ggs3pApho4zq89TubdjI45yd/h6mcpJ331Wr
 S9xBi+1gB6lmAKqFE0ds8V/UrOuKxmwwDy0tYuNR32hSx0gvn1m5QAXu1Uu7cnnw4y6J
 7rN5kD/Pet5zHniRymn/m1hXE8KI1affqqgNXXhu9JMvGoxjJimcrATiPe00CcjHIoa4 eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yepvtc9xe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Feb 2020 14:58:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 251F9100034;
        Fri, 28 Feb 2020 14:58:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9BC32BEC4A;
        Fri, 28 Feb 2020 14:57:59 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Feb 2020 14:57:59
 +0100
From:   Yannick Fertre <yannick.fertre@st.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: touchscreen: goodix: support of gt9147
Date:   Fri, 28 Feb 2020 14:57:51 +0100
Message-ID: <1582898271-21073-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-28_04:2020-02-28,2020-02-28 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for it by adding compatible.
The chip data on GT9147 is similar to GT912, like
- config data register has 0x8047 address
- config data register max len is 240
- config data checksum has 8-bit

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index d7c3262..9f65d67 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -21,6 +21,7 @@ properties:
       - goodix,gt911
       - goodix,gt9110
       - goodix,gt912
+      - goodix,gt9147
       - goodix,gt927
       - goodix,gt9271
       - goodix,gt928
-- 
2.7.4

