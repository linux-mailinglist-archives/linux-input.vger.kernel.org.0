Return-Path: <linux-input+bounces-16778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD183CF154E
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 22:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB14D3011A60
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 21:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD342F12C6;
	Sun,  4 Jan 2026 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzrYKwEe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7E2EE262
	for <linux-input@vger.kernel.org>; Sun,  4 Jan 2026 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562299; cv=none; b=K4VXpi/W/942DJcpqsi7+uD4J4BQWf00t+tp04qpWTrLKPNsNYa4OazxQUWdVlL4pRiY+AuAlj6d/PJeHZYwwYK1GMBQow7MBRxr4pB8tlxiok6+bfxviaixzC5YxgRI7AsmwAo4iwEWiY/So5K6LEGvwgUgHt/haFFtNnWbwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562299; c=relaxed/simple;
	bh=f/uwheFHSzT2MnHEE13G2RW3ofjy0vNjvK4QXFqbQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooqyv25gySX52X84lXFajrjse7Ba2X0ps3XbqsjLjfvIP+opVHjn1qFOvZAP/5Tv12ogbUhG27rJR13AWfi/Hr0rXTlQeZPvkk15XTBk6viJf1oDe2XSq5iosuhzuEEeWbrClWcTCQL0AxktV12ODRpSDxVn5oHR/dVvtvHxag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzrYKwEe; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso3179134a12.3
        for <linux-input@vger.kernel.org>; Sun, 04 Jan 2026 13:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562296; x=1768167096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ju9uJ8HtmgaH2DMl24DFV+9KpxYvqpDWRQN/CQZFw=;
        b=jzrYKwEefYi6T1sJ/ERtENot+z3voBmVCNU0Il+yUUsksJ1Fu/S4RYve24asGgIX+g
         uQHxhFMcbJZvhwVrJxws8HBbPj9MJ3y81RDu0J2FPLLq+WxQrxhY2rvpSmEMDPrdZrze
         yGrq6Hdok5bXzEryBaRalHr12FJuPeFtA5ZjvMEJAsknMrSfJgftGnIBgOuh6ce77Kty
         U+YFoTRZU6wvGle9XzOdhgVBXzJrJYnSF+KlCbsOdmBIGUOZTWT+TvqBLGiwRjOTNUiN
         BFvkumgk4hsZ8eVqkRZiT8z+IrYigLKYL+w5NRon9mRol3ezev1NXYpHXQ72Rd/mzqMw
         nAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562296; x=1768167096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1ju9uJ8HtmgaH2DMl24DFV+9KpxYvqpDWRQN/CQZFw=;
        b=lqthTbf9bNuQLaVLAwloo2wYap/2EOPQ3JYL373tkxA0RpKTutAamjDxsIqQSHq7gq
         26U9AI1Q7Nt3ibiXGPFyUFbcT47FQlicfkIxfI7BnUE7GZoRPE0zRi3R4aJso0Vdz3jY
         F81h92EW/tHWjg/3TLZlwZK+qeFcTK4mU3E68zoIDAuK3/FTutBtxXd/3n2hf5CVOkY+
         JnKjm7+s60i8InkZ32oEuhsS1P4f+udNheF69EADkGLQP33bPvH6F6q74tUI2aixcBAs
         swJgTlQPWBKwbPsI5sxBznttcA499r0nLoFUA8dleFxrN+3qEzWKd4sl6oajZbU+kgkz
         arkQ==
X-Gm-Message-State: AOJu0YyZa/Xwyyj5J8szSKModetq3gW8IjKbSt1h7e4ax4ZN9JtTQDTe
	+iM9Z9e4rvmPypyPe+6jpqPMMzwqfxwXzmWNwD7Mry6krLDkovktNkC1
X-Gm-Gg: AY/fxX7lV79iBqVKdPQvJ4kx4it8hX40rblV1D/zC4LusIILqpSKQCpqIhJABopJNs4
	hEiMSRTLzDVWvBy1ewX+6pA3KTwADflOgzsqZrRaVAWyt5BbApaHTMJWNZ1LhO5z1CtF9G5sRhs
	txoMaavhW5l7mSmUe6p2Fk3FPbuB8EcTeXUW3UcNECi0X5MJsgPgH3C9Qm1Wv8DHqIG+69E8O20
	s49wAE/J6TtrjBpxiGoCfuAI0U4SMpVwB8GSByoBriJ5omXZ/nJO4oZ0F/sQEajAlW+uy0l9asz
	72i8dBDcAeDZjgv0UNQLbXm4MPQX65hui5XUXzm/zG98U1BgvDEfv1NA6kAKtO1ux/Ji8K/+Dop
	wLHKXviV6GSWw/bz4CZwwvDGXTLYv0QajLSZG9CLuslKPHH/UyRF9mha6UR+tkzWlA7aivtMMNn
	bZoaJ2Qq1BC/auBnE+7DO1zOomkUEHT2Q0/w5IuLVHM0SFznrJXbxQXVBljSReBleb
