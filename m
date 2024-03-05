Return-Path: <linux-input+bounces-2238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47312872433
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE871B25F6B
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 16:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB39412DDBD;
	Tue,  5 Mar 2024 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hxXixgZZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SnYarAK+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hxXixgZZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SnYarAK+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DADB12DD97;
	Tue,  5 Mar 2024 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709655879; cv=none; b=qeMMXQwRcOuYsOrBeDBGtI/+/9JvDVKvoSWfMlReDHXDzVX7KsKZuixy/VZ5G+P7fkEgaPIyHEY8FxDdbFSdUw6IQShr/qAb706PFWG73Q9tRU3qE70d8quLbkr1M1PLbJXUogF7Hv7hDE9jyKMuFQ79ON2iLCy5WAiZz+fdO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709655879; c=relaxed/simple;
	bh=anHyUTDav91fJJwn4bR1XECLfTyS41goqV45hx+UkNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUzNU+exXRqiUsXUyv/cZ3idXskdMNSPMu7RURtDEek5qwS5kFJvkkErfLdcvVle8/Su5HTY76k4MyXk0dcJ81YlNy2FGmPcXKFKGsYpped9hwpVBLDwa+hH9FWUSmYGV4SFiqcV/q2+4FLb3uoyaFP11MfWN/tvzStNihLcq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hxXixgZZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SnYarAK+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hxXixgZZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SnYarAK+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B12AF6B96A;
	Tue,  5 Mar 2024 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709655872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VYLDIGgRwJLPzdzx4kSlZKwRuQwMEIA4/2EDJniS6s=;
	b=hxXixgZZPuVwPqtASoI53N5wEucjH9w/XmnKwhh9R1uJ2MXZ/6mW/MtTdzZr5VvAkmFYD8
	hzuDsE8Mmxrc7S5X8fey4v4zwPx5fXzPdpCPC24dYlkylTrFpj5Y3IBTYnRX5NHH90FWqp
	wGCTDHq7avkfRkbg8X9d5cpvxxHsqVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709655872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VYLDIGgRwJLPzdzx4kSlZKwRuQwMEIA4/2EDJniS6s=;
	b=SnYarAK+Cb9dtA5L2ioXDm6Q0BArwHPZW1lsvn1wjyYmJkp1bbvEGlNizCodOw95iM+vZe
	8BAWJbvIT7P26cAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709655872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VYLDIGgRwJLPzdzx4kSlZKwRuQwMEIA4/2EDJniS6s=;
	b=hxXixgZZPuVwPqtASoI53N5wEucjH9w/XmnKwhh9R1uJ2MXZ/6mW/MtTdzZr5VvAkmFYD8
	hzuDsE8Mmxrc7S5X8fey4v4zwPx5fXzPdpCPC24dYlkylTrFpj5Y3IBTYnRX5NHH90FWqp
	wGCTDHq7avkfRkbg8X9d5cpvxxHsqVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709655872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VYLDIGgRwJLPzdzx4kSlZKwRuQwMEIA4/2EDJniS6s=;
	b=SnYarAK+Cb9dtA5L2ioXDm6Q0BArwHPZW1lsvn1wjyYmJkp1bbvEGlNizCodOw95iM+vZe
	8BAWJbvIT7P26cAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FA4D13A8A;
	Tue,  5 Mar 2024 16:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id IL4QFkBH52WwYwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 16:24:32 +0000
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
Subject: [PATCH v4 07/10] fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
Date: Tue,  5 Mar 2024 17:22:40 +0100
Message-ID: <20240305162425.23845-8-tzimmermann@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.91 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.99)[99.96%]
X-Spam-Level: *
X-Spam-Score: 1.91
X-Spam-Flag: NO

The driver sets struct fb_info.bl_dev to the correct backlight
device. Thus rely on the backlight core code to match backlight
and framebuffer devices, and remove the extra check_fb function
from struct backlight_ops.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index eb2297b37504c..bf34c8ec1a26c 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -2140,17 +2140,10 @@ static int sh_mobile_lcdc_get_brightness(struct backlight_device *bdev)
 	return ch->bl_brightness;
 }
 
-static int sh_mobile_lcdc_check_fb(struct backlight_device *bdev,
-				   struct fb_info *info)
-{
-	return (info->bl_dev == bdev);
-}
-
 static const struct backlight_ops sh_mobile_lcdc_bl_ops = {
 	.options	= BL_CORE_SUSPENDRESUME,
 	.update_status	= sh_mobile_lcdc_update_bl,
 	.get_brightness	= sh_mobile_lcdc_get_brightness,
-	.check_fb	= sh_mobile_lcdc_check_fb,
 };
 
 static struct backlight_device *sh_mobile_lcdc_bl_probe(struct device *parent,
-- 
2.44.0


