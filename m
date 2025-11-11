Return-Path: <linux-input+bounces-16000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A947C4D4EF
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 12:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF97B18C4B16
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 11:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810253557E4;
	Tue, 11 Nov 2025 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ngxyr4HG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHCsfdWQ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543D355053
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858648; cv=none; b=DbLiRCPdoinjT+tSsorJEFqqvE3MSYlcRPILCW/U+2hDPKGMO6no8XIiqyoL2MlO2nuMX+ArVcv61ADPDgST+pjQfnourOag2+0thwa/l+eox/5Ax4HJRw7SfNh+SdYRTf3pQmUnHJXxZ3zgnvpkO2KaQeR8Ghk23o7E/sBDrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858648; c=relaxed/simple;
	bh=NYhtfUxZT1YXAcAQF0qWwjxLnb4vU/OkwMpSzLBjlsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HwyKycupuwj68NxW5jtGEPrcw5hXmaDKQixVvrJWDKqYJS1GWuyspQzNHicbArkZThw4QBPLGB2T/1JbpeVST5nMmH1ZW7eiaxzquJBNDXpf4UA5kBgAZPCx8zT0Y4ykbO0XM07ZfCbVvqC7ifffp2zVF+HpKTgBAFTdVRd5PQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ngxyr4HG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHCsfdWQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762858645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lLXbfdbNy9/hvVp5w0asRQYfVq1o80iFeNQJCAkbC5k=;
	b=Ngxyr4HGahZzy288KG8M8EJ2+MHfaAF9foqVEfu/dt5diZDEeknZpgi9DC7ZnKD6/SMd1e
	fgJrJtRppbR1Pgx42BRuSocbw61ZzHewO4Q9aKS5C6FeQm+V037Txd4IcdDnRgCujCuP3/
	1wzjSFrbErJPSWtxtRiHeq3brei8e8I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-0um8RuTOMVKZ08y1nnaXCw-1; Tue, 11 Nov 2025 05:57:24 -0500
X-MC-Unique: 0um8RuTOMVKZ08y1nnaXCw-1
X-Mimecast-MFC-AGG-ID: 0um8RuTOMVKZ08y1nnaXCw_1762858643
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429c5f1e9faso3051316f8f.3
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762858643; x=1763463443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLXbfdbNy9/hvVp5w0asRQYfVq1o80iFeNQJCAkbC5k=;
        b=fHCsfdWQ3V4PBbz4jsTDxqBxNxltb39q51RMs6y2unPRDs/4gLxyU9wAZN9NbrVMa2
         fw9tKqEA8J2NZbg/UIjs5dqof8uP2GgQewuru7uln9bOCfNmxSTcQhSm7nHV73w5Nj9R
         jrvJhda3jm/RAkuqxD55Uns7NzSVvdwnAj0caoLgKvK/s5v+dzSggU7bJzaX4MIgKlcd
         7faF6pwutADlu5/foyrb6Q0Iisv6pzGgpicddWZE5OwouaEjoOiMnJdzP4jPiJS3El2+
         cVA7S66R6oQEBiikh+p57l3HJZGfzdYEobhoJJYYwpyENi7JgwdXn0/x6Y1r3jPHY59r
         LG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858643; x=1763463443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLXbfdbNy9/hvVp5w0asRQYfVq1o80iFeNQJCAkbC5k=;
        b=h0m+VnFK56zgPBvJikRKjrtp7zKIgkH1G5WtSqL8B6Letvxd8M6ijlmGm9rLS9zxA3
         fM2ZVVQ51cbjxfKHOSJFskEFn45H/yA7uER9s5CscPlH5XiZXTScD7rnTH2fhkgl+x9K
         6o0PubK86bN1PcLsg59wK/heLFB627tEEjoTNlKEbZwq6zryBWGzMN54al8dVo/bdbL6
         vDMcybTcLOSdknSwPWwid7z3Jr6EsyT8CJPd3tm9P383DE1V2jPcWEpxVlxIHLmtayWP
         1iPVy3UqCD4RNRyNAsJson5xLRnoZWp4h6wriS+RLBV4KFwDAPlXqTCNAzBqBAYICkM/
         YN7A==
X-Gm-Message-State: AOJu0YxE5c94w2Ci1Nw8Q8ecICIiVLMjxajkmA0YuAlWi0DdiQL6eRRp
	PYjPeToHc3vzpyIiMS4HoO0l1r5Cf9SD4uirELOhkrEfL5twIMfeJ8Wv3fVDtQEvs3cyq51lLAA
	AM2m+Okl6kM6BcxBPC+oGBIh+4F+5uwEm9zYtz4aXPA0UWjoGKB7ysWubqPx7jWmcaJheoa47yS
	K5KPde7sGPVd2CTE/gOau37Pu1C1ExKzV9GRDsC5SksPhp/dWd
