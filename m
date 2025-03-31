Return-Path: <linux-input+bounces-11394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E7A7696E
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416483B6230
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5822253BB;
	Mon, 31 Mar 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPsQANIf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F12253B7;
	Mon, 31 Mar 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432792; cv=none; b=trnEq1z+qFGA6yZROYH1XDvAJIgYQMSxaRdNDlGL6yrn/cxmc5jBjjZcyHzHXZwQUW+9nN2jGUFNFzezxt0mrZbcobvVIyuufRPs4aN9XV5N9DL2XIS9d2fpP2a2COlWskgxLFuDB/zkTzgBmkjOV4OCf6i0/vMAfmXDXSOy6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432792; c=relaxed/simple;
	bh=S6y4x2Dy0+A5U6tconAysDu/dhTuwtwV+TzuTjZj4eE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MD0D3kmLHEZlENh/zLwUrbn5Ss8yCXcN+tJ3Ejxc9XNA0l/9AQepS1q4kK6OTOZAoB41yXIlF10SzhyDO3AEiESaU3QRqCH/FbLysxcrDL6ll5CUEo5YUWhfpoF9DxSeJFC2hAP9wAJh9uuQn/MzZfQvVubT+2kQ20nJYnlNdqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPsQANIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63FEC4CEE3;
	Mon, 31 Mar 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432792;
	bh=S6y4x2Dy0+A5U6tconAysDu/dhTuwtwV+TzuTjZj4eE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPsQANIfa4C5h9PdYVj1IFLSbpdZ1yP+d6s9+F6CnsBA+uPoyXAQAqVOPKbl7vDzO
	 kXqgZI1NTcwrE9w3cZSfWcn4yECpZ5qDIJg29pyhWx3SLD4zhFlw9Fai61Gwsoa7h5
	 0+YbNt8S884AKnK96AVqWzZ4fccypqFCiUveRNaiVuBYQI0orNZbiPJoFaFn4ki6FN
	 6mmYR7iqe66NppTRbRPUbWqpZ2Jc881aqgBAGibR+zTHBI214EEFl/Za5XtmJEIWFE
	 phU5mw8p5lzqKzQ+P0UQrOItt5HfytEP+prCpVdMzrcjKldhHYZ1MaM25hbOg/2lLv
	 +yn/lLXS9CK/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <forest10pl@gmail.com>,
	Nolan Nicholson <nolananicholson@gmail.com>,
	=?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?UTF-8?q?Crist=C3=B3ferson=20Bueno?= <cbueno81@gmail.com>,
	Pablo Cisneros <patchkez@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 12/27] HID: pidff: Fix null pointer dereference in pidff_find_fields
Date: Mon, 31 Mar 2025 10:52:30 -0400
Message-Id: <20250331145245.1704714-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145245.1704714-1-sashal@kernel.org>
References: <20250331145245.1704714-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <forest10pl@gmail.com>

[ Upstream commit 22a05462c3d0eee15154faf8d13c49e6295270a5 ]

This function triggered a null pointer dereference if used to search for
a report that isn't implemented on the device. This happened both for
optional and required reports alike.

The same logic was applied to pidff_find_special_field and although
pidff_init_fields should return an error earlier if one of the required
reports is missing, future modifications could change this logic and
resurface this possible null pointer dereference again.

LKML bug report:
https://lore.kernel.org/all/CAL-gK7f5=R0nrrQdPtaZZr1fd-cdAMbDMuZ_NLA8vM0SX+nGSw@mail.gmail.com

Reported-by: Nolan Nicholson <nolananicholson@gmail.com>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hid-pidff.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 4c94d8cbac43a..25dbed076f530 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -793,6 +793,11 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
+	if (!report) {
+		pr_debug("pidff_find_fields, null report\n");
+		return -1;
+	}
+
 	int i, j, k, found;
 	int return_value = 0;
 
@@ -917,6 +922,11 @@ static int pidff_reports_ok(struct pidff_device *pidff)
 static struct hid_field *pidff_find_special_field(struct hid_report *report,
 						  int usage, int enforce_min)
 {
+	if (!report) {
+		pr_debug("pidff_find_special_field, null report\n");
+		return NULL;
+	}
+
 	int i;
 
 	for (i = 0; i < report->maxfield; i++) {
-- 
2.39.5


