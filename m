Return-Path: <linux-input+bounces-4028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1D8D773B
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 18:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E5B1C20AA6
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 16:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BA8548FD;
	Sun,  2 Jun 2024 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QL/q+rD8"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2101.outbound.protection.outlook.com [40.92.91.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB0012B7D;
	Sun,  2 Jun 2024 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347572; cv=fail; b=Rudh0FtsLMBPZNPae67+R+GwfdUj9dzXsjXD5mszCN0aLfhETGxCl4yz6n9QWFjlWf3afF53+p9Ux7k+Nj2qySLfCvQ3+X8tiIiBmjdCe42pfmCo3FlxF1OH53tzKtltV0acZLvraDLzyx9pQtwUCrxR34+4sJorKpH9i+byHH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347572; c=relaxed/simple;
	bh=yDyaRb8ho8CwkuWC3sr/mKhvVjUEV9yx7vTCgiyZNpo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rm7pXMdsTc3paSg2zp5ygHNJdn2BdbW7B59W2G7OAl0Wtn2LauG3jm85bPuBkDbM3+HPDcYcb9pmsLssHrxrVGpMJCuU1PxLR3Sfud5ZO9YmiAwQi2YnMdmLaHhFwRgNVstE3/HTNqnMdYuJ9uSQyTtCrm/ILuyrEd0n/B1F0Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QL/q+rD8; arc=fail smtp.client-ip=40.92.91.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMdWxyeUPQT/lqWcyjRcHmHFy0bJ/z0fDTvF//prML/Pj+m/Q15qXrLMl0Pzi6j5JmA1uO/ygBTVC06KDYm1xb0KGGbTCoMMe7gJWYKvuyrSdpeoQg/8JZkRnHPlNcWWBAnx8770aj6G0aiyZvwMxoIp+uEaFnyEq/JX2hstS1CsOHXDFy9B+qWi59Vo2k6TsRYMxWlBDrPF7M29+CbA8zn2by3ex26q8Y0Wf48VKXYyQh9+B8F9RWZhCbCMPS/Ua1f/6oRV/ILxfZc38vMPsMHI88O6NHOszCK7MzCYUcAavDjPY470Mfyy5nl2beK8sRTLq2w/n+D9A8mcZKWE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTLTrpgPwjoWeXmelDXO5W1zZiW+QDOarJ1kEO1Feqw=;
 b=aDDxYxwy+DeP/th2amJQfIyOJt8N9E+ykbWneXInnWlRRp5ninb10OrpcxScuxFS3P21E6qvD7XfVvD5WHS2sreP00eJiSofH0x+xBEKbszMpXkpCgI+AmjvkOucmGxtzEvFrJeem+Kev98ufEzQJmeMBf0N3Xu6kGxpgbNb1e9LGvfKUraRt1LjwC4aJwfj0dxQCa3fTagJliMBpFhglbiiD0Bf1GhXQ6wgN1VhRxgQ9k8r4Hkd8tFWMNRYY5m7pMQGHUpqNKnsbVmuyCWgWe7XLPH4+9SMd2cU95hI/1H5JuSX3ryD8QpYcppno6DB183LYKBSnL3teHDPqm9QjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTLTrpgPwjoWeXmelDXO5W1zZiW+QDOarJ1kEO1Feqw=;
 b=QL/q+rD8WKRBWAqaIwhQ0QzcsQnCweutHj6JG/Hpl+aLVLq9AGy3d1OlvfPWz8D0yC5QskrJd/bYd7O7BXKs4tSayKkyecSzh34NBAGjti0GzQ8uvQfdaQ4WgtI7beyg6mde2sA16MfouqR81K5e94UP/tqArLpSjlxjsZkOJS/wiDA4adUsEzcOvNSOR9D3CgQ+DFJc28RGAl9LuI93e2Zj4DLml33hvPo8IfS1mgWyi0fJ6Z5trEiR/9VUWgtzyFUVHlrtYswd1jlOdVVk9/avw+loLDc28OTW+WD5UkLASOf95fVf9IVYK2UqI4Gi/2wj07rdsWTkTppomzzR1w==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by DB9PR02MB7130.eurprd02.prod.outlook.com (2603:10a6:10:220::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Sun, 2 Jun
 2024 16:59:26 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.021; Sun, 2 Jun 2024
 16:59:19 +0000
From: Erick Archer <erick.archer@outlook.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeffery Miller <jefferymiller@google.com>,
	=?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: mouse - use sizeof(*pointer) instead of sizeof(type)
Date: Sun,  2 Jun 2024 18:59:01 +0200
Message-ID:
 <AS8PR02MB7237FB736DBF67A58798FDF38BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [A8QqKcfKfauzJbFYhmxTSbuuNjsKwVO7]
X-ClientProxiedBy: MA2P292CA0005.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::8)
 To AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240602165901.9546-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|DB9PR02MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7a7d22-7fb4-465a-fad1-08dc83255826
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	t5n3s1jCMAueL1DjeJ7VxccuWO1t3mwwGp8eS8F4/OJaTc0DZh3SUrQJcAi8m804L7sxWUM4PId3ea+wvBqhFqLAfLfm0epSegrH4xgtCC4LL3NN9Rip8AoF2tqNKwLnHiqom9sx6jl3PwQVUZKTlTo6kcM1FAPG4hY/MKG9g3NYLzsvaC2tdD6FUXArvP0Z5uQkCCmoZHgsEgh8cyk9ZJ5j3ELuoi2tSRh8zg1JHPyjK217mtuspymbOXjStSqIkUcwXZjGz+6wtBwROHHXX14nlgSYARtt4b7DUdY43gmvbbJknXgX2dp1LIw74PHnKFWouFhlDF22SOU+j1ibmKZFe/xGaAxpTYZ/ReERvkEtgrIRALh58tY7KV/66Pwd525DxdlZIvU/RYxomgdgG1nM0687/4v0teihA9sJ5/wCRtWxn1Zr2rIRi+nd+QwJ3rEE9dJ2w6xpzzQkxXcXi9y0tfrUOAcSw/ajlIgZdZZF2LM2WGT4flvFVQeaNo2jo383zQmVk52U4lLUK1quevN2ZvTTxCwPROxM0yEPUYJEHPUl/li8aHbB/nffWNyt3LhDDBFrv4LPg0RRUO8Z0W4U2Uez1X6p+1IjxTKl9ZOW4K9vjenA+NlMrj3ZOjym
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xT9rBcZZnYTIJ4Yj6VUkHcAsUntWn/zVN4utfKho5QtrSMNL2cIgVGIIsduj?=
 =?us-ascii?Q?3F/uyynA1x/RjdmwgafnVDn0cgl9vEL4I+FU82QmBFYZzBpUyYqg5oUdf0jN?=
 =?us-ascii?Q?E9k+m3RvWraWexLHLWBf8VHWWn/wFS49f6kjYkPGdu9lz7ayUbnzF2FnPb4Z?=
 =?us-ascii?Q?mkVzxjJGdqI25TuN0vGGpvnpZqxIpsDQCckDqEqlqnMznxdX2CqS4/xe6JXu?=
 =?us-ascii?Q?UQviWSE25Xo+E6bwaCyksNp9Hc1J9Z5CzPcUi+yjLn+/KuQF2qt4XiFF85V1?=
 =?us-ascii?Q?1mhGflqZimVUA5BMQ3J30i04P6iRv6/RrWW9Wv+ZcYleeE28QXPDa+91XCUi?=
 =?us-ascii?Q?QODD6Duw6F/vQNRs880jsoKPmKr+7IQhcxTL3kC7AzKIBAHwvo6zJNkpfMtt?=
 =?us-ascii?Q?ISVmDOk3ms2mWKtDtjvOxaq8NAIu7rfLHiw7PyKfAFIF/yEdhl7dTfuWup0m?=
 =?us-ascii?Q?qu7V7lPJSDOgy6a8NLtsKkQ4KLc40z/LVCAXZpIH7NFIrOL+G0e2pDuba0yS?=
 =?us-ascii?Q?Gt7EJi3MBaZyoUqAIdzpUSY5Y45Z1PF2erltzwm/uGDvwaeEDCBt+9HfIFxp?=
 =?us-ascii?Q?Wzif6BQjyBq0rS6lhkCy6g5RhLDRG6NuNvL135oynDxfzO5XwkX6lvVeMfOW?=
 =?us-ascii?Q?wsKOqGch4fPgwkKA7G+DXXyTF5Bg0tvIaCUPgCJDppvC8rDI0rFEI4DEpDPb?=
 =?us-ascii?Q?vBv7g6DgAscGOVfJYfZj5lSMM8hUSWUkNu6zgOmq2oF6Zm+vkdoEw8a0YFPH?=
 =?us-ascii?Q?LC+uf9UnfsafVMLPM0HDDMHe35kk/yHWZ6J9cpN1OljL736ZJOL5oprX7ljt?=
 =?us-ascii?Q?HHI2zoWNCcVcLYBZDYILsCjsXu8AroM9/p4JSLraK+L/ds5icb1fUUS4JUIK?=
 =?us-ascii?Q?49JPHE38lw5196vO3JRF0UHo/ribNI4MNNF5q+KN4ejvk5L4tig4kY4YofYa?=
 =?us-ascii?Q?HyzOnMcmTVyMIpQYrH1uw8XPMH9BmFr5NO51pv4w5AG7UPiaCgtxA7eKfgr+?=
 =?us-ascii?Q?Lctg1Os0wUCtnPqs4cHTVQI5LPupfJvFR/1Wcm7pJro5GgWTz+wXRZ1A4uDa?=
 =?us-ascii?Q?ApPka9Ku1182leMTOPRp27GyRxXfFTSzsUMbAF8+F6Zqoa1p3OYCGleAaow1?=
 =?us-ascii?Q?WaQabK8VIzaf1Rsiw7f/7oDACx2qKVFftHPuRTgNJVm68+FcL2nCs/PSWf/Z?=
 =?us-ascii?Q?lRks8TmzdMlwpPuOJLH8QjK7MbYtjn67ZNCd9qBeXo5UJZxzGsIlFwuawAUJ?=
 =?us-ascii?Q?1f5DoCxTuMNdIDG0sykd?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7a7d22-7fb4-465a-fad1-08dc83255826
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2024 16:59:19.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7130

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter). This patch has no effect
on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/mouse/alps.c          | 2 +-
 drivers/input/mouse/appletouch.c    | 2 +-
 drivers/input/mouse/bcm5974.c       | 2 +-
 drivers/input/mouse/cypress_ps2.c   | 2 +-
 drivers/input/mouse/focaltech.c     | 3 +--
 drivers/input/mouse/hgpk.c          | 2 +-
 drivers/input/mouse/lifebook.c      | 2 +-
 drivers/input/mouse/maplemouse.c    | 2 +-
 drivers/input/mouse/psmouse-base.c  | 2 +-
 drivers/input/mouse/sentelic.c      | 2 +-
 drivers/input/mouse/sermouse.c      | 2 +-
 drivers/input/mouse/synaptics.c     | 4 ++--
 drivers/input/mouse/synaptics_i2c.c | 2 +-
 drivers/input/mouse/vsxxxaa.c       | 2 +-
 14 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index e2c11d9f3868..d5ef5a112d6f 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -3201,7 +3201,7 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
 	 */
 	psmouse_reset(psmouse);
 
