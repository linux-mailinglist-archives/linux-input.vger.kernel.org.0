Return-Path: <linux-input+bounces-9123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CDFA0824C
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 22:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05551658B7
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 21:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA37204F6C;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBCYR7A4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBC204C2B;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458702; cv=none; b=b4Sex3Qbqsy+n0mXV9snYk6yhBU0/YzyxGJCHA1sXI6K6AAfkvrMruRSypsMv0KT1PVAluyCLxaFBzweP6fpLFOt/DOX6FN5Xb6cCNocPa2EUzWOpblu1HCmRTgVhzMD5NaJY1pPGe39S2hlR+AeqrPcvmLxaLP/2l+f7VtmiZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458702; c=relaxed/simple;
	bh=TelbDcZ86fRlwjmAlHGmpAZmmawkPgbYVxySpRDjeJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h4hG3+zbtTjCfb5clvL2akNiM5ReY9r9mpN+e7UkGnwnxYe1JRvsRifUNljyfQRSE6O6ilweLzS4xeApkBT0ldJKXOprPPPH2OT5wc9axPqE1ZPfHrmTzMKDCCUbQs3JVoWlFmGjOJJ07nw6mOJcZHWRBOOVByF20bjGDUsR6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBCYR7A4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A7E1C4CEE4;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458702;
	bh=TelbDcZ86fRlwjmAlHGmpAZmmawkPgbYVxySpRDjeJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CBCYR7A4TzJ82dpigjvuiwp8OnZ9rDkHSqXjyCI1bkCbYF/tQeDs9/KkhWGSeX5u/
	 KL37voBjGDing05sOMG80LM579kucJeNzqA6icPnDfSAjQMcujoeylUIOClzD/7a7C
	 M5qXCG3dKyY0YfeYZh3LxcNtTq9CiYrwssVGI7w6AcRJBLoMGbO8u6lIZ/T7RdI/ka
	 IpeJhvtkYEJZnj3m8J0sdQ16vkr+ENn4vh1uwff/z20PD4J+8eJ8zT7lANylI12GqW
	 s5HcynjkOKy9dlczLqtOPsEyFGTVcOzIH1SGA8ZCwdAku7O0n8bGsUeBr341s0vtWF
	 tF80WiYHsRunQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6109DE7719A;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekodevelopper.gmail.com@kernel.org>
Date: Fri, 10 Jan 2025 00:37:50 +0300
Subject: [PATCH v3 4/4] input: cyttsp5: add startup retry
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-nekocwd-upstreaming-cyttsp5-v3-4-b33659c8effc@gmail.com>
References: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
In-Reply-To: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2675;
 i=nekodevelopper@gmail.com; h=from:subject:message-id;
 bh=X51YJwi8tEku39ZDVrFKacvBYHetK/hiRJthYLceyxE=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNIbHM80Rk/+2NYxW+mLiUXIiv9N2bqGbyaqFmyamf3if
 OWSvS7RHaUsDGJcDLJiiiw2Gz1mi+WHS06a9lQBZg4rE8gQBi5OAZjIxhaG/3lXj65WMjpsay/H
 9c2jaHcbz5SSl+o6f9X7Wvv+X8qqLWH4H/zl3cRHYXWX77PNmpY1zU7knoJLteSsS7O/aNrzHVp
 qzAQA
X-Developer-Key: i=nekodevelopper@gmail.com; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582
X-Endpoint-Received: by B4 Relay for nekodevelopper@gmail.com/default with
 auth_id=314
X-Original-From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
Reply-To: nekodevelopper@gmail.com

From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>

Some firmware/configuration variants fails to start with first attempt.
Vendors drivers tries to start multiple times.

Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Vasiliy Doylov (NekoCWD) <nekodevelopper@gmail.com>
---
 drivers/input/touchscreen/cyttsp5.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 4860ce751c913c605d5f72dad66d1eba9825a900..c8771f44b8e35fcdbf278034f25b0be2bb392869 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -29,6 +29,7 @@
 #define CY_PIP_1P7_EMPTY_BUF			0xFF00
 #define CYTTSP5_PREALLOCATED_CMD_BUFFER		32
 #define CY_BITS_PER_BTN				1
+#define CY_CORE_STARTUP_RETRY_COUNT		10
 #define CY_NUM_BTN_EVENT_ID			GENMASK(CY_BITS_PER_BTN - 1, 0)
 
 #define MAX_AREA				255
@@ -824,8 +825,10 @@ static int cyttsp5_fill_all_touch(struct cyttsp5 *ts)
 
 static int cyttsp5_startup(struct cyttsp5 *ts)
 {
+	int retry = CY_CORE_STARTUP_RETRY_COUNT;
 	int error;
 
+reset:
 	error = cyttsp5_deassert_int(ts);
 	if (error) {
 		dev_err(ts->dev, "Error on deassert int r=%d\n", error);
@@ -834,6 +837,8 @@ static int cyttsp5_startup(struct cyttsp5 *ts)
 	error = cyttsp5_get_hid_descriptor(ts, &ts->hid_desc);
 	if (error < 0) {
 		dev_err(ts->dev, "Error on getting HID descriptor r=%d\n", error);
+		if (retry--)
+			goto reset;
 		return error;
 	}
 
@@ -845,17 +850,23 @@ static int cyttsp5_startup(struct cyttsp5 *ts)
 		error = cyttsp5_hid_output_bl_launch_app(ts);
 		if (error < 0) {
 			dev_err(ts->dev, "Error on launch app r=%d\n", error);
+			if (retry--)
+				goto reset;
 			return error;
 		}
 
 		error = cyttsp5_get_hid_descriptor(ts, &ts->hid_desc);
 		if (error < 0) {
 			dev_err(ts->dev, "Error on getting HID descriptor r=%d\n", error);
+			if (retry--)
+				goto reset;
 			return error;
 		}
 
 		if (ts->hid_desc.packet_id == HID_BL_REPORT_ID) {
 			dev_err(ts->dev, "Error on launch app still in bootloader\n");
+			if (retry--)
+				goto reset;
 			return -EPROTO;
 		}
 	}
@@ -863,12 +874,16 @@ static int cyttsp5_startup(struct cyttsp5 *ts)
 	error = cyttsp5_fill_all_touch(ts);
 	if (error < 0) {
 		dev_err(ts->dev, "Error on report descriptor r=%d\n", error);
+		if (retry--)
+			goto reset;
 		return error;
 	}
 
 	error = cyttsp5_hid_output_get_sysinfo(ts);
 	if (error) {
 		dev_err(ts->dev, "Error on getting sysinfo r=%d\n", error);
+		if (retry--)
+			goto reset;
 		return error;
 	}
 

-- 
2.47.1



