Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6687274EED
	for <lists+linux-input@lfdr.de>; Wed, 23 Sep 2020 04:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgIWCUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 22:20:02 -0400
Received: from mail-eopbgr20048.outbound.protection.outlook.com ([40.107.2.48]:27011
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727183AbgIWCUB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 22:20:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6ieFnbSde+ZSiYsP7JTiNQc1HX8+iaMI+KDibkydnp6bJnjaHVzYXblR6GvDfO04RK7CPnuLHaj1XjnXMRVXgG3axz5n2AG233R0kOA6tvyjZrzCJ3NjvWkOdVBPH1dQ+ITT0mwLw4HGX2VoUrXE0+HaQuy3xuYzOogzjLhX+A/n9CB5CiBpyUH2WDHkoqxyEcCdkI4//mbHOYVW9TikR3qXZczLt35XC9pGhArnb12d7CFryThIachMB1TZ2PtuKljk9s0Tj/ZQLDMrh7/wG/Lb1mAvH6uJ5UdKl44mBXDF+YHuV3Alhbmhrk1Q9mu6oN1aI+pTSyS7MBuhnI3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcukXc2vkH9srXDWhKcqBwmkltPiZabEluoGvtVOTFY=;
 b=NHz+cZya1P660JjFEB4PaVmcpcyZN+2/MykPgpR6rFDVd6rzYWmgmP1fpXDY7hNfoHr2a8luSksqDj1YPL8Jxeych5GTcxUJZ3bC8qQ0fSk2XO/9yNMyFINEmcrF2wVS3kVr7a46vYL4yZP7y7She+k7WrrizSloOlP11Tnqg+hueUKM55wGGjNPt8SC2cJEeGv4DSUBp0Kbnm0zWuu/99roxy4yDAd6r03/lU/EoG9yHe0+CcW9SxpN0bPDQzxW4y4K69WEtNm8zSQiwC/XTwk53GUOtK4UVxbJzllTRznssJsiGqQR4X4dTctRvi4f23tU/PfKm1/NdSZIf+AO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcukXc2vkH9srXDWhKcqBwmkltPiZabEluoGvtVOTFY=;
 b=ITeX/o2gmvpW6EMK+poGi3/YB7qECSyqdnuMJS2h5zG/vQbf+UOurVlwtOsz2mGfyo6HlEjBgPdz5H4ySzUnBm42WcBLbWVHEo6GyJx4ObhobLQn9nnmBeUApQXYrrTgs57Eq7TARSIrEsUpnJxdCAjcCnOlN5bGpH1RWvPi4G0=
Received: from FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::8) by
 AM7PR10MB3224.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Wed, 23 Sep
 2020 02:19:56 +0000
Received: from HE1EUR02FT044.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:14:cafe::37) by FR2P281CA0021.outlook.office365.com
 (2603:10a6:d10:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.7 via Frontend
 Transport; Wed, 23 Sep 2020 02:19:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT044.mail.protection.outlook.com (10.152.11.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 02:19:55 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 23 Sep 2020 04:19:51 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 91A3013F673; Wed, 23 Sep 2020 11:19:49 +0900 (KST)
Message-ID: <44cc5840781a7840dcac23af88fd7dd119d4a6fe.1600823131.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1600823131.git.Roy.Im@diasemi.com>
References: <cover.1600823131.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 23 Sep 2020 10:05:31 +0900
Subject: [PATCH v20 2/3] dt-bindings: input: Add document bindings for DA7280
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
X-MS-Office365-Filtering-Correlation-Id: 1afdba5c-dd0d-44fd-ee65-08d85f6729dc
X-MS-TrafficTypeDiagnostic: AM7PR10MB3224:
X-Microsoft-Antispam-PRVS: <AM7PR10MB32245AF318CAEA79BE6BA579A2380@AM7PR10MB3224.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhDREd73AehGuGNIkVn0wuDzWSp09vBLQjzneHapYrHY3vS1k5WDB2NnrKugpDR1cNYPUO8pAbtEKOPpg6oaeSIerh+YKENE074z6+HsDANAgOpN/BBXD3EUbqmTdZgBXyoZ3UpNDvK6dnFGf6I/KHRxsNgDA+JFn2WnTPqDRTw853PmTPSzUB13/lUq2Rd8qrzWFsiaFt/VYWlIdaFzVQwp8w/n1X4QusY9wltW1UNcyNHeqLIR2Q4l7eBqsRSh9RNVBCogKRLbxFk9pOsf/rJwW0DLqVMVOzAbHgnj1xybEDso1LCg955kQ7IbhXAvBIJpHXr3V6b/qAGn66YeppPhhXlfqWnlYNfPBWmIC4txx81qMzu8rcL3ZYXeBax09FTZOuo/JJ+B//JgAVXdVgqEhd/cY53IVNrZdIZ9TzexMWr/VED6uakN0jVGeBWsPdgqO0ZiyaLaLRUPGlh/mDkUe/s8/730qVNFtXHjL4A=
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(4326008)(42186006)(6666004)(83380400001)(82310400003)(110136005)(36906005)(81166007)(33310700002)(356005)(82740400003)(26005)(478600001)(6266002)(47076004)(54906003)(8676002)(86362001)(36756003)(5660300002)(336012)(2616005)(316002)(426003)(8936002)(70586007)(70206006)(2906002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 02:19:55.8741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afdba5c-dd0d-44fd-ee65-08d85f6729dc
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT044.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3224
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
end-of-patch for PATCH v20

