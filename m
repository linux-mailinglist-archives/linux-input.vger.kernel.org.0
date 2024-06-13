Return-Path: <linux-input+bounces-4341-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9730E907C37
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 21:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2204F1F2251A
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 19:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D138E152188;
	Thu, 13 Jun 2024 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KfSFgtcW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA16114F104
	for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306239; cv=none; b=dMIbZT905R4cevI5MppbZ0iFjkSG4Wz0ivgjiciU4cZJbrDSkxihhMkAA/CAz7BXzIDelp6W5RAa3nJ30Q3o3ZnklQXTR9RG7QH6rx1Tigu4J28Hen1Pmjb9SS0xhNpEKrlrXr+VKuCxtA7fbVFC3n6TfW37AuU2u3C1oOmeOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306239; c=relaxed/simple;
	bh=50mbFqI9fBr+NxEmKs09WwYX6bgzJxlemRTo/dg8/3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xl3BGKGETTyvKJ2C/aQfwu437Uqf86iSevU4mQpzT2kSz2yLHpmtzi0mdfFwAkGRKWBAw3hnQjZv6dqp3PI3HFdlHwxz209qLidU/ICYqkjI6h6S673Xy3XmFcFLk5v6+wBzy7pc0jxRkcH75nAtQtldjgJ4oXUQqPhZYqyJOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KfSFgtcW; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-795fb13b256so207665485a.0
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1718306235; x=1718911035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC/AYFyoO9S19kQ3qOxs7+XLTodYdZI/b1WzHwADho0=;
        b=KfSFgtcWkZxo91AfNdv85WM5jhY+4g82oYvE4PTJf4D+B8+vGcYzBtidQWN1DlJJfD
         VG71/yIVF1gIEHHSmhbtDFOQjR6eyMt3hCd0Owilvus3+DO/tAnY3BFRrvgFW1Ap+6K/
         W0PE6J7QH5lFHxPE9A6uNbjNkrO5nRVGEKDQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306235; x=1718911035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC/AYFyoO9S19kQ3qOxs7+XLTodYdZI/b1WzHwADho0=;
        b=Xn+Y7IXjBDPOv+JlmFj8ZOWMObcrzor335eeZxZX2Mu38mfTmxfhmye/aP42ooAcdx
         qD0kz0/eipWdfGpTOnsTOQBdJhi89TPyYuie5b8qHWbyLeKHuSRx2LuxiSgjYt/1CYla
         dmUnAWN3GtWRvydUelhmljNryeTTOV2VtM9l2hDjh3wNHUaxpx/O3Ae3lWEzQgxsEfi8
         nXDAXkggxT4gy7vi+15aCTov1PBqjtftV0Vp0la40K4Pe0FubGrD/lARF47DWMkdLV1R
         raNrOMbYY0tI6LSFP+PoMrMh0RuKJ2u8yJTvfycoj6YAxCJ5sYzxwr4agy1y6/Tg47h5
         cMqg==
X-Forwarded-Encrypted: i=1; AJvYcCUgkatHoq3YgGoXvFYMcRJQe2p8Lz1zipcp57+/DvK4Jc9Zip3y67Nz18OMSbMt0N32ujZH3WqcH3oKEPlmeqUZNzlKgfr3q7qGpEU=
X-Gm-Message-State: AOJu0YxAuMjRAAJjQR9O2tX6PfpgjdRdCHtXzECwBrJTmHIEXsTu9/7S
	Jr007lkADr0Uzi1MTDVM+E3Evz1VLSEbijiJzYOA5cX5Tnf2Pw7eLsPEsVctAQ==
X-Google-Smtp-Source: AGHT+IHgqzhScZOgUE/gqvz3OpOTuoDlrnlwif3SW+jviqBJcKlg3UXk9A/jLXi1/PPNVDEkMOEYWA==
X-Received: by 2002:a0c:d6cf:0:b0:6b2:9e53:fe50 with SMTP id 6a1803df08f44-6b2af2ee3famr12897306d6.22.1718306235389;
        Thu, 13 Jun 2024 12:17:15 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:15 -0700 (PDT)
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
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH v11 1/8] x86/vmware: Introduce VMware hypercall API
Date: Thu, 13 Jun 2024 12:16:43 -0700
Message-Id: <20240613191650.9913-2-alexey.makhalov@broadcom.com>
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

Introduce vmware_hypercall family of functions. It is a common
implementation to be used by the VMware guest code and virtual
device drivers in architecture independent manner.

