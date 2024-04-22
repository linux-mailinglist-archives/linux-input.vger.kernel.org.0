Return-Path: <linux-input+bounces-3174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D858AD88C
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 01:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33817285F8D
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 23:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C101A0AE2;
	Mon, 22 Apr 2024 22:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GGZh+Zl7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3819DF5C
	for <linux-input@vger.kernel.org>; Mon, 22 Apr 2024 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713826645; cv=none; b=QIaD0rkC7aSws1insAxJzfES+O+yg3I+4mO3Rx/Jd5ofny6qPUVRwWYMsIfVuANtG38pkaIRDz78228fGrEJurfJZm0p8ZqhPGJ+Drmm1zTNt6j45LtP5cjqrLvRoOieJ0oS9QHixQh4HJzC2Ad6FrfvlZl+xX3nLZOD8UPd3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713826645; c=relaxed/simple;
	bh=BTdB/bKcsgIg8SG05ME4z6NR7Hf/yomiKs5wTQl9JKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NYv9gjrkP2ql2VoaVn98VtqDrtOHVdA4BbYmRWkSKaHNa/IIvmkqh/rIrX0ds0WDw+hTTcU6UZmGD23gkgoMmNpJoZRtmJNYA00EdyW0DoE1lewBKWu7PTL6vX0eqqlLthuXVczUgJboIzZFUHoYFI6bcYnLscqBSKOBTpvZQjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GGZh+Zl7; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6eb82af305dso2807824a34.1
        for <linux-input@vger.kernel.org>; Mon, 22 Apr 2024 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1713826643; x=1714431443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
        b=GGZh+Zl7G62V8w+3ynRNV0ZHxo3PSqc65mVl+O5uBMrg/HefmOKZxh1WS4Cw4rrwjJ
         +ceBFmXV0QC5EAvK5UK0wEPQX6CNracDvtwZ//kjS5OVvNkS8Du5MGkdedRJDYkXF3Xg
         zbctJ+o8DHMbyfJdRKv1NxJNgfvfJzVBwOEp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713826643; x=1714431443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
        b=fo3YPM5LIn2VSLyWORN0jZxN+6+SRB39wm73Y08tVr2pkbJmqBjMzHYwEcnI4WycrR
         7QIdQLunO+REhXlCIIFzd92YmpraZY46SYTt3ybDP/EHiG/bUMK0OZfYrkPH3focimxM
         TmAjRyQ5ZGIHQ4pZ+I6GlB5+lhLpxztva05U2xmxpGAWrebq5KUR+l+LiVoZvzuP2OAZ
         GNRXtsNPyxWkivT+3yghGU3eLxF8B6s8a3GjEzUQ1blLT6im3QWNTjIDcIdBl/JrLi8z
         vQRmiSjfMN/utC4wq1uwLzaNOgXqtMa+yd3l92kRfb99U9LXiIPRDcD691djlhu/6oym
         OKRw==
X-Forwarded-Encrypted: i=1; AJvYcCWRk8gT4tsKRGqxpZqEcl/N/mDcg0L0vp4OOzh3M6c2fu349Q39GGBkWy/XJvP8rnrZj7+BNoYrCYEJpyEXWafjnyP44k82mZ4eWJ8=
X-Gm-Message-State: AOJu0YydaXNuWukxt/vRmjLrb2uDyFYShjvDSS3q252FAcu7K1GiZ3Sh
	KbJ7jwNxXg85xMJYNsLN3TWTPtwM4ez7LcbYfwsBHnWJar/kmHOXGpHGGDhHGA==
X-Google-Smtp-Source: AGHT+IEv2WhbdeTm+ITZUjA7wRjDe33Me8JI8D8cOBtCVuMHtiFWNGlYrKrwKoReJqK7LTHdXsmAJg==
X-Received: by 2002:a05:6870:cb91:b0:22a:9ea4:c18 with SMTP id ov17-20020a056870cb9100b0022a9ea40c18mr16126552oab.15.1713826643266;
        Mon, 22 Apr 2024 15:57:23 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id e131-20020a636989000000b005e43cce33f8sm8093597pgc.88.2024.04.22.15.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 15:57:22 -0700 (PDT)
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
Subject: [PATCH v8 6/7] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Mon, 22 Apr 2024 15:56:55 -0700
Message-Id: <20240422225656.10309-7-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
References: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more direct use of VMWARE_HYPERCALL macro should be allowed.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 2ac87068184a..84a31f579a30 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -273,5 +273,6 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 }
 #undef VMW_BP_REG
 #undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 #endif
-- 
2.39.0


