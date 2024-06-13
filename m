Return-Path: <linux-input+bounces-4348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D863907C65
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 21:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53C7288C8E
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 19:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070DF158A0A;
	Thu, 13 Jun 2024 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FtFbQyd9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F315887C
	for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306274; cv=none; b=XP8d848K54zcoeyvqmjStXcU7BbvMiiqHqD6UmOvbRiWetWjGfYgV3c+EH2DTe8BWZVjECOshYLzQDBY9I8ckzT2hIBYHbN1MczpPAPZF9a4PSIePlLNR5OA1nQilcJ3mpRlR/vQHXWLGaxi8nSDtNMeJk5t+yra4XWuxNt0nOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306274; c=relaxed/simple;
	bh=JnrkH5FyMjsCzZIiYdt1ni9oWej36xLzQp8VsV/K6Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d4KiSyeIEI7ieqsp5SwRDbTkHb2nSgBccri89L1DveAcVB2t/05MbcW1wmBHUkSlad+1PlMY/kJTWRJ7CdwzJyMUvBVy7h2z+96+AGwsE3Qm+vM2M+PMKSYwa/h4TxzLftgeIS0suLHz3n6PJwxPLhDIMqjExiR4esa+1+pMhcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FtFbQyd9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-795482e114cso80574785a.1
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1718306272; x=1718911072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6QyinaOFJqkp/FwCYbZM2RK9dvc3sFq+NiGTtbWdDw=;
        b=FtFbQyd9hEgyPQaFcppmnWLiclwQsmsLmNvTmXeXeMUQDRsB3XhWLi4Tzsnr+9aHYa
         YDikcMSn9jx5SD8OgJCQB5SCm78eB4tR0K1zDf4xY1IYJMqwf1byQG8dWW3nmArFP38I
         6z0oT+MxGOb+YLTBBs1JdUAnis210oqGTYSgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306272; x=1718911072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6QyinaOFJqkp/FwCYbZM2RK9dvc3sFq+NiGTtbWdDw=;
        b=ShYz0Zz2qlj89ex36pr7PyoSMhzJ9fho/MVtKt0Q/QLW8mdA1fYpFj/TkSvYCYNpi0
         gw2HosWVuuZDlpdYUHLdDqghUEDq3xB9PUaLsn2EpCiILUWlczt5yMm4r9twOMFErokH
         bX5eks5qk4KXJPRu7aaQQecINSyMOrGym8sGAajil7oTXgTF610k2dvdaKYEfg5DjCEz
         Ou/FAcnELxhALCxsKt/7bxD2NHyUljV8oJcGPZYfkAewlzDad9+gqEnK4MkdeBTNk5OB
         THnvGJKBo1txF3xHbqy/R7uvZ7ERJz+3eZcSsWx22uUY8Yl6CkJmMJWZjVdLbUbhQ6sY
         MmAA==
X-Forwarded-Encrypted: i=1; AJvYcCWuOGeX5S9bLKIL9lWzGZDqG9Kp48Hg3MNPRLjwIUfc+VAsrVgjFDRgK9ii/hSIKC3P8SVWR190zoZiybg266icrqzE2SltB8TsTYE=
X-Gm-Message-State: AOJu0YzdGtaYyxCRkFGTAg5V+xGTSQaUN5hgkN05WxyQppd8DKfLLOMO
	PF1RmyGv/obwh3UjfQtizBs/sxbaVTmNb7VQ2RQ87T4ma0SeFTqqiTYxjn5TZQ==
X-Google-Smtp-Source: AGHT+IEhHo4/bVvLX5CCRFwAPWXs+0Q6azIN2QMKWV00z/494lBSBlAsOpG3aNUM+fwFk0Vdxltj4A==
X-Received: by 2002:a05:6214:cab:b0:6b0:6443:7fcb with SMTP id 6a1803df08f44-6b2afc793b7mr7504386d6.10.1718306272057;
        Thu, 13 Jun 2024 12:17:52 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:51 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	mingo@redhat.com,
	tglx@linutronix.de
Cc: x86@kernel.org,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	zackr@vmware.com,
	linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com,
	timothym@vmware.com,
	akaher@vmware.com,
	dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	horms@kernel.org,
	kirill.shutemov@linux.intel.com,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Tim Merrifield <tim.merrifield@broadcom.com>
Subject: [PATCH v11 8/8] x86/vmware: Add TDX hypercall support
Date: Thu, 13 Jun 2024 12:16:50 -0700
Message-Id: <20240613191650.9913-9-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMware hypercalls use I/O port, VMCALL or VMMCALL instructions.
Add __tdx_hypercall path to support TDX guests.

No change in high bandwidth hypercalls, as only low bandwidth
ones are supported for TDX guests.

