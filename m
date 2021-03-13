Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC7D33A044
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbhCMTOI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:14:08 -0500
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com ([40.107.92.67]:9568
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234368AbhCMTNx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQOhyWdvfFqr4HiGGrzidTVx0mEfES0cmR80R7Bdo/5SJytu73rz1qZise78z8i3sYrojq8bFYwOKbijx0YL02YaFBBcen0/icmu4JmcsjMUSmwP2LY2lpTJrhYDjDpOunD+l8XqZ3Qassz9hqV4GSrdk1yNpS90ccXggj05VORNPlI+iMuG4InVWTtjx3IQi5Bg3yFLSVFvszrx+LOMIzLgEtYr2DwQWbESFzK9FYR+eobSPkjODfPd4VbViEiT+iSH4vWxhBv6PYqmUQ4Yce+qDGY4RnKOJgjmjETD69Sc4Tv5fGOusie2UGsRpiHN8LKYCGWLALiXrr8d9Ff99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sacOGMlj7zShq8LgdLxIOG00IIGVp1JdjPFKRDq3X2o=;
 b=BXyrKTKS0pluh4h+OYAQ1Iakp5n0k2dlvOjrsIDQmVI/iOSM7g9fs3sVFw/ChliOuzKzV5ghMKMlJkNcM5VWTFrgzxA3/9YpEBNNNZMdPnDwK4hmTQiAVfNwBjqPFgHdnr4M810J3Z4UqpXtuxFMTNG6RPC9WAaUzr3j5/YdG2EtvWgCp0druWKFrDO9RGpv+Gp0PGBvhbkol3YJrai6H3OeJuNT52rDEwPWyzetZNX8giS1ubWFz3A/Kafsu0MQ12mlRwpGBZiExA7reYwMe4cIuHvzJSQk/FRS6EpA1bb3nCTSwo9W4OtG5KhO2HP4w7eJZFpLHdUk/N1co9GmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sacOGMlj7zShq8LgdLxIOG00IIGVp1JdjPFKRDq3X2o=;
 b=RtFwISY1iPGDougfQ5yLpP+V/F+pjMD/6PeMNEURHFpJyVYpMqKtLaHomfRHY5L0CjTqjYF/AIQDvXHKjm+c8EekI+1xk+8a81Ez36SkBEMxk19CjbOzJQZQetYYrDZ84laCUuSTGMpeUxuVWLaIITiGe7kqWbvAwqPaSM+ZJdE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:47 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:47 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 9/9] dt-bindings: input: iqs5xx: Convert to YAML
