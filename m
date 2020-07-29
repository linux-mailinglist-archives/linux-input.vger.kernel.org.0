Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEC423180D
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 05:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgG2D0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jul 2020 23:26:35 -0400
Received: from mail-eopbgr70058.outbound.protection.outlook.com ([40.107.7.58]:9203
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726047AbgG2D0e (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jul 2020 23:26:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ01NbfJZLkZSL0lcGfc6gWIaKaCfGzuRYPcXci/bUYU0AXSflCMQfqfaTMY5QoLToWiO6pQ/fMgeGuAVgSFk0zecxJ9qPxPwHAp0bge+my4OdzvihspHtwg2Gn5OQIbno9W8CIE6fWxWdlMUWxwfWkBynB+dLZ/qDixsqKzXTeoyFXPgluBtvs+GOCvLpwZiNy4cAw7XivEogLffZi4bAiM1Mhvg5waeWKccZ3S1c0G0qCDNjK+w2FQCj+MRwT9U8NCN13BuW7s2oiI7cH7RFQ0vPUFnvCgS4yqYbb2vsBWuzLD18G1pPNYxmytPwVCeAxXvReAh97PVtqLJbnozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6prKVQceWMiMAnsba9s8b2BXjcUiwD8lSsLi4HDrx4=;
 b=l181Ydh20wvL0lcpR/BIV62z5wGhPPgP3qVbJ51K/z8r8gFSkPg4o07fpXBMMLT8Wu7gzTeJr0rr0796jkNDZY6SgnbGXzJA6/cK3zQtmR3nSrg0bH3wVFhaCYEQdS1iG44WMnrWuqSw4U10HdUD7GU1q9BgNbm84W1bOdxq/GpXAMsycd+eCh9NHLRnBrRWZoXt+B6ExPCbcwAv/ZREx2W4WHAQ0CwEikkDXJ13JRen8fp4SIq4TSoTTu+vNSczjXTZzWaYPuwE3TkkYnW8bTCqqlz1qtHRcPX2MpnF4HqiN5NoDc40FYmEAcNVM4gE4gsa/emN9OOxtBdKs1yg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=neutral (sender ip is
 193.240.111.57) smtp.rcpttodomain=arm.com smtp.mailfrom=diasemi.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6prKVQceWMiMAnsba9s8b2BXjcUiwD8lSsLi4HDrx4=;
 b=RBZe9EIrqzZJS3Y4NzlnZOmT473D6CReYATKE/WhJAZtnii7/ih243lWWWtCOAK2r1pDUMDG9EX9PPJvZBuD81KKr3VCBUf4TIbAwR9UMSjJjh12xKa8PQrPpZSWScRGR0ELs0/0rZYET8RZR91rwhoVq16GfPgsqly9ibJJhUI=
Received: from AM6PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:6e::33)
 by DB8PR10MB3308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Wed, 29 Jul
 2020 03:26:28 +0000
Received: from AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::2e) by AM6PR02CA0020.outlook.office365.com
 (2603:10a6:20b:6e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Wed, 29 Jul 2020 03:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=neutral (sender IP is
 193.240.111.57) smtp.mailfrom=diasemi.com; arm.com; dkim=none (message not
 signed) header.d=none;arm.com; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: Neutral (protection.outlook.com: 193.240.111.57 is neither
 permitted nor denied by domain of diasemi.com)
Received: from mailrelay1.diasemi.com (193.240.111.57) by
 AM5EUR02FT028.mail.protection.outlook.com (10.152.8.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 03:26:28 +0000
Received: from NB-EX-CASHUB01.diasemi.com (10.1.16.141) by
 DB-EX-CASHUB02.diasemi.com (10.0.16.142) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 29 Jul 2020 05:26:28 +0200
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 29 Jul 2020 05:26:27 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 B476A13F673; Wed, 29 Jul 2020 12:26:25 +0900 (KST)
Message-ID: <1ae033bd7906a0076121b41aa5bb67436390c4bf.1595991580.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1595991580.git.Roy.Im@diasemi.com>
References: <cover.1595991580.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 29 Jul 2020 11:59:40 +0900
Subject: [PATCH v18 2/3] dt-bindings: input: Add document bindings for DA7280
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
X-MS-Office365-Filtering-Correlation-Id: 257ae90a-4df1-4ddd-3f64-08d8336f2e80
X-MS-TrafficTypeDiagnostic: DB8PR10MB3308:
X-Microsoft-Antispam-PRVS: <DB8PR10MB3308F9B8806F68D2067D3A17A2700@DB8PR10MB3308.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60m72fznwZy3diIfZgPVWT54+ZV6QbXPC7bXtkOMIt4DCQVLdlKuonydG9zLazcf7Og8xMngUW0XeRXmt0F0QhpOX85zERu+jTljOeYA2dUx8cjtG9vWru2Bmzhr5PCTKlPhtOHwxKwfLQEa7o55bfixYIulzzZpMisYON3VjHxn3QKGEtwnvne6q2V3A8Xjw/UI1WadmFtvrzUkfk+g/N+Aok1NDVUd/CNB6noUvWWmHVJ3LJZM/f0x3a1QfOYRvjLtE4OLJePIZ3E3wvsy7yudUjbGegxGt4owFpokPDj6ERzBXsvEB4fsIZMqGhhgNEN42UG9NKV5farCN2RWpWhENtcDbne8aCnfFXIK/AGgRAgtdfJRreMwnQaLfJGyV1xP4y6UEvHUtM7EVEO3sDEt5FyWwPcI/Bup7ErtLLOTXan0RHRQSnlFhCPF9AGn
X-Forefront-Antispam-Report: CIP:193.240.111.57;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966005)(6666004)(36756003)(54906003)(6266002)(4326008)(316002)(83380400001)(42186006)(110136005)(356005)(82310400002)(33310700002)(82740400003)(47076004)(81166007)(86362001)(70586007)(2906002)(8676002)(478600001)(70206006)(26005)(186003)(5660300002)(2616005)(8936002)(426003)(336012)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 03:26:28.5067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257ae90a-4df1-4ddd-3f64-08d8336f2e80
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.111.57];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3308
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH v18

