Return-Path: <linux-input+bounces-9632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE2A23F54
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 16:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E8877A29A4
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 14:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71341CF284;
	Fri, 31 Jan 2025 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="IpltKufi"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6F1E0E0A;
	Fri, 31 Jan 2025 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335606; cv=none; b=ezN9nNT37nMXYmx6xyd/Uu8M4Y7Q+HDQxhpMzuzi5HmGKSJQsSf1unK+UXQ+qL2iIP+3ARqtm84JzZU02pGUXjnFy8Ay09nqbPKxvMk8SPZToAW69kQIeQOvZmQBEX/7qe341y3ZncrWYrs8WLca/GcC/LSz+WMto6eDKZgqqUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335606; c=relaxed/simple;
	bh=vpg3/dF5xuLIeH18bNykFPejhDfSG6gCZL//JzJ1HpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+fwT+ASD+jNNC3B0lvNExtAEJztUsqvZ1wHsbpe+HWoQmoWdKhgBl7DT1M1sLeAVUGDDGUNYOj62fpjT5wKko3cgNNPDMQ1kuFxM1G75BHuBSZ2XZ2fpggLzBciDgbNoYM665F8beTL9aYyPOm0wtci+jIdjYzcWF0FVfqEi+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=IpltKufi; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YkzZf1Zd1z9tHm;
	Fri, 31 Jan 2025 15:59:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1738335594; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=vpg3/dF5xuLIeH18bNykFPejhDfSG6gCZL//JzJ1HpE=;
	b=IpltKufi33LiMBKxj5FZwJCNChXSe6vQe++7H71thSVjBXdBc2YxWNJDTOxwRwoiogOb1N
	pJMM+qozmjyfsyOx/vJlwDQp6sUHwPs1YEH5uqhvP4+rsN+gAWJnCeetQB9awaa9Kk9ILk
	Gm6fxTLg4pKbZhRLJwDviY5PmhMMmeVITiha/xMUIHeV/h/XYkUl/00hK1xmEUoPiyTJ+H
	WtOADJex97+zUYM0RMD7+5hGpOPV1lWTuIVrk/Bb9FrZcJsLSKJJkZZPI6G80bbI8ENIhi
	Ns73njU019/hBEWhAKsCvcnURxoKKHMnFgk1DbI6h3nJc59X7QubjMAW8lwcKg==
Date: Fri, 31 Jan 2025 09:59:50 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: marian.flor@posteo.net
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.torokhov@gmail.com
Subject: [PATCH 1/1] gpio_keys.c: Send also event when EV_ABS axis button is
 released.
Message-ID: <xny5a7np63v2kuylk52wfvg2aqjzii37j6h7yte4xg6ebuhbr2@e7r4giykyp5c>
Reply-To: 10ae4572-bfc4-4ead-8563-99a26285d29e@posteo.net
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 4YkzZf1Zd1z9tHm

Why is this needed? your subject is good, but add a commit description.
Any empty one doesn't tell us anything about what your code does or why
it is needed. What value does it bring to the users?

Thanks,
Ethan

