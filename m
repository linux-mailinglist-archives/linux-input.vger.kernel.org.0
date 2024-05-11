Return-Path: <linux-input+bounces-3675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ECF8C3126
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 14:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2962820C3
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 12:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B86F55C36;
	Sat, 11 May 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="Cz5wt15h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1F5029D;
	Sat, 11 May 2024 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715429573; cv=none; b=Khm7ZYB/SkQLwqxbScjNhn5VHPNb+AitbqQpcd+ZwARTvIYUoPKyssrX4XS9pKnkowZ8qjK8Rh9rU/mC8BbCvXQ0/BeJc6DEvC31+qXgucgXZ8+hrQJ4omzlmDJn5pyLv3H/Jfp/D7SBNLVA0GTj40T0TamLmoIIG0Xw8C5Lzwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715429573; c=relaxed/simple;
	bh=pJpbGrQRG17NW9RV6ENNzhtPKpgKqYX/WnTPi5BdlNo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f/00AdgUrXMdyJ+FcCkLYSulGe4MDc3My2QL1c6qutYtXawjWI1on8TLHeUDxm2aAEXfM05fdq3l9ycmTdHMYt12sWwm+KaiV1ndjD04XHq9M7m3xvzRl76bPeCqnMlCc+vddTbHiekxP+1u4bvYDz7T0MaJddUp3DIt3e3T85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=Cz5wt15h; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7847C005F;
	Sat, 11 May 2024 08:13:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1715429596; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=81OK4Xej261w31VG4fWH+nxZNCaTDpeVyDYRMtjGIE4=;
	b=Cz5wt15hncUJfpyninoSqs9LgxIHrYREy4yfrKJT77cne0/22ZVqjbEgkHt9YwvdkGmD0e
	Flfab51wUCELiwlYdkBtNh/YCNhFIUCoh7ODYVMPxrhPyHZuVqjPN1cn0jbu93pGQw8NSZ
	3sF5Z/LrMw6q4u9C0tSS1NDKiOcrpvg=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] input: himax_hx83112b: add support for HX83100A
Date: Sat, 11 May 2024 08:12:21 -0400
Message-ID: <20240511121245.109644-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Resent, due to being caught in the spam filter.

This set of patches brings support for the Himax HX83100A touch
controller.

I have no access to datasheets. So, like the original driver code
that's being extended here, this code is mostly based on the quite
convoluted, GPLv2 licensed manufacturer drivers for Android.
I included links to sources and references where appropriate.

A number of people tested this patch set on Lenovo ThinkSmart View
(CD-18781Y) devices. That device has a variant utilizing a Innolux
P080DDD-AB2 LCM. This LCM comes with the HX83100A.

I would really appreciate if people using HX83112B chips could give this
set a run to ensure nothing broke.

Thanks,
Felix

Changes in v2:
- removed regulator handling, my test device works fine without it
- some minor formatting fixes

Felix Kaechele (5):
  dt-bindings: input: touchscreen: himax,hx83112b: add HX83100A
  input: himax_hx83112b: use more descriptive register defines
  input: himax_hx83112b: implement MCU register reading
  input: himax_hx83112b: add himax_chip struct for multi-chip support
  input: himax_hx83112b: add support for HX83100A

 .../input/touchscreen/himax,hx83112b.yaml     |   1 +
 drivers/input/touchscreen/himax_hx83112b.c    | 135 ++++++++++++++----
 2 files changed, 110 insertions(+), 26 deletions(-)


base-commit: 5128de84d8fc849400d00f7a6982711f129699ea
-- 
2.45.0


