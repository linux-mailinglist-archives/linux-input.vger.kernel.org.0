Return-Path: <linux-input+bounces-8120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0C9CFEDB
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 13:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF82EB263D5
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 12:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A0C18FC65;
	Sat, 16 Nov 2024 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of1VpLjD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE4A47;
	Sat, 16 Nov 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731761410; cv=none; b=JhWOABDzccdHrUWc7ZkvRcoHUEI0lqRvWSsuwtMC7B/V1MaLr2yBSYCnQ49VnUuQ70lhbelbDCQPEluOdrCsxQoxAEauiqdjNlObFNSW9Ltso8eH84HpM6Yo9i9q3JTeciYd7RfGD/n7vm8VQTNaRImq0a3g1nFKvkfxNN1BZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731761410; c=relaxed/simple;
	bh=E6MpeJzVxLTr+NAkI0w9ZkI+NtxlH214f4+b9ktNEAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gzpXF7wFZzKZ3Bj+NJj8K78JImxXfGJtWw2MTP+K2lmaNNiAZzP+E1ibKJ94feX8Ea76m9Hc319d2qt94HZxpsXVOYzo1c1laK3Kv3PZdop7/CFWig7OJAHY5sTd8uwDAJBAVuQRCH7EedMVdV4J8VRA1EuG1xFKgg3s26+E77s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of1VpLjD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E49DC4CEC3;
	Sat, 16 Nov 2024 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731761409;
	bh=E6MpeJzVxLTr+NAkI0w9ZkI+NtxlH214f4+b9ktNEAE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Of1VpLjDAu85lx4law7cuJWVz9WVH1lxU/i2hJTTKC8LTxFW24v2N4CV/78NJzxvk
	 iiF90SUx1FZRA+3dSR66lC1f6HrNgjMh7GFOjXn5WSvuUASzmv3fKGd+N/EGm0QHTT
	 04rPfLlAQOaq5glidDUQ2UFc/eq9evtJBocTXte0F0AM4I+FDZKGiI+tFm8NyPjnOn
	 zGcimi+faoQ1nBusWYbmwKrtjzC3sYJfuicSmHpD2zeEZASZl7EUUmKzbyjjv+Q2J3
	 YC/4FVc5NhOVjqb4kcZvimFzUEr2NYFEcpxQc2kKLVKzFxLyyJ8v03y6zYDjuc2hrX
	 VThma5OoTI27Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DE5D68BC9;
	Sat, 16 Nov 2024 12:50:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 16 Nov 2024 13:49:36 +0100
Subject: [PATCH v2] input: Documentation: Fix the input_event struct
 documentation
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-fix_input_doc-v2-1-133dad7ae928@hotmail.com>
X-B4-Tracking: v=1; b=H4sIAN+UOGcC/3WMQQ6CMBBFr0JmbU2HgIgr7mEIgXZqJ5GWtEg0p
 He3snf5fv57O0QKTBFuxQ6BNo7sXYbyVICyo3uQYJ0ZSllWiCiF4ffAbnmtg/ZKoKbJNJPSrao
 hO0ugfDh69z6z5bj68DnyG/7Wf6UNBYqmqnVtWnmlC3bWr/PIz7PyM/QppS/S7GqQrAAAAA==
X-Change-ID: 20241110-fix_input_doc-1debf7bcd9c5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731761407; l=1144;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=aJIAHE62NFe2v1AZvK2w1bKfLBVXM8fqWYWzZ+CLOFQ=;
 b=56Cb4rSIgy+NvQOd/PHdf+aL2L6cfyu5NJvfKmowENuxGlYLjVLJhFsk5KGXwN/FpGqFmp0Bb
 yNMdzsDKyOVCYrl0STxX5krtgAMOKBBq99Bw5ZnFDAkmpE6SaNiRy8S
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Fix the datatype of the value field of the input_event struct which is
signed instead of unsigned.
See include/uapi/linux/input.h

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Changes in v2:
- Fixed the tags in the commit message
- Link to v1: https://lore.kernel.org/r/20241110-fix_input_doc-v1-1-745d5f908e61@hotmail.com
---
 Documentation/input/input.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/input.rst b/Documentation/input/input.rst
index 2c67fa904adcf902cebf8e7137c0a1609d879a50..d9a6de87d02de5301500b392191ab67e7db431ed 100644
--- a/Documentation/input/input.rst
+++ b/Documentation/input/input.rst
@@ -264,7 +264,7 @@ events on a read. Their layout is::
 	    struct timeval time;
 	    unsigned short type;
 	    unsigned short code;
-	    unsigned int value;
+	    int value;
     };
 
 ``time`` is the timestamp, it returns the time at which the event happened.

---
base-commit: de2f378f2b771b39594c04695feee86476743a69
change-id: 20241110-fix_input_doc-1debf7bcd9c5

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



