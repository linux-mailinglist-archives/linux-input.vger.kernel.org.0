Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEDD301968
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 04:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbhAXDpp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 22:45:45 -0500
Received: from mail-co1nam11on2077.outbound.protection.outlook.com ([40.107.220.77]:63072
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726414AbhAXDpj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 22:45:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1mZRR1sY4JpIsQwZ0EylYfj3qMSrp4F8BL74G5nmgtXQUGQREYY07oUOhl+I7yzmzf1NoO2ujpKf/nWAm2mfUPJawZLl9jFS0NBlyjeAQrguAj1TKGd0hY1eqrZyziSwGGOCjJZOhWkk/exuvLRIuZiAiFqIrPgiKJdH1ikmJxKgVvZtCF/naVPIyMD72Mw1SrKka6pvJXrUCifGaMLKHH+ZXodUqb7OAp7vJi4jukf7r81DdDF3f+o6x1xQv7ZRJCf99VSvb8qdnmuOH4aNL7sZ8/v5p/8g1VHV2ukW2dztDm8J7et0pdaYfsbGUElyunhVHeQzpykl6eKXY3BFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE2P+I/jYdMeCfYclOyPmMy0yG6858akH/HsK64OvaI=;
 b=hOgm6Eec4GxtSmlA/kNFmUhqVYnjRiDu+4Qrnknbz+f0Ftc49vlI8XawVbvyI49qowcRBzs1oyI8qdm1NcCEBdB2X95VgOPhex4TWw/BCJF9OBEUNnpq8P+jXfL/VYvdJ1BOOkgh7WUY2N3YQ4SbDVAR3z/2PpsnqKDSLEkq6lgyieiVkGmpIB2TGycv0mqUh7I5C9ephBUdPFL3NCA42i3riOUE9n7Ljy0UiNFYGgEuHgajTWcrR0YwAjHt+HfJmG5l38WO71OqrXkjGQrKF0bwJDOY33DpJ9M+szwkRryg5eoeS7x3lwkfniCIqwxFO703b61siayaXGBp3zCZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE2P+I/jYdMeCfYclOyPmMy0yG6858akH/HsK64OvaI=;
 b=QKEPmb7fxWcxr4pNqdL3e1EsBM7qh4vcX5bo0Zf0i4J+54DBuYFI53125ioubpIbbJ0HnRbuAcD2q//cRTdlMTyv8nJj1ZWY5Q/iCU7lqcjsKcsXhLpH4caRJeOFu7OsmVhZ8LXT32HCWMOA9Z8/NQlY9HCUB8XjT5Hi+2l83wc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB6992.namprd08.prod.outlook.com (2603:10b6:806:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Sun, 24 Jan
 2021 03:43:55 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Sun, 24 Jan 2021
 03:43:55 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 3/5] dt-bindings: input: touchscreen: Move helper bindings to core
