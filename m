Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D21439716
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 15:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbhJYNH3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 09:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbhJYNH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 09:07:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89818C061745;
        Mon, 25 Oct 2021 06:05:05 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D73BFE0A;
        Mon, 25 Oct 2021 15:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635167103;
        bh=HHQktu/Xe0KUuqSdOBW/xmiFyItT3nR/qljwo82gocY=;
        h=From:To:Cc:Subject:Date:From;
        b=duXedLYDDdLO3oONcnqZUyNNCkMjGnwDee8yd6HuFMMiyoBIa3QEuaBcbBDtElB8x
         /OySjhBOUtZukVStrMHZ+QjllLGq+xmMbem4v6Oq4he+lNT8W69BFVUugK3Bdjfd4x
         IB2Gzp9hxpzaqy4dHSRuNAGwZq0Q/pCmgP1Jno4s=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW46 switch support
Date:   Mon, 25 Oct 2021 14:04:57 +0100
Message-Id: <20211025130457.935122-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Add support for SW46-1 and SW46-2 as switches using the gpio-keys
framework.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
v2:
 - Don't adjust the pin-config bias

SW_LID and SW_DOCK are selected as low-impact switch events for the
default configuration. Would SW_RFKILL_ALL, and SW_MUTE_DEVICE be
preferred as more 'functional' defaults? (I have otherwise avoided these
to hopefully prevent unwanted / undocumented effects occuring on
development hardware running a full interface which may parse these)

I'd expect them to be overridden by any platform using them anyway.

Testing this with evtest on the board shows this:

	kbingham@falcon-v3u:~$ sudo evtest /dev/input/by-path/platform-keys-event
	Input driver version is 1.0.1
	Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x100
	Input device name: "keys"
	Supported events:
	  Event type 0 (EV_SYN)
	  Event type 1 (EV_KEY)
	    Event code 2 (KEY_1)
	    Event code 3 (KEY_2)
	    Event code 4 (KEY_3)
	  Event type 5 (EV_SW)
	    Event code 0 (SW_LID) state 0
	    Event code 5 (SW_DOCK) state 0
	Properties:
	Testing ... (interrupt to exit)
	Event: time 1635166698.832665, type 5 (EV_SW), code 5 (SW_DOCK), value 1
	Event: time 1635166698.832665, -------------- SYN_REPORT ------------
	Event: time 1635166701.661119, type 5 (EV_SW), code 0 (SW_LID), value 1
	Event: time 1635166701.661119, -------------- SYN_REPORT ------------
	Event: time 1635166711.453056, type 5 (EV_SW), code 5 (SW_DOCK), value 0
	Event: time 1635166711.453056, -------------- SYN_REPORT ------------
	Event: time 1635166712.791572, type 5 (EV_SW), code 0 (SW_LID), value 0
	Event: time 1635166712.791572, -------------- SYN_REPORT ------------

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 1fe0cf0dcc99..0ca21a057530 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -83,6 +83,24 @@ keys {
 		pinctrl-0 = <&keys_pins>;
 		pinctrl-names = "default";
 
+		sw-1 {
+			gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			label = "SW46-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		sw-2 {
+			gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_DOCK>;
+			linux,input-type = <EV_SW>;
+			label = "SW46-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
 		key-1 {
 			gpios = <&gpio6 18 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_1>;
-- 
2.30.2

