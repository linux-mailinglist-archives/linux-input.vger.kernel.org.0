Return-Path: <linux-input+bounces-9787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F127A28339
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 05:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC95116610C
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 04:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0021134AB;
	Wed,  5 Feb 2025 04:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="qUMsqYPs"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECEC25A62E
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728318; cv=none; b=rKvKuadA0cXy815HrgLUtRpW6bc2k28vDr2WKcx/W5/RmXOW7lWfiWOSdaU8OWVB/mRTmJzNGUk57FAvjYOWJF8QtH9lvm5D7PmhV17urCbHgwvoTp1kbnTM2BL7QKzIsRJUfZiV/w3K+YZ+7z4O2jEvMRZEeApb4y8dh9x/UXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728318; c=relaxed/simple;
	bh=NlcXe8q8EjOFYmk+W9np9glv6QgzAer/X1hMEvr1iQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKnFHBxDMYotQRmXHZSNdmtQG4lJgwJnfgWRxAr14A7Uae/daxXzlmxFSevSajdkwlvI+anrpv35rc3v31PUHxoOgZuJ/GuXp9FkIrPtCPKOfcFwa3UCtOMo/luBSyYX3evyzRF+DyfkZQx3UkhVIvY5xA1MsVQ0I6n3x3FGcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=qUMsqYPs; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1738727758; bh=NlcXe8q8EjOFYmk+W9np9glv6QgzAer/X1hMEvr1iQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qUMsqYPsm44VOzObtSoSRs9q9cDOmc5SRgJ3GQv5P6VngrpMaZJGTKCXZf6Le7+zf
	 6uXZD4ff3OanMy1BUzb47H+iY4Ec8o9xMBOZnt2WKmPPEDNhreOVURKuhKznuyFQh4
	 bvzp0cXSOUONewHW7gdm/LHfGo5L5QJoyFTnNl3Tii04wuPsuWYWdtMFiU2zt+/cve
	 jwEbE2e0JnHaQgnKRj/3TlHm0IQvHrIT/zBZiI/Gvdnl5Ua87QhBoPs+MHQO5icu6p
	 urLjNtpCuPJsW9qf4hKokGXS2H/iQjzZrr4J3Z3i3PC9PstQQwU2AiIVnh8Fj5rZnn
	 ze6SUwW9ksfaQ==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 4845513208B;
	Tue,  4 Feb 2025 19:55:58 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/3] hid-steam: Mutex cleanup
Date: Tue,  4 Feb 2025 19:55:28 -0800
Message-ID: <20250205035529.1022143-2-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205035529.1022143-1-vi@endrift.com>
References: <20250205035529.1022143-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of this if/else start with mutex_lock and end with mutex_unlock.
This hoists the mutex lock/unlock outside of the if statement for simplicity.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 395dbe642f00..d6be0deea330 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -559,15 +559,13 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 	if (steam->gamepad_mode)
 		enable = false;
 
+	mutex_lock(&steam->report_mutex);
 	if (enable) {
-		mutex_lock(&steam->report_mutex);
 		/* enable esc, enter, cursors */
 		steam_send_report_byte(steam, ID_SET_DEFAULT_DIGITAL_MAPPINGS);
 		/* reset settings */
 		steam_send_report_byte(steam, ID_LOAD_DEFAULT_SETTINGS);
-		mutex_unlock(&steam->report_mutex);
 	} else {
-		mutex_lock(&steam->report_mutex);
 		/* disable esc, enter, cursor */
 		steam_send_report_byte(steam, ID_CLEAR_DIGITAL_MAPPINGS);
 
@@ -579,15 +577,14 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 				SETTING_RIGHT_TRACKPAD_CLICK_PRESSURE, 0xFFFF, /* disable haptic click */
 				SETTING_STEAM_WATCHDOG_ENABLE, 0, /* disable watchdog that tests if Steam is active */
 				0);
-			mutex_unlock(&steam->report_mutex);
 		} else {
 			steam_write_settings(steam,
 				SETTING_LEFT_TRACKPAD_MODE, TRACKPAD_NONE, /* disable mouse */
 				SETTING_RIGHT_TRACKPAD_MODE, TRACKPAD_NONE, /* disable mouse */
 				0);
-			mutex_unlock(&steam->report_mutex);
 		}
 	}
+	mutex_unlock(&steam->report_mutex);
 }
 
 static int steam_input_open(struct input_dev *dev)
-- 
2.48.1


