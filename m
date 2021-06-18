Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E353ACE5F
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 17:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhFRPPX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 11:15:23 -0400
Received: from fallback21.m.smailru.net ([94.100.176.131]:43428 "EHLO
        fallback21.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbhFRPPV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 11:15:21 -0400
X-Greylist: delayed 1251 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Jun 2021 11:15:21 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=ijK73F/lg2DhM4aUQACgPn0lF4hO8YJZvqHfVCtI7Wg=;
        b=CQIjPLKL8+RTtm1XOzCzFJIM8sDosonpgqq35hk9oVPae8bAP8o3V3BaMJICgjN2R3WB/mbXouNK+kaOKML2KVJNCuNZrjSSKteUWApv4l5b9s/yFllzlDnkZLCXQzkkrJoJZWY1JL8Xq93eBzJb2r/MUr/uehCE4MvuRv93naY=;
Received: from [10.161.64.57] (port=47696 helo=smtp49.i.mail.ru)
        by fallback21.m.smailru.net with esmtp (envelope-from <cerg2010cerg2010@mail.ru>)
        id 1luFqy-0003J4-9r
        for linux-input@vger.kernel.org; Fri, 18 Jun 2021 17:52:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=ijK73F/lg2DhM4aUQACgPn0lF4hO8YJZvqHfVCtI7Wg=;
        b=EDi2Plvg1/ja+JijN4zKK6hejdvt+Q6zz9/M0jk4H+0vZdl3MUzgDkSaYnK7TCd8BijmkQrdAVel8ondsmxT4e39HykgMuYtdV6Z3Tw18yBbJyBI97P/g/WvUu+b7fNRVoNkj3W26C7A+eceFWw1aRRJZ6gzhQHVd8YIagxKVKY=;
Received: by smtp49.i.mail.ru with esmtpa (envelope-from <cerg2010cerg2010@mail.ru>)
        id 1luFqq-0001bv-09; Fri, 18 Jun 2021 17:52:08 +0300
From:   Sergey Larin <cerg2010cerg2010@mail.ru>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH] Input: stmpe-keypad - add STMPE1801 support
Date:   Fri, 18 Jun 2021 17:51:49 +0300
Message-Id: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD91C2C07775F13263A075164279ADA4DEE4DF6CBEA76D0A4B700894C459B0CD1B96A756C19C813DA90BB093D7B977E284D4A4F2FA72D6FC0293DBFFC9DE3409321
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73C696014E2DCCA1EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E78B284398E2029E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F8B8055A963F40B626E7A556CE19E2A76F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7850F8B975A76562C9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B44DFDAE72D78788F389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006379B52A4D16EC328CCD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE74FED4A516E967888EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C330F6261E3B51B4EA089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C128C1281A48FD13C64F4A1F1B4D66FAFC7E6C40DD18CCA4C9C2B6934AE262D3EE7EAB7254005DCED3E00E3B59223EED21E0A4E2319210D9B64D260DF9561598F01A9E91200F654B0F5DD670F6F5D62878E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3451BBE684D17D7221757BAAD8DC2B9EAAD333B539987F6C4E5B7FB3CC35ECC8C531AD0C459A615C441D7E09C32AA3244C3855E112C3B7D6A21133044E8F827AA65595C85A795C7BAEAD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj0Roc5o5ut94anVs539TTpA==
X-Mailru-Sender: 24CCEAA761B392C83D438B890C7CDC3C81E547FAADE5F02D8733E1D2EFA86DA86CCF71F689FD47EECAD91EC71FC00F3837D2A27E1A8065646C7A2150F6097340301919DCEDD5454186FA049C4F996C4B5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B410D8DD6B135161BA28D653132209B9338FAF0156F5E2581168F3CF0E9FE49B696761BFB32D813BC38047C6BC8F65DCC4CE2A18C5ED1C843CDAB479C00DD212BA
X-7FA49CB5: 0D63561A33F958A57C1EECB0AB756495BCF02D4676FC7419E4E070570250E91FCACD7DF95DA8FC8BD5E8D9A59859A8B6EC9D17400D464069CC7F00164DA146DAFE8445B8C89999728AA50765F7900637A596F99EC23ACBE8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC881F3E54FD4568659F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C0072D29C69FDE18FC0837EA9F3D197644AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B6D524144DA2BB852D089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C128C1281A48FD13C69A9AF90091ED513D05A9425F35AEDF79C2B6934AE262D3EE7EAB7254005DCED3E00E3B59223EED2699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj0Roc5o5ut97swu7i9ZQEuQ==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005989B929F85CCF095F16A636BE368A6353481655C9934AD45FA95C477BC5130F8CAD91EC71FC00F3837D2A27E1A8065646C7A2150F6097340301919DCEDD5454186FA049C4F996C4B5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This chip variant differs from others - it has different register
map and swapped rows/columns.

Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
---
 drivers/input/keyboard/stmpe-keypad.c | 108 ++++++++++++++++++++------
 1 file changed, 85 insertions(+), 23 deletions(-)

