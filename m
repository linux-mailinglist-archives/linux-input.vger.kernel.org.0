Return-Path: <linux-input+bounces-4347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D26907C61
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 21:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CD23288974
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 19:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A9A158861;
	Thu, 13 Jun 2024 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MnOpkS3q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78DB1586D2
	for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306270; cv=none; b=N8qMn+EloUaWfRmvsKVPzbxfT7YcoiUPb7RZMTXUyOdi3o4unhU0gy1Jps/IwsbWUiR8yT2j62vCxKBt4sl8q7akBIEVu47gnMCzLgREh6asz54hNYDGdzLQhnegGYFJ2H9bj/2Wt0j+E5f4Zhi3ItHlEdOvIJEHGJc9gD80Y/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306270; c=relaxed/simple;
	bh=Q/3uwJcP0awQ0cZ0zuOOajZzP1zhz0U9p5QjUO0IuwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWFPCE/H0nyyohvJgIif7an2jvCskx6MrSGABVfCI4cnLPsI4t34zuHMoZtI2Nr9jk0clGlG3BLctL8mO8FyVhCNaL19rtPVKPhxLrwfAZx1Kj6mlpT7xSMyNuTlEFkWBqUIBxO7Gr4oAcIBhqGJgTFaI9NCPpIQQS/FCXJhk2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MnOpkS3q; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-630640c1e14so20344027b3.1
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1718306267; x=1718911067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvm0BsFAFI1cdP2yPyZHFfaL98AuxIoGBUiXiDXnc2A=;
        b=MnOpkS3qY/AcUnB3iHdlNZNicTqe9wOWurJFGMRwZOoPZlDFUGT6fHqXpwxfDkOjGW
         AQbsOOC1D1kFDc0q3uvVTJJbwebqs8NCtmjHNCRzhDqrKCLSpZcHTuqaDTDnEckWbz/k
         MR5Zcxu+l46UDSPNypFK05eLE1tmfdJWloDxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306267; x=1718911067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvm0BsFAFI1cdP2yPyZHFfaL98AuxIoGBUiXiDXnc2A=;
        b=Vz5kwM/avRkQ03RDIwcxISGHXLrIehyHBiYqVu81LZulJzbYXkwqCnRPlWbwFE+Pox
         4d2NvNXN4/VEtwMhLqj9Z3PCrZOM6mf6iMLCivMjy3zvru63Hj2rgSAaO2MEcLWz0XlI
         hEQTbkcxuKBLNEwlMxF3ldc56pzMC45qpphFQw+AvTFMQYEe2yVrpPG7GJFlpLI/edI+
         Sh8P/+2in0JgRzergbbD3KAyuwfZUQwXzZESxNYV4HsRRzENo5mrdX8pkUXchB11RQLj
         HEsnbWWvkKa6IOPah5iYm7iVhdvIF3/NJ3hvgxgiR9O8qjA/3enLcRqhI2vo/4/0+EX+
         yzUw==
X-Forwarded-Encrypted: i=1; AJvYcCVKYp8tfbYR+ow/rLf0IkkwovKiybiXBF0RVbXX/kkj6QX42Ckk5bA86qt7qgfNJdgrvUFrW96vgyjrMBC/vEyPRcBU9Wg59HgYTsM=
X-Gm-Message-State: AOJu0YxCHTdmKIoqJtDVgJg7hnW8Hp1oHPKm023AXpMgWGBma74pNP+k
	AL6VE56m8BZQqqfmQUgQJ0uY32aeZNMBhIu/+6QKh3PiBPhWlECLyJRivV0HRg==
X-Google-Smtp-Source: AGHT+IFE9wLsZ7ENC3mJ6qucAwCj2u4sQKXs6B3ZL4fkGGOEpeG9V3zFRYPhrCcwGDxwPGGrlz4D+Q==
X-Received: by 2002:a81:8d13:0:b0:62f:b04c:2442 with SMTP id 00721157ae682-63222070cafmr4181267b3.7.1718306266717;
        Thu, 13 Jun 2024 12:17:46 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:46 -0700 (PDT)
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
Subject: [PATCH v11 7/8] x86/vmware: Remove legacy VMWARE_HYPERCALL* macros
Date: Thu, 13 Jun 2024 12:16:49 -0700
Message-Id: <20240613191650.9913-8-alexey.makhalov@broadcom.com>
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

No more direct use of these macros should be allowed.
vmware_hypercallX api still use new implementation of VMWARE_HYPERCALL
macro internally, but it is not exposed outside of the vmware.h.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 724c8b9b4b8d..d83444f03969 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -279,30 +279,4 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 #undef VMW_BP_CONSTRAINT
 #undef VMWARE_HYPERCALL
 
-/* The low bandwidth call. The low word of edx is presumed clear. */
-#define VMWARE_HYPERCALL						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT) ", %%dx; " \
-		      "inl (%%dx), %%eax",				\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
-/*
- * The high bandwidth out call. The low word of edx is presumed to have the
- * HB and OUT bits set.
- */
-#define VMWARE_HYPERCALL_HB_OUT						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep outsb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
-/*
- * The high bandwidth in call. The low word of edx is presumed to have the
- * HB bit set.
- */
-#define VMWARE_HYPERCALL_HB_IN						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep insb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
 #endif
-- 
2.39.4


