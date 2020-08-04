Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA1723B9B3
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 13:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730213AbgHDLjO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 07:39:14 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:47640
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730241AbgHDLjN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Aug 2020 07:39:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5UPFf1Au72FugdZZkuzq3wVhxhhk4l52Bruq04t+KGn3P6MQTgdFKtzwJwSLNpjt41SmxmsPlSZsOyIBpqdCx/CC6Xhfx2ics5w+9C1NFELy78Vfj6wip9QixN3F6mROiW9BRw1LfPDRzKhSq+rhhtHz8tfPOa4VBUz7vLeovYGg3wiCD3+m9qK+rl3v1M3UPfyOqmjVdOPZ4tMTxa/JuHM7QdxW9oLk04oLEWlYrocynB+uHmbKtzUSqz6oa3jYWehspAQqWBuwf1c0HmSGS9vYtC9mLviMc8owjb8LFvwTHq/Xb7o/YDmTfqgGpp0b8Pn0DRT7Ey5VB5d6y9alg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU4aP7IIJ5dg2LEf+/SFhGhrMykB+YHcaTBNrM2+t/0=;
 b=e7RA6jVzd8bHbhzjVRy6IzCHG/PGlzKz8+KU2ImBXJfle2RhyvzUyfl0Xi1SPksc9DKCdHOCcVCBejgKS8FFm3z6DTmumMu/m72Jh4HrxnXi9H8HKWLpx5i/o25wBZmH/7Yu7a1Bc2iJ818pyL8ymOKCGu7BEn+jGVvhKyVz7PvJeEwGDB9TCW+YzdFbk3lQvYgniYERta5Y1tjkZgv6TdhYIZILRtT1PpyvxU76LCd64mTbyA8htiRU8efnPBE5SuYrQImw1zQKpGDoEAY4CrZZAxU9K/VOZOnVHGKgs48Rl/Whc+BnMQ1SqHM67pNCwJZEG/5LRCReq2HEFcnODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU4aP7IIJ5dg2LEf+/SFhGhrMykB+YHcaTBNrM2+t/0=;
 b=biXbi42J+88/c6MzAk2xL/TDEJkAya2LpIpuslyDIt755Q3vujcYYD8XdA29szgq9Ngl0NYtu5hi0+2nFW8urH44HiwUpL6MHBc+0zEAkzkB4uq53oDW6n20i9FhpAYfT5V766hM9ERabGmGT418y4NL8zRwtxAa/z67gUUou9w=
Received: from PR3P192CA0054.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:57::29)
 by VI1PR10MB1744.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:802:34::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Tue, 4 Aug
 2020 11:39:08 +0000
Received: from HE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:102:57:cafe::c7) by PR3P192CA0054.outlook.office365.com
 (2603:10a6:102:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 4 Aug 2020 11:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT063.mail.protection.outlook.com (10.152.11.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3239.20 via Frontend Transport; Tue, 4 Aug 2020 11:39:07 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 4 Aug 2020 13:39:05 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 4D1D713F673; Tue,  4 Aug 2020 20:39:04 +0900 (KST)
Message-ID: <b960f68e87dc8892da7eec8bc549652ac3b56c55.1596522828.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1596522828.git.Roy.Im@diasemi.com>
References: <cover.1596522828.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 4 Aug 2020 15:33:47 +0900
Subject: [PATCH v19 2/3] dt-bindings: input: Add document bindings for DA7280
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
X-MS-Office365-Filtering-Correlation-Id: 1d250a32-0589-4d8a-b621-08d8386affac
X-MS-TrafficTypeDiagnostic: VI1PR10MB1744:
X-Microsoft-Antispam-PRVS: <VI1PR10MB17448ACAAD585D40FEC2137EA24A0@VI1PR10MB1744.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z5YsOd/Ypmm7Ggm5B/TMbi82YuEUkbuexoq2HbHTLZfD6nERg+8aL6G3lgISodagPWyxGPneLhCfupD5DG/lHTJ9bII4p+kHERGP5IDvCZRvA2eN+nueWASSsGHmiEXRtE/PjuaWxbM2LUexLDQFY4Kop0EFOGBNKQE6c2FrdPfDrRzNcVYhIDcXMs3vVMK3tj5Xk7FXr9MlpZVWOnRiHNswyeVq4PLUmw8UOd3USa7bSYnUVK+HQxSrC1x2ePQWCfTVH8RBRCV/ybi0gA5A9tOxCaV5WanG2NvKZrIEP7AaQwEswnbTdCLuVowzbi0o/sBljwYt3biMJ69kGa8IdhaP2Z1Sm/Xb8JwSNQ9blCrUMAIf0D8L/t/54YAf4wriYyEfiIGWNXtTYmgKJQHIMuWISOXMIhJgrgdKDMHwI8eu/0K73Bwz4Zws3GV6XZZ8
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(46966005)(2616005)(4326008)(6666004)(336012)(36756003)(26005)(33310700002)(2906002)(86362001)(47076004)(83380400001)(5660300002)(8676002)(82310400002)(426003)(54906003)(6266002)(36906005)(70586007)(110136005)(356005)(8936002)(42186006)(81166007)(498600001)(186003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:39:07.7063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d250a32-0589-4d8a-b621-08d8386affac
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1744
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
end-of-patch for PATCH v19

