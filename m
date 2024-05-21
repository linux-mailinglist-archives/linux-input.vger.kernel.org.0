Return-Path: <linux-input+bounces-3760-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254B8CAFF1
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 16:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A9B9B23F3E
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A937FBA3;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYHlSeKh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171D7F7EB;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716300187; cv=none; b=YpwTb9un71C2U9oHL7lt7OzwtqqVrz5J2HjCInTupFhjdB4pGHKQQbzBWW6VbpnfE+Z9AhGiomZDPCzxMqkeqSl4gwBxOoWXem697qPvOwiRDu+xd4XPDrsDEQJjSBQA6becyQ9X/2m4CqQLl9t7+6tJL8EpwrK3p+GUyZkMm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716300187; c=relaxed/simple;
	bh=+Jy4m7MNDpofjaRM2AsMooq8RhxTCuUViL7IQLY/GDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oODWbZES6DPYvx3xn4ZDhoINdOAMcKpf+XxDUUA3amSr7DE0keDenjFM6P2tn/kgxONtPnVt175l9j4YbL9eU4L4VWR7AiTYmZRDPCqzN4TabKcDb8mmQFfwk3VAUfkwp+x6ooTXzp7BdyrGt7xHT0wSZbP6NyK+9prllyCunSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYHlSeKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F32BBC2BD11;
	Tue, 21 May 2024 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716300187;
	bh=+Jy4m7MNDpofjaRM2AsMooq8RhxTCuUViL7IQLY/GDs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BYHlSeKhp5/6+3JEmF8quhUenzDVjzpfRw1biR+7mYIeDpzj/0hhcoD4fGGAz5EbV
	 B0VcJv7wwk3h1rf/aZtN6kSi32xloVcFYYad9Ajr52DRgUQyqFplyET2MaYXSgG0Ei
	 BbgaKpbs2qzrJMDzhWK5ac/LSNDbpn1jKrRw7k6cuMfPtjlfTEc3/6Nvt6CH6BlvBH
	 F3lDB/lLIvInbMEN8TMVptwDL4fa58J1tPXU7ab+v1SPQhmm7rYy8y8uioq02fpffF
	 +deDzxj9CTjnjQKDOmQp6PbI1zwdjsRL1dGr4KUi5fa6ywycjt2xspwEneL6qACl9h
	 ZX9mzWaHbvyWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AD3C25B74;
	Tue, 21 May 2024 14:03:06 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Subject: [PATCH 0/2] Input: edt-ft5x06 - add support for FocalTech FT5452
 and FT8719
Date: Tue, 21 May 2024 09:02:56 -0500
Message-Id: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCpTGYC/x2NQQrDIBAAvxL23IW4VZL2K6UH0d3Gi8pqQiHk7
 5XeZi4zJzTWxA2e0wnKR2qp5CHmNkHYfP4wpjgcaCY7OzLoY8S211q0o3RnHaHPceC6mAf2soe
 tBWXOKCvdw2JZvBgYvaos6ft/vd7X9QOkqX22ewAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716300186; l=1251;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=+Jy4m7MNDpofjaRM2AsMooq8RhxTCuUViL7IQLY/GDs=;
 b=GPJ6+3sTUcxQbqe7Q2jq/hSWNe3OTVkl1ZUdn4wrZgvg7dNBv2fIvPkzaZSANCp5YZIXhMMGV
 8LNL3nhf8RBDBfDayHlMd+at/RSHJznFSMSFxA8Q6Y2801ZcCzzmRQl
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

The driver is compatible with FocalTech FT5452 and FT8719 touchscreens 
too. FT5452 supports up to 5 touch points. FT8719 supports up to 10 touch
points. Add compatible data for both of them. Currently in mainline,
FT8719 touchscreen is present in Xiaomi Poco F1 (EBBG variant)[1] and 
FT5452 touchscreen is present in Shift6mq[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts?h=v6.9
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts?h=v6.9

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
Joel Selvaraj (2):
      dt-bindings: input: touchscreen: edt-ft5x06: Document FT5452 and FT8719 support
      Input: edt-ft5x06 - add support for FocalTech FT5452 and FT8719

 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml    |  2 ++
 drivers/input/touchscreen/edt-ft5x06.c                       | 12 ++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 6595aff3307919c5866493ea994af4edd24582ab
change-id: 20240521-add-support-ft5452-and-ft8719-touchscreen-f823c74efaf1

Best regards,
-- 
Joel Selvaraj <joelselvaraj.oss@gmail.com>



