Return-Path: <linux-input+bounces-13193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F364AAED99D
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E197189A760
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9286254846;
	Mon, 30 Jun 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="eTDWlGHF"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C687D24EA90;
	Mon, 30 Jun 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278795; cv=pass; b=ByWFoP/s5NTK9J2dfFItJ5ruL/B5V+Ktb5Snqqppbn30zlDD6coLVPcWQc4TCq60qJH4kgpUupc4JH8WdyX6PJnPphG5GJLIum8aY3/jdAPQzGfOGYVQMRCOY/PWzEfqkE9NzOHXLruSKllRJn+6wgpN8dxdkQbeu35KCYuEe68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278795; c=relaxed/simple;
	bh=29ohDLEsN/Q2I4UM2sKh1qn3BMNl8VRZBvcISmflJac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BqtYBhC7rPmOEbqEpaiUQyoR9sh6ix0Nzmb8lQ+OCtaoz6jRBN8c8lxkkq/wDB0v2oPgb95w8YJQt2sOZ0/0DX+HsqfrFytV/nppMzJOEHp6y1walf6TedS4mzM4VmSOrbmkEbe472+Ja3KiOeyJxwmqdc5Jx4w4CDmtWhrx5oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=eTDWlGHF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751278772; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nTcNtKcloDdymRlkpRP4fB7sHusL8piBZ4H5npQMqp1sE22KmQFYNcbjTb3JhME1X1R/aZlDrRf7x+2Hd+5LIKVZOE4qY96t9g0BIdQMOyMKfsAl9E8FjnxTf2uLuNEUOZzuntkpg/F3Sd6r9Uq7Z7ndrApTdUalNlbgLpX1c+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278772; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RMvPmaezlA9RzKU+IRM+ug9qE/4EpGSw9P74OlSc7q8=; 
	b=lBCg8mzKxBS0SrxPrZ9MyVjKA8SnenrW339VkAwnxtJksvbyyvFfvGM8Qv9535OMXrnf55gIlYzAS7xN/EL34hus317MD3abVhCnyylELQMF4YPzfGzEB7IPwI1+xE5orMTeM88VJ3aT8WVOlyK9OQ8Ch14aAxRS17+LDZFe6dc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278772;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=RMvPmaezlA9RzKU+IRM+ug9qE/4EpGSw9P74OlSc7q8=;
	b=eTDWlGHF8nmux7M5jX1nzOEksXOzPGXQkUseQKNpOJrgD1+wOKjSgulK96eSciJ7
	hmYNaCy9Y/Ddpb1XLW9EXjL+4wIevgRKoShtwIWq3J/OD7151KVEKcK4SCexUCi+mjC
	6JkhLjzqOwUs16dqR1f7jkzKbmKezxb21vkbSv38=
Received: by mx.zohomail.com with SMTPS id 1751278771100466.1546626645253;
	Mon, 30 Jun 2025 03:19:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/4] ROCK 4D audio enablement
Date: Mon, 30 Jun 2025 12:19:23 +0200
Message-Id: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtkYmgC/yXMQQrCMBCF4auEWTuQRm1LryJdxGSigzTRSSqF0
 rsbzPJ/8L4dMglThkntIPTlzCnW6E4K3NPGByH72mC0uereDCjJvS4e7eo5oQtOD6HrR6tHqJe
 3UODtz93m1kKftaqljXC3mdClZeEyqUhbwSafNczH8QPJdBh9jwAAAA==
X-Change-ID: 20250627-rock4d-audio-cfc07f168a08
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The ROCK 4D uses an ADC input to distinguish between a headphone (i.e.,
no mic) and a headset (i.e., with mic). After some searching, it appears
that the closest we can get to modelling this is by sending a particular
switch input event.

So this series modifies the adc-keys bindings, extends the adc-keys
driver to allow sending other input types as well, and then adds the
analog and HDMI audio nodes to ROCK 4D's device tree.

It should be noted that analog capture from the TRRS jack currently
results in completely digitally silent audio for me, i.e. no data other
than 0xFF. There's a few reasons why this could happen, chief among them
that my SAI driver is broken or that the ES8328 codec driver is once
again broken. The DAPM routes when graphed out look fine though. So the
DTS part is correct, and I can fix the broken capture in a separate
follow-up patch that doesn't have to include DT people.

Another possibility is that my phone headset, despite being 4 rings and
having a little pin hole at the back of the volume doodad, does not
actually have a microphone, but in that case I'd still expect some noise
in the PCM. Maybe it's just shy.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (4):
      dt-bindings: input: adc-keys: allow linux,input-type property
      Input: adc-keys - support types that aren't just keyboard keys
      arm64: dts: rockchip: add analog audio to ROCK 4D
      arm64: dts: rockchip: add HDMI audio on ROCK 4D

 .../devicetree/bindings/input/adc-keys.yaml        |  3 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 98 ++++++++++++++++++++++
 drivers/input/keyboard/adc-keys.c                  | 16 +++-
 3 files changed, 113 insertions(+), 4 deletions(-)
---
base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
change-id: 20250627-rock4d-audio-cfc07f168a08

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