Date:   Sat, 23 Jan 2021 21:42:54 -0600
Message-Id: <1611459776-23265-4-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611459776-23265-1-git-send-email-jeff@labundy.com>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Sun, 24 Jan 2021 03:43:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d58254a-6870-4d54-aad3-08d8c01a4648
X-MS-TrafficTypeDiagnostic: SA1PR08MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR08MB6992F1E2B64DD8523C988D6ED3BE9@SA1PR08MB6992.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9QEY6f6Y32soL/6QcbiplJuq9na3Yyavv5xVvqTOEJL/WYZ4JzxU10FoM+0GrAXMQ7tvghv7Xibvjmbbs6Ftnwm9yfBMRVvSDyyKnK3KKwgolJ8BdC3YzqDn/SHMB89nrrfcPzO4gXRi5Z9mPbdCZCzeGQuZLpomo0aTcWvSiBsLnd9Ow85V3LaJSBy5ts6lG6YeBhI0pYdCpzLdYCqWq0+r4gAsmKfYkMUtInmr3vpvloEb+WWmkObM72Zb35D+HZUwd2V7A4yu6Em4oMCxF6F19vZeLbYGkDc6O9DvNe29RbUQPdDIpm0VvwMEBA6P1cBNn6aEqzNHi8m5KHWYWRbwrehpUQgdwradIAqXvbmBU+8N93gf6lhTVdks7P71X3ovoK/IFxUIPbutS4c+07cYuhY8wF4qMByTBH7eYP62ZKMn+/2MQpLjDR2tdeCBL+v/RbmePRKfIZGUkvQduERntun0rNAw9VE0vtWg/X5jEpgrtjiR4ObtJXRJzfp4m5w6asQONTJeQW9UbZQ0WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39830400003)(346002)(52116002)(107886003)(5660300002)(66946007)(8676002)(6486002)(6506007)(66556008)(8936002)(36756003)(966005)(66476007)(86362001)(69590400011)(2616005)(83380400001)(4326008)(26005)(30864003)(16526019)(186003)(6512007)(316002)(478600001)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mI7kzAqaLGfsVeO1/5YYducbaHBWKQ9WTuiw73vD0aThhNJvDRkS7n/7b12k?=
 =?us-ascii?Q?YvgzGt6gdRMrQ5+Xil+s1WGV/woIlQ6zSFHvnlMWpiP60xja7vbJjvQ6daWJ?=
 =?us-ascii?Q?GIYP/agMjuBX+kVr5Gihi5e6dVTEF30Yv2IJdBVoki8sJ7oTHWSzo8TEGwsN?=
 =?us-ascii?Q?/baJQ8gecRUL8rAh9IQCaRhoyDSKnm9d2cDUhkzu7cMWbyDtbLDIiBnf/MJJ?=
 =?us-ascii?Q?iht8Lzfjiap6fIjlwdYJDv+lcUQefhDXNJswUjTFD5n8wJdeeaixssn7b/J4?=
 =?us-ascii?Q?H8gzJ7kloBM+LWzEyr3iuQwCWKdb+l164Vl+tKpa8SuhjvYFCHtJY3ckbubh?=
 =?us-ascii?Q?kD9XdywcAUuSwVvqN3TQy22fJ77buqOmONQVpbcKZwp+7jbb+WQZM0IaX0lT?=
 =?us-ascii?Q?EnLOhXl6rqZoz1Q7/JLlhxkFUWM3feWqGnq+JpzP4To8QAFl588wNAbISX5a?=
 =?us-ascii?Q?kiTw173c0nRfQzEiTIWWxoGphEoRY3GJi+lWLBqRk64yBcdb7FQrRHsH03WE?=
 =?us-ascii?Q?80Yq8eoECaHkTspnb+WsxRGoE87Od5Y/tWhgox2ZdRFYEktRzlKzyh6LQnZr?=
 =?us-ascii?Q?QxodGNh45SwWYdWhIJ96/mNY8GRa0+xL3xcDPmgCBGnJVe3cRg5Me/+cEud1?=
 =?us-ascii?Q?g7t5Q3Rz/NTu0CQy6PRxgCcoZOQlPFYt/kN/dwHW7bjyt5Fccxe+0c8g+rBs?=
 =?us-ascii?Q?rwPkyprs2MnW0TRjnicYdzlXvXbyqNmopvVqY7MEZk7aZFxoyqXAd5gtkFCR?=
 =?us-ascii?Q?YzJne2pa9jjN+PWm+f9QMsrr9cWVmtevYm7Sm1iBJJa9ojY86N9hh9fH/0mq?=
 =?us-ascii?Q?PH8C4QaxAqZbYx9hSCHBg/MV8HXkGDHy8WGYHQveQ2LchqAm/2CxGLX5UDHU?=
 =?us-ascii?Q?FDRrzAU2F9LHSgqDcjBe4M+IqAfEbjHWj5zP+b30MntUxPIktYmLCE+g2LCS?=
 =?us-ascii?Q?yHvJW9q2dNZmGXYeKNGRqczc+b1JED6Cj+9DTPr7K3L3gIQLWJ6t3uYfz6lb?=
 =?us-ascii?Q?UFhc?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d58254a-6870-4d54-aad3-08d8c01a4648
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2021 03:43:55.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VsO+x40WwPjLO2MzRevp8KVAf+jMpds051rjkjvup8hzI/RY0+e15sGXQRqWk8EjF+DO8zOOt16nfqTlAjlVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB6992
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the helper functions moving to /drivers/input/ following the
discussion in [1], touchscreen.yaml and touchscreen.txt are moved
one level up as well to maintain a consistent directory structure.

