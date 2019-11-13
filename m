Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C340FAA42
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 07:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfKMGhP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 01:37:15 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44636 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfKMGhO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 01:37:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id q26so926793pfn.11;
        Tue, 12 Nov 2019 22:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=voR8XQk2CC3vnccynDlGH9xxP2Lq83CWSGXGxEUwD7A=;
        b=cGFxbyyj/3qQrrutSScWLNTMv2UWUdyZFsXeqM/6A6Mg946RO5J2bi1MlMZoMrT3Bf
         6qtgs86jdQJhBWbD6xRRC5wP6EhhdAHEuxFpVGYoDGUAsYyVRzHfhmQoovkWvoixBGFw
         +ZzMJaNiaYElvD2w+B5TzR72Qg/Ai8G6757j6/12nONbLqlcK8wz1pINfnblKqDA7Gi8
         WfN0fUk94Vz7aEZCfgZ389kWf+lGw0az+4IRjRr2Tfi1cumDkA2EHCDaZMgtVyBxIrmf
         Iu+Fys2/7i0UWjIxiq9NAQEZ52sTn8JGBKhaz93/fHPgEGblUfUc9a9J/rVVWv9KJ/Lu
         xOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=voR8XQk2CC3vnccynDlGH9xxP2Lq83CWSGXGxEUwD7A=;
        b=dTp8CPJpMHPSJ96Puj7+DRO27V6Ffg4X54f7C1DT6UmKXSABxorf8i5nh31hJti1nm
         CaTpjeSLt2CPkzl3P1VDnEmS51h14KcRuft31dWkoQ4vi9os6TGNzeuGg3AZjE2881ra
         cSkI5Csj4Mrav4HZTz5Up8SpT+bsmp0hulWwWAgR9hNMMGQPZiMX5dgRBNa+rIOQ4jCo
         KhgfVnh/lmnoIS2RxkwwtkD2Gs4ZXGsyg09w2Mw6OLeMCEVdPXbIRgqml4qhokQ2Zi3K
         4fBEuNGuk4kdEhKMQjCt6x/r4/fwrzAWR+OsydwfrUJ18kEJMyQHhh3BPEsqPReQp7o+
         bUbg==
X-Gm-Message-State: APjAAAUWzCgfjj1wb6kAkYSTtVsiIW/Jy1Um3rDB1rMM3o0LXzA/JeN8
        xcAMc9Uzt6FVVTRp/UoW1JU=
X-Google-Smtp-Source: APXvYqzyZdy2Y11hisqEHnoMiavn/ffHFdr/fBWi7fBCfeAcMFAqb9Cfh+4fMY/o1m5PE6veSJM5OA==
X-Received: by 2002:a63:c60f:: with SMTP id w15mr1842093pgg.33.1573627034238;
        Tue, 12 Nov 2019 22:37:14 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id o7sm1531920pjo.7.2019.11.12.22.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 22:37:13 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: synaptics-rmi4 - add missed operations in remove
Date:   Wed, 13 Nov 2019 14:36:56 +0800
Message-Id: <20191113063656.8713-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver forgets to deal with work and workqueue in remove like what
is done when probe fails.
Add the missed operations to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/rmi4/rmi_f54.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 710b02595486..2c0cde5c775c 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -730,6 +730,9 @@ static void rmi_f54_remove(struct rmi_function *fn)
 
 	video_unregister_device(&f54->vdev);
 	v4l2_device_unregister(&f54->v4l2);
+	cancel_delayed_work_sync(&f54->work);
+	flush_workqueue(f54->workqueue);
+	destroy_workqueue(f54->workqueue);
 }
 
 struct rmi_function_handler rmi_f54_handler = {
-- 
2.23.0

