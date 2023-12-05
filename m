Return-Path: <linux-input+bounces-493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A6804FCC
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 11:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501881C20DBC
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 10:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C724CDE4;
	Tue,  5 Dec 2023 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="retMgNtL"
X-Original-To: linux-input@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2073.outbound.protection.outlook.com [40.92.52.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381DAAA;
	Tue,  5 Dec 2023 02:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3SgM+tuqfTHbFrlGjOh/ZLaZIpW70bB7tspBjEAu0XLj/O4IEJFdPFmeKW6eztaUsbvsUuxJzwA0OfZZiDyTNEDV2oJKCQqaU4msuIq6QXHQRrQyDGwesGQT3mAofrgcw+ZZNn+zDAEPNHsfI7zIB7zFSAFTJ/2a6fVQGK97CYxE1LhNtbnPG4AbFVDKxKJBjbXsjLXdBGXnbWZ9rx6n8PrcjFClLTYXUAABIm2epftyCaks1KF5ond4IeIijIbXHZIhqZHwzsV9DZGmAKf6D8qIB8iVeKHakGEnu6UYv8Cahwz1MMcT9Il/oAuf0TlZrSby2FrQUxEMe1BnBMnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riIxlArENCoaMNr3b1AfCgrNHkczW4liCzMBXP1+Qe0=;
 b=ZsasmH3jxvQ1/WkJxGPh3yk6ubx6OFfvXZ0ilcN7nVzL3wpjAp6S/yoa6wcRIqnGOCkuf0Mi/UEK12JRyVpRHvKEuzqVl73TrcxjRDtwnfz7OSlDVq56g7JcNR3X7QluGAF1nXKD1gxX7LBWRDXGUZc15sR3xjYPthr7NviypAS4Pg8g9FwoswBCGQbn58ed1ZsIkxKqKAOBbyTXm4KFRkEEnp8PqOl4y9jj+qrY+zOqCxdEk9BvlJAzb9Ua7QJmeMpQbizoMMqoiVqLzMkI7u5W4/tZQMwc9niBl68wFLqpQ5qx8acEYkv98Fa9y9NcBnM6KhrHdfFh53TFxaWpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riIxlArENCoaMNr3b1AfCgrNHkczW4liCzMBXP1+Qe0=;
 b=retMgNtLGDuaf8ijGGGdc9QMttktRW0rUBTpn6IkccHHJP2SPdiPpFRXbpxGkQOdoImSnNiqALHzQyNX9larPDTKXJojpw5iVg/3a53mgBP1bWSngJzHLK3sSuf/OTKfJ02DG1xtlqEkX/oocrZ9qM/7U2gF2N8DdCYzFfjjvRqvbtzX/R4BTYORSDl/8j/wK/nzIZ+5GL6xqqJd/JdDgUKNHlTxZ9+WPAG7Lbz9DRTH9bsuccrjCVwHNrvHeXSVtqgaslLXOmlIgPAF8I66slMHKx32AJeFP7tcUHYHAhrHjKlkbOi1FY6GG1Z48zS95kPPhyfKmIRf8dxcdDAAaQ==
Received: from TY0PR06MB5611.apcprd06.prod.outlook.com (2603:1096:400:31e::8)
 by SEYPR06MB6587.apcprd06.prod.outlook.com (2603:1096:101:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 10:06:08 +0000
Received: from TY0PR06MB5611.apcprd06.prod.outlook.com
 ([fe80::f2fd:d852:e4b9:6166]) by TY0PR06MB5611.apcprd06.prod.outlook.com
 ([fe80::f2fd:d852:e4b9:6166%5]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 10:06:08 +0000
From: Allen_Lin <allencl_lin@hotmail.com>
To: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Allen_Lin <allencl_lin@hotmail.com>
Subject: [PATCH v1 1/2] dt-bindings: input: Add Himax HX83102J touchscreen
Date: Tue,  5 Dec 2023 18:05:51 +0800
Message-ID:
 <TY0PR06MB56116A355D2A5BF665FA0D899E85A@TY0PR06MB5611.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205100552.723620-1-allencl_lin@hotmail.com>
References: <20231205100552.723620-1-allencl_lin@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:
 [g6r3mvwCZOA4Zd3NPDxmno0UK5FMhAkbeiqq0jOMPfXLCEGlYFSqRTBKjnF5fjU77hr973at+00=]
X-ClientProxiedBy: TYCPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:4::18) To TY0PR06MB5611.apcprd06.prod.outlook.com
 (2603:1096:400:31e::8)
X-Microsoft-Original-Message-ID:
 <20231205100552.723620-2-allencl_lin@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5611:EE_|SEYPR06MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ddeb01-8180-4c94-6499-08dbf579ccb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IAnPH1QQUgAtK/akQ9/AFV2ibUFqIt0xHIopRi6aKZB9JIUtKRzR0LZkme8k3KGglyujU2TquPAqvImbokwSehcLZm8oaDP/7cupMq3kIzE1YmGwRzjp01SrCKTDKRcwqtQQpbma7JeQNs7DUoo8ZlLEBRyjGcs9vMJrO3e7xTTEishazGcA1LSh1ENjmYDkmzwGCDqVPp2o4Lj8QgFRTA4fVF74Sjcrj8IymRBWV+VEBPR0y7bvL5mFgv/96CVeHRf9UOmsFHVzKRmdKbZjb0xT5gqCbiP2iqMESo1Xy+eybGu07jrNixbw0Ckei2GFAaLxB6qQlyOgi4tLrN6eGqnULmWpi7J4FXUJJEG6xcqt7FsO6EDSrWzHt8huX7lmMR6nYAtmEYO+mCqrET6vcUXYqujgEgX6MZ40WfKK+7F8U+P93y4kbWjXOTw85bs1/1d2S90aZbtiRNQMf2mDEQYLwVW1ThGBTzLzXt6tolka3/Zdesyc2tHV6ncTOB5o4Pc0pSg5RGod5gFZOaXDoRRJ2HC7qw8eNZDOoWpfPzRZXLT2rR0BmWGE6URPhgwbGe+6YzKNC+ZB4+woX6/s3Bpk0uQhWRKvmoj5AgkBIXEYkmiueCJ5U6OMlD+Gg3jm
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8a95NfBTAm4Acmj5uKOHnN/+jEOKS031Ly/WOsrC9bsGE+z7IXmvFNbVc5vD?=
 =?us-ascii?Q?NIZFC1nBo7uxK8/tAszBKwajyTQs0lm+VmK3tu7R+HQQtsrP72Cx3tV2Kno3?=
 =?us-ascii?Q?P7xLJypPGZQfv9flRP1VsZUcRj3wDE7IYbhLTIa9n3r2hEV6H0dRHQtvXS5U?=
 =?us-ascii?Q?9WsjNxKe6+S0OSOwcQTvPnHJVEcvszUW6MTEHMYTSNU+IMZNUtuNekLfSjU/?=
 =?us-ascii?Q?JleXN0AQp1UY4Tk+2Jh7xDeva/gRrN00b54kBVvvrY5rgOMV51Dwk9tm/om6?=
 =?us-ascii?Q?FyXiI2fWpXwXjvuyt+QApoKNAClr6nn5lCFWpVrO3txBA2DEod8UwJuD9qpw?=
 =?us-ascii?Q?5Zn0kZFm9ea0GB77EqSx2cFROcztuKxAQ684oXsAIcVeKE8tlycUc/zZ6T7P?=
 =?us-ascii?Q?eiivozVjkUlmN3uHIEgFhB2KTTQXFeqZCCjyUTqDGF33om8SMR1FXaYS0JKy?=
 =?us-ascii?Q?U3umier6fpu10N4Sx4K7bwGg9ahlbWd00BW46qhn6H5fhk6qMkXJdfrDdBfX?=
 =?us-ascii?Q?9RmjuHMf7FSdWHvnLsqQHi3OpzLGHV6Mb9Sv/ByHwQOge3JLXfRGOi82GtGL?=
 =?us-ascii?Q?bjiJ1YC8UFF0hDGs3TfRYjwWvsC2fohtq3QSdZWsXfa5L7/1OFQQkT5fKGen?=
 =?us-ascii?Q?L4AHCnZcXzGTB8fXkXrlET8aVoPR6BHOWMlHQ6j/6gcg9bnL/5Kz/XQywQyZ?=
 =?us-ascii?Q?/tCHpkodz67XKNTPBs7n0o8Fk48OsMFXO3g63Yk/M00X3LKA7o0vmdmeJiaS?=
 =?us-ascii?Q?CIpEgWkQWMEQcNVW9qs4d16xIkt3lCJmFFuJiXEizq7pn3ulTUaqqtFVr9IJ?=
 =?us-ascii?Q?EQ+RLXtLLt8aAehSzH2PjxxvwXjsSf7Pt8Nin+ak1ehz+7+a5VJJyPigYfeJ?=
 =?us-ascii?Q?kJUs5l9371LOex67T4/AdFh48o1UrTPwpGGA4NDdwOAfzrehACuONGlL9GX4?=
 =?us-ascii?Q?6g2vaeI7B8C1rZ++MCNMnscYhI/2jwllyf66BJxk7PUBm++5D6qbPr2c0XSU?=
 =?us-ascii?Q?LlDsNSaajbJOULn11P6IijZ9fLA9BbXSQRNueDrcJhG1hbl6yVxGTmMOACs5?=
 =?us-ascii?Q?oKacm8miJudkFaz1IjGnafsnwWZyChbl0nrW8KsjWtVpoLC0Hzhul2X12o/E?=
 =?us-ascii?Q?ISetX29qwPX/BC9kq67qI0sItp/6GkMAbS6pCI4YdVWEVCvwQx7mrHTE+I9F?=
 =?us-ascii?Q?fT4JO7dWdzmxciA4sgvTMjnN9g5Aq94w6J7MrVt7Xbsf2bRbfNkOvafib3l1?=
 =?us-ascii?Q?doJGzYgOvubYzz4Ao0Z03p8gUYGtTSDcVDfRcOM3JVLdJ4Rf+LlD/NzxELQB?=
 =?us-ascii?Q?F4w=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ddeb01-8180-4c94-6499-08dbf579ccb0
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5611.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 10:06:07.9858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6587

Add the HX83102j touchscreen device tree bindings documents.

Signed-off-by: Allen_Lin <allencl_lin@hotmail.com>
---
 .../bindings/input/himax,hx8310xx.yaml        | 70 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/himax,hx8310xx.yaml

diff --git a/Documentation/devicetree/bindings/input/himax,hx8310xx.yaml b/Documentation/devicetree/bindings/input/himax,hx8310xx.yaml
new file mode 100644
index 000000000000..1cc65e9bd267
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/himax,hx8310xx.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/himax,hx8310xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: himax hx8310xx touchscreen
+
+maintainers:
+  - Allen Lin <allencl_lin@hotmail.com>
+
+description:
+  Supports the himax hx8310xx touchscreen.
+  This touchscreen uses the spi-hid protocol but has some non-standard
+  power sequencing required.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - himax,hx83102j
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
+  spi-cpha: true
+
+  spi-cpol: true
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hid_himax_spi@0 {
+        pinctrl-names = "default";
+        pinctrl-0 = <&touch_int0 &touch_reset>;
+        reg = <0>;
+        spi-max-frequency = <12500000>;
+        status = "okay";
+        compatible = "himax,hx83102j";
+        reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+        spi-cpha;
+        spi-cpol;
+        interrupt-parent = <&gpio1>;
+        interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 012df8ccf34e..cadcbf7294a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9502,6 +9502,12 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
 
+HIMAX HID HX83102J TOUCHSCREEN
+M:	Allen Lin <allencl_lin@hotmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/himax,hx8310xx.yaml
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org
-- 
2.34.1