The API consists of vmware_hypercallX and vmware_hypercall_hb_{out,in}
set of functions by analogy with KVM hypercall API. Architecture
specific implementation is hidden inside.

It will simplify future enhancements in VMware hypercalls such
as SEV-ES and TDX related changes without needs to modify a
caller in device drivers code.

Current implementation extends an idea from commit bac7b4e84323
("x86/vmware: Update platform detection code for VMCALL/VMMCALL
hypercalls") to have a slow, but safe path vmware_hypercall_slow()
earlier during the boot when alternatives are not yet applied.
The code inherits VMWARE_CMD logic from the commit mentioned above.

Move common macros from vmware.c to vmware.h.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 279 ++++++++++++++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c  |  58 ++++++-
 2 files changed, 315 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index ac9fc51e2b18..724c8b9b4b8d 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -7,26 +7,277 @@
 #include <linux/stringify.h>
 
 /*
- * The hypercall definitions differ in the low word of the %edx argument
- * in the following way: the old port base interface uses the port
- * number to distinguish between high- and low bandwidth versions.
+ * VMware hypercall ABI.
+ *
+ * - Low bandwidth (LB) hypercalls (I/O port based, vmcall and vmmcall)
+ * have up to 6 input and 6 output arguments passed and returned using
+ * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
+ * %esi (arg4), %edi (arg5).
+ * The following input arguments must be initialized by the caller:
+ * arg0 - VMWARE_HYPERVISOR_MAGIC
+ * arg2 - Hypercall command
+ * arg3 bits [15:0] - Port number, LB and direction flags
+ *
+ * - High bandwidth (HB) hypercalls are I/O port based only. They have
+ * up to 7 input and 7 output arguments passed and returned using
+ * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
+ * %esi (arg4), %edi (arg5), %ebp (arg6).
+ * The following input arguments must be initialized by the caller:
+ * arg0 - VMWARE_HYPERVISOR_MAGIC
+ * arg1 - Hypercall command
+ * arg3 bits [15:0] - Port number, HB and direction flags
+ *
+ * For compatibility purposes, x86_64 systems use only lower 32 bits
+ * for input and output arguments.
+ *
+ * The hypercall definitions differ in the low word of the %edx (arg3)
+ * in the following way: the old I/O port based interface uses the port
+ * number to distinguish between high- and low bandwidth versions, and
+ * uses IN/OUT instructions to define transfer direction.
  *
  * The new vmcall interface instead uses a set of flags to select
  * bandwidth mode and transfer direction. The flags should be loaded
- * into %dx by any user and are automatically replaced by the port
- * number if the VMWARE_HYPERVISOR_PORT method is used.
- *
- * In short, new driver code should strictly use the new definition of
- * %dx content.
+ * into arg3 by any user and are automatically replaced by the port
+ * number if the I/O port method is used.
+ */
+
+#define VMWARE_HYPERVISOR_HB		BIT(0)
+#define VMWARE_HYPERVISOR_OUT		BIT(1)
+
+#define VMWARE_HYPERVISOR_PORT		0x5658
+#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
+					 VMWARE_HYPERVISOR_HB)
+
+#define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
+
+#define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_GETHZ		45
+#define VMWARE_CMD_GETVCPU_INFO		68
+#define VMWARE_CMD_STEALCLOCK		91
+
+#define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
+#define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
+
+extern unsigned long vmware_hypercall_slow(unsigned long cmd,
+					   unsigned long in1, unsigned long in3,
+					   unsigned long in4, unsigned long in5,
+					   u32 *out1, u32 *out2, u32 *out3,
+					   u32 *out4, u32 *out5);
+
+/*
+ * The low bandwidth call. The low word of %edx is presumed to have OUT bit
+ * set. The high word of %edx may contain input data from the caller.
  */
