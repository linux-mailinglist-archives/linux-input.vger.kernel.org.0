Return-Path: <linux-input+bounces-16759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21498CEC775
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 19:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29D5A3003F97
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 18:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D0F2FFFB6;
	Wed, 31 Dec 2025 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqMaYrnM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1B2DC33F
	for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767205174; cv=none; b=hi01gY926YvbE3YSE9aA4GoK+tJJIJfH4QuWjW4R3ZlJGttDfiZFtz7/uk69vTvSQkw215QnkzpSopuBEA8lX5BWT5pFM+i/FyyLkOkUM1EuRKeiNqHERNR6BFfsoxeet5T5K8IpJ62AGprbT4TRgvk3VpLuEhdXJ/oiNiGuh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767205174; c=relaxed/simple;
	bh=lmXV3OMx8e6t0SkdRTtyf1MA12yqeKSlV70nFmQkkNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=damCocMGMzzHZUiceUIVNjg7rn43rZJ6iG6ye/CtknXNrlU4BQ/DZk9VQsbjD0HEN+eQSRtR8ALkUMN5NFnjEOex8rrBZ06o+E7PyyJ4/qzdWJupMtK+N+AOhTm81zffxi5/7BR5lAS8/YQkw62NSqTYPLV1mrWyZCDO5IRyMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqMaYrnM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso8594729a91.3
        for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 10:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767205171; x=1767809971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypy8GI/gf+1WBCja2kAfu0om6dt+DLEVA65IQ8oDMVY=;
        b=hqMaYrnMfx+ezMKufKKUDCApbBMCpJM4TaQ0YTUPseR6PYwlZBVH1Unnb8QlRjt44a
         aTEXQ3j6e5MFXteHG0OZ0irvqjMykcmjPpr64dauqaOpCHM2aAGxqblA7JjcOaigGBQh
         JCrOD/Mk4EZMLaA3T2TUHM4SMhlGOCoXAUbKkjxr+OBnzVt0RTr8coevqz7BTI5//Qd5
         cSgdLl2V8Zqo0z/db6Gxg2MoCkN+yru35NOp35nL906JSNACHD08kKiLfLYxnCw3lrFl
         ZFEBvdy19/y0JqvE7dxLibTo6WBKM45dGRkguHZkT32xwS22oadpz/CoGYV2T2+NErUx
         s/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767205171; x=1767809971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ypy8GI/gf+1WBCja2kAfu0om6dt+DLEVA65IQ8oDMVY=;
        b=ZjX05rJLSTxDIdA+MDxXnOl/gSLMSUcDhqppUglqli/tqUFNse6xpvYxkYeSjeugKo
         IWNBc+/IRAWqbuo7rZh5o0OaBXEGsXDWKSEdL6zY9gOTR0sJ+KVp8xw3xMb0PamrOc5m
         Dcjzs1RbMvm10fJ2csWjxC1eaQz8YJx/6SX5yG2IgUOUCwUt89ZVsl3fZlUbL+yiky/w
         uPMQrd0DvH/2bCkOvAXsfcx1TOpZXY7OiVy7zoUWYyTJVcpTiTPUqq86qw9a4Scg3cqu
         Wsy5aA18tVnfWHSV/LoyPbS/iWfveHUqeCn5G1XyLCEqI58AGzJjfXs7sDwfbSZ2o6FW
         KCYg==
X-Forwarded-Encrypted: i=1; AJvYcCUdea+NVmXMBSi2pVUd0V9cIU5OcmoDOvECQbmhbcJvwj8LyghZksz0qI/uQ7zgBPLQPSiWypdzGstZzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfE440Y11zXADTsD23fWQ1ganjL4gBUAMGEy+dL9xPX65f1oAB
	EA4kVN0xHHLXZX9KZkNg1262S0Hh1Ftb8SwpyyH7uR7jBMUK7ZeYlHmB
X-Gm-Gg: AY/fxX6dkj5pPGci730qrksQhhnWvPElRKteXhGBOfZREPaSf5fty4PxN6yiIjzSLIF
	IcWId0tlHaaCS/BWcNTNvnvAaQ9jpIGqPjB1jitwGl4F04ve96cZOJEA9oq+FLzv8eWHRJ+iVC7
	hBKPE8QF6DbAwDF7tLd81ns+aDSG9wEJMvHsDMNpFQ26VcTDANd1gPiL2cVvnmBL6ylZcyzWmPM
	GhKnfAlnbMujp5b1R7A+cemlNnUK/02tW5ncfrLzIr74F+v1rB6NjEaYdVmcA0Md+xt5lCdzNlW
	9gBAyHLmTaDsKJmBqmQyuHZ1EHqJEDvlczt4eyACKOOGu+4+5bmwfH1DdYY2X93LJc2yu3lqmtz
	mquFPB1sEmKA76e31SRY8A7Ao6vgBf9znOn3h5KOXwJrZY3nX1fgDp5Rmaajun/UyTlgkQ7HPk2
	UvN0gf1y9nMhaiMREjHZqGRC2AkZaelkYIv/dPkzwNtuiMzGgJftgH6hAfKqK9IQRvUUX3VuXFa
	3aI5gDYb8tEgS2532drYemw+B53ITAGl0M1T+84BMZfk3rR2O8QDHh190z9
X-Google-Smtp-Source: AGHT+IGwDTAy5QdriluRRPBJiMlVALQ5Ux9q345lbcNsLFLTmbr2DKrC46cbuM4ffFOziSUvlolzow==
X-Received: by 2002:a17:90b:4b43:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-34e92144873mr32439226a91.11.1767205170974;
        Wed, 31 Dec 2025 10:19:30 -0800 (PST)
Received: from anonymous ([113.252.77.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1basm15823444a91.10.2025.12.31.10.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 10:19:30 -0800 (PST)
From: Kwok Kin Ming <kenkinming2002@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: Kwok Kin Ming <kenkinming2002@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: fix potential buffer overflow in i2c_hid_get_report()
Date: Thu,  1 Jan 2026 02:18:26 +0800
Message-ID: <20251231181830.232239-1-kenkinming2002@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`i2c_hid_xfer` is used to read `recv_len + sizeof(__le16)` bytes of data
into `ihid->rawbuf`.

The former can come from the userspace in the hidraw driver and is only
bounded by HID_MAX_BUFFER_SIZE(16384) by default (unless we also set
`max_buffer_size` field of `struct hid_ll_driver` which we do not).

The latter has size determined at runtime by the maximum size of
different report types you could receive on any particular device and
can be a much smaller value.

Fix this by truncating `recv_len` to `ihid->bufsize - sizeof(__le16)`.

The impact is low since access to hidraw devices requires root.

Signed-off-by: Kwok Kin Ming <kenkinming2002@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 63f46a2e5..5a183af3d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -286,6 +286,7 @@ static int i2c_hid_get_report(struct i2c_hid *ihid,
 	 * In addition to report data device will supply data length
 	 * in the first 2 bytes of the response, so adjust .
 	 */
+	recv_len = min(recv_len, ihid->bufsize - sizeof(__le16));
 	error = i2c_hid_xfer(ihid, ihid->cmdbuf, length,
 			     ihid->rawbuf, recv_len + sizeof(__le16));
 	if (error) {
-- 
2.52.0


