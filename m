Return-Path: <linux-input+bounces-12584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A6AC40CD
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 15:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23EB168B69
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 13:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424F420CCC9;
	Mon, 26 May 2025 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N59tftQH"
X-Original-To: linux-input@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6794A83CC7;
	Mon, 26 May 2025 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267947; cv=none; b=lD63Ohs2zpPzmd8Jqh/pqh5vdJcsjqRe13nRsRNCJeB4QXkdnE3MhbPx3ZHzLGswL4K9kLw0dYVxeLxxfJPlP04DzKADIbOeMkzqbvl/NLf/DFtcqFQDld/g1PoE8COsPyY0N60BDSKIwayhJx4Q8mRzYiOYb1wbPjvo+usJf0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267947; c=relaxed/simple;
	bh=dKulxEiY15lZectwjfcMxxTI9E66Z9Afnh4p1oVGxWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SiIEpWzfw5bMZYnBdB4vSKxB6pbmDOkQ8eHm966STlMPRC0VTZ4HLhWjy9r1zKTCs4tnTzSbm27e0ZG4jSrAzc6YfS4qPtrOhNshWAuCePSg3pl6Lkr6MyhmwB+aZhhz21zq46J1HZ4VZa/4GSWhu982fwKW48rXfXsZSoBjTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N59tftQH; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QB4ouB008311;
	Mon, 26 May 2025 15:58:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=iME9KjGK67m/xnxG1WewEK
	y8P1UELljqtP5FxofjwTI=; b=N59tftQHIzhDI2/lM6Kd+IfC4HPphcauLRknuR
	d7F+3gpdoBHpdj/G1RvVsznikUV0MTyon2nNnh4eQeqRPv8ChEtJeEru1y6Ex9zD
	wChqXqcT8SSjY9kjDMgh+kXe73wHdjAjl4LrSXDtqsKlx+d138sajasF3bZWWvBC
	vUkJgV5GkfGqT9iEq8uN2XfTjDGn67g9JK1RGjn0wdQ0110zRQBDKvrPUemsxg1Z
	3KuuH+locyPobhB0/o9NotnCXz1cCDgY3FS5G/rNOkmwEnhXrbVb75PmPbvw40yU
	/IdAjo8WYLE71TJzB6sdrkdLgdSJgXbQUwDjjUQ9ZvQc3Qmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f1ych7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:58:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7A06440044;
	Mon, 26 May 2025 15:57:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBD5EA605A1;
	Mon, 26 May 2025 15:56:39 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 15:56:39 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 26 May 2025 15:56:29 +0200
Subject: [PATCH] Input: gpio-keys - fix a sleep while atomic with
 PREEMPT_RT
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-gpio_keys_preempt_rt-v1-1-09ddadf8e19d@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAAxzNGgC/x2MQQqAIBAAvxJ7TlAhyb4SIVGrLZGKShTR35OOw
 zDzQMZEmGFoHkh4UqbgK4i2gWWbvUNGa2WQXHa8k4q5SMHseGcTE+IRi0mFCa6EXno7a6GgplV
 Zuv7tOL3vB+IbmDRmAAAA
