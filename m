Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55789356660
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 10:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346945AbhDGIVS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 04:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237437AbhDGIVQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 04:21:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AB36613AF;
        Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617783662;
        bh=HqZSrqrVQjQBnEaZwEBF+W4ME4CRAsaa4WPPvehfjf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VVgHbIqfSKWwj+K9BWgOV2S3swU7uG5ymDGGShezc8muFxXZ39e0MEDyX96szqCAj
         xoWiY7MjY/jDwC17JiCLxrkZdqJFMZB77AXjkTxigR3LZ8T/D3jvf3pvnTHxqymOIR
         ft7psENiX56WuT8b+g4l+9eUZzt9qYDSH57BsD3IPZx1UFZCX5KOIloWyhs8jMUwKO
         O24iy5kptW285tckEN0JR9SMK/PaE/jXBmeGuu8PDAbeg1IfuLEM4+VUYDKgvDXerA
         cxfyZxz3OsjPqYvSFR9k67j3TB1hBVWB/L+Tze/XJt+/eWEYZ/SZWYrkiVuXJs5w5s
         cVTEClyjHSxfg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lU3Qq-005i2H-EA; Wed, 07 Apr 2021 10:21:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/19] dt-bindings: don't use ../dir for doc references
Date:   Wed,  7 Apr 2021 10:20:45 +0200
Message-Id: <0b9d9190f20282ded3a8ea2695c1e4763e76cda6.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As documents have been renamed and moved around, their
references will break, but this will be unnoticed, as the
script which checks for it won't handle "../" references.

So, replace them by the full patch.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../input/touchscreen/resistive-adc-touch.txt    |  2 +-
 Documentation/devicetree/bindings/mfd/da9150.txt |  8 ++++----
 .../devicetree/bindings/mfd/motorola-cpcap.txt   | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
index 51456c0e9a27..fee0da12474e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
@@ -5,7 +5,7 @@ Required properties:
  - compatible: must be "resistive-adc-touch"
 The device must be connected to an ADC device that provides channels for
 position measurement and optional pressure.
-Refer to ../iio/iio-bindings.txt for details
+Refer to Documentation/devicetree/bindings/iio/iio-bindings.txt for details
  - iio-channels: must have at least two channels connected to an ADC device.
 These should correspond to the channels exposed by the ADC device and should
 have the right index as the ADC device registers them. These channels
diff --git a/Documentation/devicetree/bindings/mfd/da9150.txt b/Documentation/devicetree/bindings/mfd/da9150.txt
index f09b41fbdf47..763e0b639a82 100644
--- a/Documentation/devicetree/bindings/mfd/da9150.txt
+++ b/Documentation/devicetree/bindings/mfd/da9150.txt
@@ -15,13 +15,13 @@ Required properties:
 - reg: Specifies the I2C slave address
 - interrupts: IRQ line info for da9150 chip.
 - interrupt-controller: da9150 has internal IRQs (own IRQ domain).
-  (See ../interrupt-controller/interrupts.txt for
+  (See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
    further information relating to interrupt properties)
 
 Sub-devices:
-- da9150-gpadc: See ../iio/adc/da9150-gpadc.txt
-- da9150-charger: See ../power/da9150-charger.txt
-- da9150-fg: See ../power/da9150-fg.txt
+- da9150-gpadc: See Documentation/devicetree/bindings/iio/adc/da9150-gpadc.txt
+- da9150-charger: See Documentation/devicetree/bindings/power/da9150-charger.txt
+- da9150-fg: See Documentation/devicetree/bindings/power/da9150-fg.txt
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
index 5ddcc8f4febc..ebdccfb600b9 100644
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
@@ -16,14 +16,14 @@ Optional subnodes:
 The sub-functions of CPCAP get their own node with their own compatible values,
 which are described in the following files:
 
-- ../power/supply/cpcap-battery.txt
-- ../power/supply/cpcap-charger.txt
-- ../regulator/cpcap-regulator.txt
-- ../phy/phy-cpcap-usb.txt
-- ../input/cpcap-pwrbutton.txt
-- ../rtc/cpcap-rtc.txt
-- ../leds/leds-cpcap.txt
-- ../iio/adc/cpcap-adc.txt
+- Documentation/devicetree/bindings/power/supply/cpcap-battery.txt
+- Documentation/devicetree/bindings/power/supply/cpcap-charger.txt
+- Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
+- Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt
+- Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+- Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
+- Documentation/devicetree/bindings/leds/leds-cpcap.txt
+- Documentation/devicetree/bindings/iio/adc/cpcap-adc.txt
 
 The only exception is the audio codec. Instead of a compatible value its
 node must be named "audio-codec".
-- 
2.30.2

