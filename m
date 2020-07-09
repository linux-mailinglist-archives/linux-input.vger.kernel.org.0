Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469C8219B00
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 10:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGIIj0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 04:39:26 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:26254
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726247AbgGIIjY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Jul 2020 04:39:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sv2Hq6DIryxFO25HNt7U3ACv6I9MR83e3/Yneae8tAGvGTolvWTaInqzauKeo6eIm8Wq3Bb9p1Z603arvzTVVb9bWTkYJtOjILc3u62PYDD0hMl+JpAdGp36GlSUoLT2XGTmWLhchrMXfmuUtHo41Q0yNERkd8moX3vnT8fng2GZHoZy+vh1dC4WrqaPUjEog9T1MjXFL8fjZZ3hD2FjLgtfrZoxwVlwywE/toMG+NO5RXDqREFuopmgEILAM+LN8j4byaOAEXy/qDlyznoOJkG7YstnA1iUkeknyawDvb6LyQ5hUpSEGEfKEg64kpYH2OcHflY/2I4vTe4RBLD4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urtELUJ0hnccn3t6P4DlQi3KthIHDq27vmIsJqogZ5c=;
 b=Fs3PMisEiIZNfcBmsa8Z7c/GO+tZYojjvCJ5swSmhCHC3kdom6ZW8ole4RhRVVkIJmKMxlFkUSKzM8HidJrqnM7fLqBqjarXc9Id1PN2d+GSOLPhUNXFO9UnMro5bWBMkwIGBYxbV+d1pNhV1uRXLUIvWTnjILDfEBSkw8oGkToUFQRdzyE5Vl8/ngzDJHdpLKy6uutAAmpaoiwp6dAJU3iCIcu55Z5ccjl7qOPn4Al1RINyHW26JrxwDh3gsSpz+ggMoDVWpxZAQasm5wtrvH19YI52kgpg45XB9eWDt2v45g4FM7BRQokMT1RkIdY/NpWgtqMhMzg8HcOIuQgSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urtELUJ0hnccn3t6P4DlQi3KthIHDq27vmIsJqogZ5c=;
 b=AN15PN0osb1KQGamHEGYTKxxSosp4JslMeMP6s+ouJu/I6a/PyJ9+kdW36p6cQIj1GmzE3it+Rr1o7NMk0hT9R5IEfqeMHoyPRJyirXI+SAV6r4sLjRcIXMfwr6uPHRFM5zGcSQsmVJFFVfkWDAB3E1v4SYkISanNf62ilbHoVU=
Received: from AM6P191CA0073.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::14)
 by VI1PR10MB2431.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:82::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 08:39:18 +0000
Received: from VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::68) by AM6P191CA0073.outlook.office365.com
 (2603:10a6:209:8a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Thu, 9 Jul 2020 08:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT054.mail.protection.outlook.com (10.152.13.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 08:39:17 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 9 Jul 2020 10:39:14 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 9F92C13F673; Thu,  9 Jul 2020 17:39:12 +0900 (KST)
Message-ID: <1ee5793a334c3ea86c2089cce55ae24aaa335086.1594279649.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1594279649.git.Roy.Im@diasemi.com>
References: <cover.1594279649.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 9 Jul 2020 16:27:29 +0900
Subject: [PATCH v16 2/3] dt-bindings: input: Add document bindings for DA7280
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(82740400003)(4326008)(316002)(426003)(42186006)(356005)(336012)(26005)(6666004)(36906005)(186003)(81166007)(83380400001)(478600001)(2616005)(8676002)(8936002)(110136005)(54906003)(70586007)(86362001)(36756003)(70206006)(2906002)(6266002)(47076004)(33310700002)(82310400002)(5660300002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb4c7059-29f9-4f31-92a9-08d823e3916f
X-MS-TrafficTypeDiagnostic: VI1PR10MB2431:
X-Microsoft-Antispam-PRVS: <VI1PR10MB24318FE737D3A1E116F4B8A2A2640@VI1PR10MB2431.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVwr8Qw8C8wqZpgidsWXHtEEw5nYqOn9uDuOaT42Pt7PsXrXj2D+OU8JWau0oXnKKjQEO6F7w5Lb29lXVAeXhyBxJ2+gNQaMzxgRsI7jk1JSht1hrNzrdCceZ4nQ5r+j/bpiMgErXB3IPtaf+0bszf/ao9qmaUuVn7kAKFDRIzdwmUIpkgrGbLFU50QL6ke2Tk3Ixynnkr5izz7BRAhN9TSsOvycOUMnwrerwaYNgjv5vaMG4MCeqJln5xTucduLT9Rm3OOvzzqiki6b77Uzs49AQgyZXH4x2pTdX15U58nkNqc7Wt9DP5ec56/XoxYRC6HJ9nkoy1WndT1bu1xPjmUGHDNNSnrly/O5dBiZJ3xH0U7iqw0FNYbyfEwAZ/FGwsze90HR0/m8KTWPxMwXWmD8J2wFf9cSpyd3tVy+J4wsOfXhdXGsM+a4Dn20thXq
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 08:39:17.4843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4c7059-29f9-4f31-92a9-08d823e3916f
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2431
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH v16

