Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EF9452B7F
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 08:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhKPHZe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 02:25:34 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34660
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229618AbhKPHZa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 02:25:30 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B3E583F199
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 07:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637047346;
        bh=ID3WIsgZl9SDidK2mmKZ24iZuE1jseo2tZCCh1re1Qk=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=e+zIWrQRiLPoSJ9n4BlQxK9L72LSJrqSzVJiRiJhXhGSpYYv4ORbXnOftuP5rMpCi
         CGuydQ/S0LT5YXv3Bh9iuCkS/TfbdSwNXJbI3hotLHZJ8Ek5ZupjMyYJJ1lxgHXz+A
         uXYGv8p3f4rGMCPfVGX1EXWJgSlfFJUmWk+BVX/fydajhPEG174cQVl8sUxvG0xw8Q
         4d8u85F0Du+26F/xUBDp5dPk+tvCqzAN4bHopXC35OwlC/xQY8CPxXpjt0sjalOMv+
         KWt8fWkp2SAkF3yROKhn7KWOx1uyBtHEbkOybNknh7yJCZfYoZ/Xjt0qsLVrjxNfs+
         12cseu4UkIbbA==
Received: by mail-ed1-f69.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso4333541edb.15
        for <linux-input@vger.kernel.org>; Mon, 15 Nov 2021 23:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ID3WIsgZl9SDidK2mmKZ24iZuE1jseo2tZCCh1re1Qk=;
        b=S9YgFM+fVEm1oxeaWB4j0Ok0fyggP5/uAl/PgvHCTUTXDIkye51F7y+MOetpgZSGeS
         SIUDY41hLvZ4Zonz0VpkchVoKFvEYPfotMypAAV90yOoA3A36VU0lhwWcf+Jpxkdbblf
         Dxpd4ShOOYOM5NnEprSgGI0BWvZ3vrT/K3IotEziqQYz6ezOY6cnsi0hB0slO2eM5kif
         mu16gmwWu38CGH8uyuFlVHOm3DGbauR8gFFbt0SW9pWpwK2umgh6XlKOP46akMGoehug
         ulIPhUBcQHuNQ+CcxXQ7Nnqr0W4f5BV7apEazrdRHLIJH0+zW93Bd1CSzotSc6TBRLfQ
         gZNA==
X-Gm-Message-State: AOAM532AYJ14nlfUHtrE4eMaaNrPTIZmX81Ks3MY8oL6OQGyrEEW7oo1
        2JJhwiTNXnMFptnFp8NaED4k3K7EoMRBRYqytqJ5gfHM7NAfm1VXdTfMEjIKJP7P8ESioE+qa0N
        opxfYVH8aQMeawyUiUqQwCfT6VhwGsiMe5RBR779T
X-Received: by 2002:a05:6402:51cf:: with SMTP id r15mr7201984edd.385.1637047346355;
        Mon, 15 Nov 2021 23:22:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwi/yw3HU2W0dpyGW2EVXWzMiKTzntrWr8o/ghsFIkb446UplTOif+7ApQSLGjFfcP/1Ztug==
X-Received: by 2002:a05:6402:51cf:: with SMTP id r15mr7201950edd.385.1637047346070;
        Mon, 15 Nov 2021 23:22:26 -0800 (PST)
Received: from arighi-desktop.homenet.telecomitalia.it ([2001:67c:1560:8007::aac:c1b6])
        by smtp.gmail.com with ESMTPSA id m16sm79776edd.58.2021.11.15.23.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 23:22:25 -0800 (PST)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Phoenix Huang <phoenix@emc.com.tw>, Wolfram Sang <wsa@kernel.org>,
        jingle.wu@emc.com.tw,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] Input: elantech - Fix stack out of bound access in elantech_change_report_id()
Date:   Tue, 16 Nov 2021 08:22:23 +0100
Message-Id: <20211116072223.8746-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The array param[] in elantech_change_report_id() must be at least 3
bytes, because elantech_read_reg_params() is calling ps2_command() with
PSMOUSE_CMD_GETINFO, that is going to access 3 bytes from param[], but
it's defined in the stack as an array of 2 bytes, therefore we have a
potential stack out-of-bounds access here, also confirmed by KASAN:

[    6.512374] BUG: KASAN: stack-out-of-bounds in __ps2_command+0x372/0x7e0
[    6.512397] Read of size 1 at addr ffff8881024d77c2 by task kworker/2:1/118

