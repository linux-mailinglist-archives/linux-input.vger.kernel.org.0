Return-Path: <linux-input+bounces-6539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1760978953
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 22:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C1641F2483F
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 20:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC6D146593;
	Fri, 13 Sep 2024 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TM26i7vJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AABBA2E;
	Fri, 13 Sep 2024 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726258120; cv=none; b=jbCetfBz+w6Zp3T9l5iCII1ufcg0JcRGoWwtVD3NF862G+buR9t66HzbTIW0FYpBE8rbZttAPK/IUsrKF85HrIKiFS5AWrHLYlPyEmDNCl7K2xD+fXr5nJyiEJSrOdrcRYhYGHO0Nnma6fHPU8Ux7Znfc1kJowymraVjhm5+cjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726258120; c=relaxed/simple;
	bh=dxFpgDa+4nXBtmbI56A2QbjsBwTKl2xZ/2KbD9wx+r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3FyOPBSPSKH6SXJuBE2YtL4WiwxcZGSZWZRv25U6uMCCcYbFjqweY4jNsKmrI5McXznqc8FkgkGnghScgPg6SPr/j+WsDjy6+p9el96Ldi2N+uzJH4jHd7iA7v7Zfo8pQjjRE8M1EGHtKaWagge5RpczD1i/g2wnncBeLEajKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TM26i7vJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AFAC4CEC0;
	Fri, 13 Sep 2024 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726258120;
	bh=dxFpgDa+4nXBtmbI56A2QbjsBwTKl2xZ/2KbD9wx+r0=;
	h=From:To:Cc:Subject:Date:From;
	b=TM26i7vJ0x94FaRh1n8zzhJ/I4T62T6iOXhlaIMsYfWNv+2ruRcxmqgmyf0JVmvAh
	 yusD4EwybmdTyKHcDcY33cu7snLzI0IjsHWNKx9Jk1zy6pRbZJk0bEojV13p9Ua/IL
	 jOcg51spC6rIYNzwN+Y5I3Da0zNodgKTuCK+OWkY6q/+InR/JIR2hQHQdEJvoNbdem
	 8+E6yIt4W0kFB0stSEYILC+VERGKUC7xRmFAagGAh/j8WmpuIfpWHo+oFrUvN7i2bR
	 M97lgoNpcxCUPDp85toxoEVjRvHwlCoZGnmfGYrwu8gsk7HkCR2HRyocFZ1Dm600dh
	 Ceom9+YJUTRgg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>,
	linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] input: tegra: Use of_property_read_variable_u32_array() and of_property_present()
Date: Fri, 13 Sep 2024 15:08:26 -0500
Message-ID: <20240913200827.546649-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to get the length of an DT array property before
parsing the array. of_property_read_variable_u32_array() takes a
minimum and maximum length and returns the actual length (or error
code).

This is part of a larger effort to remove callers of of_get_property()
and similar functions. of_get_property() leaks the DT property data
pointer which is a problem for dynamically allocated nodes which may
be freed.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix missing Sob
---
 drivers/input/keyboard/tegra-kbc.c | 72 +++++++++++-------------------
 1 file changed, 27 insertions(+), 45 deletions(-)

diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index 204ba189807e..6776dd94ce76 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -484,12 +484,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
 	struct device_node *np = kbc->dev->of_node;
 	u32 prop;
 	int i;
-	u32 num_rows = 0;
-	u32 num_cols = 0;
+	int num_rows;
+	int num_cols;
 	u32 cols_cfg[KBC_MAX_GPIO];
 	u32 rows_cfg[KBC_MAX_GPIO];
-	int proplen;
-	int ret;
 
 	if (!of_property_read_u32(np, "nvidia,debounce-delay-ms", &prop))
 		kbc->debounce_cnt = prop;
@@ -503,56 +501,23 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
 	    of_property_read_bool(np, "nvidia,wakeup-source")) /* legacy */
 		kbc->wakeup = true;
 
-	if (!of_get_property(np, "nvidia,kbc-row-pins", &proplen)) {
-		dev_err(kbc->dev, "property nvidia,kbc-row-pins not found\n");
-		return -ENOENT;
-	}
-	num_rows = proplen / sizeof(u32);
-
-	if (!of_get_property(np, "nvidia,kbc-col-pins", &proplen)) {
-		dev_err(kbc->dev, "property nvidia,kbc-col-pins not found\n");
-		return -ENOENT;
-	}
-	num_cols = proplen / sizeof(u32);
-
-	if (num_rows > kbc->hw_support->max_rows) {
-		dev_err(kbc->dev,
-			"Number of rows is more than supported by hardware\n");
-		return -EINVAL;
-	}
-
-	if (num_cols > kbc->hw_support->max_columns) {
-		dev_err(kbc->dev,
-			"Number of cols is more than supported by hardware\n");
-		return -EINVAL;
-	}
-
-	if (!of_get_property(np, "linux,keymap", &proplen)) {
+	if (!of_property_present(np, "linux,keymap")) {
 		dev_err(kbc->dev, "property linux,keymap not found\n");
 		return -ENOENT;
 	}
 
-	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
-		dev_err(kbc->dev,
-			"keypad rows/columns not properly specified\n");
-		return -EINVAL;
-	}
-
 	/* Set all pins as non-configured */
 	for (i = 0; i < kbc->num_rows_and_columns; i++)
 		kbc->pin_cfg[i].type = PIN_CFG_IGNORE;
 
-	ret = of_property_read_u32_array(np, "nvidia,kbc-row-pins",
-				rows_cfg, num_rows);
-	if (ret < 0) {
+	num_rows = of_property_read_variable_u32_array(np, "nvidia,kbc-row-pins",
+				rows_cfg, 1, KBC_MAX_GPIO);
+	if (num_rows < 0) {
 		dev_err(kbc->dev, "Rows configurations are not proper\n");
-		return -EINVAL;
-	}
-
-	ret = of_property_read_u32_array(np, "nvidia,kbc-col-pins",
-				cols_cfg, num_cols);
-	if (ret < 0) {
-		dev_err(kbc->dev, "Cols configurations are not proper\n");
+		return num_rows;
+	} else if (num_rows > kbc->hw_support->max_rows) {
+		dev_err(kbc->dev,
+			"Number of rows is more than supported by hardware\n");
 		return -EINVAL;
 	}
 
@@ -561,11 +526,28 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
 		kbc->pin_cfg[rows_cfg[i]].num = i;
 	}
 
+	num_cols = of_property_read_variable_u32_array(np, "nvidia,kbc-col-pins",
+				cols_cfg, 1, KBC_MAX_GPIO);
+	if (num_cols < 0) {
+		dev_err(kbc->dev, "Cols configurations are not proper\n");
+		return num_cols;
+	} else if (num_cols > kbc->hw_support->max_columns) {
+		dev_err(kbc->dev,
+			"Number of cols is more than supported by hardware\n");
+		return -EINVAL;
+	}
+
 	for (i = 0; i < num_cols; i++) {
 		kbc->pin_cfg[cols_cfg[i]].type = PIN_CFG_COL;
 		kbc->pin_cfg[cols_cfg[i]].num = i;
 	}
 
+	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
+		dev_err(kbc->dev,
+			"keypad rows/columns not properly specified\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.45.2


