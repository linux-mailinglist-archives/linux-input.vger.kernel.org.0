Return-Path: <linux-input+bounces-10647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51307A57AE3
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3083B3B1AD4
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51611C6FF8;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sz7h1Jh5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975DA1465AB;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442924; cv=none; b=aYz6YUo1As0SEhDnALHwHtJi2F2WVKLc0ZWBNoJNwWLSAxTUwF66M9ADzS5nGg5oSoHn47O5Fr+xxMxWL6rEaidh+GuC7aY+WZxwc9VYjCe4sOxNIGYx+JgtLKb55Sv53Hnic4qc9nLTJfY6LX+u8nxEjyGA5p+/wgDUR/X/7D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442924; c=relaxed/simple;
	bh=OZJFn2kWzXxZtO50ATmH2PlPJ1mrjuXSB8BlOyraUSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DG6cunpcbkL5r6+/sBxwWqaYkwQPhRT+dqgGy4W/oz9VdyF63x+YtiMYli5/FMEPwk+ukGUjhI8cCJeTKN9rWoT/qTtDFR70PEZay/vQKCA3wJjMplNG9ZbmdW5yaAVG63trjyjeNUg5VnwJEifURtEi1pyxMO2L4QJlm5gmvpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sz7h1Jh5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B65CC4CEF0;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=OZJFn2kWzXxZtO50ATmH2PlPJ1mrjuXSB8BlOyraUSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Sz7h1Jh5ZvhUSFeP8L4OE+JzZM/G4ZN9ytia3KyANN6O4ZsUx0KIL7MYlfNj+96kz
	 bvyGkJYFQG2yetRiM2hchCsrBHfxWDZjLoOG4LFMx0ikkIpbVjQvZO41cUSwERps56
	 WBXuzsAFWLjOs+UELEqMYWaT47kweoqCrZirRwGpMLvvQMSkGcxNJCjwI6KnkO43m2
	 SCOD/gFbd5I0M8oGVeioVAz5E5tnz8aE5yhvyRhc3+31L2wGUIhJ3z4tvkAl+rEuaF
	 st6eNQlLRU+91dY59q/YuuooZPhfuKtNLISzGoGYelaWYu4HBwxI84Ehn9g+wI9hIi
	 1F6MFXoXK0dNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417B3C282EC;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 08 Mar 2025 15:08:40 +0100
Subject: [PATCH v3 4/7] Input: synaptics-rmi4 - f55: handle zero electrode
 count
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-synaptics-rmi4-v3-4-215d3e7289a2@ixit.cz>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
In-Reply-To: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, methanal <baclofen@tuta.io>, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hiDNyT5E2yGpmjVDicyfKBuIVjPA9Ga1ra8J+txE4mY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9q/je0m4BVEyzjtbsSLpYZ/5ZJOh5xCum1o
 Uxcb0p2e+uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPagAKCRBgAj/E00kg
 cllnD/4tPKZRlakbfkLb68qJ2DccOXIB/VhozmmGfWeG1AhRiiA2as/S77FNWDRXS2ISV9ypUgL
 +n1qoOudQxEv+Q1yaPCZ3leWhrvraCqOtgDSXlNtk7iJjmhy6sIncaFWItFD83vyS6+zfEm8DMN
 oqR7R5yNYx/UrND2I6tS3H1EijqJEQr/K2XL9NB3WjrYq9fToGlTenLWQ5EKireO/J/bNB89oBR
 7cJyCIaT2jCZnMLWtjz2Pclshwl3tDtxg1gU6ZBGjz/SuT8WNu5EpMo4TrlPGEFjaYRpJOpDRBp
 hp6oxW1t2TO0IczN0xqwRrmZWApEV4GamxNXbZ5oHwhV86wGsMC1HEuQALdgKdJ2t6xDd8bB7Cm
 22ekesLXe1bn1DCLNGrxOP2rv/8KnC9URil6mY7QWMUszf7cQZ0sRro/5qdVH8NVAUqSZKOTdTt
 bEnCjYJKYbpBH7Zcxk3RvlCAt9ZWe3libiyiiZ32pjh5L1KUg9qxgfgBt1FCK7c/rkVl2ae6+0X
 uzxB+QZL+iKGg+TDprNB7Znab8XsaSLYxj3HKXS6uZoyvmC8S97KhqTinbmjaXYeHHWXQyBaV59
 XVh9GIBHzVCe/XioXCJ9Afqy/FwD9IKi7Q5PdZkI24E+KwtUFp4yraVs5abwT7eJCu3QotbF5h3
 RBplUBqCR/w9k5Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: methanal <baclofen@tuta.io>

Some third party ICs claim to support f55 but report an electrode count
of 0. Catch this and bail out early so that we don't confuse the i2c bus
with 0 sized reads.

Signed-off-by: methanal <baclofen@tuta.io>
[simplify code, adjust wording]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_f55.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f55.c b/drivers/input/rmi4/rmi_f55.c
index 488adaca4dd00482cd1106d813b32871092c83a0..ad2ef14ae9f4e897473db43334792cc3de966d52 100644
--- a/drivers/input/rmi4/rmi_f55.c
+++ b/drivers/input/rmi4/rmi_f55.c
@@ -52,6 +52,11 @@ static int rmi_f55_detect(struct rmi_function *fn)
 
 	f55->num_rx_electrodes = f55->qry[F55_NUM_RX_OFFSET];
 	f55->num_tx_electrodes = f55->qry[F55_NUM_TX_OFFSET];
+	if (!f55->num_rx_electrodes || !f55->num_tx_electrodes) {
+		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
+			"F55 query returned no electrodes, giving up\n");
+		return 0;
+	}
 
 	f55->cfg_num_rx_electrodes = f55->num_rx_electrodes;
 	f55->cfg_num_tx_electrodes = f55->num_rx_electrodes;

-- 
2.47.2



