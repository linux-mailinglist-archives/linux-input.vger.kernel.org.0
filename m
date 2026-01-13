Return-Path: <linux-input+bounces-17061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E8D1AFA0
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 20:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB5EE3009689
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 19:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A3B35F8B5;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eB6IrzNG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57535EDD5;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331574; cv=none; b=mfLyo8kj1r8LUkNcQnE5KEe4jZxG+B4hubTOn0rq45fSiLdkS1tgJJ9RuLLL5Me6oL6EVvtsGs4e/LyLDKEUZEU02/MhpNkLKmG9yxieHeX6deJ5005y0IRnND3C3Y/mK/B+EuWpTItmN3iiaSTNwb3gobM9LJBteqmH49dfQnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331574; c=relaxed/simple;
	bh=shKJzKw1Ih0HkN9nyF0ttMJM0COgi6vVUCHPLcv23a0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nz9wd8ubCvBS/i3e6FLFfO/TnzzvSWSRMHLX9+HupyggWviUxfG9iE+kcY+h2PsrVdoZJzhRWVWTvR5TLTxIkEDB1NGkG7z8BjcgOZMIAQQCvCkkNJQuDATPyMXSq704KI6UA1Mvm0ahBrv9sxAYhdA/pKup9zEKZgXseqwM/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eB6IrzNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2538BC19422;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768331574;
	bh=shKJzKw1Ih0HkN9nyF0ttMJM0COgi6vVUCHPLcv23a0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eB6IrzNGKIulgcUAfuwBBRVNNGuCK77XhMqRlyW/2PsVN+5EAiX+nF1adXwNLLYGq
	 UklQ0XapSMjljTqVy/gXkzya3eKINbade1C5b/W2khLiLhICsMwdpH5fqF4blPrhGx
	 O7VnZDP9sUkmMHzbHckbSR8j7sAfkuSWuTv6qcO6YKin0/jMaOQ2AX2v7j4NITX2lM
	 L7e3e5L/JRaSxt9Q8gxJ5o0cW+6QNoESFbkQppFXJqjobqUa0mbidl8v/qCabyk+iM
	 YEBsDlXp/hjI76ex3xLl/0sDx5pfaClsEHldVD6dn3Qy9otHTzd+HnQ0+ACkeFo+v0
	 4XT++ovb5GUkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12795D2F32D;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Subject: [PATCH 0/3] Support FT3518 touchscreen in xiaomi-laurel
Date: Tue, 13 Jan 2026 21:12:34 +0200
Message-Id: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBG4avErBPSyEVXiRZpvzkbC6cikO6et
 PwW7xUSZIbQ2BTKuFl4TxW6bcjHJW1QvFaT6YzttO7VuV8+is9AUsdy+ghRDs4Mxrp1CI5qeWQ
 Efv7rNL/vBxiP+z1lAAAA
X-Change-ID: 20260113-touchscreen-patches-beb2526bd5fb
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768331572; l=928;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=shKJzKw1Ih0HkN9nyF0ttMJM0COgi6vVUCHPLcv23a0=;
 b=DSEKKDFVGI+3VF3inejaQDMH0Q2L84sZznBHxBxkwtTsKkvrib5jvhZ5ponszHQDj0MXnyaLn
 TfEB7BOf3BlDPItmL57iGvyLkaQe8lSujNEX2aM4Ros1mz+d2oLahZ1
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

Adds support for the touchscreen in the Xiaomi Mi A3 (xiaomi-laurel)
 smartphone, FocalTech FT3518

Original tree was here:
 Link: https://gitlab.postmarketos.org/SzczurekYT/linux/-/commits/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Yedaya Katsman (3):
      dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      drivers: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  1 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 34 ++++++++++++++++++++++
 drivers/input/touchscreen/edt-ft5x06.c             |  6 ++++
 3 files changed, 41 insertions(+)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260113-touchscreen-patches-beb2526bd5fb

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>



