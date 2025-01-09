Return-Path: <linux-input+bounces-9119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3CA08248
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 22:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4821889B3D
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 21:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84467202C43;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiS46GID"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1961ACEAE;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458702; cv=none; b=oqU/ruZpiyEK8rVDpeDNJb7Dx4laRNL8V/Jj92oPumbsXMEZ29IG2/bXuEOSsCPban24/CEjdOHwHpYSP9f2WLKr2L/Gu2bAh2NmKyYTanykp9vjRpUrC1fVSDIXJL2X3xjiPa6WEM4ElWmiHPS6rsx1gCwE1hBtqDdTW7rMhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458702; c=relaxed/simple;
	bh=lHm82/t+lVL3wg0HCbo17rZj9DtiUeFI/8E57JUw6DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rs56KXFO4s3jIYNwSGL6k2rmqMIrenATHBEPXx1kESxBYpSwUFbm9Nlq2vidRhZnO5PFniXT1iyHc96LTZ83aRmb+fXC7W+dbTuIkcaYZ9C7OXrZkN6mpUk28pKGZTWJaXMFNIb3gXIxok5AEEasRTKJnpSsxL4aVFkEtZpYZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiS46GID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C0EAC4CEE2;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458702;
	bh=lHm82/t+lVL3wg0HCbo17rZj9DtiUeFI/8E57JUw6DI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JiS46GIDqAYwGNmWYNMxULHYh+bESaYvRroF6t3swUDtByA5xRvlnRXwlO/tdXra5
	 3AvI7cGO5gpoic8iUSsWbtEYDeyMOZe6rhFRKJ35fXGK4cBCVK5cl4RF3bSLeOphGi
	 b4Gc1NIFf9l6FR7t0ZqNQ9BLa7Sf/iTt9yivMOabiibXcJ10xNVXPlcpBQ4FNhGbet
	 WFg4wdf3bxz5amSXrPc1GW/zx+8EBGwl8HVwfbtLoLuf4MEuhmFu+O4xFf4rNt6cQq
	 uv/2wExOtFqq7+s4l0u/yfYE0sYhthFqU11enSvNhTX5YRQ+7k0kYR7SA1MZ5ujgUt
	 cB5FvYPkaZILQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35245E7719C;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekodevelopper.gmail.com@kernel.org>
Date: Fri, 10 Jan 2025 00:37:48 +0300
Subject: [PATCH v3 2/4] input: cyttsp5: improve read size
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-nekocwd-upstreaming-cyttsp5-v3-2-b33659c8effc@gmail.com>
References: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
In-Reply-To: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=nekodevelopper@gmail.com; h=from:subject:message-id;
 bh=3F8l24mMNC3+oYN1LDuYXU58jg8ObsK3gJ6DuKE3OoQ=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNIbHM9oRe3KnDaD709YrWrb9MsHthw5eHTV1ukX9tUwX
 iht5mq+1VHKwiDGxSArpshis9Fjtlh+uOSkaU8VYOawMoEMYeDiFICJ3LjFyHAlf/mygpkXpJ+m
 Pvm8b5Jst/5FuyCp9NRpkk6f0hqjP/9gZHi6uX3nya5dJy4+iMiLW9NwbavthRcCavuvXz10faf
 Z5hfcAA==
X-Developer-Key: i=nekodevelopper@gmail.com; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582
X-Endpoint-Received: by B4 Relay for nekodevelopper@gmail.com/default with
 auth_id=314
X-Original-From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
Reply-To: nekodevelopper@gmail.com

From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>

Before PIP 1.7 empty buffer is 0x0002
From PIP 1.7, empty buffer is 0xFFXX

Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Vasiliy Doylov (NekoCWD) <nekodevelopper@gmail.com>
---
 drivers/input/touchscreen/cyttsp5.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index ef74b4f190351b99c0722b38ae5fa491a4087ffe..4b73b1abc7e449b2dd0c453b816ce7887d9ddb0e 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -27,6 +27,7 @@
 #define CY_I2C_DATA_SIZE			(2 * 256)
 #define HID_VERSION				0x0100
 #define CY_MAX_INPUT				512
+#define CY_PIP_1P7_EMPTY_BUF			0xFF00
 #define CYTTSP5_PREALLOCATED_CMD_BUFFER		32
 #define CY_BITS_PER_BTN				1
 #define CY_NUM_BTN_EVENT_ID			GENMASK(CY_BITS_PER_BTN - 1, 0)
@@ -228,7 +229,11 @@ static int cyttsp5_read(struct cyttsp5 *ts, u8 *buf, u32 max)
 		return error;
 
 	size = get_unaligned_le16(temp);
-	if (!size || size == 2)
+	/*
+	 * Before PIP 1.7, empty buffer is 0x0002
+	 * From PIP 1.7, empty buffer is 0xFFXX
+	 */
+	if (!size || size == 2 || size >= CY_PIP_1P7_EMPTY_BUF)
 		return 0;
 
 	if (size > max)
@@ -708,7 +713,8 @@ static irqreturn_t cyttsp5_handle_irq(int irq, void *handle)
 	if (size == 0) {
 		/* reset */
 		report_id = 0;
-		size = 2;
+	} else if (size == 2 || size >= CY_PIP_1P7_EMPTY_BUF) {
+		return IRQ_HANDLED;
 	} else {
 		report_id = ts->input_buf[2];
 	}
@@ -744,7 +750,7 @@ static int cyttsp5_deassert_int(struct cyttsp5 *ts)
 		return error;
 
 	size = get_unaligned_le16(&buf[0]);
-	if (size == 2 || size == 0)
+	if (size == 2 || size == 0 || size >= CY_PIP_1P7_EMPTY_BUF)
 		return 0;
 
 	return -EINVAL;

-- 
2.47.1



