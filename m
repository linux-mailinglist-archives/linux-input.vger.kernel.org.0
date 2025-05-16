Return-Path: <linux-input+bounces-12390-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9CAAB9E00
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 15:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14081173767
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 13:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE91213B280;
	Fri, 16 May 2025 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="YzeYJdir"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6425378F4F;
	Fri, 16 May 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403554; cv=none; b=Ypq+Lga/Xxv6R19969mbuVcDMuxq3gVJEn40wrjjw8QJiGKewYCTC8AYb4uUw9gNwFW6dKOnfXJ80RTme1AQpSNZiQQ9ckr9HhYT4I8KdcmwxmXN4J8i3cB/LGyaK+bXL/5vbfSDdM3ELl0BZ1pVfFmw27plamK+Bn3s8q1U0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403554; c=relaxed/simple;
	bh=G7IoYBlekEDnA5WpbRnO4B6/NH2PAOUcB8QaLJiOfh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqpDYiCXvkS5Ih68/LZw2H6qPFVztDig3vVAD5wbnIxODXcnQURgyMsd0n3azQOhYsOf14UbO1wVEfd5zSSJ1U6TLFcac49mCDWtziyngG8gq49HQW/wJKpuuI1wyR7VsZLh068ONdYVLFiep7lf9vsuYRI4mVC7kftn9lmOtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=YzeYJdir; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747402993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fG5oBDu1wAr9VumjZosQuBP5gLbTO62GxOXNGfbeuSg=;
	b=YzeYJdirjawPFETK7VW0CQmZtmBQ6EwuNFIMwz19bKwexLLQzuI5Llp9/1vIjGaNZxaQwB
	3SwDuT2EjnXYkJV6enP5NAfg9OmG5YGs+tpldx94qyht7br5rBiozsibobF86lEPE5CUel
	qs6CQm4to9YutyvTrJb6EkSnxuqHc7Q=
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/2] Input: adp5588-keys Please correct and add
Date: Fri, 16 May 2025 16:43:02 +0300
Message-ID: <20250516134313.282564-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Add check on return code
2. Prevent buffer overflow

Denis Arefev (2):
  Input: adp5588-keys Add check on return code
  Input: adp5588-keys Prevent buffer overflow

 drivers/input/keyboard/adp5588-keys.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.43.0


