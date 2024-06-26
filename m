Return-Path: <linux-input+bounces-4629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B59EE917D08
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 11:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEE91F23D82
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 09:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F972175550;
	Wed, 26 Jun 2024 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="UiCYjQIc"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2134.outbound.protection.outlook.com [40.107.104.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801D116F0D1;
	Wed, 26 Jun 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395789; cv=fail; b=G1be8I3gD1SHYKhJWUL2lRph+w6MJULPb/wU1jONrk9QCtrjUYz+1BFmefsCXY6CTQ0x8keoKj9IaW6oLRCSnxvQ0G2gHCXoJhvrbUVisKscIUrr0C3rJNj5M5w6IBfrjUlnpMti7IlwgZ/CugUdPNSsp+EvYHx7QT6stmed2rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395789; c=relaxed/simple;
	bh=We4djLZrQmwTewoy3TXvLCuEcuRF2BZn64gf0yEafpU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b2b9TFFpQq8jxF/XoIkRuOkMadgttaOOBaxbVxkk44tlZzgYIv53du4AjziaNY/BI/D/E1WREINszmESdg+KCYRn3eF5hM22w/N0l0VXh+v08p3d0peeCj/0OAfSkZTEWR/sHiJ/uInnUvqHZ1hIxjzCZ5XleHgV87NiDi9meJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=UiCYjQIc; arc=fail smtp.client-ip=40.107.104.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCi1vMbb1booEQ5+ovz0I1f0yzfOLOU1RRSwuc1iA8zAEhpwcAsnmw6H88lymkzowhriWAbhBuWW90Z97o3dQCzS20b2nRRqXwrtXsFXH0UTBGeN7GZ2U0/D4VY5bKk0Yrkg0prsCdWJoWqo7DzZ/qKCYE76LUddSQs+lX1o5uO2pVcL5mxd8UdZoy5SCKV3db/umOnEoxZQ84RYVcILt/zuS2feDZ08d1HXos22nB4nAciFFbXnkqkG1ZLmITjvT1WiEzCB3OWRlyw24UkGTowq3h8RySkcuXSbGjjQ2SuHi01n1673DxJlGs6dNdveQA/xzsgCPPDEWi06evRgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRUe7KDkC01XwoHUft0RG9xZV2wyedfrobtHpSyaX+g=;
 b=FBeMhlwBUBqcwB8kFqb675DwjdqoqL5RGoP92ljtj91MzpRNLuhbbgq8dCp8990E5v/JzGYTdl7aOapBO2i308yPP0uv0a3bQ7RmWVY6uw/Yy4QRpV21pu9XduKYvfmSO+/vRVIu2yKG0Dh6xnDtWsml0NcP49piemrmQnxaEPDbai4+DaeD8RRPmKV+F+v9QZoLQxfCoiDpO730hg8fjE4yO64IgudbEC5HtGS6xaTMPBvNJMDzunhZXMh78Zalo8acCos6o5AtmAg/5SDkGD+/AjtLJI4gEM4MP0D2dnT1Te+ZQy9r6tQzzY003FzgD/oLEcxbJKw6OGjP9SFJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRUe7KDkC01XwoHUft0RG9xZV2wyedfrobtHpSyaX+g=;
 b=UiCYjQIc9WzBNVC78GkJQ1CUJR3kFZYFiI14+ZrLXqk3Kht1J2Kh0qE1Hgz9QD7tlsblVkRIheq3LTvm+Ez/Dm57PB5Ay5xAb8YmuYzwIgzgBKtRIBIjsPUhCNFr6M+gtSMJRuptABTrled2LeLdgJKkZumPXFGunZ56xmrDttE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV2PR08MB8679.eurprd08.prod.outlook.com (2603:10a6:150:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 09:56:20 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 09:56:20 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 26 Jun 2024 11:56:13 +0200
Subject: [PATCH v10 1/4] dt-bindings: touchscreen: add touch-overlay
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240626-feature-ts_virtobj_patch-v10-1-873ad79bb2c9@wolfvision.net>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
In-Reply-To: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Jeff LaBundy <jeff@labundy.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719395779; l=7148;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=We4djLZrQmwTewoy3TXvLCuEcuRF2BZn64gf0yEafpU=;
 b=YlK4JaFidAVMRn33kw1XiwovX2umUaWolUAhUf5+jWXp1ufEs4jEbzu5fz9EoCQAQOa3fabxz
 4NqfySMMCDxDjKgtwxROK1H5apOPE6b4GAotRXyhlnboxGs1HI7BdAE
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV2PR08MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: a988b97e-b829-4cf2-ebb5-08dc95c63a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2FDd21rUFFESkM4QzZsR2ZoSkZnNlF2K2hrdTNXWFZ1VjQ1RWdKRHBWYzdw?=
 =?utf-8?B?MzI4S1N6TGttdmNiV0FObzhpTHlBaU9pR0hnTkNSekxLcTFFMjIzNnhNaTVT?=
 =?utf-8?B?UzF0Ri9PbW9YOW9XbVlCd2lRdndWaXdsM3Y3U3A2aWxTbWpMcjV2ZTFZY0dG?=
 =?utf-8?B?cXc4bFBJMitPZUdxTE1FS3Q2WlFGenpVcWRJVUk1QlRKUHFhaTM4aHBDUEVv?=
 =?utf-8?B?TGI2VVhMais3ME42UGJTM3F4R0IycjJyZTRqYnpUbURsN3JJMmJwaUQ5OUdC?=
 =?utf-8?B?c0lPcUxpakN6NjVteXJvTE1qVEhPQmNkL3pJamxyMk9oWm5MVVRnUk5rS3gz?=
 =?utf-8?B?ZXB5V0NHY0JoUTlickE5TkZFWlNsMm1RQUQwZDFzRTg5T0cwTUduZHFUemo1?=
 =?utf-8?B?dmF5M0NqcnEwbS9PSXUzVWNCamg3WFpFNXMwQnJZNHhKaE15dE5DU08vbWRy?=
 =?utf-8?B?QkZNTkJrRDRJanVIWVZVUDFZMm1SSUtJUnZuUzRKbURJWHhqbkJzQzNxSUZl?=
 =?utf-8?B?bHc4WTEyUXdhSFdZM0dlVUZLRWxSczBBZVlVdFBrNGRvMUQ1NTQxMHk0MmRu?=
 =?utf-8?B?NktsaklleWFQckF0MDMvd2tIbmxZZk9MM1c1K243NHdEVFQ0ci95UFRadU1T?=
 =?utf-8?B?Y09jRlRBdUdKMG42NUJtSW5UOHp5MGk0N2k2bWNqdXJnMnUvc2NHQzQ2ZmhH?=
 =?utf-8?B?bFdUdjRPYU1qQlRvVkQyUEZVVWdCWnAyZEJnRTFmKzExSmpjbHAwOEJNc3Vk?=
 =?utf-8?B?MlpJaExKYlVjMDAvRW93OVlRZlRFajRBRDZ0bmRXWXBDQWtJM0NFOGNwUWtB?=
 =?utf-8?B?UmZQUVQ2alZaZ0ZsUVFJZkxLQmdoNE0vQTBnR205eDRIRWkzcTB0eXZxc2V3?=
 =?utf-8?B?VjI3cS9NL2lodnBpdG50S1VCK1NKYjZWa1dBVG50OElaTUtJd0JrY1VPTDlv?=
 =?utf-8?B?T2hzOG5vaDZHRWpRVVV0ZHVnS3lZNHNwdU4xZEJGYUJQUytQVXFCTUY0cDhm?=
 =?utf-8?B?bHhwUVpBZkpvdW9CN1cvWU0wb2poc09iQVVEK2NzMXF1d1lSVGluUk9Edytm?=
 =?utf-8?B?dmNVNWVPcVdHVTNWQW52RnMyRVlEZUFsRkZnaG84TlI5cUdwVFRBZHRrVFBj?=
 =?utf-8?B?empnK0trdVVSSGtNQ2JXY1dPNEthNUpEL3pKTFpQYUxKQlpjQU9sb3lhd1lk?=
 =?utf-8?B?czBsZS92UEZyMHpibmUrcUloUmpQWnl1UzZFVWJEVlhzZFZ5RTNQS1pJby9R?=
 =?utf-8?B?OWVRRXV3SUxVU0M1dlRsc2I3WVAvQ0NVdEd0TGNrRC9lSElucFVQNlh3dE41?=
 =?utf-8?B?Sm9RV2JRRm9ldHlBT2VzOEVqRlprNG5MYWhFaWxVcWVUSHFHdnZ1c1JsUVdD?=
 =?utf-8?B?VGFTZExqQVJsaUM5RDdJdjRhaVNKd1l4WDQrQlpzNVhuOHVUdS8waDdRNDZ6?=
 =?utf-8?B?SUNORGxjODVMbmhhZGlJaS9FaXR2Z01KeCtvdWVMSE8xb2g1NUVVdWw4eDc2?=
 =?utf-8?B?OEdOckhKdkRyZjZkMlBaSjJrYmcyM014Mm1FcG4yOEZTRjU3dGZwaVVVckVr?=
 =?utf-8?B?MkcrdG5GSTV6Sk9ZZjNTcmFMV2YzK1paNlRjMk45cnl5a1lOaDZ5YW5YUlJo?=
 =?utf-8?B?S1dObHJETXBTY1pKd0tWL2I3eW4rNGs1QUNmUEl2TVRSUHRBd09xYnJidTFp?=
 =?utf-8?B?OThxaE14RHMvMEgyMjRFM0NJMzk1ejlxZ2ZxUFJuT01hVGJrejhnU1pnZWc3?=
 =?utf-8?B?NTR1YjYxcysrWG1TdmRTcDJmTTdhNWNoVEF1b2ZhS3lnRnlxYkFFaWFjY1JR?=
 =?utf-8?B?SkduQy9adnc3NjM2andzZk1OWk5QUkd1NE05b0hYRGN0NkNOYkZIYnFRNzBO?=
 =?utf-8?B?cERKQ0ZOZmJnZlpvQmFIbVNyZkhDZ1kvYncva0ViY1N6Z3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGJTT1loNDNURmFXWDNVRVhGbHdJNmxyMFl4MWhzQy9sbHJ1QTB4R0dsRzEv?=
 =?utf-8?B?RUtTUlU1T3Zxa0lPdkZ6RnR2UzlCRXlxVHpFNUswb24xRWwrcXJWSWw2THdG?=
 =?utf-8?B?UWJ6L1N0QjNac1Jrd2EvRjVmOVUrcnFtTGptbU1QeTUzelBWOFdsbVVrbHhL?=
 =?utf-8?B?dGxYR240SjhkcmZLRUlZdytSeGg2b0U4NEVRSldjWHM5OU1GWFNwVitleWha?=
 =?utf-8?B?UGpCRTZJU0gyZEV2OTlXdndKanppVFozdVVqVVdYS0xDUlR1eFAxNDZ1Q2c2?=
 =?utf-8?B?b2lPZW0ra3E0dUZMM1h4WlpOZEh2MUhWYXV5R1JuMy9pQmQ5cUZRUThWSDM4?=
 =?utf-8?B?YXRLaGN2Z2ZwTXBjeURpYk1vNkI5bE11Z291YUJnNkpEdkt4YTJ6bWxuT29G?=
 =?utf-8?B?N011MkJoa0JsUUZua21UdHZtTFhCaGtJaTJoMm5Eck1CMHY5cmdtQjdOMG8z?=
 =?utf-8?B?STJjR2EyYWk0SExGMklXZWNoT1JOSnFZSzlkL3lRK3BwMm5GNm05SHdZb3Q4?=
 =?utf-8?B?SW5TR3dsWityY2I5ZGQyL3BrRDZEV2ZyNEhqTytvMjJBc0VtenV2YTFxdjlh?=
 =?utf-8?B?M2M0Mm5aa2xZVUF6NmxvTlhnTmtlMTJLSDZHb1BXUkdIT3BDVXdrTHhZamdX?=
 =?utf-8?B?TWsrMGNtQnNNb042VlFpZzBXSTJYZDY5RlJ6OGRvVGNwMjIzdUZneGl3cFNs?=
 =?utf-8?B?NzYybUc1TkFTZGlSUjdGNWZLWEhhT21URUlMZngzK3BMbXlxNWF5MkFjQUdh?=
 =?utf-8?B?eWR4VGFGY2w5UWliVFJRSUZBVnNscFl3cEdveU5BOTBjOXhFcWVnTkFJUXFR?=
 =?utf-8?B?RTk4bzFuSWJtMTBrT0k1RDBtUE9vWkZOMzJsTWxoMktQbmxUWk1TK3RqUjNP?=
 =?utf-8?B?S0JUaUJrbmtlVldSZWVjd2FKNzZzYmYzbjVzQkxha1VqbTlEdGorUkMyVVU0?=
 =?utf-8?B?MStyOExPWTBLSUJDSWliMHlKRjkrODZWbnZLM0Z0YXAwQkE5MUFhZk9LbEdB?=
 =?utf-8?B?ci94UFNCM2lydEpvR3lhSzJPb09sQ2poK0ptdSthMHd0Uk5XekN1T04rNWdr?=
 =?utf-8?B?U0JNTTJMdnNONzJyR3lrYkZOeWllM0VmcXBJaW1lQk15aDErbk1EYk83UXpi?=
 =?utf-8?B?bFpNVXhZa0NjVW9lanVhOThoSE14T2RmTkR1WnFhNCtGMyt0Q0t1S3dDS2VJ?=
 =?utf-8?B?aWtGdWJXRUxYWmdsZnRMd0MvT2x6b0pnU2g4aXRRS0x0eXo1MTlTZFZlTDFJ?=
 =?utf-8?B?OVBmcjJTTGE0K2ZrdHhLQlpiMHVBVXcwRFFoRmlrT2d6c0Jpa1JZRkJCY1RB?=
 =?utf-8?B?cit1eGlUOXVwQk40YTR6SGZSV3pNRHFGU01SejFYVEo4bExGNUVFVG9ia3lj?=
 =?utf-8?B?aXpZUkFiV3ZtZUcxYmt3cWRwS1hocm5XTERHci9QTHc4Z2NVaWlrSWdaeXd0?=
 =?utf-8?B?SzZrVTBuM0hPQzA0L1N3MnFhb0FFbkpwOXRJUnZ5aXFmajJGZnR6dWxIQlRa?=
 =?utf-8?B?elRob3NpZWlobFZLcnNTU01NeEpuNUtGS0I2aVJobUlQRWg3WXFyTUxaK1Ru?=
 =?utf-8?B?cUpMOWxidU9LdnBrUXFJdXRTaDV2bnV4WVhqSy9MM2FBbkxHSmpUSHZSNXNy?=
 =?utf-8?B?UHV5aWcvZ0hxOWd4eUdxMGdyY29qcjEzS1ZBak1oVkFqVklzWmNUY1ZsMmxt?=
 =?utf-8?B?enB2NzhPUnYzSTRJKzlESXdDNGdySklIWjRYUnFLK3lnVFdGelJRZTFML3FY?=
 =?utf-8?B?TXhOTTZJQVpHTVB2aTRybHpTNWdralNjWjVVQmdIQ0NwaEgyV2lsZUU2RlMw?=
 =?utf-8?B?Qmhad09ORTZwSnp0SGNWL3VXdis2ZFpYaUpoUjBRRGoxZExESnI4Z2VCN3BX?=
 =?utf-8?B?aGkzbUtTSktNanBMQ0MzYWRSbmhYbXBJZkFOZ2hKMCtCOFJiREFCYkVTQTBh?=
 =?utf-8?B?WWJaL1ROSWE0QytqYjgxcnlGOGNJNU05NUduVTZWclVxU1MxYVpZaERNMWts?=
 =?utf-8?B?T0JuS1A5U3p4cUl4QUYvZHhyb2tOMHlVYVk4TEx2VUtZU3BHM2ZTWFlvUGxl?=
 =?utf-8?B?UWs0WmpPTEIxV1dxcW5BbWtjTkJYTDdRYXdiYzhNUmlOdlRpZnBSeW5YRDdh?=
 =?utf-8?B?bG5EdytFcjhVRjJraE53d3RRdDd4bE1qMTdaODd1M1lFVm9MWnJNNERRVTJ0?=
 =?utf-8?Q?F8l8u+R2Haq6tY729a9luHQ=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a988b97e-b829-4cf2-ebb5-08dc95c63a86
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:56:19.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOIXqecYMEBws73wjpv2ogeZLtE/2K7L2Vig7BGKlg2ftbB0rvFSVDUs06qRXh9NmE4YdMi8nknm/yuaONedUyGvwHKETn1gTTlBNnjVEIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679

The touch-overlay encompasses a number of touch areas that define a
clipped touchscreen area and/or buttons with a specific functionality.

A clipped touchscreen area avoids getting events from regions that are
physically hidden by overlay frames.

For touchscreens with printed overlay buttons, sub-nodes with a suitable
key code can be defined to report key events instead of the original
touch events.

Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 .../bindings/input/touchscreen/touchscreen.yaml    | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 431c13335c40..3e3572aa483a 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -87,6 +87,125 @@ properties:
   touchscreen-y-plate-ohms:
     description: Resistance of the Y-plate in Ohms
 
+  touch-overlay:
+    description: |
+      List of nodes defining segments (touch areas) on the touchscreen.
+
+      This object can be used to describe a series of segments to restrict
+      the region within touch events are reported or buttons with a specific
+      functionality.
+
+      This is of special interest if the touchscreen is shipped with a physical
+      overlay on top of it with a frame that hides some part of the original
+      touchscreen area. Printed buttons on that overlay are also a typical
+      use case.
+
+      A new touchscreen area is defined as a sub-node without a key code. If a
+      key code is defined in the sub-node, it will be interpreted as a button.
+
+      The x-origin and y-origin properties of a touchscreen area define the
+      offset of a new origin from where the touchscreen events are referenced.
+      This offset is applied to the events accordingly. The x-size and y-size
+      properties define the size of the touchscreen effective area.
+
+      The following example shows a new touchscreen area with the new origin
+      (0',0') for the touch events generated by the device.
+
+                   Touchscreen (full area)
+         ┌────────────────────────────────────────┐
+         │    ┌───────────────────────────────┐   │
+         │    │                               │   │
+         │    ├ y-size                        │   │
+         │    │                               │   │
+         │    │       touchscreen area        │   │
+         │    │         (no key code)         │   │
+         │    │                               │   │
+         │    │            x-size             │   │
+         │   ┌└──────────────┴────────────────┘   │
+         │(0',0')                                 │
+        ┌└────────────────────────────────────────┘
+      (0,0)
+
+      where (0',0') = (0+x-origin,0+y-origin)
+
+      Sub-nodes with key codes report the touch events on their surface as key
+      events instead.
+
+      The following example shows a touchscreen with a single button on it.
+
+              Touchscreen (full area)
+        ┌───────────────────────────────────┐
+        │                                   │
+        │                                   │
+        │   ┌─────────┐                     │
+        │   │button 0 │                     │
+        │   │KEY_POWER│                     │
+        │   └─────────┘                     │
+        │                                   │
+        │                                   │
+       ┌└───────────────────────────────────┘
+      (0,0)
+
+      Segments defining buttons and clipped toushcreen areas can be combined
+      as shown in the following example.
+      In that case only the events within the touchscreen area are reported
+      as touch events. Events within the button areas report their associated
+      key code. Any events outside the defined areas are ignored.
+
+                  Touchscreen (full area)
+        ┌─────────┬──────────────────────────────┐
+        │         │                              │
+        │         │    ┌───────────────────────┐ │
+        │ button 0│    │                       │ │
+        │KEY_POWER│    │                       │ │
+        │         │    │                       │ │
+        ├─────────┤    │   touchscreen area    │ │
+        │         │    │     (no key code)     │ │
+        │         │    │                       │ │
+        │ button 1│    │                       │ │
+        │ KEY_INFO│   ┌└───────────────────────┘ │
+        │         │(0',0')                       │
+       ┌└─────────┴──────────────────────────────┘
+      (0,0)
+
+    type: object
+
+    patternProperties:
+      '^segment-':
+        type: object
+        description:
+          Each segment is represented as a sub-node.
+        properties:
+          x-origin:
+            description: horizontal origin of the node area
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          y-origin:
+            description: vertical origin of the node area
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          x-size:
+            description: horizontal resolution of the node area
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          y-size:
+            description: vertical resolution of the node area
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          label:
+            description: descriptive name of the segment
+            $ref: /schemas/types.yaml#/definitions/string
+
+          linux,code: true
+
+        required:
+          - x-origin
+          - y-origin
+          - x-size
+          - y-size
+
+        unevaluatedProperties: false
+
 dependencies:
   touchscreen-size-x: [ touchscreen-size-y ]
   touchscreen-size-y: [ touchscreen-size-x ]

-- 
2.40.1


