Return-Path: <linux-input+bounces-15378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4DBD2EA5
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C14254F13B8
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 12:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE1526E715;
	Mon, 13 Oct 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YokghtL8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5BD26E70B
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357427; cv=none; b=Qm2RheBa/duiS9MctKvDXqeG7eiZgivQjryaf+qtnui3peKyqbkaztF3rGs5VP4lyypoQiC6KdKdsQpA6Wi3fdW4OJoCGXAeGQrxaX/51tolU4sIpAiZ6XvE3w+W+fAXnnbHrfN3ZTtAmVKWO1CRJitt50/7fjJBa29PxDISvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357427; c=relaxed/simple;
	bh=wivhkUXo/4O0/lF+3ELW1hMVGkXZF7bUdL/v1WQ/JX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GwnEFTdoX2gSQF/4Tyqs3Xl49pcdMwCWiQz7gYJZsuwlwx38klcT424YE8zTfiCl89mSgDkzKa8KYfpKyPCb5/LNFlHZHY9F5yWB7k3MPAdgzv5TTyQih26GkEiLKqMAfc8sAnm1Iy5DhfEi65V/XSAMg9OC1/qjrAtbSBW2340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YokghtL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71931C4CEF8;
	Mon, 13 Oct 2025 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760357427;
	bh=wivhkUXo/4O0/lF+3ELW1hMVGkXZF7bUdL/v1WQ/JX8=;
	h=From:To:Cc:Subject:Date:From;
	b=YokghtL8/BRJ3Mo9hMxaLRoDpjkzotsVpmud0C8T/OH5JRPtkMvxERMxNGoAMMGCH
	 KUvNiI+jODAMwAYoWOfB9UViFbcTnVp0bOVNnl/5nxGwV4cM4cQVpsIkSNX7epnxol
	 RUQqFWVocVTwcJdcX8Jr59inajjob6Ho2lCMkEjKF64CvQeeAjHb5u9uyjgGJFKWzi
	 FVOROJpiUwQEY1n6dpzDvQyvX4q33dixZdl5uhaLNuDqE6Uw2uMPxosaUxbV0onFcW
	 6pgrig62ZjL5Qwqn3GNmZdKqmmcsFlQXtiHK7kyBP7tKltczsLQzL9EVj/UZ3qSKVr
	 QtdwBKJsHWi2A==
From: Hans de Goede <hansg@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Weikang Guo <guoweikang.kernel@gmail.com>
Subject: [PATCH resend] Input: goodix - add support for ACPI ID GDIX1003
Date: Mon, 13 Oct 2025 14:10:22 +0200
Message-ID: <20251013121022.44333-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

Some newer devices use an ACPI hardware ID of GDIX1003 for their Goodix
touchscreen controller, instead of GDIX1001 / GDIX1002. Add GDIX1003
to the goodix_acpi_match[] table.

Reported-by: Weikang Guo <guoweikang.kernel@gmail.com>
Closes: https://lore.kernel.org/linux-input/20250225024409.1467040-1-guoweikang.kernel@gmail.com/
Tested-by: Weikang Guo <guoweikang.kernel@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 252dcae039f8..5551decb8d22 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1557,6 +1557,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
 static const struct acpi_device_id goodix_acpi_match[] = {
 	{ "GDIX1001", 0 },
 	{ "GDIX1002", 0 },
+	{ "GDIX1003", 0 },
 	{ "GDX9110", 0 },
 	{ }
 };
-- 
2.51.0


