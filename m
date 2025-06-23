Return-Path: <linux-input+bounces-12997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31749AE3DE5
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 13:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAF261897A37
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 11:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF67C21C178;
	Mon, 23 Jun 2025 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H4i9NpQ5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A82417F0
	for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678076; cv=none; b=eoG5NBRxBf0rqm+FyLJYd/I9ALmufnrEygcKJSD0movj6oCQ3QTcutpEx9nNFo4p3lGVeS9OUVOKtPRzla+0vnGdSwiaFCRIyyOV60nPWAzAhlRBxFLzhDpUgs2iFbtvs9Id+QL5AhRL3hwuA/P8bgnh0Z3yt3P8QIzA+Vd2U6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678076; c=relaxed/simple;
	bh=KuH75xZOLYJ7PwaXuoHMw9kwidUCoIpnRQ8/JGUccOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OByNCsp0BOGGmnYt5WWb2W1JjAJ+JRzGZ4Mts3CBZBfpM3oHa4s0MyoTGZIVOIZV6s7iNWEqtrLiSAWKHxHvfpwF6nI9+1UQDaAtStWi/kKXr5OVSZP5Pzxgow5lgaYjc0LgnzsAhd5HQyEFtq3XH3o6KdrrWWEF5l7Fr5Mf+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H4i9NpQ5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2798050f8f.3
        for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750678071; x=1751282871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgGVjs0mx/DWrB4ey7Iyo+fPznrCR9ZRVZDG/d2yApo=;
        b=H4i9NpQ5MQ39QEDeLs1bNaKRa2UsrCNrqaBNtiiw6EMbEWhXlOh64bNfr6jFfR5Eqa
         GOPkVOmVwyOJrcH2d8qX4y+hMS+w16OMnUjUQ9f5r6PDnw24ueO/PYtj75zVmnEeB1t4
         jCE3NSwN3/PpaiLe6ylYGM1ubNKVDumTDbZ9mbHr50WcJgddMsu+NdIpC9n7EGcRhDRR
         ut95njdss9JlMyBXRvMenaC4rFBnWZar02brLeW1gaAuvS0Gn68QtZaEvBPyUP0p6pxn
         Q0B+nk6iBHIGyI/CdvmsBpPqfCK293FBcMllb8VUoxDkUb1ha7Ra2pvYnkXrJzijHju5
         OArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678071; x=1751282871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgGVjs0mx/DWrB4ey7Iyo+fPznrCR9ZRVZDG/d2yApo=;
        b=PLUOoX8s6l5omYGJcKeL40q23mD+cd1/i085hjdECMDUatgGkVNuLUcoBECzI0hqFh
         QU6drRkS7IzzLrP/oi4D2HvrpsqM8moeOEnRpK+L+nyS8rtKSo7Nv/UDHXOWKMLuxG/R
         WwqPmHa/Rjkre0bsiH02GxZjc/r8IOV50jx2if7eAIk+tvOWveN7RwQMDJgGVV1mMdoG
         0sHF+ko3/0lqjNtcUXm+BMAG1zqtJBCKTl1Dc3jiVjBbK1ni3jIOcw6VvG4TImWzoWTX
         Y+w879R3ycP62Ge5Rvk80SH3EHCP856u8Cl2lFCxB/2GjVn9FgJkticjb9M/J0E6BQCa
         oTwA==
X-Forwarded-Encrypted: i=1; AJvYcCUTcGe7BqXQirPJ0JHi9fBVjVLi54PfZ2w3En2Zs/RY6ZuItivB6GdZxDSIdxIE/DtwuIoqMfm8a6Q3ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YySapTT8Me5Nzqd0KOWxUttbiGMPMq46bx1NEaA/t3xvFRKa4Yv
	YM6hayD2/1FVeeCjT2Ln+pngFQtPTaKp33ZaLUbKaBIxG+NycWivYgXRqwX+EMsQglc=
