Return-Path: <linux-input+bounces-8821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 979EF9FE594
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2024 12:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B0401622C4
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2024 11:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C25D146A69;
	Mon, 30 Dec 2024 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQh+lyh7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uFu7eJ7E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQh+lyh7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uFu7eJ7E"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D92594BB;
	Mon, 30 Dec 2024 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735557360; cv=none; b=CKbVGMIaiDsZhQaNlevh7KrWiJybrmVFttmOwNV5brpcEdTaBacrSIXMkftpDJemogUiH6PerIEGHRw0WXqXCgfRb5+uy/+fPu/0ZSP0cm/pCa2wc6q1OSXl977vEFghk2KoFNwnnuzSZWS2DzB7T8cFuc3Mbc6zTgkhlUp9m9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735557360; c=relaxed/simple;
	bh=FjoEnCa1LRCloWxw40zisFh6cCE1uqLPx/bo48EGbQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZhYSHVO23q5DwfiJj5lE59lHT4wEPsweUVVZ3G/7XIJUoCPni/cgRJ94oKwvkPDx+f/njmUrZ30y07mMdsJgKpNvRWJ7pmDYP6/OhMMRK8gafP3+oaK+qqjaPcECQ+gi20xwUKoSe4OP6hK7klrEdx/hS74Ymj1cZFfRixEkeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQh+lyh7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uFu7eJ7E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQh+lyh7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uFu7eJ7E; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B686D1F38E;
	Mon, 30 Dec 2024 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735557356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=itognTwq6sFLppyxxUmPOpbT4foX/TSOV8Xbz+GbJX8=;
	b=iQh+lyh7c/ikvRHBrQSBXSTSoWo1naQg1fPvjSHiGE6QtIb2mhrBEgYNy9Sl0lOJ185lC6
	C+htuKvPTLc13tVeU0gIS6oq+ONDJAYLFZCBnaOJW8/2kqoGf14kz+IUJ8IeJSuoZdTu6+
	rVDgNUOIcFu/3KQyXgohTCuwusBco2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735557356;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=itognTwq6sFLppyxxUmPOpbT4foX/TSOV8Xbz+GbJX8=;
	b=uFu7eJ7ElmQbSSNG8R/YfvCMPqXCCkulqqMNQ15ISL642wtaMVFizTto5LHYxeVJJFUmAB
	Xvy4H5icyB/PI2AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735557356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=itognTwq6sFLppyxxUmPOpbT4foX/TSOV8Xbz+GbJX8=;
	b=iQh+lyh7c/ikvRHBrQSBXSTSoWo1naQg1fPvjSHiGE6QtIb2mhrBEgYNy9Sl0lOJ185lC6
	C+htuKvPTLc13tVeU0gIS6oq+ONDJAYLFZCBnaOJW8/2kqoGf14kz+IUJ8IeJSuoZdTu6+
	rVDgNUOIcFu/3KQyXgohTCuwusBco2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735557356;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=itognTwq6sFLppyxxUmPOpbT4foX/TSOV8Xbz+GbJX8=;
	b=uFu7eJ7ElmQbSSNG8R/YfvCMPqXCCkulqqMNQ15ISL642wtaMVFizTto5LHYxeVJJFUmAB
	Xvy4H5icyB/PI2AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89C6B13A30;
	Mon, 30 Dec 2024 11:15:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r5zqH+yAcmchcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 11:15:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] Input: psmouse: add NULL check to psmouse_from_serio()
Date: Mon, 30 Dec 2024 12:15:52 +0100
Message-ID: <20241230111554.1440-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The serio drvdata can be still NULL while the PS/2 interrupt is
processed.  This leaded to crash with a NULL dereference Oops, as
psmouse_from_serio() blindly assumes the non-NULL ps2dev object.

Add a NULL check and return NULL from psmouse_from_serio().  The
returned NULL is handled properly in the caller side, skipping the
rest gracefully.

The log in the bugzilla entry showed that the probe of synaptics
driver succeeded after that point.  So this is a stop-gap solution.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

It was submitted in a few months ago
  https://lore.kernel.org/20240405084448.15754-1-tiwai@suse.de
but seems forgotten.  Simply resubmitted.


 drivers/input/mouse/psmouse-base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index a2c9f7144864..d428e9ac86f6 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -120,6 +120,8 @@ struct psmouse *psmouse_from_serio(struct serio *serio)
 {
 	struct ps2dev *ps2dev = serio_get_drvdata(serio);
 
+	if (!ps2dev)
+		return NULL;
 	return container_of(ps2dev, struct psmouse, ps2dev);
 }
 
-- 
2.43.0


