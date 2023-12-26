Return-Path: <linux-input+bounces-1011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F281E42B
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 01:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FAFB1F22D36
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 00:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29E654278;
	Tue, 26 Dec 2023 00:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlKMiXZ5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939DF61667;
	Tue, 26 Dec 2023 00:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CCDC433C8;
	Tue, 26 Dec 2023 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550463;
	bh=+9EjxN7OVgADoTxYjJw0S4pCwt37OnwGJGlmDH2kKvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tlKMiXZ5NORvWS1KFW+7R9emo38/BeTOtHmQAd8Fcm1FxMYjytkjgGFhpWgyveE4u
	 yRZ6bJZUmAfSkOsO7PA65PoMdbqa6z5wsXErY5h4QqypN5UiYFkkN308XrW1ZSnocx
	 JdNRjbl1jyw4BvdUrxWbPIxfNnWJ96EER/r5mnTHk6iyBqmC+yxr5PQ6ZX1Wa2PUJ5
	 V9uOnSH9Bilc+2kJ33vURyqiezOVNH520hCDGF57J0nB7yTlqdicOX5QFlzK5Iy9Cx
	 2S5bqS8wtBCfPC7QkmkQ/Iy1p9SSEVlnx7fW4nMU97lUimV0G9CVdOpZ3kWgjKrX8+
	 5csgz2h0wL/hA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luca Weiss <luca@z3ntu.xyz>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	vi@endrift.com,
	swyterzone@gmail.com,
	carl.ng@hp.com,
	matthias.benkmann@gmail.com,
	doublej472@gmail.com,
	slouken@libsdl.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 6/6] Input: xpad - add Razer Wolverine V2 support
Date: Mon, 25 Dec 2023 19:27:13 -0500
Message-ID: <20231226002725.7471-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002725.7471-1-sashal@kernel.org>
References: <20231226002725.7471-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.334
Content-Transfer-Encoding: 8bit

From: Luca Weiss <luca@z3ntu.xyz>

[ Upstream commit c3d1610345b79cbe29ef6ca04a4780eff0d360c7 ]

Add the VID and PID of Razer Wolverine V2 to xpad_device.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
Link: https://lore.kernel.org/r/20231125-razer-wolverine-v2-v1-1-979fe9f9288e@z3ntu.xyz
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1dbe303354589..3fedc3688e8f2 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -282,6 +282,7 @@ static const struct xpad_device {
 	{ 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
+	{ 0x1532, 0x0a29, "Razer Wolverine V2", 0, XTYPE_XBOXONE },
 	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
 	{ 0x15e4, 0x3f0a, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
 	{ 0x15e4, 0x3f10, "Batarang Xbox 360 controller", 0, XTYPE_XBOX360 },
-- 
2.43.0


