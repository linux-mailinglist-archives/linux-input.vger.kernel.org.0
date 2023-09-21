Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89317A9F4D
	for <lists+linux-input@lfdr.de>; Thu, 21 Sep 2023 22:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjIUUUy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Sep 2023 16:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbjIUUUN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Sep 2023 16:20:13 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A58561F3
        for <linux-input@vger.kernel.org>; Thu, 21 Sep 2023 10:17:51 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c43334badcso9545435ad.0
        for <linux-input@vger.kernel.org>; Thu, 21 Sep 2023 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695316671; x=1695921471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UvRP2TfqMYoWryE4cjFQULg+pydcORb0OjXIUY1wqrk=;
        b=j0GTqRLAj0g+P6ljPeN/a+9fYPbyHViMS1gpq8aW00pSsyOllQHcEDX8hvELgMBD4T
         wB8vuBwHuTIyXjW+YPElrJ0G2v1AD46xqB58IK3ZF/A8Cub9VmmYcuDEdXcMnlI1vSCv
         CKbJp2G/RK9dND8nnJTRPIwdOXbvSGCB/EjXVgqehy1Tx3QPtAsYemrBOdqYwOW9iz0m
         GR35m1lHcWp8mUHCV2uBgUsaKEnxwWMOocKed/SmDRCsMSEnmyugF6nRRwhzrYs0N6z0
         yzS3sSjQ49qrXQpWx8aSc2hRdRVwxt9KjJZfiC7651XceOzwgySdf63U65al7/JlXWtC
         S+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316671; x=1695921471;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvRP2TfqMYoWryE4cjFQULg+pydcORb0OjXIUY1wqrk=;
        b=jVK5H9EjZJ5swTapDhvSUCXMhC3gASuEYgBo6UyUiHmf9sQRbddc9XM+89IAxhT52r
         +BqV89hHezbXqHrEOVZ4cGYB51ijL71MCORoDClWlSCZ4+9lxyK06EuIZkYl53mYl55b
         hhOXgklho3JnYP/LjS1MUZferd1EkWuK8Zuh7VAVsU9O5cW1Wo9VJsiAFN7Up4whcJ43
         U5xs7hBtsiGicdB1h4rRsfaXawMYuDOUB7bKAej9oepy5hIOasbEWJnG9Ts16EFVhJKG
         9qUyNXJ3a0KRMtSo+sqh2rBsVz+/LPioIAJyX2ipmDxZfukVQYAzas23lK8mQPUjL8NP
         m08A==
X-Gm-Message-State: AOJu0YwD/FGo9xxErBgxh7CQEJcYsmPH5rqJGAXxDkRXwx+7MYTr8NYp
        GzSbByzsc4W6Aa+arbOYoobV3jfBIXjWn9PCVw==
X-Google-Smtp-Source: AGHT+IG2Yj4B6f5Tc0Rfcf05CQVFSDA0RjwtjZ26D7TwaHMo12AIN3tJQTbDdw8rZkT3SSBitMany2q06U1RnGKdFA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1704:b0:d64:f7ec:6d5d with
 SMTP id by4-20020a056902170400b00d64f7ec6d5dmr74413ybb.10.1695290292498; Thu,
 21 Sep 2023 02:58:12 -0700 (PDT)
Date:   Thu, 21 Sep 2023 09:58:11 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALITDGUC/x2NywqDMBAAf0X23AXzqKC/IkVCXOsejGFXpUX89
 8ZeBuYyc4KSMCl01QlCByuvqYh5VBDnkN6EPBYHW1tXt9agbpJi/uIofJAocsr7hrKwvzFMzmN EH5rWP51pIgUoqSw08ee/6V/X9QNQGac9dgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695290291; l=1427;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=j36xxcAKXhVsbdky0Obg3UV1f7PgSu4ObXF+TdHlQCQ=; b=Pb35PYt7fwpSsE9B2qcuVWUq286nCf7oXfw7i0nvTKQhWQ6J+VwYyKR6k0TFykxTVFMxIx2xi
 11/P/koHLdmCZR549wEcVOW/DbyUc2TtEX9Y9vD/emSCyTPjYvAmZp9
X-Mailer: b4 0.12.3
Message-ID: <20230921-strncpy-drivers-input-rmi4-rmi_f34-c-v1-1-4aef2e84b8d2@google.com>
Subject: [PATCH] Input: synaptics-rmi4 - replace deprecated strncpy
From:   Justin Stitt <justinstitt@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

`strncpy` is deprecated for use on NUL-terminated destination strings [1]

Let's use memcpy() as the bounds have already been checked and this
decays into a simple byte copy from one buffer to another removing any
ambiguity that strncpy has.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Similar to Kees' suggestion here [2]

[2]: https://lore.kernel.org/all/202309142045.7CBAE940E@keescook/
---
 drivers/input/rmi4/rmi_f34.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
index 0d9a5756e3f5..3b3ac71e53dc 100644
--- a/drivers/input/rmi4/rmi_f34.c
+++ b/drivers/input/rmi4/rmi_f34.c
@@ -471,7 +471,7 @@ static ssize_t rmi_driver_update_fw_store(struct device *dev,
 	if (buf[count - 1] == '\0' || buf[count - 1] == '\n')
 		copy_count -= 1;
 
-	strncpy(fw_name, buf, copy_count);
+	memcpy(fw_name, buf, copy_count);
 	fw_name[copy_count] = '\0';
 
 	ret = request_firmware(&fw, fw_name, dev);

---
base-commit: 2cf0f715623872823a72e451243bbf555d10d032
change-id: 20230921-strncpy-drivers-input-rmi4-rmi_f34-c-4a6945316cea

Best regards,
--
Justin Stitt <justinstitt@google.com>

