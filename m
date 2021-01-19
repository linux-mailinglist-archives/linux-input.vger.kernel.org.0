Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9634B2FC0B7
	for <lists+linux-input@lfdr.de>; Tue, 19 Jan 2021 21:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbhASUPz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 15:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404498AbhASUIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 15:08:22 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AE9C061757;
        Tue, 19 Jan 2021 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=qH9+bSG9rldlwp1A7DpxVLC8Lk4DArwmSI8u9Y2/wRo=; b=zZEqB+N+PwjS44QIyd9rjx4bof
        oAewXwE/xA/GnLniegGNLlzGe9JqKM4bPY4RoIa9JsFxzoGBo2J1vPNdkUxnggDM8ItznVoEGkXEP
        rGlsCdky9z9HeGESISYAT2kBtVqaqwkxHHPxzHBUJUjhXqT4kiqpa4fIzLFJdNvTRBRkuCXdDS8T+
        Ut//TIrieZ0Y9gYovWwGZ5mLpnk7G/J5rA66q5lGdgdWBeoPrXHP1F9I7oelCOYoGGXp5XcGJWtcy
        57NMLS3MLBq6o7QATx1vdgjgZUn5kDiMxDScSqFaBq67WEzSoOwD4COaxg63JxAlVN2vk7UH0KAPa
        yzSgWBbQ==;
Received: from [2601:1c0:6280:3f0::9abc] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1xHr-00073y-Ld; Tue, 19 Jan 2021 20:07:36 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 2/2 v2] HID: correct kernel-doc notation in hid-quirks.c
Date:   Tue, 19 Jan 2021 12:07:23 -0800
Message-Id: <20210119200723.12092-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119200723.12092-1-rdunlap@infradead.org>
References: <20210119200723.12092-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use correct kernel-doc notation for functions.
Add notation (comments) where it is missing.
Use the documented "Return:" notation for function return values.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
v2: rebase & resend

 drivers/hid/hid-quirks.c |   25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

--- linux-next-20210119.orig/drivers/hid/hid-quirks.c
+++ linux-next-20210119/drivers/hid/hid-quirks.c
@@ -1028,7 +1028,7 @@ static DEFINE_MUTEX(dquirks_lock);
 /* Runtime ("dynamic") quirks manipulation functions */
 
 /**
- * hid_exists_dquirk: find any dynamic quirks for a HID device
+ * hid_exists_dquirk - find any dynamic quirks for a HID device
  * @hdev: the HID device to match
  *
  * Description:
@@ -1036,7 +1036,7 @@ static DEFINE_MUTEX(dquirks_lock);
  *         the pointer to the relevant struct hid_device_id if found.
  *         Must be called with a read lock held on dquirks_lock.
  *
- * Returns: NULL if no quirk found, struct hid_device_id * if found.
+ * Return: NULL if no quirk found, struct hid_device_id * if found.
  */
 static struct hid_device_id *hid_exists_dquirk(const struct hid_device *hdev)
 {
@@ -1060,7 +1060,7 @@ static struct hid_device_id *hid_exists_
 
 
 /**
- * hid_modify_dquirk: add/replace a HID quirk
+ * hid_modify_dquirk - add/replace a HID quirk
  * @id: the HID device to match
  * @quirks: the unsigned long quirks value to add/replace
  *
@@ -1069,7 +1069,7 @@ static struct hid_device_id *hid_exists_
  *         quirks value with what was provided.  Otherwise, add the quirk
  *         to the dynamic quirks list.
  *
- * Returns: 0 OK, -error on failure.
+ * Return: 0 OK, -error on failure.
  */
 static int hid_modify_dquirk(const struct hid_device_id *id,
 			     const unsigned long quirks)
@@ -1121,7 +1121,7 @@ static int hid_modify_dquirk(const struc
 }
 
 /**
- * hid_remove_all_dquirks: remove all runtime HID quirks from memory
+ * hid_remove_all_dquirks - remove all runtime HID quirks from memory
  * @bus: bus to match against. Use HID_BUS_ANY if all need to be removed.
  *
  * Description:
@@ -1145,7 +1145,10 @@ static void hid_remove_all_dquirks(__u16
 }
 
 /**
- * hid_quirks_init: apply HID quirks specified at module load time
+ * hid_quirks_init - apply HID quirks specified at module load time
+ * @quirks_param: array of quirks strings (vendor:product:quirks)
+ * @bus: bus type
+ * @count: number of quirks to check
  */
 int hid_quirks_init(char **quirks_param, __u16 bus, int count)
 {
@@ -1176,7 +1179,7 @@ int hid_quirks_init(char **quirks_param,
 EXPORT_SYMBOL_GPL(hid_quirks_init);
 
 /**
- * hid_quirks_exit: release memory associated with dynamic_quirks
+ * hid_quirks_exit - release memory associated with dynamic_quirks
  * @bus: a bus to match against
  *
  * Description:
@@ -1193,14 +1196,14 @@ void hid_quirks_exit(__u16 bus)
 EXPORT_SYMBOL_GPL(hid_quirks_exit);
 
 /**
- * hid_gets_squirk: return any static quirks for a HID device
+ * hid_gets_squirk - return any static quirks for a HID device
  * @hdev: the HID device to match
  *
  * Description:
  *     Given a HID device, return a pointer to the quirked hid_device_id entry
  *     associated with that device.
  *
- * Returns: the quirks.
+ * Return: the quirks.
  */
 static unsigned long hid_gets_squirk(const struct hid_device *hdev)
 {
@@ -1224,13 +1227,13 @@ static unsigned long hid_gets_squirk(con
 }
 
 /**
- * hid_lookup_quirk: return any quirks associated with a HID device
+ * hid_lookup_quirk - return any quirks associated with a HID device
  * @hdev: the HID device to look for
  *
  * Description:
  *     Given a HID device, return any quirks associated with that device.
  *
- * Returns: an unsigned long quirks value.
+ * Return: an unsigned long quirks value.
  */
 unsigned long hid_lookup_quirk(const struct hid_device *hdev)
 {