diff --git a/drivers/input/keyboard/stmpe-keypad.c b/drivers/input/keyboard/stmpe-keypad.c
index 7bf97285e30c..ed74578927a3 100644
--- a/drivers/input/keyboard/stmpe-keypad.c
+++ b/drivers/input/keyboard/stmpe-keypad.c
@@ -13,7 +13,7 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/mfd/stmpe.h>
 
-/* These are at the same addresses in all STMPE variants */
+/* These are at the same addresses in all STMPE variants, except 1801 */
 #define STMPE_KPC_COL			0x60
 #define STMPE_KPC_ROW_MSB		0x61
 #define STMPE_KPC_ROW_LSB		0x62
@@ -42,14 +42,15 @@
 #define STMPE_KEYPAD_MAX_DEBOUNCE	127
 #define STMPE_KEYPAD_MAX_SCAN_COUNT	15
 
-#define STMPE_KEYPAD_MAX_ROWS		8
-#define STMPE_KEYPAD_MAX_COLS		8
+#define STMPE_KEYPAD_MAX_ROWS		10
+#define STMPE_KEYPAD_MAX_COLS		12
 #define STMPE_KEYPAD_ROW_SHIFT		3
 #define STMPE_KEYPAD_KEYMAP_MAX_SIZE \
 	(STMPE_KEYPAD_MAX_ROWS * STMPE_KEYPAD_MAX_COLS)
 
 
 #define STMPE1601_NUM_DATA	5
+#define STMPE1801_NUM_DATA	5
 #define STMPE2401_NUM_DATA	3
 #define STMPE2403_NUM_DATA	5
 
@@ -67,6 +68,12 @@
  * @max_rows: maximum number of rows supported
  * @col_gpios: bitmask of gpios which can be used for columns
  * @row_gpios: bitmask of gpios which can be used for rows
+ * @col_regs: registers for setting column pins
+ * @row_regs: registers for setting row pins
+ * @data_regs: registers for reading key data
+ * @ctrl_msb_reg: register for setting scan count
+ * @ctrl_lsb_reg: register for setting debounce time
+ * @cmd_reg: register for toggling scan mode
  */
 struct stmpe_keypad_variant {
 	bool		auto_increment;
@@ -77,6 +84,18 @@ struct stmpe_keypad_variant {
 	int		max_rows;
 	unsigned int	col_gpios;
 	unsigned int	row_gpios;
+
+#define MAX_COL_REGS 3
+#define MAX_ROW_REGS 3
+#define MAX_DATA_REGS 5
+
+	u8 col_regs[MAX_COL_REGS];
+	u8 row_regs[MAX_ROW_REGS];
+	u8 data_regs[MAX_DATA_REGS];
+	u8 ctrl_msb_reg;
+	u8 ctrl_lsb_reg;
+	u8 cmd_reg;
+	bool read_inverted;
 };
 
 static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
@@ -88,6 +107,29 @@ static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
 		.max_rows		= 8,
 		.col_gpios		= 0x000ff,	/* GPIO 0 - 7 */
 		.row_gpios		= 0x0ff00,	/* GPIO 8 - 15 */
+		.col_regs		= { 0x60 },
+		.row_regs		= { 0x62, 0x61 },
+		.data_regs		= { 0x68, 0x69, 0x6a, 0x6b, 0x6c },
+		.ctrl_msb_reg		= 0x63,
+		.ctrl_lsb_reg		= 0x64,
+		.cmd_reg		= 0x64,
+		.read_inverted		= 0,
+	},
+	[STMPE1801] = {
+		.auto_increment		= true,
+		.num_data		= STMPE1801_NUM_DATA,
+		.num_normal_data	= 3,
+		.max_cols		= 10,
+		.max_rows		= 8,
+		.col_gpios		= 0x3ff00,	/* GPIO 8 - 17 */
+		.row_gpios		= 0x000ff,	/* GPIO 0 - 7 */
+		.col_regs		= { 0x31, 0x32 },
+		.row_regs		= { 0x30 },
+		.data_regs		= { 0x3a, 0x3b, 0x3c, 0x3d, 0x3e },
+		.ctrl_msb_reg		= 0x33,
+		.ctrl_lsb_reg		= 0x34,
+		.cmd_reg		= 0x36,
+		.read_inverted		= 1,
 	},
 	[STMPE2401] = {
 		.auto_increment		= false,
@@ -98,6 +140,13 @@ static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
 		.max_rows		= 12,
 		.col_gpios		= 0x0000ff,	/* GPIO 0 - 7*/
 		.row_gpios		= 0x1f7f00,	/* GPIO 8-14, 16-20 */
+		.col_regs		= { 0x60 },
+		.row_regs		= { 0x62, 0x61 },
+		.data_regs		= { 0x68, 0x69, 0x6a, 0x6b, 0x6c },
+		.ctrl_msb_reg		= 0x63,
+		.ctrl_lsb_reg		= 0x64,
+		.cmd_reg		= 0x64,
+		.read_inverted		= 0,
 	},
 	[STMPE2403] = {
 		.auto_increment		= true,
@@ -108,6 +157,13 @@ static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
 		.max_rows		= 12,
 		.col_gpios		= 0x0000ff,	/* GPIO 0 - 7*/
 		.row_gpios		= 0x1fef00,	/* GPIO 8-14, 16-20 */
+		.col_regs		= { 0x60 },
+		.row_regs		= { 0x62, 0x61 },
+		.data_regs		= { 0x68, 0x69, 0x6a, 0x6b, 0x6c },
+		.ctrl_msb_reg		= 0x63,
+		.ctrl_lsb_reg		= 0x64,
+		.cmd_reg		= 0x64,
+		.read_inverted		= 0,
 	},
 };
 
