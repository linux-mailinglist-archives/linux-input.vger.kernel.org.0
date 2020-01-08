Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471E0133DFB
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 10:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbgAHJLg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 04:11:36 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13664 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727112AbgAHJLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Jan 2020 04:11:33 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00899px3028549;
        Wed, 8 Jan 2020 10:11:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/mGprgClnXdbKIEUFKqwPLf/iw8oVTTolk83OrZpP/A=;
 b=WXoW5nUPP4SbphXjZrKlS32RJZahgUr8F4z40KVnGBmE+ovh8IGhR4ZRf+BwGezbKHDs
 oKHuHnS4FiZAfVZV8d/z/M/vS7wjjjj2ficZie7KlcwpP9QlbNA/FtWtygtdi+LtwrkS
 1ZKQcgJ+wlQLEU5PhVQvHiDulUdj8z4xdpcbGRC+u1AhEucFpmJq2Ow0QUc+2LNvJNI9
 AmjDq1PKIkmkYcjBAP/FFFoE3ktDcmIIwpiZy5zCGQrqP57Hkx5QHb7hn9XRoQC/H1l6
 uqBoMFwvxawqel1LyP0fy7HhmxvuRf3b41Q+gbB8hkUZ93f+4LUd/xqUNqD/xXHFnQ4Y TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2xakkau3t6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Jan 2020 10:11:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C308710003A;
        Wed,  8 Jan 2020 10:11:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3DF622088E;
        Wed,  8 Jan 2020 10:11:21 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 8 Jan 2020 10:11:21
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <hadess@hadess.net>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yannick.fertre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2 1/2] dt-bindings: touchscreen: Add touchscreen schema
Date:   Wed, 8 Jan 2020 10:11:17 +0100
Message-ID: <20200108091118.5130-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200108091118.5130-1-benjamin.gaignard@st.com>
References: <20200108091118.5130-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-08_01:2020-01-08,2020-01-08 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen schema for common properties

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
version 2:
- remove old definition in touchscreen.txt
- add type for all properties
- add dependencies between properties 

 .../bindings/input/touchscreen/touchscreen.txt     | 40 +----------
 .../bindings/input/touchscreen/touchscreen.yaml    | 83 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
index 8641a2d70851..e1adb902d503 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
@@ -1,39 +1 @@
-General Touchscreen Properties:
-
-Optional properties for Touchscreens:
- - touchscreen-min-x		: minimum x coordinate reported (0 if not set)
- - touchscreen-min-y		: minimum y coordinate reported (0 if not set)
- - touchscreen-size-x		: horizontal resolution of touchscreen
-				  (maximum x coordinate reported + 1)
- - touchscreen-size-y		: vertical resolution of touchscreen
-				  (maximum y coordinate reported + 1)
- - touchscreen-max-pressure	: maximum reported pressure (arbitrary range
-				  dependent on the controller)
- - touchscreen-min-pressure	: minimum pressure on the touchscreen to be
-				  achieved in order for the touchscreen
-				  driver to report a touch event.
- - touchscreen-fuzz-x		: horizontal noise value of the absolute input
-				  device (in pixels)
- - touchscreen-fuzz-y		: vertical noise value of the absolute input
-				  device (in pixels)
- - touchscreen-fuzz-pressure	: pressure noise value of the absolute input
-				  device (arbitrary range dependent on the
-				  controller)
- - touchscreen-average-samples : Number of data samples which are averaged
-				  for each read (valid values dependent on the
-				  controller)
- - touchscreen-inverted-x	: X axis is inverted (boolean)
- - touchscreen-inverted-y	: Y axis is inverted (boolean)
- - touchscreen-swapped-x-y	: X and Y axis are swapped (boolean)
-				  Swapping is done after inverting the axis
- - touchscreen-x-mm		: horizontal length in mm of the touchscreen
- - touchscreen-y-mm		: vertical length in mm of the touchscreen
-
-Deprecated properties for Touchscreens:
- - x-size			: deprecated name for touchscreen-size-x
- - y-size			: deprecated name for touchscreen-size-y
- - moving-threshold		: deprecated name for a combination of
-				  touchscreen-fuzz-x and touchscreen-fuzz-y
- - contact-threshold		: deprecated name for touchscreen-fuzz-pressure
- - x-invert			: deprecated name for touchscreen-inverted-x
- - y-invert			: deprecated name for touchscreen-inverted-y
+See touchscreen.yaml
diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
new file mode 100644
index 000000000000..d7dac16a3960
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -0,0 +1,83 @@
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
+    description: minimum x coordinate reported
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  touchscreen-min-y:
+    description: minimum y coordinate reported
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  touchscreen-size-x:
+    description: horizontal resolution of touchscreen (maximum x coordinate reported + 1)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-size-y:
+    description: vertical resolution of touchscreen (maximum y coordinate reported + 1)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-max-pressure:
+    description: maximum reported pressure (arbitrary range dependent on the controller)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-min-pressure:
+    description: minimum pressure on the touchscreen to be achieved in order for the
+                 touchscreen driver to report a touch event.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-fuzz-x:
+    description: horizontal noise value of the absolute input device (in pixels)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-fuzz-y:
+    description: vertical noise value of the absolute input device (in pixels)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-fuzz-pressure:
+    description: pressure noise value of the absolute input device (arbitrary range
+                 dependent on the controller)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-average-samples:
+    description: Number of data samples which are averaged for each read (valid values
+                 dependent on the controller)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-inverted-x:
+    description: X axis is inverted
+    type: boolean
+
+  touchscreen-inverted-y:
+    description: Y axis is inverted
+    type: boolean
+
+  touchscreen-swapped-x-y:
+    description: X and Y axis are swapped
+                 Swapping is done after inverting the axis
+    type: boolean
+
+  touchscreen-x-mm:
+    description: horizontal length in mm of the touchscreen
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-y-mm:
+    description: vertical length in mm of the touchscreen
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+dependencies:
+  touchscreen-size-x: [ touchscreen-size-y ]
+  touchscreen-size-y: [ touchscreen-size-x ]
+  touchscreen-x-mm: [ touchscreen-y-mm ]
+  touchscreen-y-mm: [ touchscreen-x-mm ]
-- 
2.15.0

