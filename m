Return-Path: <linux-input+bounces-9570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BBA1CBF5
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F86161A95
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0855B22FDFF;
	Sun, 26 Jan 2025 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLu+9TQs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89C22FDFC;
	Sun, 26 Jan 2025 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903939; cv=none; b=Ph4L1cE4CTFaPJQsNHT0f8NGwYe0eL6CDR4dFyHsCag+EEDX3US96WcQIFhgVKguScEezYzn/hHonqz7A7OGRgY/2kshtOiC6HGaxLwSX2R5kBnWVGgDXJs63J4i683WGqgsm6qsLmrgN4402jzuQx9wgo4sP8UWsP8ChI6xtfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903939; c=relaxed/simple;
	bh=LoYHi79qmX2oKQtD8dw/hUllRJEgJTdOc10xSd1wR3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TOZfnLCHPvSOQgpkpE50spsERxgJepzwwK5nXSRja9fx9sssQ1oH2gu24cbd+WojiSOhAuepEBfgKL4HspbrYJg0vckOgcjSQKj9cdGpsAL9xzTo/A8hmHXGs0jm+JmaaeWO/nekSYPxNotH4qFE7Nko7fVzCFl8UDdlHlYfj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLu+9TQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF3AC4CEE3;
	Sun, 26 Jan 2025 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903939;
	bh=LoYHi79qmX2oKQtD8dw/hUllRJEgJTdOc10xSd1wR3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLu+9TQsvgSiE5L16EM+/8bun5DJQ0Cyhy0xf63vzAUsJSbULOd7KWBC/hzly3OEh
	 l6v1D8GI1y1oZlC0dkpyqUelssgC2X/iFqz0B6bJsbgLiHwzAYq8eaF6nHyqbL+Fsj
	 yzB/6cMei3z4URZeZnsK/6LQLAgz0+MggR0K6GGAUHqXZmaSxlHMyh8XbDm2DXbLa8
	 zOlRvTbujGH3EWGxaW+2Ed/Ht8Iicg40+82v2Q98be7EVWIJ3FoHB4YLRu7rKTGq+r
	 8DJXr9v9ZEHbZ9ChyFaojYU/TJFQIrH4p9ZCyRMA5kyllXO0y7nFNSxhaZAj65vv31
	 L9ioRFqzU5yBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Even Xu <even.xu@intel.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 6/7] HID: Wacom: Add PCI Wacom device support
Date: Sun, 26 Jan 2025 10:05:26 -0500
Message-Id: <20250126150527.960265-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150527.960265-1-sashal@kernel.org>
References: <20250126150527.960265-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.289
Content-Transfer-Encoding: 8bit

From: Even Xu <even.xu@intel.com>

[ Upstream commit c4c123504a65583e3689b3de04a61dc5272e453a ]

Add PCI device ID of wacom device into driver support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/wacom_wac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 0ec75848ca805..7851cbec79dc2 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4851,6 +4851,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5020,6 +5024,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.39.5