X-Gm-Gg: ASbGncv0WZqAk+RgZZBHaWRpG7tFNl0zdspmoYEG7o3XLxkZs3CKiL+1twU4Ch7pZ6p
	afzqMCy2cLK6beqst5UNgPTtt5Fwir+t56/MIqdV/6iK454hsBWvd3Ss6hXicca7Tsac2HOopda
	tNPDtwoiZCYaD1epCQqk6YyVIlbQw/MGAa4NU3xCGOFWl9MNxBjNOfuKed7teBb9U7dQ4EJoH3Q
	duWTCgjbr/SaOXZTWF+pqy2eWR/os8OSyYyJKzt3OgUcx/l3pr+USTsDhUdV12ZwymLRY40Ug0H
	LuvkTccAfGke9XHbScVa9lJ1PgyTK15Zp9UiVG7XLMcR+T/33nx+49mpzP0cVfIw0eOHpLAkw01
	Bfe2hAUTv8r/rrZUuTrdagupS7I3Z
X-Google-Smtp-Source: AGHT+IEC3JeHSxxvrApWTOPMtt+Aj3yNGFGtar3LoMCBZbb8N+DXecCtdydrRVFjF/RZC/H6iBKO2w==
X-Received: by 2002:a05:6000:288d:b0:3a4:e706:530f with SMTP id ffacd0b85a97d-3a6d1325008mr8682325f8f.42.1750678071563;
        Mon, 23 Jun 2025 04:27:51 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6d0f19e7dsm9456050f8f.38.2025.06.23.04.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:27:51 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH] Input: max8997_haptic - Optimize PWM configuration
Date: Mon, 23 Jun 2025 13:27:42 +0200
Message-ID: <20250623112742.1372312-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=KuH75xZOLYJ7PwaXuoHMw9kwidUCoIpnRQ8/JGUccOI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWTovzSUKjGhA/h0H1T2Wq73h3j6x90Pn1pa9b /Zmo+oFm8CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFk6LwAKCRCPgPtYfRL+ TgGCB/98dGFVjSlZ7Huis8+S+sqsEMfE9NWRv8XHKqOTWp8oGTtxW/a6DTqLgrINHTE3dBDKP1x FSmEodwk9rub0C2mZLc051Bl4CJJNQVhT29+4OiA5OqMu0v/vrY3WyFA6TYO+Jmre13AqFUd7zF ass6aHu7dbIH7wfVsiIV8Hp8QtaiLdMirkCtDelWrRX7H30STrdmZxqp2NQfEJRUmBX8xS7N+yR vu16BgKO0dYiK4povUc13o4ec+QiiE8HVIxKYtcYnCV4BwNsWIweO4XmftP9c8ByK/kSELcd1dQ lRy7E/HZF8LVGb5UcBT/FNTweBgWqUVe1sfvUEMG7e8kP6b6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Both pwm_config() and pwm_enable() are wrappers around
pwm_apply_might_sleep(). Instead of calling this function twice only
call it once without an intermediate step.

max8997_haptic_enable() is the only user of
max8997_haptic_set_duty_cycle(), so it's known in the latter that the
PWM should be enabled.

There is a slight change in semantic because without this change the
polarity configured before (which probably is at its bootup state) was
kept, while with this change it is set to its default polarity.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the motivation for this patch is to get rid of pwm_config(). This driver
is one of the remaining two users of this function.

Best regards
Uwe

 drivers/input/misc/max8997_haptic.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index f97f341ee0bb..6549df0b0919 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -58,8 +58,14 @@ static int max8997_haptic_set_duty_cycle(struct max8997_haptic *chip)
 	int ret = 0;
 
 	if (chip->mode == MAX8997_EXTERNAL_MODE) {
-		unsigned int duty = chip->pwm_period * chip->level / 100;
-		ret = pwm_config(chip->pwm, duty, chip->pwm_period);
+		struct pwm_state state;
+
+		pwm_init_state(chip->pwm, &state);
+		state.period = chip->pwm_period;
+		state.duty_cycle = chip->pwm_period * chip->level / 100;
+		state.enabled = true;
+
+		ret = pwm_apply_might_sleep(chip->pwm, &state);
 	} else {
 		u8 duty_index = 0;
 
@@ -168,14 +174,6 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
 			return;
 		}
 		max8997_haptic_configure(chip);
-		if (chip->mode == MAX8997_EXTERNAL_MODE) {
-			error = pwm_enable(chip->pwm);
-			if (error) {
-				dev_err(chip->dev, "Failed to enable PWM\n");
-				regulator_disable(chip->regulator);
-				return;
-			}
-		}
 		chip->enabled = true;
 	}
 }

base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
-- 
2.49.0

