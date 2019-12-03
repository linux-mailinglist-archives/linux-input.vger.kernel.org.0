Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55A11122C1
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 07:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfLDGCD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 01:02:03 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.114]:61555 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725932AbfLDGCD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 01:02:03 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 2C/CD-12313-7DB47ED5; Wed, 04 Dec 2019 06:01:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRWlGSWpSXmKPExsVy8IPnUd3r3s9
  jDdaek7eYf+Qcq8XhRS8YLW5++sZqcXnXHDaLpdcvMlm07j3C7sDmsWbeGkaPnbPusntsWtXJ
  5vF5k1wASxRrZl5SfkUCa8akHx+YC9o0K74s02hg7FLqYuTiEBJYxyjxdO9G9i5GTiCnQuJp6
  3dmEJtXIELi5qQ5bCA2p4CZRF/vAUaIGlOJhnmdLCA2m4COxKOZ65lAbBYBFYmPrSfBaoQFfC
  Se7HjJCmKLCARJPH50lgVkGbPAbkaJDxcOQC0QlDg58wnYIGYBCYmDL14wQyzQkji3ZhXYIAk
  Be4np768CxTmAbH2JxmOxEGFDie+zvrFA2OYSu9ZdZ5rAKDgLydRZSKYuYGRaxWiRVJSZnlGS
  m5iZo2toYKBraGisa6Jrbq6XWKWbpJdaqpucmldSlAiU1EssL9YrrsxNzknRy0st2cQIjIWUQ
  hbfHYwt397qHWKU5GBSEuXd/PhZrBBfUn5KZUZicUZ8UWlOavEhRhkODiUJXivP57FCgkWp6a
  kVaZk5wLiESUtw8CiJ8DJ4AaV5iwsSc4sz0yFSpxiNOc7+m7eImeP3hiWLmIVY8vLzUqXEeTl
  ASgVASjNK8+AGwdLFJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvEogU3gy80rg9r0COoUJ
  6JQDlc9ATilJREhJNTDt6rh6PvDB0x1xW+S+X09dXDd1mufSa8vUNZqSY3y6zN0nPRDZIB548
  JL2pPT0Zqu4qTYTjBOnqrcoWJXZdFfZ6toEr7iZV+uZbC7afbpVIYl5B6PU4uhpfL48/Tt2Pt
  b9eCxoYq3fFcYZUYtu/d4uWV9wUtzB9Gfen6eRM3xWraw3e3ou8hgLqzh/FKvZlcZ1xWnLvgS
  nCHjkSi15Kn9bxEbhxb2gbS9Vkx8zpuk/OPhGkTXk4dPeH3a2Om9bWBgUQu6e9rf/+Ph/PLc2
  n9vi9d53j116t/87u0S/YvSE7PxNmr3BPSonFKdHerxKnqI2rSY+SN5s9e7bdreXauk/nVbt+
  jL8fApHIA/beiWW4oxEQy3mouJEAJWBRqeSAwAA
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-10.tower-246.messagelabs.com!1575439318!946274!2
X-Originating-IP: [193.240.73.197]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30507 invoked from network); 4 Dec 2019 06:01:59 -0000
Received: from unknown (HELO sw-ex-cashub01.diasemi.com) (193.240.73.197)
  by server-10.tower-246.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 4 Dec 2019 06:01:59 -0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 SW-EX-CASHUB01.diasemi.com (10.20.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 4 Dec 2019 06:01:56 +0000
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22266)      id
 1AC703FBE7; Tue,  3 Dec 2019 07:11:54 +0000 (GMT)
Message-ID: <e158579e099adb91c3ed966c1f5b03ff68e85ab8.1575344416.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1575344415.git.Roy.Im@diasemi.com>
References: <cover.1575344415.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 3 Dec 2019 12:40:15 +0900
Subject: [PATCH V8 2/3] dt-bindings: input: Add document bindings for DA7280
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-ServerInfo: sw-ex-cashub01.diasemi.com, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 04/12/2019 05:22:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device tree binding information for DA7280 haptic driver.
Example bindings for DA7280 are added.

Reviewed-by: Rob Herring <robh@kernel.org>.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
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
end-of-patch for PATCH V8

