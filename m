Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A6248EAC4
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 14:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241304AbiANNd4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 08:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241295AbiANNd4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 08:33:56 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5332C06161C
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 05:33:55 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d19so15765764wrb.0
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vFopuQifYDi+69/YOS3FtXomAJ3p0gkydigw8chDQ0=;
        b=a5nSqjObrDQ4Lo5GFtrtp+8nCr/2mklxVAwYpc7l6aCVBZGicECk12JIbC8o+5Rf5C
         XzDskzu8LlkCMd3/YIecElTiR4Y47JQ7zW9yV4Hfcyuq0NETzHKLrDu1+ijSMDkZHt0J
         +e5xS2ALfYktsaGRBoowlUpepwWml4fMEWk8Tc/hqzJWvkIi8XeGC7h60k+4gA9Q5muW
         c7hkWMQoyucp1mz7uiPYA3QSaNPQo2+ODe/+GkdfIGP98V6uF3cOZ0sAd2WYSUCmW1GI
         6EvqEaz1lZUJrTMKIBLF6edt9Av4SsPGZmIXPPYjiMIid0fVTtxgi2NSAn2iI3i90bqh
         VY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vFopuQifYDi+69/YOS3FtXomAJ3p0gkydigw8chDQ0=;
        b=Jxz+IMOlGP+EkWegwizzQp4GYVMy/dC+WMGWz0mEqm7vNroGKU4dIkjBfHFiJ3VuFm
         WPVNWv2AahqrbfJSN/62D9y5r5WBTGOoqiRPWt4WiBiAT2H2+0qwI+h79aF32xinFjjS
         BoB3P6b497SEyByDTqLTNP0oUOij23VFfYQ5CV17lD/gONEJ2Wro5cBu3QYTOZH1PQsK
         /U8QAhWv4S4Mb19D2pRwSgb7ux9nFPlY9mfAp5pyMXeiM37VR7CdAaILNk/j4sNXLyhM
         iUTF1iws1FVTruhCuq3r8D5jrTcU3cFl3SVtZGM9/Vtd0cNBG97slHd27g1VZ97pzNDs
         QheA==
X-Gm-Message-State: AOAM533U2D7ufAMM4Jekd0BcoOWpoCI0AMEAklbaT52pxB98Aqz8HsZj
        AnvZxmx/doMfBfMjnGEV4qXt1w==
X-Google-Smtp-Source: ABdhPJwr0xIgD9c24X+iXCLh6Zzcm6rRYn5SEpoc0fHT2awItaqzsdWydUn89R1ptwH+puAG0d1N+g==
X-Received: by 2002:adf:fd43:: with SMTP id h3mr8602682wrs.341.1642167234352;
        Fri, 14 Jan 2022 05:33:54 -0800 (PST)
Received: from localhost ([2a02:168:96c5:1:55ed:514f:6ad7:5bcc])
        by smtp.gmail.com with ESMTPSA id j11sm7381241wmq.23.2022.01.14.05.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 05:33:53 -0800 (PST)
From:   Jann Horn <jannh@google.com>
To:     David Rheinsberg <david.rheinsberg@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: [PATCH 2/2] HID: uhid: Use READ_ONCE()/WRITE_ONCE() for ->running
Date:   Fri, 14 Jan 2022 14:33:31 +0100
Message-Id: <20220114133331.873057-2-jannh@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114133331.873057-1-jannh@google.com>
References: <20220114133331.873057-1-jannh@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The flag uhid->running can be set to false by uhid_device_add_worker()
without holding the uhid->devlock. Mark all reads/writes of the flag
that might race with READ_ONCE()/WRITE_ONCE() for clarity and
correctness.

Signed-off-by: Jann Horn <jannh@google.com>
---

Notes:
    This is just some cleanup to make it clearer what's going on and avoid =
UB.
    If you don't want to take this patch, feel free to just take patch 1/2.

 drivers/hid/uhid.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/uhid.c b/drivers/hid/uhid.c
