Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526CB359F22
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 14:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbhDIMsR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Apr 2021 08:48:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:41706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233700AbhDIMsO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Apr 2021 08:48:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 576E661105;
        Fri,  9 Apr 2021 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617972481;
        bh=5g0cRFYhpT9pHmxDhrAZZ6Eolwn7Fu7K1Sqq1u6bUJg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VJeuPooIz4av0dEmA/C351EJKFBr6KZ0Mcoe36zH1dSZ9JXruQO5veImCiDUhmrkb
         C5dP7+nB7c/E3G5j3a5e1RBGFZ0ZgQPGxoooV+WYZvmAt5LTu3wuZndmIQQuro+pGL
         QbqJGHW8mOz/i2m0ReF+VFQ7MLHXcMhlvwZGzlKJawEIYQhxJFHyLVam207nis3WMa
         wJm3UXESaeZQEuqSBtGs9ery7Vo39HncECuhLVywg1qHxFzKNH/gPFik6O1JdiYSsZ
         3rKKgG9eXiQkf7eG3lPFhwhl+hKsHqQxD+3SlOhGKKK7fOQqgymfYgfsgbpgzjF5YU
         SAkjqjL0z5mCA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUqYE-001SLg-4i; Fri, 09 Apr 2021 14:47:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] dt-bindings: don't use ../dir for doc references
Date:   Fri,  9 Apr 2021 14:47:45 +0200
Message-Id: <68d3a1244119d1f2829c375b0ef554cf348bc89f.1617972339.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617972339.git.mchehab+huawei@kernel.org>
References: <cover.1617972339.git.mchehab+huawei@kernel.org>
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
 .../devicetree/bindings/mfd/motorola-cpcap.txt   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

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

