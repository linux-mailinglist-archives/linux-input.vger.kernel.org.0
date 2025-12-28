Return-Path: <linux-input+bounces-16706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80ACCE4B8E
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 13:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1BE300A37D
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 12:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF2E2741C0;
	Sun, 28 Dec 2025 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfGNrj1O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F82248B9
	for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766924438; cv=none; b=ItFIvT5VxD3n6YcsM2Ni3ppYzZRy8s/rh9XcRnFUXSCopJw17TKWymPFlVYnfNzmM/E7quPCOFUi4xQ5a+3/phc8O8gIkHCNFl+Jknx0mxsvlM3aa1eNcNBfjLFytNIaTZYYKkW0nrXYKo0lzL341WH7vy1gsG5OhPzXLWjyPE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766924438; c=relaxed/simple;
	bh=D2tTDerjIFR8z+h6jDaki0Uyf3AFy8XBzGd6Z9tCEJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbkURDqJZLi2WLPRZRuj5KkZZf+rMqSEfFg+xXVoNXx1R97wuPtBSyiuJel8DLu9pyVzU/4gS06fky8Mg6kCJiF9MMMjjrGdHMOEZpPQBsPV+iuV+Et0dXk3MOC+sRBgpy/wpkUbQAjBQAXcwDRCA8nZ3LGWZvO2GDoV23n0zNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfGNrj1O; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so95629636d6.2
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 04:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766924436; x=1767529236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vu19ssYqF8RzPs03zD99jr/wSKN/U5w4GrCrQ2W+U8=;
        b=SfGNrj1OnlKD2Lql11Vx0ok4i6hIibfDBneAlG4/qEnouh8c/vlqMAZcc68MgA/RLA
         0uFiKOYm+oPRMen9OlimKjwhC8k7hx8jDA0xaw8ytSj0haPBFzO4h/Bz4U1Pnk6Bw1/N
         n7+ZhdKswintWpFL1FYrVuQ9RgL6L/QxqFdjyzUSqGkuo/OavlLjqfqF79A4mpmHs204
         lhCfQqr22TKDZLD3LOxcfTc4HHWDHUXRSlcxJ40ACO5HS8gJclXIlS53aBdCiBpG4JMM
         HKTGkEDVaAjuGdLHC6RpQQ5cm2shVUqTImA2a1Imq8Mh8Ct2hXRkB3s0OBwWaOEmQW2D
         C+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766924436; x=1767529236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vu19ssYqF8RzPs03zD99jr/wSKN/U5w4GrCrQ2W+U8=;
        b=MFf8mmh6aRcIgWO22JpwMtc/XlQdjL4hjX8A8XERYpK6aOKeSmL0g20z4WNebfPTda
         kE+wR5l76/RbFO8o1IAah8wFdbmUOmty4vUSdEtHo9zZ/At3iCKlLZVw2GntMghnbjPf
         LfeIpFmhg7+z5CgBQ5ryafU1P+1eeBZae6yFTHKIDUsOuLVawPPNUs7yu7Kw92U8c2Do
         7J3JrHFKAE0BfYvu3+6YCF2DAS+DDHRywFBQ4bPIZVtB1/9k0qvWB/ARPRYQ4gDacPJh
         tRot3H/JYZKFvY3VABcHYYjigvQzgtZb7chnyoCbpSeDL78lmcXMwdfZsNn4pw85pMzP
         6GGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC+ipbzuePCQdEueAJCI4uMvJ/G2jtKLAwQM0wtseimDBD+9rg6Ce7Wqi/e+3Zmj7JuFjQsv93qNQI5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gKLzsa6kIeSm4CWKB0TLgh2fo9i7SGz+Urf3Mytq3XJjc9Ix
	tgvuUDNMiKtZ6tdPN2g30NF2wQyQeysNBYc0pmCSDf3Tg7/J/j23hKsk
X-Gm-Gg: AY/fxX7MKrDGX67ZB4mHfdcIGs+c9ju7PpxRHxmAH3Mxkjcr6xM02DkfanAVm7+1DH1
	KNHCilrHWg/5PW0eBUZZ8AQ9sNBq2fCXoio374nSGhMVZ0pXbvaEMAq5c3b2XLhMBBnPoVNtXro
	VzldowhgyFTptLogEAY4WLpa1w8I5NPkrtv7/7x88IdJ00IUTxmufIMW0xz7QwpbP9Vwew6VgNh
	0dfyfPxjkSO5u0qUP5cMFbF2Igdj8hEZ3SjfJjXFf4Csk9sI/PWjqqBtnKYBi9xjachesYDZK2b
	tXSoiKiUQvsKeoSW6t913cqPUiI7WGDutbqJA9bg+wVWx34y4ioeTTuoQYmPH54ZNxLsqQTRGgc
	YZzbXQqCDS57SZK8rWf0+auw5IjyDYCjhuwJJuRhtwlMgV2gjqvE3PeurP4nArMHGoU3sLMnJ6t
	9suzgZZSXJUAdLz1ifRVPq0pQUT6hYHOgqv8ZA0mPMhHnMgiLBrgsy3mx6ng==
X-Google-Smtp-Source: AGHT+IHHY3DbIvlK/sItGxQn83/FxJ4tcMaWp3yJ7UoG4a7iNtx93cdJCKtR3Gi4x34eP87TJfHWuQ==
X-Received: by 2002:a0c:c3d0:0:b0:889:b6f1:1f30 with SMTP id 6a1803df08f44-88d825257f0mr406401156d6.18.1766924435804;
        Sun, 28 Dec 2025 04:20:35 -0800 (PST)
Received: from achantapc.mynetworksettings.com ([2600:4040:1233:de00:c673:8e0d:7a28:6166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm208744456d6.43.2025.12.28.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:20:35 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH 0/4] HID: steelseries: Add support for Arctis headset lineup
Date: Sun, 28 Dec 2025 07:20:21 -0500
Message-ID: <20251228122025.154682-1-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds comprehensive support for the SteelSeries Arctis
wireless gaming headset lineup to the hid-steelseries driver.

The current driver provides only basic battery monitoring for Arctis 1
and Arctis 9. This series extends support to 25+ Arctis models with
full feature control including sidetone, auto-sleep, microphone
controls, volume limiting, and Bluetooth settings.

The driver restructure uses a capability-based device info system to
cleanly handle the varying feature sets across different Arctis
generations while maintaining support for the legacy SRW-S1 racing
wheel.

Patch 1: Add 27 new device IDs to hid-ids.h
Patch 2: Add HID quirks for proper device initialization  
Patch 3: Update ABI documentation for new sysfs attributes
Patch 4: Complete driver implementation with all features

Tested on Arctis Nova 7 (0x2202). All other implementation details are
based on the reverse engineering done in the HeadsetControl library
(abe3ac8).

Sriman Achanta (4):
  HID: hid-ids: Add SteelSeries Arctis headset device IDs
  HID: quirks: Add INPUT_CONFIGURED quirk for SteelSeries Arctis
    headsets
  Documentation: ABI: Document SteelSeries headset sysfs attributes
  HID: steelseries: Add support for Arctis headset lineup

 .../ABI/testing/sysfs-driver-hid-srws1        |   21 -
 .../ABI/testing/sysfs-driver-hid-steelseries  |  123 +
 drivers/hid/hid-ids.h                         |   33 +-
 drivers/hid/hid-quirks.c                      |   25 +
 drivers/hid/hid-steelseries.c                 | 2061 ++++++++++++++---
 5 files changed, 1917 insertions(+), 346 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-driver-hid-srws1
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-steelseries

-- 
2.52.0


