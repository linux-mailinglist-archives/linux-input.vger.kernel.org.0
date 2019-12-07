Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6852115EB5
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2019 22:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGVFW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 16:05:22 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36573 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGVFW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Dec 2019 16:05:22 -0500
Received: by mail-pl1-f193.google.com with SMTP id k20so4163929pls.3;
        Sat, 07 Dec 2019 13:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=QG5kX6AYM8tSMzecYPD64LS8jMJM8DZLST+q6ta/2R8=;
        b=NDomRTLZknql092NSwD/Y9OitpXT2rn4y9sSxZyiEfunpy5JKwaFi39JwRUEKL/W80
         NxbbN9mMZhIomhuPjn9GjKLSIikz6eDKZOyL1n4ACzcX8kwxPuUJXIiNfFg2TII2CP3q
         QB3epT60v4rTAht6X2hIQqhI88Zlp3uH7gOgGGpGHTiZjIatNyglUL6dsStfwjgeWmBY
         UWFvBTR12shDt4BiSIoO3Fmf/9zc3OwkS537mM+EvoAsoUZRYcpbdOdvYDW6NmnZeK+s
         2slKrPzhmxtyafjDmHwVlir2PoKFhSOZuUMbEe3mbZHWmTzKDVXRIYv57u4x5Dv5NXTw
         w/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=QG5kX6AYM8tSMzecYPD64LS8jMJM8DZLST+q6ta/2R8=;
        b=AEVYjdo2E/mFJKCWL9yilD3CBHSVxgco7hrEwZmcpizyfYfI7e34VwHgKeOc7vQg8D
         LKnTKpflC3OD8taL9mfNrVHFHUmkr9uCw5bnG44Ue5rRd8WAIJp5cSvmmtz0edlYZDXi
         oiYlWNk5ih1t2U97Af+FrFEGQnb6Q5FPmZ1OXCdSuveTMYAlR+oBdEl6K4qensEYzLw6
         +68/lTuIkA+mwrklKJbVX43UoN4G4AzHIZBiYT1G2dbq6GFG1ZhF65bfJ4tG5zoh/jeT
         xK414xgkE3kcmeA3JAqHZoG5238eHz6fQ8KbiKqHGE3v2RSDn5qqMGFnXPZA83flmSzh
         mL2g==
X-Gm-Message-State: APjAAAVAXw3ZKey6294KHj6M+zlNm4Im+qX+YzGziR4rLWxZxBKFJJYL
        32VMXG7RGFyVexQdUHu4kuc=
X-Google-Smtp-Source: APXvYqwQN+C5vYeDE1APuPCTco4rVzaYRrWtxyK5ZSNAUvQvqzPmEbbdbVPxcw1y7aX+NhpNeDj1ow==
X-Received: by 2002:a17:90a:e291:: with SMTP id d17mr24114314pjz.116.1575752721245;
        Sat, 07 Dec 2019 13:05:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m13sm19203025pga.70.2019.12.07.13.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 13:05:20 -0800 (PST)
Date:   Sat, 7 Dec 2019 13:05:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: hid-input: clear unmapped usages
Message-ID: <20191207210518.GA181006@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We should not be leaving half-mapped usages with potentially invalid
keycodes, as that may confuse hidinput_find_key() when the key is located
by index, which may end up feeding way too large keycode into the VT
keyboard handler and cause OOB write there:

BUG: KASAN: global-out-of-bounds in clear_bit include/asm-generic/bitops-instrumented.h:56 [inline]
BUG: KASAN: global-out-of-bounds in kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
BUG: KASAN: global-out-of-bounds in kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
Write of size 8 at addr ffffffff89a1b2d8 by task syz-executor108/1722
...
 kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
 kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
 input_to_handler+0x3b6/0x4c0 drivers/input/input.c:118
 input_pass_values.part.0+0x2e3/0x720 drivers/input/input.c:145
 input_pass_values drivers/input/input.c:949 [inline]
 input_set_keycode+0x290/0x320 drivers/input/input.c:954
 evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
 evdev_do_ioctl drivers/input/evdev.c:1150 [inline]

Reported-by: syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: fixed up interaction with hid-multitouch according to Benjamin's
feedback

Please consider tagging for stable.

 drivers/hid/hid-input.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 63855f275a38..9428f49fd218 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1132,9 +1132,15 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	}
 
 mapped:
-	if (device->driver->input_mapped && device->driver->input_mapped(device,
-				hidinput, field, usage, &bit, &max) < 0)
-		goto ignore;
+	if (device->driver->input_mapped &&
+	    device->driver->input_mapped(device, hidinput, field, usage,
+					 &bit, &max) < 0) {
+		/*
+		 * The driver indicated that no further generic handling
+		 * of the usage is desired.
+		 */
+		return;
+	}
 
 	set_bit(usage->type, input->evbit);
 
@@ -1215,9 +1221,11 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		set_bit(MSC_SCAN, input->mscbit);
 	}
 
-ignore:
 	return;
 
+ignore:
+	usage->type = 0;
+	usage->code = 0;
 }
 
 static void hidinput_handle_scroll(struct hid_usage *usage,
-- 
2.24.0.393.g34dc348eaf-goog


-- 
Dmitry
