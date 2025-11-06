Return-Path: <linux-input+bounces-15909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D02C3C2DA
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 16:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50BE23BA9C6
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 15:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62466308F1B;
	Thu,  6 Nov 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="VfNx0vpc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9033A01E;
	Thu,  6 Nov 2025 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444014; cv=none; b=u50eAs4RoXWnnDaNAJuaPxYTJXY2+QZydpq15sUz/pGv2uLylHyCGjCg2CNi2u62dv+GRBqMsqJYfzZWIci1s++ntEMVUWbsCNe0cb+3FYMtQ+DrOJ7RL3S9Va3yZNHJzS9uknchE6/YdhIjDk8svU13w0wMH5GPJxQOjq+H0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444014; c=relaxed/simple;
	bh=UFehdYGfL7XplbekhzSPlLyU1zHHpJ5oGfGQnwhxaaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4Qk1CPvbrzIZSLzvcZbdVng45Ek3V/PVJw3+zGfBTYf8/1xGKDCmKiknhpNxeVyzAErfVdcFgNSOpEA4TIZ+IACIdP4PT3VuyMcNmUmqqDVAb5GcmEInPxvXWrAqZEoBe2Xh8qjwrf0VddSyUXkitmrdnQoBEguQfDECdyi/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=VfNx0vpc; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (p50878061.dip0.t-ipconnect.de [80.135.128.97])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 805442FC0061;
	Thu,  6 Nov 2025 16:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762444002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WI7GSSyIf1BAMtDsvNYlDE51rHvHY74b+6plngwjCCY=;
	b=VfNx0vpcMjs1x42VKXP/F1VFVZwTkf/Ng8RHghI5X8QOa3hTuyLrmxmQNgGnW5+9t3AZBI
	CYt+jLWeT+WqzN9+oqPqsV41CoRhzAhRff5+/cFO+vG0NpE62JcJ6I70gWPzueqGN+wHTC
	LhSnOQalOKRM/5CUiHF14KFEw4oSk24=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hid/hid-multitouch: Keep latency normal on deactivate for reactivation gesture
Date: Thu,  6 Nov 2025 16:45:28 +0100
Message-ID: <20251106154636.985427-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uniwill devices have a built in gesture in the touchpad to de- and
reactivate it by double taping the upper left corner. This gesture stops
working when latency is set to high, so this patch keeps the latency on
normal.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
Or should I better implement this as a quirk?

 drivers/hid/hid-multitouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b4b51..df64cb6c41699 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1998,7 +1998,7 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
 
 static void mt_on_hid_hw_close(struct hid_device *hdev)
 {
-	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
 }
 
 /*
-- 
2.43.0


