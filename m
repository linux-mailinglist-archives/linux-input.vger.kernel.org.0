Return-Path: <linux-input+bounces-13855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EAB1D317
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 09:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B273A3B7B
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 07:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AED231830;
	Thu,  7 Aug 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="gAIfZ4TG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail0.khirnov.net (red.khirnov.net [176.97.15.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A900230BCE;
	Thu,  7 Aug 2025 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.97.15.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550827; cv=none; b=ZN2+82uLWO4KoHA6qUpV8pA8sfQP9bRfYBQK8JLJVKgwITqkHNb/f/8G8X+EYLt6XKEJPcVvfG/ps9ztiKCHWRAQXM9NmH2CCseatN4qzkGE3JXttrEaqO1KkprWwfi1jpm/lBh/64IG4IYnaBoDL1o6ZdGs8Si/gG1SKFzKAPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550827; c=relaxed/simple;
	bh=YUA5RiBpGAWvHlxz8fkf1jghXvZc3JwjJoR84RaygdQ=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:MIME-Version; b=CAq3rJDlhhxfRbdRi6/kF4hU8RxGLTUTnQaYn3kAHhi2IotIQhEgX58vc3gwqpAnQVANwAtaJE7xjCQ23r4Qj9DrvJISs/7i+rC6yjoGKfjCUgHUjfkVEQIYfUGfS+szLXCvSOSVTNYowtGB6Rd8T8hx3xiHFF1eoyi/FOJYZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=gAIfZ4TG; arc=none smtp.client-ip=176.97.15.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail0.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=gAIfZ4TG;
	dkim-atps=neutral
Received: from localhost (localhost [IPv6:::1])
	by mail0.khirnov.net (Postfix) with ESMTP id 59BD3244CD3;
	Thu,  7 Aug 2025 09:04:36 +0200 (CEST)
Received: from mail0.khirnov.net ([IPv6:::1])
 by localhost (mail0.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id gZ89qqBFjTSv; Thu,  7 Aug 2025 09:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1754550274; bh=YUA5RiBpGAWvHlxz8fkf1jghXvZc3JwjJoR84RaygdQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=gAIfZ4TG2b94qbXW4Mr74i9wHfoyIGxDV2FaEeVRmGEFg66z545iz7ZJeUmyjL6v/
	 /AZArhDoFdG+uABq0TPY68aS7/C67ExDMszMxPtm8IoDSkpTCCkiPsP4rKSTaiRkYk
	 JiGP8N4AAddXpfTZFQgM7IkCdbOXBo1KbVpCsnJoQEksu5lY2GyQFKKJ2Oar5hHpRi
	 g45LlAO+cntHN8Gee076rGXNloZZH1fZmDeZKKxOFhnFvg2TaOlgCaumnRFLC7PSYK
	 Onxq87Bjvf8rrJiMj1LAxi1Ba+UOq2fYCbvKsLDvcKFvl9QkHiNskqGigPDJYE25cs
	 wz7/v//fNOnuw==
Received: from lain.khirnov.net (lain.khirnov.net [IPv6:2001:67c:1138:4306::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "lain.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail0.khirnov.net (Postfix) with ESMTPS id 1DEA0244CD2;
	Thu,  7 Aug 2025 09:04:34 +0200 (CEST)
Received: by lain.khirnov.net (Postfix, from userid 1000)
	id F1FB91601BA; Thu,  7 Aug 2025 09:04:33 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject:  Re: [PATCH v2 1/2] Input: allocate a keycode for Fn+space
From:  Anton Khirnov <anton@khirnov.net>
To:  Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:  platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
In-Reply-To:  <20250714150756.21197-2-anton@khirnov.net>
References:  <20250714150756.21197-1-anton@khirnov.net>
 <20250714150756.21197-2-anton@khirnov.net>
Date: Thu, 07 Aug 2025 09:04:33 +0200
Message-ID: <175455027396.18450.6158883214483744371@lain.khirnov.net>
User-Agent: alot/0.8.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dmitry,
could you please look at this?

Thanks,
-- 
Anton Khirnov

