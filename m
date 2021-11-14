Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2664044F642
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 03:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhKNC57 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 21:57:59 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:39995 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhKNC55 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 21:57:57 -0500
Received: from pozzuoli.feuerhuhn.de ([92.117.251.175]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MNtny-1n1OZN2qAi-00OGUu; Sun, 14 Nov 2021 03:54:57 +0100
From:   Claudia Pellegrino <linux@cpellegrino.de>
To:     linux@cpellegrino.de
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: magicmouse: prevent division by 0 on scroll
Date:   Sun, 14 Nov 2021 03:53:27 +0100
Message-Id: <20211114025327.146897-1-linux@cpellegrino.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mGXg6BJfPdn8N0NCFrx1l4W7ZqI0IagJ+TzTv4G3AHz+r/wIkhw
 sKCSu3MNyOf6SIm9eodFiWm85s5vh1zYD9W4Za7YWlIHMWVFjpXwlmkk1Opb5cpM0S0hwDO
 S3Yc2H3D2/lKCX3O9MFNo0KTB6ouX27A/e7zSTOgYDTp0WSIJinFRYFmZ3BDadgCCZPUsre
 pafK4BHH0jdgoMQK+LQHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4p7JbEE2q0g=:UjryHSX8FcTku0j8Rw8LQT
 h0sCqh7Ft2i/FZWNpSc3/QbuBC0QUk6C0yoL2S7hMR6G9AlXSf0eNGMjfMfc5uC1TaNkP8IIx
 BUE2C3MBdPT2cvk1VPyeJHNVBn/9fael4QdkUx/fE171mQwqwvw295b9tzTl249rE9ucoh/sJ
 zCua4pudi3mppT+046+8SFyrHDtb6ZVFdjPWkq9yLmOKVdJPG6KUpHbt0gF1X4Wl8qUjiVr64
 LPv6faj46M+rLxMh0r6t65pGFUzsuB5H7a7MpbijFIq+irjnzszv4wUtN20SrrG3sry1kRIT6
 F2YzaIOwG7SpXNDuHe9wp8KqchnfZK3VK8Iot9c+b52XRtapGlcW+Zbg1t7BKHg3+bJ7hU6Bc
 neqz3zN8xYzGczfVMSZzA6NODGO08DHu4gc0aMkjXawg+6pLm+uPZlFwNOTjxQShj5wR8F4jC
 /S1YlptcqiJQNzCDpQzCO9rxnZ10xlUwTDDqE4VSuIgFOvEulu2DyB+j+/WBCicM84zp4w2h2
 q3yTbdMwAEFM25ZwrH7ENKgRllyMCQ2yy9J9LMy4bbSDS83Pgamj+oMhd5fu4agkaUu3XZ8Mi
 3dZHlSj9goLq8acycl3EtKEUeiFRt9zs7tjAzZzeiEXs01ydTAn/tug5o7w8uJ4nc6uon5Klf
 UdWRNhJ7tfQ73WXI32+WEkk19+3zkhIxaFDPDn/LProUVeLSvi/S2hcBBCAj/vVAj7ht8QtKF
 F+9mEXRfLWFoR3Zv
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In hid_magicmouse, if the user has set scroll_speed to a value between
55 and 63 and scrolls seven times in quick succession, the
step_hr variable in the magicmouse_emit_touch function becomes 0.

That causes a division by zero further down in the function when
it does `step_x_hr /= step_hr`.

To reproduce, create `/etc/modprobe.d/hid_magicmouse.conf` with the
following content:

```
options hid_magicmouse scroll_acceleration=1 scroll_speed=55
```

Then reboot, connect a Magic Mouse and scroll seven times quickly.
The system will freeze for a minute, and after that `dmesg` will
confirm that a division by zero occurred.

Enforce a minimum of 1 for the variable so the high resolution
step count can never reach 0 even at maximum scroll acceleration.

Fixes: d4b9f10a0eb6 ("HID: magicmouse: enable high-resolution scroll")

Signed-off-by: Claudia Pellegrino <linux@cpellegrino.de>
---
 drivers/hid/hid-magicmouse.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 686788ebf3e1..d7687ce70614 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -256,8 +256,11 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		unsigned long now = jiffies;
 		int step_x = msc->touches[id].scroll_x - x;
 		int step_y = msc->touches[id].scroll_y - y;
-		int step_hr = ((64 - (int)scroll_speed) * msc->scroll_accel) /
-			      SCROLL_HR_STEPS;
+		int step_hr =
+			max_t(int,
+			      ((64 - (int)scroll_speed) * msc->scroll_accel) /
+					SCROLL_HR_STEPS,
+			      1);
 		int step_x_hr = msc->touches[id].scroll_x_hr - x;
 		int step_y_hr = msc->touches[id].scroll_y_hr - y;
 
-- 
2.33.1

