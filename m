Return-Path: <linux-input+bounces-12586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D5AC40D3
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 16:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D73D189A1A1
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF36204F99;
	Mon, 26 May 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="LF8Zty1P"
X-Original-To: linux-input@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1186338
	for <linux-input@vger.kernel.org>; Mon, 26 May 2025 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268041; cv=none; b=h/sDj8MxqPj5yD2WyHmoBxC9n7RTNkoUvJCHWQ2m5XwnNpZ7lIQBnCkVcLgg81LrlQMVS/X6ysWbxLJgENVjOrpnjDNU/K2TX/j4lHjDL+sTrnzk3TbWPa4H4zu0OOfWKIThLWEaE4a/2bDfcqfZ8FIH++omsN9p7sye7d5+d5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268041; c=relaxed/simple;
	bh=aNQGcOGLGwzhcIOM8NfPYM0jf7KwNLGhz88QIVgMRM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLNas5acvEODGZrANdx9w0YDfq7o30RmBKV7LQd71HPAsP4saBIDxAP9Z57lDhSEifLJbV9enN3U422Pm746+wiUZVXY7W7GiFjCZPkLdlNYYWQ3gH8BiChxocT2le/gKiRSxcwkoF4Fp9lgSriALNT/eRtJC3ZBJx5GYEiNOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=LF8Zty1P; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748268037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ORmLrLq9c8xhomXJo56yAZlyEE/xXLB0zfu2z9O+YZ0=;
	b=LF8Zty1PSNafiuCuzp3qeQKoFXTYqFxEnstUI2gpqI7prTx/YxUn97yrsLncUH1qtn8BqG
	qlxy3Zm1f4wZHYgkhNcKnnzi7MN+gaGCgLhT2Uc6Zvkz3WqrMIaZ2KZvynnumaPALqk158
	86aqUnv1MPBefEB/ULCFPQsb7nbncaQ9vsjUtJwrt2JYJVPvsd9SbYkd6Da77U2sT/IpBy
	TmESmwlFjsFuceLp8miIXt9/bjIZGb0BsZ/bKBR0YkfUGbvYyq1VFSGA9RQZ0XfBkpVzVn
	aZ50AFbGsnwB4+a9eC9LSlrdLBVmaCHMBFiVVsliLBW7Pgdf3cIjSnU/tatjkg==
From: George Anthony Vernon <contact@gvernon.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: George Anthony Vernon <contact@gvernon.com>,
	bagasdotme@gmail.com,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 1/4] input: docs: Fix broken table formatting
Date: Mon, 26 May 2025 14:59:49 +0100
Message-ID: <20250526135957.180254-2-contact@gvernon.com>
In-Reply-To: <20250526135957.180254-1-contact@gvernon.com>
References: <20250526135957.180254-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Missing '+' led to unintended spanning cell. Correct this.

Signed-off-by: George Anthony Vernon <contact@gvernon.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/input/devices/amijoy.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input/devices/amijoy.rst
index 8df7b11cd98d..f854ee975247 100644
--- a/Documentation/input/devices/amijoy.rst
+++ b/Documentation/input/devices/amijoy.rst
@@ -123,7 +123,7 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  X5  X4  X3  X2  X1  X0
         clocked by 2 of the signals input from the mouse serial
         stream. Starting with first bit received:
 
-         +-------------------+-----------------------------------------+
+         +--------+----------+-----------------------------------------+
          | Serial | Bit Name | Description                             |
          +========+==========+=========================================+
          |   0    | M0H      | JOY0DAT Horizontal Clock                |
-- 
2.49.0


