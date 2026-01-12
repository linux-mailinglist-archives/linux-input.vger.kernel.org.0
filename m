Return-Path: <linux-input+bounces-16951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B834D108E5
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 05:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7D8E3033D47
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 04:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A436E30C615;
	Mon, 12 Jan 2026 04:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NO3wSNmV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3430C63B
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 04:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768191672; cv=none; b=Lezb8SqNSJXlOedKq3mzuYREfbBjZHs/DEetYbFbfM1e5wpvulVbvVnZXYhTUg1jweQBQya6N9gmojESEr7rXBPU2pG1YdU3QsnCac5saP4njEsLoYHMiV46XdiV2ug3ujPeRbVvh/4/NC0FucJyPhIYg7IFviuO4TG1Uh+9Suo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768191672; c=relaxed/simple;
	bh=tEsJIVhpfOCr5wubWadEvynOEDcykkNDiC2FTua8Ctc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejIT+QkBNnMIool2Z08m3rZ1nLEPZgij53dhJg3r45her+a4c8Nc6GdJhydjMlEYlleK4/NUGDDJ2Lo5F+6w73GXQU6A9N/EtmUc9iZazWeTAbtMvxhXY0GsTy/YYt2h80DdlRfU9fz+aldzpY+DzuOyaGo0JrIpOK10W1e+YB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NO3wSNmV; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2ea2b9631so689945985a.3
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 20:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768191667; x=1768796467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hovi7Qy0h/alR3/ZXv95SLOCivRlAPv9Hq2eVQI3/ck=;
        b=NO3wSNmVjPpG5CsYrF8cOhjbPb7Wik0qeYC2MhXbI3YYRFGAGWT2JIaoDFGlzM3ZQD
         VJqhSgcq5YaownEr2EX6o9JH2EZmeleNBpIfvUWXtiZ2/e+zCWRcnh7I9CpxFGN4OiCT
         o+/qse77SftxuutQ4ZnrWmznH0PHbZGHftpsOPo1+tV0HLkyTA1iJZ4rr+FlNjOl+y/4
         rr0b7Wu7ZmlJV2ZtfP1FQNOSEyswB0Q03zrxnCdpbBcTtG5UOYkU+q6f7njrrl3r1Qye
         8ltqqKkNUu3Nz8HKJq+nM+NfJppdCbZ3GZXGuqVtc21mUDMOC0GSIYiljGNi5sH9LjWY
         yd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768191667; x=1768796467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hovi7Qy0h/alR3/ZXv95SLOCivRlAPv9Hq2eVQI3/ck=;
        b=YevIcaqcYBJcXuEM8xk8GoYbV46UX2VsmAe4abyD2GKCCtjQBt+ij4xwFbHWzwEZYW
         dIsMhcjhLJdOOz9r/E/7yNntODr82BLdmFOhgUWitOPaBn7NNRJ5kfZeZlMq2VLV3mp9
         jP+8XTtyiEK6kKXGEUN4nZ99WjQfjvsjkpJPo1TO6d/G6zM3XZrkZYi9ml+ZS9tZqo7X
         u26JcZsk/SaREHk6DVduVuJKqrt/HnIYgMO8nMOeF2YOypmmKNMxaG7F+9TvjnBjVkeE
         0N/EbtnE8rTa7I0UOXueJjaVcIJFdV2dwrHVtSEC7gMiV+6kapqVcvRMEiDZGo4Ba0ns
         ezyw==
X-Forwarded-Encrypted: i=1; AJvYcCWoSHwMKLHNznEHwAvexl5vgBdulA9wxuxT21tk4k6Qld0SNmqRPGhiR7cBKeKk+I2MT+J876hbQO4tag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlL7IfOa4lojTS0p6Ton1tl748f7aQkAOdh8ej1TlwgNBoqco
	Epnll2/FmDxyD/ib7b6BFeoNyeEli2pgMQUy/fGVgirwjQl0jmaW9Z+6
X-Gm-Gg: AY/fxX4SiuO9+5gV0XnynG4DwIEBRXeb8Y/+zHFCF8Ru++YZQ+Te+HkFVD3Z+jMW3LV
	YYvIur4FSsBKsTxvSC386CnHznGWPSIxv9ecYTrdEzQz/5bLC4f3TYL4M7/fvrmAQfTKEdFsZYs
	vWWcgGEFhocprxofhi/Roh319TVRu8Ex2KEnbElKJu4RU78VjKSzFLopOqNx76sL1PzjnpjeyA0
	dc5RBEoNS3jQeg9VJSsXg/idL+RqgakQl3L8LziNPEwSqa4SrjPRLllkxeEWVNKGk/07BoR4O6E
	+3f+nHwjLe0HeDS3DG80NwwxqTJOgLc0VNgWaynUhfX8lv6STGsiRFHuptjmiz4ronBgR82maxT
	wmttRhft4d2hI3/fdCafUXQ0tSpm9KNtEfS1RNkkHJd2zi4ktcdobQ2ddbQ1Oj/Vrl5zoB/I5aI
	ww3BU/egQu3Sn05CePiP8CfI13xDrhQpa/wNFX5A==
X-Google-Smtp-Source: AGHT+IEvabbwMO8gV4w7oSu2+GB9r8WubeoGM9RCoDjfCHxw/JfcMw/ejkwywFxZ7qMFoGMR2cXNyA==
X-Received: by 2002:a05:620a:690d:b0:8b2:3371:e9d6 with SMTP id af79cd13be357-8c3893f875bmr2215193685a.62.1768191666999;
        Sun, 11 Jan 2026 20:21:06 -0800 (PST)
Received: from achantapc.tail227c81.ts.net ([128.172.224.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4cd7a3sm1470618385a.24.2026.01.11.20.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:21:06 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH v2 0/4] HID: steelseries: Add support for Arctis headset lineup
Date: Sun, 11 Jan 2026 23:19:37 -0500
Message-ID: <20260112041941.40531-1-srimanachanta@gmail.com>
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

V2:
- Fix Documentation formatting issues

Sriman Achanta (4):
  HID: hid-ids: Add SteelSeries Arctis headset device IDs
  HID: quirks: Add INPUT_CONFIGURED quirk for SteelSeries Arctis
    headsets
  Documentation: ABI: Document SteelSeries headset sysfs attributes
  HID: steelseries: Add support for Arctis headset lineup

 .../ABI/testing/sysfs-driver-hid-srws1        |   21 -
 .../ABI/testing/sysfs-driver-hid-steelseries  |  131 ++
 drivers/hid/hid-ids.h                         |   33 +-
 drivers/hid/hid-quirks.c                      |   25 +
 drivers/hid/hid-steelseries.c                 | 2061 ++++++++++++++---
 5 files changed, 1925 insertions(+), 346 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-driver-hid-srws1
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-steelseries

-- 
2.52.0


