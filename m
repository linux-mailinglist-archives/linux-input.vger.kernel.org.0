Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86B65AB289
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 15:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236291AbiIBN6U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 09:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237129AbiIBN53 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 09:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70870C3F68
        for <linux-input@vger.kernel.org>; Fri,  2 Sep 2022 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662125422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bC0Kw7kfTxOXFsmn4/dN6pihWblDj+jyGbCd41TYnXA=;
        b=itK8dRfbrWKcF+7lvk1vU7YSNDT5kdNjdG+J2OpkbaWKVPGWVdgZQDopjRmbIPap4NtS+/
        ZWQgm4fatqDCX+xB7tSPLH8Bc4z19pai711dDGI3f8iFvX1p2j9bzFczX/bA1EetTRw5/v
        muSXManFfg1rnaEyTLW55yCgaKb5Fn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-sR0Nfe7dMzuhyfjZKMQuPA-1; Fri, 02 Sep 2022 09:30:16 -0400
X-MC-Unique: sR0Nfe7dMzuhyfjZKMQuPA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F755823F13;
        Fri,  2 Sep 2022 13:30:15 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.193.218])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C2427492CA2;
        Fri,  2 Sep 2022 13:30:11 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>
Cc:     Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH bpf-next v10 08/23] HID: core: store the unique system identifier in hid_device
Date:   Fri,  2 Sep 2022 15:29:23 +0200
Message-Id: <20220902132938.2409206-9-benjamin.tissoires@redhat.com>
In-Reply-To: <20220902132938.2409206-1-benjamin.tissoires@redhat.com>
References: <20220902132938.2409206-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This unique identifier is currently used only for ensuring uniqueness in
sysfs. However, this could be handful for userspace to refer to a specific
hid_device by this id.

2 use cases are in my mind: LEDs (and their naming convention), and
HID-BPF.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

---

no changes in v10

no changes in v9

no changes in v8

no changes in v7

no changes in v6

new in v5
---
 drivers/hid/hid-core.c | 4 +++-
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b7f5566e338d..a00dd43db8bf 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2739,10 +2739,12 @@ int hid_add_device(struct hid_device *hdev)
 			hid_warn(hdev, "bad device descriptor (%d)\n", ret);
 	}
 
+	hdev->id = atomic_inc_return(&id);
+
 	/* XXX hack, any other cleaner solution after the driver core
 	 * is converted to allow more than 20 bytes as the device name? */
 	dev_set_name(&hdev->dev, "%04X:%04X:%04X.%04X", hdev->bus,
-		     hdev->vendor, hdev->product, atomic_inc_return(&id));
+		     hdev->vendor, hdev->product, hdev->id);
 
 	hid_debug_register(hdev, dev_name(&hdev->dev));
 	ret = device_add(&hdev->dev);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 4363a63b9775..a43dd17bc78f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -658,6 +658,8 @@ struct hid_device {							/* device report descriptor */
 	struct list_head debug_list;
 	spinlock_t  debug_list_lock;
 	wait_queue_head_t debug_wait;
+
+	unsigned int id;						/* system unique id */
 };
 
 #define to_hid_device(pdev) \
-- 
2.36.1

