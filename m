Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFBF25A8DE
	for <lists+linux-input@lfdr.de>; Wed,  2 Sep 2020 11:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgIBJsQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Sep 2020 05:48:16 -0400
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:56929
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726323AbgIBJsL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Sep 2020 05:48:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7SfRaMcWl/KgFsD/XGNdwP+Lp4reM8PPa9n0oX4zAVbIJ74YASa7hWd37GUQMp0CRqKYM9h3bA6u89vKdg5lAB/WNhQdeCC0hUuawvlORoclI0dUZxq2Od179D3INLDyKrbvmHu+MkXpIwaz9J6wJn4B31OQDDP6rkhJrUt8DLsLKyy6pvR1t2heFG22G9OE76IpTeez6tVASO8aEZNfaIiOw4css7ee3slE5C77+1wGcms8Bq/hkAngxepbWnwSazWBV9PVb6KZVc2Ou+8KGa4nwHPH0dSDSNtrY8IvhJwpF6HqKgST9wgJ+5vRp/9hoC4CyXjBQzKPgsHtRO4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdE1x8BM7XNoSSlsO+7fVaolO1TVM6KIX4nD4XzXAao=;
 b=KrX0jNT1O/MdrgZWTEWByi891D9hUayuF774PeZXreyYBXN21HpAADAPkZNMp5ROTf3odNeS2TVuURtuuUOgJrX+UZYhXRHZCm2w4Xx/wJwbOW4brwg/pDLEvDTpTzN2RWhc6fwKjLyS20nJ/nxbbJLgB6jjAbQiahwQHOb+6Fb1F9wWRRnkFkm/YuVQZo3QYDQj7IVVq69bjdAbKljFIlpnbqvL7TjLQh8MTqsfwPAespFMjOzAMOr/L/TNsOdfvLRbafg9ys90dP9mlVif0aGLtC2o1IIvo3HXz++xSB31LjZHpDhwWlUkZfV7AeUvkizYHf3NDeCNR8NRlKrBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdE1x8BM7XNoSSlsO+7fVaolO1TVM6KIX4nD4XzXAao=;
 b=fblEsAllVwY2ouV6vO0FL+g3FiLjIFqmfuHhB/2kojiz5OnAsHneWx9sRxdPpsfYUMj+f1Ku9L1mTtIk8VwnazgdOXBm8oaOO39C0PN7oHEZlko1cmklJg0bmi8OoB8USSIb2IEFt6zaTs/EGdAPWs9BRPtXJlNSqt0rHQ5q8VA=
Received: from AM5PR0701CA0020.eurprd07.prod.outlook.com
 (2603:10a6:203:51::30) by AM5PR10MB1587.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:1d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 09:48:07 +0000
