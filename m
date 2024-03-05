Return-Path: <linux-input+bounces-2235-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A487242A
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03F8E1F23E38
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 16:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AB112A16E;
	Tue,  5 Mar 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Od7B8ulY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PRiFPArm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rA9DL+BV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="82t82tdE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E91292C7;
	Tue,  5 Mar 2024 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709655877; cv=none; b=mUnhzxCcA2vw2+BZsjMJnQ9uFE2OJaw4gG/GEYECw4465EClHUP5T2yPHjIbIoxXODzOrQrSCiyhzAGerQnNS/v9HNzV0hmj0S1HFR5Dh5JMxAXMlinj8AxGro+oWefVDIedSrH3jj7oeg8iFDMBRS+KNd5iyDkPUNUTGnbRGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709655877; c=relaxed/simple;
	bh=MVnT1GcB9mZoAtZdM+8qrT/edK7G7vR5qVyJTuLE/Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhigQ8FR6+MxKeh47kldGy3LugMKAMiVv1Jk+K4G80Z0mIcEzzkaiIU3OgvZKKZ0VqyDlnAk5eNeStGO/sRBbZ/QU7ZXW2DO7wwe/doaK0n0vL3/pCafNxJruZZAywLpLLMIb48RC4JPWPU/KNNRjRH+slaDKozJ0hdT0RChljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Od7B8ulY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PRiFPArm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rA9DL+BV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=82t82tdE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D566076812;
	Tue,  5 Mar 2024 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709655871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
	b=Od7B8ulYW9cY4L8mqAlCkM+vn44w94fX/bnFXlXxCfZuOU2eAaulFia7qJe2G6RPt7dq8T
	oaUj1Bj76ZHN4GuO7FxKPkxzPbjZIJFkAXdWMFEZpqAE52YuH2X34GvbZ62YLtJDdOHmmB
	xLPKsoW1xvGV+1YmcxXYeoVD32AQbfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709655871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
	b=PRiFPArmyZV65gQ5caZ6cRZN4/uC3uFW+qZ9+++lZ/8S9deMDe0yr35knzem49wi/zn4n2
	fgRt6H39yZE902AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709655870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
	b=rA9DL+BV4ZruUbP2XuW+MYK7eMqaLy5qlOYto94aUKf2RR6uixZUNN9bK7mLR6jEMUXYCe
	P2UrJwZUagetV9mYvPVTGeNy/9v1odZW8jnklRfoQzImASwTIxbrGvN9Wm3ipfl6i4T+ll
	y8Bscl5kDwFebNGN/Voo96i6/FMSviY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709655870;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQ3sK+9yV9Ua9Fkbkvpx8TNNPEaeONOzmEHQ+4kI0JQ=;
	b=82t82tdEPoMUbkkqeICuE26n/hKFKuADQ3cgSZGjwkqk1yd5GzwkLgYVhNAco/1UfkXBNn
	1Fg4TrlMJ+tIH9Dg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 84EA013A5D;
	Tue,  5 Mar 2024 16:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id wM8tHz5H52WwYwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 16:24:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	andy@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	robin@protonic.nl,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 02/10] auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
Date: Tue,  5 Mar 2024 17:22:35 +0100
Message-ID: <20240305162425.23845-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305162425.23845-1-tzimmermann@suse.de>
References: <20240305162425.23845-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rA9DL+BV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=82t82tdE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.63 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLmbat3p9xsccqh5oowmzmthut)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.62)[92.62%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -0.63
X-Rspamd-Queue-Id: D566076812
X-Spam-Flag: NO

The driver sets struct fb_info.bl_dev to the correct backlight
device. Thus rely on the backlight core code to match backlight
and framebuffer devices, and remove the extra check_fb() function
from struct backlight_ops.

v3:
	* use 'check_fb()' in commit message (Andy)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Robin van der Gracht <robin@protonic.nl>
Acked-by: Robin van der Gracht <robin@protonic.nl>
Acked-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/auxdisplay/ht16k33.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index a90430b7d07ba..0a858db32486b 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -325,16 +325,8 @@ static int ht16k33_bl_update_status(struct backlight_device *bl)
 	return ht16k33_brightness_set(priv, brightness);
 }
 
-static int ht16k33_bl_check_fb(struct backlight_device *bl, struct fb_info *fi)
-{
-	struct ht16k33_priv *priv = bl_get_data(bl);
-
-	return (fi == NULL) || (fi->par == priv);
-}
-
 static const struct backlight_ops ht16k33_bl_ops = {
 	.update_status	= ht16k33_bl_update_status,
-	.check_fb	= ht16k33_bl_check_fb,
 };
 
 /*
-- 
2.44.0


