Return-Path: <linux-input+bounces-8609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A89F379B
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186BF1888BA5
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E830A2066CC;
	Mon, 16 Dec 2024 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zyew8B0Z"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D4E205E31;
	Mon, 16 Dec 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734370345; cv=fail; b=nQZGuS+/c435Pulg3GTUw48znV3GJdjxG0jajuKsjMQXs3q9pwkW3WiNM+xPRF/RUNOWA8Th66CbwcUlYweJJTugr2XqhmZL3f2lqQFdjrQmRD0x5MdfNm+4ipIo4ApCSeqpmzzJIfHrOcucYBtF9ZRlzhg2KlY34YqjoAk3Bpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734370345; c=relaxed/simple;
	bh=NexfQH/TRokFX19TTVqeQYjG9Su1b6YKAgPL8Y6b05Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mQoKy6mji4xuJnxwyS4nQo6rjtGLBt5z5Fcg8LPBRZAWCOyhKG/Psd/38UHlLXaUw2mWkxiEdeUpe6b68NagIC8hdB2UrPhjncKXQUskNu3Dt5Jj8uA9jB+Eq6AJMIl/nClc365cYJmW7epqjH5/NVG/LIHP0z+wYWV882sCT28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zyew8B0Z; arc=fail smtp.client-ip=40.107.247.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Waq/ZwTRtnYAy3eh3fWMvZGQIcPEgIkGpGg5AvhUFxvoj7ml5AhYgcdmdzYiYdhXlesmu0uFPtD8wr5t+5sysdosP7oWoRbTGdpbDOMH5oEqb7z50Bgcd44N0guEiuoTlLScAg+tvbJlJ1Le85I2wfU0p7VdJ32FxAzhS/lbhzAUsipbEhD+65Hba/wgAYXreSTGs1rwNLWVIerTYCXGVNSNCVtApHUKY125/46ZAbh+fyjcyNfkkESLTDjEWlyRJjaSAvFVBP2Dq86BMU3UNh4iwtxxyP0okg8uM1fMqW+SGTy1JwJQNc+QzyQENNMH2NHJHkaEHJHfrZuZbDBWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoVQG2DKM1+4Ul8Pneyq7Y/Baj/0RzZb6FI3x1MyOPk=;
 b=kUyq6fsUl6jwvlD3PIjyyYGdBamyu7xQsudTyGGB87qaN2TeWGxOS6zMWqcTW+6ntZVNYSzjop5Kd0dJMoZ4/YK2NqeSKR8YUgjOqGHtzJmS1mXQDKO5ZU20wb6Mm/Ewr02wZyjCX6mC40lRYLa6B/NlVWXdleycwtE/G/qmniMZhEj1arOnuVRn8sPgrfAT10DRZasqcdUqOJ/OikFP2IwiXqafHVgyYCc5pFwxldlFvqwBtMPTtkZLp83m2ib0oimnNVZGj/R49RmVqDAYWdpYMy4EW+aP+pQ1rFf5VufWMB9T1tZptt4nFV6CrUlTUiYMvKh0Sh7wm8k80cs5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoVQG2DKM1+4Ul8Pneyq7Y/Baj/0RzZb6FI3x1MyOPk=;
 b=Zyew8B0ZABUGT9Wqz2+iIpMiZWvE+XFus0PhR6KDRu3iEk19Fo2gMQnPH693N6IzIflTOUptNVtDQmG9eGT/6ztJdAK3QRNgR6AIuAm8qMYhVplUEvRDcPfIS5mZ7NFEUB8uqmqV/szZLfG14akQicIrV42f+NFZZxXjuWMHDPlVUyNpmgOXrrlwtJT48+YvkVCnEGgPdWe5gaRWzgZc2KM4LPFuvVbMHtPecjvbXOoKzWdIXZqwbymSF/fYdgLTMo2GX3jCXbnpujvjSjprmykQ8c3sp0yuipe5tfcfLyOhbGU6nZ9wmm2+bTDXDxDlk4kEXqWjfnCImMbSqH7JSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 17:32:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Mon, 16 Dec 2024
 17:32:20 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Fugang Duan <B38611@freescale.com>,
	Luwei Zhou <b45643@freescale.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] input: mma8450: Add chip ID check in probe
