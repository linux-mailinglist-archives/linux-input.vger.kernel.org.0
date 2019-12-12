Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 207B811D381
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 18:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbfLLRPs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 12:15:48 -0500
Received: from mail-qt1-f202.google.com ([209.85.160.202]:38349 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730065AbfLLRPs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 12:15:48 -0500
Received: by mail-qt1-f202.google.com with SMTP id u9so1837042qte.5
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2019 09:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=v2c9ZfhsjHl5yHeRsOkptCzwopqKyi8H+GjnL6ViNEI=;
        b=vrj3NH1ShlxM4YyYe0HqMM/dwIJ/fbhT+APeMTYtYoOG+CRXgaspmBasE4ErJdIIKi
         jKDBAG0QKul7viwQpYW6XAA0Zjs/OwBkQtBf1K05wZYbMMI0opQwGyzT+YsfLr3OMqla
         lDjR73vpeODB04Fr5k9u1dyE32YCXQ30LDRoDe1gHq4pwTdmfL8rUSdCJbvdFP3l45dg
         SR5r6aA/6DzNNbzAod12aErBMfwYaNEoTYiQcLyDBmiLButXvXObMUCU5tGqskbDvrJ2
         qfdxvJXSBSxcvZeWKiOarc8KAVx2GSe2x7sH+SPYxcSWpwQcQCSL3928o15KVRmxBP0Q
         KJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=v2c9ZfhsjHl5yHeRsOkptCzwopqKyi8H+GjnL6ViNEI=;
        b=VsD/DjPbRkhKxOliQ1qpgTPFX3154vSI2qHsG+kWQ3J1S6LypjTrzlhSU3CPzhFb9o
         TSeAAVNVGw3wYBIjNH5l7gmI/L6qNn2D0i1Gcd/OPvUSayotX5I1p9skn0MIZrKFE4tH
         Ua+QuIiPY4WJoRmRjrbQ0NnAuPa+Mg7e5U+hylRwFomI9zmmLj1mVOoVLc5zeTEgnsiQ
         dC3iom346YFW64fJobq9uR/Nu2Dg1k5M2CF/UDX8qYenX7Z19C/xRS+aGP7a9zYhgY2i
         5kJTGUUKVciAjQXR5VzzCw47Ea3bAsaM9ve5gmuDKznL+pCxjWnxs7QwPfvuFIwpIeRI
         gIDg==
X-Gm-Message-State: APjAAAVIhw1Av3r9IEuAFpjHubTafgvTBubjL1DMF1oKfFcmj8yXI22o
        4WQukP/+t5b/M34r9kecBLbAj6sdaxL3owOh
X-Google-Smtp-Source: APXvYqzGw/ZgJf+JgIA+hGU/h4Uovf7mUvA8SaZcjm27w1n/jWOAvB9sAKZXyMLIHaH8dKOK3BumvDPhvQx5uZWo
X-Received: by 2002:ac8:6f2d:: with SMTP id i13mr4821925qtv.133.1576170946867;
 Thu, 12 Dec 2019 09:15:46 -0800 (PST)
Date:   Thu, 12 Dec 2019 18:15:37 +0100
Message-Id: <cover.1576170740.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH RFC 0/2] kcov: collect coverage from usbhid interrupts
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset extends kcov to allow collecting coverage from interrupts
and then uses the new functionality to collect coverage from usbhid code.

What I'm not sure yet about this change is if we actually want to
selectively annotate some parts of the USB stack that are executed in
interrupt context, or maybe we can do this with some common approach.

For example patch #2 in this patchset annotates all functions that are
passed as completion callbacks to usb_fill_*() in drivers/hid/usbhid.
Maybe instead we could redefine usb_fill_*() in a way that would handle
all such cases without manual annotations.

Any suggestions are welcome.

This has allowed to find at least one new HID bug [1], which was recently
fixed by Alan [2].

[1] https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
[2] https://patchwork.kernel.org/patch/11283319/

This patchset has been pushed to the public Linux kernel Gerrit instance:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2225

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Andrey Konovalov (2):
  kcov: collect coverage from interrupts
  HID: usbhid: kcov: add annotations for coverage collection

 Documentation/dev-tools/kcov.rst   |  16 +--
 drivers/hid/usbhid/hid-core.c      |  25 +++-
 drivers/hid/usbhid/usbkbd.c        |  15 ++-
 drivers/hid/usbhid/usbmouse.c      |   7 +-
 drivers/usb/gadget/udc/dummy_hcd.c |   1 +
 include/linux/sched.h              |   3 +
 kernel/kcov.c                      | 196 +++++++++++++++++++----------
 lib/Kconfig.debug                  |   9 ++
 8 files changed, 192 insertions(+), 80 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

