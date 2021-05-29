Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8742394CAD
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhE2PQP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 11:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50555 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229800AbhE2PQP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 11:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622301278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3Kh8T+AK8scQOjBC5Y4/SiEqv6hgY4HLxT3AttZvNDo=;
        b=P1nut5tXVYlpdfugh+j9jBW4pmJCAP6cpoN9PdFcudRoJzAlrix8BWbtXPJEyNRbn4rhOU
        nDDt+iIVUWz5ggiiZAKcE+e8CSpNTDdrcv7t1ApTXoxv2a3Y8bHd9nloO+xy/9FRuvAcUg
        05iaBOSX2GOJdHSTaTLmM3+UuRE5VDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-W5Pmr6_aPHuE64K3jGt43g-1; Sat, 29 May 2021 11:14:34 -0400
X-MC-Unique: W5Pmr6_aPHuE64K3jGt43g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9A59107ACCA;
        Sat, 29 May 2021 15:14:33 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-39.ams2.redhat.com [10.36.112.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE3D6100AE43;
        Sat, 29 May 2021 15:14:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/4] HID: logitech-dj: Implement may_wakeup ll-driver callback
Date:   Sat, 29 May 2021 17:14:23 +0200
Message-Id: <20210529151424.12212-4-hdegoede@redhat.com>
In-Reply-To: <20210529151424.12212-1-hdegoede@redhat.com>
References: <20210529151424.12212-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Without a ll-driver callback hid_hw_may_wakeup() will return:
device_may_wakeup(hdev->dev.parent), but for the hid devices
instantiated by logitech-dj for devices behind the receiver the
logitech-dj hid(pp)-device is the parent.

Add a logi_dj_ll_may_wakeup() callback which calls hid_hw_may_wakeup()
on the logitech-dj hid(pp) parent-hid-device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-dj.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 18d37b3765f3..a0017b010c34 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1497,6 +1497,13 @@ static void logi_dj_ll_stop(struct hid_device *hid)
 	dbg_hid("%s\n", __func__);
 }
 
+static bool logi_dj_ll_may_wakeup(struct hid_device *hid)
+{
+	struct dj_device *djdev = hid->driver_data;
+	struct dj_receiver_dev *djrcv_dev = djdev->dj_receiver_dev;
+
+	return hid_hw_may_wakeup(djrcv_dev->hidpp);
+}
 
 static struct hid_ll_driver logi_dj_ll_driver = {
 	.parse = logi_dj_ll_parse,
@@ -1505,6 +1512,7 @@ static struct hid_ll_driver logi_dj_ll_driver = {
 	.open = logi_dj_ll_open,
 	.close = logi_dj_ll_close,
 	.raw_request = logi_dj_ll_raw_request,
+	.may_wakeup = logi_dj_ll_may_wakeup,
 };
 
 static int logi_dj_dj_event(struct hid_device *hdev,
-- 
2.31.1

