Return-Path: <linux-input+bounces-3803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B048CDA9B
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 21:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4A22839D2
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 19:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8431482D9E;
	Thu, 23 May 2024 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bd50bKIk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD5784A48
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716491718; cv=none; b=ip9XTNE98LlvVJUc9W3ptpoZlCprgIF/x8kl834qgA/el3T2sv95VN6KZaywdBn4vy//9E+bZZisee7Uh8sPzX2MS5YCls3rrQdB5oMLpSV5whGyMyEIwZHgIjUAP5ePfSXq5WebTxTZVP5JR5u3mhuEyCgjpoPtL/xoljIqaks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716491718; c=relaxed/simple;
	bh=ZNBT2utWr+CWbtzicSB/YTCRG247E6qB9Nr+UR8KY4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGmAEBYaa45i0C2nNAzQuw/f9PLGZQZKhbZSxkCFAWLxsZs6RbZCx2ZiMrZJxDx/8whbeTDvwZTOKgdP+H2Sljraujg5MYg9g72LMEl3PlxCWZRpGfTSZjGgMAqWkaeTQdqk60sbUoK3QugX03PuRyJSMt3ZHXh6FkstMKnKLNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bd50bKIk; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43e23ce7b07so36223781cf.1
        for <linux-input@vger.kernel.org>; Thu, 23 May 2024 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1716491716; x=1717096516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHMYUJYhS9fLzUcof3ntSmUnLahUe/mGFjgJPys0Prk=;
        b=bd50bKIkRwXLQxULEQWGR+nR3UqUK0g5w2iYso3P9yndASTik4vNTo5/exgOhKNIon
         +s+0RDuDOro9h/xqzhPCMwQ5nZIdKPhAOsEhL6A4r/KTky6RHka41eMmt0DTQKrkr6Qx
         iO9Ewzsb/+xxlEyhZjgjwReSqUDZnhFPjqmsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716491716; x=1717096516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHMYUJYhS9fLzUcof3ntSmUnLahUe/mGFjgJPys0Prk=;
        b=RRiftq6tdRhXcYCmYImwI+w9AC/Gt2Kcn5S9N+3Qh4FfPSyQgbwszuEGX4AMymPqd9
         wyVDx8fOVlOWGBgaWAO8cTIc0xJApCN7sUaAsx7TujuWSUWqrJ6DyjXvEierR8WdmxIN
         5xLtcki6jiNGZOHXr7J4C2SYGLSqkvT8jf64InaiW3YzVPqbOmH6lh7QKPFMk/cDexZ1
         cwVwm2HP8pur0lqgS+Nb69RZZa3mvPaKQBKz3+d8jZ+UqlJhofX7c5x3h9qmWmnRhSa2
         k/r55p+hSDAJdvcoztrJv8nPzY/nbGXUFYs8mJmawK+AprBOf/BKerwT6LH3le7XynrN
         USdA==
X-Forwarded-Encrypted: i=1; AJvYcCXShmD5YOOzrTTDMkmSqG+Jg9DKLWmwqqcoRN+7/QmsIpZBu0mGqniJLpEWAZAySms5Y/6bQBXes8p8FZQCeKm7wM4DWa7oQtM1GKI=
X-Gm-Message-State: AOJu0YxSc/5pxmPVtVRJMnEZEaUDTayEr678bJgwPcaguXA1Ezr7IVLg
	Y1wHiWC7LdVcmyodqlTwzQh9oI5D2SUiJEtbVzB7gd2HQy36cCIAeW9kMminlA==
X-Google-Smtp-Source: AGHT+IFaSpHOaQG+6UeUCtVGRI/ILrUKTLrw9mZL+0TgADU5BA3XN+dK8zNwM9U3mMN6EkgRA6eSzw==
X-Received: by 2002:a05:622a:1650:b0:43a:f441:75ab with SMTP id d75a77b69052e-43fb0e64ca6mr342501cf.22.1716491715608;
        Thu, 23 May 2024 12:15:15 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 12:15:15 -0700 (PDT)
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
Subject: [PATCH v10 2/8] ptp/vmware: Use VMware hypercall API
Date: Thu, 23 May 2024 12:14:40 -0700
Message-Id: <20240523191446.54695-3-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
References: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
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
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 7ec90359428a..20ab05c4daa8 100644
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


