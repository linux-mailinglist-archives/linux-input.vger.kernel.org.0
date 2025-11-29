Return-Path: <linux-input+bounces-16395-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E410DC93517
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 01:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B91434A364
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 00:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8880E17A2EA;
	Sat, 29 Nov 2025 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqDA+WME"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8649179A3
	for <linux-input@vger.kernel.org>; Sat, 29 Nov 2025 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376277; cv=none; b=MGEobke5so0Q95A22SNjJyHrvm5n1e3CgF0ywvcYnbXgf1wiDM1GhbWgUHM2ZBKJY03+bSCWpeOxTzh7CFSQMTdGBSfYVugJJ/i5yLPNRxVXRrMSiZeL8mDSNkffFRGwpfb3n2SOA8pEJgiHuTNVmBm+0xDuZ6JRkI9L9S34AOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376277; c=relaxed/simple;
	bh=f5ajGLywqacetvO5aZlhvTWE1cr9omxu7IqEe8Fzakc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xa31432g29mOfMeF7hcN4eHe1oLKC4nqAqQUVGn5xR6GIuSGIAs/M/OQrGOzYXK/mU3A9Jbm/yLv/NoVKyBPGUVKgTS6Ey1VNMJtPhXKL4+vPHRxE9aCMN7ZeFsMDnfg6j4Adt7x5YmR71mw60Vfma+nM4DKKJCxqWVX79obdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqDA+WME; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297dc3e299bso23283375ad.1
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 16:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376274; x=1764981074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+fCjN5ZvI1tFg9f4Onw94iBdBKzIF5T11o6ts8QCmI=;
        b=XqDA+WMEmWIIoxG6GXI5u9ybfdaHaBeMPA8d/rUnHlR20+6eooigaa7NIo5J7SbuSA
         twvmMNWyIK56AiFQlxvnpqZwh4S+7p2RNaSwpPWQP69Y/X4SljZFknl7+uRL7aQeAGUN
         Ssc/bGjIFO1x2B46P0IyAUq1hirbpHnABE5TvBuhiwNLi1F32G4QYXfw1FNvdJSc0mOX
         cqMNyY0GUewVp+BghCyE6YygzJWLDPY1YLHBv3lfyi6UUD+KkpZhS+KHWELzaqlszbon
         ocUKv/clNTwUjByIO6owbOQjBDQ1nJ7wqawwOJZ6TPVaFPw5qHWerA7DISy61px0ikP7
         k3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376274; x=1764981074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+fCjN5ZvI1tFg9f4Onw94iBdBKzIF5T11o6ts8QCmI=;
        b=S7CXEqDovdEJw7oLUuYBI6lCvo3XO1NbJT5svE3akdB3FiV99f2sQqjlyByL4Wrqvq
         oxSV+Nk7R71revWzUdFvhu6oZ1r9O8dhfCHWhrRNV3Ng3OSkzYKM73AEl2SgCTEDMAFe
         VoMXz5ac6SStG6man+2hPufIchElpzjzLwdZqXK/csQaFgDe4d2ubxWySwg3ZJswkQGF
         jrWSo/bCgLhQjH8L9nngC+CxHatSgBrbhDe+dQ2t1GKmXrSGrhOdC0W0E4qUd8qEHQ5q
         xpJYXyS+q2oeyWtsrXXSRvQ7ggJ7mTqpgipmcV2qTZZiFZ8VgoKM2j1vdohb+rj74YEj
         FEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYW7+p1uA5+jQSqizOTWeGEfK4FVPoT2NOz1Fo2JOKIO2PPttBcS6tU0+ndEVQ/ZSHTn+5pmEhwDPAJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+wXO8wE+MLPGLmixw3Oplm9qEfPoF/Y+h8ipIi4WezhTZ4rK
	ZJEts7l38e0WI3lPT4xIWm4rGZwyQ+yzKpxC5Gr5+E/1sqUyPf6GncbT
X-Gm-Gg: ASbGnct2W9B64qhqMJEyC0gubEq60g2bx5OnuRX77+LOcOAK2CcoM9i+1pIHctfOBuU
	ga6sRlkShpypmLR+WUCSZF5Hp96Ti25SJxNkP1itUr58w3tuuIf9F1X2aF9l8QooTU3/ilbFyrU
	BHtR7oH1W3+jBGCxYbZrzET/PRfbEdGgBQRDTlAugmb6zCz735lTNdnqBotBMTYsVvD99Szsxd5
	9ZcKE2bRSI5zU7M8WSZd7FjrN/9W0DEfJGzCdsby3BdK3P3V3GD1xGVDzH20TLsvTWsXv05UolJ
	3MfeeCGrnW3PcllBomYOnvOssVh4sPP0/x21fpRNr0t/khXnPsjOWAEaSuljLiil8aFUK9+Zgvr
	Yl+YdVGWcVFDaIcGubf+zAGkdpF1T8MsxNv/9Lhdvthy6im232N9MlhK8yuh3T0lauTFswBQ4wH
	kvcFVS5jauxHJjY8NIv1W+g0ZSiHihQfARPw2K2Q6k3idmV824bNne5quj6EXrmk+woQ==
X-Google-Smtp-Source: AGHT+IH+svOzJyTxN6FrP355nvW2jyLTDFPrgoSEepjsq9Yu90iGPCoNap//9fhBPgDitqVWdz56mQ==
X-Received: by 2002:a17:903:1108:b0:297:f09a:51db with SMTP id d9443c01a7336-29baaf7be8fmr183413715ad.15.1764376274087;
        Fri, 28 Nov 2025 16:31:14 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:31:13 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 0/3] TrackPoint doubletap enablement and user control
Date: Sat, 29 Nov 2025 09:25:30 +0900
Message-ID: <20251129002533.9070-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds doubletap support for TrackPoint devices with
a clean separation of concerns:

1. Firmware enablement (trackpoint.c): Automatically enables doubletap
   on capable hardware during device detection
2. User control (thinkpad_acpi.c): Provides sysfs interface for 
   controlling event filtering

The simplified approach follows KISS principle:
- Trackpoint driver enables hardware functionality by default
- Thinkpad_acpi driver provides user control via existing filtering
- No cross-driver dependencies or complex interactions

Changes in v4:
- Complete redesign based on reviewer feedback
- trackpoint.c: Simplified to only enable doubletap by default
- trackpoint.c: Removed all sysfs attributes and global variables
- trackpoint.c: Uses firmware ID detection with deny list
- thinkpad_acpi.c: Added simple sysfs interface for event filtering
- thinkpad_acpi.c: Uses clear naming (doubletap_filter)
- thinkpad_acpi.c: No cross-driver dependencies
- Documentation: Updated to reflect simplified sysfs approach

Changes in v3:
- No changes

Changes in v2:
- Improved commit messages
- Removed unnecessary comments and debug messages
- Using strstarts() instead of strcmp()
- Modified is_trackpoint_dt_capable()
- Removed _BIT suffix and used BIT() define

This version addresses the core reviewer feedback by:
- Removing dual filtering complexity
- Following KISS principle with clear separation
- Providing immediate functionality without configuration

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi - Add doubletap_filter sysfs interface
  Documentation: thinkpad-acpi - Document doubletap_filter attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++
 drivers/input/mouse/trackpoint.c              | 51 ++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 54 +++++++++++++++++--
 4 files changed, 125 insertions(+), 5 deletions(-)

-- 
2.51.0


