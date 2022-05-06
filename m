Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E89451DA71
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 16:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351123AbiEFO0P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 10:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238749AbiEFO0O (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 10:26:14 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED3C5A2C5
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 07:22:31 -0700 (PDT)
Received: from fsav315.sakura.ne.jp (fsav315.sakura.ne.jp [153.120.85.146])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 246EMScI083497;
        Fri, 6 May 2022 23:22:28 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav315.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp);
 Fri, 06 May 2022 23:22:28 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 246EMSHD083493
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 6 May 2022 23:22:28 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <25e2b787-cb2c-fb0d-d62c-6577ad1cd9df@I-love.SAKURA.ne.jp>
Date:   Fri, 6 May 2022 23:22:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] Input: psmouse-smbus - avoid flush_scheduled_work() usage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Flushing system-wide workqueues is dangerous and will be forbidden.
Replace system_wq with local psmouse_wq.

Link: https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Note: This patch is only compile tested.

 drivers/input/mouse/psmouse-smbus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
index 164f6c757f6b..e1b73dbeaa3b 100644
--- a/drivers/input/mouse/psmouse-smbus.c
+++ b/drivers/input/mouse/psmouse-smbus.c
@@ -26,6 +26,8 @@ struct psmouse_smbus_dev {
 static LIST_HEAD(psmouse_smbus_list);
 static DEFINE_MUTEX(psmouse_smbus_mutex);
 
+static struct workqueue_struct *psmouse_wq;
+
 static void psmouse_smbus_check_adapter(struct i2c_adapter *adapter)
 {
 	struct psmouse_smbus_dev *smbdev;
@@ -161,7 +163,7 @@ static void psmouse_smbus_schedule_remove(struct i2c_client *client)
 		INIT_WORK(&rwork->work, psmouse_smbus_remove_i2c_device);
 		rwork->client = client;
 
-		schedule_work(&rwork->work);
+		queue_work(psmouse_wq, &rwork->work);
 	}
 }
 
@@ -305,9 +307,14 @@ int __init psmouse_smbus_module_init(void)
 {
 	int error;
 
+	psmouse_wq = alloc_workqueue("psmouse-smbus", 0, 0);
+	if (!psmouse_wq)
+		return -ENOMEM;
+
 	error = bus_register_notifier(&i2c_bus_type, &psmouse_smbus_notifier);
 	if (error) {
 		pr_err("failed to register i2c bus notifier: %d\n", error);
+		destroy_workqueue(psmouse_wq);
 		return error;
 	}
 
@@ -317,5 +324,5 @@ int __init psmouse_smbus_module_init(void)
 void psmouse_smbus_module_exit(void)
 {
 	bus_unregister_notifier(&i2c_bus_type, &psmouse_smbus_notifier);
-	flush_scheduled_work();
+	destroy_workqueue(psmouse_wq);
 }
-- 
2.34.1
