Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE96155E69
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2020 19:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgBGSua (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Feb 2020 13:50:30 -0500
Received: from mail-vs1-f47.google.com ([209.85.217.47]:46981 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgBGSua (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Feb 2020 13:50:30 -0500
Received: by mail-vs1-f47.google.com with SMTP id t12so221339vso.13
        for <linux-input@vger.kernel.org>; Fri, 07 Feb 2020 10:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Uwbx/c1BR3A8J7N/oJicdhvE+PcyZpoETC2f4CkpxIc=;
        b=KolheCZmDYa+A5aAHyR6CRwTWe/jUFImfQrcW/CpWNqOt/r/sCouP/EXKcWVTv7Khr
         2ciNgD/HYPomi42BRzlDoAWYQNhE4Oibkb+6FAgqYLB1mkUkP5dWzbiyF4OY1e1xfS6f
         oAi0XW26SplmVHQt/LZR9OCTyjwnXS/B1r6dS1SDCRR93OqUavC6bJzOgBi9Ma7lRoJQ
         ICLF4lKkL9yfYKQZKQ/k9X0rXky13rYum5tZ9/XUIy1FFkSQyrVOicfoy9M6MJpxVevO
         Y/CR/TWLs4z5S83dvBxm3VgZEBQ2w9pTYZPOUpAI0rS148UNPzlmS9snJHb8W7A+ggUo
         Mw1Q==
X-Gm-Message-State: APjAAAXhH8FCVLbQyXKgKPmJvsZqvHUw+63DWrHSzWFaWcTyF+24kKj1
        xVcZJfTiqRMVM0uwqPWRU5XEHFQrTh1qXw==
X-Google-Smtp-Source: APXvYqwe1O2jpu+hBjQUcLNFIHaIno4pyxkFGKlRpjv1yDpJzcp/Otr8qImkhTCCSEGDzNTP4QmxUw==
X-Received: by 2002:a67:ad06:: with SMTP id t6mr413318vsl.87.1581101429066;
        Fri, 07 Feb 2020 10:50:29 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id o16sm1112030vsa.3.2020.02.07.10.50.28
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 10:50:28 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id v141so226491vsv.12
        for <linux-input@vger.kernel.org>; Fri, 07 Feb 2020 10:50:28 -0800 (PST)
X-Received: by 2002:a05:6102:52e:: with SMTP id m14mr376479vsa.25.1581101428323;
 Fri, 07 Feb 2020 10:50:28 -0800 (PST)
MIME-Version: 1.0
From:   Gaurav Agrawal <agrawalgaurav@gnome.org>
Date:   Sat, 8 Feb 2020 00:20:16 +0530
X-Gmail-Original-Message-ID: <CADdtggVzVJq5gGNmFhKSz2MBwjTpdN5YVOdr4D3Hkkv=KZRc9g@mail.gmail.com>
Message-ID: <CADdtggVzVJq5gGNmFhKSz2MBwjTpdN5YVOdr4D3Hkkv=KZRc9g@mail.gmail.com>
Subject: Input: synaptics - enable SMBus on ThinkPad L470
To:     linux-input@vger.kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchpad LEN2044 to the list, as it is capable of working with
psmouse.synaptics_intertouch=1

Signed-off-by: Gaurav Agrawal <agrawalgaurav@gnome.org>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1ae6f8bba9ae1..6947772cfc405 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -179,6 +179,7 @@ static const char * const smbus_pnp_ids[] = {
     "LEN0097", /* X280 -> ALPS trackpoint */
     "LEN009b", /* T580 */
     "LEN200f", /* T450s */
+    "LEN2044", /* L470  */
     "LEN2054", /* E480 */
     "LEN2055", /* E580 */
     "SYN3052", /* HP EliteBook 840 G4 */
