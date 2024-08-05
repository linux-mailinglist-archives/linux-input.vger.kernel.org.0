Return-Path: <linux-input+bounces-5346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD20947ED1
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF241C20F76
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 15:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8A715A4AF;
	Mon,  5 Aug 2024 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="J4XfM9uQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="SdMOh3N5"
X-Original-To: linux-input@vger.kernel.org
Received: from fallback19.i.mail.ru (fallback19.i.mail.ru [79.137.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2F14901F;
	Mon,  5 Aug 2024 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722873522; cv=none; b=lnKkS+d6AxzTX9/9IpVO0baQQPhQaZ9lHKWm7gNLIGK8un6vJ9DaagjTR7QhIOa8s5nooEh3gKveSMewh0j/U4uO4txNzPMEJm8Z9aLi7tWAIChpfFMjV8ZtRz7paT3ErLvt9rCED6Xar3msEQj3JYN1gIhXI4IRNEwLQ1nEi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722873522; c=relaxed/simple;
	bh=/o7fdUSpEevSFZXLEevGNG6xsZwU1m3FEfZ4L71LGHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UStmoy3fvkWizH+srvkBMrrBbYy9PtAMi8ObxxvlxfIITBiv+o3Yl90wlKpZXIIB98Id7M/d79VRhO9sg1xHV6QHOpkHfRH8PtYq8GBhx+aZ6KC4W4q2s2cfpX/MF+iCi2bt15i7ko2OgpzmQ3frerQEA3vIobS0we4dLBReQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=J4XfM9uQ; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=SdMOh3N5; arc=none smtp.client-ip=79.137.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=VQL6/+jRmDq+RWYZaM4vmiHlLNSOGJQ/PBLzFpmF5z0=;
	t=1722873517;x=1722963517; 
	b=J4XfM9uQAfrmhx9TpG+x0DSe2ucbT9mSCXD0vfUgQySE6dDRZunxLQ9jF4a+m9cTjDWx4aeA0Nu2ohsrv2eenNcjo79HuI7NtiRQqDQ7QbPBoSiz2l5QQgmlGTQN5GFdo/Lqf3bNv2cWvawO8WTm7nnC6Mxq/c4ZQRKxQDx2YiE=;
Received: from [10.12.4.32] (port=53154 helo=smtp57.i.mail.ru)
	by fallback19.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sb06O-008q5X-9j; Mon, 05 Aug 2024 18:58:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=VQL6/+jRmDq+RWYZaM4vmiHlLNSOGJQ/PBLzFpmF5z0=; t=1722873508; x=1722963508; 
	b=SdMOh3N5QdBBWJL3qWJh0pINT76D7BP8EO7YOO8NBqcWTLHdvrfIc2FOEDUerycoZ0o8OtQXObT
	7T/hFfZnQCub+Yw+3w7TSpkzs8emGX+fYiTCdp9EPh+ke002HsPtERT/ZBnanaISg9bDwctgB0WWF
	VZytV9VxUxqZjUm4HVk=;
Received: by exim-smtp-548c4c4b6c-jc9tn with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sb068-00000000BRk-0HW1; Mon, 05 Aug 2024 18:58:12 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: hadess@hadess.net,
	hdegoede@redhat.com,
	dmitry.torokhov@gmail.com,
	neil.armstrong@linaro.org,
	jeff@labundy.com,
	krzk@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH] Input: goodix-berlin - Fix VDDIO regulator name according to dt-bindings
Date: Mon,  5 Aug 2024 18:58:06 +0300
Message-ID: <20240805155806.16203-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96F0A89E6F10F8FD719FCADC6D1D921C94D8B570832F306F0182A05F5380850408364D05678341FFB3DE06ABAFEAF670596DAB18083300139D2EF3BFD98E86F6AA65EC38BD4A67DDF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F2919D563845004AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637352A1F9739ED04D38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E408599121C697DD67FF1C9CD3E4420BB936B7125617A6A8CC7F00164DA146DAFE8445B8C89999728AA50765F79006370277CA7F994D7EF5389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80839144E5BB460BAF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CA6C7FFFE744CA7FB302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C397F497EB49C4C592BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE71D0063F52110EA4A731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A597AA1658B01787685002B1117B3ED696391F3258CA911A4DF09842853758E9E5823CB91A9FED034534781492E4B8EEADF12279BA039A6965C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9F7289DF140F6B8392DCDA45705B333A672C0630FA8A6DDC93C4F4660D9BF7969EC5AF04A575AA6C7E625F09773DF59AFF9AE61E034E90634BD43896EFA6A6CAC3E516E8FBC249A04759C7B6195DDAFE02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojj+FfUYRjItrGJsgt1/XxtA==
X-Mailru-Sender: A29E055712C5B697A0B4B50D4D88F0E8E879A87A7C2237C4B951B70A5BD4BD8E166B3F31B51BDFF5BC4EE72AB2E748C5210985D6C440852E55B4A2144138A88088F510C62CFD139357C462056C5AD9112068022A3E05D37EB4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4D18B7733AFD02D5BBCF79F375D8221874E275F66436248E2049FFFDB7839CE9E101C537ED636B3CB7058EA720B8ACD94E40E6747070BE0E82710AB88D75B52E2
X-7FA49CB5: 0D63561A33F958A5462875E13BB7BF5F1F6A5C3928C7C37F6C014E797AE6F5D48941B15DA834481FA18204E546F3947CCBF6BC0891A06A85F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063782D336B02A64FFBC389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C33F08D42084047B3C35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojj+FfUYRjItpxl73lRWpnMg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

The dt-bindings specify the regulator as "vddio" instead of "iovdd".

This patch fixes the regulator name from "iovdd" to "vddio" in the
driver code to align with the dt-bindings. Fixing the dt-bindings
would break ABI, hence the fix is made in the driver instead.

There are no users of this regulator сurrently.

Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../input/touchscreen/goodix_berlin_core.c    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 0bfca897ce5a..b5d6e6360fff 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -165,7 +165,7 @@ struct goodix_berlin_core {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator *avdd;
-	struct regulator *iovdd;
+	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
 	struct touchscreen_properties props;
 	struct goodix_berlin_fw_version fw_version;
@@ -248,22 +248,22 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
 {
 	int error;
 
-	error = regulator_enable(cd->iovdd);
+	error = regulator_enable(cd->vddio);
 	if (error) {
-		dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
+		dev_err(cd->dev, "Failed to enable vddio: %d\n", error);
 		return error;
 	}
 
-	/* Vendor waits 3ms for IOVDD to settle */
+	/* Vendor waits 3ms for VDDIO to settle */
 	usleep_range(3000, 3100);
 
 	error = regulator_enable(cd->avdd);
 	if (error) {
 		dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
-		goto err_iovdd_disable;
+		goto err_vddio_disable;
 	}
 
-	/* Vendor waits 15ms for IOVDD to settle */
+	/* Vendor waits 15ms for VDDIO to settle */
 	usleep_range(15000, 15100);
 
 	gpiod_set_value_cansleep(cd->reset_gpio, 0);
@@ -283,8 +283,8 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
 err_dev_reset:
 	gpiod_set_value_cansleep(cd->reset_gpio, 1);
 	regulator_disable(cd->avdd);
-err_iovdd_disable:
-	regulator_disable(cd->iovdd);
+err_vddio_disable:
+	regulator_disable(cd->vddio);
 	return error;
 }
 
@@ -292,7 +292,7 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
 {
 	gpiod_set_value_cansleep(cd->reset_gpio, 1);
 	regulator_disable(cd->avdd);
-	regulator_disable(cd->iovdd);
+	regulator_disable(cd->vddio);
 }
 
 static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
@@ -744,10 +744,10 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 		return dev_err_probe(dev, PTR_ERR(cd->avdd),
 				     "Failed to request avdd regulator\n");
 
-	cd->iovdd = devm_regulator_get(dev, "iovdd");
-	if (IS_ERR(cd->iovdd))
-		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
-				     "Failed to request iovdd regulator\n");
+	cd->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(cd->vddio))
+		return dev_err_probe(dev, PTR_ERR(cd->vddio),
+				     "Failed to request vddio regulator\n");
 
 	error = goodix_berlin_power_on(cd);
 	if (error) {
-- 
2.45.2


