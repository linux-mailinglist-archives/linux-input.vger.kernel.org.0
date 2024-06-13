Return-Path: <linux-input+bounces-4345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8E907C57
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 21:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6D50288240
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 19:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5CB14D2B8;
	Thu, 13 Jun 2024 19:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RGWbacLb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F7157476
	for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 19:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306259; cv=none; b=HjROt/I5cN9cWr/C0cYSaW2cxSrzJkFjW4+XzIoCQdPKaNrOZ+UsFtIP/2hGk+TiW41ufGQLNLPUuoXzFu8AaAL1onZti5vQ8wp2KIBAhMF+8UkYwRbN3q/8Z/HZfvfeWshlFCyWd6q47wsFLNjxvaeoPhRnhFpOdU/58G0iTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306259; c=relaxed/simple;
	bh=NK72QWSTENiSeyhJ+Lf5DB1HqQQ8kTSBLLwmEwv6BrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q4TeAe9GbMnLwa43OeT/VcsSRaxTzjdBpbgxmiTZFo95I0xXb+obfoiWbNxvVIDtOD7vxOA5aojgU2XYqRIQPEs4cj5Nv1FLqFTIex/NNN7vs2tifGHxrd2JbPR8eo8WGeuUXu82+iBbspRoIwt5WcwhgItTzwT29uJ3B+njyBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RGWbacLb; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ae259b1c87so21550416d6.1
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1718306257; x=1718911057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqNd+iLeT7nJUI6zs92vMpVdcAWS0GdB0qzOjw5qGd8=;
        b=RGWbacLbH6FAfieKV/XZcFGaiSGLEw0CRqhNIkZzwsERy0vrbv/Qg664WIIRKJg5Uc
         TU1w3GqfodqHLo8Grk5AY9rvdxHe577Ti/DsqV4QEBTbCaKEXrSPzwGbtQAGDQYkGUFi
         d9TxFG0+/Co8zeLQ0WyeBOuLYmypz6f2bVJpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306257; x=1718911057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqNd+iLeT7nJUI6zs92vMpVdcAWS0GdB0qzOjw5qGd8=;
        b=i5nL8ItygERQtQwLDFP/4uL5Wp3vQ340B7AsHWR3/Zb+GlpiYpsXALXzzHakcWEG/9
         lSoHYcCiy6h35D9Wd+B2dLz+4r+xiaHN5eQ5SzFxzByon7uIHD14fSQbLkpHWFoyGr5Q
         wj3s7I43FGtd/UNgCNokYNMd8nzvz1WaDyygJBDuBo3OQGzh7bLzXQ9DJ/6VBahMCvHR
         dFLYNuigl+WVDedfpTjC8x4mtp8k9dRrYrFVSQFIQ8b1yXfHaKhOp8rCprYHmis3URQb
         PCOQEGCjlm1P2qws2sEIXMO5j84IyB379BjWC0k+L/E/PoZhqRdYE03dwUbmYVVLGo2p
         CWKw==
X-Forwarded-Encrypted: i=1; AJvYcCVJvPUHr1ACjBm7bLjsDVs+nnnuJtLtRU2XNj+lC+f1p2bkbX85xoTa0C1GkZMGV15QWJxa3SLR4iHeY0v96ERxQIfrNrW570A+QKA=
X-Gm-Message-State: AOJu0YxOeNigljstilmMGHfqXOD0NV/MCh6OprrLNNIZOZbXhsQsQi6s
	3REEKYqfZyZ0c1s90JTVl9DXzVCeW3/tvz1fqAXLz6dI+OSKuPIAPhWD03EywA==
X-Google-Smtp-Source: AGHT+IGxx4Y4IaoFQvp412CQV+xWQXgbXgVf+lHMhgxiPdk13pgmWYUgwKjVFqFc7qbuQQdnfsavtg==
X-Received: by 2002:a0c:c486:0:b0:6af:33ed:87de with SMTP id 6a1803df08f44-6b2af2eef89mr11681586d6.20.1718306256370;
        Thu, 13 Jun 2024 12:17:36 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:36 -0700 (PDT)
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
Subject: [PATCH v11 5/8] x86/vmware: Use VMware hypercall API
Date: Thu, 13 Jun 2024 12:16:47 -0700
Message-Id: <20240613191650.9913-6-alexey.makhalov@broadcom.com>
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

Remove VMWARE_CMD macro and move to vmware_hypercall API.
No functional changes intended.

