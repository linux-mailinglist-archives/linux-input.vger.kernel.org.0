Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2B11BA693
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 16:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgD0Oin (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 10:38:43 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.4]:40665 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727807AbgD0Oin (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 10:38:43 -0400
Received: from [100.113.0.171] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-central-1.aws.symcld.net id C7/AC-37389-07EE6AE5; Mon, 27 Apr 2020 14:38:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsVy8MN7Xd2Cd8v
  iDB7NZ7aYf+Qcq8XhRS8YLW5++sZqcXnXHDaLpdcvMlm07j3C7sDmsWbeGkaPnbPusntsWtXJ
  5vF5k1wASxRrZl5SfkUCa8afW8tZC3ZqVpzfUNDAuEWpi5GLQ0hgLaNEQ1MLSxcjJ5BTKfHo/
  R/2LkYODl6BCImF9+VBwpwCZhLLbi1jAgkLCZhK/Ow3AwmzCehIPJq5ngnEZhFQlXj84yUriC
  0s4Ctx4Us7WFxEoFziwMeZrCCrmAWmMUrs+XiYGSTBKyAocXLmE7C1zAISEgdfvGCGOEFL4ty
  aVYwTGHlnISmbhaRsASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXSBpZK6XWKWbqJdaqpucmldS
  lAiU1UssL9YrrsxNzknRy0st2cQIDNWUQob6HYyb177XO8QoycGkJMp7cvWyOCG+pPyUyozE4
  oz4otKc1OJDjDIcHEoSvOxvgXKCRanpqRVpmTnAuIFJS3DwKInwXgNJ8xYXJOYWZ6ZDpE4xGn
  P83rBkETPHg6v3VjELseTl56VKifOuBSkVACnNKM2DGwSL50uMslLCvIwMDAxCPAWpRbmZJaj
  yrxjFORiVhHnlQKbwZOaVwO17BXQKE9ApVfKLQU4pSURISTUwxUz2b3b7u2zmc8HYiYWiT+pr
  I8ytrK3Oe0fwfxd+fchtemdLRv6V9r7UyWn1mQs0FDqmrDqX6aJ/qjf2/Lxmd1uXnbZZrlfbB
  Uv9U/6k7g1JfHL+0jktr7jT61++Ylo7sXttnUiUc/mMJ34TM/4rnf35oOPI9DfH566MDWJ7c7
  ZdqHHZ2hOXe94J3+/JefyMl+NB91XWzOtR09pnOZXPPMxUUNB+uOv//W1RCyVdS+OnTYhasvd
  GnqPQjJWN3KybZ/997pSh+uDCp2PX1Walq0fbur37qLvw4X3+Fa/4HX6pK33P/VV414312bll
  LZU83Kp7tJeENfDK8+a1+1+eOsNmw/x7e/8z/MmZoya2SImlOCPRUIu5qDgRAA5sysFiAwAA
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-9.tower-223.messagelabs.com!1587998319!3025129!2
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12847 invoked from network); 27 Apr 2020 14:38:40 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-9.tower-223.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 27 Apr 2020 14:38:40 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Mon, 27 Apr 2020 16:38:37 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 7A5EF13F673; Mon, 27 Apr 2020 23:38:36 +0900 (KST)
Message-ID: <4f41d01f505e35543e3840f9ad453dd7373fa91b.1587975654.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1587975654.git.Roy.Im@diasemi.com>
References: <cover.1587975654.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 27 Apr 2020 17:20:53 +0900
Subject: [PATCH V12 2/3] dt-bindings: input: Add document bindings for DA7280
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH V12

