Return-Path: <linux-input+bounces-2282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8A875953
	for <lists+linux-input@lfdr.de>; Thu,  7 Mar 2024 22:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30A781C22D19
	for <lists+linux-input@lfdr.de>; Thu,  7 Mar 2024 21:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21081419B3;
	Thu,  7 Mar 2024 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="USGzZaLq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E1140360
	for <linux-input@vger.kernel.org>; Thu,  7 Mar 2024 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847007; cv=none; b=I9xXY05MPsrqnp1vNsd0T3QxpVTCJN9F20SsJU+p4EVE2gi6N/1VEAcHTpZMXD9iRyqLNhMel8GtrENCbzgcvjqNHcj5Ydng4Q3t251O6giEv5PvPnbV3yLkxxdNGXCO/xZf0U9jk628z+n6cRnMsTkto9+rb6VXEtVZguyKErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847007; c=relaxed/simple;
	bh=q85JgD8Oce/GbMxM2hbzE2uK2kTx5PPLdicGaPM50nQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mMq/d1UjB8EQv/0Eh3D2NtfOHompFlk4u+u9qjejxyb/5awjFZmbZ1HYT7v5jWHo+EoBAxaUjk2S579dtv8b7CCT/6uJbBRgJFhIhYVZ8ZSHZmS/gJkGnCxOYEU6mqe1Pg2DBYlH7ojEVy2p2UFz6gq8EfTdsvxmvuNtLAJustY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=USGzZaLq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e627596554so147324b3a.2
        for <linux-input@vger.kernel.org>; Thu, 07 Mar 2024 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1709847005; x=1710451805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Feyhzg/TR2GQbj1o1biQfDTvdEbNWX0xziUVAK97Nvg=;
        b=USGzZaLqMPU++Dm8tZq6+sbC3HfeISoJZoonHBeqw3b7RkZNme9Vkb0VxsXowrllwh
         dyOr7P8K8xvgOfc3InpWSgbc8NI+0Ms2/AqirVgOQvDDdImExxQFVRn8jU8aPIFaU4K6
         BZ0ACjYcAuljL+ABs49YTkUK/YzAbYCZjwM4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709847005; x=1710451805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Feyhzg/TR2GQbj1o1biQfDTvdEbNWX0xziUVAK97Nvg=;
        b=BCpKioCuG8/u7onyhpEqu0BaN57d9surZPcCnLUJ9XRaAik7rpOIxyc5Wd+U+6Y2wk
         oVlIQ43EIm6sU+CTWoLKH+YVa10J83g9WV2fc5zivnzO8w21Jh+96UdvksyRaEq4YsZ7
         /SQdkZvF+yXEsKkjgxIZKKZpar1/tIa1OYisY+RxKfh0E/lXEL+cfyv3cEhZADPPB3aH
         lgWpz4OQiKOPguDr/0CkCew1Waw6PffzgwDwZvcb6cydghqdFth/eSjpoNPp5XcyIUVb
         ZR3Nt0GLgDWjTh16YSO9g8FDc1K0uFEDQ3y522xZErsjNxY4L+UhnSIXpUybo6gDLS+N
         MFSg==
X-Forwarded-Encrypted: i=1; AJvYcCVVXa9iU4Jl9WRb1IM9I/8uMh8eNZCSQvC71wJyESEkI3b+tKCP1XfDksQdUgVf6rNN21O/6EiKcGez4Diwiw0VaURfS35FJW66P0E=
X-Gm-Message-State: AOJu0Yxgmp5+CPskPRROHAwIqC7tC8gikDzcw/AkKeaL5zgc/D4KAbti
	4HeOsr0Ysnb8CZmSlKxHH0hnz8nb6KOCJZJ9nFnxvBKhh/+TPVEVRznIgKGNKg==
X-Google-Smtp-Source: AGHT+IH9OHYBQPXQb7OICX+HbM6+SdDdiit+wioICdr/cHaeFQ14VaIDLC5V3mR+Gh0DgUqUIeZdxg==
X-Received: by 2002:a05:6a21:78a7:b0:1a1:3ecb:5303 with SMTP id bf39-20020a056a2178a700b001a13ecb5303mr9695877pzc.0.1709847005037;
        Thu, 07 Mar 2024 13:30:05 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([64.186.27.43])
        by smtp.gmail.com with ESMTPSA id y12-20020a17090abd0c00b00299db19a81asm1991021pjr.56.2024.03.07.13.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 13:30:04 -0800 (PST)
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
Subject: [PATCH v7 3/7] ptp/vmware: Use VMware hypercall API
Date: Thu,  7 Mar 2024 13:29:45 -0800
Message-Id: <20240307212949.4166120-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
References: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
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


