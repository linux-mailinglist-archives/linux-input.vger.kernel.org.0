Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CCC28CA19
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 10:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391392AbgJMIVR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 04:21:17 -0400
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:54688
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391338AbgJMIVP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 04:21:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNmJA9+2uL15N+eIIQux3wuYXECrsQiMMKStAw444FsPrF8RjidkeiB3qYK4RhPmmT0jh+zPknuVIrpEGbUXt5tsvhtPokJANFkZIRI1pd7eiZVNUYU2L+r7lZ1ZhKrL9nkw6jLyOAVSNGNqiX7ER0YgrQEfrMmU/LC3+rTz+LXfsfHJh+Uz2mVs/DzCWPXeqkn9ATE66FH35ExczgidZ29EyjlxCYY/g/JvMQlm6ElGhyEugAhVW5Qh04Z5cVtKJgmF2fyuQWry3PtYS2bDYotOdUwA+UD0Jw6HUCuO4GLrdql9f4gw8i1aiko0OdAA9Ujz0b2GTTEoLUMxavNEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlDjeBzSz1S4o356F60vA+dQ9mVIaNIxDz+nHJW0Cc=;
 b=SD8qFiuNxFa78pjH2pXVPJuFmomGAI5YpGETYDWGV7fRWnV99uR8N7UkVjUSVkdI2N1QinGMkw16gEr9SQS6CZ3wajXT+IGeXuS9W2I1nnwO2LQ5ZLRX9EpCnZhmYELTqe7fxHBklW0vGyNI8Wjs/t3SSkZZMVgzGxSyIYheYBv1K8pLNk0iECTpJ6595X5OgFrZ2++IRDrXy1KQSf6rvD95IzeFqkvl0VovrGEsQrFSkTxgYhTVYN+/LWTxDmcR2l70gRu75+gVP1N7MGl/+piTPN4acu05ew8aHjyN/sDVZ6N5HfxYJPM0aLlXWJFlJU6jERCE1SMKjvKyXB5g3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlDjeBzSz1S4o356F60vA+dQ9mVIaNIxDz+nHJW0Cc=;
 b=K4NaLm+CshFXIXZFHRBqheJ7O6G9pzm93KoFI8kmdOO5bcx6s5ABIxL2/rwr9TGJ6T8IF22K7jrj/CChe6C8rRhLBsG6TfOHD8lPZPdgLLMYEpDO65kEfr3gmqceS7Mo6TnV53KhVXHK07GYwSSQ2Su3EI36TTfbeb9tgqACFNI=
Received: from AM7PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:20b:130::37)
 by HE1PR1001MB1370.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Tue, 13 Oct
 2020 08:21:10 +0000
Received: from HE1EUR02FT012.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::b2) by AM7PR03CA0027.outlook.office365.com
 (2603:10a6:20b:130::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Tue, 13 Oct 2020 08:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT012.mail.protection.outlook.com (10.152.10.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 08:21:09 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 13 Oct 2020 10:21:03 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 DDD1A13F673; Tue, 13 Oct 2020 17:21:01 +0900 (KST)
Message-ID: <162dee5096f78599441177c6bea7e616b3aeb491.1602570380.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1602570380.git.Roy.Im@diasemi.com>
References: <cover.1602570380.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 13 Oct 2020 15:26:19 +0900
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
X-MS-Office365-Filtering-Correlation-Id: 5ee1e2e8-5af5-4d2b-91bb-08d86f50f08c
X-MS-TrafficTypeDiagnostic: HE1PR1001MB1370:
X-Microsoft-Antispam-PRVS: <HE1PR1001MB1370A048693A283607990E6FA2040@HE1PR1001MB1370.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+3PMLHqjg/QiAUTR0RtK+/vnp30R0TvsfemSMClpz977Ym/F2jtwcHVCs1SRn4GkbbBpvg5XFDXoLFJRXeo6BrNoq6+HhhUePHQTESvoNdoDRsJG8fg7/M2afd9cWi/oWnqdKtg9oF5Q/JQzsAmY8NQcDwRsIo+dZQ0OrIHoukZOE9UIv7bjxe4tfP1yy40XNhsOzlJxb0/CLKWh9MAY7KN1ratRaLLAB8l+JNeR8hopESEk6f+1KVaO+3yKRqtsU9eoCNPALND67F0VYVW2wXmeJle5jCAX+3pOJqw+9tpNJfjocLAZASiT6PFuM+THc3u3/IrnlTr1KsMXL+EO4dgdF5iv4dQ6OdJSlT6cj8gTVNqmoG4eoLYNquy4hEwwzWpgTulKCxC/NmYshBD30d654DTJfg8ry0rG7LhOLUuTSg3ggLjtDcJEdONoU6q
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39850400004)(346002)(46966005)(356005)(33310700002)(110136005)(81166007)(54906003)(36756003)(47076004)(82740400003)(2906002)(4326008)(2616005)(426003)(8676002)(186003)(478600001)(70206006)(36906005)(42186006)(70586007)(82310400003)(336012)(6266002)(316002)(8936002)(6666004)(5660300002)(83380400001)(86362001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 08:21:09.6066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee1e2e8-5af5-4d2b-91bb-08d86f50f08c
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT012.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1370
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

