Return-Path: <linux-input+bounces-3526-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1018BD720
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DDAB1C228EE
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D43D15ECC3;
	Mon,  6 May 2024 21:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dIh36Gbt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2583615CD51
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 21:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032429; cv=none; b=f6dycpBZJK+5VBSn54pG/cegjuQ8/+J+dWYwyPI6NUTuR7yh9LkN/OnN8mc7c6wDceGMcJnbqPg6TChNuenLLQydRqJ6sWn0xts9yH5d7usuLHQ/yX1L4fAlEEFAb28PLXLDzaZZzZZ937Gc1QGz20jiZa7LQ81ZAl2AUhk1qtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032429; c=relaxed/simple;
	bh=oNDqfcadVCBv1NHKCDbX55nWD61GnGcAsAeavqpXrsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GDZGhZ/EvQGqtf5bkFJ7WA5ICW68JHwmNv2hyA7+l4k5DC6o+/WHawvMBBtKK+dDOqAAj1nY0gYcg6RY8OtPvwtqlg/9rc5gZYM5wHVZ9ry3iw18D71X6V8+fnHk418iLpLiQcUrP1wE26T06B5Tlm/Up73ZKe/F3asCxXEy0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dIh36Gbt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ecd3867556so17075655ad.0
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1715032426; x=1715637226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbe175V7J4mZKX1qbMhvDPfRMOR41WhVMQTZgQjYbwc=;
        b=dIh36Gbtu4ES/52Sx3Cp+uv0rkWVj1Eg5vgVZDpvw6aPlmLixWNzmTYgY3rqirY1gu
         iglBGIg1weqhiW/jJGYsvYBHOHPqGMkkmbyiBCRJ/VTV/rBx5cNfhxYsvw5QcV2lsj4z
         bVAI9x41T7H1mGh/o0jueWUFgPt9Ed3x15QZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715032426; x=1715637226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbe175V7J4mZKX1qbMhvDPfRMOR41WhVMQTZgQjYbwc=;
        b=nZ8cENRfo/z+7L3jqEZ32ZUo/wY+ECsOxFaRbMOgQ0r6dpu1W6nF3a35xrxkoho8So
         ZVh6qAt+A4NymFsAVzOJmIPEFnDIGKwl5Hi+XOxpcsPVZcYis7to96S5xPM+J8zIYq49
         EIZVvFp3Ox3p+IzKX+hWkWy3cnFWGCwrdLcJgo7Y/8bNeqds6clLCZtDmCHpDKweDc7T
         KwIvJFWXFHouOxnSvNL5AZKv6GflSZIp8/qDh+jrl6OxKKg4rOwwf+HL6efQTNyIY4nc
         m9buhQC3RC6FFBO/4En/CLmqy8CWd3Zfj6VSc8N6b0TlBiHx0ZVhgMVQ+f8rrlz1i8DO
         Ma4w==
X-Forwarded-Encrypted: i=1; AJvYcCUFeaIolqtuF9/o3vn4+D7YrsGHccGMS0+sEAgC+paaPs9Nyf7XUv+ARtFF7hNzr8JqeVyDAYYLyJXHYbwpC4XDqZ7fQaWLcR/NLrg=
X-Gm-Message-State: AOJu0YyMcmDXmjJZNAlA/CgM4bGL9D2WOmQat+FKSQaJcjajxRnPxHw5
	SYb85y8luHcYFFYl7+yQIaxuKpV2gVHDf5mJxk3/M+D7ywgvU8Otjv/9SKJbGpibVVawMhT5y78
	=
X-Google-Smtp-Source: AGHT+IF9KGLbu1mYoD5+HNwJ4RqC9puh1gLYMQgkGGUeZcF7dPV+YrdASSz/bi69CBBVXAU8JRj2Fg==
X-Received: by 2002:a17:902:ab8b:b0:1eb:156f:8d01 with SMTP id f11-20020a170902ab8b00b001eb156f8d01mr9782604plr.40.1715032426230;
        Mon, 06 May 2024 14:53:46 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:53:45 -0700 (PDT)
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
	Nadav Amit <nadav.amit@gmail.com>,
	Jeff Sipek <jsipek@vmware.com>
Subject: [PATCH v9 4/8] ptp/vmware: Use VMware hypercall API
Date: Mon,  6 May 2024 14:53:01 -0700
Message-Id: <20240506215305.30756-5-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240506215305.30756-1-alexey.makhalov@broadcom.com>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Nadav Amit <nadav.amit@gmail.com>
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