Use u32/u64 instead of uint32_t/uint64_t across the file

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 95 ++++++++++--------------------------
 1 file changed, 25 insertions(+), 70 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 533ac2d1de88..c0a3ffa9e023 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -49,54 +49,16 @@
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
-#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
-	__asm__("inl (%%dx), %%eax" :					\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
-		"memory")
-
-#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
-	__asm__("vmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)                         \
-	__asm__("vmmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
-	switch (vmware_hypercall_mode) {			\
-	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
-		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
-		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
-		break;						\
-	default:						\
-		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	}							\
-	} while (0)
-
 struct vmware_steal_time {
 	union {
-		uint64_t clock;	/* stolen time counter in units of vtsc */
+		u64 clock;	/* stolen time counter in units of vtsc */
 		struct {
 			/* only for little-endian */
-			uint32_t clock_low;
-			uint32_t clock_high;
+			u32 clock_low;
+			u32 clock_high;
 		};
 	};
-	uint64_t reserved[7];
+	u64 reserved[7];
 };
 
 static unsigned long vmware_tsc_khz __ro_after_init;
@@ -154,9 +116,10 @@ unsigned long vmware_hypercall_slow(unsigned long cmd,
 
 static inline int __vmware_platform(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVERSION, eax, ebx, ecx, edx);
-	return eax != (uint32_t)-1 && ebx == VMWARE_HYPERVISOR_MAGIC;
+	u32 eax, ebx, ecx;
+
+	eax = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &ebx, &ecx);
+	return eax != UINT_MAX && ebx == VMWARE_HYPERVISOR_MAGIC;
 }
 
 static unsigned long vmware_get_tsc_khz(void)
@@ -208,21 +171,12 @@ static void __init vmware_cyc2ns_setup(void)
 	pr_info("using clock offset of %llu ns\n", d->cyc2ns_offset);
 }
 
-static int vmware_cmd_stealclock(uint32_t arg1, uint32_t arg2)
+static int vmware_cmd_stealclock(u32 addr_hi, u32 addr_lo)
 {
-	uint32_t result, info;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(result),
-		"=c"(info) :
-		"a"(VMWARE_HYPERVISOR_MAGIC),
-		"b"(0),
-		"c"(VMWARE_CMD_STEALCLOCK),
-		"d"(0),
-		"S"(arg1),
-		"D"(arg2) :
-		"memory");
-	return result;
+	u32 info;
+
+	return vmware_hypercall5(VMWARE_CMD_STEALCLOCK, 0, 0, addr_hi, addr_lo,
+				 &info);
 }
 
 static bool stealclock_enable(phys_addr_t pa)
@@ -257,15 +211,15 @@ static bool vmware_is_stealclock_available(void)
  * Return:
  *      The steal clock reading in ns.
  */
-static uint64_t vmware_steal_clock(int cpu)
+static u64 vmware_steal_clock(int cpu)
 {
 	struct vmware_steal_time *steal = &per_cpu(vmw_steal_time, cpu);
-	uint64_t clock;
+	u64 clock;
 
 	if (IS_ENABLED(CONFIG_64BIT))
 		clock = READ_ONCE(steal->clock);
 	else {
-		uint32_t initial_high, low, high;
+		u32 initial_high, low, high;
 
 		do {
 			initial_high = READ_ONCE(steal->clock_high);
@@ -277,7 +231,7 @@ static uint64_t vmware_steal_clock(int cpu)
 			high = READ_ONCE(steal->clock_high);
 		} while (initial_high != high);
 
-		clock = ((uint64_t)high << 32) | low;
+		clock = ((u64)high << 32) | low;
 	}
 
 	return mul_u64_u32_shr(clock, vmware_cyc2ns.cyc2ns_mul,
@@ -431,13 +385,13 @@ static void __init vmware_set_capabilities(void)
 
 static void __init vmware_platform_setup(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	uint64_t lpj, tsc_khz;
+	u32 eax, ebx, ecx;
+	u64 lpj, tsc_khz;
 
-	VMWARE_CMD(GETHZ, eax, ebx, ecx, edx);
+	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
 	if (ebx != UINT_MAX) {
-		lpj = tsc_khz = eax | (((uint64_t)ebx) << 32);
+		lpj = tsc_khz = eax | (((u64)ebx) << 32);
 		do_div(tsc_khz, 1000);
 		WARN_ON(tsc_khz >> 32);
 		pr_info("TSC freq read from hypervisor : %lu.%03lu MHz\n",
@@ -488,7 +442,7 @@ static u8 __init vmware_select_hypercall(void)
  * If !boot_cpu_has(X86_FEATURE_HYPERVISOR), vmware_hypercall_mode
  * intentionally defaults to 0.
  */
-static uint32_t __init vmware_platform(void)
+static u32 __init vmware_platform(void)
 {
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR)) {
 		unsigned int eax;
@@ -516,8 +470,9 @@ static uint32_t __init vmware_platform(void)
 /* Checks if hypervisor supports x2apic without VT-D interrupt remapping. */
 static bool __init vmware_legacy_x2apic_available(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
+	u32 eax;
+
+	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
 	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
 		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
 }
-- 
2.39.4


