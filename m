Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBC3209CD5
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 12:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404029AbgFYK2o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 06:28:44 -0400
Received: from mail-db8eur05on2076.outbound.protection.outlook.com ([40.107.20.76]:53601
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403955AbgFYK2j (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 06:28:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfKrw0Zf7RPv95mVBdMvRRo958vDpjpSG9nEmltONAOQA6FUG5+zhYhsij/ncVUw8hFV4vGr57atx3vQSeWPaMYPAeFN0xNngRE3vrK3hCJKF6vMpfYg7a9q1tdQvIVZB08MaY7CMcpEiHdVeoXm13QwHDFKd3r6rlJPAAGxR0A65UH9/MCP5xwuCc1rFfpljw4N8F5oAlba6IARvqcuxrNKzJo8t4iBJFM8XXE5MpRqFgB1uBCnnT6F8C1N+LzJBR3FVprxsC9oL4DrCrK7z1N+w3Q8paSTv0jg9HUW2nGtumlPrCp+HK/D/ZI3xwqaSWjSt3xM8CyCDaBhatdxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INmwspKd6dN0GlMq2MILyKuXXWcIVxGK9K66+DlVCi0=;
 b=OPqdTWywnRe0UF7aRBEU0A0L9oAg7/4iUak/rPOzZ7E8poeFFvWvHRjjewztuYE47XPusgfjJkYmw5G9LLCf4O5hFCPGiip8Hu3RYScJPBnSO10AxoiuWxsTeYECABKq6iIk0+oNCbgo66uZqY1N0+JzhLUR0AIpFPI/AsogDiq1+8Y9//7uCrdSPIioujU8RTLhEkg2DdlA8Raz4VG5LD6BP0+rpAnJSLMoEnKfdcR98l1V1JDW7bjiYtN9D9RBfD6ryUoU7/Z7DaE3odU2oDnXnsUV4qns4JGcgEnPxaQvBQKuZL35xv43/aMa51lb60ZOUaahqflJxp2eYKXv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INmwspKd6dN0GlMq2MILyKuXXWcIVxGK9K66+DlVCi0=;
 b=Ih1I6lQyF0rDe1Y4bHbSukQm9eElawdrQowXeH4QRt3UmCNsr5wFAchC+QZ1dhUO+l0WCeT4V16ve0qLCZqkHjFzPcWu79NEFl4+HlZJwLoMyRWY/8L4t06EBOPgAmw3Qn3dI/kGUbcHkSVGBa8+rYJ9sye1PiuwO5xcZWOTOXM=
Received: from AM6PR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::28) by AM7PR10MB3795.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 10:28:34 +0000
Received: from HE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::7a) by AM6PR01CA0051.outlook.office365.com
 (2603:10a6:20b:e0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Thu, 25 Jun 2020 10:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT031.mail.protection.outlook.com (10.152.10.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 10:28:33 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 25 Jun 2020 12:28:27 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 A9B3B13F673; Thu, 25 Jun 2020 19:28:25 +0900 (KST)
Message-ID: <8660c86d948fa077aa514f5ab10170b5cd39a198.1593017969.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1593017969.git.Roy.Im@diasemi.com>
References: <cover.1593017969.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 25 Jun 2020 00:11:15 +0900
Subject: [PATCH v14 2/3] dt-bindings: input: Add document bindings for DA7280
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(46966005)(316002)(54906003)(478600001)(42186006)(6266002)(86362001)(36906005)(36756003)(4326008)(426003)(2906002)(2616005)(186003)(6666004)(336012)(110136005)(26005)(8676002)(5660300002)(82740400003)(356005)(8936002)(81166007)(83380400001)(33310700002)(47076004)(82310400002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba1f3279-65ac-4895-3fdf-08d818f28381
X-MS-TrafficTypeDiagnostic: AM7PR10MB3795:
X-Microsoft-Antispam-PRVS: <AM7PR10MB37954072931F2F629DE9DDF1A2920@AM7PR10MB3795.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUUrhtiRWSLO7yk0vVTNR5/D3AZoSMBCypyG7wwb7PCHIuyvhPMkUgRQ9ZVb4M7cB1F8T3v22vyq0eSFqlmpsDrzwq85SpexZsOfVLpT0pdMKrg+MnchXjjcZ5kauFJB+MatR6Pg76OAMJZcAACOrByftvR27XhVd8MI4QlGfkAi2Zcq1hLbl9LvjW5dKVtWbvJ7a7CkCza7nzxqUlzHjpUs9byBAqsZS61xTpiy3o5rlNF/JwG4LMKDhv9b546T1r/ZVx1pkJjwbaEpfFMJDH6rYNzRKRfOoh9K1sO5gARUfkOK7HaR2KUoEC90Z+LfJEJf6mR4Gw9QHtmUjy8UMtEaZD81vo1k4/49JEA/xCvp3DzTinG47nup920fZeUrDE/9+fzYibyaeBrsQ6Te1UwFFc/PJgxvO1x+fNJnKKR/K2mIiS8Z+fOI+n97Cnv1
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 10:28:33.7494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1f3279-65ac-4895-3fdf-08d818f28381
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3795
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH v14