+#define VMWARE_HYPERCALL					\
+	ALTERNATIVE_2("movw %[port], %%dx\n\t"			\
+		      "inl (%%dx), %%eax",			\
+		      "vmcall", X86_FEATURE_VMCALL,		\
+		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+
+static inline
+unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     NULL, NULL, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
+				u32 *out1, u32 *out2)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     out1, out2, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
+				u32 *out1, u32 *out2, u32 *out3)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     out1, out2, out3, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, u32 *out2)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
+					     NULL, out2, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
+				unsigned long in3, u32 *out2,
+				u32 *out3, u32 *out4, u32 *out5)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, in3, 0, 0,
+					     NULL, out2, out3, out4, out5);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
+		  "=D" (*out5)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, u32 *out1,
+				u32 *out2, u32 *out3)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
+					     out1, out2, out3, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+#ifdef CONFIG_X86_64
+#define VMW_BP_CONSTRAINT "r"
+#else
+#define VMW_BP_CONSTRAINT "m"
+#endif
+
+/*
+ * High bandwidth calls are not supported on encrypted memory guests.
+ * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
+ * low bandwidth hypercall if memory encryption is set.
+ * This assumption simplifies HB hypercall implementation to just I/O port
+ * based approach without alternative patching.
+ */
+static inline
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      u32 *out1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push %%" _ASM_BP "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], %%" _ASM_BP "\n\t"
+		"rep outsb\n\t"
+		"pop %%" _ASM_BP "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
 
-/* Old port-based version */
-#define VMWARE_HYPERVISOR_PORT    0x5658
-#define VMWARE_HYPERVISOR_PORT_HB 0x5659
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     u32 *out1)
+{
+	unsigned long out0;
 
-/* Current vmcall / vmmcall version */
-#define VMWARE_HYPERVISOR_HB   BIT(0)
-#define VMWARE_HYPERVISOR_OUT  BIT(1)
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push %%" _ASM_BP "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], %%" _ASM_BP "\n\t"
+		"rep insb\n\t"
+		"pop %%" _ASM_BP "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
+#undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 /* The low bandwidth call. The low word of edx is presumed clear. */
 #define VMWARE_HYPERCALL						\
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 11f83d07925e..533ac2d1de88 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -41,17 +41,9 @@
 
 #define CPUID_VMWARE_INFO_LEAF               0x40000000
 #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
-#define CPUID_VMWARE_FEATURES_ECX_VMMCALL    BIT(0)
-#define CPUID_VMWARE_FEATURES_ECX_VMCALL     BIT(1)
 
-#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
-
-#define VMWARE_CMD_GETVERSION    10
-#define VMWARE_CMD_GETHZ         45
-#define VMWARE_CMD_GETVCPU_INFO  68
 #define VMWARE_CMD_LEGACY_X2APIC  3
 #define VMWARE_CMD_VCPU_RESERVED 31
-#define VMWARE_CMD_STEALCLOCK    91
 
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
@@ -110,6 +102,56 @@ struct vmware_steal_time {
 static unsigned long vmware_tsc_khz __ro_after_init;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
+unsigned long vmware_hypercall_slow(unsigned long cmd,
+				    unsigned long in1, unsigned long in3,
+				    unsigned long in4, unsigned long in5,
+				    u32 *out1, u32 *out2, u32 *out3,
+				    u32 *out4, u32 *out5)
+{
+	unsigned long out0;
+
+	switch (vmware_hypercall_mode) {
+	case CPUID_VMWARE_FEATURES_ECX_VMCALL:
+		asm_inline volatile ("vmcall"
+				: "=a" (out0), "=b" (*out1), "=c" (*out2),
+				"=d" (*out3), "=S" (*out4), "=D" (*out5)
+				: "a" (VMWARE_HYPERVISOR_MAGIC),
+				"b" (in1),
+				"c" (cmd),
+				"d" (in3),
+				"S" (in4),
+				"D" (in5)
+				: "cc", "memory");
+		break;
+	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:
+		asm_inline volatile ("vmmcall"
+				: "=a" (out0), "=b" (*out1), "=c" (*out2),
+				"=d" (*out3), "=S" (*out4), "=D" (*out5)
+				: "a" (VMWARE_HYPERVISOR_MAGIC),
+				"b" (in1),
+				"c" (cmd),
+				"d" (in3),
+				"S" (in4),
+				"D" (in5)
+				: "cc", "memory");
+		break;
+	default:
+		asm_inline volatile ("movw %[port], %%dx; inl (%%dx), %%eax"
+				: "=a" (out0), "=b" (*out1), "=c" (*out2),
+				"=d" (*out3), "=S" (*out4), "=D" (*out5)
+				: [port] "i" (VMWARE_HYPERVISOR_PORT),
+				"a" (VMWARE_HYPERVISOR_MAGIC),
+				"b" (in1),
+				"c" (cmd),
+				"d" (in3),
+				"S" (in4),
+				"D" (in5)
+				: "cc", "memory");
+		break;
+	}
+	return out0;
+}
+
 static inline int __vmware_platform(void)
 {
 	uint32_t eax, ebx, ecx, edx;
-- 
2.39.4


