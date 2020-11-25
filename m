Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05992C454B
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 17:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731860AbgKYQc6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 11:32:58 -0500
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:5102
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730719AbgKYQc6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 11:32:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTPE/WtbfzTuwn8bkNMy807ONtYKeGfsrmCMpTxPaIKfeD9kZB13aTncfGu/3fmySuf5ZQeQm89S1TMpTy3mik3v1MaqXBrvDPVvADS6N9NKVkqyseJRDDtVChqi3nDk2GpfRkZF9Xt4e4SKyaSkX6x6USS4B2Dj+IfDpKzmtC+uZ3cxsmZuuBHafY5PeNh5Azq1w1I7fR+4TF1S6buUdKatoMr7iYyzeSD3V1XwQK+4rkiNI6nCWKyGBE0NmHobgSi/z/Lkpcaa7TD+iq41h5YX08RfKWPla8MJgAaRbT2nCosMVt/5iPTK+USZ/8+l/0ryoD6l0/v4/32di/IwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKszkSWgSUrkhWl67PbXjzC1pY8yihsfeMDHK99HdFA=;
 b=dbjpCb4UQRolLax3OobUf1j/bNHDSeNUAe8xZhbHyF+PXhWrgnHbbB+L/lzByGqN5birR/zlSq25k/YGhgCVNbtFlurxAr3AIypSJlQXNx/zAZDY7KIqalzbZIomwfmmdVDdZRinrLnnaiizcUlCLkLvM0fOshyIKlM66o94vwxaJS7Foue5LAjrIVfiz7qJLsxcH3XZNpdfpuTp2+Th0xaH+yw+MVAKp6eMI6W3tJQRVKowUWewvDTHabkAIbwkBaISTXwEVr/4JvQvT3I4k2EZ5GrchObu2PN818OIKrxjJ9GJJEthP2b0deMajtlEs6uN9ePIeoS30VjWQj+2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKszkSWgSUrkhWl67PbXjzC1pY8yihsfeMDHK99HdFA=;
 b=jL9zfHk3Iye2/I7XITYTrp+0aolQg6QqmmbKteED3WoZ7ruxO9/cjJPAwAROK3WYU11dZSNKc7cDXSXb+czsZ6ll3np4duKAbCvpmfFwLk0sIBDaQszf6b1qrsOwcAwT/7QBaId2LE+7UD3utrliwdl++CJW1hQGqnThyeM6ZY8=
Received: from AM4PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:200:89::31) by DB6PR10MB1703.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:6:38::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 16:32:52 +0000
Received: from AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:200:89:cafe::f2) by AM4PR0202CA0021.outlook.office365.com
 (2603:10a6:200:89::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 16:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 AM5EUR02FT028.mail.protection.outlook.com (10.152.8.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3611.23 via Frontend Transport; Wed, 25 Nov 2020 16:32:51 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 25 Nov 2020 17:32:44 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 2C25E13F673; Thu, 26 Nov 2020 01:32:43 +0900 (KST)
Message-ID: <2bc9a4a9d083ea8f360ec75f6281b6de6c4ef284.1606320459.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1606320459.git.Roy.Im@diasemi.com>
References: <cover.1606320459.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 26 Nov 2020 01:07:39 +0900
Subject: [RESEND PATCH V20 2/3] dt-bindings: input: Add document bindings for
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
X-MS-Office365-Filtering-Correlation-Id: 51b671dd-4d83-427e-63c0-08d8915fc110
X-MS-TrafficTypeDiagnostic: DB6PR10MB1703:
X-Microsoft-Antispam-PRVS: <DB6PR10MB1703FB45A2FFC648024747ECA2FA0@DB6PR10MB1703.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vNUxqs8LbUIK4osVf65JSQMWma7hcKXjEkEf2vuuGAgPWmHIfC3BeJo3FoUvPRkGRvAdq1B636EhE7vsG2yXo26Rt374t+Sr+TxRLwd8Yg1MelFogSg0wtw6uaRDmCKhia6CmE7Ey64sKX4bPRG/zZlmadwYR5gyd+ooQcEHcKL+VTwZrdj41usxVRBJfEkA1ksJzpjQLp5toQcLqYCt5fHwmFFuj248nuPfZaBfxYnt5lcCIP7HC6vrq10SY76bSeL4ddL8CtF/8/v/etb8M7LFOY50lhlrZCAZ6eAZ+Q7nHMpRmkbXvEZ4IUmRlMqciK+N52mSFQcvBSmO1O4AN79gxjH3WQ/vNCv//qFKvlRsfYNCBsIBPzYFLSwSp/B4LHNRdgfsOFaTOXaeyUuEKu7wGfnyOp6DyfAhUQenNHFbKJQIjrI+8AumN93ZZFWg
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(42186006)(81166007)(356005)(8936002)(83380400001)(6266002)(2906002)(33310700002)(70586007)(316002)(36756003)(82310400003)(86362001)(8676002)(54906003)(110136005)(36906005)(478600001)(6666004)(336012)(186003)(2616005)(82740400003)(47076004)(426003)(5660300002)(4326008)(26005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 16:32:51.7563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b671dd-4d83-427e-63c0-08d8915fc110
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1703
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
end-of-patch for RESEND PATCH V20

