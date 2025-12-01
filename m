Return-Path: <linux-input+bounces-16417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D29C9781C
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758533A57BE
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170583101DE;
	Mon,  1 Dec 2025 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="IF05yZuo";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="IF05yZuo"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023080.outbound.protection.outlook.com [40.107.162.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18132F5A23;
	Mon,  1 Dec 2025 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.80
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594471; cv=fail; b=fDWSlb5dIIgK6j0d+n62h6jw/g1MZcKm4RN0qPgzeUQy0LH6yyEUR/taZVtXlqRPVNEfU7NJPuUL2V8BxQkOU3+gNXGcY6FKt2T1sSbJKkKfFJY2BaJuakFSqssN/9+4XecB9Eij0qUsJAg9wqmQVFDfXAYzOiRLa57xKG5augA=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594471; c=relaxed/simple;
	bh=9pZjSPKB2yQtTSfvBy5DLkZP/+62NLvGNYZ39NUbl0I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bQ44qRjXHJhB4YkgUe8+94zVM/h7ncRlv1JS7dGIJ3lr2PEbSf0XW4zpIYco00lpaZo2PVf8kQfvu50h6f5TGo2+cOEL1XT5yHQHPsTeV97HOjIrNQG0vuZNbztrslA8COY/dqtO5XHg5D3EGznPW1GAFo6d1+94Ua0lP0IGCQI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=IF05yZuo; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=IF05yZuo; arc=fail smtp.client-ip=40.107.162.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vGwModRekEomun9+hgZpnpW5384ApHGqJUwyTGYbH9+KFT3a5bIt50bA8ibLkxzB6eApRQa0Q5SRUI4fv1rt9aGATqRwftJLN+xuSKkfFS04PRnkx2FxZvScxj9hyyh0LPSiaadLwORGD1/L5ZQgXwE9ucsLiB6vDsokgUMzrUoEnfff1d0DIHaVe2HvVWUgaGR6KSmwqDeh48EzHRTrnnzf5EuUnImNgl4xyIH1Vl53PVS4CcC6LaIn9rCwy9IS4yaqXrv+HmFeORHZqT2q6JCiUQ1Zu+h3Mi4dldKpF4eAR7X5zQC9xsUBKn715IT3XKU/RnlNt8oSrfzWxDN4uw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=gzZsoOCZgcrBwpSYfvJAYUwfXRF1Wra9KHvi/EMbuLKn3vGf7dZBdQpdp23wbzxjotkKgBTGy2PHvSk0GAql/wXpHHkuxOPpG29sVrPE9GBVmSRbIpCawZwjzoxeF7fzVVO07ZmMQcok0k992xkDEV9hL2rX8BAfcy6Iy5KZSB6jE4W6r8zhP/FRrDbCCWvFiCU+Mwr4rIL3b8y2Xfd/4KgPhzIUwc5A1x7ohyHDuYSHjNVebu/lYrD/UdCqm2Ev4K1i3h8RNh+jUkjCLslOa3nGiOCWAGOFhFVBM7Tc9WyHYLop8ewjfGrfGtOzMqrP5hgMiAxaTjlrQQysaH+s2w==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=IF05yZuorQ1xXp1vDTYq4uQe/mZBZgctNxJ5vhhC3GDJyofXElESwuRE8d6pI/Uf3L314gXKjLEMywiUej9rO6tg/kfuUNEa6iJQdsudBmmwL7bvGlD8qEh0NLe0vf7nDIqfhBiww9Uptfwf4mzvnoCJR9yuIBp5dZvPu9Y/nVw=
Received: from DUZPR01CA0335.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::19) by DB9PR04MB8171.eurprd04.prod.outlook.com
 (2603:10a6:10:24f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:43 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::d5) by DUZPR01CA0335.outlook.office365.com
 (2603:10a6:10:4b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Mon, 1 Dec 2025 13:07:43 +0000
Received: from emails-262389-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 85C838011A;
	Mon,  1 Dec 2025 13:07:43 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594463; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=PRlR0WdlvoO50m/8hN4KJMjokVgAHPqaUnyiWBGKydtaCfPGGNNPHI4vMjz7Q70kCWQub
 n4Bah1WeBoudZgg775UrHDX6xw4TjuByFaCO+xkjQdEcQBJrAiwnLImP7h+2DIdbNKi3Ld9
 JUJ2QgQF4Q02vhiXOd3I9ig8hTWu8Lg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594463;
 b=Icl3FKK3hibVBW/M9qve5N7iXUl+Dn1quxjKnyxIGJ9uz+n8aAMIygow3kELsFfUbqA3r
 nI/KKAbrU4XJfMVmdW7xU6ERzkQ0zHAiIJjWC4THmne6VP0NgRVRDQKLN2WCFw4B6F2TxXL
 QYJ82bsKmBvfnTCwwQOcD8woofpvX5s=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJcFIW3AFE4zWbzj92d2YzrI1KJbUCjINshERQFEJLu2cTKlk0JipxP3q/ALcmUBwWPLZtbGNEpPKrgfe+E60ooUDb7jwHxqDKfC5rDFUQfrWsl7XcZIecEzs0A3t180A71iTi7uHPZTi71gtlzSjfNfl0+WS3QsbE0SUD4jmcfEoBmiYS/aDT9nnQt/IRg7JsmmmyzLiLNQiU7+qJo/25d5tYqtQqgG93ZADCqTO61n9doozdqem7IQcv1c+uY17BqvC0tk1sRF9f8ZXtEZ3FI06jNP9RrO3egVL2nEsqvrPRNjlbpandydxZwws5/QoZzzhFGxu0ZOcRDeQ+TngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=mpsXfbzQX17y7oEQNq0gnQhI3P+NZ4lkzUeBeUl6Zh3YHdMrLD53GssRb1K5fAZRyRA/GScGXU9rjd3Ca4X/torM53vior+vk+EKEeEghfqtNx6fch1b1EHJhS+We1TD9jDyohfMrYWKEFCc7qHS4mA03vuqtmvaa6oiGOUMQT58Yf8ULFz+uILe62zKAeF53Y76dHviTKgRPNIjpIdo9QN3BZblHVrEUt4ErFbQK+YH8PaWtUJFMYVvAqZeganZPMD1LXn3szF47Wd5XNNUNDyQy/aHfq1xGgWUe6DY3+haVZwwmMv8aTRqarGervxKNzKrYg8VJBEU/Rkrh0IBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=IF05yZuorQ1xXp1vDTYq4uQe/mZBZgctNxJ5vhhC3GDJyofXElESwuRE8d6pI/Uf3L314gXKjLEMywiUej9rO6tg/kfuUNEa6iJQdsudBmmwL7bvGlD8qEh0NLe0vf7nDIqfhBiww9Uptfwf4mzvnoCJR9yuIBp5dZvPu9Y/nVw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:34 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:34 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:20 +0100
Subject: [PATCH v4 1/8] dt-bindings: arm: fsl: Add various solidrun i.mx8m
 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-1-53a4cd6c21bf@solid-run.com>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|DU6PEPF00009525:EE_|DB9PR04MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d49172-996c-4ca6-ed08-08de30da9d8c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z2lxMXNLbGtJV3BweHUwSVRraUpiUXJXMkdCYm9QbllSZEhVVHN3dlkrYXJK?=
 =?utf-8?B?NUhXNGh1V2o5R3BTWDgrYzlpM3hGTDVoMDIxR1A5ZTVTdGZXOHZPN0pRR3A0?=
 =?utf-8?B?MHlwM0hidmVuNDJST1VVdU45T1hSUlZiQVFOd2JycGh5OSs0VVp3SHdNcUNh?=
 =?utf-8?B?TG14YzFKaElzc3RTWDJCbWRDTmdZZU9ZZmlRV25HT0MyUUhUSE9iQ1hHaC85?=
 =?utf-8?B?VnhWMFVkREFvdlhpV0V5ODFDaDRoeTNLdkZ2a3pueUpUbEJOYmpJUmljVkEz?=
 =?utf-8?B?N0M1RCs1TllmcDhhT0RMSWFxRUpWS3BuZjJ6clpMQzR2VVBOZDl4eXpjNVJU?=
 =?utf-8?B?cVRrR0s1em5iUy9MNlZyNFZDRkNmV0tJMmN2aklNdUZBV01LemN5eXEwNHlB?=
 =?utf-8?B?bmRPeFhSb2FzOXU2ODZ6cHdGOE1DTzZ4U0dUYUVWSmVMTk5OMzBvUTRqSitF?=
 =?utf-8?B?OTFmK2lyNk0wUWU3c291M1liOGlBWkUwTktacWpWS3ZtRVVjS3IzbFNHb05y?=
 =?utf-8?B?bWxJbEM1OUd0Qis2c0dGMnVNb1N2R1Y3L295NzR3dmpiNWs2M05PUUFCNzJh?=
 =?utf-8?B?MTNzTVhWZUhMa3hnelMvSU1BM3lGUmd0aE9Sc01PVG9jcHJkZDU0SElsY2tW?=
 =?utf-8?B?ZjVuakh2QWc3OVVCSlFKaVN6SmNBM2J0N3VMejdCUVJPOUhvcEZjWUM3cU9h?=
 =?utf-8?B?dTQ0SHIvV0JnbkJHRld2emppOVFiblIxZGxSb0h6Y3QyTjFrRVJXWU1GSGRq?=
 =?utf-8?B?SGIyam9abFhqb0tLYUhZK2VBdG0xYWFmRitWeFdSWURuVVNsemFMWnhRY0VM?=
 =?utf-8?B?YlFaemxIeW0yT3Nua1pkWHpBYzVZTUFiY0ljVVVyM1U2Z3BTZ3hpSGszOWdW?=
 =?utf-8?B?Y0h4Vm42NHhhNHkwWjRybWg5MkpwVFNqMFJZVlI5dVJFRWM3bitPejZzV3ZK?=
 =?utf-8?B?SEowTWhkS1hUS3BKM050SnIwRUhydW11S0p6em5OWEtiS29Vc2xZWDgvTlBz?=
 =?utf-8?B?a3RzRGtCOG11WFlMaGI2L0FSYWJ6MWVUZmdCV1EzcjdHMVN5N1JSQVc2WXZK?=
 =?utf-8?B?TzhEalRFdTNTN21aZDhzY3dUS2hncUxQUmMrM25qbmw1bUdiUzF6LzlqSHpy?=
 =?utf-8?B?WHkrdUswTUdhSm4zcUdMcUMxekZzVTRsbXlqWExQZHZZWXRzM2lOL0tIby9W?=
 =?utf-8?B?d1ExQnNwaWRpZlZueU9BaEw4MjhScWRlUHVrSnBhS21pZCtyYzNjdGpWcmhu?=
 =?utf-8?B?RVRLaEI5VE1relVZMEVZVFFwOEZUZ1VBOGl5NDc0VmtRRXBPNlJFRHNVTTEv?=
 =?utf-8?B?Q0FYRmczQUJqd3VZZ3BsUWdFM1NxZXJiWTN5RGYyMlhrL2Q5VnNFQVZteUo3?=
 =?utf-8?B?emp6MXhIc1lSZVh3Ym1ycXAxQ082TWNQSmxNYTd2REI5WEIySUs0K0tSYlpM?=
 =?utf-8?B?eFBYRGxDWDlrdHpYTDBmcEpmSzJ3N1o3Zk5aOURTSlN1Q05GSjQxWE05VFZW?=
 =?utf-8?B?RU1aM3Fnajkvdno1WEVnU0pXUmZjb1FKS1pzVDRUNWVpTExVbzVEK2hQSkhC?=
 =?utf-8?B?RkMwc0tyNWZkQnpGL0lKYmlPRmdtWGhZeGlkTzVpd1FhaUFsSzkvTjFLOWk0?=
 =?utf-8?B?KzhyN0NvSnNJekVEQkROa0V1OGhxS1N6REVQOGJpRHJ4OUZDb0JlTnVsbWd4?=
 =?utf-8?B?TWg1NHg2bEdKcFNUby9XYVlEOFRET1Rpelg1b2xid1lSaGR5YUtqNE1iMkdq?=
 =?utf-8?B?UDFUaStaT0RWNXptWk1MVkE4a2hucGw5Q0xpZ1hmQURHOFNObiswTFcrak5t?=
 =?utf-8?B?SFoxSStZOEVDenRXaG56S1BnYXpXUng2OEFqRklyYmVnaFZobVBZeEhDdjJn?=
 =?utf-8?B?TUx6c0gvYWhmRFhvb05RODF1UmFja09ESEtNZ2YrcXdhVU5rZEpabmxhUUF1?=
 =?utf-8?B?UHdiOFI1WlBma0xYQzhzWVhGL0lIVjJoRzczZDdxYjBMMlU2b3l6Vk1Mb3U5?=
 =?utf-8?B?MDVMUWVYdzlSY2dTM2xLbldEdFdYTjNCVmlod1g0amxFbXpLMXlPcTZtRDVs?=
 =?utf-8?Q?vCsuEb?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3912359e501148fda5092e9a6e00a5c6:solidrun,office365_emails,sent,inline:3dddf60ed263c9f7447a0163c84f5031
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13f5272a-8168-4b07-427d-08de30da97ee
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|7416014|82310400026|376014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVFkeXZWblFiUE9xd1orV0dXOTZubU9QcUhVN3FaaTdRSnBadHZWaGtwd0ly?=
 =?utf-8?B?ZzRpeEUxTUFXQzRiaWplc0ZETzhId1R3WnVqMXI2d083QmdPVWRVb05vMFpL?=
 =?utf-8?B?OHNQQUFPU0FnYm5tTE9LN1dpUXJiSERncThOV1pJNWNOcDJJZzVybE04K2Nt?=
 =?utf-8?B?QU5FcDZGZis4ODhrVHNIeitYdWx2Q3JrdFJvaGZOWHR6bXpEWjIzTHRtVnF0?=
 =?utf-8?B?SkI1UDZhYk5CdktTd3VFcTVXSEJ1N0ZtUnBTcE5ya1JUbXFJZU1hcDIvZm9T?=
 =?utf-8?B?bjlldTc1U3VuVE9GdkpIRzhweDNoVCt4Vm5EUENGaFVMOXdQQXBDTXFtcHhp?=
 =?utf-8?B?OGU1ajJiRTFjQWhMZlBHYjRpMnNPdUk2SlF1cFZubUNGaFhTTzJQNy91QkhB?=
 =?utf-8?B?eHdvaXhTZGFJQkhkcHZMeU5vYWVLNnRNYnRnV21JeHpGdjZLekt6MjRRZWVB?=
 =?utf-8?B?dUxMZXk2Zi9kWGt1RkMvN3lqeG40TGJmaENjK2J2ZEo4SndqTzdDaGVET2tp?=
 =?utf-8?B?bzVVQlFza2VCZ1YrTmNWbE5xakR4VEEwdDZpMkNvT3IvYStGbi9PemJwQ1Bp?=
 =?utf-8?B?elBaMVhPUStucUZuenB5RXVhYXNzNmNESDcrakFyb3dWWUR0MVNVTHNmdXJp?=
 =?utf-8?B?eWJlT3NLMnNha0V4aDJFRWpySEhCS25lUEdQMXhITXY2bEtzYjV0Qjh2cm03?=
 =?utf-8?B?WThWUWlMaUE2eHk0dFBRN0p2Q3BnSks3OEoxR2NXajBId0NnbGpDdlkyZko2?=
 =?utf-8?B?alpiWUp3QW5OVWhpOGlVaTdlTHJOOXdtWi96K3FTRFVEUEtBblNLelQwVHRD?=
 =?utf-8?B?aEZiR2xLVlo5NlFUT2ZjanpuWWtxZlRhR1BkUHhnZE45SWdQZjlZV1NZcUlG?=
 =?utf-8?B?V242VTl5aGVkQzNzbnlXUytJYjhFWGxxb1Bzc1cvWGdYQUJBZ3VkTnBoUnFa?=
 =?utf-8?B?M0VuOE1MdDZTSXVhbFhHQlFOaVdaVE5jZ1JGdlUzUzhlRUF6Ry8wTVBHdGlW?=
 =?utf-8?B?L0xYZGZwRW5ZeHh6S0NBbDQ2WkpRVXkwNy9sa3h3Y29nOGE0RFRoMzRIVXlh?=
 =?utf-8?B?WU5WZlBLR040RTV0dWJJVkRzU0dHWEdtUzIvS0xJT0t4K2FrWnF6Ukk3NVRm?=
 =?utf-8?B?TU0zYloySUtuemJJOXZXbUNnb2ZiQ1p1TTMwKytNRDZRUVpLTyttRHJrRWFs?=
 =?utf-8?B?SjBvUE1vQnF6eW53M2hLK2NheTZkVmhrMzN0cVhWTTZFek9GSFRzOG83UEhT?=
 =?utf-8?B?SGlDT0hUK2VEWmw5Y2pEKy9yUFIxYkg5amFXWVNJSUhlWmdOWHBlUUZnUS95?=
 =?utf-8?B?amE2QWZjaUdJM2x3WGJFUFZtVUpPMXJDeUN0aS9Wcko3ak43OUlDWFh6VDdV?=
 =?utf-8?B?bUhmVVdZOWVKa3hpUERqTkRXdEFUUTdKZVN3TlFVcDFzOUdFSE1WUlhKRmU2?=
 =?utf-8?B?VnBvVDRWUXlNVWNQakN6S0ZSN2tPMHZtbXJpNit6SEZZMzZIUVF4U0JYUHBL?=
 =?utf-8?B?SERvdEJWaGNVWndMR1JuODRsYW16dFViMStyMnp0UDBPS0VUYVVCOHBQcFZK?=
 =?utf-8?B?cllIa3FtNno0a1dya1VuajNDRHY5NVFJMHRwc2dKVkNFMUxseXN1T05iTGx1?=
 =?utf-8?B?UzNMU0dKR3NmOUF5RTlyeGJOalZBbHJZRG5ET2U3Qy9vWUJtQzU0QmErbUxY?=
 =?utf-8?B?UXlZMUNHLzZHRVJsRHQ2REdDVGxnTVM2QkczT2FwRld1alVia25UK2pOUThm?=
 =?utf-8?B?Qy9yM1Z6RHVSZ3dZb2szRmhhenk5MHZrVXhaWnEyR1RDWEh1YjltK0VBV1NL?=
 =?utf-8?B?MmZKeG5EUDh2WjRzZGhOZ1RpYU1BeE92cFE4TFhqa0JnQVVmamFoNVUwMmw3?=
 =?utf-8?B?K1pWeU9qL1lzTEtoKzg1RHdRRS8yczg2WmJCZE94Um1XTGRJL3JrblhybnRF?=
 =?utf-8?B?MHgraFg5dzZ1bjBiSVBWQXhyR2NzZlA5NHdVQ1puVmljNjgzT2JuVjE1V2dJ?=
 =?utf-8?B?cnNyNlBWRVBQVHNtMnVwMkFOL2VadFhzS09CWEdVWi9MMitqZEFNSDlGZ1d1?=
 =?utf-8?B?aXdHL1JXUDRsZFVYMjdhb1llNStkeUNRLzFSZDZsZFRaWnJpTnI0QlZTdFRx?=
 =?utf-8?Q?lYPk=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(7416014)(82310400026)(376014)(14060799003)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:43.7021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d49172-996c-4ca6-ed08-08de30da9d8c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8171

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..f70b933ce3746 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1205,6 +1213,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.51.0