-	priv = kzalloc(sizeof(struct alps_data), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
diff --git a/drivers/input/mouse/appletouch.c b/drivers/input/mouse/appletouch.c
index 627048bc6a12..e669f86f1882 100644
--- a/drivers/input/mouse/appletouch.c
+++ b/drivers/input/mouse/appletouch.c
@@ -855,7 +855,7 @@ static int atp_probe(struct usb_interface *iface,
 	}
 
 	/* allocate memory for our device state and initialize it */
-	dev = kzalloc(sizeof(struct atp), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!dev || !input_dev) {
 		dev_err(&iface->dev, "Out of memory\n");
diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index ca150618d32f..10a03a566905 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -904,7 +904,7 @@ static int bcm5974_probe(struct usb_interface *iface,
 	cfg = bcm5974_get_config(udev);
 
 	/* allocate memory for our device state and initialize it */
-	dev = kzalloc(sizeof(struct bcm5974), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!dev || !input_dev) {
 		dev_err(&iface->dev, "out of memory\n");
diff --git a/drivers/input/mouse/cypress_ps2.c b/drivers/input/mouse/cypress_ps2.c
index d272f1ec27ba..c693130bef41 100644
--- a/drivers/input/mouse/cypress_ps2.c
+++ b/drivers/input/mouse/cypress_ps2.c
@@ -659,7 +659,7 @@ int cypress_init(struct psmouse *psmouse)
 {
 	struct cytp_data *cytp;
 
-	cytp = kzalloc(sizeof(struct cytp_data), GFP_KERNEL);
+	cytp = kzalloc(sizeof(*cytp), GFP_KERNEL);
 	if (!cytp)
 		return -ENOMEM;
 
diff --git a/drivers/input/mouse/focaltech.c b/drivers/input/mouse/focaltech.c
index c74b99077d16..356b99d48544 100644
--- a/drivers/input/mouse/focaltech.c
+++ b/drivers/input/mouse/focaltech.c
@@ -408,8 +408,7 @@ int focaltech_init(struct psmouse *psmouse)
 	struct focaltech_data *priv;
 	int error;
 
-	psmouse->private = priv = kzalloc(sizeof(struct focaltech_data),
-					  GFP_KERNEL);
+	psmouse->private = priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
diff --git a/drivers/input/mouse/hgpk.c b/drivers/input/mouse/hgpk.c
index 3c8310da0b05..6125652e5ad8 100644
--- a/drivers/input/mouse/hgpk.c
+++ b/drivers/input/mouse/hgpk.c
@@ -981,7 +981,7 @@ int hgpk_init(struct psmouse *psmouse)
 	struct hgpk_data *priv;
 	int err;
 
-	priv = kzalloc(sizeof(struct hgpk_data), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		err = -ENOMEM;
 		goto alloc_fail;
diff --git a/drivers/input/mouse/lifebook.c b/drivers/input/mouse/lifebook.c
index bd9955730176..7147dacc404f 100644
--- a/drivers/input/mouse/lifebook.c
+++ b/drivers/input/mouse/lifebook.c
@@ -273,7 +273,7 @@ static int lifebook_create_relative_device(struct psmouse *psmouse)
 	struct lifebook_data *priv;
 	int error = -ENOMEM;
 
-	priv = kzalloc(sizeof(struct lifebook_data), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	dev2 = input_allocate_device();
 	if (!priv || !dev2)
 		goto err_out;
diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index 2de64d6a04d1..baef4be14b54 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -73,7 +73,7 @@ static int probe_maple_mouse(struct device *dev)
 	struct input_dev *input_dev;
 	struct dc_mouse *mse;
 
-	mse = kzalloc(sizeof(struct dc_mouse), GFP_KERNEL);
+	mse = kzalloc(sizeof(*mse), GFP_KERNEL);
 	if (!mse) {
 		error = -ENOMEM;
 		goto fail;
diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index a0aac76b1e41..a2c9f7144864 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1591,7 +1591,7 @@ static int psmouse_connect(struct serio *serio, struct serio_driver *drv)
 		psmouse_deactivate(parent);
 	}
 
-	psmouse = kzalloc(sizeof(struct psmouse), GFP_KERNEL);
+	psmouse = kzalloc(sizeof(*psmouse), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!psmouse || !input_dev)
 		goto err_free;
diff --git a/drivers/input/mouse/sentelic.c b/drivers/input/mouse/sentelic.c
index 2716d2ba386a..44b136fc29aa 100644
--- a/drivers/input/mouse/sentelic.c
+++ b/drivers/input/mouse/sentelic.c
@@ -1028,7 +1028,7 @@ int fsp_init(struct psmouse *psmouse)
 		     "Finger Sensing Pad, hw: %d.%d.%d, sn: %x, sw: %s\n",
 		     ver >> 4, ver & 0x0F, rev, sn, fsp_drv_ver);
 
-	psmouse->private = priv = kzalloc(sizeof(struct fsp_data), GFP_KERNEL);
+	psmouse->private = priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
diff --git a/drivers/input/mouse/sermouse.c b/drivers/input/mouse/sermouse.c
index 993f90333380..218c8432a13b 100644
--- a/drivers/input/mouse/sermouse.c
+++ b/drivers/input/mouse/sermouse.c
@@ -231,7 +231,7 @@ static int sermouse_connect(struct serio *serio, struct serio_driver *drv)
 	unsigned char c = serio->id.extra;
 	int err = -ENOMEM;
 
-	sermouse = kzalloc(sizeof(struct sermouse), GFP_KERNEL);
+	sermouse = kzalloc(sizeof(*sermouse), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!sermouse || !input_dev)
 		goto fail1;
diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 7a303a9d6bf7..38191c3b31bf 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -708,7 +708,7 @@ static void synaptics_pt_create(struct psmouse *psmouse)
 {
 	struct serio *serio;
 
-	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
+	serio = kzalloc(sizeof(*serio), GFP_KERNEL);
 	if (!serio) {
 		psmouse_err(psmouse,
 			    "not enough memory for pass-through port\n");
@@ -1563,7 +1563,7 @@ static int synaptics_init_ps2(struct psmouse *psmouse,
 
 	synaptics_apply_quirks(psmouse, info);
 
-	psmouse->private = priv = kzalloc(sizeof(struct synaptics_data), GFP_KERNEL);
+	psmouse->private = priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index 56e9ba396858..a0d707e47d93 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -508,7 +508,7 @@ static struct synaptics_i2c *synaptics_i2c_touch_create(struct i2c_client *clien
 {
 	struct synaptics_i2c *touch;
 
-	touch = kzalloc(sizeof(struct synaptics_i2c), GFP_KERNEL);
+	touch = kzalloc(sizeof(*touch), GFP_KERNEL);
 	if (!touch)
 		return NULL;
 
diff --git a/drivers/input/mouse/vsxxxaa.c b/drivers/input/mouse/vsxxxaa.c
index 8af8e4a15f95..707cd28f4ba6 100644
--- a/drivers/input/mouse/vsxxxaa.c
+++ b/drivers/input/mouse/vsxxxaa.c
@@ -456,7 +456,7 @@ static int vsxxxaa_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err = -ENOMEM;
 
-	mouse = kzalloc(sizeof(struct vsxxxaa), GFP_KERNEL);
+	mouse = kzalloc(sizeof(*mouse), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!mouse || !input_dev)
 		goto fail1;
-- 
2.25.1


