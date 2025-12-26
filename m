Return-Path: <linux-input+bounces-16694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB3CDF20D
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 00:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62BCE3007966
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 23:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BD726FA4B;
	Fri, 26 Dec 2025 23:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKXlynqT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1722126C
	for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793236; cv=none; b=VbiDdy6rHeaG1k1sKFBq8yZRF082MyXWhzUp9IsKo/V1fOouIidwOB1rrgfOKs4Tu9pgXGM6l265WuLQazEvqYyXIK+AsgabAaUnxRCHxWXEeWDnA0rZ8L+HBt1tor8QcY3TUb/FKpfuLNBQ2pmnWL11TctsrhWNZpBaBYGqna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793236; c=relaxed/simple;
	bh=Xn89Z7LlNJRh+TRBmYqTnWl1iqTuZgasa4aVYS0pnY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDMk2r2l5lJGitCQJCd4F1YLgT4VsqeqkbLdsf1hTtacUltjJTb0YVWiRnPHjz6tJUt+qVgl8TuuDa6j4EWEcIPyQX+5NMVJxh6s9jgqQ1d6zT3isYOsdt+HKx6uUR2U2X0uOs89HzXayBYB0bK1RlO8t6ZS/khnJyk91HShxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKXlynqT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so8515636b3a.1
        for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 15:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793234; x=1767398034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0vyeocCV33HEg26/iuFmDPXpUFL78V+AfewKJRB7/s=;
        b=GKXlynqT5B+YeAXWwxYel6zmA7CxjIy6K2w8fxPwhLlrU8/fT9G8CsrsgiSQJmRvkQ
         N00CiWKzTMIPGt0XEDMpKK4A5zuqcCwPKiaRm0tdV5/nXdWLPMRW1dzPekVYH0ABlGao
         gh7H5EYEjWUMMjKpps3pcIylZO0l73Qs2bKVV5eDoP9dDNHp1kRwbeiC/3csOkV3Zh9Q
         Lq12RWMFR7G7Aiztd0qDa67du4psGEkCRm2qBmJDiHYPjbSEo4mjFc1+3IST4uAs53hM
         LsBUd8M6ZjM5BmLUq/DtldeVPGDqyaZInGfvQePb2YGxLc0wyegNe4mP5ZJ0vNfhBwYh
         Murw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793234; x=1767398034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0vyeocCV33HEg26/iuFmDPXpUFL78V+AfewKJRB7/s=;
        b=vIaiwN3pl5I+PXB6+KzQOv/AVEYBwF3qGTRzQlSXioHRpKg+8vz+DABMO0PYQm+k/5
         tAV65QnqcJFKjHnUYXPQUfB45ykDE/6+B04xjvkJHn0DWKlFqtpVBL+DrHgH1GsUMMRs
         WZeR/sgSYXaxk8Ds6FLLK0FO2GcwPLxHEJB+NSJ3BdtU5isxj8d+MDAG5LFDVRF7z4+0
         KI9N56zYlTFHJvi6sLY+0lYcx5Vk+jKhiT4mwp8YEM3EFlGg3EjtL8HL9n0xX9l83MAL
         XuOlGuUkpgZzQHp8fmNAMSwwp3B5gfis32qy4EG1VCAkI7V5tFT9FbihFgZikcrnafHY
         SEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFmTKnJKMrbdL4sEwOPRVEp8KszfiRhLZZOgc00t+Bz6AKZ5PMtwzYlgGPPmbT4fb6ztlSNtq6gRKjvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbNddVNCDaOdA9gxtievva7Kngum4+1a+t5Ds8+NDpG80cec/
	WfNh3rCwpTcVOGwCBzvnjRhdiQ1FBSOuj1obe6wlQJ7EH0vKrkrFssBg