[    6.512416] CPU: 2 PID: 118 Comm: kworker/2:1 Not tainted 5.13.0-22-generic #22+arighi20211110
[    6.512428] Hardware name: LENOVO 20T8000QGE/20T8000QGE, BIOS R1AET32W (1.08 ) 08/14/2020
[    6.512436] Workqueue: events_long serio_handle_event
[    6.512453] Call Trace:
[    6.512462]  show_stack+0x52/0x58
[    6.512474]  dump_stack+0xa1/0xd3
[    6.512487]  print_address_description.constprop.0+0x1d/0x140
[    6.512502]  ? __ps2_command+0x372/0x7e0
[    6.512516]  __kasan_report.cold+0x7d/0x112
[    6.512527]  ? _raw_write_lock_irq+0x20/0xd0
[    6.512539]  ? __ps2_command+0x372/0x7e0
[    6.512552]  kasan_report+0x3c/0x50
[    6.512564]  __asan_load1+0x6a/0x70
[    6.512575]  __ps2_command+0x372/0x7e0
[    6.512589]  ? ps2_drain+0x240/0x240
[    6.512601]  ? dev_printk_emit+0xa2/0xd3
[    6.512612]  ? dev_vprintk_emit+0xc5/0xc5
[    6.512621]  ? __kasan_check_write+0x14/0x20
[    6.512634]  ? mutex_lock+0x8f/0xe0
[    6.512643]  ? __mutex_lock_slowpath+0x20/0x20
[    6.512655]  ps2_command+0x52/0x90
[    6.512670]  elantech_ps2_command+0x4f/0xc0 [psmouse]
[    6.512734]  elantech_change_report_id+0x1e6/0x256 [psmouse]
[    6.512799]  ? elantech_report_trackpoint.constprop.0.cold+0xd/0xd [psmouse]
[    6.512863]  ? ps2_command+0x7f/0x90
[    6.512877]  elantech_query_info.cold+0x6bd/0x9ed [psmouse]
[    6.512943]  ? elantech_setup_ps2+0x460/0x460 [psmouse]
[    6.513005]  ? psmouse_reset+0x69/0xb0 [psmouse]
[    6.513064]  ? psmouse_attr_set_helper+0x2a0/0x2a0 [psmouse]
[    6.513122]  ? phys_pmd_init+0x30e/0x521
[    6.513137]  elantech_init+0x8a/0x200 [psmouse]
[    6.513200]  ? elantech_init_ps2+0xf0/0xf0 [psmouse]
[    6.513249]  ? elantech_query_info+0x440/0x440 [psmouse]
[    6.513296]  ? synaptics_send_cmd+0x60/0x60 [psmouse]
[    6.513342]  ? elantech_query_info+0x440/0x440 [psmouse]
[    6.513388]  ? psmouse_try_protocol+0x11e/0x170 [psmouse]
[    6.513432]  psmouse_extensions+0x65d/0x6e0 [psmouse]
[    6.513476]  ? psmouse_try_protocol+0x170/0x170 [psmouse]
[    6.513519]  ? mutex_unlock+0x22/0x40
[    6.513526]  ? ps2_command+0x7f/0x90
[    6.513536]  ? psmouse_probe+0xa3/0xf0 [psmouse]
[    6.513580]  psmouse_switch_protocol+0x27d/0x2e0 [psmouse]
[    6.513624]  psmouse_connect+0x272/0x530 [psmouse]
[    6.513669]  serio_driver_probe+0x55/0x70
[    6.513679]  really_probe+0x190/0x720
[    6.513689]  driver_probe_device+0x160/0x1f0
[    6.513697]  device_driver_attach+0x119/0x130
[    6.513705]  ? device_driver_attach+0x130/0x130
[    6.513713]  __driver_attach+0xe7/0x1a0
[    6.513720]  ? device_driver_attach+0x130/0x130
[    6.513728]  bus_for_each_dev+0xfb/0x150
[    6.513738]  ? subsys_dev_iter_exit+0x10/0x10
[    6.513748]  ? _raw_write_unlock_bh+0x30/0x30
[    6.513757]  driver_attach+0x2d/0x40
[    6.513764]  serio_handle_event+0x199/0x3d0
[    6.513775]  process_one_work+0x471/0x740
[    6.513785]  worker_thread+0x2d2/0x790
[    6.513794]  ? process_one_work+0x740/0x740
[    6.513802]  kthread+0x1b4/0x1e0
[    6.513809]  ? set_kthread_struct+0x80/0x80
[    6.513816]  ret_from_fork+0x22/0x30

[    6.513832] The buggy address belongs to the page:
[    6.513838] page:00000000bc35e189 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1024d7
[    6.513847] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
[    6.513860] raw: 0017ffffc0000000 dead000000000100 dead000000000122 0000000000000000
[    6.513867] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[    6.513872] page dumped because: kasan: bad access detected

[    6.513879] addr ffff8881024d77c2 is located in stack of task kworker/2:1/118 at offset 34 in frame:
[    6.513887]  elantech_change_report_id+0x0/0x256 [psmouse]

[    6.513941] this frame has 1 object:
[    6.513947]  [32, 34) 'param'

[    6.513956] Memory state around the buggy address:
[    6.513962]  ffff8881024d7680: f2 f2 f2 f2 f2 00 00 f3 f3 00 00 00 00 00 00 00
[    6.513969]  ffff8881024d7700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    6.513976] >ffff8881024d7780: 00 00 00 00 f1 f1 f1 f1 02 f3 f3 f3 00 00 00 00
[    6.513982]                                            ^
[    6.513988]  ffff8881024d7800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    6.513995]  ffff8881024d7880: 00 f1 f1 f1 f1 03 f2 03 f2 03 f3 f3 f3 00 00 00
[    6.514000] ==================================================================

Define param[] in elantech_change_report_id() as an array of 3 bytes to
prevent the out-of-bounds access in the stack.

Fixes: e4c9062717fe ("Input: elantech - fix protocol errors for some trackpoints in SMBus mode")
BugLink: https://bugs.launchpad.net/bugs/1945590
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 drivers/input/mouse/elantech.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d0bc029619f..172a3c5db58f 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1575,7 +1575,7 @@ static const struct dmi_system_id no_hw_res_dmi_table[] = {
  */
 static int elantech_change_report_id(struct psmouse *psmouse)
 {
-	unsigned char param[2] = { 0x10, 0x03 };
+	unsigned char param[3] = { 0x10, 0x03 };
 
 	if (elantech_write_reg_params(psmouse, 0x7, param) ||
 	    elantech_read_reg_params(psmouse, 0x7, param) ||
-- 
2.32.0

