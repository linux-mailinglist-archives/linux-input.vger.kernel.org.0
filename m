Return-Path: <linux-input+bounces-5159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC293C9D3
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 22:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64827B2178E
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 20:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD07140384;
	Thu, 25 Jul 2024 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FBjGdCe/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222213E8A5
	for <linux-input@vger.kernel.org>; Thu, 25 Jul 2024 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940489; cv=none; b=uqKPrPvDXtUpmjRYWz/iStoXs98UJ2JHzbfBrf599ll3dko5fTAXcMVlCgeHvP8k8OD+ruRVBhEzQz1kN0nmDfHeTLVebPzCS02Ds92eN4EAsFdJkeqcav7I4tIFQaHNA0LwPXcbt4hvgw+TCb7R8gpGTY4MTivCwOjNK5Hp0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940489; c=relaxed/simple;
	bh=zLO1NlLHeLSZwvDSiFGjY7aAX3UM0dHw/gZT//5jtkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsVPWtcj+KyYUHGOQHSiYNAqlOF+TKJMDdobIi4JD3jZdoP6wnB35/TonCDrkSEwUkJG2yuFz0quL4CTQLpW19tYQjxWotZaVxBMVIFa3OJZ+8rg2XlxEl5/boP6qHz2NKphOYACKhdv5USKbAd1sgZ2+FwzWWIqXRqbcqQLjN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FBjGdCe/; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id X5MSsJCR06bu3X5MTs68yo; Thu, 25 Jul 2024 22:46:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721940414;
	bh=jiHdzIKpBMjgCjVSVMxDF60tEeu32uxFn6X9R02aY5k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FBjGdCe/LqhDP5twVFOxTlnOKeH/V10meTO7CetJcgksP+lkfsCx5nBavPejiAGwM
	 hVbbCzOgrvDBjKa+VgA61h1CUOIHeeTXXj/FG6TDJpai693G+d8q4uLP2jGzRdgPYx
	 CbKqjoeHXGL59qt7+uYIb5uBfkMnmmai124M+IdQIiCs2AQnB+RAGqg6FpXcilz0nY
	 XKY/yvg+38ZjUDV5jsi5A9SyUQn43PQeXemKppZQgeBVckKftporXjBaC6I26RlkM3
	 CflF0KSGKVSLbHBdnBP78KzcYDxDddTMWr7Nhp7UL0QPP3G7qwOboRimtv4JxNPeEU
	 2zesXk6cy1TLg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 25 Jul 2024 22:46:54 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dmitry.torokhov@gmail.com,
	vipulkumar.samar@st.com,
	viresh.kumar@linaro.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] Input: spear-keyboard - Fix an issue and clean-up code
Date: Thu, 25 Jul 2024 22:46:48 +0200
Message-ID: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 fixes an old double put issue in the remove function.

Patch 2 is just a clean up to remove some lines of code. It changes the
order of some initialization so should be reviewed with care.
This driver looks old, without changes other than clean-up for more than
10 years, so maybe this patch should just be dropped.
I let you decide if safe and useful or not.


Both patch are compile tested only.

Christophe JAILLET (2):
  Input: spear-keyboard - Fix a double put in spear_kbd_remove()
  Input: spear-keyboard - Switch to devm_clk_get_prepared()

 drivers/input/keyboard/spear-keyboard.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

-- 
2.45.2