Co-developed-by: Tim Merrifield <tim.merrifield@broadcom.com>
Signed-off-by: Tim Merrifield <tim.merrifield@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 45 +++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c  | 51 +++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index d83444f03969..c9cf43d5ef23 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -18,6 +18,12 @@
  * arg2 - Hypercall command
  * arg3 bits [15:0] - Port number, LB and direction flags
  *
+ * - Low bandwidth TDX hypercalls (x86_64 only) are similar to LB
+ * hypercalls. They also have up to 6 input and 6 output on registers
+ * arguments, with different argument to register mapping:
+ * %r12 (arg0), %rbx (arg1), %r13 (arg2), %rdx (arg3),
+ * %rsi (arg4), %rdi (arg5).
+ *
  * - High bandwidth (HB) hypercalls are I/O port based only. They have
  * up to 7 input and 7 output arguments passed and returned using
  * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
@@ -54,6 +60,12 @@
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
+/*
+ * Hypercall command mask:
+ *   bits [6:0] command, range [0, 127]
+ *   bits [19:16] sub-command, range [0, 15]
+ */
+#define VMWARE_CMD_MASK			0xf007fU
 
 #define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
 #define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
@@ -64,6 +76,15 @@ extern unsigned long vmware_hypercall_slow(unsigned long cmd,
 					   u32 *out1, u32 *out2, u32 *out3,
 					   u32 *out4, u32 *out5);
 
+#define VMWARE_TDX_VENDOR_LEAF 0x1af7e4909ULL
+#define VMWARE_TDX_HCALL_FUNC  1
+
+extern unsigned long vmware_tdx_hypercall(unsigned long cmd,
+					  unsigned long in1, unsigned long in3,
+					  unsigned long in4, unsigned long in5,
+					  u32 *out1, u32 *out2, u32 *out3,
+					  u32 *out4, u32 *out5);
+
 /*
  * The low bandwidth call. The low word of %edx is presumed to have OUT bit
  * set. The high word of %edx may contain input data from the caller.
@@ -79,6 +100,10 @@ unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    NULL, NULL, NULL, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
 					     NULL, NULL, NULL, NULL, NULL);
@@ -100,6 +125,10 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    out1, out2, NULL, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
 					     out1, out2, NULL, NULL, NULL);
@@ -121,6 +150,10 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    out1, out2, out3, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
 					     out1, out2, out3, NULL, NULL);
@@ -143,6 +176,10 @@ unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5,
+					    NULL, out2, NULL, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
 					     NULL, out2, NULL, NULL, NULL);
@@ -167,6 +204,10 @@ unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, 0, 0,
+					    NULL, out2, out3, out4, out5);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, in3, 0, 0,
 					     NULL, out2, out3, out4, out5);
@@ -191,6 +232,10 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5,
+					    out1, out2, out3, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
 					     out1, out2, out3, NULL, NULL);
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index d24ba03b30b8..708048b8a095 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -477,6 +477,57 @@ static bool __init vmware_legacy_x2apic_available(void)
 		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
+#ifdef CONFIG_INTEL_TDX_GUEST
+/*
+ * TDCALL[TDG.VP.VMCALL] uses %rax (arg0) and %rcx (arg2). Therefore,
+ * we remap those registers to %r12 and %r13, respectively.
+ */
+unsigned long vmware_tdx_hypercall(unsigned long cmd,
+				   unsigned long in1, unsigned long in3,
+				   unsigned long in4, unsigned long in5,
+				   u32 *out1, u32 *out2, u32 *out3,
+				   u32 *out4, u32 *out5)
+{
+	struct tdx_module_args args;
+
+	if (!hypervisor_is_type(X86_HYPER_VMWARE)) {
+		pr_warn_once("Incorrect usage\n");
+		return ULONG_MAX;
+	}
+
+	if (cmd & ~VMWARE_CMD_MASK) {
+		pr_warn_once("Out of range command %lx\n", cmd);
+		return ULONG_MAX;
+	}
+
+	args.rbx = in1;
+	args.rdx = in3;
+	args.rsi = in4;
+	args.rdi = in5;
+	args.r10 = VMWARE_TDX_VENDOR_LEAF;
+	args.r11 = VMWARE_TDX_HCALL_FUNC;
+	args.r12 = VMWARE_HYPERVISOR_MAGIC;
+	args.r13 = cmd;
+	args.r15 = 0; /* CPL */
+
+	__tdx_hypercall(&args);
+
+	if (out1)
+		*out1 = args.rbx;
+	if (out2)
+		*out2 = args.r13;
+	if (out3)
+		*out3 = args.rdx;
+	if (out4)
+		*out4 = args.rsi;
+	if (out5)
+		*out5 = args.rdi;
+
+	return args.r12;
+}
+EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
+#endif
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 static void vmware_sev_es_hcall_prepare(struct ghcb *ghcb,
 					struct pt_regs *regs)
-- 
2.39.4


