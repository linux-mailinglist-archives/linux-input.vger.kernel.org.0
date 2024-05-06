Return-Path: <linux-input+bounces-3524-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF78BD717
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C40A1C22296
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DE715E5B2;
	Mon,  6 May 2024 21:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="W9r2eaGw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B3115E1F7
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 21:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032422; cv=none; b=VidTJl7nrXLir7r30mPMCXrG35izH5IEgmOtNVSgRFvlnqhF4Vje9FZqqsArkns9V8QVgMi4+/RrMXV2/gVyFnwxJ/6m5S8W4EieQofj4BRtQkltzMc8xeg4uiOBbwWBDw2j8LIo0iR5UEZDri+NuPhpW2Hypn5YBekWSxkMsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032422; c=relaxed/simple;
	bh=36Y3BMpDPZQyyL3FNj9mP3vbrfKi4AzrJYNgKvH4gwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=piSPbkONwFw93TnXR9z/Dxyt+eG0ZIE70W/t4CickY76kRgSpKj7lCSWWPfYlxwLsCkQyCZSOs0q5kcjTkxaMUQM0bNKlPAhQQNbdAPCQ6aWVMfCHlysaF6Twr/ibqyKzI5cfnlBPm7jHRr7qLOH2L5lA0entIrDq1Q7ctJCTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=W9r2eaGw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e9ffd3f96eso17761855ad.3
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1715032420; x=1715637220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XasMM8RHDoAht3zV8M7CkVA/nSY/Z484OZ0/rKT1mpc=;
        b=W9r2eaGw7b0CODKbjJ4KDZBQd6fygnxByFwgbXu/i07s4qAO/SVNi2ssgwziM6YdVQ
         y97MG5tcwjuyPSOYWtNhlMZ01nqt+S5tx2FID1xR6gd3sBAnEQ8Ymmq8WMwqDoHAs/4S
         UAUs5JjPYsf/vCs9hU5sjW7KoFZk3OcwmUgeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715032420; x=1715637220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XasMM8RHDoAht3zV8M7CkVA/nSY/Z484OZ0/rKT1mpc=;
        b=rWnkbZrWAQ5udXG4zo7jpszeG0BPl7A1knaHys+1Z/lbJ9oLvBLqGG415wG7SX+nrc
         ioKzczwwKQzmXbLYNDBx72E5nPmiq6RCPlpQ6/8w/xccFEVZueeY8RLvJemqJmVZMM/K
         dy5yoyNERrTOM2pwm9IBW3maieSvbdjrdw3PUXvPz0Ffcq2hmIP3BaEcdljYGOXGyfn0
         hqCkNhVK8rTsmEf/RHE2EVlW+t6tEjVSQ8VdhHt/OYcHzIiGE22tdqv8jH5iAGekWLAZ
         6++C1CACMrPgeA5IA1mwZymTGIV1BhnGM9JOM5wLVEEab526fiQQoqz6dUdXGmPa6MG+
         AmmA==
X-Forwarded-Encrypted: i=1; AJvYcCUHEjYALVDBnivvonU4dpiTJ9OSk9y3dSKJ4mAuCO1B/dwpJiVIwSxp8JIKcV9cMyc3w0K5F2UuN7J/tFrHOEE3x5b7tUIGBjrVqvA=
X-Gm-Message-State: AOJu0Yxz6Lvhej/KZqQNLLg4p0XvXZ9/3Y7Ko0GyXFKrsBQyFzHZNnuX
	+EDkGxMiaUr76uoC+UzipaM0Rm37+9FVKU+ydY+vbwGg5zgiCd+Yfxq1g3oyrw==
X-Google-Smtp-Source: AGHT+IENEOGN0tWde3qp/pU38RH6aIHaQEh28095AqfBsIIDAqJikcahIU1wceH2ANpCTzdN1vcY4A==
X-Received: by 2002:a17:902:d355:b0:1eb:3e13:ca0b with SMTP id l21-20020a170902d35500b001eb3e13ca0bmr9908685plk.37.1715032420197;
        Mon, 06 May 2024 14:53:40 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:53:39 -0700 (PDT)
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
Subject: [PATCH v9 2/8] x86/vmware: Correct macro names
Date: Mon,  6 May 2024 14:52:59 -0700
Message-Id: <20240506215305.30756-3-alexey.makhalov@broadcom.com>
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

VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
operation to the macro body.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 68d812e12e52..9d804d60a11f 100644
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
@@ -431,8 +431,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 {
 	uint32_t eax, ebx, ecx, edx;
 	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & GETVCPU_INFO_VCPU_RESERVED) &&
+		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0


