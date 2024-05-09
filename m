Return-Path: <linux-input+bounces-3635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA428C0F59
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 14:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7D7928145F
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 12:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EEA14B08A;
	Thu,  9 May 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Ph7A3Lic";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Vkx+UJ/E"
X-Original-To: linux-input@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34E18E0E;
	Thu,  9 May 2024 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715256511; cv=none; b=oAcLX8RZ59jYoTVOiejdWaORwnGzJhv+CKbx5C56DfdXdO7pgSmwqden2x7GB0YjsYIRSJtXyJqI1xVg+q44uks2iAe1j7dMujyfKhvTls9stEPbKfddC7keTNDsz31qh5HpNitpkY1YG5n7n6eDm6aFPJdVK+wOfT7jIZj+YcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715256511; c=relaxed/simple;
	bh=k+8ktLJhujlCEcrtylMtNbUYtqQY1OvRPCIur+o7it0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUWbP2kQUVLS7vFZUCGN5GqUUMyMbqyccbLB5Qwse9IzwAwKd6RtNi0bC/ybCrb/g9IR1h/XMc7Q0K1T/QIyHlbkGenmrQ7XDIgaqSDBdit8JHmJkVkkBmVoiEomuuTB+tgdWnRf3wXWv2JZ4yAFu/OFUWeW5NZ3RG6Rxwtx+cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=Ph7A3Lic; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=Vkx+UJ/E; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 1A27CFB03;
	Thu,  9 May 2024 14:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1715256051; bh=k+8ktLJhujlCEcrtylMtNbUYtqQY1OvRPCIur+o7it0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ph7A3LicOVk/nBXEyXfAlunaorM4dMrLkzLXKHKotd8w56qjjUfdyYLEAx4QaGiA1
	 9J+DiXMSDq3EhbUZbIQq/wT2Vq4EFR1r8p9GwhiBbPDAV8YnGQ575xFlGbtdq8Ekp0
	 XoqLqgCOgzY5CiqnT1p+1ILJzwBkwmCJyVl6IR93Lxw8XiXdn4pt4TD2fUXCurSTK2
	 jVF/IptTJNiow9Y7b9Sztr8oxMeDwEm2+b8bWK+CvWj7MElnSaLhrutknqAwyLR0Cu
	 JtwCwNEWQ4hPGDykmaQndAApWvZhc4x2PHeH4yh9vjURDtPUJtRNsZN4FAl0RIgPau
	 a4KxoPztoK9pg==
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-h3AaQ5H_a7; Thu,  9 May 2024 14:00:50 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1715256049; bh=k+8ktLJhujlCEcrtylMtNbUYtqQY1OvRPCIur+o7it0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vkx+UJ/Exq6tecjLez5mqSdHP7b7mwB+rJ5xt2OhMz5Mg6o72pQo8Ot7CZ2651eic
	 Ltv/j8WEmkbEMf9xAemSyNXXcRrgDAbax5/TnwQCy8tYbXuzVplaTCmgSPe3h0Cbee
	 9EeF9rFIt4coF6ZI3t/TXkEEMU6KO6/gfunLwoWO7Zh1GxH5U+9lhUQ2LpthR680PA
	 9VKauEOqmgwbO+q1L2zVDUTXqatkhoznShsofquBU7uYXP0UBNjPN43Numg5yF86vX
	 i6xinTWAMN7jktf70Unb7e/eVkV14yHyE753GZhztm/+aaAEv0+r2FsSxWmErPD0hf
	 1xK8jEupLRqHw==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hermes Zhang <chenhuiz@axis.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: [PATCH v1 1/1] Input: gpio-keys - expose wakeup keys in sysfs
Date: Thu,  9 May 2024 14:00:28 +0200
Message-ID: <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1715255980.git.agx@sigxcpu.org>
References: <cover.1715255980.git.agx@sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This helps user space to figure out which keys should be used to unidle a
device. E.g on phones the volume rocker should usually not unblank the
screen.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/input/keyboard/gpio_keys.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 9f3bcd41cf67..84f43d1d4375 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -198,7 +198,8 @@ static void gpio_keys_enable_button(struct gpio_button_data *bdata)
  */
 static ssize_t gpio_keys_attr_show_helper(struct gpio_keys_drvdata *ddata,
 					  char *buf, unsigned int type,
-					  bool only_disabled)
+					  bool only_disabled,
+					  bool only_wakeup)
 {
 	int n_events = get_n_events_by_type(type);
 	unsigned long *bits;
@@ -218,6 +219,9 @@ static ssize_t gpio_keys_attr_show_helper(struct gpio_keys_drvdata *ddata,
 		if (only_disabled && !bdata->disabled)
 			continue;
 
+		if (only_wakeup && !bdata->button->wakeup)
+			continue;
+
 		__set_bit(*bdata->code, bits);
 	}
 
@@ -297,7 +301,7 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
 	return error;
 }
 
-#define ATTR_SHOW_FN(name, type, only_disabled)				\
+#define ATTR_SHOW_FN(name, type, only_disabled, only_wakeup)		\
 static ssize_t gpio_keys_show_##name(struct device *dev,		\
 				     struct device_attribute *attr,	\
 				     char *buf)				\
@@ -306,22 +310,26 @@ static ssize_t gpio_keys_show_##name(struct device *dev,		\
 	struct gpio_keys_drvdata *ddata = platform_get_drvdata(pdev);	\
 									\
 	return gpio_keys_attr_show_helper(ddata, buf,			\
-					  type, only_disabled);		\
+					  type, only_disabled,		\
+					  only_wakeup);			\
 }
 
-ATTR_SHOW_FN(keys, EV_KEY, false);
-ATTR_SHOW_FN(switches, EV_SW, false);
-ATTR_SHOW_FN(disabled_keys, EV_KEY, true);
-ATTR_SHOW_FN(disabled_switches, EV_SW, true);
+ATTR_SHOW_FN(keys, EV_KEY, false, false);
+ATTR_SHOW_FN(switches, EV_SW, false, false);
+ATTR_SHOW_FN(disabled_keys, EV_KEY, true, false);
+ATTR_SHOW_FN(disabled_switches, EV_SW, true, false);
+ATTR_SHOW_FN(wakeup_keys, EV_KEY, false, true);
 
 /*
  * ATTRIBUTES:
  *
  * /sys/devices/platform/gpio-keys/keys [ro]
  * /sys/devices/platform/gpio-keys/switches [ro]
+ * /sys/devices/platform/gpio-keys/wakeup_keys [ro]
  */
 static DEVICE_ATTR(keys, S_IRUGO, gpio_keys_show_keys, NULL);
 static DEVICE_ATTR(switches, S_IRUGO, gpio_keys_show_switches, NULL);
+static DEVICE_ATTR(wakeup_keys, S_IRUGO, gpio_keys_show_wakeup_keys, NULL);
 
 #define ATTR_STORE_FN(name, type)					\
 static ssize_t gpio_keys_store_##name(struct device *dev,		\
@@ -361,6 +369,7 @@ static struct attribute *gpio_keys_attrs[] = {
 	&dev_attr_switches.attr,
 	&dev_attr_disabled_keys.attr,
 	&dev_attr_disabled_switches.attr,
+	&dev_attr_wakeup_keys.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(gpio_keys);
-- 
2.43.0