X-Gm-Gg: ASbGncuRa4OjREN23lWYRJw9Md6ggUjmLVPPDOhTpA+J5TpwCd6+mZJPMBAByLDK9OI
	HzV/Qnz4TgwuJ0yryd3tvWzISj+iH0rk+ieVjE0WdDboH+981tNYitn/Hlr1QQ1TbnjHa1ZkluG
	hQnKxP/QePaY9Nrs6/ZE6rCiP0amNTY49mJqD9CFDoLsQZOxrXOfzWU+m6bxp/5jbdsAFkURC1u
	JKgnfLLXtqEBBspmYCcCiUMKYlOzNekD0rJnK49PcUtHSw+m36pl35w3JJUTnNlKt4pT3kFTU/U
	u7cNynNYoltjyZhdiZR96FLKQVBLg1sSHXnTi7eRup8RTl2DjfRUNHyfRc3MpOBKHCTNjegLULm
	Pm4qfyqPFUwNlfw==
X-Received: by 2002:a5d:64e6:0:b0:42b:3680:3567 with SMTP id ffacd0b85a97d-42b36803910mr6819210f8f.18.1762858642876;
        Tue, 11 Nov 2025 02:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExHgXpLyzfVfcHOvkKwXBj1AViraKaxnypuiWpEttXt7rvZ6i7XtflKrBTuB0ga0hZUwj6/g==
X-Received: by 2002:a5d:64e6:0:b0:42b:3680:3567 with SMTP id ffacd0b85a97d-42b36803910mr6819179f8f.18.1762858642355;
        Tue, 11 Nov 2025 02:57:22 -0800 (PST)
Received: from sissix.lzampier.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679607esm27069549f8f.43.2025.11.11.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:57:22 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 0/1] HID: Add support for multiple batteries per device
Date: Tue, 11 Nov 2025 10:56:30 +0000
Message-ID: <20251111105634.1684751-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC introduces support for multiple batteries per HID device, addressing
a long-standing architectural limitation in the HID battery reporting subsystem.

## Background

The current HID implementation explicitly prevents multiple batteries per device
through an early return in hidinput_setup_battery() that enforces a single-battery
assumption. Linux treats peripheral batteries (scope=Device) differently from system
batteries, with desktop environments often displaying them separately or ignoring
them entirely. However, this design doesn't account for modern multi-battery hardware patterns.

## Problem Statement

Multiple battery scenarios that cannot be properly reported today:

1. Gaming headsets with charging docks (e.g., SteelSeries Arctis Nova Pro
   Wireless) - headset battery reported, dock battery invisible
2. Graphics tablets with stylus batteries (Wacom) - requires driver-specific
   workarounds
3. Wireless earbuds with per-earbud batteries plus charging case
4. Multi-device receivers (Logitech Unifying) - requires proprietary HID++
   protocol parsing

This forces manufacturers to use proprietary protocols and vendor-specific
software. Community projects parse USB packets directly because standard HID
battery reporting cannot handle multi-battery scenarios.

## Why This Matters

The current limitation creates a cycle: OS lacks support, so manufacturers
implement proprietary protocols, which makes vendor software necessary, which
reduces pressure to fix the OS limitation. Improving HID core support for
multiple batteries would enable standardized reporting, reduce the need for
vendor software, improve OS integration, reduce driver duplication, and provide
a foundation for future multi-battery devices.

## Proposed Solution

This patch introduces struct hid_battery to encapsulate individual battery
state, adds a batteries list to struct hid_device for tracking multiple
batteries, and uses report ID-based identification. The implementation maintains
full backwards compatibility with existing single-battery code.

## Testing

Tested with split keyboard hardware. Each battery reports independently
through the power supply interface.

## Request for Comments

Is list-based storage appropriate or would another structure work better?
Should we support usage-based identification in addition to report ID for
devices using the same report ID? Is sequential naming (battery-N) sufficient
or should batteries have semantic role identifiers like "main", "stylus", "dock"?

To HID maintainers (Jiri Kosina, Benjamin Tissoires): Does this belong in
hid-input.c or should it be separate? Any concerns about the backwards
compatibility approach? Meaning, should I have removed the whole
dev->bat legacy mapping and use the new struct?

To power supply maintainers (Sebastian Reichel): Any issues with multiple
power_supply devices from a single HID device?

Related commits:
- c6838eeef2fb: HID: hid-input: occasionally report stylus battery
- a608dc1c0639: HID: input: map battery system charging
- fd2a9b29dc9c: HID: wacom: Remove AES power_supply after inactivity

Community projects demonstrating the need:
- HeadsetControl: https://github.com/Sapd/HeadsetControl
- Solaar: https://github.com/pwr-Solaar/Solaar
- OpenRazer: https://github.com/openrazer/openrazer

Lucas Zampieri (1):
  HID: input: Add support for multiple batteries per device

 drivers/hid/hid-core.c  |   4 +
 drivers/hid/hid-input.c | 193 +++++++++++++++++++++++++++-------------
 include/linux/hid.h     |  42 ++++++++-
 3 files changed, 176 insertions(+), 63 deletions(-)

--
2.51.1


