Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549A532E077
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCEEOE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:14:04 -0500
Received: from mail-dm6nam08on2057.outbound.protection.outlook.com ([40.107.102.57]:17664
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEEOD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:14:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXPKVtEyaxnpJZ8LW+pl9Mdhx/arKUomvofIN4FqiobFLh4HotGnGZVn+7qbq71PECBdN5h/UmLjjy6TZJO9ndbo+cyoDL7i8oQMLdYdkqwxutiiokjj3aEy0XahlunhFGaybJXnoQX5ZYlkpJy6UVdEO3kbPnRaNaB082ejvMJotLfuZd4PQes6ZNkD9R7boWoMeKqvxQlFGhr04Kwsiyo28mLEVXLenFAyPC+UwNoowUvxyqBr/E4WXCWWW5o75ZiJeosh3vYe/1sZNHT+SeCnKkiu2AQMyf/Zmx7gjcK4VbGJqwAgfoQNQNblLf/+AaLqSHmKkrS8eJalrCWEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tOt5zaMcC6zpGrE2L8Gl8aU3d8XeAXLn4iz2+Be3Rc=;
 b=S0CbbPudy3VMs8i6yjTV/lQLege84HIQP4cAL2yew/X3sb/lqAMPq+S2gm9CRbIMaycJXTjtJzEl+XWWLE1EOKEkTiHnHibnPTm5eR4lyEi89XgFx9eb2D00+OJ6d6m2baNDnzRLDeHisSqBpS07IXdjM9HqB+SgQlJ9i4bwbhT4CXfbTGvXCa4KdKfHy/7Zea9o1okj7VqWc0xg64WJr24NYwQ0ZtKgmuyAS3ECcpme5Vk3A2JipZce8fzz+W6+5EdU41bbVqdxT5xTEGhQdtHX8MaZpmt3O6zz2yBBUZOir+QV+WrJm6eYHDxdFd66lYIHGctEwge0GJ35NjB/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tOt5zaMcC6zpGrE2L8Gl8aU3d8XeAXLn4iz2+Be3Rc=;
 b=xHWO7Bq/se45uSHezT13plUZ/7FqAYLMxTsvnhG6CGGjEKX02H1kTotAmL/6HiAroThQV3JxelIejSvA1Gy+DY4SmSMyb5Q9ePHcmNFzmfUGjOAme4NqHcNW1F0DL61TJTwrfx6+UFT/n7HyXhZhFyD6YCLVoj7u+m+COFLEpng=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN4PR0801MB3709.namprd08.prod.outlook.com (2603:10b6:803:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 04:14:01 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:14:00 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 9/9] dt-bindings: input: iqs5xx: Convert to YAML
Date:   Thu,  4 Mar 2021 22:12:36 -0600
Message-Id: <20210305041236.3489-10-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305041236.3489-1-jeff@labundy.com>
References: <20210305041236.3489-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:14:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff5a66a4-26a0-4694-0355-08d8df8d1ac3
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN4PR0801MB37092E99AAB32B01042615D5D3969@SN4PR0801MB3709.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMIcR2eeSR6AChcFSHjLR6yCDXaI/06W26aUl/foWQIzS9GwrlCeYhuYc2qc/+pKhgBP2KozSx3g9AP+MJLEFWlFqeL3lVcyWN3aRtZZaW3LNk3HM5E6bZkykdgBalAGsOrTW+ZjJPrrRA21+/GpFd4UDCQr4uEOhgf67c/SEIMTg9KWApx5Lz3Mw+I5ap3SHXuFhcVdrBtT2iXLN5GEyTYu6dBP5+yZ2bJy46BzLRsEaBdMdzJkBBkK81x6bY8oZwrO8iqQZT6ryYSRiBiUMnUg8bHHNzoRf3W91emLH7ru+XhT7csSoITrMc11WUlxH977t8z+UNebP0rrpRhL/LfqMmQBD1l1ZQqhKHzyT2EiFC4z7eHqS3iXjducLgXXQ8o5ZmRB7cIdBG+Qh3ctT6QiBCUgWucOc9ufSmphm9p7mhYzuMaeMK93MHXxDGzsyXkENez+fyk+ysuPNktIvFsBZsQbo3THag4vQJTVKDCc/7cgJrN/Jxt9IjNJycMTywqmnFFhauw3ipa3wA9UWTTo/ZKhzADodzsYufK68ezr3YbCq7szEuF0kmW7ye9qcVMLNPFhjOhoBDwLb2h2G0pPFGpAAg36D8f7rm5SRf0QUaN68ggHzn2pVncJ89BC3F4e12XM0JkiJnMYb+eijcQ7NH4B1DrkcgfAPs7QJf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(346002)(136003)(366004)(376002)(8676002)(66556008)(956004)(6506007)(107886003)(1076003)(2616005)(5660300002)(2906002)(6486002)(52116002)(8936002)(508600001)(316002)(26005)(4326008)(16526019)(966005)(83380400001)(6666004)(86362001)(66476007)(36756003)(66946007)(186003)(6512007)(69590400012)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D/mINN7VdlpAHOoFvI0jEU6PNDIWQSyu6btkD0U8+EybTCEnFdwlQJL1f80B?=
 =?us-ascii?Q?BK4kLiZLCe+hZV/Xa8SRRDn6/GS/syoGPw4zNrw7cp5fd7OU+gCs+Togb2K/?=
 =?us-ascii?Q?h+gfxIxa1EeGwIh34iCqtZQUGj5Wej6HC1q2k57Kv4oKI8FuZLnkwqTDGoQD?=
 =?us-ascii?Q?M4gMXYB58kva1KprKUM7Fr6FOFtHBmae2m5y1oVnaIVSmTrV9/i7XIE1jhcf?=
 =?us-ascii?Q?7lN5Fpgca+Ccqh0EwN6P1DfVfRVnQEvntc1YqiB5R18zRmznX7SDqe5WORqT?=
 =?us-ascii?Q?xdebieF/ey8wAaA4vWXaksLq3gcp1iIKA60STacs+/m0O+eRIDtflH4sJ9qr?=
 =?us-ascii?Q?XEgX6wLZtKFtEoK17Nqoh9XZUwns1Ui02fZSGgPoxNbGuuGFaqy/0bMXcJuJ?=
 =?us-ascii?Q?QmQhz+ngBG7Tp+KFNXBBM5t+WmzGmIjcZSPHcr0MwaOoc3Kdf6lcVul4GsUR?=
 =?us-ascii?Q?1lZ6EffxGMz2IahMaZyjy3YG8OO1BWSQLqO0Apvws7XXcfZuoG9iNn+h7pIi?=
 =?us-ascii?Q?v5yEoWpBUNFbbBSoHVnTOU8QCinPIupiL2NPb+0qCnOairIFtUMzMOVfHKkU?=
 =?us-ascii?Q?5QElbnnA901qY6FUvuPXkb3BfqDeop6TtwZmNOLqAqbvCkkjXmN5ac5E2iyK?=
 =?us-ascii?Q?EJakwlXcfzuJek4s4MRN7hLGkL8QAaTWGZcT5zONw0S0g4qR8kdDe8x/X1uv?=
 =?us-ascii?Q?QyRREmXJMRqhFir6TCb7YNrxkXKG+4senD3WH5KMaPQ95gCuVD1Sxa7LHlfS?=
 =?us-ascii?Q?LysKIqKZZQNlLzcX1mw7iaITIBO6BAzD3IFY06Wmt7vUdR43Eqb8NZDnIMRU?=
 =?us-ascii?Q?HaMoSS/bU/Gfk1nJ0AR9nlh+eoKjeqtuKXWnjtUJbK07E5mVEcTUzbLczdRc?=
 =?us-ascii?Q?52ByCVQn1QTQQku+bV1PT96h1hXaJkJTaWOMW3ydUbBsftXC3kZTuD5XRUAG?=
 =?us-ascii?Q?DfYycw5/rk6dWqUyhG/otwsV4gM1VMRXafe39QTdqzUXxCl+1V6TnrJoWFYA?=
 =?us-ascii?Q?Oaytt8Ta9AKoPtx37got+v86iwUY9083F851cX/kQ13s13c4IKpKHKzzN2fo?=
 =?us-ascii?Q?Pvguh0UrrE5Ah/GjSLy5P/wqU2tvnI9Cz1S0Byk60KBlOzWR82JWpM1aJGfN?=
 =?us-ascii?Q?bfxrAOJ6+v/HRef9WNmFHon1raGF3zidv5BcTr5QgqBG/LppW46yKpnP4EdC?=
 =?us-ascii?Q?guVlAfIuLtJZ1c1IbYNxBWrvWJidi0TMEs3adyGpAiVUPswgp7peAsciuN4l?=
 =?us-ascii?Q?f1S3vn25LsM1FFe+groSaQzb0xLCpULZxfKr1bG63HkR4SZ5lK8/qbAKdfrm?=
 =?us-ascii?Q?pN/yhyYTjV1NUrUI2h9CnPg6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5a66a4-26a0-4694-0355-08d8df8d1ac3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:14:00.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMdZed4avGyDF4dUGFOmJekU663osUzu5AyKMBiSXhTiwnQ+T9J13ctfrqbCUWKV//L4VrE6SRsA6cOwfk/K/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB3709
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch converts the legacy text-based binding document to YAML
format. Extraneous details and touchscreen properties that weren't
actually supported have been dropped.

The reset GPIO has since been made optional in the driver; this is
now reflected here as well.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../bindings/input/touchscreen/iqs5xx.txt     | 80 -------------------
 .../bindings/input/touchscreen/iqs5xx.yaml    | 75 +++++++++++++++++
 2 files changed, 75 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.yaml

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
diff --git a/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.yaml
new file mode 100644
index 000000000000..5d802f153a28
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/iqs5xx.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/iqs5xx.yaml#
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
-- 
2.17.1

