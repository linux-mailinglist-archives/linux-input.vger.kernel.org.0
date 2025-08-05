Return-Path: <linux-input+bounces-13820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C361FB1B448
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 15:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D368B3A5AED
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 13:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434A3274B5C;
	Tue,  5 Aug 2025 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5YKuO2W"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189752727ED;
	Tue,  5 Aug 2025 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399451; cv=none; b=h1zEacqKJrqZbn5JUrGkZHI/7AE1JjPmR1oMibpk50Ju9xWIyCj8t/zrYH3XdvWvsB7TRSMLCN9//RDCS9bmfM7j4xwF/gg8iWzMec3+Nk/YnTnExudsGNDp0Gb3kkp+Wz8Qw/2nvAsGkn2YWmKq2qm4TxbbfgVeWHw39adC+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399451; c=relaxed/simple;
	bh=h5ekgn5hXqvCDBbs3x7HLBwTL0Kln0Mi1jfQN529SGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/JuGQ009LAQ5S5ZJl3Bc3VKXbqZz8sS8u04YU2tUWnG3axdUJ5iod7QYtFrQ8g1iX6gRnHDeW5oGZyn9ow8sx4R4PMlw5OdxOh0dhuGwHOzSTB/AgfFmaQgvc9hg/cQBVCuLh44QInGvGAriIbBdYrjPHcMPeD7RnG6TyuGF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5YKuO2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40C3C4CEF7;
	Tue,  5 Aug 2025 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399451;
	bh=h5ekgn5hXqvCDBbs3x7HLBwTL0Kln0Mi1jfQN529SGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B5YKuO2WvXbePO4P+ZRr/Xzl6WUo6Yu4KGoLmemVodgB2Y0I/o46/9utWS6HlqWfB
	 VWjmbpQLLgDgsD5C4+WX/9eVieJ2pgHCjtz0Ci2M7vhHI3jR9yOothYFT1YX0jSdNF
	 0K+odx4OfRNHt2Y+RCHJ9djOZxBffXNwi6iQo5WGezzmLleuK9hhUu4wisOsdkrMHv
	 LTlxuw9NFJKcInXKZrZLi8dU9g7LJ4LLpKdmr+0pJmxJ6aKLn6KTzX1nalBw8/04Kf
	 HqDmEfRdgWh/P/Fu/+0T67Pyaplf37dTZ9afxn0TP+1CI0kiiB8iGTiZMloe/svCga
	 WIMAIq1rsOMJg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Li Chen <chenl311@chinatelecom.cn>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.15] HID: rate-limit hid_warn to prevent log flooding
Date: Tue,  5 Aug 2025 09:09:04 -0400
Message-Id: <20250805130945.471732-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Li Chen <chenl311@chinatelecom.cn>

[ Upstream commit 4051ead99888f101be92c7ce90d2de09aac6fd1c ]

Syzkaller can create many uhid devices that trigger
repeated warnings like:

  "hid-generic xxxx: unknown main item tag 0x0"

These messages can flood the system log, especially if a crash occurs
(e.g., with a slow UART console, leading to soft lockups). To mitigate
this, convert `hid_warn()` to use `dev_warn_ratelimited()`.

This helps reduce log noise and improves system stability under fuzzing
or faulty device scenarios.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix for System Stability Issue

This commit addresses a **real system stability problem** that can lead
to soft lockups under specific conditions. The code changes show that
when malformed HID devices (either intentionally via fuzzing tools like
syzkaller or faulty hardware) send invalid data, the kernel can generate
excessive warning messages that flood the system log.

## Specific Code Analysis:

1. **Location of the fix** (drivers/hid/hid-core.c:661-663): The
   warnings are generated in the HID parser's main item processing
   function when encountering unknown or reserved tags:
  ```c
  hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
  hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
  ```

2. **Simple and contained change**: The fix only:
   - Adds a new `hid_warn_ratelimited` macro in include/linux/hid.h
   - Replaces two `hid_warn` calls with `hid_warn_ratelimited` calls
   - Total change is just 6 lines (4 insertions, 2 modifications)

3. **No architectural changes**: This is a straightforward substitution
   that uses the existing kernel infrastructure (`dev_warn_ratelimited`)
   which is already widely used throughout the kernel.

## Meets Stable Kernel Criteria:

1. **Fixes a real bug**: The commit explicitly mentions that excessive
   logging can cause "soft lockups" especially with slow UART consoles -
   this is a serious stability issue that affects real users.

2. **Security implications**: The commit mentions syzkaller (kernel
   fuzzer) can trigger this, and uhid devices can be created by
   unprivileged users in many configurations, making this a potential
   DoS vector.

3. **Minimal risk**: Rate-limiting warnings has virtually no risk of
   regression - it doesn't change any functional behavior, only reduces
   log output frequency.

4. **Already proven pattern**: Similar rate-limiting fixes have been
   applied in the HID subsystem before (e.g., commit e93363f716a2 for
   Nintendo controller) and throughout the kernel for log flooding
   issues.

5. **Clear reproducibility**: The issue is triggered by malformed HID
   devices sending invalid item tags, which can happen with faulty
   hardware or intentional fuzzing.

The commit follows the stable kernel rules perfectly: it's a small,
obvious fix for a real problem that improves system stability without
introducing new features or making risky changes.

 drivers/hid/hid-core.c | 4 ++--
 include/linux/hid.h    | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b31b8a2fd540..a110d1965447 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -659,9 +659,9 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 	default:
 		if (item->tag >= HID_MAIN_ITEM_TAG_RESERVED_MIN &&
 			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
-			hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
+			hid_warn_ratelimited(parser->device, "reserved main item tag 0x%x\n", item->tag);
 		else
-			hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
+			hid_warn_ratelimited(parser->device, "unknown main item tag 0x%x\n", item->tag);
 		ret = 0;
 	}
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749b..7f260e0e2049 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1239,6 +1239,8 @@ void hid_quirks_exit(__u16 bus);
 	dev_notice(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_warn(hid, fmt, ...)				\
 	dev_warn(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn_ratelimited(hid, fmt, ...)				\
+	dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_info(hid, fmt, ...)				\
 	dev_info(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_dbg(hid, fmt, ...)				\
-- 
2.39.5