@@ -145,11 +201,11 @@ static int stmpe_keypad_read_data(struct stmpe_keypad *keypad, u8 *data)
 	int i;
 
 	if (variant->auto_increment)
-		return stmpe_block_read(stmpe, STMPE_KPC_DATA_BYTE0,
+		return stmpe_block_read(stmpe, variant->data_regs[0],
 					variant->num_data, data);
 
 	for (i = 0; i < variant->num_data; i++) {
-		ret = stmpe_reg_read(stmpe, STMPE_KPC_DATA_BYTE0 + i);
+		ret = stmpe_reg_read(stmpe, variant->data_regs[i]);
 		if (ret < 0)
 			return ret;
 
@@ -176,7 +232,9 @@ static irqreturn_t stmpe_keypad_irq(int irq, void *dev)
 		u8 data = fifo[i];
 		int row = (data & STMPE_KPC_DATA_ROW) >> 3;
 		int col = data & STMPE_KPC_DATA_COL;
-		int code = MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);
+		int code = variant->read_inverted ?
+			  MATRIX_SCAN_CODE(col, row, STMPE_KEYPAD_ROW_SHIFT)
+			: MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);
 		bool up = data & STMPE_KPC_DATA_UP;
 
 		if ((data & STMPE_KPC_DATA_NOKEY_MASK)
@@ -265,7 +323,7 @@ static int stmpe_keypad_chip_init(struct stmpe_keypad *keypad)
 {
 	const struct stmpe_keypad_variant *variant = keypad->variant;
 	struct stmpe *stmpe = keypad->stmpe;
-	int ret;
+	int ret, val, i;
 
 	if (keypad->debounce_ms > STMPE_KEYPAD_MAX_DEBOUNCE)
 		return -EINVAL;
@@ -281,33 +339,37 @@ static int stmpe_keypad_chip_init(struct stmpe_keypad *keypad)
 	if (ret < 0)
 		return ret;
 
-	ret = stmpe_reg_write(stmpe, STMPE_KPC_COL, keypad->cols);
-	if (ret < 0)
-		return ret;
-
-	ret = stmpe_reg_write(stmpe, STMPE_KPC_ROW_LSB, keypad->rows);
-	if (ret < 0)
-		return ret;
+	val = keypad->cols;
+	i = 0;
+	do {
+		ret = stmpe_reg_write(stmpe, variant->col_regs[i++], val & 0xff);
+		if (ret < 0)
+			return ret;
+	} while ((val >>= 8) != 0);
 
-	if (variant->max_rows > 8) {
-		ret = stmpe_set_bits(stmpe, STMPE_KPC_ROW_MSB,
-				     STMPE_KPC_ROW_MSB_ROWS,
-				     keypad->rows >> 8);
+	val = keypad->rows;
+	i = 0;
+	do {
+		ret = stmpe_reg_write(stmpe, variant->row_regs[i++], val & 0xff);
 		if (ret < 0)
 			return ret;
-	}
+	} while ((val >>= 8) != 0);
 
-	ret = stmpe_set_bits(stmpe, STMPE_KPC_CTRL_MSB,
+	ret = stmpe_set_bits(stmpe, variant->ctrl_msb_reg,
 			     STMPE_KPC_CTRL_MSB_SCAN_COUNT,
 			     keypad->scan_count << 4);
 	if (ret < 0)
 		return ret;
 
-	return stmpe_set_bits(stmpe, STMPE_KPC_CTRL_LSB,
-			      STMPE_KPC_CTRL_LSB_SCAN |
+	ret = stmpe_set_bits(stmpe, variant->ctrl_lsb_reg,
 			      STMPE_KPC_CTRL_LSB_DEBOUNCE,
-			      STMPE_KPC_CTRL_LSB_SCAN |
 			      (keypad->debounce_ms << 1));
+	if (ret < 0)
+		return ret;
+
+	return stmpe_set_bits(stmpe, variant->cmd_reg,
+			      STMPE_KPC_CTRL_LSB_SCAN,
+			      STMPE_KPC_CTRL_LSB_SCAN);
 }
 
 static void stmpe_keypad_fill_used_pins(struct stmpe_keypad *keypad,
-- 
2.32.0

