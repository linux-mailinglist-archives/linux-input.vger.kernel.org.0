Return-Path: <linux-input+bounces-1038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27C81FAA3
	for <lists+linux-input@lfdr.de>; Thu, 28 Dec 2023 20:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3F59B23291
	for <lists+linux-input@lfdr.de>; Thu, 28 Dec 2023 19:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1879310781;
	Thu, 28 Dec 2023 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HG39Iu9w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95235101DD
	for <linux-input@vger.kernel.org>; Thu, 28 Dec 2023 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6dbb7d80df8so4278246a34.1
        for <linux-input@vger.kernel.org>; Thu, 28 Dec 2023 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1703791475; x=1704396275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4eXRhqd1yBwc+Z6yATNh3shIkHH9Y9LTIopAG5eguMQ=;
        b=HG39Iu9wfJNJlG2EJFaiDDObdlNvScqp/sTLNdfakOy9kPod5vH0PA/vsjd+q0YE09
         uAjuLhu9MRIBYMD1xbvPx818ZGYZ0Yc4sKE1S1FCch8ZwmG07r70LVbhj+5yLxRTj0tK
         CcqbdUrS/BUdH/3T0tatxj0ZwoOG3ANvXafEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703791475; x=1704396275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eXRhqd1yBwc+Z6yATNh3shIkHH9Y9LTIopAG5eguMQ=;
        b=Pu+4CjuQshkFaiR1+n4AJn1bpO81hs7BmJqicH3ERE8xZOze50YPSBGv1Za+Jg5XmN
         SWASS8rFECX/oVYDR8B2boSEGSRiqJToSvNWORP1wwD9GnwnB5RnM4jCRWpfd6BeL0Fo
         gJn+Ts+GbFcKEuK5ENs8LrY5qQHVFGMVezlwjrbzppjgKJ5iI2xl6E8ab1c5xc2WVMm7
         vDKvusVIIWHl4U2E3W0zYaR7dnZ5aFTKAVGKi74WvT+z7k+mCnNlIuCxNdC5vg5hynS9
         O2dNLzqIYdRx10PLVzMmZUFNwG8O//Ptt6MM7YEYvQCUcq6XwtcN7EjgkwGHZl5G8z7z
         e8FQ==
X-Gm-Message-State: AOJu0YwQdEyArzeeohW+1Y3FPovPMY8X2IioKuDE46RWIp0T5f0K2ibi
	DEESIOdvcJefRMJnuSEZyKXnlcM56P5d
X-Google-Smtp-Source: AGHT+IGbLBUPIfQHiKai+8RHWPNYuqXRw43QCHnGQB70v03pdYwtq9pCK3CZzd+u6yZat7Ii/tgXpQ==
X-Received: by 2002:a05:6870:1490:b0:1fb:75b:131e with SMTP id k16-20020a056870149000b001fb075b131emr13111421oab.112.1703791475661;
        Thu, 28 Dec 2023 11:24:35 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79990000000b006d9aa04574csm9522987pfh.52.2023.12.28.11.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 11:24:35 -0800 (PST)
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
Subject: [PATCH v4 0/6] VMware hypercalls enhancements
Date: Thu, 28 Dec 2023 11:24:15 -0800
Message-Id: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMware hypercalls invocations were all spread out across the kernel
implementing same ABI as in-place asm-inline. With encrypted memory
and confidential computing it became harder to maintain every changes
in these hypercall implementations.

Intention of this patchset is to introduce arch independent VMware
hypercall API layer other subsystems such as device drivers can call
to, while hiding architecture specific implementation behind.

Second patch introduces the vmware_hypercall low and high bandwidth
families of functions, with little enhancements there.
Sixth patch adds tdx hypercall support

arm64 implementation of vmware_hypercalls is in drivers/gpu/drm/
vmwgfx/vmwgfx_msg_arm64.h and going to be moved to arch/arm64 with
a separate patchset with the introduction of VMware Linux guest
support for arm64.

No functional changes in drivers/input/mouse/vmmouse.c and
drivers/ptp/ptp_vmw.c

v3->v4 changes: (no functional changes in patches 1-5)
  [patch 2]:
- Added the comment with VMware hypercall ABI description.
  [patch 6]:
- vmware_tdx_hypercall_args remove in6/out6 arguments as excessive.
- vmware_tdx_hypercall return ULONG_MAX on error to mimic bad hypercall
  command error from the hypervisor.
- Replaced pr_warn by pr_warn_once as pointed by Kirill Shutemov.
- Fixed the warning reported by Intel's kernel test robot.
- Added the comment describing VMware TDX hypercall ABI.

v2->v3 changes: (no functional changes in patches 1-5)
- Improved commit message in patches 1, 2 and 5 as was suggested by
  Borislav Petkov.
- To address Dave Hansen's concern, patch 6 was reorganized to avoid
  exporting bare __tdx_hypercall and to make exported vmware_tdx_hypercall
  VMWare guest specific.

v1->v2 changes (no functional changes):
- Improved commit message in patches 2 and 5.
- Added Reviewed-by for all patches.
- Added Ack from Dmitry Torokhov in patch 4. No fixes regarding reported
  by Simon Horman gcc error in this patch.

Alexey Makhalov (6):
  x86/vmware: Move common macros to vmware.h
  x86/vmware: Introduce VMware hypercall API
  ptp/vmware: Use VMware hypercall API
  input/vmmouse: Use VMware hypercall API
  drm/vmwgfx: Use VMware hypercall API
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 364 ++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c              | 116 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 ++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 -----------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 598 insertions(+), 525 deletions(-)

-- 
2.39.0


