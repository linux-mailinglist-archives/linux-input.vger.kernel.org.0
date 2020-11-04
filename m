Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0A72A5D54
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 05:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgKDEWU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 23:22:20 -0500
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:23124
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbgKDEWT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 23:22:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQ+r7gWOrzerYob5hyWspWyJGt1hYfg03ygz0+kNjPLc8RQlcJHFwQau725bFA/OYYF4qA3pEecbyTsBZO/GJzercJrcAJlL+j4skxqDKlMKEyuMjSQaBgR9qzPtwKyV8pG+Wn+O1sq+VlC+Li2cL/4TgCb5LWUAYi75qrWkQB5KrguZpYX4KnkZm0L93yvtTFIeLSSFRIsNtZPxlpWk7vWwTkZwuqTsJkCLd3I7aQoSSCA7HfotXxe7WNYoVlGgg6E4DwE3nzAHq5E70KSHNfp7A8eChfdL6c1u0TEnyEPLFeo0tucfuLhkb8JH8u9C46OdTyVjhHdi1+dxpm7urg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlDjeBzSz1S4o356F60vA+dQ9mVIaNIxDz+nHJW0Cc=;
 b=NDFKOGEM0eoTTBcNVLPuXawwHcXnoNDgSGDB0IIflkuhM8CZJMCiGFzhqWEhcDQga6pOTF2tz+jc/PS73wz6ZNtaYKFaGwCMHa6KpEBJyzo3u/wymdAn6oqOUNPAAxjE5tG68J3YWKZZ5k8CtlVd569OSYKgZDQrWTo/rqzIeGy3dx2LG/hJVUv2abfnbI6PFGT0Y7bOcP9cpIwkEjb1mDX1Dow4vz/3R/9GQ6pD2wS2kNoV+6MzbpjKKygh82qfk8PPhIv8WgmKfqDI6OTJwGT21DPpiXaYEZyn2Nci/qpNKY+LjFZU2zY4Aa5fkea4EEAd35Vt6JbRnECh8Gkrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlDjeBzSz1S4o356F60vA+dQ9mVIaNIxDz+nHJW0Cc=;
 b=gModfOOeWKtO4DSGxuy7mrvuFehWBLy4Y5Ni7xl4VekTrxXwiNJ7O/x0a7uQY9UppR8hEju/05tM3X/PJ8JwChRLqo9/UcBvnOgu0u3ioAB6FGkcPcFDGc7jGlx9vlIkxti7g06+35B9NBUC70JnUZBFQ0HozEpkc5VP7JKge0s=
Received: from AM5PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:206:1::27)
 by PR3PR10MB4222.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 04:22:13 +0000
Received: from HE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::ad) by AM5PR04CA0014.outlook.office365.com
 (2603:10a6:206:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 04:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT057.mail.protection.outlook.com (10.152.11.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 04:22:10 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 4 Nov 2020 05:22:02 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 61B8E13F673; Wed,  4 Nov 2020 13:22:01 +0900 (KST)
Message-ID: <024e9b731cc0202e74e34e7313e05534a5cb01c7.1604451966.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1604451966.git.Roy.Im@diasemi.com>
References: <cover.1604451966.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 4 Nov 2020 10:06:06 +0900
Subject: [RESEND PATCH v20 2/3] dt-bindings: input: Add document bindings for
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
X-MS-Office365-Filtering-Correlation-Id: 741bed13-5b1a-4510-ef40-08d880793341
X-MS-TrafficTypeDiagnostic: PR3PR10MB4222:
X-Microsoft-Antispam-PRVS: <PR3PR10MB4222D362565E47FA38F6FD2DA2EF0@PR3PR10MB4222.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqjr1dYP21dMG30Zhlvye7LaZDYUl2tv5grMW7Aqcg08qn9+kikZ14VKDIwedCwUfD/0OFV/Nua2E9CWwV27skZrjEalDOj+SRw/8BCBqWYNJlwW4gCMU9qpXfOjzLmzWz4ceNpufOjsfj8HkeMbuwbZ7dAQp8SHYV62TbT15WA9iW8eo7IPx9FVYz4oY1FaRSl4MXoilVS+QQAujn5gRjq/l02vB81Im6lJU90skGs4ZyX2ol0YueZMbS/3CXtPV8zP/5aqa2nenGVocuXV79ybs00hhuiHSB91GWrheQXmSRoODz+sFMxI4mOb6Pnp7vHDIqlpIVZv0JxczsjSn850RuwD1F0bHuYcbeiJmxBLU0i/u0Oo0eqh0//fBAanNa0NuuAbIuKiQBcOVimkWtCmJwaG4VkVsyYGaeDdXgsTx3by7TTSUQ5V/Xoxmq3H
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(46966005)(2616005)(426003)(186003)(478600001)(110136005)(336012)(316002)(42186006)(26005)(36906005)(54906003)(6266002)(36756003)(2906002)(4326008)(83380400001)(82740400003)(47076004)(82310400003)(81166007)(70586007)(33310700002)(356005)(70206006)(8936002)(8676002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 04:22:10.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 741bed13-5b1a-4510-ef40-08d880793341
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4222
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
v20: No changes.
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
end-of-patch for RESEND PATCH v20

