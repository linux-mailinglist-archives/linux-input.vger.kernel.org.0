Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6379132725
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 14:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgAGNJ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 08:09:26 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22526 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728063AbgAGNJM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 08:09:12 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007D3df4013498;
        Tue, 7 Jan 2020 14:09:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=a1snjXTV7CCl7uleGJXXja1gA7BM7qDFoX1LkE6clSI=;
 b=tvCcIS3z6EzfbQGiXjV4Nk8Vdw7WkDstQJwirMCSNR+f7HCd9BQHUChZVW5EIuZw+qg9
 BU70aAx9Jl8cmgdtBWH28kPPIQQgiaxSK6YxPOpEZjJupHBZ+hNopQhfhipXbw9wz6PV
 xM6h7dguRrODv6mMsBEeIDRVfogaGN9tws9nxqGCoDX541Gq38M7y+X3QULBul4HOu2F
 pbp0F3zDg7NA1YQnf+ANflyLYtgPgTzlLtvinDVuStmDdCRwxc6SuFRoxDBpwROS1MY0
 fL/Vg6NREdgiwMbVzCzMVUTv3kI3DdptguxtRpt6Tb44bMu5dTJ2VUzeKNe8Bew7LT1n 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2xakkape5u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 14:09:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38EA6100034;
        Tue,  7 Jan 2020 14:09:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 300942AD9EB;
        Tue,  7 Jan 2020 14:09:06 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jan 2020 14:09:05
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yannick.fertre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 1/2] dt-bindings: touchscreen: Add touchscreen schema
Date:   Tue, 7 Jan 2020 14:09:02 +0100
Message-ID: <20200107130903.14421-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200107130903.14421-1-benjamin.gaignard@st.com>
References: <20200107130903.14421-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen schema for common properties

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/input/touchscreen/touchscreen.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
new file mode 100644
index 000000000000..f6e7c73ef14e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/touchscreen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common touchscreen Bindings
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+properties:
+  touchscreen-min-x:
+    description: minimum x coordinate reported (0 if not set)
+
+  touchscreen-min-y:
+    description: minimum y coordinate reported (0 if not set)
+
+  touchscreen-size-x:
+    description: horizontal resolution of touchscreen (maximum x coordinate reported + 1)
+
+  touchscreen-size-y:
+    description: vertical resolution of touchscreen (maximum y coordinate reported + 1)
+
+  touchscreen-max-pressure:
+    description: maximum reported pressure (arbitrary range dependent on the controller)
+
+  touchscreen-min-pressure:
+    description: minimum pressure on the touchscreen to be achieved in order for the
+                 touchscreen driver to report a touch event.
+
+  touchscreen-fuzz-x:
+    description: horizontal noise value of the absolute input device (in pixels)
+
+  touchscreen-fuzz-y:
+    description: vertical noise value of the absolute input device (in pixels)
+
+  touchscreen-fuzz-pressure:
+    description: pressure noise value of the absolute input device (arbitrary range
+                 dependent on the controller)
+
+  touchscreen-average-samples:
+    description: Number of data samples which are averaged for each read (valid values
+                 dependent on the controller)
+
+  touchscreen-inverted-x:
+    description: X axis is inverted (boolean)
+    type: boolean
+
+  touchscreen-inverted-y:
+    description: Y axis is inverted (boolean)
+    type: boolean
+
+  touchscreen-swapped-x-y:
+    description: X and Y axis are swapped (boolean)
+                 Swapping is done after inverting the axis
+    type: boolean
+
+  touchscreen-x-mm:
+    description: horizontal length in mm of the touchscreen
+
+  touchscreen-y-mm:
+    description: vertical length in mm of the touchscreen
-- 
2.15.0

