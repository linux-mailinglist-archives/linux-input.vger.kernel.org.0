Return-Path: <linux-input+bounces-12616-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B2AC64C5
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 10:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08094A5152
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 08:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F062741D3;
	Wed, 28 May 2025 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J2foIemk"
X-Original-To: linux-input@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3532741A2;
	Wed, 28 May 2025 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422368; cv=none; b=SVYCYO1XLkWS9ENGeFZ/0rVXTLD7WXo0iHJgOIeZX1l5a4xmF+9EzT8PzIJYlTbTJeiDxWWddO0x+SAdtmh0faqqrCpdNm/OXx08ICXd7ZXE6BT7Z7qjXGpuad9yvMpBoXSFrwJAwH/0uXMADy8CvBEws2sVDORhLkPwrT66aB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422368; c=relaxed/simple;
	bh=exNm3ds/4nIxDzCSPGFXgLVMXTUU+G8UpRm8CZJCc2U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uVt/U5XoOx0jZc0NKs3aFzF8C3DwpRtIj3esPKtDXvC55tZf1Mkj1oFaHTpSa1UaFKV+/NnJ0FMZCfufIoDC1AC4acAoqGnAv4alLxrHdcKyxOSuQI4+dRIX07U5u/Pw5snpOVmga1Cr1P1u9PKGA+vo1n9ELOClh4NbzaSwA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J2foIemk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S89dxr002921;
	Wed, 28 May 2025 10:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=3mNjT694Hvo8StpF+UfB54
	MIj+kX6xlfG4Q/V4jrFIk=; b=J2foIemk8syyUJaDaMec0ubkoX+X8zz45jpE0b
	pMO8bGFKYQCgWeHOyr1G6yTxw9fvMFI/JDWuCNwyyttcFpfK436rEAdRhpVQRxST
	5juqk0h+8BCVqpYuwjzCXt3RWVCHPoAf0jDQqEbAQWpPStjQ59uQkQcK9UKMRnXC
	63nPApvu0o1T+LJRtG9Gxqq68x1ncAXr2PMWSS3fa1hzWlOtBCkdOL4dkAFddZwi
	JC2uv1CFAucqvmoeeyW389HrRfN0W7wsvg0PdU9DEqi3fkGMBrYcuumq/EAYweHH
	ObhwuSi1tX9bvzmGsEhPY/G0Nq8LYbpL7/9rNN52TKLS9THA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u50gqst1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 10:52:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8BE6140047;
	Wed, 28 May 2025 10:51:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55949B5CB7C;
	Wed, 28 May 2025 10:50:28 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 10:50:28 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v2 0/2] Input: gpio-keys - Fixes for interrupt callbacks
Date: Wed, 28 May 2025 10:50:20 +0200
Message-ID: <20250528-gpio_keys_preempt_rt-v2-0-3fc55a9c3619@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzONmgC/4WNUQqDMBBEryL73Ug2oJh+9R5FRMxGl6KRbBBFv
 HtTL9DPN8O8OUEoMgk8ixMibSwclgzmUcAw9ctIil1mMNpUujK1GlcO3YcO6dZINK+pi0mhrtE
 Oje8t1pCnufK839p3m3liSSEe98uGv/SPcEOFSlvneucbQutePoiUksohzNBe1/UF+UoeuboAA
 AA=
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
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=exNm3ds/4nIxDzCSPGFXgLVMXTUU+G8UpRm8CZJCc2U=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBoNs5SbXib7J3tn6EMfVqRRGFDoOYQOGk11aBCx
 pI9t+YZBbeJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaDbOUgAKCRCq90auhvHD
 KFGzC/kB+oiXfvUnB55lfmVSozHo2XnS7CI3njAKjytz2rbJxaCLsZe+7v1tALeAQg8yDJBzRAc
 sPNxFeoLU1y6nO4HSvYPBVqZOF/jmjVdwpMD1WXD2Ua4yo3BakBAN5ME+tAVKux0K8CJnbUREo4
 QqnphVmAgsgTH3ygxWfBr2f3N4JZpTTDHlenvg/n3z5jysBU7l/M3ksZE3l8yXMQophrUVk3qwn
 u5pcQX9EThRosMZ9ntNJzdFjLbNtuk1hmEEIC6aLxVSZvqDwlQMTDSiQolpb6EqOoyoMH5opvu3
 8sA4uKIFOIxjYdYYp+fRo88SjrVV7zcnAszgGVwy+MCNaBZi/pizfsLKBgbGEZfysFD0Zk03qxB
 NdDjVpxmEX7C9Z0NPXoj5BxFsqiwfFkDgkJwYM1CC7+pHKg3QI/JERLZcGVGvcUJjnlELt6xmTU
 rWQR5fQ5NHIJNhCdiMBJb0OvXXRCGzFreVbfGSFAvtANU74laK5sn6AoA7CnjHS27df6I=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01

This patchset fixes a "BUG: sleeping function called from invalid
context" when CFG_PREEMPT_RT is enabled and a possible concurrent access
on button data between gpio_keys_irq_timer() and gpio_keys_irq_isr().

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v2:
- Split fixes into two commits
- Use guard() macro to handle spinlock
- Link to v1: https://lore.kernel.org/r/20250526-gpio_keys_preempt_rt-v1-1-09ddadf8e19d@foss.st.com

---
Fabrice Gasnier (1):
      Input: gpio-keys - fix a sleep while atomic with PREEMPT_RT

Gatien Chevallier (1):
      Input: gpio-keys - fix possible concurrent access in gpio_keys_irq_timer()

 drivers/input/keyboard/gpio_keys.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250526-gpio_keys_preempt_rt-10619c8fa916

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