index fc06d8bb42e0..614adb510dbd 100644
--- a/drivers/hid/uhid.c
+++ b/drivers/hid/uhid.c
@@ -84,7 +84,7 @@ static void uhid_device_add_worker(struct work_struct *wo=
rk)
 		 * However, we do have to clear the ->running flag and do a
 		 * wakeup to make sure userspace knows that the device is gone.
 		 */
-		uhid->running =3D false;
+		WRITE_ONCE(uhid->running, false);
 		wake_up_interruptible(&uhid->report_wait);
 	}
 }
@@ -194,9 +194,9 @@ static int __uhid_report_queue_and_wait(struct uhid_dev=
ice *uhid,
 	spin_unlock_irqrestore(&uhid->qlock, flags);
=20
 	ret =3D wait_event_interruptible_timeout(uhid->report_wait,
-				!uhid->report_running || !uhid->running,
+				!uhid->report_running || !READ_ONCE(uhid->running),
 				5 * HZ);
-	if (!ret || !uhid->running || uhid->report_running)
+	if (!ret || !READ_ONCE(uhid->running) || uhid->report_running)
 		ret =3D -EIO;
 	else if (ret < 0)
 		ret =3D -ERESTARTSYS;
@@ -237,7 +237,7 @@ static int uhid_hid_get_report(struct hid_device *hid, =
unsigned char rnum,
 	struct uhid_event *ev;
 	int ret;
=20
-	if (!uhid->running)
+	if (!READ_ONCE(uhid->running))
 		return -EIO;
=20
 	ev =3D kzalloc(sizeof(*ev), GFP_KERNEL);
@@ -279,7 +279,7 @@ static int uhid_hid_set_report(struct hid_device *hid, =
unsigned char rnum,
 	struct uhid_event *ev;
 	int ret;
=20
-	if (!uhid->running || count > UHID_DATA_MAX)
+	if (!READ_ONCE(uhid->running) || count > UHID_DATA_MAX)
 		return -EIO;
=20
 	ev =3D kzalloc(sizeof(*ev), GFP_KERNEL);
@@ -579,7 +579,7 @@ static int uhid_dev_destroy(struct uhid_device *uhid)
 	if (!uhid->hid)
 		return -EINVAL;
=20
-	uhid->running =3D false;
+	WRITE_ONCE(uhid->running, false);
 	wake_up_interruptible(&uhid->report_wait);
=20
 	cancel_work_sync(&uhid->worker);
@@ -593,7 +593,7 @@ static int uhid_dev_destroy(struct uhid_device *uhid)
=20
 static int uhid_dev_input(struct uhid_device *uhid, struct uhid_event *ev)
 {
-	if (!uhid->running)
+	if (!READ_ONCE(uhid->running))
 		return -EINVAL;
=20
 	hid_input_report(uhid->hid, HID_INPUT_REPORT, ev->u.input.data,
@@ -604,7 +604,7 @@ static int uhid_dev_input(struct uhid_device *uhid, str=
uct uhid_event *ev)
=20
 static int uhid_dev_input2(struct uhid_device *uhid, struct uhid_event *ev)
 {
-	if (!uhid->running)
+	if (!READ_ONCE(uhid->running))
 		return -EINVAL;
=20
 	hid_input_report(uhid->hid, HID_INPUT_REPORT, ev->u.input2.data,
@@ -616,7 +616,7 @@ static int uhid_dev_input2(struct uhid_device *uhid, st=
ruct uhid_event *ev)
 static int uhid_dev_get_report_reply(struct uhid_device *uhid,
 				     struct uhid_event *ev)
 {
-	if (!uhid->running)
+	if (!READ_ONCE(uhid->running))
 		return -EINVAL;
=20
 	uhid_report_wake_up(uhid, ev->u.get_report_reply.id, ev);
@@ -626,7 +626,7 @@ static int uhid_dev_get_report_reply(struct uhid_device=
 *uhid,
 static int uhid_dev_set_report_reply(struct uhid_device *uhid,
 				     struct uhid_event *ev)
 {
-	if (!uhid->running)
+	if (!READ_ONCE(uhid->running))
 		return -EINVAL;
=20
 	uhid_report_wake_up(uhid, ev->u.set_report_reply.id, ev);
--=20
2.34.1.703.g22d0c6ccf7-goog

