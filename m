Return-Path: <linux-input+bounces-12471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDEABD67D
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 13:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D5E718918CA
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE3A26B94F;
	Tue, 20 May 2025 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="Phhz8Y4R"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294A326E14C;
	Tue, 20 May 2025 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739650; cv=none; b=dHQG6Itet+meyqU7PDgYOrk83dUsNjRIqdnZrmTEdxOfAXt9mZF3ucHOUGezafm4VDTAsFklnirY1o5jhD6v08XmbLJOxbp5prVt1d1tuTYJz/v2DSg7qScFd+Tv9Bea/r5+HWlq1y2ywTzU+Di4ZyFBlBe4OGguodcbFelhb7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739650; c=relaxed/simple;
	bh=5AOP+Zato+vuPARdEJ8FsRyab/jFki0ji6T3TohlPg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjZCXIgXwvW4UHR06N1JF4MrrOHXd7VaPiAtd9cit2bbGf+hoDXaMQDJ72V17/QDFaHUf+4DimhURfLbe+mLVT+l1wXM2xZMAv5b9u3HGFJasrUPoWurMK2wInz0pAz6xXANdX+4JxUnTu1jFp2oJy8EpmowTLRyY4x5IwFUfpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=Phhz8Y4R; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747739644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fBSN4khAvDyaO4n/canekzQh4o/lNwhR2YUpSu3a+Gg=;
	b=Phhz8Y4RnvYR2Mle2GsfiRGsuRVuyBEfiUCSOYvsi6x9fuAYMVy4v/4LAbO3/YHl+5YnLA
	YGJ1fbQfbR9urkrbeEh5OPMro9dem6G8GblHtXdWbbocMCXooj/oqD56wIfJVl2kggn6EW
	vW5g2pOcgOCIwgbhg0XMwEaI+zI2CwI=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2 0/2] Input: adp5588-keys - fixes and improvements for report events processing 
Date: Tue, 20 May 2025 14:13:56 +0300
Message-ID: <20250520111404.1346071-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch fixes a missing check of the return value of the adp5588_read function.

The second patch prevent a possible buffer overflow kpad->keycode[code]

Link to v1:
https://lore.kernel.org/all/20250516134313.282564-1-arefev@swemel.ru/

Denis Arefev (2):
  Input: adp5588-keys - Add check on return code
  Input: adp5588-keys - Prevent buffer overflow

 drivers/input/keyboard/adp5588-keys.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.43.0


