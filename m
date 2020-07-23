Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1653322B4B5
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 19:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgGWRVA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 13:21:00 -0400
Received: from mail-eopbgr60053.outbound.protection.outlook.com ([40.107.6.53]:27011
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728030AbgGWRU7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 13:20:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTtlmjU09LdD9sdhSFl9HWMe3VZecnYLgpmiBLywoHI3qMi19IBqIBmXyERNvuspt1xQuLh1KqITK7+JEgnmUukJmR6nXWaILjWdOyAQCJZ2KdauHDvmWOC9I+XQVBeO/P04fZ00HXNdl8UGo0fWL7bTj9Va+BLjApD2KsTfVwcIew9jMkGJiP7b4/4vkazcb2PQV2okWXAkybKCGXZQDlF9sn+0fGgpT5m1JJDvgk/x2i+7tTlJjN71nOVaMAgXUIZyHrxWK04uQBJYrNBCQzYLivMkPnUdr1BB4XuaaLiBM9IA9W5U8p7U7tGSfpQhtvvDtsuYPoAFr+vp1ehhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP8BZm4yEiAjxfLrXT/jPTxwqvUaoBWDYl4l1GurmvE=;
 b=PTAsDRtK4Re+PNeIIjsfPeVte3acpgBHZTYDtQiwatm2orwAthI88tGI0VRijB8ST6y2eP7sXJKFSfmIOYzGbII/Yc7hYdfJcECU6Lx+vrcwbeAEj/VcZ4pBAOiFPj1lwIAAcgm1QcBxmWdYyhAAAn0MrnrEMyfHDGxgL5RPi940d9C925KytUAvSg9Mz9BnvuQdw3paqoWdI4w5EccwwzfmpRaQyN0Z4faTuSmO2WETlHt8U+AXhOmh0BDA1MsShTb98YyR/bG2VbPbgHjnLkb9d3F7KAsGE4h/KoeXJuiTf829YsZNd2+U0fB0MwLRI1CiS3czBflTnVJD1UMynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP8BZm4yEiAjxfLrXT/jPTxwqvUaoBWDYl4l1GurmvE=;
 b=wd+xfund66XO1JNvNYI8F4Eox0YWFrL1sHCSFSd/qQE2vlOYbwHORVa56jD9Z9sf3fUdKIDOpTlloV6oFttrm41EAgVUY3D7x4Zulr3mlT7XVXhI3cWYDPmt9WCFzQlTyHpv8pxqbFPekrx1VK6PHGoRoFBveeWdTM28YW1ASJ8=
Received: from AM5PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:203:51::29) by AM0PR10MB2370.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:d7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 23 Jul
 2020 17:20:54 +0000
Received: from HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::27) by AM5PR0701CA0019.outlook.office365.com
 (2603:10a6:203:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.10 via Frontend
 Transport; Thu, 23 Jul 2020 17:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT049.mail.protection.outlook.com (10.152.11.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 17:20:54 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 23 Jul 2020 19:20:49 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 A252A13F671; Fri, 24 Jul 2020 02:20:47 +0900 (KST)
Message-ID: <92a7fea51a3204bce1df981d0e5b68843ee4c668.1595516501.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1595516501.git.Roy.Im@diasemi.com>
References: <cover.1595516501.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Fri, 24 Jul 2020 00:01:41 +0900
Subject: [PATCH v17 2/3] dt-bindings: input: Add document bindings for DA7280
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
X-MS-Office365-Filtering-Correlation-Id: df180b9c-0715-484c-42a7-08d82f2cc176
X-MS-TrafficTypeDiagnostic: AM0PR10MB2370:
X-Microsoft-Antispam-PRVS: <AM0PR10MB237085E34FE3137916C8DFDEA2760@AM0PR10MB2370.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jb3pzEr7UWK1CpOgQe3i+a/J8WuuSf6rrE/evMqqjqCXKjF/xqGziZPnTwAZyY40SHmG0RviEXt2FZzThvb3PfyO7rNzXzDcHHplcKU+NQ97UdNVMi2Wytt1/ltr3Q1CT/oZ/l8mUUiCwQG9Q0lcD02jxCOa47VFAF6YRY5f4+tWca8JtHUbAy+uWFphhUbYdzp+k/4YZBnnUxM1QjA2mmJqvz/eonUkg+8rVfBLYkHb7RODOnIofO1tnjZD0zPF3w+QEfMAVwY2V06cOGXqXA7nJTJsY6SjUs3dEwpNwtxCsJDkJ4S3y1HkXh5rnAxaLmuF1POhhFSgzCnb55QRBT+kn/hgYkP9JSmTyoaeI3FuT/x6odIkdgV1VFYfOrXspJP7DeQDgget5OB7cYOTUYGbr/3JVtFZZbtq4rAG1nMcul4Fg3jrD3BSOcgvyHPP
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(110136005)(54906003)(86362001)(478600001)(42186006)(2906002)(356005)(36906005)(4326008)(8676002)(316002)(33310700002)(6666004)(8936002)(5660300002)(83380400001)(36756003)(82310400002)(426003)(82740400003)(6266002)(336012)(81166007)(47076004)(2616005)(70206006)(26005)(186003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 17:20:54.0796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df180b9c-0715-484c-42a7-08d82f2cc176
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2370
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH v17

