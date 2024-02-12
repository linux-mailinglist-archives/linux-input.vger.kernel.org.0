Return-Path: <linux-input+bounces-1841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D918518E7
	for <lists+linux-input@lfdr.de>; Mon, 12 Feb 2024 17:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67738281283
	for <lists+linux-input@lfdr.de>; Mon, 12 Feb 2024 16:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05CC3D38D;
	Mon, 12 Feb 2024 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cj6G+CAN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bSJE8x2A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cj6G+CAN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bSJE8x2A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E964E3CF57;
	Mon, 12 Feb 2024 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707755212; cv=none; b=WYCoErOnpDGI7pFsfS+dalpdyArm0Hp7yApipbc7Q4nNbmKa8luzu8VPTfKujYL0ze11G1O6VindhsDMYtCnrRXkl/cLWcRodoVAPfxFK4cHrzlqEqWZ+JaDO/xkf7KwgqtZjRR0r0iMGsnBKVVoW0cm7hlRDUIeyH3HpHXLssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707755212; c=relaxed/simple;
	bh=V5EmgNT1FxQ+Jnej29ubhc2sQqfcj87dSelsP9UGUl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DO5vfb0bOB7iBBAZ7hbVheSf+gLyrpPDhNwFw/Mz4Rvv0jvDQ+ATJxMbxSFHcp3XdGp+1mdDrBw/zA3LdFQGt+JLZETJ2FCV0oh/LOxxUUhfcfksy+SXSI+172OuCwNEWgiq8xHL/7p8D9M7eOY2qy94lnK3CcTCdLxjjH5UQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cj6G+CAN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bSJE8x2A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cj6G+CAN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bSJE8x2A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 332A71F788;
	Mon, 12 Feb 2024 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707755209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PK3idIyd9gCCDEazD/FLS4OkOLntCLd8x9crOExzJXc=;
	b=cj6G+CANuvWhcCdqKOGFqJ4ZIRVJXiSEubKBRKuUKnlG2qLbSyt5vhhplNzwTj5x8nuJJq
	YZb2hTJvXGJ2dxreLJ+bRivxAhVbge7d0OD20WH531EHCuJEzzTy2b4y0x1IPKz8nXTF8s
	l2Zb6MtHOxyzMCm/QHYKJ9DI0NoTOgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707755209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PK3idIyd9gCCDEazD/FLS4OkOLntCLd8x9crOExzJXc=;
	b=bSJE8x2A3SRTFrFpwM8rCuyl3RpLfNSzAK9mkUmJy7ZGP0DKewlTlVgDBGoADZrBhkTcwn
	dDgWWKeHMLD5ExAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707755209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PK3idIyd9gCCDEazD/FLS4OkOLntCLd8x9crOExzJXc=;
	b=cj6G+CANuvWhcCdqKOGFqJ4ZIRVJXiSEubKBRKuUKnlG2qLbSyt5vhhplNzwTj5x8nuJJq
	YZb2hTJvXGJ2dxreLJ+bRivxAhVbge7d0OD20WH531EHCuJEzzTy2b4y0x1IPKz8nXTF8s
	l2Zb6MtHOxyzMCm/QHYKJ9DI0NoTOgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707755209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PK3idIyd9gCCDEazD/FLS4OkOLntCLd8x9crOExzJXc=;
	b=bSJE8x2A3SRTFrFpwM8rCuyl3RpLfNSzAK9mkUmJy7ZGP0DKewlTlVgDBGoADZrBhkTcwn
	dDgWWKeHMLD5ExAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E159713A0E;
	Mon, 12 Feb 2024 16:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id Fhp0NchGymXmXgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 16:26:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/10] backlight: Replace struct fb_info in interfaces
Date: Mon, 12 Feb 2024 17:16:33 +0100
Message-ID: <20240212162645.5661-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.05)[59.41%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.85

Backlight drivers implement struct backlight_ops.check_fb, which
uses struct fb_info in its interface. Replace the callback with one
the does not use fb_info.

In DRM, we have several drivers that implement backlight support. By
including <linux/backlight.h> these drivers depend on <linux/fb.h>.
At the same time, fbdev is deprecated for new drivers and likely to
be replaced on many systems.

This patchset is part of a larger effort to implement the backlight
code without depending on fbdev.

Patch 1 makes the backlight core match backlight and framebuffer
devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
drivers and remove unnecessary implementations of check_fb. Finally,
patch 10 replaces the check_fb hook with controls_device, which
uses the framebuffer's Linux device instead of the framebuffer.

Thomas Zimmermann (10):
  backlight: Match backlight device against struct fb_info.bl_dev
  auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
  hid/hid-picolcd: Fix initialization order
  hid/hid-picolcd: Remove struct backlight_ops.check_fb
  backlight/aat2870-backlight: Remove struct backlight.check_fb
  backlight/pwm-backlight: Remove struct backlight_ops.check_fb
  fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
  fbdev/ssd1307fb: Init backlight before registering framebuffer
  fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
  backlight: Add controls_device callback to struct backlight_ops

 drivers/auxdisplay/ht16k33.c             |  8 ------
 drivers/hid/hid-picolcd_backlight.c      |  7 ------
 drivers/hid/hid-picolcd_core.c           | 14 +++++------
 drivers/hid/hid-picolcd_fb.c             |  4 +++
 drivers/video/backlight/aat2870_bl.c     |  7 ------
 drivers/video/backlight/backlight.c      |  9 +++++--
 drivers/video/backlight/bd6107.c         | 12 ++++-----
 drivers/video/backlight/gpio_backlight.c | 12 ++++-----
 drivers/video/backlight/lv5207lp.c       | 12 ++++-----
 drivers/video/backlight/pwm_bl.c         | 12 ---------
 drivers/video/fbdev/sh_mobile_lcdcfb.c   |  7 ------
 drivers/video/fbdev/ssd1307fb.c          | 31 +++++++++---------------
 include/linux/backlight.h                | 16 ++++++------
 include/linux/pwm_backlight.h            |  1 -
 14 files changed, 55 insertions(+), 97 deletions(-)

-- 
2.43.0


