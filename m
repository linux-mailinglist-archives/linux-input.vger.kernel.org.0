Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE2872F49F
	for <lists+linux-input@lfdr.de>; Wed, 14 Jun 2023 08:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243099AbjFNGUT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 02:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242637AbjFNGUS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 02:20:18 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720091FE2
        for <linux-input@vger.kernel.org>; Tue, 13 Jun 2023 23:19:55 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4QgwJ8171BzBQJYg
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 14:19:52 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1686723591; x=1689315592; bh=jNVldVMSRTJ6ERLuIjU7xi8o/Nk
        +m5sjKQw9Qa9l4DI=; b=ja8WQ9UOHSQKpZzPIZrwzX++2FVPfBYan44yxnNcJG1
        5s6PPQblMOn2GZMG2KTm44VHy8+IPkJMa1W1Lol7ht10DD+3rEIMxat0fTPPALWc
        7cH+2+lpiiQldIkd75KzPtaGMT5ieULtUw9TB30ogUuFOXCWxFtBuJbyuxyP8q6V
        TkMOYojjALJFLAYTVeotK1NsYt4c9AImnrjcpcGldJdsPPjhb8cw8/JCgJyKHU8Y
        IaR8nikp8+G1w5QXnG+GvD9B6WQY/0a+7QP0UpIJdjnPIJFrymu9yVvJlnu6ccYC
        D0DE+/KQ7N4PSS13iXHoYXyhAPg5IxId/6eyVNUGHRA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id svBVKby-6RAn for <linux-input@vger.kernel.org>;
        Wed, 14 Jun 2023 14:19:51 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4QgwJ75kvyzBJLB3;
        Wed, 14 Jun 2023 14:19:51 +0800 (CST)
MIME-Version: 1.0
Date:   Wed, 14 Jun 2023 14:19:51 +0800
From:   wuyonggang001@208suo.com
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] HID: lenovo: Replacing snprintf with scnprintf
In-Reply-To: <af4c99853e8abcbba13e406e6e432148@208suo.com>
References: <20230613070323.60965-1-zhanglibing@cdjrlc.com>
 <af4c99853e8abcbba13e406e6e432148@208suo.com>
User-Agent: Roundcube Webmail
Message-ID: <0b350326a7dcf246c8a63449b35e9ea4@208suo.com>
X-Sender: wuyonggang001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RDNS_NONE,SPF_HELO_FAIL,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following coccicheck warning:

drivers/hid/hid-lenovo.c:786:8-16: WARNING: use scnprintf or sprintf

Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
---
  drivers/hid/hid-lenovo.c | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 44763c0da444..147fcf69d235 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -537,7 +537,7 @@ static ssize_t attr_fn_lock_show(struct device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n", data->fn_lock);
+    return scnprintf(buf, PAGE_SIZE, "%u\n", data->fn_lock);
  }

  static ssize_t attr_fn_lock_store(struct device *dev,
@@ -581,7 +581,7 @@ static ssize_t attr_sensitivity_show_cptkbd(struct 
device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n",
+    return scnprintf(buf, PAGE_SIZE, "%u\n",
          cptkbd_data->sensitivity);
  }

@@ -753,7 +753,7 @@ static ssize_t 
attr_press_to_select_show_tpkbd(struct device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n", 
data_pointer->press_to_select);
+    return scnprintf(buf, PAGE_SIZE, "%u\n", 
data_pointer->press_to_select);
  }

  static ssize_t attr_press_to_select_store_tpkbd(struct device *dev,
@@ -783,7 +783,7 @@ static ssize_t attr_dragging_show_tpkbd(struct 
device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n", data_pointer->dragging);
+    return scnprintf(buf, PAGE_SIZE, "%u\n", data_pointer->dragging);
  }

  static ssize_t attr_dragging_store_tpkbd(struct device *dev,
@@ -813,7 +813,7 @@ static ssize_t 
attr_release_to_select_show_tpkbd(struct device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n", 
data_pointer->release_to_select);
+    return scnprintf(buf, PAGE_SIZE, "%u\n", 
data_pointer->release_to_select);
  }

  static ssize_t attr_release_to_select_store_tpkbd(struct device *dev,
@@ -843,7 +843,7 @@ static ssize_t attr_select_right_show_tpkbd(struct 
device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n", 
data_pointer->select_right);
+    return scnprintf(buf, PAGE_SIZE, "%u\n", 
data_pointer->select_right);
  }

  static ssize_t attr_select_right_store_tpkbd(struct device *dev,
@@ -873,7 +873,7 @@ static ssize_t attr_sensitivity_show_tpkbd(struct 
device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n",
+    return scnprintf(buf, PAGE_SIZE, "%u\n",
          data_pointer->sensitivity);
  }

@@ -902,7 +902,7 @@ static ssize_t attr_press_speed_show_tpkbd(struct 
device *dev,
      struct hid_device *hdev = to_hid_device(dev);
      struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);

-    return snprintf(buf, PAGE_SIZE, "%u\n",
+    return scnprintf(buf, PAGE_SIZE, "%u\n",
          data_pointer->press_speed);
  }
