Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104C122ED18
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 15:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgG0NWX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 09:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0NWW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 09:22:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81F7C061794;
        Mon, 27 Jul 2020 06:22:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v4so7519682ljd.0;
        Mon, 27 Jul 2020 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OOdN5rtYtSqSIyhrvd8kf6giI99N3nmLV7XvxeNhlH4=;
        b=KIeSHUMdRaPdGvjUMUTznrlbtG0ImwqDcv68Wo+mxrYoAx0FJFGCu6sLVTpAJe6f+6
         QUKFFbI7xmswBQm9XWqVMInrk7n+DcCxyGU+jqfemEklkWEu2woelRHwqPuFzWUJ17I9
         G04zyuYq4gtqqGzf25qveOm0qNydcQ5mLKBIg7ino/MzbAUMUE6Cb1zjaRzbt/GGRu/q
         GLKuSWkCbGpeNi90Dw+rf9/xo5CgEHu9ps7ywNmayw1ciGS5E6VzaBIt2PPSEJpgZc7q
         ETYTFpR3O7waxbkAO9R7bdCa4BxKHlls3Qio2L0Vp+XpyuJtD74QYGScjVkjjky6VMYu
         66YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OOdN5rtYtSqSIyhrvd8kf6giI99N3nmLV7XvxeNhlH4=;
        b=fvrkmgdiMuYpXX9dCMkXQKonw8sla1c0pN3DOJghLdSjVAoa1HoeROv0/om0Pl+muF
         XR1EjA6Yg9/bTat43OEo31Ixs1pLdRTO9xx1E9hyCmDbq/3rTi9xF1MhAK5LOs2vVHVu
         51d12x7w2lC7jvmRy1YS3sjqm5XC75395UzgGEv1zsF3tHK/Q0FBbYeMc8Gi9FliBq0K
         QmtbtQwH4ZDi/gg3nfYMln9lr4nOwiwYBuXwy9/CMnZs9RRiWUHs4z3q6BuTsHIcz+rD
         YV6iW9xTaY4LJ2h8PbjN0CrK51e8q1ykOF7AjkhD4f7wddfY/vP8ZHZvo2MVlHOc/o+t
         szwQ==
X-Gm-Message-State: AOAM533qGMVrum9dkPOuYoZPueumTglCaCWe6q8N5Venysnad7ZY465S
        UC8Oihco9wZADD1GcLLqJFQ=
X-Google-Smtp-Source: ABdhPJyjWIViHeV/RNiYTKxNBp7PmpTurt18cFDQ8kqpKI8poKSxdv2pH8mWq+H5ud9bOCp4hGG6rA==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr3492848ljh.213.1595856140307;
        Mon, 27 Jul 2020 06:22:20 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id s9sm501813ljh.46.2020.07.27.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 06:22:19 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmlambea@gmail.com, alexhenrie24@gmail.com,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/2] HID: macally: Constify macally_id_table
Date:   Mon, 27 Jul 2020 15:22:00 +0200
Message-Id: <20200727132200.32510-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
References: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

macally_id_table is not modified and can be made const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/hid/hid-macally.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-macally.c b/drivers/hid/hid-macally.c
index 9a4fc7dffb14..aea46e522008 100644
--- a/drivers/hid/hid-macally.c
+++ b/drivers/hid/hid-macally.c
@@ -29,7 +29,7 @@ static __u8 *macally_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
-static struct hid_device_id macally_id_table[] = {
+static const struct hid_device_id macally_id_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SOLID_YEAR,
 			 USB_DEVICE_ID_MACALLY_IKEY_KEYBOARD) },
 	{ }
-- 
2.27.0

