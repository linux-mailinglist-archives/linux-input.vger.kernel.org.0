Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EFA25046
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbfEUN1r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34864 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728326AbfEUN1p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7CD9D8830C;
        Tue, 21 May 2019 13:27:45 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7A14610A1;
        Tue, 21 May 2019 13:27:38 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 04/10] dt-bindings: add more optional properties for elan_i2c touchpads
Date:   Tue, 21 May 2019 15:27:06 +0200
Message-Id: <20190521132712.2818-5-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 21 May 2019 13:27:45 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some new touchpads IC are connected through PS/2 and I2C. On some of these
new IC, the I2C part doesn't have all of the information available.
We need to be able to forward the touchpad parameters from PS/2 and
thus, we need those new optional properties.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

changes in v2:
- Use of generic touchscreen properties for min/max and resolutions
- add elan,middle-button
- add elan,*_traces
---
 Documentation/devicetree/bindings/input/elan_i2c.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan_i2c.txt b/Documentation/devicetree/bindings/input/elan_i2c.txt
index 797607460735..9963247706f2 100644
--- a/Documentation/devicetree/bindings/input/elan_i2c.txt
+++ b/Documentation/devicetree/bindings/input/elan_i2c.txt
@@ -13,9 +13,20 @@ Optional properties:
   pinctrl binding [1]).
 - vcc-supply: a phandle for the regulator supplying 3.3V power.
 - elan,trackpoint: touchpad can support a trackpoint (boolean)
+- elan,clickpad: touchpad is a clickpad (the entire surface is a button)
+- elan,middle-button: touchpad has a physical middle button
+- elan,x_traces: number of antennas on the x axis
+- elan,y_traces: number of antennas on the y axis
+- some generic touchscreen properties [2]:
+  * touchscreen-size-x
+  * touchscreen-size-y
+  * touchscreen-x-mm
+  * touchscreen-y-mm
+
 
 [0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 [1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
 
 Example:
 	&i2c1 {
-- 
2.21.0

