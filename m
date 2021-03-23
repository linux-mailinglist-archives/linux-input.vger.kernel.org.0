Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFA2345558
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 03:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhCWCLG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 22:11:06 -0400
Received: from mail-dm6nam10on2053.outbound.protection.outlook.com ([40.107.93.53]:14822
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230006AbhCWCKo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 22:10:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3n3n7I8cJ65JNOrkLcru89dkd/BqPfVFL2Gkh9RFkmuIW6VtaEvC2kq1Ux3oGHUiTNBiMBNoEF8S66cE9oF9nRxaouk7f9EfS8E+8jnnxoi7XhjzGfKn6XUNGnEKIL+Tah91WBNAf5BCovYV6iqEQe+uTWd8Kr9fNeOJW0DiqNw4Bh12pFfW36cbayXVYUc7UUwIQNQ7sMLcCrs6vSyV6VAe+ZnLz71nsbtJpDW28Pu6uwR04VxY/tuwAcSPO8UiLbmtamXM5uwsgq5dlvTzPxcjRg+Ird1ysZMPF7lDNCujCZYyZ4p2qm4J9Mv4ZGqjxNVGVjsBrRdjyunsnFzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmR2ipi2kzabe0s2ZOEGV9KGgnJWIB814BihrxlUoZc=;
 b=KM5HkwOxprN87LAIWk8YOLgjTTS5U6+aUqmMerVx0n6bSyGJtNKwAuOj1Y/u8Fk10oC7paIQ5NRyrRqtmif9aKBBmLQaC1duKiVIr0nkm9WBhJBQ/2Juqmbc817rdtYyF6m7Z2zllAlYMHEkXtsv9G9fCIMahTEIMbUeRR7Vm63bDPQtTfF1kC0eCyYh7JgbX+YJRvGxb2D7NCSv8e+jRtB0c4rxeE9Z8CrLl2tk0UQ/ygoSt70qLdyqYor0WBOT03GHlc7Gzgbbk34e4P+vmVSxU1czMNnQFsXayhXZle+qsMfZ8SLt7ZVbsKOTUUnHC30uVr+w69aQzW1c6I6qhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmR2ipi2kzabe0s2ZOEGV9KGgnJWIB814BihrxlUoZc=;
 b=RsEZbMFYqIFBms9YUAIXgnIcyZt2UZG0If0ypJTc/MR7arkFaczufxNV6NvZgPJ5ctSmae5+JMIg11XqOvJ7ep8QHlmHWeqKgM43VWbvqPIAaozHalFr2LIUTnUF/Ph+HjnMIP1ZPijJ92y7wdoiLNINybo1wYZXypPVoaLF8Uk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA2PR08MB6555.namprd08.prod.outlook.com (2603:10b6:806:111::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 02:10:42 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d443:cdc3:d44e:d1c8]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d443:cdc3:d44e:d1c8%5]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 02:10:42 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 2/2] dt-bindings: input: iqs5xx: Convert to YAML