X-Gm-Gg: AY/fxX5LOH3dTKP5hPPjQxZZw2KtzxLe67XvjSkHFP9UhX2xIATvOxaXmzMHOFefZ6d
	H5b891GFKSCl3YKuJmrrsyf+/qm2UQWAyp5qEXdCOYZjCnSWDf8HOBBU66CkcHtmCxDyZRT/99a
	OE9NSxzbjb5plmIO42RbczAytQd5fNkjy8mT1zBS+xEW5xwZ6g6fHhxdaNIgTL9RyjP6t92bLan
	DAyNpSsUgqzNmOEPciVl+AUdoqK2umj9cQz2UXRCAltJwju6HvSrxfq0R5I1hs4+LxtkvNor1po
	hN7LytikGCJwyVUn6AzbVdBHEz9Ic6BFsG6q/+qcOcq3jxdhuAB79g9zcCmFVGSRojkr7XC+1b5
	yt8Z+zOXRkPgAX4GQTQhcOwoSMOnFJYnUeaLoAwy6LPeSAe+kTHkj/DpViH0CSD9ZOv/LbzHgrO
	u1wMeBhmPdEX5Pw2nOTF4CDqNjCKw6/+lOa5PUP3UZ2XEVmhHH5NTBpSjOeH2p01YE/A==
X-Google-Smtp-Source: AGHT+IEtpUCwGLlNLxKyNXIMX8+tzq7l0KJnLDuBLqpsPtLogCjtkzSZeYADQRlUzu4Ad7mZhlnfvA==
X-Received: by 2002:a05:6a00:4512:b0:7e8:450c:61c8 with SMTP id d2e1a72fcca58-7ff6667c5a7mr22939512b3a.56.1766793234329;
        Fri, 26 Dec 2025 15:53:54 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:53:53 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 0/3] TrackPoint doubletap enablement and user control
Date: Sat, 27 Dec 2025 08:50:58 +0900
Message-ID: <20251226235101.106451-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for TrackPoint doubletap with a clear and
simple separation of responsibilities between drivers:

1. Firmware enablement (trackpoint.c):
   Automatically enables doubletap on capable hardware during device
   detection.

2. User control (thinkpad_acpi.c):
   Provides a sysfs interface to enable or disable delivery of doubletap
   events to userspace.

The approach follows the KISS principle:
- The TrackPoint driver enables hardware functionality by default.
- The thinkpad_acpi driver controls whether ACPI doubletap events are
  delivered, using existing hotkey filtering infrastructure.
- No cross-driver APIs or dual filtering paths are introduced.

Changes in v5:
- Rename sysfs attribute from doubletap_filter to doubletap_enable to
  reflect actual behavior.
- Fix inverted logic so events are delivered only when doubletap is
  enabled.
- Suppress ACPI hotkey delivery instead of injecting or filtering input
  events.
- Register the sysfs attribute via hotkey_attributes[] instead of
  device_create_file().
- Drop unnecessary helper wrappers and debug logging.
- Update Documentation to reflect the new naming and semantics.

Changes in v4:
- Complete redesign based on reviewer feedback.
- trackpoint.c: Simplified to only enable doubletap by default.
- trackpoint.c: Removed all sysfs attributes and global variables.
- trackpoint.c: Uses firmware ID detection with deny list.
- thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
- thinkpad_acpi.c: No cross-driver dependencies.
- Documentation: Updated to reflect simplified sysfs approach.

Changes in v3:
- No changes.

Changes in v2:
- Improved commit messages.
- Removed unnecessary comments and debug messages.
- Switched to strstarts() usage.
- Simplified firmware capability detection logic.

This version addresses the remaining review feedback by correcting the
naming and logic inversion, aligning sysfs semantics with behavior, and
fully integrating with existing thinkpad_acpi hotkey handling.

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
    double-tap
  Documentation: thinkpad-acpi - Document doubletap_enable attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 ++++++++
 drivers/input/mouse/trackpoint.c              | 47 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 107 insertions(+), 7 deletions(-)

-- 
2.51.0


