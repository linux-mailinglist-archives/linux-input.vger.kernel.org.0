Return-Path: <linux-input+bounces-13436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F0AFECA3
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 16:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73C191BC447B
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FA82E7170;
	Wed,  9 Jul 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8Ur71R7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA82E5B0E;
	Wed,  9 Jul 2025 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072736; cv=none; b=JTns3YtutWHPtB1E5MU345362JDwTQYTQXw6+aWDQO2sQPMTrtIseP129EpCa5JULG9ToFzMy1r4SHXlDxMBKZQeL5QnGaX4ov4hkAMa4A7ZwoZ8Dy7QCoz/jlf8Vkmxz69RGkyRtQRpQVeuK96H09q96JEUa+8aAJIZyFuZTbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072736; c=relaxed/simple;
	bh=8ysK06Mh0q67zu9jPJHCYvc8Mf8NlktKJvCmhrbYGrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfOKQQdlDbBnEK2Q5DBl987jN2vtclh5pYPM0FeRbY6ZZpUHUq4RAyiGwLUItC6EX3RD58W+3YerHmwYDr3BUI+3UDwgFan0MD1/w3etAVNDzw7sORWp83Jug+aGPWhJGZzVRrY5VzVYaTgaxNXNgx8HYmmYampNb8rQW/6TqPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8Ur71R7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB50C4CEF4;
	Wed,  9 Jul 2025 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752072736;
	bh=8ysK06Mh0q67zu9jPJHCYvc8Mf8NlktKJvCmhrbYGrw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J8Ur71R7Nlf4oHTHmGd2sglLinbZ6yfw/kx3xyFx+gtOcksGjZwmtwWpXUMDsfEuC
	 pwF+/XAtUaZUjc2L3AX8lh+Vv+b2QfsLfo6JIVlrU8gmdjwbz2Ermdxt/IIcoCk8qV
	 QqRjjhaQuY/PbuA6XywJDvgaMiqI8FcPMUHgQEEmjCtlEwGDYrfpb2Uz0frqr7+CcS
	 INchWD2aYSBZouOwHXvW6KodqjbAKOuhUsvhjL4QI44z+rkK7VZW5uJ6N/rDHQ+IFO
	 OKHKW6fguOOkQdqBtwN7AaPHyWYPBMHd1P2YYhmIDcaZwKujTYIWiQtN+HPl/tm70W
	 9HBBR1m5PzWXQ==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 09 Jul 2025 16:51:47 +0200
Subject: [PATCH 2/3] HID: core: ensure __hid_request reserves the report ID
 as the first byte
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-report-size-null-v1-2-194912215cbc@kernel.org>
References: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
In-Reply-To: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072731; l=1924;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=8ysK06Mh0q67zu9jPJHCYvc8Mf8NlktKJvCmhrbYGrw=;
 b=6h2D8OVKehkcfNkvo9uNHeylA3EFV+jzVXnHd/5FvH563ga1h8JoyKBQSGaIcZD+NegaCiOlN
 y3qmh3bY7sUBalMQwm3pqrWifWE/lDaZTifF5iAccIFFpud81r9AcmJ
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

The low level transport driver expects the first byte to be the report
ID, even when the report ID is not use (in which case they just shift
the buffer).

However, __hid_request() whas not offsetting the buffer it used by one
in this case, meaning that the raw_request() callback emitted by the
transport driver would be stripped of the first byte.

Reported-by: Alan Stern <stern@rowland.harvard.edu>
Closes: https://lore.kernel.org/linux-input/c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu/
Reported-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8258d5439c49d4c35f43
Fixes: 4fa5a7f76cc7 ("HID: core: implement generic .request()")
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 1a231dd9e4bc83202f2cbcd8b3a21e8c82b9deec..320887c365f7a36f7376556ffd19f99e52b7d732 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1976,7 +1976,7 @@ static struct hid_report *hid_get_report(struct hid_report_enum *report_enum,
 int __hid_request(struct hid_device *hid, struct hid_report *report,
 		enum hid_class_request reqtype)
 {
-	char *buf;
+	char *buf, *data_buf;
 	int ret;
 	u32 len;
 
@@ -1984,10 +1984,17 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
 	if (!buf)
 		return -ENOMEM;
 
+	data_buf = buf;
 	len = hid_report_len(report);
 
+	if (report->id == 0) {
+		/* reserve the first byte for the report ID */
+		data_buf++;
+		len++;
+	}
+
 	if (reqtype == HID_REQ_SET_REPORT)
-		hid_output_report(report, buf);
+		hid_output_report(report, data_buf);
 
 	ret = hid->ll_driver->raw_request(hid, report->id, buf, len,
 					  report->type, reqtype);

-- 
2.49.0