Date:   Mon, 22 Mar 2021 21:10:06 -0500
Message-Id: <20210323021006.367-2-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323021006.367-1-jeff@labundy.com>
References: <20210323021006.367-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0005.namprd13.prod.outlook.com (2603:10b6:806:21::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.22 via Frontend Transport; Tue, 23 Mar 2021 02:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 605381cf-9eee-4ca8-f0e3-08d8eda0dc8f
X-MS-TrafficTypeDiagnostic: SA2PR08MB6555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR08MB65558CBF2ADA9E5F46C8A9A4D3649@SA2PR08MB6555.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uja94p1yLOOlKUxzrgxgBNjnQpkDrzPxFQ6RxzqKDZMBF5Gx6wYsrjqrrI7xsluqXjvi2rKFpB8CN/mWdmmGMsnReEhu+i4tJisD3RATBwuRWF1sQaF4j+G9DkN75MV82MhdRwYZY3CSTrbSRzZCaTk5aBwvV3dHtfbHM2cSvTku5hswCaOc0skgnQ+mGTl4iMH0MamIsZQBGst//bnzuFl//2lTmOW8FcXPWF3yTI19P3T3Eg3M8FQ4OqlzDDVWUBVqNTidfILaP+jn0odGP8EAAZzl5blDqVPv9F3kSRwpL5uSuqbjD3+bzStpczG3sINsRZLi3AH/dePBnT8K4djSXBmAPBe930lgOvnR7T/SCPwIDPuW96SNi4lM1mg+Sw2SpwHtQjUMawoYJ9cIJouAeLJSrWBh5VIkJTzzZg4I7Ib2na7Lqo85p/mk4aCUMHTyKQ+apd60pJIjl10bAb9/tJSN3yw+Ui+BJmc8isioKb34lExg1kleumsecQMWMxW6I9ASC9Qv1OAaEvwTGwcYrY7mSiucR7q0qZfcb4ZYwN0of+uRpWOCcZ40zNI5naC9naoMYQwDPKz7KVEzdFj05kj6WxZbQVA8b8471fYDMg/eHhPymWjz16tBZdKb+TsSPyQHigsx/orExHy5Svgh2L02h6zX/507oqsnZt16iQAkIq2OnVX3gKYn6T2D58RhFzoFFg7gAJ5aPiyE4ahpVYiSpPfwPxDzgldIi7OGBn9mlbw6mR2Dzw0RS4/pJqm0VpUSJaEDx6ZaBMnD4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(376002)(39830400003)(16526019)(38100700001)(6486002)(66946007)(86362001)(186003)(8676002)(66556008)(66476007)(8936002)(107886003)(1076003)(966005)(956004)(26005)(6506007)(4326008)(52116002)(83380400001)(478600001)(316002)(6666004)(69590400012)(5660300002)(36756003)(6512007)(2906002)(2616005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o3evYfuwYWKIS0IHzgcA8u4QA48hRDEpgDigkVxYc7W1LaE0VFlYIip2h+T6?=
 =?us-ascii?Q?BDQfwKUfXY0C4VpI/2xVxZpDTJYviaOfpUcSlycTZTEjaSP/lwDOIYgazo09?=
 =?us-ascii?Q?o0cnl/YSW0v8+OzY2SvmrXT0Ky/dKNORakezrOcWkEDw5JUykY7Odp/N6QNr?=
 =?us-ascii?Q?kmj9QEGK/WE55AUspiBYOiGEL1o36AjGaVyp4lWekqSPPsWUlLnUc6BToV0o?=
 =?us-ascii?Q?rS23WH9PjzdHioSbNj4vSh4/uc/LYy75VSD1/uEZg6eBxexenuG7OhK7VpVP?=
 =?us-ascii?Q?3NOgoTHHP4Ipkcfma84ktcoZYYtGL7+hzmPsuqu+mHyYNmDngSEOphUNSQ7w?=
 =?us-ascii?Q?uzIzeEOpo2evTVc5fRWuTx07eBJExtg/nWMOBPxwwgW4FT+OPvYnKaZSjL3O?=
 =?us-ascii?Q?90+efBt1FYCC5eXd5vOmsuW73vMf2d7spzUMRF47FLkuqmKE3/tdBiQeBVFj?=
 =?us-ascii?Q?XlB2nZ4e2FYDCTgy2A2gvKLkJF3Tk8dPlUXt2Ii1a4c86Bd4tzB+dtpwnRBU?=
 =?us-ascii?Q?pMzXZQ3T57uiX1l286fiEBVNf+LHpRAajXkg06rZBex1eRtG/PZlTzEtVuyE?=
 =?us-ascii?Q?onQPGNeO7pfyz7PqBGHAGNnzRswR+3w4sU6/OSKOztWrRHFF/kSH83AlzIpy?=
 =?us-ascii?Q?8CdvFs+A3S65KHe3uuQ41qbX3p6kiuca0KNqZlkVaVGgvpL4a2zuekH12Sz4?=
 =?us-ascii?Q?/018Taodf3ob7KDYaYkLYRpukstedMNz8Bn9coZ/40kKL6RlRM6hl4s26Qa7?=
 =?us-ascii?Q?vnayKFSRu6MZDzzfOUxMFQxZGP5E7seX3GC/Z5qCat7q6Wb8FRcDeR5QGCTO?=
 =?us-ascii?Q?CHdmw1rwXUei64nqv4+APqI0VIg4/JcI/Gf7qR21JMUUtKOqSI42UqqHXkhi?=
 =?us-ascii?Q?s0NMyNxVKxi+PaMLM714hOE3wbw5NOymMhXBGvL/vb1NG9HXcJPCMTiZoFU1?=
 =?us-ascii?Q?Q7g7thys+ZHm2hfK8fb3UiZXKICm52XEdyTiuBdr72hkMJcb6vbjMtv6Prby?=
 =?us-ascii?Q?Re56IwN4dc1EgzEDZItL/M6cuttZOzkIFdZ67/WWl/B/u/PxRVAs3Mw23WjU?=
 =?us-ascii?Q?cPMx+dkve0Lr3zYGLldRaJqQtpfVvO2BlQ/vU5pVsgjBWhEe5u+J4DZAOs+2?=
 =?us-ascii?Q?p9C9FHurhvV694xJI8MuFt3GfYG44XIi7Ria2lQWbaJkh14r1y4TD9yzPGbc?=
 =?us-ascii?Q?Xa4ZZSHOL9tc/Xk1+0Yb0VAkw5hMBUy7Ukp6GeoJp2Mzl4xRgYuo7V3DFf3A?=
 =?us-ascii?Q?Fqh1ar0DkY08iwEXZNPjodTSe726+ImiqXXhixUtC9t1CRIlbRapUru3dNwz?=
 =?us-ascii?Q?mm6Dw7DZZ8GeDWkSNFkjPvHj?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605381cf-9eee-4ca8-f0e3-08d8eda0dc8f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 02:10:42.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHVgPcf3A+tk7zmCf4eZtJGnBAk+XlDMRFRA6rLiZEoWxQj80sgMzEPebGQ6Z76x+dJ4nfLTZqKUSi2FF7SNbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6555
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
Changes in v3:
 - None

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

