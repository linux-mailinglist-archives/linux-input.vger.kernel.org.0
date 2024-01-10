Return-Path: <linux-input+bounces-1180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235C828245
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 09:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A77BB256BF
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 08:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482A136AF2;
	Tue,  9 Jan 2024 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DMVXD8d2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3804364D8
	for <linux-input@vger.kernel.org>; Tue,  9 Jan 2024 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28c0536806fso2506424a91.0
        for <linux-input@vger.kernel.org>; Tue, 09 Jan 2024 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704789668; x=1705394468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPJVwuu4FbYV5iHDsqoRPE2dBrY067QdoWIAplCPCFE=;
        b=DMVXD8d2ot/QyaFPTd3zHlKeSnOax3L3T3NmsFRPUqGItdLIKwOm0jDEuK2ZHcN4mi
         /4Cx0xNTs4IHdGkE+S97j8ZCuOtUfukNspTWqps179yI+swRvBeN6CRmtQnSagHVzXWg
         OTauDj9RSjU61oLgoXYFciA+FsyScRBU4is8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704789668; x=1705394468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPJVwuu4FbYV5iHDsqoRPE2dBrY067QdoWIAplCPCFE=;
        b=FuvSmGWbEQWG5t9rFFDLSrgD8Kv5nAUOontF+9Oy0QZ9yL770ddUHcJo9hWnhy68EI
         jo4sGQXwwkZdMBVuErWl+Fw8jomiBOw8hPHvxowhx0pbCfY8IyxZg3VZTF2pnJTZ2nRf
         h7vvvi7de3AreqpVreWK+mn6YmRqxv1EKwZVWSFvTYAarJ+rZGc2Ujk4Fhl8UP4JVs08
         lJ1HeLtlIh6r2AGZzHDac2W1o10LV475zPpDqAceB/bnEOwXYcVMLzsGh9M8nt40HiBo
         JQ+w7f+AZW0HhGLqGztfF5BrsCIoDrXZACQWbxR4W6laYWKdlGk2m7rdUPyYzVUd3NNS
         tDsw==
X-Gm-Message-State: AOJu0YwVx54t6WBdjiPBHX7fh++VCkL0GOaRCI8McF6m8UVxh1qQnAiS
	Y9vX8gdU9vNvO+YSCertg+KJr7yp/svu
X-Google-Smtp-Source: AGHT+IHAPtZomE9mWKHoozKKh5MePdVFthGgcxrjU58Rdxj6mVhm/Q5Fx+S7eOIDUdrTFXC0gW+1xQ==
X-Received: by 2002:a17:90a:c392:b0:28c:825e:2cf4 with SMTP id h18-20020a17090ac39200b0028c825e2cf4mr2891154pjt.41.1704789668319;
        Tue, 09 Jan 2024 00:41:08 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id sf15-20020a17090b51cf00b0028d435cc2cbsm4772293pjb.15.2024.01.09.00.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:41:07 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
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
	namit@vmware.com,
	timothym@vmware.com,
	akaher@vmware.com,
	jsipek@vmware.com,
	dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	horms@kernel.org,
	kirill.shutemov@linux.intel.com
Subject: [PATCH v6 3/7] ptp/vmware: Use VMware hypercall API
Date: Tue,  9 Jan 2024 00:40:48 -0800
Message-Id: <20240109084052.58661-4-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109084052.58661-1-amakhalov@vmware.com>
References: <20240109084052.58661-1-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 279d191d2df9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,17 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
-		[port] "i" (VMWARE_HYPERVISOR_PORT),
-		[mode] "m" (vmware_hypercall_mode),
-		"a"(VMWARE_MAGIC), "b"(0),
-		"c"(VMWARE_CMD_PCLK_GETTIME), "d"(0) :
-		"memory");
+	u32 ret, nsec_hi, nsec_lo;
 
+	ret = vmware_hypercall3(VMWARE_CMD_PCLK_GETTIME, 0,
+				&nsec_hi, &nsec_lo);
 	if (ret == 0)
 		*ns = ((u64)nsec_hi << 32) | nsec_lo;
 	return ret;
-- 
2.39.0