X-Change-ID: 20250526-gpio_keys_preempt_rt-10619c8fa916
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven
 Rostedt <rostedt@goodmis.org>,
        Paul Cercueil <paul@crapouillou.net>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rt-devel@lists.linux.dev>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=DHxEGb/AHMv5Ys0f78ixiNKy6Fq8z4olwXnij6qd/UY=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBoNHMWhHk7FXvpM83LciQUxRozhzBRNolr/gI+0
 xfOyz+JYH2JAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaDRzFgAKCRCq90auhvHD
 KJHvDAC91aT4V0KtljJ3XRSPIZfu3e6zZwtx2RD9L/5XKxZAJO2SawRHPAtuTumMEkKtToShzak
 jRRFS4dbz9JtcxAXYWtYdnPK26Ahorao+XbnK+g9OeNdDdnaZX5pUPi9eqeBXduhLlYklwxP9rz
 P8JTMLNlcW0uoZdLD5nqLEeQT5ujokfpmnVUZX0AQJVrRuS5Ia3Ok4q1ycmLRIHglVj70jecPX3
 6pz1MSG6PIg9lJHExHjKwQHhvSxukHSVDVEoX8azZXD6WAw5KVonqVmkty73zhmTN6UxDbUkVEk
 Da4/O6o0CJvnEG1WmVOCK50+eEcxsMa6aZf2AQ44zXEHYwylSJRYgYt9z+BqO+wjPzjVQl/8+G6
 vFP7Uvt1E7CEMEPEdx9iClH8toYits3np4jIXGIdxctanL3LGcN4ZHxEXmEXnM+BloT0WrER6G7
 gMinoYt2JLKSHUm1g5lDTAzFuThEt7ufzvb3gc5TNz073dmqMv4VkVGKMY3FUrvvcYj4A=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_07,2025-05-26_02,2025-03-28_01

From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

When enabling PREEMPT_RT, the gpio_keys_irq_timer() callback runs in
hard irq context, but the input_event() takes a spin_lock, which isn't
allowed there as it is converted to a rt_spin_lock().

[ 4054.289999] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
[ 4054.290028] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/0
...
[ 4054.290195]  __might_resched+0x13c/0x1f4
[ 4054.290209]  rt_spin_lock+0x54/0x11c
[ 4054.290219]  input_event+0x48/0x80
[ 4054.290230]  gpio_keys_irq_timer+0x4c/0x78
[ 4054.290243]  __hrtimer_run_queues+0x1a4/0x438
[ 4054.290257]  hrtimer_interrupt+0xe4/0x240
[ 4054.290269]  arch_timer_handler_phys+0x2c/0x44
[ 4054.290283]  handle_percpu_devid_irq+0x8c/0x14c
[ 4054.290297]  handle_irq_desc+0x40/0x58
[ 4054.290307]  generic_handle_domain_irq+0x1c/0x28
[ 4054.290316]  gic_handle_irq+0x44/0xcc

Considering the gpio_keys_irq_isr() can run in any context, e.g. it can
be threaded, it seems there's no point in requesting the timer isr to
run in hard irq context.

So relax the hrtimer not to use the hard context. This requires the
spin_lock to be added back in gpio_keys_irq_timer().

Fixes: 019002f20cb5 ("Input: gpio-keys - use hrtimer for release timer")
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/input/keyboard/gpio_keys.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5c39a217b94c8ad03a8542380eed741fccdca5da..99fc7d3c29ea5809604915782525fecacb151612 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -448,12 +448,15 @@ static enum hrtimer_restart gpio_keys_irq_timer(struct hrtimer *t)
 						      struct gpio_button_data,
 						      release_timer);
 	struct input_dev *input = bdata->input;
+	unsigned long flags;
 
+	spin_lock_irqsave(&bdata->lock, flags);
 	if (bdata->key_pressed) {
 		input_report_key(input, *bdata->code, 0);
 		input_sync(input);
 		bdata->key_pressed = false;
 	}
+	spin_unlock_irqrestore(&bdata->lock, flags);
 
 	return HRTIMER_NORESTART;
 }
@@ -486,7 +489,7 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 	if (bdata->release_delay)
 		hrtimer_start(&bdata->release_timer,
 			      ms_to_ktime(bdata->release_delay),
-			      HRTIMER_MODE_REL_HARD);
+			      HRTIMER_MODE_REL);
 out:
 	return IRQ_HANDLED;
 }
@@ -628,7 +631,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 		bdata->release_delay = button->debounce_interval;
 		hrtimer_setup(&bdata->release_timer, gpio_keys_irq_timer,
-			      CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
+			      CLOCK_REALTIME, HRTIMER_MODE_REL);
 
 		isr = gpio_keys_irq_isr;
 		irqflags = 0;

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250526-gpio_keys_preempt_rt-10619c8fa916

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


