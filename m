Return-Path: <linux-input+bounces-12617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57833AC64C8
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 10:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4069E6582
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 08:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2432741DF;
	Wed, 28 May 2025 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S5KkmpbJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2AC272E7E;
	Wed, 28 May 2025 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422368; cv=none; b=hvO/sVse0Bkkf830t3wI98QWpX0Rhv4v3DgspriNuWFd96lEtpaK6udW4sCi7IGnr7Aowu3MgWeVx50569l6aa5ncBxERCItJ8FZEOaiQdrVZ5Xh9YbugCK/5CSHQtkB1XpLmcJqASx0LGLRuBu7Om3MOZPJHq03laDiM0LNFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422368; c=relaxed/simple;
	bh=iNuDCgdNpKdPmqPYhFmyCAmzVB8ms7l5crL7ZLtQg6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J2OIkofQI+oIL7FtC/EpX0eqVkHclT+a0r+C4vTPKwoB92qH2gXNXvE9+N6yL0EsVClb6gpfBdK5zPsOHprND9gnlXguuYIX8QKrKWxKDFD/cVl5osAO6k/xSyjIvxIeiqwcBXRSyDa7FakZzeIXlXwVUehMKd8/hqj4XvUejWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S5KkmpbJ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7RYFo027457;
	Wed, 28 May 2025 10:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	lTTfT+AvJq2S9ZuvxQeGBH9435gx0UEYPeUpGsj4dNk=; b=S5KkmpbJ2g0zh2J8
	HtDGt++y0+Fstv99TJqzpvyxZEDvDpNQu2fcxfrRD55qafMwDtb+sKrbjV8KztA2
	p4QtdbHW5MlaTS3xaBuZeCwc4Z4y6qIvwMvtWVfTeYiNFDETmj9N3azWkKiyV51C
	m9YMIV+7lEDSkPxtvHbWC7/DO+txG+XStDACGYCwJALQoMEtHp93gWhwKAcJU3qQ
	YTbEZsVr4Jpke1kMJT/wdQw0fTL8R0EIxxBAsTfhON0O/ohxtD7C5QrwvOJZWOft
	LT8qFDVEfrWfFW2U7+gWNBUiYKS3dERBcOHHhNQnmsR71V2glVfvWijgvMZ4Aeb1
	SROg7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u50gqst2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 10:52:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8EC464004B;
	Wed, 28 May 2025 10:51:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B4DBB5CB70;
	Wed, 28 May 2025 10:50:29 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 10:50:28 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 28 May 2025 10:50:21 +0200
Subject: [PATCH v2 1/2] Input: gpio-keys - fix a sleep while atomic with
 PREEMPT_RT
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250528-gpio_keys_preempt_rt-v2-1-3fc55a9c3619@foss.st.com>
References: <20250528-gpio_keys_preempt_rt-v2-0-3fc55a9c3619@foss.st.com>
In-Reply-To: <20250528-gpio_keys_preempt_rt-v2-0-3fc55a9c3619@foss.st.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven
 Rostedt <rostedt@goodmis.org>,
        Paul Cercueil <paul@crapouillou.net>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rt-devel@lists.linux.dev>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2425;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=anvCVpjchmsJmzpQJTuf9KtYZcnMN3OHoJ+A9QMxREo=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBoNs5SvM/KGKU3rCuFKlMRz7WEpXZvb9cUosXKr
 mcx4AAdbfGJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaDbOUgAKCRCq90auhvHD
 KO8PDACk/JvDAr24U6695cWBWCrPtKeVde9+hJxY56i0EdVkFUVUulVv8t2UQHSUQlZsEqAx/1t
 HZbixrBYJBwx+CrT+BfVX2nOmbNDclXr2usJHnMHiLaPiwRlNT6gSRc4vCgF9TBJojP7ZJFyMJu
 1qoxHVUbz6dylKJij6yuATwJQb8RjWyte3zPm/MeguCT32D4ypA7K8BgWQGIFdxrk46mxIo2aig
 jhP78/ajC4fdQn39H4jIisr5ojDSdExtLQdoVHeApJKoi72gEFCV2gj2wiV6FWXG6oWbOZYna7I
 2TcH/iZh7HAsNdHBDWoVpyWWM1yo7KAaapZ53387K8OvxcRtGI4LBYk5x+UJ/abKrlkjHOJr5PE
 XSDx3BlaE/IXxeHYeu4/+FQC4Ck2s0rhg7yOg1Q3P6NlgmJ9wn0rBoIQNXokDcJhkbv5S0aS/Nq
 9eaOe0ykNzVo7N+btHFCvSPTAORokHBhuU3bs4pF8wllpaxXDp9MXFiB1Mc/WZT9ZYkfA=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01

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

Relax the hrtimer not to use the hard context.

Fixes: 019002f20cb5 ("Input: gpio-keys - use hrtimer for release timer")
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/input/keyboard/gpio_keys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5c39a217b94c8ad03a8542380eed741fccdca5da..d884538107c9654d21e37fa20e0b3b6cd9a25ee4 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -486,7 +486,7 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 	if (bdata->release_delay)
 		hrtimer_start(&bdata->release_timer,
 			      ms_to_ktime(bdata->release_delay),
-			      HRTIMER_MODE_REL_HARD);
+			      HRTIMER_MODE_REL);
 out:
 	return IRQ_HANDLED;
 }
@@ -628,7 +628,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 		bdata->release_delay = button->debounce_interval;
 		hrtimer_setup(&bdata->release_timer, gpio_keys_irq_timer,
-			      CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
+			      CLOCK_REALTIME, HRTIMER_MODE_REL);
 
 		isr = gpio_keys_irq_isr;
 		irqflags = 0;

-- 
2.25.1