Received: from HE1EUR02FT004.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::8d) by AM5PR0701CA0020.outlook.office365.com
 (2603:10a6:203:51::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7 via Frontend
 Transport; Wed, 2 Sep 2020 09:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT004.mail.protection.outlook.com (10.152.10.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 09:48:06 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 2 Sep 2020 11:47:58 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 45A4813F673; Wed,  2 Sep 2020 18:47:56 +0900 (KST)
Message-ID: <865e9e36d44f591d534fb55c86c7146b9cb120cf.1599022115.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1599022115.git.Roy.Im@diasemi.com>
References: <cover.1599022115.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 2 Sep 2020 13:48:35 +0900
Subject: [RESEND PATCH v19 2/3] dt-bindings: input: Add document bindings for
 DA7280
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41b58e00-bd16-4201-5219-08d84f254b5f
X-MS-TrafficTypeDiagnostic: AM5PR10MB1587:
X-Microsoft-Antispam-PRVS: <AM5PR10MB1587B1637317EA9C514F981DA22F0@AM5PR10MB1587.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1csvjlHn9gRUHJddAkvxRPTbbQaawGDFedx58f/VegxbQRgNdUMBGvvs1xxo074939ua4A4jE9G6oD+9mYgHMVbVX5t/z0UBXknK270x2h4w+eH7klqvJDCcwQ25NOHv0XrEVHtEiY74rHzwt1wAF24JghBjDoPcvhswIHqp/Dpuj5LWPO4Pha6Bpeskd7dMS2femTJ5oarPQbEiZomn9/O1Pbyd8dFDGBrXWMt8owqo1n0JXczXDeFhcfKxj0s20RN+/54NDQOwCajLKoHTtFTJjHNAl1fplEcN5d+VSgM9yMZAjxdHCcLMNo5zC6CbuU+NNQH18ArM122vEFWaCeZ7ptbDE11OavyZyH4sYKyjfrZ53bW0lqYxiAw3qEyCe81IWST39i2NaeJvjSxGziF+IsTKaLBDHlKFcPIrlLy2HpxJcI1XsCXdtCXfXdS
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966005)(81166007)(54906003)(83380400001)(47076004)(6666004)(36756003)(5660300002)(36906005)(70206006)(70586007)(186003)(426003)(2616005)(86362001)(110136005)(8936002)(4326008)(6266002)(33310700002)(336012)(2906002)(498600001)(82310400003)(356005)(8676002)(26005)(42186006);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 09:48:06.6998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b58e00-bd16-4201-5219-08d84f254b5f
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT004.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB1587
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
v19: No changes.
v18: No changes.
v17: No changes.
v16: No changes.
v15: No changes.
v14: No changes.
v13: No changes.
v12: No changes.
v11: No changes.
v10: No changes.
v9: No changes.
v8: Updated descriptions for new properties.
v7: No changes.
v6: No changes.
v5: Updated descriptions and fixed errors.
v4: Fixed commit message, properties.
v3: Fixed subject format.
v2: No changes


 .../devicetree/bindings/input/dlg,da7280.txt       | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt

diff --git a/Documentation/devicetree/bindings/input/dlg,da7280.txt b/Documentation/devicetree/bindings/input/dlg,da7280.txt
new file mode 100644
index 0000000..e6b719d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/dlg,da7280.txt
@@ -0,0 +1,109 @@
+Dialog Semiconductor DA7280 Haptics bindings
+
+Required properties:
+- compatible: Should be "dlg,da7280".
+- reg: Specifies the I2C slave address.
+
+- interrupt-parent : Specifies the phandle of the interrupt controller to
+  which the IRQs from DA7280 are delivered to.
+
+- dlg,actuator-type: Set Actuator type. it should be one of:
+  "LRA" - Linear Resonance Actuator type.
+  "ERM-bar" - Bar type Eccentric Rotating Mass.
+  "ERM-coin" - Coin type Eccentric Rotating Mass.
+
+- dlg,const-op-mode: Haptic operation mode for FF_CONSTANT.
+  Possible values:
+	1 - Direct register override(DRO) mode triggered by i2c(default),
+	2 - PWM data source mode controlled by PWM duty,
+- dlg,periodic-op-mode: Haptic operation mode for FF_PERIODIC.
+  Possible values:
+	1 - Register triggered waveform memory(RTWM) mode, the pattern
+	    assigned to the PS_SEQ_ID played as much times as PS_SEQ_LOOP,
+	2 - Edge triggered waveform memory(ETWM) mode, external GPI(N)
+	    control are required to enable/disable and it needs to keep
+	    device enabled by sending magnitude (X > 0),
+	    the pattern is assigned to the GPI(N)_SEQUENCE_ID below.
+	The default value is 1 for both of the operation modes.
+	For more details, please see the datasheet.
+
+- dlg,nom-microvolt: Nominal actuator voltage rating.
+  Valid values: 0 - 6000000.
+- dlg,abs-max-microvolt: Absolute actuator maximum voltage rating.
+  Valid values: 0 - 6000000.
+- dlg,imax-microamp: Actuator max current rating.
+  Valid values: 0 - 252000.
+  Default: 130000.
+- dlg,impd-micro-ohms: the impedance of the actuator in micro ohms.
+  Valid values: 0 - 1500000000.
+
+Optional properties:
+- pwms : phandle to the physical PWM(Pulse Width Modulation) device.
+  PWM properties should be named "pwms". And number of cell is different
+  for each pwm device.
+  (See Documentation/devicetree/bindings/pwm/pwm.txt
+   for further information relating to pwm properties)
+
+- dlg,ps-seq-id: the PS_SEQ_ID(pattern ID in waveform memory inside chip)
+  to play back when RTWM-MODE is enabled.
+  Valid range: 0 - 15.
+- dlg,ps-seq-loop: the PS_SEQ_LOOP, Number of times the pre-stored sequence
+  pointed to by PS_SEQ_ID or GPI(N)_SEQUENCE_ID is repeated.
+  Valid range: 0 - 15.
+- dlg,gpiN-seq-id: the GPI(N)_SEQUENCE_ID, pattern to play
+  when gpi0 is triggered, 'N' must be 0 - 2.
+  Valid range: 0 - 15.
+- dlg,gpiN-mode: the pattern mode which can select either
+  "Single-pattern" or "Multi-pattern", 'N' must be 0 - 2.
+- dlg,gpiN-polarity: gpiN polarity which can be chosen among
+  "Rising-edge", "Falling-edge" and "Both-edge",
+  'N' must be 0 - 2
+  Haptic will work by this edge option in case of ETWM mode.
+
+- dlg,resonant-freq-hz: use in case of LRA.
+  the frequency range: 50 - 300.
+  Default: 205.
+
+- dlg,bemf-sens-enable: Enable for internal loop computations.
+- dlg,freq-track-enable: Enable for resonant frequency tracking.
+- dlg,acc-enable: Enable for active acceleration.
+- dlg,rapid-stop-enable: Enable for rapid stop.
+- dlg,amp-pid-enable: Enable for the amplitude PID.
+- dlg,mem-array: Customized waveform memory(patterns) data downloaded to
+  the device during initialization. This is an array of 100 values(u8).
+
+For further information, see device datasheet.
+
+======
+
+Example:
+
+	haptics: da7280-haptics@4a {
+		compatible = "dlg,da7280";
+		reg = <0x4a>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		dlg,actuator-type = "LRA";
+		dlg,dlg,const-op-mode = <1>;
+		dlg,dlg,periodic-op-mode = <1>;
+		dlg,nom-microvolt = <2000000>;
+		dlg,abs-max-microvolt = <2000000>;
+		dlg,imax-microamp = <170000>;
+		dlg,resonant-freq-hz = <180>;
+		dlg,impd-micro-ohms = <10500000>;
+		dlg,freq-track-enable;
+		dlg,rapid-stop-enable;
+		dlg,mem-array = <
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+ 		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+		>;
+
+	};
-- 
end-of-patch for RESEND PATCH v19

