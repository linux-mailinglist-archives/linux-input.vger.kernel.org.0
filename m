Return-Path: <linux-input+bounces-5568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848495184C
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 12:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14B2282FDD
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 10:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D921AD9C1;
	Wed, 14 Aug 2024 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lr2fk2+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fRJxaJm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lr2fk2+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fRJxaJm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74551AD9C3;
	Wed, 14 Aug 2024 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723629955; cv=none; b=TP/38nQ2f/xwtZPEqt/voXBAXTJF7zDQfGO4U35MDaaSMpQ1u9mn+1HCdIdnSDkUXMOiJNk5eeKGi2PNMHhDke8+7rHBYyKz7vMUhiVQEd9ahKAqJrxe9XEbRJbVNG/KTUPmzKXq+0v2PtzQpzitdOqrd+5pds5zagy3EUlWTwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723629955; c=relaxed/simple;
	bh=kGB7G+oyhUvaSZULm/kqipJRFWrvmob0q7slb+FRlWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7OTQN/gbejn2tygz73Zz5ZEkZs8UMOBuSEKfDpsechScpKtJA3iAwrQttlKR0dslQYyDfmrBZNMNViIMqyKSq6sQexDnikLTNNGzeO9ZLBNjlI6N8duiTe2ZBoVbmGo5nx6FpM8OC5kduw6uzbv5zycR8LsczUpehbNnHVsED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lr2fk2+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fRJxaJm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lr2fk2+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fRJxaJm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCE981FE8B;
	Wed, 14 Aug 2024 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723629951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=59Ch4V7HniiSk/7TkYRqYl6qpLneFEB8CnTGZUH3BD0=;
	b=Lr2fk2+5jaSn8XhEXVLAnRMUiOvOHixETEKrety5vDE9jYoJqcvQ5mOVx9i5emG8ecipSL
	fHPDx9PZgML6ffrdYlT92K+y9Nif1bkzT07kg9r/RgZ5ze8au9OGKNIwT25x1qIf/v4RL5
	/3CqwY5a2kMegjTW1Ks/BptwtsuYn2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723629951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=59Ch4V7HniiSk/7TkYRqYl6qpLneFEB8CnTGZUH3BD0=;
	b=7fRJxaJm/qNBoTC+DtXgrvx4Q0K//BW/xCxG6otNt6YqfRP4KD998mfpX8/rUvrKaHN+cJ
	IfmWAbtfquaRFLAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723629951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=59Ch4V7HniiSk/7TkYRqYl6qpLneFEB8CnTGZUH3BD0=;
	b=Lr2fk2+5jaSn8XhEXVLAnRMUiOvOHixETEKrety5vDE9jYoJqcvQ5mOVx9i5emG8ecipSL
	fHPDx9PZgML6ffrdYlT92K+y9Nif1bkzT07kg9r/RgZ5ze8au9OGKNIwT25x1qIf/v4RL5
	/3CqwY5a2kMegjTW1Ks/BptwtsuYn2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723629951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=59Ch4V7HniiSk/7TkYRqYl6qpLneFEB8CnTGZUH3BD0=;
	b=7fRJxaJm/qNBoTC+DtXgrvx4Q0K//BW/xCxG6otNt6YqfRP4KD998mfpX8/rUvrKaHN+cJ
	IfmWAbtfquaRFLAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 968DA139B9;
	Wed, 14 Aug 2024 10:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TY8+I3+BvGZsAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Aug 2024 10:05:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk table
Date: Wed, 14 Aug 2024 12:06:19 +0200
Message-ID: <20240814100630.2048-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.com:url,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

Yet another quirk entry for Fujitsu laptop.  Lifebook E756 requires
i8041.nomux for keeping the touchpad working after suspend/resume.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1229056
Signed-off-by: Takashi Iwai <tiwai@suse.de>

---
 drivers/input/serio/i8042-acpipnpio.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 5b50475ec414..78e5c9c60b8b 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -626,6 +626,15 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
+	{
+		/* Fujitsu Lifebook E756 */
+		/* https://bugzilla.suse.com/show_bug.cgi?id=1229056 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK E756"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
+	},
 	{
 		/* Fujitsu Lifebook E5411 */
 		.matches = {
-- 
2.43.0


