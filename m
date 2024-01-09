Return-Path: <linux-input+bounces-1175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C1827E37
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 06:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EB11F246C3
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 05:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D21E29CFC;
	Tue,  9 Jan 2024 05:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="d2v1ilX9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147829425
	for <linux-input@vger.kernel.org>; Tue,  9 Jan 2024 05:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28bc7155755so1233344a91.2
        for <linux-input@vger.kernel.org>; Mon, 08 Jan 2024 21:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704777042; x=1705381842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8/C+cZAZlDGQnbyhqyYcqig/5vzt/WyH0xZX56gmkE=;
        b=d2v1ilX9eNhAqazh6+zCgfgvdfgyrivuMLSonqN03kwYw7PUJaS4ACTlQcUS3qpwyX
         MADoWKJO+oPHcjrns3fdG5jcqp3lGSetln9eJkbPIYlKiFVnD8IwGMzf0LxS+n31JZdN
         Ef9IbHd2pDrSJXgdxGfvXICJIhGWbg0YoQTMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704777042; x=1705381842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8/C+cZAZlDGQnbyhqyYcqig/5vzt/WyH0xZX56gmkE=;
        b=KZ1onoWbp/RgZoOe4sVq9HBlewJclzSHbWUKgxouv7SQiWcdY/WyNRWsrHl5IqmaWN
         T1U8n8RE25ISUuHRuqazOa1Km1bRfGiSjI6DUt7jo3TDe9rW04fllfq4CRO8rlN7AG4Z
         6Csvr0H+AklG4qa5Y1TpjKv+31UlDQ6NMEukwAF86TnpC9Dh+yA4j5396PqXH9vlkck+
         d6VY6ave/WHyNrnma7LKrUGuJMhOX8b8SCVMM21eiqzBjcGmWxt1zspVbnacxXNxovi4
         FGH/MkskAVPjJzrHLVIUOuyFaQe1F/IbX1WSK5pr64OcSHhpqNAl6TTVVy0/qsA3Ki3O
         Z0NA==
X-Gm-Message-State: AOJu0YxpZYNdEqnmd6xZjkrvPB59KC4mQIXi/8srCnt9YwqJYHybmwvt
	FT2IPfhuLjw90yqhVv+3BV8SwJmYWZdd
X-Google-Smtp-Source: AGHT+IGyOplJoUD1xpbK3AjrXC0Jcps/zI6GoGi+HTYdTfOMuuInqEmCQyQCViE4TmBnZqyRyNzi7A==
X-Received: by 2002:a17:90a:ad04:b0:28a:fd9f:8ff0 with SMTP id r4-20020a17090aad0400b0028afd9f8ff0mr1967323pjq.8.1704777042213;
        Mon, 08 Jan 2024 21:10:42 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090ac88c00b0028aecd6b29fsm7344115pjt.3.2024.01.08.21.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 21:10:41 -0800 (PST)
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
Subject: [PATCH v5 6/7] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Mon,  8 Jan 2024 21:10:16 -0800
Message-Id: <20240109051017.58167-7-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109051017.58167-1-amakhalov@vmware.com>
References: <20240109051017.58167-1-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more direct use of VMWARE_HYPERCALL macro should be allowed.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
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


