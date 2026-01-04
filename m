Return-Path: <linux-input+bounces-16780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92962CF156B
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 22:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB334300E14C
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 21:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64992EB87F;
	Sun,  4 Jan 2026 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG5+I6QQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893ED2F0C74
	for <linux-input@vger.kernel.org>; Sun,  4 Jan 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562301; cv=none; b=dR2fuZr5GLNuO5bk45+IwfY2BkIp4fZ54CHzhe6pbubkgHFS3VrKqGUOZgmZZdmGAred7ZYfoaKkxssOHtGv0J00kraxehXrlgrHf+I4sxAvVYKbwtsXXi08ela3hlwS+Kvibqf+x2tqDrVuWEILAHDkD1eoBb/15nK5XAIMb1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562301; c=relaxed/simple;
	bh=K1Gr+aLk2G42C9RgkcZD+nIQ5P+OEJfi74ouHBrvAYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSihBQyHLe2hC2n5ehp8Xh6+rPJD81jh8bONQhooU+tz+DlViGIhcNox1SA+SgaqwzOxTC6zad/fwMHFNTdj9Iw4MPiKlr3X8aXrlHFv75RcFInCoAijGiN+OVNrIjvcFNswaOqdCVeD096KjrTLrrTc/XtxQIQg2RiphG5BdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG5+I6QQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso3179138a12.3
        for <linux-input@vger.kernel.org>; Sun, 04 Jan 2026 13:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562297; x=1768167097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFooUSrVXm9pvAYpHh/HKF6iHEd9ba7nkhN8dd9UQqs=;
        b=XG5+I6QQbfGlSRsAV56UgWhVvqpmEwq0feduOm3pWXjrfjZAZ5uluqIZf9nq/KuukR
         r9qvfww9LVScMqkVY0wcSin1dfc1Ffo52am95rqsUrbTDd/dNDHJ2FYSUevgglePXOX4
         PVR+07DmiPh5R4uyclXzlvWtYP8MwNqBdmiUHbUPvUNsipVLWp2O+IQYMh4pW1nXmpj8
         XKr4rMx3tgff00aU4DiMBflsNcqB5MNKJZDSTaYss4q9uCdmR6TJUqHql27+W1DX7Hdt
         0c/MJ2e8nixc6a5zV91U6Lpb05lrbUOGV+mEnzQFpYH5vZ8PMWLuv8tKKkx6Ce1B3ZZt
         SBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562297; x=1768167097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gFooUSrVXm9pvAYpHh/HKF6iHEd9ba7nkhN8dd9UQqs=;
        b=s/10rJHk+XRVcSqVftU+fJEv7/2EQHX1O/W46xnf4ewOfZaVFzu5PMhEV4XnNNwhqp
         DVebmZLb1v9bxTx/5qk4sAUGJdfufaJwB8JOhZDKG8tdJDB5L0iCMvyq41qQGAscMNBV
         Vw4QL/CduA2PciLle2bYtdSjtc+T2rRLCGQmwSuy/liRjcEHUIo9J8/CWtStrZTZYjjJ
         Q7LF4QrwiOJHP2IQ67NbcbuZiC6F8NXJoXPNe7uSmQk4qHHsc3ym52NyGsdBtxBZnJXT
         eFs74uo5wz5FEqKsVmo5wbR3Wrp2AL/QHi9vpMuwPz/OpVhGguMA4dZ52gpl0rlAuNE8
         JBxg==
X-Gm-Message-State: AOJu0YzU5tNRCd+0lkFAyxbQnM6i4DD08sezs9WTj2ck5CkqEWy/QSQh
	X/dMyHeMagYZvbmCZ61ypjb97JeirtLntfH6GscC9Twn4EqkEefBL8fP
X-Gm-Gg: AY/fxX5Wr5QuE7O8A2iHOGUJ84Uzti+SS9+jgO7M7czfw44vIoi+rgc8XTLlAxPN+yK
	tEYT2wfmcBG7gPGNZtOJ6ReBSFov53frSjYw24T8Js+GoqcTtvzS7B/fTl32WOh3YeTbKokJy01
	6jMOfp6xLLl4DDgxsQHoQLTtZd9nrSOI5sw6z3gu2TC8d2KVtLdiigOTkOZAMMuLEuvDTLGi2wD
	GfI74L5tobMXrH1OZMTRniFT6FLkKrQAi7G3IJWk3XAwlKzXiM4vu4xWInhdxVzKeCoenw9dNm7
	IuedBtvtaGlkLM3zUPJN0BZHAt6enKHKsW05b1ltteH3IrD3h4I0DiFRtjB7/K1gFJ+oISx0poG
	AGEBbl3/AyEXrQxW0pqBKAM1aMv3UgQPwxElfsuhdptTN8RKAAXu4mr5wAXWoa6S+fdIC7zdH5l
	GF48bY+sol8TNOkf3d3WG86nKlvC/Y5cSUlLHRwePyRF2kZkZXR82IZRozrfSIAbfTAqHGjMmUW
	x4=
X-Google-Smtp-Source: AGHT+IGjUkLkKEMTWYzAwCdwlq8lHOYywpLwMuXneu5ARm5/T3CMRRTVuA7vHtt8tpniBq9fgW1EtA==
X-Received: by 2002:a05:6402:5244:b0:64d:23ac:6ca6 with SMTP id 4fb4d7f45d1cf-64d23ac72fdmr25639337a12.4.1767562296850;
        Sun, 04 Jan 2026 13:31:36 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:36 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 3/6] Input: Fire EV_BTN if found in ev_bit
Date: Sun,  4 Jan 2026 22:31:29 +0100
Message-ID: <20260104213132.163904-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Passes EV_BTN through to handlers and allows reacting to this event by
clients.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-input.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 2bbb645c2ff4..900a6fc9813e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1673,7 +1673,8 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 
 	switch (usage->type) {
 	case EV_KEY:
-		if (usage->code == 0) /* Key 0 is "unassigned", not KEY_UNKNOWN */
+		/* Key 0 is "unassigned", not KEY_UNKNOWN */
+		if (usage->code == 0 && !test_bit(EV_BTN, input->evbit))
 			return;
 		break;
 
@@ -1723,10 +1724,19 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 	    value == field->value[usage->usage_index])
 		return;
 
-	/* report the usage code as scancode if the key status has changed */
-	if (usage->type == EV_KEY &&
-	    (!test_bit(usage->code, input->key)) == value)
-		input_event(input, EV_MSC, MSC_SCAN, usage->hid);
+
+	if (usage->type == EV_KEY) {
+		/* Send out EV_BTN with button number (starts at 1) */
+		if (test_bit(EV_BTN, input->evbit))
+			input_event(input, EV_BTN, usage->hid & HID_USAGE, value);
+
+		if (usage->code == 0)
+			return;
+
+		/* report usage code as scancode if the status has changed */
+		if ((!test_bit(usage->code, input->key)) == value)
+			input_event(input, EV_MSC, MSC_SCAN, usage->hid);
+	}
 
 	input_event(input, usage->type, usage->code, value);
 
-- 
2.52.0


