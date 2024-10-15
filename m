Return-Path: <linux-input+bounces-7432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00499F734
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041E22844A1
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 19:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3001F80C6;
	Tue, 15 Oct 2024 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+5hjY6w"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E21F80A0;
	Tue, 15 Oct 2024 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729020232; cv=none; b=N3SOggVsOC3HYUMW//UEQq8cng/7L2te5INRiIx7q1Y5LCHbb/KEgCyE68GqHwAD0qnWIQTjzHU4F4ibOIuuBt/G51xfprQFFJU4r/enfGyzoP6eB/5maVf6EBdZEEbYcB/hDgkZMWUhnJql03UWL+pPK/HrRVEyuhGunKP5+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729020232; c=relaxed/simple;
	bh=2150qn9LRw+aLwwsI3DaeHATD5BA+w+I+mBVK69ZozI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hRbvw+vJrp82RQuS1lpNRr8//94Z6PoOHDKnYGJyK8kXzuGPQWeike8GqENkCTLx14Gnd6lP051u9GK5JBM0u9xv04t3Pz9NjX+t1xCJZWSRSjCKFrDYWWgN/BD8eJUIi48SVU925a7Eqp8f7j+w+ze39fnhe9qT7RR4K9GyELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+5hjY6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5F0C4CEC6;
	Tue, 15 Oct 2024 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729020232;
	bh=2150qn9LRw+aLwwsI3DaeHATD5BA+w+I+mBVK69ZozI=;
	h=From:Date:Subject:To:Cc:From;
	b=d+5hjY6wGnOWpZpC8JRnKcgtxn10bD0713sN9oRxaQPIlK0vHoIcQvc5WapGG6xi2
	 fVBt1owuxY/16Gai5Q2MjV5K33reodQo0ffGzAq5dw+XRIRqFZhD74t4IhMRNQhnu7
	 Y2QkDg41yMSqynaC5f6GwxMUD3nv5q5tmULiq+/bpqsHqoCFWI+jwvkAoDumxG8Rsf
	 1gnw+dteh9CcSs7W8SlvFLdQIj3s9tGBrwZeUZ64UxdjvTM8A4Grp8aGdKqATM+/hD
	 t8DlZS6YkuN8fmVYX6TniwjylZM9RDB9lp7+opCtQh3hG/zTiAzkCqvL5L59MCX8f6
	 oGJPGbHyaahVg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 15 Oct 2024 12:23:47 -0700
Subject: [PATCH] HID: Remove default case statement in fetch_item()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-hid-fix-fetch_item-unreachable-v1-1-b131cd10dbd1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAELBDmcC/x2NUQqDMBAFryL77UIipq29ipSiybNZsGlJbBHEu
 7v4OTDMbFSQBYXu1UYZfynySQq2rsjHIb3AEpSpMU1rjXUcJfAkK09YfHzKgjf/Usag9jiDO2+
 ca6/+5i6BNPLNUPsc9I99PwCkec0NcAAAAA==
X-Change-ID: 20241015-hid-fix-fetch_item-unreachable-9c05547c856d
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2263; i=nathan@kernel.org;
 h=from:subject:message-id; bh=2150qn9LRw+aLwwsI3DaeHATD5BA+w+I+mBVK69ZozI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOl8B923uP1l2zjTR579sbytdaXrZkvb0hSFz31vvRqcb
 XbL+r3qKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABP55cXIcNF1y9VnhhzH01Yr
 KqyZIsgdoVd1saP+dCn7i82cJR3c5xgZ2gIMNYQn7r1h69GXz9ub1TdjepTsq4iwHB757Kq90aw
 8AA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A default case statement with a bare unreachable() was recently added to
fetch_item(), which by itself introduces undefined behavior. objtool
points this out with a few different warnings, depending on
configuration and compiler:

  vmlinux.o: warning: objtool: fetch_item() falls through to next function ...

  vmlinux.o: warning: objtool: hid_open_report() falls through to next function hid_parser_main()
  vmlinux.o: warning: objtool: hid_scan_report() falls through to next function hid_allocate_device()

  vmlinux.o: warning: objtool: hid_open_report+0x21b: can't find jump dest instruction at .text.hid_open_report+0x40f

Replacing unreachable() with BUG() is a typical fix to eliminate the
undefined behavior and make the default case well defined. However, in
this case, all possible values are enumerated in the switch statement,
so the default case can never actually happen, as proven with the
comment next to the item->size assignment. Just remove the default case
altogether, as the return statement would still be valid if the switch
statement were ever to be skipped.

Fixes: 61595012f280 ("HID: simplify code in fetch_item()")
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Closes: https://lore.kernel.org/20241010222451.GA3571761@thelio-3990X/
Reported-by: Paul E. McKenney <paulmck@kernel.org>
Closes: https://lore.kernel.org/fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop/
Tested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/hid/hid-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 77725e33592098a0bd45222cfafc4b7c80daae54..3e3166d5719490afe88530d0e5aec3d63a96ed55 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -818,9 +818,6 @@ static const u8 *fetch_item(const __u8 *start, const __u8 *end, struct hid_item
 	case 4:
 		item->data.u32 = get_unaligned_le32(start);
 		break;
-
-	default:
-		unreachable();
 	}
 
 	return start + item->size;

---
base-commit: af27f2c22f5e3dc61e787f1b1d9f4b3cddf4af25
change-id: 20241015-hid-fix-fetch_item-unreachable-9c05547c856d

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


