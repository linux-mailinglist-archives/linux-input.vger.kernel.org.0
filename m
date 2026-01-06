Return-Path: <linux-input+bounces-16794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA5CF8A9F
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 15:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DAC13010F89
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 14:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F8227A103;
	Tue,  6 Jan 2026 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzXSro8k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801233556D
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708317; cv=none; b=gEVK8uDmxZQ3TBD/mQz6F8Befi8CKe08PM80W/rA3JKtxicZymbeSFI7EqXc2mDc4DgD+oXfIh9GEr8zYOcWgvs34Rn4rYNQWqiJM3iDVo1E9U16WNinXB2PfqAbWVi76AWB16ovI+2iRBQ/mZ6Zz1uHd9XjevM6IFs9SC3rAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708317; c=relaxed/simple;
	bh=+w+Ymx4NwlBTr5vP7SyEQ9V0WNLPsZp8VJEG6qxNp8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hXJEs7Jtlle4R76H4lCOf1+x6v9pycJ6MtsKigLRZAwL5Vgzsbpa5nX9tAIomRDjs4JVRHJ0TDcChIOa0u4HyH4eK07T3tNAGiEOXCeE+sjJaXaCXQACAdrx4ZkmtAm7fZHRUe9A/qg9yec+TMBL5qNTFQXEu2QPbfYLaCiGJdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzXSro8k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc544b09so655166f8f.1
        for <linux-input@vger.kernel.org>; Tue, 06 Jan 2026 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767708314; x=1768313114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHbv4naRwvTal0STzf8a6D3E6AatMAi9Skg9LQRXqgs=;
        b=LzXSro8kbGN/XHo4MZjEXOJ3zKxpQqyG+h8EJ8+wUMYy9YyuBScLgcgmve23P92FSr
         YrQrHQil6PYuOtkUdB3OgBSGgU1uKt8VhAJ713HFLgYYxt3Trp32tJQZJIy0Mf0+07im
         A9QOWkue+wkaLV2yfsXNx+vssqCM/ibo2duAxGS7wnEcWoHP7YKaQgKcsuHwXZ2IdEPV
         BD84E36/GD/vM26umUMLYdxSez4LbH7EScf5FpJFUj8HakpIWVdAZpSRaYbk0dDKfakg
         ZTJoERqZGmXdAIou5HOnTXsWISYKn1pHWKUHveFGdCnZu5STnvWu5wcPZ0rHE8lkGZid
         V/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767708314; x=1768313114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHbv4naRwvTal0STzf8a6D3E6AatMAi9Skg9LQRXqgs=;
        b=rBetbJbgJEMd/7wuutlnc+1vf3RH9KlPTqNC1lOxHOyNsO1IzkWIhQLEQCR15gbMqM
         Oilxsj50cGW9N8oXTakxeJDr5jEINf1tBf45mmy7//8eX2DL1ru66hlMrM809obAPu7s
         N0y9ns6Dxu7trItMMqQM5IVVqok6jBf8HY6bNDbsHclJd5weZgvH1ugS3+O8vYRzNRwK
         +uo27DEw+LhE3rYFCpFFiGw8IQ39/VF/Waj0bqKKJ/R79qzUwAJEoljdNHMRPJ2pKWfS
         oRKlRE1IwLikTxLJ+967TShWjq3ePbW5QzBoHJeHKVkd0YXEqMPx8C3m9SVEWoDR3Zsv
         +Htg==
X-Gm-Message-State: AOJu0YyPbBOhEPOm0pOWFXHOfFRSfIoY5VYJZ8BQqHGH8DAbQFoObuD/
	iPfUyi2PmUbZhrxmXnhvv5KDqU6PO8YERWXXK6CvcR+x1clmcGkm5Sjd
X-Gm-Gg: AY/fxX5MEWVcqTWQYIxBOBAxdZo/V+2H5Pw6kN4f4mFudCTn+6mVFhA+wOiux1x+YQp
	TuMe6VMZlDbkiAG2+d9cFDMG+tGlY7zjcG1yrWBG1BmDr79Ufchb2P3OrReV1R1Xkz1il+1mBb2
	HrhXF9fs3HY5ym8SJ+w7AEK1BOTT1m8FEKnuu1rewAXMZXUYGWCcr++WYSXj/ni/gw4Ggk/0c9f
	PFutfkQ4wIZ9OJFJ4xUAX36CHRXjIj4QdaaIUrLo2Ht5iVs0/87qF56WNWnn4N15z4KW9IbqCtU
	175ZSr16E2uMp6psIcXRDCAHr3kKLfoxglBwoUVNG3qXIUCWqBCBE0PgI8IVTCJbCxPg44E8ja9
	QV26L+Dq+t4e/0JRlL3JQOVyU0Fuso4Ygd4+Sm1rPYJiuw+0Y+/G0AQHMP/agQmHUHnL4eGuQS2
	Mb++xACuTdpEwaHkqp2sYwjrLix3nzlFHgOUKlkUI=
X-Google-Smtp-Source: AGHT+IEnazC597cz4qJRfWHjOUrH5GNphybqPScAHzRmg24ulAXqQNXhM4Bl6q9K3zfd8ff1NygSTw==
X-Received: by 2002:a05:6000:1844:b0:431:855:c798 with SMTP id ffacd0b85a97d-432bca3028cmr3876355f8f.19.1767708313613;
        Tue, 06 Jan 2026 06:05:13 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm4475238f8f.0.2026.01.06.06.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:05:13 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mario Limonciello <superm1@kernel.org>,
	Ionut Nechita <ionut_n2001@yahoo.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] HID: asus: Add ROG laptop HID code filtering and fan control
Date: Tue,  6 Jan 2026 16:04:50 +0200
Message-ID: <20260106140449.90506-3-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

Hi,

This patch addresses two issues with Asus ROG G14/G15 laptops:

1. Kernel log spam from unmapped HID vendor codes
2. Non-functional Fn+F5 fan control key

Problem:
--------
Asus ROG G14 and G15 laptops send several HID vendor usage codes (0xea,
0xec, 0x02, 0x8a, 0x9e) during normal keypresses with no clear purpose.
This generates continuous "Unmapped Asus vendor usagepage code" warnings
in dmesg, cluttering the kernel log.

Additionally, the Fn+F5 key (code 0xae) which should cycle through fan
modes is not handled, preventing users from controlling fan behavior
through the keyboard shortcut.

Solution:
---------
- Filter out the spurious HID codes for ROG N-Key keyboards to eliminate
  log spam
- Add asus_wmi_send_event() function to enable communication between
  hid-asus and asus-wmi drivers
- Implement Fn+F5 (0xae) handler that triggers WMI events to toggle fan
  modes
- Replace magic number with HID_UP_ASUSVENDOR constant for clarity

Testing:
--------
Tested on Asus ROG G14 (2021) and G15 (2022) models:
- Kernel log no longer shows unmapped vendor code warnings
- Fn+F5 key now cycles through fan modes (silent/balanced/performance)
- No regressions observed with other keyboard functionality

Impact:
-------
Affects Asus ROG laptop users who experience:
- Cluttered kernel logs from HID warnings
- Non-functional fan control hotkey

Ionut Nechita (1):
  HID: asus: Filter HID vendor codes and add WMI fan control support
    for ROG laptops

 drivers/hid/hid-asus.c                     | 48 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  2 +
 2 files changed, 49 insertions(+), 1 deletion(-)

--
2.52.0


