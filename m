Return-Path: <linux-input+bounces-13689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D676B12C52
	for <lists+linux-input@lfdr.de>; Sat, 26 Jul 2025 22:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45A82541A44
	for <lists+linux-input@lfdr.de>; Sat, 26 Jul 2025 20:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490D215F7C;
	Sat, 26 Jul 2025 20:42:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16D288519;
	Sat, 26 Jul 2025 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753562522; cv=none; b=u14I2G2HsKoHdL33kgnHSvQk26uME/IZzEfUpkSu5sKoiEoqZRuYxN0qk2LFTBuT442q20DmLi5GBurycPOIIOMgttf5uEeBlZQwSc8Xb3u8XPfP4FZehr0G2R1rGUacvBZGJlquEFxjIAkBH7htXGULJDVQNnLNyYERPK11e9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753562522; c=relaxed/simple;
	bh=x/AZULTZmtrLm6bgo6Z/ItY1QBI0ttU9Yq2IGevQBfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krKsWlujv3BRYF5XZ5XTXCqCcUnyJwG015mY/Zo3UU4dqzVpy8Xdi5JSbneMigFAMdKx7rIOQ4m/NDUPy+ettdJkvKu3nn4VbnyjtbEgS5It79SVB7F3hCJxprWWdfm4++akZ2gxDfiwxU32db+0nwQyEC+R7MgPB6sT1lD7UDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a02:8084:255b:aa00:8311:9b71:833a:a9b0])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 6F72F405EC;
	Sat, 26 Jul 2025 20:41:50 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a02:8084:255b:aa00:8311:9b71:833a:a9b0) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: syztest
Date: Sat, 26 Jul 2025 21:41:44 +0100
Message-ID: <20250726204144.107432-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67535904.050a0220.2477f.0008.GAE@google.com>
References: <67535904.050a0220.2477f.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175356251097.15852.2739410331015591749@Plesk>
X-PPP-Vhost: arnaud-lcm.com

#syz test

--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -814,6 +814,10 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 			}
 			if (data[2] == MCP2221_I2C_READ_COMPL ||
 			    data[2] == MCP2221_I2C_READ_PARTIAL) {
+				if (!mcp->rxbuf || mcp->rxbuf_idx < 0 || data[3] > 60) {
+					mcp->status = -EINVAL;
+					break;
+				}	
 				buf = mcp->rxbuf;
 				memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
 				mcp->rxbuf_idx = mcp->rxbuf_idx + data[3];
-- 


