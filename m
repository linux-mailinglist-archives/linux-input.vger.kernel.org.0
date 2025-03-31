Return-Path: <linux-input+bounces-11434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8CA76AA2
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7554E188E44D
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C3C250BEC;
	Mon, 31 Mar 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2/rEgS4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37997216E23;
	Mon, 31 Mar 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433044; cv=none; b=P5JWCO2f3zXhb2GTgFkMfQJrIW2p0nNNwLIqNtTvIHXSXO35eHYDmhl+aeulxSrrhhSFgCi/O+hLNjvBvUMpbBcMCd9Ue9JKJ9Vc4o25CfyKr73FUvPmH2GaEmFF2bBNKGtKNGiAxVFt5peqao9xI+L2+Upr6l+32qXbrn8x7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433044; c=relaxed/simple;
	bh=NVLozsaYedadfSYx5D/Ah92WhepsYqoR1n2WxLWQlQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PmlyxXhjXMtN0hmwE8Fo/63wVTuZrjEIeJ7cu5YcJQwKdwo4r4rtck1OuYYOxq59zEw7VXMWvXpMCznueoCEBVUmoYHXqX8TSoLn/ZAvWXVbqIRnEIxqGnrkbLZLkolpzrjFEhE4b9T36nEJRuyvQetaW6+KiC+iSB1OdzKprIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2/rEgS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAA3C4CEE3;
	Mon, 31 Mar 2025 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743433043;
	bh=NVLozsaYedadfSYx5D/Ah92WhepsYqoR1n2WxLWQlQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G2/rEgS4c5DN2HqJSa1qTn4i+86SbEdc5bd0X47xwSnOXQ33UOujk2GXg+BaFq+RU
	 NTvnOZEuYc/Ythp7ir7BCvygbxFJz2sTez237uL3UNY68dzVLH+Wlf0mC1UqMVWgFP
	 rfcKz7ENEsrTkXB9zWwJpKat42N8xp3x2bH05qlXA0f8uE2fn4IxODfYo8n+u6ZCtv
	 uwLUmZmfcqS8lG2qjab5RTDXXcOvp5Ka+J01AyDUb+WisiB4Xx2vaUXpwQNQHcOWb2
	 7EWJOPySJirLNjIePP9hcxvLUCDPJYzYP48qKw/49xSvcZcWeXep3tm/6i1b/pBD3U
	 HxDgXFIW73JQA==
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
Subject: [PATCH AUTOSEL 5.10 3/5] HID: pidff: Fix null pointer dereference in pidff_find_fields
Date: Mon, 31 Mar 2025 10:57:14 -0400
Message-Id: <20250331145716.1706253-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145716.1706253-1-sashal@kernel.org>
References: <20250331145716.1706253-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
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
index ba0d7cb15377e..7801294fe086d 100644
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


