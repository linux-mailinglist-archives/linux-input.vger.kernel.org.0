Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA906278EE8
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 18:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgIYQmx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 12:42:53 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:45231 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727324AbgIYQmx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 12:42:53 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Sep 2020 12:42:52 EDT
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e5dd1a0;
        Fri, 25 Sep 2020 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:mime-version:content-transfer-encoding;
         s=mail; bh=JWMY4uyRC4SFiDM35+MshVIEj8U=; b=cmU/JifrnG2NmOSf9tu/
        Kr2F3+3xB8yKlCcsVeU24BLNyC0rL37ho0i2XstujCLtGXoPGl9wrKA43eNVn0xY
        2eL3oOSVAGcO/QYV3GgI79q20DcoWdQk9mpvz9eR7pYGXbD4B58NmJiht/fZoTYs
        /k1DGWjkJJZ0ic3BA+9X0Bsld0cVlerwqMuDC6WcznoIIvM6g3BLMLCYDDhg8Fgf
        60gHZTdjNJfTOXhWL8hBV44W157Orp6K3n9bFOoXsw+iKl5W4K32/3ffD1jBUOuh
        A6p1v3f+nMCQNzaBWMS56iIj5AGNS9ZTDERn9EQ/oxs+RVWNakP9Sbf13YgdMEV7
        /g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eb7d8412 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 25 Sep 2020 16:05:06 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-input@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Lyude Paul <lyude@redhat.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Subject: [PATCH] Input: synaptics - enable InterTouch for ThinkPad X1E/P1 2nd gen
Date:   Fri, 25 Sep 2020 18:36:02 +0200
Message-Id: <20200925163602.204047-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the new RMI4 F3A support posted yesterday, this appears to maybe
work, with a bootloader warning in dmesg:

    psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4690]
    psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1160..]
    psmouse serio1: synaptics: Trying to set up SMBus access
    rmi4_smbus 0-002c: registering SMbus-connected sensor
--> rmi4_f34 rmi4-00.fn34: rmi_f34v7_probe: Unrecognized bootloader version
--> rmi4_f34: probe of rmi4-00.fn34 failed with error -22
    rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3512-010, fw id: 2956703
    input: Synaptics TM3512-010 as /devices/rmi4-00/input/input91
    serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
    psmouse serio4: trackpoint: Elan TrackPoint firmware: 0x11, buttons: 3/3
    input: TPPS/2 Elan TrackPoint as /devices/rmi4-00/rmi4-00.fn03/serio4/input/input92

Cc: Lyude Paul <lyude@redhat.com>
Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 8a54efd6eb95..9d6fec84047b 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -180,6 +180,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
 	"LEN0099", /* X1 Extreme 1st */
+	"LEN0402", /* X1 Extreme 2nd */
 	"LEN009b", /* T580 */
 	"LEN200f", /* T450s */
 	"LEN2044", /* L470  */
-- 
2.28.0

