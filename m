Return-Path: <linux-input+bounces-12618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD8AC64CA
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 10:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F04869E6A23
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 08:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F042749C8;
	Wed, 28 May 2025 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cS4r3ONy"
X-Original-To: linux-input@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9863A2741CB;
	Wed, 28 May 2025 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422368; cv=none; b=Cx9Aqz+pjeovAOyiRvZCLiLAuzmgAMdrBMG1xZjHh8jEnVP44m87I3i6XHWMDCxNWmCeyd54tzxCxYdLiDsV5InJygiiklw+eoagVh/bD1TMhTYGTJGfxwpfeiz30XgEZzFFrjrNyVn7i86MjjXZVtKGieeTgsr7f6tcAjFtMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422368; c=relaxed/simple;
	bh=Lq6l31yiSMMK/xdjQj1gbpL696ZQySei7rEcLc6UYxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jg1ifmVEnouDnIo8GusICzN0YV6X3KLbddcfpFifrnWh4ihpfal47IB8PbOy763x2DSXUeSLmQNhCWe+N+jXwRw6kd8uo9NGqEF9Sb+Bjwa1hnyiVvgltXkllIEQlFhOM5Himkhoydti7P0NRoGNtKvv9W5NvrWy7ZlBwyAKNa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cS4r3ONy; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7QF2Y009472;
	Wed, 28 May 2025 10:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1q8t38OgoK6y/zM/IA/ohu5Xp9gm8cLA+K2Vfs233T8=; b=cS4r3ONym/e0p/Td
	2dcite+5KsLUKLqa7c1X9V/Y4MgD5nMJROPUoxOati3bIXxJO2M7DgECsP7f98Fn
	LFPw09FYECs+4cgvwhCvRqL8g94wVzjU5h1DdZjuFuKGen0dwBLCeL1FgTq67ZLe
	F7SRjnyUHVBF4wNFa9nVFxZT/xNLRTu0D4DIpMg67QExBftjlnwPkjCM1ndBrCxt
	UdUno1qqECEieH4wqjorcbul8r1vqzIh/5jWyaLH3h8taTO5wa595Q6of9zQRvXz
	E1mndoLcYjpaQ7wX6y3iBE72/i3FlJ7ES43QbcGl1iXWY9i+PBWc1jWEbcVd6qUt
	y+F0+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46w54hpk50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 10:52:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 82E2840058;
	Wed, 28 May 2025 10:51:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5E56B5CB48;
	Wed, 28 May 2025 10:50:29 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 10:50:29 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 28 May 2025 10:50:22 +0200
Subject: [PATCH v2 2/2] Input: gpio-keys - fix possible concurrent access
 in gpio_keys_irq_timer()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250528-gpio_keys_preempt_rt-v2-2-3fc55a9c3619@foss.st.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=Lq6l31yiSMMK/xdjQj1gbpL696ZQySei7rEcLc6UYxY=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBoNs5T4Vq1P8ueyaGWzJlUYoXPnFIJkgY0WeH7v
 CH+bKFd6UmJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaDbOUwAKCRCq90auhvHD
 KHCUDAC50vawQKeXvCRGZprN5RXqhIWQ9otbid3yqHqCkTF5gflpnjlgE6cVgdLNerDsXMV1TpP
 UH+f8gW9peFNbnb0Kb20n4uQLfpg0KUU437HOcYF9PT0QbD/89k7mqqMeEHl44NAhe37iQs/9eY
 ct7NacXxqtA//vRZmu51Yr4LumaX2Ku8ghbKP8xsFcpZHnBRwADEPaMMlcDBDCXDOmu50oD4ay4
 6jgaB174PviS9ToQ5X72r4aE9SnsDREOTY4ko2e43sSIGjZk45currgZt72yxlvPEDZ1nxQij99
 E1zp6W6FF2A34OVW0iX/1G4Mjp9gkGIUZ53gK/JewYQyyphzjJTp6rB8HgLO1sPtLYQGl1jidJU
 KeRCUYYZt4tDTeokOTpsv9Q54CkBw/5wvUp4AgPnTpUNIJGhp4OKPXGkoKsQ2mRIq94HPcKVBhy
 u3+s2+IZllX6D7CRPNxNNgs1N2wfr5uofbGeZo5fl0PctFfcDF16OvP4pmcjd349z7WUM=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01

gpio_keys_irq_isr() and gpio_keys_irq_timer() access the same resources.
There could be a concurrent access if a GPIO interrupt occurs in parallel
of a HR timer interrupt.

Guard back those resources with a spinlock.

Fixes: 019002f20cb5 ("Input: gpio-keys - use hrtimer for release timer")
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/input/keyboard/gpio_keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index d884538107c9654d21e37fa20e0b3b6cd9a25ee4..f9db86da0818b24d3b6611b4d4e23c96846dbf18 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -449,6 +449,8 @@ static enum hrtimer_restart gpio_keys_irq_timer(struct hrtimer *t)
 						      release_timer);
 	struct input_dev *input = bdata->input;
 
+	guard(spinlock_irqsave)(&bdata->lock);
+
 	if (bdata->key_pressed) {
 		input_report_key(input, *bdata->code, 0);
 		input_sync(input);

-- 
2.25.1


