Return-Path: <linux-input+bounces-5241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F18942FBF
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 15:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E44D1C20AF3
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 13:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064CE1A76C1;
	Wed, 31 Jul 2024 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWW27pXR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GWp+7eGm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWW27pXR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GWp+7eGm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21E1A7F73
	for <linux-input@vger.kernel.org>; Wed, 31 Jul 2024 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431425; cv=none; b=RIE5ei8Pz1ksPxuZ7YhlKwE2EavZaFDlpc/IFKxvgpUrJIbLhl5v9eieo47Z4qgA3v8Qeqe0+vCYLR7cFHj1XeejCllJGQ/6MWivdrom2SqlUpU0tNfQa5upEQpHK1xVZxXjxxE54r/YX5KKmtuU0aUnuo23da4Ydmzh3EImLhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431425; c=relaxed/simple;
	bh=R/cfIgo0otnuKvJkrjO2RX/cfbmHftxZtxx8Vm61yb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uk3x4DsLdcaT2n1WxxIv8xGnEYLU3EAvFI1+mhvpPd8lQ//vC/KnuoBGR4LYMlMvX/M2RPS9dnTj9alhC1uF6UrtyB7l5Z+3r3WEsbDTYSKZJOyFQCJtWuOwcSZ0+cDgg8NRO+yhU3HNkDWaVR3aEBBZZs1bDw9ywovysn/Ip+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWW27pXR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GWp+7eGm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWW27pXR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GWp+7eGm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77C451F810;
	Wed, 31 Jul 2024 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iW8mhu2IVRuUuCRB5Aeq34txMFUZVE27OGNCeAsTd+o=;
	b=ZWW27pXR8aWgEuG7TGUFH08HsOfsRFz8wJdiGqa5lkYewatb9cdojHRd4jaECZKCfAENvU
	NnulPq6pZyJ9gL94USn7Q8lVVJV8An+F+8xtIj+I3u+f16MMdkRjwTD4aOuuw5/p0Ml6dy
	KXWmEtTwWrR7CGpHo0Aoqz5cyp+N71A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iW8mhu2IVRuUuCRB5Aeq34txMFUZVE27OGNCeAsTd+o=;
	b=GWp+7eGmf2EWo6xbf7JV9RHpe0yyaqLc2n9zKzJXh6D8jYwN7lYmY86lIsYgiwAJs/UCq7
	fY5hZbW26EHFYSDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iW8mhu2IVRuUuCRB5Aeq34txMFUZVE27OGNCeAsTd+o=;
	b=ZWW27pXR8aWgEuG7TGUFH08HsOfsRFz8wJdiGqa5lkYewatb9cdojHRd4jaECZKCfAENvU
	NnulPq6pZyJ9gL94USn7Q8lVVJV8An+F+8xtIj+I3u+f16MMdkRjwTD4aOuuw5/p0Ml6dy
	KXWmEtTwWrR7CGpHo0Aoqz5cyp+N71A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iW8mhu2IVRuUuCRB5Aeq34txMFUZVE27OGNCeAsTd+o=;
	b=GWp+7eGmf2EWo6xbf7JV9RHpe0yyaqLc2n9zKzJXh6D8jYwN7lYmY86lIsYgiwAJs/UCq7
	fY5hZbW26EHFYSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DC8213297;
	Wed, 31 Jul 2024 13:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KIS5Ebw3qmbhWwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 13:10:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] HID: picoLCD: Use backlight power constants
Date: Wed, 31 Jul 2024 15:09:50 +0200
Message-ID: <20240731131017.1149175-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.40 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.40

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/hid/hid-picolcd_backlight.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-picolcd_backlight.c b/drivers/hid/hid-picolcd_backlight.c
index 08d16917eb60..4b43b64537a3 100644
--- a/drivers/hid/hid-picolcd_backlight.c
+++ b/drivers/hid/hid-picolcd_backlight.c
@@ -31,7 +31,8 @@ static int picolcd_set_brightness(struct backlight_device *bdev)
 	data->lcd_brightness = bdev->props.brightness & 0x0ff;
 	data->lcd_power      = bdev->props.power;
 	spin_lock_irqsave(&data->lock, flags);
-	hid_set_field(report->field[0], 0, data->lcd_power == FB_BLANK_UNBLANK ? data->lcd_brightness : 0);
+	hid_set_field(report->field[0], 0,
+		      data->lcd_power == BACKLIGHT_POWER_ON ? data->lcd_brightness : 0);
 	if (!(data->status & PICOLCD_FAILED))
 		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&data->lock, flags);
@@ -94,7 +95,7 @@ void picolcd_suspend_backlight(struct picolcd_data *data)
 	if (!data->backlight)
 		return;
 
-	data->backlight->props.power = FB_BLANK_POWERDOWN;
+	data->backlight->props.power = BACKLIGHT_POWER_OFF;
 	picolcd_set_brightness(data->backlight);
 	data->lcd_power = data->backlight->props.power = bl_power;
 }
-- 
2.45.2


