Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7AF710796F
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 21:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKVU0D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 15:26:03 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44332 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVU0D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 15:26:03 -0500
Received: by mail-pg1-f194.google.com with SMTP id e6so3831911pgi.11;
        Fri, 22 Nov 2019 12:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=JDYXarROpC1eNzKna2zZoOdAaSL8sfvjdyuyZruxS+E=;
        b=vUGgAy80y2xWW/M+12ob23BwpxER1hYdVUIRe98rzR6go6PGmxcTYQgl+XkxFj5gS+
         v7cXpPLwMZANDABm7dcVcsGhZmMVjuWtSxla+KMTWGi9zmvyVlx4NeyjeKhodPgkz3Ab
         k3tbQfoI1ferSJq38LO40+0HHiQ6xLNdI7Xxu095SE+Qo9bbMBaE9i1cfNRys7SIkNER
         ZInz8ZoxaPua3ZTIrcELtAyeGQc4UFKEySdPTIPoQOH6nKdjxdRxAjE+Yfp4T8YAjDvl
         wYUWUjzbJaK28/XLfJq5NOSwm8+cqWYQPxKQzSv/mxuxIF2JJE1gPC0C9A3f8puO9djZ
         FeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=JDYXarROpC1eNzKna2zZoOdAaSL8sfvjdyuyZruxS+E=;
        b=la2GWZHaDL093Xqi/rGaq50lD+ZocdI+udbE9oCm0xk8mYNz2ImOzM9RamhkgiLV2S
         5jk2iDLe79ee6hyQbgRA964v2IQo8MwuFs3nQ5lem2IvZDAB4GY96A/IN+syvvr9aVAm
         b3frKf43fThso5W7VaPuwFUNQiaPFSSCh79gcDEAKWkJGkT3ZEY3wVpRyxDEmYRTl1Mm
         G7/3LM+HYbvdoXyhZlncE/3cDXuoCk5pQ+Y/YytkQT5gJ6mmXpwgDSzHI69wwakHLbLC
         yqF+xQ+apUi0jl1I/zanOu3U20geaVlzqDI+qqObNsFDdE7CfDBETahaw3quGdT8UNXP
         ARAw==
X-Gm-Message-State: APjAAAVAs2fFQSpJ8bsOjukGiYa0RS082Ydg8gaiH0r5T5GgoLPn9WEG
        LfncAlgzbnxYm1iCu4TNM+Y=
X-Google-Smtp-Source: APXvYqyIZv1Tw3m3Gm4B0c++BYkqj7DCwbAQuYD5xuFf8mX9fCzF00qF0RjN/qNg5S3VSzfpUPVHwA==
X-Received: by 2002:a65:5a4d:: with SMTP id z13mr10661479pgs.21.1574454362505;
        Fri, 22 Nov 2019 12:26:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id fz12sm3656086pjb.15.2019.11.22.12.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 12:26:01 -0800 (PST)
Date:   Fri, 22 Nov 2019 12:25:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hid-input: clear unmapped usages
Message-ID: <20191122202559.GA71021@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We should not be leaving half-mapped usages with potentially invalid
keycodes, as that may confuse hidinput_find_key() when the key is
located by index, which may end up feeding way too large keycode into
the VT keyboard handler and cause OOB write there:

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

In this case we were dealing with a fuzzed HID device that declared over
12K buttons:

https://syzkaller.appspot.com/bug?extid=19340dff067c2d3835c0

Reported-by: syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

I'll be putting a guard into drivers/tty/vt/keyboard.c as well.
Please consider for stable.

 drivers/hid/hid-input.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 63855f275a38..3957d1c4d967 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1215,9 +1215,11 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
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
2.24.0.432.g9d3f5f5b63-goog


-- 
Dmitry
