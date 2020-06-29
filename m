Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2AB20EBB8
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 05:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgF3DBF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jun 2020 23:01:05 -0400
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:3009
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726746AbgF3DBD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jun 2020 23:01:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h58GWzGsoinJy+23CwIA8MZze3YhpdmHP7MmMgLs1d5ueTYqiLiIKef/IFTw48MLQx7oeRyGnLsbn0tAfqmy3mnGn7GjpWOkc66Jsdz6f6UiUVtSQcHV+tssfANztbontVM57Wp8hp0CnBjSIhBzFU10J6CKiCMZIrD2yLuxL5uky3LI9wTpLYPnQXEz2xdwlP/ZjKrpWZMi/QG9smgqq/Kzn6qHg4LE+T5u4u747lYeTIW7wXSfDsh/VauYTSyb/lx+zWF7QSk0IQL0roYkais+y7ewX77gYf7NXe9V4zFl3bWcFo4l31vBe3ULQ4LaneoRtsjdtrN2kWD0G4OecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Udhyh/sF2HHuu/KGbOk+KybXB7FUoRE975dmXvACN4=;
 b=Ci9b3Z5lD0fKOsKX8u6vty+kepw8lr+xXNkYLjlMLlnpHEDtFeZ+FcGmZx7+fIC/HVazjOsTpoXrbXIbhBLTMrJ49jqypYnxGEqyrl6+txU6Wr6yCA8KdfbPYvzoAyktR5MRZENghha8AKxfE/ZeWg9n072js+wzTY7PW79GgR+Vh3m7fK8d0PFBCYANCRBH8Eghn7NtUYki7CbADITnNzX/i/gktHB/yVKfAQOMJqC1Cpp03a0LSQ2mntI/SEimZwWnaE2GLk0R3uQdS2e7FaA2ngapx9OClWOeaywoY+ot4kswrYhF3+4/7d4KdnJYAP77K4CgVMGH43o5EIhevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Udhyh/sF2HHuu/KGbOk+KybXB7FUoRE975dmXvACN4=;
 b=b8J2KQISCa7T3/GCAz/crTld2L0fNHFLVz1oWWbPmoVQINEsQUaPFDjfHtwTkC7I1X4v2l/jIzEjviKc5YB1iq/Vef1Kop3WVe22bSfXAqkNvef7cC2ga3SW98AJhHKAta2y5qIbE/SgPzjJ1OZAFAP07HjXTZ4AoOGyLJUEaDg=
Received: from AM5PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::24) by DB7PR10MB2473.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 03:00:58 +0000
Received: from VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::f7) by AM5PR1001CA0047.outlook.office365.com
 (2603:10a6:206:15::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Tue, 30 Jun 2020 03:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; vger.kernel.org; dkim=none
 (message not signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT031.mail.protection.outlook.com (10.152.12.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 03:00:57 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 30 Jun 2020 05:00:48 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 7A82C13F673; Tue, 30 Jun 2020 12:00:47 +0900 (KST)
Message-ID: <7a991859b2bd512cf32dc7a026468c3ffb2bc2bd.1593435662.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1593435662.git.Roy.Im@diasemi.com>
References: <cover.1593435662.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 29 Jun 2020 22:01:01 +0900
Subject: [PATCH v15 2/3] dt-bindings: input: Add document bindings for DA7280
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(54906003)(8936002)(5660300002)(47076004)(336012)(110136005)(356005)(2616005)(82310400002)(426003)(86362001)(4326008)(186003)(26005)(36756003)(70206006)(70586007)(2906002)(6666004)(81166007)(8676002)(6266002)(83380400001)(42186006)(82740400003)(33310700002)(36906005)(478600001)(316002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf7f7c0-9af1-4ba1-f7f0-08d81ca1cfe3
X-MS-TrafficTypeDiagnostic: DB7PR10MB2473:
X-Microsoft-Antispam-PRVS: <DB7PR10MB2473BEA25A535C78365FC297A26F0@DB7PR10MB2473.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3aQHavvoQNvD0tX+1ieboNnxg9rEkalcP+B0Am49mhYc/JYEe5mWJNplNg93TqVS9LqEjshDboAGIcnw9/2ZnahtcyNvmkQQygetpv5EWfnXjhmf/2WdpG69bxWZYa/gkeRMHxRLZndB5G/WWV3BHSFhjmQlEQgLJermveasEsP8xu1Util+3Dt5hMYqDRZCSSmJPcJKyoikjBOiYJ4+u3nQxFJYFiYIci4voNCIx4MfqxCEWrtlNbgRk9qVtUSgruTjtfbbk7c9entKrKy6wIGzllzoH95JPGCKjahkzIQQnPo4iZfp2US1exRxRqeKcLRKvvY/yudhpK43Bje62PbZz1bvA23keOwlArBzZ7wL2VZbeKnSQgII3qBkPPQ0SfOZLs3EoXStwdM8u5AwvoDRYrtxyDv4uO3O4yDW1ivZZEXqbO5Z6JBZGHeYkRu
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 03:00:57.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acf7f7c0-9af1-4ba1-f7f0-08d81ca1cfe3
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2473
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH v15

