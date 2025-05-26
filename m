Return-Path: <linux-input+bounces-12585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E8AC40D2
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 16:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 462F13B187C
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121BF2F2A;
	Mon, 26 May 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="kfcvzkQj"
X-Original-To: linux-input@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFBB1E522
	for <linux-input@vger.kernel.org>; Mon, 26 May 2025 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268030; cv=none; b=Yqv1svNbiQCKjgeE3tiQVlf5eIb8jLvkA9AgaoUUMnPc82ruACrqCFAOab6x80kJcTjM+p2oonc+LogrfV8Q/AivPzr/WUmXPFsEXcxwETjcEJwyWa0a1FlJSnMU85fYb8nmV/f8AHSQPOSkxANzqaPFi0PAH9p8DrNBbe+Bqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268030; c=relaxed/simple;
	bh=/xnkJnKT5OY243YsLrAOQv1NKxTVbidtu2YJHIychHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCfOOv+/O+UkXW0Br/3Ml86U28FvzcGP7AFzxM5s3kcc5PwGbt9Oyx3RE0aSoLEa/vm9rFbK7dPZRn6LLPrg9A1XzokvR1glkf18Bv6t2cgR0KSixqu6LrFrjUTc+606gqQHwPpuVwAJm1LEITwOri4rXWk4H81SqLks1b9mumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=kfcvzkQj; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748268014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9llVCQGv8P8DWcCJN87RPibODfspQmvVl1K3S491Zt8=;
	b=kfcvzkQjFLXseFgWVYr0eVY8en+xqZG4eGsMcv+i9lUdJ8Ycy9+mtwr6uVqwd4EMy605Fs
	+l6bLNZkU0oIPKdz7kLFUbVFKrP7N4rbMZ6EsxHbh4lJZGtkBnog2NNb6AG8fx6XN18Ep/
	6WGgLFzzHUTXQIHZlK+n8bGk2T2rYrrzxCB0MelZK0i0hzaN5UR+vwDr432KANbbbJx4cN
	+hxrnr1r0XZpeeY70QUJPqI9bqO4Hbrtewdv/aEANl67FKapi6B1qN5cZ+KpCzVQQbHUMf
	pY49cR9ktNFWWv9rE9XJYn/EZR/K5sDU+IXlz871OdLCumtfICf3I0bFRw4f9w==
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
Subject: [PATCH v2 0/4] Multiple fixes to Amiga joystick documentation
Date: Mon, 26 May 2025 14:59:48 +0100
Message-ID: <20250526135957.180254-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi, this patch series covers a few fixes & heading imps to the Amiga
joystick documentation.

I've kept the section adornments changes amid ongoing discussion about
it.

Thanks to Bagas and Jonathan for the feedback.

---

Changelog:
- v2:
	- Separate patch 3 from v1 into two (Fix Amiga joysticks grammar
	  and Make headings compliant w/ guidelines) as per request from
	  Bagas and Jonathan
	- Remove junk comment I added in patch 3 v1
	- Add `Reviewed-by` tag to patch 1 from Bagas

George Anthony Vernon (4):
  input: docs: Fix broken table formatting
  input: docs: Correct Amiga 4-jstick adapter pinout
  input: docs: Fix Amiga joysticks grammar
  input: docs: Make headings compliant w/ guidelines

 Documentation/input/devices/amijoy.rst | 125 +++++++++++++------------
 1 file changed, 67 insertions(+), 58 deletions(-)

-- 
2.49.0


