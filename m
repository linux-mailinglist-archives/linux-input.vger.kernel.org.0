Return-Path: <linux-input+bounces-10080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD2A37624
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 18:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3316F3AD5A8
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 17:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC1E450FE;
	Sun, 16 Feb 2025 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="vvhusSAt"
X-Original-To: linux-input@vger.kernel.org
Received: from forward203a.mail.yandex.net (forward203a.mail.yandex.net [178.154.239.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819993A1DB;
	Sun, 16 Feb 2025 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739725467; cv=none; b=juVMLU6Xr9wme1COluQ0go1uoEOkOqvTyWvLEO7/ugnOvCd4fMq80biqb0mvUP7LZTfebWTINojXgHERhssaAGtAKC9PFuSlrfPeNo1iXlbdO1yY8jkCsFgXGopG2df0OSfyQRlcUZUVI3v1HEipVCdF2xLntsknbDDFYewY9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739725467; c=relaxed/simple;
	bh=ED000R7CGxdNtKDlDHRKxmYs52Ndr/ydlRA87y4O+80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VaKJajHToa1/uvkwAY2zECBP+K4WFupfOc2b4JfuOqiV4nxTHgB1Hp1Uu7GAZRTXSWKjbQDW8jRBUAQdQtfHz6r5X/lYZYOu5fCm/2dsX6IOInXwmgDGSuNWlvgLrA65xKtrBIcdPu30REWVgxuXJwwUz3p6aNGBVGwknUoq1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=vvhusSAt; arc=none smtp.client-ip=178.154.239.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward203a.mail.yandex.net (Yandex) with ESMTPS id 933E564981;
	Sun, 16 Feb 2025 20:04:14 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:288c:0:640:a70:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 5C42D46F0D;
	Sun, 16 Feb 2025 20:04:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 44XEhxbOe4Y0-XFoFckBR;
	Sun, 16 Feb 2025 20:04:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1739725444; bh=8tV7UnZY7VDH2HYULsYCbQms7CqS73RMo5q418k03tk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=vvhusSAt0kJxtH3wMepL161mtDH/PPv+ts1nph2YOI1eV+CVqWcAE+A3nz27sCNTI
	 YPtzFBYDoIuBM4lqDP4DYHR0TxHnSnAPimyUKHaYUwRqJ+as4VFsRSd05YWDlh2rls
	 ZJgwo8n9zEQU/PvrwrFHVchE/WEqVS1NheFhwQXs=
Authentication-Results: mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	David Collins <quic_collinsd@quicinc.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] input: pm8941-pwrkey: fix dev_dbg() output in pm8941_pwrkey_irq()
Date: Sun, 16 Feb 2025 20:03:36 +0300
Message-ID: <20250216170336.861025-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 'sw_debounce_end_time' of 'struct pm8941_pwrkey' is of type
'ktime_t', use 'ktime_to_us()' to print the value in microseconds
as it is announced in a call to 'dev_dbg()'. Compile tested only.

Fixes: 0b65118e6ba3 ("Input: pm8941-pwrkey - add software key press debouncing support")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/input/misc/pm8941-pwrkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index d0c46665e527..d952c16f2458 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -154,8 +154,8 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
 	if (pwrkey->sw_debounce_time_us) {
 		if (ktime_before(ktime_get(), pwrkey->sw_debounce_end_time)) {
 			dev_dbg(pwrkey->dev,
-				"ignoring key event received before debounce end %llu us\n",
-				pwrkey->sw_debounce_end_time);
+				"ignoring key event received before debounce end %lld us\n",
+				ktime_to_us(pwrkey->sw_debounce_end_time));
 			return IRQ_HANDLED;
 		}
 	}
-- 
2.48.1


