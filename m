Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02285347F78
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbhCXRel (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237246AbhCXReT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:19 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9340C0613DE
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:18 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id dm8so28614528edb.2
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7SaTEj4RTZdOjBa5WGjzyPtQsvCc3pHayG7DFxx2S1o=;
        b=cfvDkL+QyMuw03bMTs6Zs1dlBvGt1Szs9b0ItOn88asw3tEJ23o32vAG2nprNZIdY1
         /siEXJ/WQ8IqsSQyHcx1I0iR8lM5ytepWCfZ29b/VYmt5xsuClfsffRlGXXu2Ao3HHGK
         /A8xxJjIyM0rcKZqZwu6XmEoTk4TTyJ2Pm/stY03leBC8SaxMY4rLiVl3GaragheVwx7
         3rbUlxvMarIcrjo/mUpLDK5Z/Lg5c4WtfbXqflVOhoFvc5QFC2Xmizv/u3gsUUPRfNCj
         MetuLv7tHhqHdP7LNuSsWRgUoSkHggypVZdw9HUkN5rWvkx8uFyiMPZbRJ8K40dglx00
         oqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7SaTEj4RTZdOjBa5WGjzyPtQsvCc3pHayG7DFxx2S1o=;
        b=svY7jdGpMj0hB9NIIDIMtTPD85xYk5BBStuI3p/D5zlByzbfMnHy4xPqb2yUpb05lA
         Gc80Jv9Ae9r8x1XrCH6VRyZ4vCxHB4SQq8pI/n1dskrG64C5U/rxwcD2rR9yKKAaHOey
         1MMwDwNlGNhmjbwxuxwyrLJ7BlFBQn66qK2/u3HI+tkYub2e6utgcvIJr16yjZyVWGMB
         /ER7ZdU8xnGGQ3T5pHKcmK3PK2dFFYVJU2clzslZ3q0PHZOMxr6cSc8At+/JQy67L+Pm
         wU+0A9OKLNHD1G/jDLMFFYE0o5Tvz3pSsI+u7toOwlAexdRGw6vSvx1NSkSQz7G18kqD
         OPBQ==
X-Gm-Message-State: AOAM532oLQrPUSF9ArLyKOz1c4drQxCrtxwv4Jn2K13/YvmHjHdYEaLz
        YCvBWfeJ2coB8F25v1qDEc67IA==
X-Google-Smtp-Source: ABdhPJzbP13FGjsMEuWXswh25w1dlfhwzJLC/jdccNUJbOu/BhohpWlvimC9u+JtsVmFJmWdMQLkOQ==
X-Received: by 2002:a05:6402:c8:: with SMTP id i8mr4729387edu.57.1616607257536;
        Wed, 24 Mar 2021 10:34:17 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Masaki Ota <masaki.ota@jp.alps.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 09/25] HID: hid-alps: Correct struct misnaming
Date:   Wed, 24 Mar 2021 17:33:48 +0000
Message-Id: <20210324173404.66340-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-alps.c:113: warning: expecting prototype for struct u1_data. Prototype was for struct alps_dev instead

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Masaki Ota <masaki.ota@jp.alps.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index 6b665931147df..2b986d0dbde46 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -74,7 +74,7 @@ enum dev_num {
 	UNKNOWN,
 };
 /**
- * struct u1_data
+ * struct alps_dev
  *
  * @input: pointer to the kernel input device
  * @input2: pointer to the kernel input2 device
-- 
2.27.0

