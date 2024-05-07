Return-Path: <linux-input+bounces-3585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAFE8BF1A3
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 01:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A72328196B
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 23:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EFD1448F6;
	Tue,  7 May 2024 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htPpgi+s"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAD1448F1;
	Tue,  7 May 2024 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123347; cv=none; b=Wq1PeSoHEJJmGRJXrKYewto166muVBDir7OSAH9/dHytkBSG3RGN1ix/ZTl2ZXGlAfHR/ZL09yh99qmSEIBGrLnv0KpKxCxVF1IUWC96CWK/Nlftz2Ff+Re443lE0Pc5561Pc3P1d5Gz0kfmuTC03qj23EHF38d06+uzCvKyd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123347; c=relaxed/simple;
	bh=bx1UlMCjaomhWcxGibZRAgeKFjpnOPjnJG0euG0Q+Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VhwTstbiL9cPERjCxwvmtet6Hf4uiqhjru0VXp66M6IbJAFpJjAPL6OSLwz2IZzzaC0F+BjxZPBax7QMkKAi+fPs0iDWCEQShiSsW7BhciIsCAZsegSG6RbeRf+XOsD+BfqOy9gtRJE4rBhiQ+Yi4/k8mKWcDmK6jpkqfwoMzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htPpgi+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959EFC4AF17;
	Tue,  7 May 2024 23:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123347;
	bh=bx1UlMCjaomhWcxGibZRAgeKFjpnOPjnJG0euG0Q+Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=htPpgi+sqJdKrVUWlF8u+h5t7DKHhLjDRNbizZjrIqXmwofKZVvsZRM42Dz498IRR
	 q5u+VrbBEQmrblcwFxGQ6TLPRxTF5j3T92Ns3eiAqAsxTNvxkAqWnKWXQCN5QQiEYp
	 tWrng0+uC/DTRHuClJSkeQJAzlAf1uYKOiWsfq7YRZ9kAOnxv0gkSevBeVt2INWNIh
	 XUiIRKFUdyIZB8EXAQJh+Jhr6Ou35JGo9w9GL7wXdnsjhd0ctmQyBQU0aBjww0fcfU
	 yT0FlGXRO1Dyrk7g78zSsHBJB9J1Rz+tog1Jpl276xuxJ1FUp5EWuOq8FKbknuO/7W
	 oqMZyhWtuEzTA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 34/52] Input: amimouse - mark driver struct with __refdata to prevent section mismatch
Date: Tue,  7 May 2024 19:07:00 -0400
Message-ID: <20240507230800.392128-34-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[ Upstream commit 0537c8eef4f699aacdeb67c6181c66cccd63c7f5 ]

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in reference: amimouse_driver+0x8 (section: .data) -> amimouse_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Link: https://lore.kernel.org/r/2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/mouse/amimouse.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/amimouse.c b/drivers/input/mouse/amimouse.c
index cda0c3ff5a288..2fbbaeb76d708 100644
--- a/drivers/input/mouse/amimouse.c
+++ b/drivers/input/mouse/amimouse.c
@@ -132,7 +132,13 @@ static void __exit amimouse_remove(struct platform_device *pdev)
 	input_unregister_device(dev);
 }
 
-static struct platform_driver amimouse_driver = {
+/*
+ * amimouse_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver amimouse_driver __refdata = {
 	.remove_new = __exit_p(amimouse_remove),
 	.driver   = {
 		.name	= "amiga-mouse",
-- 
2.43.0