Date: Mon, 16 Dec 2024 12:32:04 -0500
Message-Id: <20241216173205.211058-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb85eaf-b6b5-4264-fcd0-08dd1df7983c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q5bXBwyLuJPE1cNfb13IIUUmyxqWHvb3Df9DZJ2hSxJjn5iZO0J2QEvBUeid?=
 =?us-ascii?Q?v23wXe5s4cU2qM6EELe9S25WJIj25MdDQaYKnUZBbTcQyAu+/41tE3wicG0R?=
 =?us-ascii?Q?S6sTKSYh4/sXE5WH+ylHTvSw6oVPJSR18OoTXIi9D8csIrkspv9yl0rWqH20?=
 =?us-ascii?Q?xS59IwfO/xl5yEH2ycmhMpmhnO2or9920j5WjOH162RY54BAoFDXp9XKN6X4?=
 =?us-ascii?Q?iTqpD89VZodBudPwtVuxDqRG4mgp656/yiXxpRmNEHRs5WnpFM1iM6TKkZaJ?=
 =?us-ascii?Q?//ESBGcxtDhouQEn05ORXxuP9TH0NRK6tPtB7czUDOGNTKu1qrwvHXlxEanN?=
 =?us-ascii?Q?itiCju41TpM4zIoTJujLOebr6IN1+HWVs0/1r75fmRwZo6wtBznoppqfJbqM?=
 =?us-ascii?Q?KtfsoPQ+w4V1dBhmJezOsBlF092G7c6vGCF4papuqx2CQXP3i5S+cuBSpj0F?=
 =?us-ascii?Q?gALg0Zd7j/EoGRmyWU2qMPEKybQVcnQUPywszaUHpSLFzmaxIvbSplPMI5bJ?=
 =?us-ascii?Q?iaj+f5YFVDp/qgxOHB+ZMKJ2yIxVOnI1lAoqUdawI7p1WKYHeMZktuPX1TG8?=
 =?us-ascii?Q?JeAyC55gqCaxPnHZjDJEZJuzmAOXtTA2ruU07Rl8CZyhqsKrxQYZHaIi381p?=
 =?us-ascii?Q?b5ffuF1LIiAZ46h0fbE0zO+4lLesNrYQoveDFTmPSsCDjRReCKIiouO2twNl?=
 =?us-ascii?Q?4xRwuNIFKnCusnRLZtWyTf6ijClctKnUIGwZz/x1DAhoLxRcYKrJ5R2711QQ?=
 =?us-ascii?Q?hAmMXOJtAZTgwG+upPM0bdZv8xtbcaD0oM/DuYUWLQRtgaF7TVrlWFYxrSaG?=
 =?us-ascii?Q?a5otSZmwzrz1or0KqVFFSqmsrO+iRFS0oHm1ZZuyUhjV4f7r0oy/K8ka7aHU?=
 =?us-ascii?Q?tW3X5C4Kp9S3z1JXdpiWr9YuURSapQWQ7Um8S+gIggrDiJUAPcmdNSqKzLbp?=
 =?us-ascii?Q?HGqHGPttSbRzHusyHc8LYTQ1ARLgycSLIE9GPX5MvWJlvW/ZBht6UhqnEWJs?=
 =?us-ascii?Q?egn+eATkCC5tfFSOp7ml8bz4l2MWsuazA9bNaOrDe9P7Zfyx8koS+YpnKcU6?=
 =?us-ascii?Q?y5c/BhvfuSCDTLFUXmGOmLOGJ7EwtfOv+aSRFfIeMC3PO7rHRamcmOiwc56n?=
 =?us-ascii?Q?EwO+KQ76+zAGF34kGP8B4mx11Slw63dOa/6bZVUhILF16w3yBEOdLacUX5I3?=
 =?us-ascii?Q?yibWcxi76Yr2RKmi9qxOziAGCbd8gKsZJfj2g/jRYrYE6eJQjvbj1TNid3Tw?=
 =?us-ascii?Q?9Om1Ujz8g0wTh9v0+zbRoUT7AycpgWEcP+dTQWRurALbugOKfltNWwV8RvEJ?=
 =?us-ascii?Q?VkVM5OnY/kaUXn6U2fT7mpOYxvMYnwIj0eYbFRcVJDtIQRCofrLkpt+Hx4lY?=
 =?us-ascii?Q?wuAEOD3UOztDeuC4cf8fReeEmaQHptZSjnu04JF7/1NFh1W1K0vYIY6eRDpT?=
 =?us-ascii?Q?EJoYR1RjrP7b/WayzFRNsL9rGsZ/H0tX6EvhHTlbJg2GBUWVOBEqDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wNu/NzULMBdhg/xNJgz0eOy7RY2rJkKob5yjJTFESQpW3LZMpiTXx6Pz9DcJ?=
 =?us-ascii?Q?cNBrO1zGhAJdk+W2jgJRIut0TuGKlCcxiroNe8/iSTGZs08tyKPZCX0SRsOR?=
 =?us-ascii?Q?8KZA7EBM7IC7BDA8Ao9XpiInSw8bhAtRiqyu/9MFGC4wwZPf3zv3ADxrjr5T?=
 =?us-ascii?Q?piZaKe0w2xtnN5A5qiBdT6yzB9+1p8gHal8U55twvekA/+79xvSCEYqZgT8W?=
 =?us-ascii?Q?JSyEkWKrsgHB/NnVLM8Eq9TU+85Y5mvX1Co8XQ9jKwx2pmB9cyVU0v9O/bZb?=
 =?us-ascii?Q?tNfDhAuJ8b/c6dTO6rC2lNfCnESDRBsvVodMFn5nhiAL5m899M9d+0d9CYxo?=
 =?us-ascii?Q?k4b5bBh14wsKKcycWN3xEHU8aUHDSTDsxBunxiBUx2SjDqBhR8T3BQMdJU2+?=
 =?us-ascii?Q?IOyRONPo+UCaExcUrNsPFRU4yqSuJEUhZVvk1v9mjMXvc186g1zAB51zaw7p?=
 =?us-ascii?Q?t5veD1MWh1PZSUUMJNXD8gsNQFlrI3DxXlZ3o9SIxg243puhFVlpc9Kr/43l?=
 =?us-ascii?Q?AuyV4G9pClq/IGJgMrjO2AnRZqjTgC6/7e+UXESS7KH5HvlL/oXNUTzF8EEU?=
 =?us-ascii?Q?Eqj+18PbrHrlAurLf4B7vFop1V/+fBvdCWF2bcFRB3gqf4tOQdjy0yAeZoWW?=
 =?us-ascii?Q?Cu82ZD2MBmTKR/qlpKvMbLgGSWNYEzqZw4whBboi6NY5Fw+y/3cj6WzzDH6P?=
 =?us-ascii?Q?XEJXfUv7vH9WETUXg3Wyz+9TvqTu3K/Kx8hsyFfa4Ub9gdj21PvC4vxwSlFR?=
 =?us-ascii?Q?XqwVlRjft5fd7sTDFgj5VKUruBMzGG+84RLTnKfLTnlExEYyomhEmlz/G2tK?=
 =?us-ascii?Q?wADqj2XeBeh+pv8rKkChqM6xPAtixZFeNPG1dkvHTJ9/5zfZXMPzw4p0Hk7Y?=
 =?us-ascii?Q?/6V2it0WxzyZGGc95WLROkFwHwrP86cX6cwMNZCnF4XHcVqwdYdO6UjqchSz?=
 =?us-ascii?Q?Dtuh4kwHq0V30ijmhm9sU3SZnFKhYkWrEoYPlDmfJWlTtPrLxRd2XTUHoKDR?=
 =?us-ascii?Q?A0/86DT+xzSl6k9FXsFvth2O1RkZ5Qj9MjXEKESUEQVgMbLKCyk2h1XHPd7M?=
 =?us-ascii?Q?X2FXmKiYcpj4KjX4uH+OGL6OpWLwu/n48PLiVogWBQmFnYbnChxH86RCpubM?=
 =?us-ascii?Q?mrzqmv+ukr+Ig5jLIwn75taOvgNZqURGz/zAryzwIrnOcvxQ0BlUuWsxDTG7?=
 =?us-ascii?Q?69EBV50l66MWeNJiWClag02wwYVAa5Gib6B/Bj2fZ7119GeO848h1HjgVMuN?=
 =?us-ascii?Q?yPf/oe9q0V31WW2S5lD3sfoxi0zvjNe3YHEV2MwS5/86ekHESnMR/AZ5/kUs?=
 =?us-ascii?Q?9+MITdhjFiPGAW6z7JKxVXOw/N5Rg01zN1fZRvi8gfTFzlHDCcstrXhmSh5R?=
 =?us-ascii?Q?9h4YyQNuNHg63RvFADduZ2g6iKTfo43ZpxxRhByXtzrGsbVDyHp0zPA5bsnB?=
 =?us-ascii?Q?jnXLc0su8JnHL8N8w68i36wYjWUgCJc64sRkXPSbwXVbXAT+zusd3LdK2Gja?=
 =?us-ascii?Q?rN8XcukI80LDmlUbz/FBrfwusjuxjfQazrTK+5s38UMtDLkWGpZz4x27gzCp?=
 =?us-ascii?Q?JkcYNJa77hNhFd/29pFVkv/0Z2WHSsSeNb/+BMkC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb85eaf-b6b5-4264-fcd0-08dd1df7983c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:32:20.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WVESrAjKKLNpqi3heSzVIHNzE8q1vbmnMFXLugusfiBIpIwNS+NtgkBJbEqzjMyjz0FQnJaaEd4T8m9pL8m1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

