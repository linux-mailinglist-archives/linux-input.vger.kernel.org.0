Return-Path: <linux-input+bounces-16107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0DC59BE7
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 20:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDCE3A5F72
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 19:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359572C158F;
	Thu, 13 Nov 2025 19:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="mh+2+vDB";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="mh+2+vDB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65B1FFC6D
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062040; cv=none; b=JiFbjqcvnAW0RgQI3CMkv/G03RGPUZutmYgg06+ZT6xNmb1mGkyKQHnLFlc5yT6nb7h9FX9vy7edHqcwEI4zUNMs33ypP5HEf4xh6ZH53f7zoLdv2w3qusjp7HPV3JZFEGL1oU12qosaocRxQhOkxKo8/TydYIdkql3l3IIiqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062040; c=relaxed/simple;
	bh=+GL/W3o5vQQqzKXQaXqJwBAUohWgPi5Mas8Gs2c0dBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exZ5Ybq7Rd+xYGTRIqeAOw1+NBB84Ef5Gibu5HX5zTArA9v2JogmqSWM794et8DjSuVL/J10GiFhrq2TXig4dH4EKAgB5zIMsUCB0paWQCFu1waPa0eLDHfpQRwBS6fbe9dUO6LDNdjfyTFAlS4aU46MVAaeLORaoKnXWrYd8T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=mh+2+vDB; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=mh+2+vDB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 43F891F395;
	Thu, 13 Nov 2025 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763062036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SBZYsfFPK7MHwAZgnwmQnYQO2KQr3e4hU4bYC71BVRI=;
	b=mh+2+vDBX+RcTD5KBsBQo20eLclMdv3ahXwzvrgUcpW6e2/ak9QiJbvAD5ZIyx77/bTC48
	YJLivLewdoFJHNd83Q5uRdC98udYPeCFVCvRo26kcybgbvnHmptXiF+3TU5TPzdvIcvuee
	QvcSPpkY4rnxze4vlKCX4/5FAFYHBPo=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mh+2+vDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763062036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SBZYsfFPK7MHwAZgnwmQnYQO2KQr3e4hU4bYC71BVRI=;
	b=mh+2+vDBX+RcTD5KBsBQo20eLclMdv3ahXwzvrgUcpW6e2/ak9QiJbvAD5ZIyx77/bTC48
	YJLivLewdoFJHNd83Q5uRdC98udYPeCFVCvRo26kcybgbvnHmptXiF+3TU5TPzdvIcvuee
	QvcSPpkY4rnxze4vlKCX4/5FAFYHBPo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20D0B3EA61;
	Thu, 13 Nov 2025 19:27:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eZj1BhQxFmnnRAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 13 Nov 2025 19:27:16 +0000
From: Oliver Neukum <oneukum@suse.com>
To: roderick.colenbrander@sony.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/1] hid: hid-playstation: fix memleak in probe
Date: Thu, 13 Nov 2025 20:26:54 +0100
Message-ID: <20251113192713.537344-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 43F891F395
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Free the buffer if we bail out in the error case of
dualshock4_get_calibration_data()

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/hid-playstation.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 63f6eb9030d1..128aa6abd10b 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1942,6 +1942,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 					 "Failed to retrieve DualShock4 calibration info: %d\n",
 					 ret);
 				ret = -EILSEQ;
+				kfree(buf);
 				goto transfer_failed;
 			} else {
 				break;
@@ -1959,6 +1960,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 
 		if (ret) {
 			hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+			kfree(buf);
 			goto transfer_failed;
 		}
 	}
-- 
2.51.1


