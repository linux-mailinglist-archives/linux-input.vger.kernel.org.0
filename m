Return-Path: <linux-input+bounces-6267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F149A96E267
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 20:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 295AC1C2343D
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 18:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45AA1A7276;
	Thu,  5 Sep 2024 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MafLyMVK"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D053D1A42CF;
	Thu,  5 Sep 2024 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562375; cv=none; b=T9S6TjeR6SemFQ7/2qXNDkVt7ZPryBslWXEhBf68qrmID3x0JvZ5gwi1Tt605zZq+WHhPD0Apwj7VLA5MY+5Rrczu5vTr/8bUYg+j7W0XF+HAfqxtBNPGbZFcc9VpkPi9gWOXWUWvxQROAWjUoK0EnSYUML4q/hNaSPivdTr7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562375; c=relaxed/simple;
	bh=F1F3xjofxTwzvwU+XNLOYef8SiHd35nW1uqksCGJicQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFDYq44nzPPff7eGJNrr/ou+uX8MLK4wn3p9cKrFXrgOuNVcFBJBCo1JtI9RbAUqTfEfjAvyA6ZenOKwQzJqH4Wazf4qSwyc7IyiFfBsDfwxFQ7v6yfxu/lq/x49xPy5LqYScXDzSjNs8E9WqV0hAW4DIHB9dScuz0qMlJjV6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MafLyMVK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EBMUNEsgg3HNHWKY+I4PZ0QO6FHi+iK8X6AqrZyqPbo=; b=MafLyMVKQPzVlTRwKI9hWGEGJy
	ipJaNMmahZM9kb4bry+d6315QlbuUSD3hGlkr3m9T2eJAKAZeXSLufi+aFpMjZIAQymKE4UnxwJHw
	jdAFvtLfLvhe79o/cOk3ngehe9RWW4KdB8HnUKFWnaCv65663y05gk9Q1uVjF7+NII2I1Nwg7p3zV
	W4sNNhKJhFMsQ21pmODmaJ5FdO85UaBUN0q0swZIxx1/vVq/nLulVB2aw4nyBOBaIlGTjDblCxS2g
	w0CpX36Ly3sQF7YqTvN7mfDypn/bQmKj8ku8WrpZZa8loGsh5HqvgCaNh1wDN8x4xjbcz9w1VshhF
	RKRO9eBQ==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1smHaw-0003sR-L9; Thu, 05 Sep 2024 20:52:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	heiko@sntech.de,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 1/8] mfd: core: make platform_data pointer const in struct mfd_cell
Date: Thu,  5 Sep 2024 20:52:25 +0200
Message-ID: <20240905185232.2899464-2-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905185232.2899464-1-heiko@sntech.de>
References: <20240905185232.2899464-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The content of the platform_data of a struct mfd_cell is simply passed on
to the platform_device_add_data() call in mfd_add_device() .

platform_device_add_data() already handles the data behind that pointer
as const, so there is no reason to not extend this to struct mfd_cell.

This allows to pass structs gathered from of_device_get_match_data()
as platform-data to sub-devices - which is retrieved as const already.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/linux/mfd/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index e8bcad641d8c..faeea7abd688 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -72,7 +72,7 @@ struct mfd_cell {
 	int			(*resume)(struct platform_device *dev);
 
 	/* platform data passed to the sub devices drivers */
-	void			*platform_data;
+	const void		*platform_data;
 	size_t			pdata_size;
 
 	/* Matches ACPI */
-- 
2.43.0