X-Google-Smtp-Source: AGHT+IH2FCylLobZ0wkmnV3e/fGGLODdTT8iSPZe82AXEhgV2cQNmF9xtamMrKBG4lju1W+Of3dwhg==
X-Received: by 2002:a05:6402:268a:b0:64b:76cb:5521 with SMTP id 4fb4d7f45d1cf-64b8e94bf43mr26815872a12.2.1767562295814;
        Sun, 04 Jan 2026 13:31:35 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:35 -0800 (PST)
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
Subject: [RFC PATCH 2/6] Input: Add info about EV_BTN
Date: Sun,  4 Jan 2026 22:31:28 +0100
Message-ID: <20260104213132.163904-3-tomasz.pakula.oficjalny@gmail.com>
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

Add necessary bits to modalias etc. Store the number of buttons.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/input/input.c | 10 ++++++++++
 include/linux/input.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index a500e1e276c2..e926327443bb 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -258,6 +258,10 @@ static int input_get_disposition(struct input_dev *dev,
 		}
 		break;
 
+	case EV_BTN:
+		disposition = INPUT_PASS_TO_HANDLERS;
+		break;
+
 	case EV_ABS:
 		if (is_event_supported(code, dev->absbit, ABS_MAX))
 			disposition = input_handle_abs_event(dev, code, &value);
@@ -1124,6 +1128,8 @@ static int input_devices_seq_show(struct seq_file *seq, void *v)
 		input_seq_print_bitmap(seq, "FF", dev->ffbit, FF_MAX);
 	if (test_bit(EV_SW, dev->evbit))
 		input_seq_print_bitmap(seq, "SW", dev->swbit, SW_MAX);
+	if (test_bit(EV_BTN, dev->evbit))
+		seq_printf(seq, "I: BTN=%u\n", dev->button_count);
 
 	seq_putc(seq, '\n');
 
@@ -1347,6 +1353,7 @@ static int input_print_modalias_parts(char *buf, int size, int full_len,
 				'f', id->ffbit, 0, FF_MAX);
 	len += input_print_modalias_bits(buf + len, size - len,
 				'w', id->swbit, 0, SW_MAX);
+	len += snprintf(buf + len, size - len, "t%u", id->button_count);
 
 	return len;
 }
@@ -1679,6 +1686,8 @@ static int input_dev_uevent(const struct device *device, struct kobj_uevent_env
 		INPUT_ADD_HOTPLUG_BM_VAR("FF=", dev->ffbit, FF_MAX);
 	if (test_bit(EV_SW, dev->evbit))
 		INPUT_ADD_HOTPLUG_BM_VAR("SW=", dev->swbit, SW_MAX);
+	if (test_bit(EV_BTN, dev->evbit))
+		INPUT_ADD_HOTPLUG_VAR("BTN=%u", dev->button_count);
 
 	INPUT_ADD_HOTPLUG_MODALIAS_VAR(dev);
 
@@ -2113,6 +2122,7 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
 		break;
 
 	case EV_PWR:
+	case EV_BTN:
 		/* do nothing */
 		break;
 
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63..f6389de4a4d1 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -59,6 +59,7 @@ enum input_clock_type {
  * @sndbit: bitmap of sound effects supported by the device
  * @ffbit: bitmap of force feedback effects supported by the device
  * @swbit: bitmap of switches present on the device
+ * @button_count: number of generic buttons present on the device.
  * @hint_events_per_packet: average number of events generated by the
  *	device in a packet (between EV_SYN/SYN_REPORT events). Used by
  *	event handlers to estimate size of the buffer needed to hold
@@ -152,6 +153,7 @@ struct input_dev {
 	unsigned long ffbit[BITS_TO_LONGS(FF_CNT)];
 	unsigned long swbit[BITS_TO_LONGS(SW_CNT)];
 
+	unsigned int button_count;
 	unsigned int hint_events_per_packet;
 
 	unsigned int keycodemax;
-- 
2.52.0


