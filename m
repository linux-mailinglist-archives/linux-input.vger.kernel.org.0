Return-Path: <linux-input+bounces-3756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287158CADE9
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 14:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35061F2371F
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 12:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1A7763E2;
	Tue, 21 May 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSy9jzyo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A176025;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293428; cv=none; b=tduuuOWJFAK71XzQ9GUUO1KzulUqOuLR7zCU70XYPW5ffQYroLNv82N1qJoXmJW0plll1rI6HhYqlzu7xOMO079rXiu3OjFhhrfEi0yTpkFJwsp4878+ty5PGp9IBJZK3THzhk6yMxqSXvxTKf5MphNwOF1ZD+3OA2z1TR7PmmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293428; c=relaxed/simple;
	bh=f2GQ0va2lsLTO8nlzPzR6f1yERxb6qBUyy6szVB7sAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O4ArjDmpsKgt/5qLnnWgBtuUoFYgtbpIBPWcV3X6uCb6+FB+2jPyHFrqV285L70OGCu1ZFVH9AnazRgHrJmLEDwTx6IQenYgzkyFMHkbDg7WmhFqXvsgACjO4gi2jZolov80/TFIurImpFkBJKeEJheeks/mlJeqedefJsScNbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSy9jzyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C839CC2BD11;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716293427;
	bh=f2GQ0va2lsLTO8nlzPzR6f1yERxb6qBUyy6szVB7sAM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tSy9jzyoijfqBI59lgA6oL+x4sNWOSz//Hs6yMCVWi5/gMBKScYRp6RaqM40s5wnB
	 hUxxsP7i6vD8++xZSqE+kys/5mluxZs3KtAWe6pX3rl/haMDLZDex4uy9paPEtEGJ/
	 mUXle1pXdMrizuolWU3tHnluXrnjKS3P7wVRENzT5PS+DoUkM2CVuGdXdZCxzOceZZ
	 EFVLl0e7Ek+Q4t1qXjwAuXeaqUDNR8+UtVRSWv0N+KjXbzZeBTNZhWHD/WpnqOhf97
	 uXvmGs5Nv7w6njANCPoSkzZNhAohpzD7gx9+962Jz7nCTmzMHdxnDoAWB9lMsws+Pm
	 EZ6uxKYaSEO1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37F9C25B74;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Subject: [PATCH 0/2] novatek-nvt-ts: add support for NT36672A touchscreen
Date: Tue, 21 May 2024 07:09:44 -0500
Message-Id: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAiPTGYC/x2NwQqDMBAFf0X23AUj1mp/pfSQxqddKEnYjVIQ/
 72hx4Fh5iCDCozuzUGKXUxSrOAuDYW3jytY5srUtV3fXt3IcS9cjOfqBhQFWLFuH1+Ssm05Jy3
 sw4R+et1G7waqpaxY5Pu/PJ7n+QNYFuZEdQAAAA==
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716293427; l=1155;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=f2GQ0va2lsLTO8nlzPzR6f1yERxb6qBUyy6szVB7sAM=;
 b=RwjnyeMqeGDD586cQXkEIsoybnrUaiCO8HAys+wB2ry3yzDHXQjh8LXhO3b3RTvs2fuPPGF4w
 XNDDR+VcijjD6awjhM6ZJsneWQ62X3ZMHBccN8iPQVlpoHccYsX2p3i
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

Extend the novatek touchscreen driver to support NT36672A chip which
is found in phones like Xiaomi Poco F1 [1]. Added devicetree support for
the driver and used i2c chip data to handle the variation in chip id and
wake type. Also added vcc and iovcc regulators which are used to power
the touchscreen hardware.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts?h=v6.9

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
Joel Selvaraj (2):
      dt-bindings: input: document Novatek NVT touchscreen controller
      Input: novatek-nvt-ts: add support for NT36672A touchscreen

 .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 +++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/input/touchscreen/novatek-nvt-ts.c         | 78 ++++++++++++++++++++--
 3 files changed, 135 insertions(+), 6 deletions(-)
---
base-commit: 6578aac6a270bd6deb9f9319b991dd430de263dd
change-id: 20240518-nvt-ts-devicetree-regulator-support-ac9e49b78a16

Best regards,
-- 
Joel Selvaraj <joelselvaraj.oss@gmail.com>



