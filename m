Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A6B247EA4
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 08:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgHRGsc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 02:48:32 -0400
Received: from mail-db8eur05on2067.outbound.protection.outlook.com ([40.107.20.67]:64003
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726730AbgHRGsa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 02:48:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIoLk7qfsG2tJHty1wXuraJUlDbQZlNgj2PoG3ijRbleKQtNuvf2MiYm5wTCZP4fv+ev1MZc5mE5EgFRKFjC16teAGQs3fQnPzgaPmDA8bL3bIkUtvjNWo91+yeE+Ova7UXo7mg5KGduD7hqOpEbSCfva59OG2AqCW80QOj9pKTp4pDSVRSdgdD8zgXKYguHkMEz6g6adbGQIkEhbcYZTnt/MbR1eA4Yf9JGQCOfPAnPpZnOA6e1AqtZSrd3h5pQzX/XGmmBrV27K3nPFQt+bFYzrnAnHIPjn+avMxbLuJYeTsxRuHIEzU9BoWaOjwZLDrdhdQYbF0BsSAJPZyhMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdE1x8BM7XNoSSlsO+7fVaolO1TVM6KIX4nD4XzXAao=;
 b=hVJzODZLYTErQrfMgeNvvb7Y77iqj9L13AvZhZpE2/YAJqme7N3U+KcN7jXzE28mzPwB5HlgZ8BYR983Z5mgOeOUjspE/nrzzclJF8qDrVc0kZebJGNBlayPKBeUCUht0W2SZtwR2IG0ZiGA2nNtBEcDVCxMiQopZTJgO3cwRuoJSc3RDFLWho3K8eOe4ZHkEA7QldK/J/j9bQ2vUO9TMXlmeM/22+F3+ZGr4U9xtOnRQyKIyabtxJ9OA2ltYPNO8K+IO41wAhS/elbCFxPpa8wZLjS5KgbZQ2GwdjSwI3rF1Wr4IyTT1/cbwlAjmWlYQ4ESecNb2chyB930cDS8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=neutral (sender ip is
 193.240.239.45) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=diasemi.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdE1x8BM7XNoSSlsO+7fVaolO1TVM6KIX4nD4XzXAao=;
 b=BGyulHAlyQzcTzX1HKMB84wCwqCi+pGK3vZiy+xwZ4aeRCALriPiIC5nFHqN4c/CH+f7J+9REIBPr38Mmcws1QtkgMwoQR4E9cmCjn9/1rn/rstVJMJaJQDLcUciUW9gNOIf9uSwHfKxxVIvhOPqJ6JofTMddAt7Fp+HB/sUB5E=
Received: from MR2P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::12) by
 PR3PR10MB4015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.18; Tue, 18 Aug 2020 06:48:26 +0000
Received: from VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::b5) by MR2P264CA0173.outlook.office365.com
 (2603:10a6:501::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 18 Aug 2020 06:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=neutral (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: Neutral (protection.outlook.com: 193.240.239.45 is neither
 permitted nor denied by domain of diasemi.com)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT031.mail.protection.outlook.com (10.152.12.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 06:48:25 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 18 Aug 2020 08:48:16 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 5BCA613F673; Tue, 18 Aug 2020 15:48:15 +0900 (KST)
Message-ID: <0c125776c1d606cad03112b19cfe26a6371164a5.1597706056.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1597706056.git.Roy.Im@diasemi.com>
References: <cover.1597706056.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 18 Aug 2020 08:14:16 +0900
Subject: [RESEND PATCH v19 2/3] dt-bindings: input: Add document bindings for
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
X-MS-Office365-Filtering-Correlation-Id: b40d2f31-8a75-40e0-9aa1-08d84342b528
X-MS-TrafficTypeDiagnostic: PR3PR10MB4015:
X-Microsoft-Antispam-PRVS: <PR3PR10MB40151E611542C013AAE5EF32A25C0@PR3PR10MB4015.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2F/MN1tVDtWivZjZnsJ4FZeS+V6zPDjlnqCusT3rkdnMAsrD6qPI4M7nVjyJVEbw6gkpzO4t025iJFvogeByUfqk6g6hDE0sX5WpWGJItahyXVTSV1aZaLPlbFc6984ZCd1fL5K8R4emD3BqwrQgjZSBIGBJ8ynjD307bqhK7bfVCfW2IqsEBu5rPj5rxB0fRpZ64GWe7Ygr82655S2+oc2cT49SJg5fhUWp6SxCLDAGiRMAbtAuyD5eKpv6lLCD/uvqbhinkodqr8aHbL+Owdf9agDpi5e9tar4C3J2E98UutDuN5v1+y1epgKvkAIqMlpOAiBAk6pTL/vTidbyr2aXpD37ny0u2EKDGdIm1lDgcf0iS/7KheCZb8B0mZs4zeb5fgfcZabVjtYyGCGxUxt7eHzz21C/mmpbNHo4suZvaysPwH8USmvoE2GkgH2
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(83380400001)(36906005)(36756003)(478600001)(2616005)(356005)(33310700002)(42186006)(82740400003)(4326008)(336012)(82310400002)(81166007)(54906003)(110136005)(70586007)(2906002)(26005)(6266002)(8676002)(316002)(5660300002)(8936002)(70206006)(186003)(426003)(86362001)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 06:48:25.6566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40d2f31-8a75-40e0-9aa1-08d84342b528
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4015
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
end-of-patch for RESEND PATCH v19

