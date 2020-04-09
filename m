Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECAD1A31D2
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 11:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgDIJeN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 05:34:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55631 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDIJeN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 05:34:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id e26so3193517wmk.5;
        Thu, 09 Apr 2020 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=67uXVtGyqRRv4+mM1rwWbvU8jQPRqKx+YuXMaJ9NqGA=;
        b=WmLEq0czmtzewp+g3u2GLrqymFWZSZcq2t+n3PUZj/MzBijf305G+Am6yKy5Vf3UMg
         vwsw5rIUSZB4iEi0vY1ye9y9cjaVwWDsMnx6At6zq3+NxGmQW2hW4/twsuQMFArgJHGn
         XtEOu5/drDfpjZKy/0jRzcn/vpj+6Qm3Vsk0wuRlhn7xnnubgcKIBkinoEXX03M1/Y4Q
         0Q3vef30EMkFZ4ETZqmTmzSn1GT+BzBdvImOSjLZuAtLdwckOEKbZ+S2ZGr3AHP+m3rT
         iS0wvljIyqh9Wj2dXJbYLdz1BFFvO3InzoEo1mMuqP8yr0YbLW1McQaDNioXzYA8yxT9
         6viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=67uXVtGyqRRv4+mM1rwWbvU8jQPRqKx+YuXMaJ9NqGA=;
        b=h4FtKsWV0jNTTNLwxcvZAS74Xk0uGHaifB/o5pSDNx2i+M+sUtVmRVyCekz3AkBpbR
         UlJI2ylawzZgO4JhNhqX7QnUEhs7sR3mCKXDTLNZDUxGk2/yEpeCvNy3gPIchKuME69P
         w1dJYGaaO5JeeEpP/FT7hmY4llFe6paF1Kf3xTo1B6jS1jFtvfW02eZRnv3cf9HC8d2z
         +MEvwgZVj2fWpQetgYtclX96EzkkyPKfJrD6LA3iyBJnLapUm3QUmjFSCq3gVZHL9zFa
         NUKVcPJMIGIQredQ9Q1EPNq6cZ2G5uHjLyfkoSPcmAq9fiVffKuhDQlVa52O9M7PEl/B
         gBzQ==
X-Gm-Message-State: AGi0PuZekO1+9tbUaFMFfnwb1w5hehSSiWrrd6yjRyZLvT3LKoLobipJ
        u9C+Z2tIuNaLQNA+Jwg4uu8=
X-Google-Smtp-Source: APiQypKAfQRE6oN3f19oLDnAqEtfzuL9GwjwZH7+4eymakiI+KML/r37WhWSXV/P/mnEc5wdttmlaw==
X-Received: by 2002:a1c:9891:: with SMTP id a139mr9095642wme.129.1586424852116;
        Thu, 09 Apr 2020 02:34:12 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id t16sm3019906wmi.27.2020.04.09.02.34.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:34:11 -0700 (PDT)
From:   Oliver Graute <oliver.graute@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     oliver.graute@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: edt-ft5x06 - fix crash on EDT EP0110M09
Date:   Thu,  9 Apr 2020 11:27:01 +0200
Message-Id: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Oliver Graute <oliver.graute@kococonnector.com>

remove edt_ft5x06_ts_readwrite() call because this result in a stack
corruption crash on EP011M09

[    2.968250] edt_ft5x06 1-0038: 1-0038 supply vcc not found, using dummy regulator
[    2.991327] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
[    3.011818] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x9e4/0xa98
[    3.022519] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.6.0-rc1-next-20200214+ #69
[    3.030261] Hardware name: Advantech iMX8QM DMSSE20 (DT)
[    3.035583] Workqueue: events deferred_probe_work_func
[    3.040724] Call trace:
[    3.043179]  dump_backtrace+0x0/0x1c0
[    3.046839]  show_stack+0x14/0x20
[    3.050161]  dump_stack+0xb4/0xfc
[    3.053477]  panic+0x158/0x320
[    3.056531]  print_tainted+0x0/0xa8
[    3.060015]  edt_ft5x06_ts_probe+0x9e4/0xa98
[    3.064286]  i2c_device_probe+0x2d0/0x2f8
[    3.068299]  really_probe+0xd8/0x438
[    3.071874]  driver_probe_device+0xdc/0x130
[    3.076064]  __device_attach_driver+0x88/0x108
[    3.080511]  bus_for_each_drv+0x74/0xc0
[    3.084349]  __device_attach+0xdc/0x160
[    3.088189]  device_initial_probe+0x10/0x18
[    3.092376]  bus_probe_device+0x90/0x98
[    3.096210]  device_add+0x434/0x770
[    3.099699]  device_register+0x1c/0x28
[    3.103447]  i2c_new_client_device+0x134/0x2a8
[    3.107897]  of_i2c_register_device+0xb0/0xd8
[    3.112253]  of_i2c_register_devices+0x9c/0x198
[    3.116780]  i2c_register_adapter+0x150/0x418
[    3.121141]  __i2c_add_numbered_adapter+0x58/0xa0
[    3.125849]  i2c_add_adapter+0x9c/0xc8
[    3.129598]  lpi2c_imx_probe+0x1b0/0x2a0
[    3.133523]  platform_drv_probe+0x50/0xa0
[    3.137534]  really_probe+0xd8/0x438
[    3.141105]  driver_probe_device+0xdc/0x130
[    3.145284]  __device_attach_driver+0x88/0x108
[    3.149731]  bus_for_each_drv+0x74/0xc0
[    3.153562]  __device_attach+0xdc/0x160
[    3.157394]  device_initial_probe+0x10/0x18
[    3.161581]  bus_probe_device+0x90/0x98
[    3.165412]  deferred_probe_work_func+0x88/0xd8
[    3.169942]  process_one_work+0x19c/0x320
[    3.173952]  worker_thread+0x1f0/0x420
[    3.177703]  kthread+0xf0/0x120
[    3.180843]  ret_from_fork+0x10/0x18
[    3.184432] SMP: stopping secondary CPUs
[    3.188362] Kernel Offset: disabled
[    3.191853] CPU features: 0x10002,2100600c
[    3.195951] Memory Limit: none

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 06aa8ba0b6d7..6fbc87d041a1 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -819,10 +819,6 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 	 * to have garbage in there
 	 */
 	memset(rdbuf, 0, sizeof(rdbuf));
-	error = edt_ft5x06_ts_readwrite(client, 1, "\xBB",
-					EDT_NAME_LEN - 1, rdbuf);
-	if (error)
-		return error;
 
 	/* Probe content for something consistent.
 	 * M06 starts with a response byte, M12 gives the data directly.
-- 
2.17.1