From: Luwei Zhou <b45643@freescale.com>

Prevent continuous polling error logs by adding a chip ID check in the
probe  function. This ensures the driver only proceeds when the mma8450 is
present, avoiding issues in scenarios like missing add-on cards.

Signed-off-by: Luwei Zhou <b45643@freescale.com>
Signed-off-by: Fugang Duan <B38611@freescale.com>
Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- Use  *adapter = c->adapter
- Use if (!i2c_check_functionality())
---
 drivers/input/misc/mma8450.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index 08412239b8e69..a1adb49fb5f33 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -38,6 +38,8 @@
 
 #define MMA8450_CTRL_REG1	0x38
 #define MMA8450_CTRL_REG2	0x39
+#define MMA8450_ID		0xc6
+#define MMA8450_WHO_AM_I	0x0f
 
 static int mma8450_read(struct i2c_client *c, unsigned int off)
 {
@@ -148,8 +150,17 @@ static void mma8450_close(struct input_dev *input)
  */
 static int mma8450_probe(struct i2c_client *c)
 {
+	struct i2c_adapter *adapter = c->adapter;
 	struct input_dev *input;
-	int err;
+	int err, client_id;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(&c->dev, -EINVAL, "I2C adapter can't support SMBUS BYTE");
+
+	client_id = i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
+	if (client_id != MMA8450_ID)
+		return dev_err_probe(&c->dev, -EINVAL, "read chip ID 0x%x is not equal to 0x%x!\n",
+				     client_id, MMA8450_ID);
 
 	input = devm_input_allocate_device(&c->dev);
 	if (!input)
-- 
2.34.1


