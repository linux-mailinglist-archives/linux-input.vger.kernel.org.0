Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A43F21460F
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 15:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgGDN1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 09:27:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53688 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726682AbgGDN1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 09:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593869273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5NxMjAwaupGJxmY81BEdREN1Mn1ItlmRhIzouhl12Vs=;
        b=OA/STKKqL1Efo90RlDfNornxx+EjFN/e2xBS8dqm1Jv5icB7up6l6C5XwAcOHBpZmRhQgm
        XjqrFq5egXwQUaeuVjvX5h9PzlWk9UVwQwNPw1lr87HEVFomBfT6QoivTbJNFvh2mCrvIh
        7iw0vdSURlQHossijivAK5l5iQJwSTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-DX55469aMsSD0dzkThGDbQ-1; Sat, 04 Jul 2020 09:27:51 -0400
X-MC-Unique: DX55469aMsSD0dzkThGDbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEEF2BFC2;
        Sat,  4 Jul 2020 13:27:50 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0EB3760BF1;
        Sat,  4 Jul 2020 13:27:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/5] HID: lenovo: Rename fn_lock sysfs attr handlers to make them generic
Date:   Sat,  4 Jul 2020 15:27:40 +0200
Message-Id: <20200704132742.60197-4-hdegoede@redhat.com>
In-Reply-To: <20200704132742.60197-1-hdegoede@redhat.com>
References: <20200704132742.60197-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Except for a single call, there is nothing keyboard-model specific about
the cptkbd fn_lock sysfs attr handlers, rename them dropping the cptkbd
post-/pre-fix, so that they can be re-used for supporting Fn-lock on the
Thinkpad 10 ultrabook kbd.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index feb0cbc6742e..f2eb91704e9c 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -249,23 +249,23 @@ static void lenovo_features_set_cptkbd(struct hid_device *hdev)
 		hid_err(hdev, "Sensitivity setting failed: %d\n", ret);
 }
 
-static ssize_t attr_fn_lock_show_cptkbd(struct device *dev,
+static ssize_t attr_fn_lock_show(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", cptkbd_data->fn_lock);
+	return snprintf(buf, PAGE_SIZE, "%u\n", data->fn_lock);
 }
 
-static ssize_t attr_fn_lock_store_cptkbd(struct device *dev,
+static ssize_t attr_fn_lock_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value))
@@ -273,8 +273,14 @@ static ssize_t attr_fn_lock_store_cptkbd(struct device *dev,
 	if (value < 0 || value > 1)
 		return -EINVAL;
 
-	cptkbd_data->fn_lock = !!value;
-	lenovo_features_set_cptkbd(hdev);
+	data->fn_lock = !!value;
+
+	switch (hdev->product) {
+	case USB_DEVICE_ID_LENOVO_CUSBKBD:
+	case USB_DEVICE_ID_LENOVO_CBTKBD:
+		lenovo_features_set_cptkbd(hdev);
+		break;
+	}
 
 	return count;
 }
@@ -309,10 +315,10 @@ static ssize_t attr_sensitivity_store_cptkbd(struct device *dev,
 }
 
 
-static struct device_attribute dev_attr_fn_lock_cptkbd =
+static struct device_attribute dev_attr_fn_lock =
 	__ATTR(fn_lock, S_IWUSR | S_IRUGO,
-			attr_fn_lock_show_cptkbd,
-			attr_fn_lock_store_cptkbd);
+			attr_fn_lock_show,
+			attr_fn_lock_store);
 
 static struct device_attribute dev_attr_sensitivity_cptkbd =
 	__ATTR(sensitivity, S_IWUSR | S_IRUGO,
@@ -321,7 +327,7 @@ static struct device_attribute dev_attr_sensitivity_cptkbd =
 
 
 static struct attribute *lenovo_attributes_cptkbd[] = {
-	&dev_attr_fn_lock_cptkbd.attr,
+	&dev_attr_fn_lock.attr,
 	&dev_attr_sensitivity_cptkbd.attr,
 	NULL
 };
-- 
2.26.2

