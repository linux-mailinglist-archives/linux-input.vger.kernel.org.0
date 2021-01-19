Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934B42FC0B9
	for <lists+linux-input@lfdr.de>; Tue, 19 Jan 2021 21:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbhASUQD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 15:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404441AbhASUIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 15:08:22 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3229C061575;
        Tue, 19 Jan 2021 12:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=fSP+Hbk1pR3y4XkNVhyMko7WwZjsk4H30rYU4STDj5o=; b=eUkk+F65lUgQOdRu/awSGb7eZk
        2jIyZH91LQFeb/Rxa+wGcH2fujM7AD/XQVXBjrj0KGb4nepyHOma7tX9foASzzfeDm+FfkhiP+KmG
        MDMY5IZQOnQ08LIXQFbpxOhUXzNAwEbO5uK0V67tNhwRbu30lpxIeNjCE61HyF3BVwowNnj629Knc
        NnXI8iPRacj8iN4SkxBkJraeXP+R0/FGwddUqzjgukOSivKbvxq/T/b7qZwVYgCSFftRqSYWsupcK
        TsxsOWIH1iR7z4KECGR3CvK0LDf+cVIRT2f7ziEg7y4KbKMUjFmDx/A9gIfRBVPXszaGUdhdZ1zaA
        Dq9vYrCg==;
Received: from [2601:1c0:6280:3f0::9abc] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1xHp-00073y-Bq; Tue, 19 Jan 2021 20:07:33 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 1/2 v2] HID: correct kernel-doc notation in <linux/hid*.h>
Date:   Tue, 19 Jan 2021 12:07:22 -0800
Message-Id: <20210119200723.12092-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119200723.12092-1-rdunlap@infradead.org>
References: <20210119200723.12092-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Correct kernel-doc notation in HID header files (include/linux/hid*.h).
Add notation (comments) where it is missing.
Use the documented "Return:" notation for function return values.
Fix a few typos/spellos.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
v2: rebase & resend

 include/linux/hid-sensor-hub.h |    9 +++++----
 include/linux/hid.h            |   15 +++++++++++----
 2 files changed, 16 insertions(+), 8 deletions(-)

--- linux-next-20210119.orig/include/linux/hid.h
+++ linux-next-20210119/include/linux/hid.h
@@ -918,7 +918,7 @@ __u32 hid_field_extract(const struct hid
 /**
  * hid_device_io_start - enable HID input during probe, remove
  *
- * @hid - the device
+ * @hid: the device
  *
  * This should only be called during probe or remove and only be
  * called by the thread calling probe or remove. It will allow
@@ -936,7 +936,7 @@ static inline void hid_device_io_start(s
 /**
  * hid_device_io_stop - disable HID input during probe, remove
  *
- * @hid - the device
+ * @hid: the device
  *
  * Should only be called after hid_device_io_start. It will prevent
  * incoming packets from going to the driver for the duration of
@@ -1010,6 +1010,13 @@ static inline void hid_map_usage(struct
 /**
  * hid_map_usage_clear - map usage input bits and clear the input bit
  *
+ * @hidinput: hidinput which we are interested in
+ * @usage: usage to fill in
+ * @bit: pointer to input->{}bit (out parameter)
+ * @max: maximal valid usage->code to consider later (out parameter)
+ * @type: input event type (EV_KEY, EV_REL, ...)
+ * @c: code which corresponds to this usage and type
+ *
  * The same as hid_map_usage, except the @c bit is also cleared in supported
  * bits (@bit).
  */
@@ -1084,7 +1091,7 @@ static inline void hid_hw_request(struct
  * @rtype: HID report type
  * @reqtype: HID_REQ_GET_REPORT or HID_REQ_SET_REPORT
  *
- * @return: count of data transfered, negative if error
+ * Return: count of data transferred, negative if error
  *
  * Same behavior as hid_hw_request, but with raw buffers instead.
  */
@@ -1106,7 +1113,7 @@ static inline int hid_hw_raw_request(str
  * @buf: raw data to transfer
  * @len: length of buf
  *
- * @return: count of data transfered, negative if error
+ * Return: count of data transferred, negative if error
  */
 static inline int hid_hw_output_report(struct hid_device *hdev, __u8 *buf,
 					size_t len)
--- linux-next-20210119.orig/include/linux/hid-sensor-hub.h
+++ linux-next-20210119/include/linux/hid-sensor-hub.h
@@ -150,7 +150,7 @@ int sensor_hub_remove_callback(struct hi
 * @info:	return information about attribute after parsing report
 *
 * Parses report and returns the attribute information such as report id,
-* field index, units and exponet etc.
+* field index, units and exponent etc.
 */
 int sensor_hub_input_get_attribute_info(struct hid_sensor_hub_device *hsdev,
 			u8 type,
@@ -167,7 +167,7 @@ int sensor_hub_input_get_attribute_info(
 * @is_signed:   If true then fields < 32 bits will be sign-extended
 *
 * Issues a synchronous or asynchronous read request for an input attribute.
-* Returns data upto 32 bits.
+* Return: data up to 32 bits.
 */
 
 enum sensor_hub_read_flags {
@@ -205,8 +205,9 @@ int sensor_hub_set_feature(struct hid_se
 * @buffer:	buffer to copy output
 *
 * Used to get a field in feature report. For example this can get polling
-* interval, sensitivity, activate/deactivate state. On success it returns
-* number of bytes copied to buffer. On failure, it returns value < 0.
+* interval, sensitivity, activate/deactivate state.
+* Return: On success, it returns the number of bytes copied to buffer.
+* On failure, it returns value < 0.
 */
 int sensor_hub_get_feature(struct hid_sensor_hub_device *hsdev, u32 report_id,
 			   u32 field_index, int buffer_size, void *buffer);