Date:   Sat, 13 Mar 2021 13:12:36 -0600
Message-Id: <20210313191236.4366-10-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f095917-ee51-432d-db19-08d8e6542070
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5694DA111758F4C677E9E945D36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szW9UyrczsGCDLmMavjGMLgKUA82WJxa3QRB450GFyK7W34cUvCAREA3Tluekm/o1YfbjOyS+Tt2mBKgr205LJYQKQ/pml9ZEtR5nzDZ/AbKxpNlFakFveUF1V1ruJaYEjzgCQCOnFWR5GrxUw+n+lGBuPmJuPCiYirs4GWij711kgFYLvZA+aUA0kehsySIjHKQyGUqf73HntUg3Sb5tpSiCGlbmm4UOzt9ws6o/ruAhE+wZdyAuK7oz+KmqyapC0p3jWorVS/3bD2EP9J9KIexijmnHOu9XlSlKGfyGHqwZxHm1MlHbqaxHgjICDLKK/swGcoEzIuwOuYs+EB5yOSlR/vFYVYR35wQRphIyRPzcd5JEBEfHGdHwdZiJbwuzi8dO703B+H73EoxAQMgNX5iWjAEMMnRDfmI6tVgeRugUYk2FEpMQvyazsGTznYsKep32nbQHXI9MLVN4H1vRMJQOr90Hs2kC+MqHK+Gr2QObCAizamZ/WEhEEPZjK8lPF+PJfnKeVaYZ+3JG1S1XZZihqBYrdh24yuDdgiKaXTohXKYudJIhBfevPHNYgqKcn23qbAT+TcvpHSWEI5hNDcy4GyCM03ro1XuG4GOjGeFXw6RkVMlYdto+oypH0Kjwg6ssNRDTJDokcHoMlAcpwlo/vWFUQaNinMMgBJQWk3uMq8Cw2xOpN5N5F7nP5EoMyy2mOrpHHemX94iEbjhVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(966005)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o3oAqMtuyzA2tC/Wfx076O4pgIk0i6GU3gqIiuNUCwWNC7dY2/it/SBQg5+h?=
 =?us-ascii?Q?ODcAbs6qoUhDWtyRf58ASyE20qxrvuG5a5RSS+5fZHJAaXDiB9/WDMZx0yPv?=
 =?us-ascii?Q?bR9w5VWZXmWXs0rRfHVznvQh/a9+eTdzpawv1xIwVlO/+nRi5SvJc+GQL7G3?=
 =?us-ascii?Q?5+cXMdiLjoJpz3E6bE+4Y0w0Xeb8Rn8WQYkHCDF+hSSdBiXDTQlth1AZdJVZ?=
 =?us-ascii?Q?FqApIP8cOXIUbWCQNdnL+IQkapIa0GWLfQPVLsMBtpoip0FKNhJ8qxQ7H9Cc?=
 =?us-ascii?Q?ayYZEs6vmJ7GboLxxt3SqZqcSmAzg+IxG+QjYdhNkNIDO77D1osY7h1Hg06T?=
 =?us-ascii?Q?BrAR9BwTWpoHYqDVELPegWTB0hbwnYgZt1Tf7ynvAkLGCaxT0x5I+w3pcuCW?=
 =?us-ascii?Q?DhUm6g5V4zwF6RPAaIEETYkcomBK5ddhmTEB9JhRZn4ho5YuYdqDqRusFjyk?=
 =?us-ascii?Q?cHKjbsqEN49jhoM234ly5H20tNm5KUPBu5daVvt31pfCWTP2jEPr9qEup5Rc?=
 =?us-ascii?Q?kztKHtkpU9Sw4dhgGee5PkgSfoZMzmhnLs3vC/pO2JiHakErFdyIxufwxknz?=
 =?us-ascii?Q?cBD3oCgL4FvD3bEy++xFlGjja5Qq/zolBATmKz11gGrusL6/VLXqWDdMYFxe?=
 =?us-ascii?Q?6l9biORup/JN0aNaQr07WwTcRTm+T0ScvFkc6d3l5f+IOkcpH20zv3RpWvaH?=
 =?us-ascii?Q?bzq15aDNXdBERuH6Hr9mu9FPZGKuFOyP5DQI4aexGmhscgPbEBCm8eBAy4D5?=
 =?us-ascii?Q?NvaNL62U10ipnlJF5yoFNCqDI3fH7n9RqfE28mmNT2AdvP2IgiQOBEHPtBOB?=
 =?us-ascii?Q?O/aBY0yB7TcUfqTAycKgCfudU/78QIlCjR/s4jqDYWqS66bJC08SSWMnCbdY?=
 =?us-ascii?Q?Lg7LLaO88uWkVQIFbZrnGjdhE0D10xU8dW61uPUe7Y9JLMNu6SdiuhwOGQQc?=
 =?us-ascii?Q?VpsY7/4V99Zi5++xziV96mH7rfXyayP9JmaScTQL5xzcUutCjV7xylJ1lm6e?=
 =?us-ascii?Q?lhNxH1idGSFnZmko7TMiDFauMv1e5YcYad2SdZ/qtCaaaWIUFYiBbQ8LX/PL?=
 =?us-ascii?Q?lCqFbbs8Tmcdg1nXD9HrzmJx+kzaCik9lPbNoCeHfq4xVbIrmXDrttaTT900?=
 =?us-ascii?Q?I7izm2ROpMaPN78v+OqQbI8VDE9yUPOVnU2UK8pRcNFVvm69fnwDji+SESoy?=
 =?us-ascii?Q?/uM54wp0qYxOQHq2LQTvJI/YDZvu51T1fB4HdcfigtY17iB52q+4pwzN9uQo?=
 =?us-ascii?Q?1gmqE4Fbo5Ip2SRV7drhLkDQJukxieCMO6FossZmFoQcU9ZH+OKP8wiEZvv6?=
 =?us-ascii?Q?1UxF8HbPcpx8wdW5O8Tfkrrr?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f095917-ee51-432d-db19-08d8e6542070
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:47.0162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGJuOs8RIg54naY5rvGNkg77hRh+O6/41UMHUmdoWWI4xyim5eAhVPGLAL5qguBu9+okeBuN3OoIjngHXorYFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch converts the legacy text-based binding document to YAML
format. Extraneous details and touchscreen properties that weren't
actually supported have been dropped.

