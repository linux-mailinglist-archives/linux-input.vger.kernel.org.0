Return-Path: <linux-input+bounces-13453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68867AFFE12
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA521C444B6
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326932BCF45;
	Thu, 10 Jul 2025 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="aBK+jOIF"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A4299931;
	Thu, 10 Jul 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139650; cv=none; b=pvM7caSebAXB++VKiEfd1f+B7VkMzm0ymC9u1C1L5c6kQFgsANsJYuPDwY9fnDEFY0Y7K4ujgOuFLADcyoH39vbIKjDKA4qD+hlba17SfkW/QpaaMjMoB3MAX8D3lR9UqinYjgI8WCe5b7xf8QQ49jX+cyS45g3LIRNFDbhUNxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139650; c=relaxed/simple;
	bh=bmHzqUtFa38jzBouS5pN7lf5v5MqnibcKO6jfVB1Um4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfLiWFXZBbRfK4ROJerWne8H4JGNzHdPdsjs/+hq8nnlqSB4qrGaMQcFE1gts2fRSS3yF46BIjb05HAkpc1KMHPfcGkd14d64vKe+zquJ1CzRCfjRpQ9xIQ2iUqMtWFu4fIY2szEpkixuEcaWu8FHUu+fnDtXkEorJCdWvh0lHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=aBK+jOIF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=13+8BEkXLheRkv5whG02ibWcosm7wt3oL6Kdm1ccKVo=; b=aBK+jOIFUszOvNCVOckQBv+F5W
	eV3wsRAw5OCEyYrM/Y36QJNlR7ZhA2+dI9M2c8dCRhAEX5PmsQYprUCLrIb61qjygWJPfwGYz2Tyw
	QVN/aPCyZRjcz5khxWuRK0YgFG7rTdKGjDqajOIdjSUaf9+4eWk3y530QBPpKzwF1rjEo6MIAoAiR
	VqNTRVMynKpvAwYa5X+Q1ZLk1LabmW9H88RdwoFTKxtghY2uOfqa8Pcd/n7aNVLfBClKsqvu4LN7A
	thOUT2bEDhgDioeuNaKRV+aDlo0SvwABD0wCtdjK5KqyY5hM5faBGuid0pMAJdobrb6CzwHzGc9JU
	ToYbO4aQ==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZnYo-0003fo-Gv; Thu, 10 Jul 2025 11:27:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] ROCK 4D audio enablement
Date: Thu, 10 Jul 2025 11:27:16 +0200
Message-ID: <175213962003.1887379.17539289934653922939.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Jun 2025 12:19:23 +0200, Nicolas Frattaroli wrote:
> The ROCK 4D uses an ADC input to distinguish between a headphone (i.e.,
> no mic) and a headset (i.e., with mic). After some searching, it appears
> that the closest we can get to modelling this is by sending a particular
> switch input event.
> 
> So this series modifies the adc-keys bindings, extends the adc-keys
> driver to allow sending other input types as well, and then adds the
> analog and HDMI audio nodes to ROCK 4D's device tree.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: add HDMI audio on ROCK 4D
      commit: b78165281b25b676ed3e4f71610228984222d214

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