No changes are made to either file except to update the $id field
in touchscreen.yaml to reflect the new path. The handful of .yaml
bindings that reference the original relative path are updated as
well.

Last but not least, the handful of .txt bindings that included an
absolute path to touchscreen.txt are updated too.

[1] https://patchwork.kernel.org/patch/11924029/

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added this patch to the series

 .../devicetree/bindings/input/elan_i2c.txt         |  2 +-
 .../devicetree/bindings/input/touchscreen.txt      |  1 +
 .../devicetree/bindings/input/touchscreen.yaml     | 83 ++++++++++++++++++++++
 .../bindings/input/touchscreen/ads7846.txt         |  2 +-
 .../bindings/input/touchscreen/bu21013.txt         |  2 +-
 .../input/touchscreen/cypress,cy8ctma140.yaml      |  2 +-
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  2 +-
 .../bindings/input/touchscreen/eeti,exc3000.yaml   |  2 +-
 .../input/touchscreen/elan,elants_i2c.yaml         |  2 +-
 .../bindings/input/touchscreen/goodix.yaml         |  2 +-
 .../bindings/input/touchscreen/iqs5xx.txt          |  2 +-
 .../bindings/input/touchscreen/mms114.txt          |  2 +-
 .../bindings/input/touchscreen/touchscreen.txt     |  1 -
 .../bindings/input/touchscreen/touchscreen.yaml    | 83 ----------------------
 14 files changed, 94 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

