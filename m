Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0A0EFF85
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 15:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730881AbfKEOSW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 09:18:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43387 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfKEOSW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 09:18:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id l24so14280279pgh.10;
        Tue, 05 Nov 2019 06:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Z2WSsWHskG0Pcep27ldnUGqnlUWbGBs3tUsEl7VTNg=;
        b=Grx+b/45s85SXtn0Wr6DjrCIJnGZQ8Pa9I2baoFxnu+f7l2EbvIp9SsOOLmjQpD3Ly
         rmM2j1e7nzhVQpQSC3+l0VpPuyuMxN3y2O3CyiA6ICyiCwmGx2Jj03Qla/tCIqKNlJhZ
         t8qzUtlsqD/2I5Llc5ZdtqAQxiXD4C7e++Jv3GfFjTvo8MAEoQr44xPAMZq3hg78562W
         rgYGWg3ho9xmzhU6b6SnVAAi2APSUv+H4LTUWdOJP0k87AsGyzjCHkDzKNCRzxkNxCgc
         Wrv1yCwManKRlctajUcMItls6VjNDsmHUElDluD+lT9U/NkniNgONe4xFWjW0qH9mVxV
         hF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Z2WSsWHskG0Pcep27ldnUGqnlUWbGBs3tUsEl7VTNg=;
        b=bZEFDqqfIZsUooPAbr2VngQxQhh9XdptlhVIG8BMzgK+cEvAJlcy92duV3ptrRAAPi
         zFdX37pYXhc1Y/N90NqRBc8LDwlVYelEEuU/U7mv23UnYv5OHwcBgMmTCvGCqS9uzlGF
         dCVZsllWHcX3JOEO2ksjJ1Qkry/yaw6FzQMobG+PBxc8cHy3gpdDAlBIT0rANbf51V0o
         glxBD/qdpwuHbiI13BgswaFrNZpGCuzoOuBtmhJda2Wes0qEJDlvQermNspwM9odQgJs
         sD9HlGPiQHlbmACKfMV9Fks6ZwasWWOQ4B52TzJkFUkmdFysF6sNgOaJhH6ppQFVMBQA
         8f4w==
X-Gm-Message-State: APjAAAVZezUSAEFyCkOFMffMykxmnuVP53cEaJU096FHAgRdE5p7E1QS
        SFW8qxcCQSB0tkaO4Jjt6jQ=
X-Google-Smtp-Source: APXvYqzb/nzpT7KuncJqUZQMA+17dC4pT0+4mfv5HD4WhVk3nvQV/eiQ4o/gGThLszu22+ZHjNLclQ==
X-Received: by 2002:a62:8010:: with SMTP id j16mr38341159pfd.249.1572963501755;
        Tue, 05 Nov 2019 06:18:21 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
        by smtp.gmail.com with ESMTPSA id w2sm25246691pgm.18.2019.11.05.06.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 06:18:20 -0800 (PST)
From:   Phong Tran <tranmanphong@gmail.com>
To:     benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Phong Tran <tranmanphong@gmail.com>,
        syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
Subject: [PATCH] HID: hid-lg4ff: Fix uninit-value set_autocenter_default
Date:   Tue,  5 Nov 2019 21:18:07 +0700
Message-Id: <20191105141807.27054-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot found a problem using of uinit pointer in
lg4ff_set_autocenter_default().

Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com

Tested by syzbot:

https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/hid/hid-lg4ff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index 5e6a0cef2a06..44dfd08b0c32 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
 static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
 {
 	struct hid_device *hid = input_get_drvdata(dev);
-	s32 *value;
+	s32 *value = NULL;
 	u32 expand_a, expand_b;
-	struct lg4ff_device_entry *entry;
-	struct lg_drv_data *drv_data;
+	struct lg4ff_device_entry *entry = NULL;
+	struct lg_drv_data *drv_data = NULL;
 	unsigned long flags;
 
 	drv_data = hid_get_drvdata(hid);
-- 
2.20.1

