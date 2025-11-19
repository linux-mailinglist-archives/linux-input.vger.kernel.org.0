Return-Path: <linux-input+bounces-16214-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B251C6D99F
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 10:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id EC3DC2D8E6
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 09:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90081334C33;
	Wed, 19 Nov 2025 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="TJWfldfN";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Vx7esk3m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995AC3358C7
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543406; cv=none; b=XaZeVfpTFrKn7uNn8Fvh8eGl4a3QxhZQh6m2dMjYuo5C1Zo6T0iqRH/8xZyofivoJ5iSMxPnfHo9+doxVbjN6Mkc0uAYEYCv+dU9+0TvpMDpve7zufhPhpqCOWyLnapga7MLWOew0PT6OjqvLdzLVsxtinLmJEIWAfzCTxa/0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543406; c=relaxed/simple;
	bh=2hkH0GkvaOfub8TRqF3p4sCMqh1Kci3xlVarPK/z/K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjpLRCksG7+XN5TfhliSgGSyVYFUPHrrC/IR4ZiKaTCECV7Xj6C4OSyJNV2342JljVpvvgJSyHlHMl3RWJY5qira41f+iSXN1egQyB6FQXeoasp3+P2E2u6XKWzxlqDhcgNic8pZPC35T3f12VG3MMikZLnZCpVdZPUSbiEXeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=TJWfldfN; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Vx7esk3m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A044420358;
	Wed, 19 Nov 2025 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763543402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E6PchaBlT0jzUO6MDtiw+HFbs/BfEzer79JAN/DT4BI=;
	b=TJWfldfN+gpQH1XlNHHAg6S+ZoZH2B/Pq6EsEeyKkR8MYgUbeegkVnmcmoO8mhJv40FYA5
	ajo9s9UNK4WtgFNN5EdMw0prX/BLqmd4VGWP0hMozJa6zbUDdyKp6C7oqrhOPAbBMH9gOT
	Ql5PF+ghJGsKJBlaXW2q45LjbDzIHYs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763543401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E6PchaBlT0jzUO6MDtiw+HFbs/BfEzer79JAN/DT4BI=;
	b=Vx7esk3mlyY+YDDnnYM3ESJo9v6Se0joxYH7QJLMSKEDPo4EGcvZIjiKiBI7YbumQNlrO5
	k12T9/HBQt4r1AoWHO4MXzSAkwajuMTKdlpRLKX1WA1P3zKuyuKx3czbLA931CubBwZq+8
	tPCCBJnDxVXUOMAT6tF9tH34WLYV2B0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7368B3EA61;
	Wed, 19 Nov 2025 09:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TAzyGmmJHWn5PQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 19 Nov 2025 09:10:01 +0000
From: Oliver Neukum <oneukum@suse.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] hid: hid-pl: handle probe errors
Date: Wed, 19 Nov 2025 10:09:57 +0100
Message-ID: <20251119090957.1936249-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Errors in init must be reported back or we'll
follow a NULL pointer the first time FF is used.

Fixes: 20eb127906709 ("hid: force feedback driver for PantherLord USB/PS2 2in1 Adapter")
Cc: <stable@vger.kernel.org>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/hid-pl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-pl.c b/drivers/hid/hid-pl.c
index 3c8827081dea..dc11d5322fc0 100644
--- a/drivers/hid/hid-pl.c
+++ b/drivers/hid/hid-pl.c
@@ -194,9 +194,14 @@ static int pl_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err;
 	}
 
-	plff_init(hdev);
+	ret = plff_init(hdev);
+	if (ret)
+		goto stop;
 
 	return 0;
+
+stop:
+	hid_hw_stop(hdev);
 err:
 	return ret;
 }
-- 
2.51.1


