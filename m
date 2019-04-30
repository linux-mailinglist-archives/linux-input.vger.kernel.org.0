Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0261110000
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 20:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfD3S7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 14:59:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:38476 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726209AbfD3S7S (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 14:59:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4B8C4AC9A;
        Tue, 30 Apr 2019 18:59:17 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux-kernel@vger.kernel.org
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] Input: edt-ft5x06 - add support for polled configuration
Date:   Tue, 30 Apr 2019 20:58:59 +0200
Message-Id: <20190430185859.24015-2-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430185859.24015-1-nsaenzjulienne@suse.de>
References: <20190430185859.24015-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices might not provide an interrupt line for the touchscreen.
In that case the driver defaults to using a polled interface.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index 870b8c5cce9b..2605994a1257 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -24,10 +24,14 @@ Required properties:
            or:  "focaltech,ft6236"
 
  - reg:         I2C slave address of the chip (0x38)
- - interrupts:       interrupt specification for the touchdetect
-                     interrupt
 
 Optional properties:
+- interrupts: interrupt specification for the touchdetect interrupt, if not
+	      supplied the driver will deafult to polling.
+
+- poll-interval: Poll interval time in milliseconds, only relevant if no
+		 interrupt was provided.
+
  - reset-gpios: GPIO specification for the RESET input
  - wake-gpios:  GPIO specification for the WAKE input
 
-- 
2.21.0

