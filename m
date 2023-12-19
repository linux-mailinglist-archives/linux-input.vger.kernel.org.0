Return-Path: <linux-input+bounces-865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125D81929C
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 22:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33E701C2491B
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 21:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B513D0AD;
	Tue, 19 Dec 2023 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CTsyxtyA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BC3D0A7
	for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d32c5ce32eso1015945ad.0
        for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 13:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1703023083; x=1703627883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDzQhgIqDjX+fytpqITZ57HizgWrk/Gmzq6GoIsVzBc=;
        b=CTsyxtyA7l5aKNbiOxw6k86E4vnHKTypMGflbUFDYIwd3MlVcGa0WfDorcS7bxAzSe
         wGCZef1iQMh7PTQn2+Jk6ACrlnQ8Gejg6+K3JMoI/btDwAErWOkwSMyDz2Uj44erkRTw
         b86ZKfk/N6dkW2cZJyTsTqfociyAv6vHKn2ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703023083; x=1703627883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDzQhgIqDjX+fytpqITZ57HizgWrk/Gmzq6GoIsVzBc=;
        b=r38h3Hpv8RZSQLl+uft/T3IhtpwbKxyZj1/mRbWWm6rCrNDMyaERKF8NoB2hrNr9+O
         VvFZGRfzKGlAP6r/wFe1NWPm4AgIbtwpk7DmVG9jtPpS/b/9JewMfmAsRsh/k60cdeFv
         qPdAkTfL1MSbtEEAip9SJm12Eo5+PWf7CmYhfOLm0N7OoTzDGqUZC4EZIRCO09diEkW/
         S0Z2hSdx6zT4VvA1JDkdW72ebFLA4ryxEhkYgNF48BVn62gOGEOFjFeyCNyIu8zBstRL
         tAhFdAomFk/jiTvfinVSmzt5HVgrw66xdaqqNAWDmSeKTCnnKRRSw15+NimmTRXPS9lH
         NGWw==
X-Gm-Message-State: AOJu0YyVoczq43Enq3e8n1hjzZqvceHrX4bKIx1HX58e1etdOUKAKnJB
	MOxHUqmbRU4v+qAzQZJjFlSm1tBQ4Jg1
X-Google-Smtp-Source: AGHT+IFpkieRnYX2krB3iy+D6iZ6NtVOA9WZs25SYlO/ihVa0FtxrjypCE07V0g+ajh6EVSVdLwAvQ==
X-Received: by 2002:a17:903:1107:b0:1d3:bceb:ba62 with SMTP id n7-20020a170903110700b001d3bcebba62mr2007657plh.45.1703023083132;
        Tue, 19 Dec 2023 13:58:03 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id v1-20020a170902e8c100b001d3aa7604c5sm5356476plg.0.2023.12.19.13.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 13:58:02 -0800 (PST)
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
Subject: [PATCH v3 0/6] VMware hypercalls enhancements
Date: Tue, 19 Dec 2023 13:57:45 -0800
Message-Id: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
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
  x86/vmware: Introduce vmware_hypercall API
  ptp/vmware: Use vmware_hypercall API
  input/vmmouse: Use vmware_hypercall API
  drm/vmwgfx: Use vmware_hypercall API
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 338 ++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c              | 116 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 ------------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 577 insertions(+), 520 deletions(-)

-- 
2.39.0


