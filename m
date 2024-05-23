Return-Path: <linux-input+bounces-3807-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C024D8CDAB3
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 21:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17DAAB2320D
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 19:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7311384FDF;
	Thu, 23 May 2024 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c4eA4mnd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02184FCE
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716491740; cv=none; b=QhwXX/OBl5DWYLWQALONOsVregXQF2zuYwB2ilh2h+cO1Vn7DfIwrevCA1A/RYLHtG+UgE9KEIDPrXBVL32YQqdg0mPy93nk7zJRbZlQsfPcGvy31hAphPJJN1REOCbw1zYk9Ar7CabNzdGgvennI+E65UxtCcXliAzwOvuLFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716491740; c=relaxed/simple;
	bh=cwPi0cwLaudKiJrBxIwug/LIGv5XW3nEwzrdc3S5Ovs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8Cq3PgPcyfQz2E0NsXjoSxr/4xG75bnkmnGWeVItpbR89vE846B+9CpfYAhQEiaYz1P20mSS67dt/RknKGohqAQ89JnWePxZCR35TRVsR3y8HZr9KEaKZCdOgwnxPOxo7CFyDlwT8zuecvkq1wbkrQ6+sh3BtF39aSDtmlkwps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=c4eA4mnd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7930504b2e2so150234285a.3
        for <linux-input@vger.kernel.org>; Thu, 23 May 2024 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1716491738; x=1717096538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZPMIYqCPOQ9lUONW9JG6SX+420+rT4m9cGMXu5m3VI=;
        b=c4eA4mndxPWiqDouHwPB4iuYfxv67n2nXdO7PRYwrY/GgNXMFIWo2TfIYxjMx7fHaq
         GlHHxxyMOp0hxHHIvooOf/yN8utRGd/XwHdzUA7UvnS+Auh8wmW4xJ89A46Zwtm/IcOH
         aPLXH1PVnq7TTbJJN36SRowxi0I4Knlwsw9LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716491738; x=1717096538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZPMIYqCPOQ9lUONW9JG6SX+420+rT4m9cGMXu5m3VI=;
        b=fHLGOr6iWdAnQ7nH6dwST616lclCu5jC9s1esQ5n3hSO5pzqfJY8+ejpOU7nNYmb4z
         E/MBrLdV10P9KuREAH4Ji9aASpBrgRLoiwboodHDTe/FfcRJHpaKV25Fu4g45ZWXYy+n
         O91byqDFw9Iyp23QrAw0uMaY15BV2lMqF9DYXKHtuO4tN2PuL35MM1UEpCx4dc2J35y+
         L6y6Q/KQEEheN4Gri3/PKrfl41KvIodQUUcuPd3GocT2aNhCutTImxWNXIE+w3cXDk7y
         mRrX+qinl0z9/yKr3uhpwhA4opjsEV8PRcse97MCn5C9qFxsAKgnq7bolF56ovtEyIKR
         etmA==
X-Forwarded-Encrypted: i=1; AJvYcCVpcgrfcoS/ukDD6DY08Sl1UJEDTQSUBOXd8XCg9OeG4/OuqKuy7XHUrDkBxCJ+BgWTFHr4Yh+vPIzehfX9vJ/7IrfdJhkALJ5evzw=
X-Gm-Message-State: AOJu0YwFzT7A0lQj9CpggNSHzJ89pXhFebMVhWH9SfCVs5/YybvsPilr
	pVWEvi+euXvgrrO2pKTpj21OoCY/ytO13NwKwgMSgky/Gy7djyxAWVd5FFPSjA==
X-Google-Smtp-Source: AGHT+IG2JzfPFZy3xWsQUnDD6DVaCv75DpVNO+T61rq9vujIHdvBjciczesgyKtATQ7tmpk6hsg4FQ==
X-Received: by 2002:a05:620a:5608:b0:792:9d32:d37f with SMTP id af79cd13be357-794aaf8eeccmr19545485a.0.1716491737788;
        Thu, 23 May 2024 12:15:37 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 12:15:37 -0700 (PDT)
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
Subject: [PATCH v10 6/8] x86/vmware: Correct macro names
Date: Thu, 23 May 2024 12:14:44 -0700
Message-Id: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
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

VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
operation to the macro body.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 6796425eaaa1..58442c2581e7 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -42,8 +42,8 @@
 #define CPUID_VMWARE_INFO_LEAF               0x40000000
 #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
 
-#define VMWARE_CMD_LEGACY_X2APIC  3
-#define VMWARE_CMD_VCPU_RESERVED 31
+#define GETVCPU_INFO_LEGACY_X2APIC           BIT(3)
+#define GETVCPU_INFO_VCPU_RESERVED           BIT(31)
 
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
@@ -424,8 +424,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 	u32 eax;
 
 	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & GETVCPU_INFO_VCPU_RESERVED) &&
+		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0


