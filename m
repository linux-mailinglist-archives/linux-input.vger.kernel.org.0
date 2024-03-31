Return-Path: <linux-input+bounces-2730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271818931AF
	for <lists+linux-input@lfdr.de>; Sun, 31 Mar 2024 15:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACACE281EBE
	for <lists+linux-input@lfdr.de>; Sun, 31 Mar 2024 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829881448E7;
	Sun, 31 Mar 2024 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="wGDaihM3"
X-Original-To: linux-input@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC0314430F
	for <linux-input@vger.kernel.org>; Sun, 31 Mar 2024 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711891441; cv=none; b=TaqzWMDNe/Eec7miKyxJYAOvYqdbcGNyWKdniosOG4qoT2SfMDyF7RqXWHUY+ndbFqlPSZNIBVr+Zn444OK2CNilX/jpKrXO51vavxZh0W343e+cxfABN3Wp4763lZoKuScXi6xWcfH8CPuBuBGfF1ZICVSOEr6ecGxW4HnkxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711891441; c=relaxed/simple;
	bh=91cpiyUiFJlig7ePPf3LHxbUYUsHjiio22RCIrZJnBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYOSOMNrO/Dlf5yMwPGBgOq7pK+4VXHJAgnrHu9lOwdTKGWk5vghKTgSbzSQJePuQS9oBKnAjdqzTF/lQm5pLIjuK4Es4gZiXLBZ6hgcN3bn2UqYMHCj1pf1yINp7HOfUYNDcXgcvKq+9v37hxX5UVC3NPPxXC8ZBPaMTqHKtzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=wGDaihM3; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1711891436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jXCOBcd1k81Gm3Te2PvHRxe5JHkC8QtAl7tPP4aAgE8=;
	b=wGDaihM3WFmMn0e4Wc+f/CgyIKBACK3Bj+49Idqa5abjLF5yb5avGW97NgvhfxjxIjHu+6
	HP6wi63xlg/5CJv6alyALtauG/u4YA6Tez+3lYn05dHRNTsgjDH020IyWA75kw9y3+8nOB
	3v6AFLLSLZ4T4efbejRjS6nSlkMz4Yugn5S7xl/LK75b8tFEeBFdcam7E+SP/3b7ZSOZxA
	CiAuTtUq/sdp4XDM5o54sx92c09AdU+ytKgZuWuH6YlRDaqT1Zh/QDRYN/Zhl2A2k4LUrC
	JYi4utf0TbpV+sTf1mt72hwsXH+o7cHrl1p75JnRlHE/ZLBZIC81rwNcwaf+BA==
From: Kenny Levinsen <kl@kl.wtf>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenny Levinsen <kl@kl.wtf>
Subject: [PATCH] HID: i2c-hid: Revert to await reset ACK before reading report descriptor
Date: Sun, 31 Mar 2024 15:23:32 +0200
Message-ID: <20240331132332.6694-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In af93a167eda9, i2c_hid_parse was changed to continue with reading the
report descriptor before waiting for reset to be acknowledged.

This has lead to two regressions:

1. We fail to handle reset acknowledgement if it happens while reading
   the report descriptor. The transfer sets I2C_HID_READ_PENDING, which
   causes the IRQ handler to return without doing anything.

   This affects both a Wacom touchscreen and a Sensel touchpad.

2. On a Sensel touchpad, reading the report descriptor this quickly
   after reset results in all zeroes or partial zeroes.

The issues were observed on the Lenovo Thinkpad Z16 Gen 2.

The change in question was made based on a Microsoft article[0] stating
that Windows 8 *may* read the report descriptor in parallel with
awaiting reset acknowledgement, intended as a slight reset performance
optimization. Perhaps they only do this if reset is not completing
quickly enough for their tastes?

As the code is not currently ready to read registers in parallel with a
pending reset acknowledgement, and as reading quickly breaks the report
descriptor on the Sensel touchpad, revert to waiting for reset
acknowledgement before proceeding to read the report descriptor.

[0]: https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/plug-and-play-support-and-power-management

Fixes: af93a167eda9 ("HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor")
Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2df1ab3c31cc..be5d661dde41 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -737,7 +737,9 @@ static int i2c_hid_parse(struct hid_device *hid)
 		ret = i2c_hid_start_hwreset(ihid);
 		if (ret)
 			msleep(1000);
+		ret = i2c_hid_finish_hwreset(ihid);
 	} while (tries-- > 0 && ret);
+	mutex_unlock(&ihid->reset_lock);
 
 	if (ret)
 		goto abort_reset;
@@ -767,16 +769,8 @@ static int i2c_hid_parse(struct hid_device *hid)
 		}
 	}
 
-	/*
-	 * Windows directly reads the report-descriptor after sending reset
-	 * and then waits for resets completion afterwards. Some touchpads
-	 * actually wait for the report-descriptor to be read before signalling
-	 * reset completion.
-	 */
-	ret = i2c_hid_finish_hwreset(ihid);
 abort_reset:
 	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
-	mutex_unlock(&ihid->reset_lock);
 	if (ret)
 		goto out;
 
-- 
2.44.0


