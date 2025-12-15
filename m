Return-Path: <linux-input+bounces-16586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5141CBEB6B
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 16:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00EF0307D47F
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 15:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32011348447;
	Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFnn5rK5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EE347FF4;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809006; cv=none; b=B9+8USOTTYXKqx9Oyb6eD/kEk0077CNjMTMN/6VceNQlSUdeiGG2fGxXelHWCr9h2AVM0TWY0/IyvrRyjOEjUm5fmsbhaOsB2RZc1n9yqCfs+CicyFMJjgv1sI04eA3sETAYihKLJ9tRHbrMZK0wP1jhN3/9biVynbgITkweEwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809006; c=relaxed/simple;
	bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BGeZtj0uXVPXxHzwaa8mb4PtoTzt92uMMt355JfLfuf9e2sQ1S0xKoe8PY7vCfyMiur/hyJCC3WIZcfxQ2SQkiQjtiLIxri+NzY5eNVfLbK1PvfVxm9YZzW3+nFhcO6A1qw2OSkWlv26EBZst/qDXKAZI/Y9SFs0CWOH3jLtP44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFnn5rK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A222C4CEFB;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eFnn5rK5ZJjeC1GTOsEbqEYZXSPAtLC0k+0D/HS9BqcX1hlOTZbnx7sI4XYrgQSuE
	 2Iehherh73rkKYUZt4iEMaQEJIdy3qtNBqZNfcUYov9EIFdIbl8roLERrJx9e1ao6d
	 nu9Ktfu6077v8ejNFSHspvsctRrDO/lE/RXCNJMqf0aeU0GA27PjCrLasW63uAm7n7
	 tKxL+4zMxEtSeY7Tcka3zwVnpCHY+CD6BRg2rwOfrkdyBI7DizBcWRMtu6G+MZAEW2
	 t4fzp5qnp75/gclDvKK0fqhc4QZ/On67N2zCvAYSH754M2fISCnba/M7M3FyoEuq/m
	 lTJw4kZ2pxR5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5FAD5B16F;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] Input: small nitpick fixes
Date: Mon, 15 Dec 2025 15:30:00 +0100
Message-Id: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGgbQGkC/x2KOwqAMAxAr1IyG7ApDvUq4iA21SxVGhGheHeD4
 /s0UK7CCqNrUPkWlaMY+M7Bui9lY5RkDNTT4MkT5ksxy8OKwVTIiSOlCPaflf9g+zS/7wfDWL/
 wWwAAAA==
X-Change-ID: 20251212-fts-fixes-30253fde92d9
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtraKyNehUYf6Zq6STWquVGzPauk3f3hyPmo
 SDg/syWgFuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 cnymD/4+NtvqTd1F7d46ZcugHEDVrc8ViX33x3uIbtImJbzqS1A+MAec4i6/CM31tn4plgGWqWy
 6EypuPlpKe3sXz0yXKC6JeGjQA9mQiuKldrE1AyJSOI2wN+YlY+j1mjfwSETttukIHytCTV0nbf
 irO7tc+AFrOzqBS84eAj9ndDdQp7LCXjSBznGgnCLJKzREM00nrKhlZMxgI7sFbDD3yTjXNPce1
 M+XR7AYGoHD5B6hNRAUDEbXY/7+BFRCkvgEozGB+A4uc7yqaPDU1ILb56vfj1IavErElxFWq4pt
 j73h/x7YHjrM3RsZAjAMaEpAHp162W5xOCfYzVmcW0Ldch+Cd+3pxGYsFayjfqq7V1AukSQy94n
 1wgsvafywp/tx8HPPNQf/GWLhhOhUFzJR9s3pA0HQrDcZte6mAI+m1mw3GMg4mAyR3Y0rkZHqv0
 prczUCdbQbTjBsGu+bhigFIMlCnwBm96sYKm8Dipxnfro++8FCv/RWfuj2CUOa0kJuwylkmT9RG
 HOlLXX8pcQdXOpZPwa8vGZoZvZcox/6BETTxeCARd9R1txymFGXBY0dPXvcZ8q6KF/0pwKwHKWE
 uy8fNM5yr9XrYOCMLDOznJL8huvL/ZiRudqnhXqaVPIdmDyIf5iCm14FRfejA/MSEwKg7FKEL2h
 sVYg2BC42MPHhNw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Feel free to ignore the last patch, if you want to wait for FTS5
support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (1):
      Input: stmfts - correct wording for the warning message

Petr Hodina (3):
      Input: stmfts - Make comments correct
      Input: stmfts - use sysfs_emit() instead of sprintf()
      Input: stmfts - use client to make future code cleaner

 drivers/input/touchscreen/stmfts.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251212-fts-fixes-30253fde92d9

Best regards,
-- 
David Heidelberg <david@ixit.cz>



