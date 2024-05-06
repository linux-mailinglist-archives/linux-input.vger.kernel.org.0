Return-Path: <linux-input+bounces-3529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23F8BD729
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4542C1F247A4
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AF015EFC3;
	Mon,  6 May 2024 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a4wN1GLZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6315EFA7
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032436; cv=none; b=dF2qMMgrJewbareJvdATVx8WK4ffy0k/1boJjSKqYUChwceq662DyuTeJCxHmnb6SDRIZcwj4p965XrDrGkOBsaEO22WaXznlxbKZRgB8T6ej0ZJC0B0lGJ4uAZJnOTnMgOXF20WsU2iwnu4zuILPUBKbWct6DieY7zluzr6lo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032436; c=relaxed/simple;
	bh=BTdB/bKcsgIg8SG05ME4z6NR7Hf/yomiKs5wTQl9JKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sqo+8JMlMpVA9khQ64aQ16XC0EdG2GkclRrmeCuXABW7D7OwBz88Abnf9kjCXwSr5+P6Qz3GqkvTibvBEACOJK7ZVJUZd4YCGBWpZi2ch/6/Jxoi0bLNZ6hHrvrtNGDWMUJcYbKjneZ6nqJILK8qJsNR+IG+qdPdgU4htC0Eomg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a4wN1GLZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e3c3aa8938so15077075ad.1
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1715032435; x=1715637235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
        b=a4wN1GLZ0WdgTkEGGM6PKlK2FUKcjNwi/vBatFP51Qn3pYlnPXmXgCPlV6g4k5xzmN
         px/8Vf55cYGszQDh+phlc+otnTBUPJwEWCuiF3v/+o18ly4eimxMc4mBXOo60R8iCAKl
         ZfHSMytwvKsFNfx+QuGh7u5swww+QfzIE0H4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715032435; x=1715637235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
        b=bu7+01ulIa2QC3xslYceuFLY9bUalA2by2j9oZFlj5pdFMJq0JlBvnxplW927qsKH+
         8a6Ef/OfvMVFbmlpeJXHFT+owVMBLMRVyY1+rP6n/f6rexo7LNXCPlp7e337Bh9pfmoM
         AS2KrPvDFQ4pAlgcwxm3Dvo9gjsuDJi9XyHJf3ignSC0OohrBMzNvh4Z/Ufj71YkyaKl
         J40ciY9kF8X0ejU9WvX3kvPc1jDQpUzO+bEbziL1SgqCRARbZj5c+JPlHLV+usrJM3+k
         JXUOuD/1cVLcJSPEHOVojzJ5Iuddw+kr5+bGG/qqTlTyGNCpJudfkzpQEMxSnTmG6SzB
         KaOA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Umf8J3GwBYsp84Wfl77OSSEkNJywgknOJ8FMz7QUwwi7z4YiN/UsfKUI6UWeWJPzvWvfmt78MyvRQF1NiwYyifMKzJGlILGF2fQ=
X-Gm-Message-State: AOJu0YxffY0vaYSF4ERySm+QwKjTHjXvun2+dleKCoJsTM1VaiO1wwJX
	F9UeZlqnE6zXUDrDaYT6LAPnChzKTRVNlpt5xZzKRUWHDlvTKC45yI5VDH+TPg==
X-Google-Smtp-Source: AGHT+IFyWv+jxb29t05zzSKDmxjDVEWVQ7r5yIdjW5CDcL456PzBbnI/9joeCaGDokUA59UoiPatEg==
X-Received: by 2002:a17:902:ea0b:b0:1e4:31e9:83ba with SMTP id s11-20020a170902ea0b00b001e431e983bamr13602030plg.1.1715032434870;
        Mon, 06 May 2024 14:53:54 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:53:54 -0700 (PDT)
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
Subject: [PATCH v9 7/8] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Mon,  6 May 2024 14:53:04 -0700
Message-Id: <20240506215305.30756-8-alexey.makhalov@broadcom.com>
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


