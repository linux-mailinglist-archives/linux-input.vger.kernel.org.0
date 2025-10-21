Return-Path: <linux-input+bounces-15645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685ABF9253
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 00:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B389940250D
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 22:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804B92BE05B;
	Tue, 21 Oct 2025 22:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lb+Ydi/k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52523299AAC;
	Tue, 21 Oct 2025 22:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761086958; cv=none; b=qvGa3i1SSNg1DcVMokT2ny5R4u6VMe14y0/NSlTSkTqhbj4T3CAlIYzFAhq2uhuz1StpEmFjiAM//8cnZxmrAuX42xPMynZhRTQq052wmJIXwOUq1OnN0oP1jGXDJaGmVFJPuhNEJYwrE4AOuMjSkCs+Q9dnsJUVo0uX1ZTLD9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761086958; c=relaxed/simple;
	bh=afMwNk4H6CfXYhM/Mntmd/AwB1P/ReKaPUkcX6yAGC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CsT3sS0xmpkt1vuECdeorXL6fiBQBHtWernP3bbvrkKoiGQtSTyAxagbgKFN3DHTocwmvHbkkMjFitO7HE4XK1lSK/5XDNyapfmFUa258o/R83qsQS5MizpKZkpxDcc2BfJKOwV9ERnQVnkMYWcIWwqD4fZlUmIyMRk0+pbKYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lb+Ydi/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDEFC4CEF1;
	Tue, 21 Oct 2025 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761086957;
	bh=afMwNk4H6CfXYhM/Mntmd/AwB1P/ReKaPUkcX6yAGC4=;
	h=From:Date:Subject:To:Cc:From;
	b=Lb+Ydi/k4eFirtXg0sLErurW+5I5z1gomh+64L+pggWY9L94GPaXhxYRS1TXjnm63
	 AgD88ohUxzSKGOnaBR6LK7vLBYSnTaI1xxXMMUgbclTDTu8xUCAVJ/j9ke6HX9I3y4
	 ytRLv20JcbPt2nCOcqMpniD1SQxYRYAQtiCsSDiieR+wkaM43hSQ++GJyPX1N4YNxc
	 G9cfpW6FdCt9Wq0mA3JrGgsezdrS7UaRuDKw13DsbDdzYO2p+2qmLHiL1TFxAOXGK+
	 mGoIVrCEaHI7CckzBCmw8lcBlDEoQs+XNxIdYsalgDHBhhnC29pukxgC3LRyt7qilK
	 5g4Hf7PqF2Npg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 22 Oct 2025 00:49:08 +0200
Subject: [PATCH] HID: intel-ish-hid: Fix -Wcast-function-type-strict in
 devm_ishtp_alloc_workqueue()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOMN+GgC/x3MwQqDMAyA4VeRnBdo6ybiq8gOoU1nLlWa6gbiu
 xt2/OHjP0G5CitM3QmVD1FZi4V/dBAXKh9GSdYQXHh5FzyKLm3DLD/Me4nNOEbShl+qBYfBpT4
 Rj5SfYIutssn/fn5f1w0EQ+ADbgAAAA==
X-Change-ID: 20251021-ishtp-fix-function-cast-warn-660d3dae8af4
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Zhang Lixu <lixu.zhang@intel.com>
Cc: Kees Cook <kees@kernel.org>, linux-input@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468; i=nathan@kernel.org;
 h=from:subject:message-id; bh=afMwNk4H6CfXYhM/Mntmd/AwB1P/ReKaPUkcX6yAGC4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBk/eF/fY42+UnHrbh5D8mFr62nhGhtVEz6ttBIOW755c
 X7m2g9WHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiZ2Yw/I9U/9y0xvnNo1SZ
 LazZP0vSnxT+CC+VEeoxmhf6/PCKI/MZGd7omLw6/fLw6slBh+wkHEumPDx+hm1hW6Fm7ifDHzu
 kp/AAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  drivers/hid/intel-ish-hid/ipc/ipc.c:935:36: error: cast from 'void (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
    935 |         if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
        |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  include/linux/device/devres.h:168:34: note: expanded from macro 'devm_add_action_or_reset'
    168 |         __devm_add_action_or_ireset(dev, action, data, #action)
        |                                         ^~~~~~

This warning is pointing out a kernel control flow integrity (kCFI /
CONFIG_CFI=y) violation will occur due to this function cast when the
destroy_workqueue() is indirectly called via devm_action_release()
because the prototype of destroy_workqueue() does not match the
prototype of (*action)().

Use a local function with the correct prototype to wrap
destroy_workqueue() to resolve the warning and CFI violation.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2139
Fixes: 0d30dae38fe0 ("HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 59355e4a61f8..abf9c9a31c39 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -924,6 +924,11 @@ static const struct ishtp_hw_ops ish_hw_ops = {
 	.dma_no_cache_snooping = _dma_no_cache_snooping
 };
 
+static void ishtp_free_workqueue(void *wq)
+{
+	destroy_workqueue(wq);
+}
+
 static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct device *dev)
 {
 	struct workqueue_struct *wq;
@@ -932,8 +937,7 @@ static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct device *dev)
 	if (!wq)
 		return NULL;
 
-	if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
-				     wq))
+	if (devm_add_action_or_reset(dev, ishtp_free_workqueue, wq))
 		return NULL;
 
 	return wq;

---
base-commit: 828aeac92901c1f31b51ae0b9d792b9af5bd3e27
change-id: 20251021-ishtp-fix-function-cast-warn-660d3dae8af4

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


