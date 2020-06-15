Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808E41F95ED
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 14:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgFOMCE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 08:02:04 -0400
Received: from mail-db8eur05on2056.outbound.protection.outlook.com ([40.107.20.56]:51553
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729653AbgFOMCA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 08:02:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afhyZvu7YsSxbs2AmhMxrZVq5ofwrug0Y1HJFgLMdqq973Kn9zwSYcGrw1cg8nt87N7Au9TPtaHoQnF83ce2QiTPz0HBPRNqeSVjRSl3330I1jvC4s8/BNkczwZ3EyqYCp3OIZWKDsadpYnby5kmIkx4vV7orOcZmW9WhZ3vh/ip147D1sJpzc1254nd1teXyWa/j6tpGzSkAtGxhSmCGRMCISf5C3oVX0LxCrvcxjLhwnoBq55aNGuAsufp2vNlFkdgBNwP9CBRq2s3XQ5lxUyc3Hz4snMYBq87vGnheAKNOACkcItqunNNjx2j9SVwqUUtz5/+yv8M+KO3ABRWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joyh15A2UMHbaM/dXqE7q2FjDxs7MnU0FNFL18Tvk2M=;
 b=S6Uqkf1mpQyI0G27epxxlLNwql9W02jXjcLl10VkyknX8AMYvaD+jiFMhcCo2O5JdZa0NPEeqTyBiQyRAWxV5PtFn4nbDAaHM7rEaTaiury8YRM+fCu7odP05m6z4NFmBqDyhxL6eyhpe6ra548SHNDI0P2JmKVpGqz2feOxFKJBd5g+k1oqJ/1NxAwTCFEawKs6u5rc5Zu9zmbo+HWyWcqffCCCCz2j4P5QYS7Nwf45XmRieI+UpExYPAraxdK6yubNNrYKoFMQuf4ZGDDyjhC8zEgiK0I2vUWZ98GlcSKfo3eaErHbR/Cn9CzAEXWS4WQxG6un+Wl699w/WlL2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joyh15A2UMHbaM/dXqE7q2FjDxs7MnU0FNFL18Tvk2M=;
 b=XflDRfMz8SVElKflusmFQ9ghEVUQ81KaoVbSV/DEFNeMdb/9qnRNXCDhgF7LYp44F9ZTSFqFEi0JFVczS9Y5FWjWipOCZXPyOnSNjGMEM9PAsmZRp6K//JWCJ2pXP7mJuwxUi7eqEu2edpeuTIclbPfgGlD9P6R+q+gyeuKtl0A=
Received: from AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) by DB6PR1001MB1448.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:b5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 12:01:04 +0000
Received: from HE1EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::ac) by AM6PR0202CA0071.outlook.office365.com
 (2603:10a6:20b:3a::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Mon, 15 Jun 2020 12:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT005.mail.protection.outlook.com (10.152.10.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3088.22 via Frontend Transport; Mon, 15 Jun 2020 12:01:02 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Mon, 15 Jun 2020 14:00:57 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 8FFC513F673; Mon, 15 Jun 2020 21:00:56 +0900 (KST)
Message-ID: <72f90874bb7d3fba0abf733656c0f451f6c3759a.1592221223.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1592221223.git.Roy.Im@diasemi.com>
References: <cover.1592221223.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 15 Jun 2020 20:40:22 +0900
Subject: [RESEND PATCH V13 2/3] dt-bindings: input: Add document bindings for
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
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(46966005)(186003)(6266002)(42186006)(26005)(83380400001)(33310700002)(498600001)(6666004)(36756003)(70586007)(70206006)(86362001)(82310400002)(356005)(81166007)(5660300002)(110136005)(36906005)(2616005)(47076004)(426003)(336012)(2906002)(8676002)(8936002)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a9b0d74-c689-4708-58ec-08d81123c6a3
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1448:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB144817C4BE09C8AAC58DBA37A29C0@DB6PR1001MB1448.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHprQ4z611N6U+8GdPTSqzwQz7AizOExWP7Jv8QpewYzCVQ+bjc6NiSEgT2P6SEMfrLuS5tT7/meefgM/WAb6LmmOHUtkUow2Ikv/Q6lk+97AlSE0V9u8NgWlm75GhmQeOgRdlbDTTaSsI4nEXdLcFbBVGmMyvGNvyLz9wdbXC7E5vrWODYN/nXMeQmmni7ksl2DAFlCqCO3kLKwk6jg0JnTO0kIe5Cdjc9BwpNIK45OrhcFeXZSbrjEsjJHb4wTDRKofwS7PaZZrJ64pM1lgcA2jXA0I9EAqselrMGCCLkKYiqWWf/ul2qitMrLpNfh6Mi50oQXaSkzbHrqfPSiTilZWyj/vMba6jyTTWL4NSIXhIp6aMJR+GbiBkzqaYb7cBwLr0rgUhODA/apX9DblQbYcXqpCfPK4deTj7Yq9JQxSwWMH5qeBuKVHCqIaOhq
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 12:01:02.4148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9b0d74-c689-4708-58ec-08d81123c6a3
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1448
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for RESEND PATCH V13