The reset GPIO has since been made optional in the driver; this is
now reflected here as well.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
 - Added vendor prefix to filename and $id
 - Added Reviewed-by trailer

 .../input/touchscreen/azoteq,iqs5xx.yaml      | 75 +++++++++++++++++
 .../bindings/input/touchscreen/iqs5xx.txt     | 80 -------------------
 2 files changed, 75 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
new file mode 100644
index 000000000000..b5f377215c09
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/azoteq,iqs5xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
+
+maintainers:
+  - Jeff LaBundy <jeff@labundy.com>
+
+description: |
+  The Azoteq IQS550, IQS572 and IQS525 trackpad and touchscreen controllers
+  employ projected-capacitance sensing and can track up to five independent
+  contacts.
+
+  Link to datasheet: https://www.azoteq.com/
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - azoteq,iqs550
+      - azoteq,iqs572
+      - azoteq,iqs525
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source: true
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            touchscreen@74 {
+                    compatible = "azoteq,iqs550";
+                    reg = <0x74>;
+                    interrupt-parent = <&gpio>;
+                    interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+                    reset-gpios = <&gpio 22 (GPIO_ACTIVE_LOW |
+                                             GPIO_PUSH_PULL)>;
+
+                    touchscreen-size-x = <800>;
+                    touchscreen-size-y = <480>;
+            };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
deleted file mode 100644
index efa0820e2469..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
-
-Required properties:
-
-- compatible			: Must be equal to one of the following:
-				  "azoteq,iqs550"
-				  "azoteq,iqs572"
-				  "azoteq,iqs525"
-
-- reg				: I2C slave address for the device.
-
-- interrupts			: GPIO to which the device's active-high RDY
-				  output is connected (see [0]).
-
-- reset-gpios			: GPIO to which the device's active-low NRST
-				  input is connected (see [1]).
-
-Optional properties:
-
-- touchscreen-min-x		: See [2].
-
-- touchscreen-min-y		: See [2].
-
-- touchscreen-size-x		: See [2]. If this property is omitted, the
-				  maximum x-coordinate is specified by the
-				  device's "X Resolution" register.
-
-- touchscreen-size-y		: See [2]. If this property is omitted, the
-				  maximum y-coordinate is specified by the
-				  device's "Y Resolution" register.
-
-- touchscreen-max-pressure	: See [2]. Pressure is expressed as the sum of
-				  the deltas across all channels impacted by a
-				  touch event. A channel's delta is calculated
-				  as its count value minus a reference, where
-				  the count value is inversely proportional to
-				  the channel's capacitance.
-
-- touchscreen-fuzz-x		: See [2].
-
-- touchscreen-fuzz-y		: See [2].
-
-- touchscreen-fuzz-pressure	: See [2].
-
-- touchscreen-inverted-x	: See [2]. Inversion is applied relative to that
-				  which may already be specified by the device's
-				  FLIP_X and FLIP_Y register fields.
-
-- touchscreen-inverted-y	: See [2]. Inversion is applied relative to that
-				  which may already be specified by the device's
-				  FLIP_X and FLIP_Y register fields.
-
-- touchscreen-swapped-x-y	: See [2]. Swapping is applied relative to that
-				  which may already be specified by the device's
-				  SWITCH_XY_AXIS register field.
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/gpio/gpio.txt
-[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
-
-Example:
-
-	&i2c1 {
-		/* ... */
-
-		touchscreen@74 {
-			compatible = "azoteq,iqs550";
-			reg = <0x74>;
-			interrupt-parent = <&gpio>;
-			interrupts = <17 4>;
-			reset-gpios = <&gpio 27 1>;
-
-			touchscreen-size-x = <640>;
-			touchscreen-size-y = <480>;
-
-			touchscreen-max-pressure = <16000>;
-		};
-
-		/* ... */
-	};
--
2.17.1

