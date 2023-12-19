Return-Path: <linux-input+bounces-868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC938192B1
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 22:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D920A1F2612C
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 21:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0D240BE1;
	Tue, 19 Dec 2023 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GYRJMpnp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8D03EA7A
	for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 21:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3c76ee799so17761555ad.3
        for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 13:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1703023090; x=1703627890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdRA67GFcUxloyx4tvXG24BR0us5wKd/dCuK68J3MHc=;
        b=GYRJMpnpub6uJ/bl0tcPuDdS60vdpAVaWRuz+R3m6Tq1D0occybFPCNTm/zgjfnASZ
         +N+i4e1A3SomQDbIdz+/r3aWHMtW62q6vAtXcooAH7KTCy1zgd6RZlIsU40laJYxBxwZ
         VYqz0vy8UGkw3dY4Psws0KjsgpY5A2xFyq9Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703023090; x=1703627890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdRA67GFcUxloyx4tvXG24BR0us5wKd/dCuK68J3MHc=;
        b=oXZZJuuhW0M9g2zOrzCxyuuXkIwLl4xIubLoMgzLC35oz9az7gpfxwI1HQ9D1bkJMx
         U0RxD5YXNnLIlv6p8iW5Xd1lUpUWfO9ELd39Iz+3s3anDH0xX4mo4R9YCdlErJhiaeqW
         mA+K0uaml7Wo8yi+dDmRPB/5+zHPs6JjpsJ9glxTn3w2PpayOKs16o2/j80FFljW05y+
         fZtslg67x2MRBA6gUNriiZMulOAybIi68kLsE+n+wCtfj73ul5ynOE59US/5y1IJ6CvT
         HPPBvWnfEV4X5iynKirsUK8aBxNBqAvUIloaa5GKLP6JffkHRvNuP7z/kWRLVfiYM5Bq
         /sMw==
X-Gm-Message-State: AOJu0YwtJOnlFQNnanwaBZcPuSXeovpmmCeR4Q494BZ2gl/OqI1fCBd5
	OoVjosVW9zf6rEBNj+PxKJXmpw==
X-Google-Smtp-Source: AGHT+IHGD0xZLG33r4K3W27zHJ54xxNx9BXxPN80CB3EUkCBFgov+arX/Surcqdx9o4S55QyyiUwAQ==
X-Received: by 2002:a17:902:7809:b0:1d3:e171:7d0c with SMTP id p9-20020a170902780900b001d3e1717d0cmr816076pll.83.1703023090468;
        Tue, 19 Dec 2023 13:58:10 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id v1-20020a170902e8c100b001d3aa7604c5sm5356476plg.0.2023.12.19.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 13:58:10 -0800 (PST)
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
Subject: [PATCH v3 3/6] ptp/vmware: Use vmware_hypercall API
Date: Tue, 19 Dec 2023 13:57:48 -0800
Message-Id: <20231219215751.9445-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexey Makhalov <amakhalov@vmware.com>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,15 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
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


