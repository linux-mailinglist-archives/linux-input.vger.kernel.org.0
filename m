Return-Path: <linux-input+bounces-7999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97E9C3425
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 19:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6851D1F21656
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 18:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA858615A;
	Sun, 10 Nov 2024 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9MjTARd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB221E495;
	Sun, 10 Nov 2024 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731261908; cv=none; b=tukIa410klj7foHYAEDh+7y4ewqfzNbq5D5T7BPaXJ2v54UbtO57RpAXB9gzvqbrZBZRluzej5pX9Fg2+RYtLs7zyO9ei11ynKm8R9hNc8qK5OkJFstCGtkghzjVRwpTTGMgdldpTTJdJb5p2xXc9KPwsy/8do2lXknGbGOBLQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731261908; c=relaxed/simple;
	bh=TtqNZrLTcoDozwG7ee+tK0XqqolwrJ2iKs8i11r00H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cBMj2swHsL8YQLz4Z3eTexhLUfF8IiHKz0V8zWPT3MSoC2ShtGgZSMZUGlEYXIqMQJJnv+nENRyugYycloJal+i4CsMsX7RQvs2GGgdUhmaoSOn7SjraEs/WVIFlgHFupQQDghczBuATlvy2qG+QeSSkAFLqu8CjN0Ruf6A7e4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9MjTARd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0905DC4CECD;
	Sun, 10 Nov 2024 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731261908;
	bh=TtqNZrLTcoDozwG7ee+tK0XqqolwrJ2iKs8i11r00H4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=F9MjTARdNkNoT0PCNs64qp5VCtgDJPSkv5kdc4D4Y3Fg414p1n9acCKR+1oLLhiqC
	 PMPQcfgHQYBIB6WJnhv9xcJqxR5gB+hFXRFXeVodrWek0pKl9XgawRdu5yowDTMHfY
	 l2yTsUOaNDoQ5Y/piXmBKW6IUSJgZUsvvCsRihbPNbtMLT3Khc+aDmF0pOOj47R7BB
	 Auxnb8fg1IJrNA29TynIIiplpp+LCnxs+TVf6S4v6HPu6g12oVcEjnNE22dc5NBBuW
	 IbI8w1D34PD5KcIzEMgx1c/Av1ITupMYiRzsUTEZ8Q5qG+isQblAm8uLwW6TX0a0+I
	 TvREsygJ6HTYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2557D12D4B;
	Sun, 10 Nov 2024 18:05:07 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 10 Nov 2024 19:05:02 +0100
Subject: [PATCH] Input: docs: Fix the input_event struct documentation
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241110-fix_input_doc-v1-1-745d5f908e61@hotmail.com>
X-B4-Tracking: v=1; b=H4sIAM31MGcC/x2MQQqAIBAAvxJ7TnCjiPpKRKS71l4stCIQ/550H
 JiZBJGDcISxShD4kSiHL4B1BXZf/cZKqDA0umkRUSsn7yL+vK+FDquQ2LjeWBpsB6U5Axfh/01
 zzh8lKx+AXwAAAA==
X-Change-ID: 20241110-fix_input_doc-1debf7bcd9c5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731261906; l=989;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=C55UbquVRgOMqi6UfZZBpAe/1aOdlwpfJfKcF6CPsNI=;
 b=CQvLWKLBbf1pXbv7y9zWnHjF4IH0ndv5lI+R3SdakQNXVtyCWCDjpsKy/M+buAs3eNTNh8HRi
 jFMbz304H9hBtsU6dyMqVreEMVUDWvmjwCXITwtX48QfdHNJqdGlzUg
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



