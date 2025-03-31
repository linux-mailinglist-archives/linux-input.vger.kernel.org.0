Return-Path: <linux-input+bounces-11428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08227A76A66
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003781891A96
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51BD24A051;
	Mon, 31 Mar 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx+mjOCl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48C24A04A;
	Mon, 31 Mar 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433009; cv=none; b=dMOOFP+jghMG3VeZdImrPVH9i+9nSAF0iOmRiSdalMzR0Gfz2QvKkGJptDWLUrKUrMgs3FNCjA5xFAafD3v2XI95WvsL5nr/2c3a1FTbqNW3PPkaHGDpo0jQakCyLIEx81TvCsR7GwPAkmcUbvhXnSPvaDlrD0gMUxwD6VZXsP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433009; c=relaxed/simple;
	bh=5Bd/k/fOQJvIJ1KchYOcmfdBHJlUk0IYZWrwlqh2EBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dArP8ig1oIFKBhhLsGddFFMr3auv3duYQYmMOZb0wvS7/EDJPar+H8z47993b0jTR4z1UB0YST/ddtEBHTaCdcC9IVpsb+v4FHuBc9v3BV5IeJfymFZamAP/mSk1coy3WjMLft9qXtwW7ilgAKvynSXiOY/4fp8mHW8c2A/hv1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx+mjOCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9B3C4CEE9;
	Mon, 31 Mar 2025 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743433009;
	bh=5Bd/k/fOQJvIJ1KchYOcmfdBHJlUk0IYZWrwlqh2EBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kx+mjOClNXRYEMfcRkk1Yi1+zs3l+pSmErInXxgl94kfYBcUdAWf/PIfNEomSV+AD
	 Nom+fmgWYp/G+Q7XOSTP9jSkHodCR4q1Kh4bbW+ZNdiwfMtboEaQgbMyeBKPkxo4NJ
	 6NNxJALT1eacYYEHhYgSMMzB9a2om3HWR4f/QTg59n4GHH+T5fasW2joNHFDIlyDEV
	 zqV6m2pTkRboMz8Pt1gstWpmY16sIuhOMg8z7aYexj9v1QaHGbw5aSAfSEEiz9lUqf
	 g25yQz/STXBpMt5l4sqUKG5nZwrm5mhaCHrbSwmjHS1avgx4HBfhip0plTAJyRZwK1
	 qzv5nx8bqcWRQ==
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
Subject: [PATCH AUTOSEL 6.1 3/9] HID: pidff: Fix null pointer dereference in pidff_find_fields
Date: Mon, 31 Mar 2025 10:56:36 -0400
Message-Id: <20250331145642.1706037-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145642.1706037-1-sashal@kernel.org>
References: <20250331145642.1706037-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
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
index a01c1b2ab2f4c..26cb331b646ca 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -770,6 +770,11 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
+	if (!report) {
+		pr_debug("pidff_find_fields, null report\n");
+		return -1;
+	}
+
 	int i, j, k, found;
 
 	for (k = 0; k < count; k++) {
@@ -883,6 +888,11 @@ static int pidff_reports_ok(struct pidff_device *pidff)
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


