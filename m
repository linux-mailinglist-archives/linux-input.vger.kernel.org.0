Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076DBE7DAC
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 01:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfJ2A6Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 20:58:16 -0400
Received: from vps.xff.cz ([195.181.215.36]:51638 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbfJ2A6P (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 20:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572310693; bh=uU9Ed1alXCTlnQaio2JNHFayvG2JjVGihZ0Bc7pg244=;
        h=From:To:Cc:Subject:Date:References:From;
        b=TNSWyl2Ze999zgh7h9TR1ACGGQ+600wsxoAwo6/ah57BQv45WGNuo6SRGE63DXY8V
         nSNzXQ3IhZjgWgihIcrcbH+nBnLGRGmS/mpobvX0Wm/3PY5Bhi8rpDKTJfoUT7mRjl
         2z6VKA1md2oeqQvdJkkb5YkUlQMqrdPyqXMl2i78=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Ondrej Jirman <megous@megous.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] dt-bindings: input: edt-ft5x06: Add regulator support
Date:   Tue, 29 Oct 2019 01:58:05 +0100
Message-Id: <20191029005806.3577376-3-megous@megous.com>
In-Reply-To: <20191029005806.3577376-1-megous@megous.com>
References: <20191029005806.3577376-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Touch controller may have an optional regulator.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index 870b8c5cce9b..0f6950073d6f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -30,6 +30,7 @@ Required properties:
 Optional properties:
  - reset-gpios: GPIO specification for the RESET input
  - wake-gpios:  GPIO specification for the WAKE input
+ - vcc-supply:  Regulator that supplies the touchscreen
 
  - pinctrl-names: should be "default"
  - pinctrl-0:   a phandle pointing to the pin settings for the
-- 
2.23.0

