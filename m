Return-Path: <linux-input+bounces-12992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35846AE33CB
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 04:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06091188D245
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 02:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B79155A30;
	Mon, 23 Jun 2025 02:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redstrate.com header.i=@redstrate.com header.b="O6KHh1xL"
X-Original-To: linux-input@vger.kernel.org
Received: from ryne.moe (ryne.moe [157.90.134.234])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC14E19C556;
	Mon, 23 Jun 2025 02:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.134.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647042; cv=none; b=lJizdP9GiWjz7ONbAUDYf53z5sUXc36JIpqoMbYKkrFcAw+o8Xeg9HusE89hi2FbjPHq4mM2AmFg59xUZjPDlk5plJhyHPeHZKvUhfkd+15QeIYc8dJEXAa5s1fMdrbR1ykAAUVePyr7aAJ9OtgYrLayevyN1+kUONeqBduiZyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647042; c=relaxed/simple;
	bh=gBaDV2U9Mw0YO1nPRhg/slBJUFmW/DZC9cESYwjItZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X3FqqCyhRvrCVTg/f91H0sZzfmywV1kSRDFwU2CG0NqyJgLkBTqlZuMzZAmk2f+DfcE7jMjt8FguTLqF012vfnjPXbq6vuD+nQmvkS9qLod9pyhHFvUXkbuj7pGDfov99Cqar2JeKvgnHnju/vO6FrHk8yESpHeHdIVx0Snumfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redstrate.com; spf=pass smtp.mailfrom=redstrate.com; dkim=pass (1024-bit key) header.d=redstrate.com header.i=@redstrate.com header.b=O6KHh1xL; arc=none smtp.client-ip=157.90.134.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redstrate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redstrate.com
Received: from adrastea.lan (c-73-35-115-196.hsd1.fl.comcast.net [73.35.115.196])
	by ryne.moe (Postfix) with ESMTPSA id 23D781908D55;
	Mon, 23 Jun 2025 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redstrate.com;
	s=default; t=1750646611;
	bh=gBaDV2U9Mw0YO1nPRhg/slBJUFmW/DZC9cESYwjItZ8=;
	h=From:To:Cc:Subject:Date;
	b=O6KHh1xLDWhY8pYHcpII45n8ef3juy7T2QvnmsuIEMwhJLLIhOuC3VIV2LM0fqBz3
	 L8+C6PkiSbjYVChB59a/7TerpsGZdqALGUnA6ASNwHhPBYSddR2ynUBo/1NbTy3epb
	 rswDLdhyDsVdbpXIa8Mq518Ind+6FBIIzSCrLBcc=
From: Joshua Goins <josh@redstrate.com>
To: linux-input@vger.kernel.org
Cc: josh@redstrate.com,
	jose.exposito89@gmail.com,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] HID: uclogic: Add support for XP-PEN Artist 22R Pro
Date: Sun, 22 Jun 2025 22:42:53 -0400
Message-ID: <20250623024309.17356-1-josh@redstrate.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds support for the XP-PEN Artist 22R Pro, including stylus, tablet frame
and pen pressure.

The tablet has 20 buttons, but need to be remapped in order since the
device reports invalid keycodes. Existing tablet functionality should
not be inhibited, as BTN0-8 is still used.

New initialization functions are added since the device differs slightly
from other UGEE v2 devices.

Signed-off-by: Joshua Goins <josh@redstrate.com>
---

v4 changes:
  - Waited 2 years, but I've been using this driver since then without issue. I also removed the old Reported-By, felt weird keeping those considering the wait between patch versions
  - Changed some of the cleanup code as suggested
  - Rebased onto v6.9-rc7
v3 changes:
  - Removed duplicate frame initialization code, overriding the num of frame
  buttons instead.
  - Removed unnessecary key > 0 check.
  - Renamed init function to something more specific to the device.
  - Cherry-picked probe magic data patch.
  - Rebased onto 6.2-rc6
v2 changes:
  - rewrote initialization code to be more concise, and less error-prone, thanks
  Dan Carpenter & José Expósito for pointers!
  - less struct duplication, it now uses compatiable UGEE v2 ones.
  - uclogic_extra_input_mapping is now static, thanks José again!
  - straightened out dial transformation, now there's just the two cases and
  they're decimal.
  - fixed the patch formatting, it should be easier to apply now.
  - rebased onto 6.2-rc2

Joshua Goins (1):
  HID: uclogic: Add support for XP-PEN Artist 22R Pro

 drivers/hid/hid-ids.h            |   1 +
 drivers/hid/hid-uclogic-core.c   |  66 +++++++++++++++-
 drivers/hid/hid-uclogic-params.c | 132 +++++++++++++++++++++++++++++++
 drivers/hid/hid-uclogic-params.h |   5 ++
 drivers/hid/hid-uclogic-rdesc.c  |  44 +++++++++++
 drivers/hid/hid-uclogic-rdesc.h  |   4 +
 6 files changed, 248 insertions(+), 4 deletions(-)

-- 
2.49.0