diff --git a/Documentation/devicetree/bindings/input/elan_i2c.txt b/Documentation/devicetree/bindings/input/elan_i2c.txt
index 9963247..f11c8e1 100644
--- a/Documentation/devicetree/bindings/input/elan_i2c.txt
+++ b/Documentation/devicetree/bindings/input/elan_i2c.txt
@@ -26,7 +26,7 @@ Optional properties:

 [0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 [1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+[2]: Documentation/devicetree/bindings/input/touchscreen.txt

 Example:
 	&i2c1 {
diff --git a/Documentation/devicetree/bindings/input/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen.txt
new file mode 100644
index 0000000..e1adb90
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen.txt
@@ -0,0 +1 @@
+See touchscreen.yaml
diff --git a/Documentation/devicetree/bindings/input/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen.yaml
new file mode 100644
index 0000000..e2e27c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen.yaml#
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
+    description: minimum pressure on the touchscreen to be achieved in order
+      for the touchscreen driver to report a touch event.
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
+    description: pressure noise value of the absolute input device (arbitrary
+      range dependent on the controller)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  touchscreen-average-samples:
+    description: Number of data samples which are averaged for each read (valid
+      values dependent on the controller)
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
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt b/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
index 81f6bda..b158a86 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
@@ -69,7 +69,7 @@ Optional properties:
 	touchscreen-swapped-x-y		General touchscreen binding, see [1].

 [1] All general touchscreen properties are described in
-    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
+    Documentation/devicetree/bindings/input/touchscreen.txt.

 Deprecated properties:

diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
index da4c9d8..e056a5f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
@@ -17,7 +17,7 @@ Optional properties:
  - touchscreen-swapped-x-y : General touchscreen binding, see [1].

 [1] All general touchscreen properties are described in
-    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
+    Documentation/devicetree/bindings/input/touchscreen.txt.

 Deprecated properties:
  - rohm,touch-max-x        : Maximum outward permitted limit in the X axis
diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
index 3225c8d..900e112 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Linus Walleij <linus.walleij@linaro.org>

 allOf:
-  - $ref: touchscreen.yaml#
+  - $ref: ../touchscreen.yaml#

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 4ce1094..3d73fe3 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -18,7 +18,7 @@ maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>

 allOf:
-  - $ref: touchscreen.yaml#
+  - $ref: ../touchscreen.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 007adbc..b1beb61 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>

 allOf:
-  - $ref: touchscreen.yaml#
+  - $ref: ../touchscreen.yaml#

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
index a792d63..d3fabaf 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
@@ -10,7 +10,7 @@ maintainers:
   - David Heidelberg <david@ixit.cz>

 allOf:
-  - $ref: touchscreen.yaml#
+  - $ref: ../touchscreen.yaml#

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index da5b0d8..5bea19a 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>

 allOf:
-  - $ref: touchscreen.yaml#
+  - $ref: ../touchscreen.yaml#

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
index efa0820..d9c107e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
@@ -56,7 +56,7 @@ Optional properties:

 [0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 [1]: Documentation/devicetree/bindings/gpio/gpio.txt
-[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+[2]: Documentation/devicetree/bindings/input/touchscreen.txt

 Example:

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
index 707234c..4c28a30 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
@@ -18,7 +18,7 @@ Optional properties:
 - touchscreen-inverted-y: See [1]
 - touchscreen-swapped-x-y: See [1]

-[1]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+[1]: Documentation/devicetree/bindings/input/touchscreen.txt

 Example:

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
deleted file mode 100644
index e1adb90..0000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ /dev/null
@@ -1 +0,0 @@
-See touchscreen.yaml
diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
deleted file mode 100644
index 36dc7b5..0000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ /dev/null
@@ -1,83 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/touchscreen/touchscreen.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Common touchscreen Bindings
-
-maintainers:
-  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
-
-properties:
-  touchscreen-min-x:
-    description: minimum x coordinate reported
-    $ref: /schemas/types.yaml#/definitions/uint32
-    default: 0
-
-  touchscreen-min-y:
-    description: minimum y coordinate reported
-    $ref: /schemas/types.yaml#/definitions/uint32
-    default: 0
-
-  touchscreen-size-x:
-    description: horizontal resolution of touchscreen (maximum x coordinate reported + 1)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-size-y:
-    description: vertical resolution of touchscreen (maximum y coordinate reported + 1)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-max-pressure:
-    description: maximum reported pressure (arbitrary range dependent on the controller)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-min-pressure:
-    description: minimum pressure on the touchscreen to be achieved in order
-      for the touchscreen driver to report a touch event.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-fuzz-x:
-    description: horizontal noise value of the absolute input device (in pixels)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-fuzz-y:
-    description: vertical noise value of the absolute input device (in pixels)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-fuzz-pressure:
-    description: pressure noise value of the absolute input device (arbitrary
-      range dependent on the controller)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-average-samples:
-    description: Number of data samples which are averaged for each read (valid
-      values dependent on the controller)
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-inverted-x:
-    description: X axis is inverted
-    type: boolean
-
-  touchscreen-inverted-y:
-    description: Y axis is inverted
-    type: boolean
-
-  touchscreen-swapped-x-y:
-    description: X and Y axis are swapped
-                 Swapping is done after inverting the axis
-    type: boolean
-
-  touchscreen-x-mm:
-    description: horizontal length in mm of the touchscreen
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  touchscreen-y-mm:
-    description: vertical length in mm of the touchscreen
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-dependencies:
-  touchscreen-size-x: [ touchscreen-size-y ]
-  touchscreen-size-y: [ touchscreen-size-x ]
-  touchscreen-x-mm: [ touchscreen-y-mm ]
-  touchscreen-y-mm: [ touchscreen-x-mm ]
--
2.7.4

