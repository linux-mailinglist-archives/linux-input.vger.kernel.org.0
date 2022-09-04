Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557485AC518
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 17:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiIDPpq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 11:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiIDPpp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 11:45:45 -0400
Received: from smtpbg.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0EF28E0B
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 08:45:39 -0700 (PDT)
X-QQ-mid: bizesmtp90t1662306321tip94v1w
Received: from localhost.localdomain ( [182.148.14.80])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sun, 04 Sep 2022 23:45:15 +0800 (CST)
X-QQ-SSF: 01000000002000C0C000B00A0000000
X-QQ-FEAT: D6RqbDSxuq7nYvRqKV7DW/HBOzGOdZ1plErt1mwrlg8Dy5GHR7B7mMYjaA7vc
        dMDU8WX7iQH1W1lWQXqTH92Dl07zNgDWqOMD+xvkou3QjjxPS5f/we/+bnllVA1CF+9uufC
        xwQdhTui4PjPVIxRuBm0P30XUfEIqUxLoJzY8nQkCHOEyMMAIg+LHF35cWMWUCAnEdoRem6
        sTSBKu3Tb+/xFj3ggUXKUaIZgFwjoqPmFsiBufAcFc+6wuetGqx7YgUOqSOYwoJ3kIZeHlR
        W5/hUJATnv+yTuY65OYd9eN/IGGxZo40imTARIusemC7TbTz8oQYVtdJMtEtX06GqRGGygP
        /uq1G/BOtERlU40cNeYc026VroIGtv8nXzv3UP8sM3vfw71wWk=
X-QQ-GoodBg: 0
From:   Shaomin Deng <dengshaomin@cdjrlc.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] HID: sony: Fix double word in comments
Date:   Sun,  4 Sep 2022 11:45:15 -0400
Message-Id: <20220904154515.25143-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Remove the repeated word "not" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/hid/hid-sony.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 60ec2b29d54d..03691cdcfb8e 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -368,7 +368,7 @@ static const unsigned int buzz_keymap[] = {
 };
 
 /* The Navigation controller is a partial DS3 and uses the same HID report
- * and hence the same keymap indices, however not not all axes/buttons
+ * and hence the same keymap indices, however not all axes/buttons
  * are physically present. We use the same axis and button mapping as
  * the DS3, which uses the Linux gamepad spec.
  */
-- 
2.35.1

