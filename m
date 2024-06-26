Return-Path: <linux-input+bounces-4630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C772D917D0C
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 11:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA24C1C21F89
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 09:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8603517836A;
	Wed, 26 Jun 2024 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="q7AEez9D"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2134.outbound.protection.outlook.com [40.107.104.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAF176247;
	Wed, 26 Jun 2024 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395791; cv=fail; b=KU1ry2ReyDK8offjE59WLPiQsYarogy7TbGbkQ5NyA8h98Sro5pJjZ2ib+489zHZ2WatxCKaGT7hlzg9Zqykmi5BVY/UpXZq+rYEak8s1+JQQBiet2OAH17jQoLqy3xPO/QBazoJ38d2EOQQMl2RVPznLpTgaWd4R+UzF6OVNrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395791; c=relaxed/simple;
	bh=6B/C0oxZu4Olzt/Ju5SccabXqApih9npj2j2VCrFKU4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tnPWRtteUR+gl2gLyPqy3e4YPcTC67HT07WH2MXWEzkzysikwIEza52+y2bEbb00Nj8LGLwhG/kY0vNRh66BjXBlUNFvIv42xRPZGcT8TzKNe/aG1r14gkaFNkbmkp0Ox8XfA9lhOIIXnZKrDIgmOe8VdnPjVsMBbS00mrsOes0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=q7AEez9D; arc=fail smtp.client-ip=40.107.104.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDeGyQvAwih8MWSfa5JaOBzK2kiHIHUFOeZqBnIKtoxdLq2dnzN42GCV/a0te507Pb2Nb1IjDj+JHlOdavr0V7O98G3CxtPqwresk/vhtI9S0ky2Juw6zUmWqHBsy4uCnbRMlt2YUXetRONyOUbJdt+ZLVG3+wD4gUEzKw3CD5pj24283rx52jdUz+AKDsWmNQapiegkSnGf7mP+twyxPPNDtkYm9Bnzm07JpHReSwLTnpai0HSucwRFxEFnNxs2YWaWCPYdfo6/xxKBIQ0NzZpYzyVQpMNiiYuD2RF1GH3Ogg/DU059GxsfWO4w4zOxbCcEh+3PSwyIMBrV75z/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roqc8FkYwAZlQedOCVa4cYily+ZuhxMgO69P0lr/2eQ=;
 b=UPNz72BBSt2ejUJymk7Y72imditZgf4wE8y7amMSpdehCw4zPk12eL1SjXRm1bFmhnOZNhBkfla0kypS/auBDIYqj/zGS7wrSHNVbiknCrUMNyVFu39zVHrQ5fVM7RIoC5SfnwSezngf9APJwiLI0VvfnMAFUSvo6y1NfSTd3H6qR//SPLvn9CS5g9UzKMZyPr6OmLoixXKzn3CBluA2hxwMk9FvG9+d9whO98h9QMBfVvYcm5ERjoOydNPzan+B7DVkF/C4Kg8Eujgp7SDJL2r6LEjM1DxSrllj3727XsZkatFmIFjY/3raN6j/GryR8eq3hw4tunOswYOnGQjHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roqc8FkYwAZlQedOCVa4cYily+ZuhxMgO69P0lr/2eQ=;
 b=q7AEez9D9+Jas7pYpsPS/94r/oblNuL+Rg9SJ6rW4VpcehZxU61KyD6PsMZaWzufJFlj9T7TSO3nniic5oW96iVlv7PxnRJRpipFx61RHxQ8D5f697GvrbjE9MpoJwNRJHuDBriart8ysOrtiMin+eGma3R/s/hZtdE3V85JDqA=
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
Date: Wed, 26 Jun 2024 11:56:14 +0200
Subject: [PATCH v10 2/4] Input: touch-overlay - Add touchscreen overlay
 handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-feature-ts_virtobj_patch-v10-2-873ad79bb2c9@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719395779; l=10965;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=6B/C0oxZu4Olzt/Ju5SccabXqApih9npj2j2VCrFKU4=;
 b=1Xt6RN6QiGWGylIWBlZL+TFXHHgw0SKrZf/j0VGo6maqQcpjoAbQkmIg5/2RyqiC1ySeYqgpS
 Ut3LAYKCiuGDx/OllYJkirABOO/q6X6wtFOE1hnioKMrr9/bpM/3ECJ
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
X-MS-Office365-Filtering-Correlation-Id: b232ca1f-7702-4b1a-9bc8-08dc95c63abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmxCNWlDU2ZVUzYzN1R3bk1OUStqd2oxT2wzcFUvTjY0dnMxNzZrcGs0djVp?=
 =?utf-8?B?Tm15enp1cXlUZngzdmZEZ0ZEOU1GNEROV0ZNV05RUmNxV2R0QXF5UDhnQUxx?=
 =?utf-8?B?eStjNG5KbEZQeGpDdm9ZMjhwSnRlT0RJRFpWQVVnMkFFWENtZi81VDd3MHNK?=
 =?utf-8?B?UWtCQm1QKzdHZzZ5T3lDdGRyVFgvenhvbWs2K3ZMM2d4dnZSY0ZQNzhRVjRr?=
 =?utf-8?B?Y1hzWmxGQzVDZVZRcGhnSkQzSnJFa1AyTlFNakw4d0pMQzMzVUdJTFUyNUcr?=
 =?utf-8?B?c0JHdWMvbHl2QzA5M1A5dnRsNzg1Z2ZVRXpiRUhUOGV0Q2xqdkhycWc2WDYv?=
 =?utf-8?B?WEw3bThjL1hqWVFQbXVGaTB1bGdmMDN3Z09tVUlXS2RPMVJZY2NPS09RQzU0?=
 =?utf-8?B?dExseHF2bnZYUGg1YzJ1eCs5MUE2T2Z2ZFdLQjJhc1p6ZVVxdkJlYytqRlhY?=
 =?utf-8?B?V2VBRHlRMTRGSXNRTktxcE5ZUjc0djFyZjNndEw4UTJYa2FTMHdpVWNOeEpj?=
 =?utf-8?B?Ym8vdXhoVlkxTWY4Yzd3VUlXVWVSU09tcVVjK0pQQy9iSDB1YmFpQnVCNDlV?=
 =?utf-8?B?SmllQmlsRVJUNUJWSmJreFQyTXltYVoyVGxOOWdlR2dOV1Z0c2Jhd0gzVWov?=
 =?utf-8?B?Qk5Hb0hGTVlZN05IcHJHdkVibjYzNi9YQ3FLK0V0cVN1MnYzeEkxZVFlSG1X?=
 =?utf-8?B?YnIvUmhVT21lSHlXdTc0bmNaUVpva21MOFJMZzEzelUxQkV5UnZQNEh4WG16?=
 =?utf-8?B?UUJlazcxN0hkenlGV21zRVlVenVBVzdsbThDRUpEdkF2bFdoRlpFdDFzN281?=
 =?utf-8?B?L1Q1eEp1Ylp0YWxwTTlZMkdzK051aFNkbklnNUhDYks5bHJxNzFsVjhIRXNy?=
 =?utf-8?B?YW1UUjZLR0l3Q1ZibFptdW55aUwxUDZ3V1FGbytOUEd1aEpRWGhNNE1CNzky?=
 =?utf-8?B?RS9OSVRZNmRMQTBRdkM2TjZSQkNGZ0lNblk0WkVudW91L0tNSE1vVFZrRm9m?=
 =?utf-8?B?ZG5VbzZvS2FydUkxbW5jTytTZmVpUnFHVE14L09DWkd0U3gwY0UvUU5UZTg0?=
 =?utf-8?B?VXZMditySmZqZUxLL2l0ay8yTEt4cU54QzhLSzRWZitsbnBrMnkybStzSWJ0?=
 =?utf-8?B?T012UXRZUy9NUDVJMC9BNGwvM1grbVo5b1ZyOHZTMllPREdJbytXN1AzMkJU?=
 =?utf-8?B?S2Rpb08raERMSVdOVmtLL2VPeFlZNFh4QWVWb0VBVDNGWHhKRURMZndnYlQv?=
 =?utf-8?B?cXR5aHBjR1dFY3NNZnVDaG9uZ21Lb2V1SWE3USt6VnR0RDBvVnZpODRJNWl4?=
 =?utf-8?B?Yk4xV2ZEN3FsM0gxRDJQajJ0RGt0VGs1S2szRmtOd0x2VW0yaC82M1JudGhQ?=
 =?utf-8?B?NzZRYkl5ajhWU3BaZjBHVHpsRkR5UXZjTFlJZjhqSVU0cHljRzBnU0hxZEk2?=
 =?utf-8?B?N2xXV0pYakRwUWVHRVRVRW9VMUVEK3dzdVhSNXhVdFQ2NFNFbW5GejFFZkI5?=
 =?utf-8?B?aTViNFpvYkxTSCtUb0Z3eG1OcGR2bHMxdC9rTnh4ZEJvdUs3TSszaVpzSGFS?=
 =?utf-8?B?QnhIeVExZVZGcjJETjdiTWFEUFNyRUtoaHBuRjBsdWROMEpCWlFZcThxak51?=
 =?utf-8?B?YVJqMnhRNndmS1REUmF0UUlVYnBIcmVxSWNhV213L2pMNXVrUnVPaU54RXFs?=
 =?utf-8?B?ZmhnRFFnYXJHVG5vQUc4TFExRkZLUUcvY052V3hNRkhIVEFHSVVWcDNwVHhN?=
 =?utf-8?B?TGtlUmNrQWZPOXFTQjhiM1VFV0pBbTVua2F1N0N5WVNCdzBtR1B1TVZxc1Rl?=
 =?utf-8?B?c293dnhIN2s1Sk1uamh1RGlPTVh1aG4vZjlCR0hTdWp2eXEyR2IvOGFpZnc0?=
 =?utf-8?B?bGVwVVNMZUk0SHVxQW5lUXpzeUNNa3FPajBHd3ZvNFpzbFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEpxbTRqUHpudnBCT3F5bDZMMUxYZ242dDRzSEV1YnlUN3hRTDQzV1JwL1pX?=
 =?utf-8?B?ZWJrbmhYY1JpWkhBVTNySTRNM3ZOcHFhRG1GQzhmYVZmR0ZXQnZoS2Yrbndh?=
 =?utf-8?B?cUgzMzJITmNSaUwvU3VQMUpiMHVRQ3JyK3JxNmdKaHVmVmdvV0ZMbnpuckxG?=
 =?utf-8?B?eUU5c2R6M09mcUowdTNhb1VGT2xZdVNEcnprd2c3Zm5zM0YrZzY3dFlBejBt?=
 =?utf-8?B?aXJpRlFCL1U0T3FONmxkZjNDdXM5L2N4RUxqMjRHUGZVT25oaVVuTG1VQ3p2?=
 =?utf-8?B?QlFTRzNkNE5yTEFPZE1vNWZVajM2MTlMY0hLd0F5WnB4NXdDVThQcFNHeU9F?=
 =?utf-8?B?M0wxMzZSR3NrNVpKcElKWUtMRlgyL2h3QUxMWTNzUW16a0Z6OFNiSmhiL1c1?=
 =?utf-8?B?ck5zQmZRQXB2aWhVSk5nRkt6THV4VzQzU2hxM09WM2RYUEpLek1iZGpCbzlC?=
 =?utf-8?B?MzhHNlVzRGRNWmdZWDA1ZUZqY01CYXhZRG5Ba2I3QnQ0bFY2VVRBTmp3Y0g3?=
 =?utf-8?B?ZjZjM3dkTHJ1QlJyUFpralVQZlgyS2JrTzY4NkVzSnJvNXUwL0RoRklTK2pC?=
 =?utf-8?B?cHFjUFJudW9pZkQ1Q0NsdFBrejlzVWlJV2xVOWJhYVZXQlhHZENkR0svTGJI?=
 =?utf-8?B?TFhaR0hLWnRkdEQva0tSOXJJeFEzUjhDVThYait0YktxcWUxTDhIR3gyZHNo?=
 =?utf-8?B?NmxxQ1lZZjVjSXRvdzVRNHpUYlVYcjVRN2I0R2dHeHhFOWZKZW1WVExyaTM2?=
 =?utf-8?B?ZXFsN0lRTlA4NTRIVDI2RENnd2lRQXpQL1RMVjBmMkpSU3RGakR1TG1SRk11?=
 =?utf-8?B?YlVaY2RJOW1SenB2ZE1uTEhSamNuVHBDZ2VEZWEzd0dSRDRuUVIwbTVNSG9B?=
 =?utf-8?B?VWhDZWwxNmdOUWpBK3BTRHlBT3E4UFBXZlZyb0ptS2M5eHgyR1VteTF3bHcv?=
 =?utf-8?B?UWg5Z1paTWE4cSszd0FLRlBRQ2pueWN1bFVRR1V1Qk9TbGUvVUxpNU50bmNU?=
 =?utf-8?B?N1V6QlBSZDQrS0I4N1MzTGZWSFJwK3hZR2RzWjd5M1cxb1lNdGYrV1poNWhM?=
 =?utf-8?B?dXF2amVEUDlnWTluWXZzTlByM0pMRmU3cVg4c1JwTUM0Z2J5N25FU0NEMnIz?=
 =?utf-8?B?bFh2S0VmMnozdXVaOXg4QktEak1vTjhkSnp4VDF5MG5HL1VzV1hxaFNCRjI3?=
 =?utf-8?B?QlJaaUpFNlgrK05majJkRVI5NmFOR3ZyYkV2WjZBR09wd2VxNWhYYW5NUENp?=
 =?utf-8?B?NlBqSmlRWk1wOFN5UWVTYzFNdFBVdzlnM3puSWZ4UkQyaDdtTG5yZDdFUmw4?=
 =?utf-8?B?RjBxQWlqZ0E3RkxPZmYvUUx5bjJpSU1Sa0tmVUliOWE5Wnp6U1JUc3orTzh2?=
 =?utf-8?B?MndhTThJSUhTd0w4dDdvaFZlUGhhcFNuKzJTK0JyYm9yWWlRQ0kwaXd6TDha?=
 =?utf-8?B?dEpjNWtOMFdwSlhsU0ZnR2QvOXdlNlBUWENCVW82ZHdrK21zc2ZkOVBFcXNv?=
 =?utf-8?B?SHBtVWthLzIzbDdKNUJ5VDNUbzdJLzVHZkxpVjc1OEx2OUxud2lBNnZvZjlW?=
 =?utf-8?B?TlI2RFJ2MVJpd3ZZTjZqUEF2dEFHVytwVGVXZDNtQ0Z0S0dYeXUrU3dKblpY?=
 =?utf-8?B?RXZPNjEzRTFyVDRsTHJVTUdlaTFHbTFBVnBZeE5vdEFUZCtWdjlCM1hTTDVq?=
 =?utf-8?B?dWRiaVBod0gzVDZGS05aMUcrUmhYbmRaNGJ2cFFhTzhXY2Z2WDJhc1ZBR0Fs?=
 =?utf-8?B?RnV3bzJYQkVoSnpPRmhTY1Jta1BkOFhYME8xUzJFR1JZcWhGcUlId1huaEhq?=
 =?utf-8?B?UnlMN1RoOGp6bGI0Zjh4eHZJL3A1RnJ2VjFlR0NjT2FRRDY0RzRkdE03b1d5?=
 =?utf-8?B?U2Q4RkZiMktKaVNJQnpYcFd5cHUzbkp5WTA0WWRJZ0UxNW4xM0xWNjBVS1lE?=
 =?utf-8?B?MmF2TmJYQXNzOE9HN3Y4RUpwNTVrVmRkSGxHTkNIeXJORGIraU1Zcm1IRmJq?=
 =?utf-8?B?T3dscWNuSmtoSUc2bnpRYzNMTFc3RVZSNThFRmdiUmdWajAzeHI0MVNQWVla?=
 =?utf-8?B?bFFscVF6L3ppaVBQZXZFbVJrbnozRC9tMGgzcStLMTV6Wit6SlQ3N01nazkx?=
 =?utf-8?B?UVoyNWN3NHBMbndxN0IzUVBTZ1Mrc2pLTUlkR3ZlVGJkdE5GaVFqZkM5eXNL?=
 =?utf-8?Q?Bv/t2QeaPMFn97FgX6thIYQ=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b232ca1f-7702-4b1a-9bc8-08dc95c63abe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:56:20.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTDt+aFBU11V36Lnsw55YASfxItcHltMBIPHhyo5g97C8ay3PIEYR8Of1a/vTS5cFoz2vcEj1E/auoWq9NyqbX0oj/hCyWKET4wGX2jpCcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679

Some touch devices provide mechanical overlays with different objects
like buttons or clipped touchscreen surfaces.

In order to support these objects, add a series of helper functions
to the input subsystem to transform them into overlay objects via
device tree nodes.

These overlay objects consume the raw touch events and report the
expected input events depending on the object properties.

Note that the current implementation allows for multiple definitions
of touchscreen areas (regions that report touch events), but only the
first one will be used for the touchscreen device that the consumers
typically provide.
Should the need for multiple touchscreen areas arise, additional
touchscreen devices would be required at the consumer side.
There is no limitation in the number of touch areas defined as buttons.

Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 MAINTAINERS                         |   7 +
 drivers/input/Makefile              |   2 +-
 drivers/input/touch-overlay.c       | 264 ++++++++++++++++++++++++++++++++++++
 include/linux/input/touch-overlay.h |  22 +++
 4 files changed, 294 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ca8f35dfe03..fbe2824d99c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22739,6 +22739,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/toshiba-wmi.c
 
+TOUCH OVERLAY
+M:	Javier Carrasco <javier.carrasco@wolfvision.net>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/input/touch-overlay.c
+F:	include/linux/input/touch-overlay.h
+
 TPM DEVICE DRIVER
 M:	Peter Huewe <peterhuewe@gmx.de>
 M:	Jarkko Sakkinen <jarkko@kernel.org>
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index c78753274921..393e9f4d00dc 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -7,7 +7,7 @@
 
 obj-$(CONFIG_INPUT)		+= input-core.o
 input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
-input-core-y += touchscreen.o
+input-core-y += touchscreen.o touch-overlay.o
 
 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_SPARSEKMAP)	+= sparse-keymap.o
diff --git a/drivers/input/touch-overlay.c b/drivers/input/touch-overlay.c
new file mode 100644
index 000000000000..5f839b206358
--- /dev/null
+++ b/drivers/input/touch-overlay.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Helper functions for overlay objects on touchscreens
+ *
+ *  Copyright (c) 2023 Javier Carrasco <javier.carrasco@wolfvision.net>
+ */
+
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touch-overlay.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/property.h>
+
+struct touch_overlay_segment {
+	struct list_head list;
+	u32 x_origin;
+	u32 y_origin;
+	u32 x_size;
+	u32 y_size;
+	u32 key;
+	bool pressed;
+	int slot;
+};
+
+static int touch_overlay_get_segment(struct fwnode_handle *segment_node,
+				     struct touch_overlay_segment *segment,
+				     struct input_dev *input)
+{
+	int error;
+
+	error = fwnode_property_read_u32(segment_node, "x-origin",
+					 &segment->x_origin);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "y-origin",
+					 &segment->y_origin);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "x-size",
+					 &segment->x_size);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "y-size",
+					 &segment->y_size);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "linux,code",
+					 &segment->key);
+	if (!error)
+		input_set_capability(input, EV_KEY, segment->key);
+	else if (error != -EINVAL)
+		return error;
+
+	return 0;
+}
+
+/**
+ * touch_overlay_map - map overlay objects from the device tree and set
+ * key capabilities if buttons are defined.
+ * @list: pointer to the list that will hold the segments
+ * @input: pointer to the already allocated input_dev
+ *
+ * Returns 0 on success and error number otherwise.
+ *
+ * If buttons are defined, key capabilities are set accordingly.
+ */
+int touch_overlay_map(struct list_head *list, struct input_dev *input)
+{
+	struct fwnode_handle *overlay, *fw_segment;
+	struct device *dev = input->dev.parent;
+	struct touch_overlay_segment *segment;
+	int error = 0;
+
+	overlay = device_get_named_child_node(dev, "touch-overlay");
+	if (!overlay)
+		return 0;
+
+	fwnode_for_each_available_child_node(overlay, fw_segment) {
+		segment = devm_kzalloc(dev, sizeof(*segment), GFP_KERNEL);
+		if (!segment) {
+			fwnode_handle_put(fw_segment);
+			error = -ENOMEM;
+			break;
+		}
+		error = touch_overlay_get_segment(fw_segment, segment, input);
+		if (error) {
+			fwnode_handle_put(fw_segment);
+			break;
+		}
+		list_add_tail(&segment->list, list);
+	}
+	fwnode_handle_put(overlay);
+
+	return error;
+}
+EXPORT_SYMBOL(touch_overlay_map);
+
+/**
+ * touch_overlay_get_touchscreen_abs - get abs size from the touchscreen area.
+ * @list: pointer to the list that holds the segments
+ * @x: horizontal abs
+ * @y: vertical abs
+ */
+void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (!segment->key) {
+			*x = segment->x_size - 1;
+			*y = segment->y_size - 1;
+			break;
+		}
+	}
+}
+EXPORT_SYMBOL(touch_overlay_get_touchscreen_abs);
+
+static bool touch_overlay_segment_event(struct touch_overlay_segment *seg,
+					u32 x, u32 y)
+{
+	if (!seg)
+		return false;
+
+	if (x >= seg->x_origin && x < (seg->x_origin + seg->x_size) &&
+	    y >= seg->y_origin && y < (seg->y_origin + seg->y_size))
+		return true;
+
+	return false;
+}
+
+/**
+ * touch_overlay_mapped_touchscreen - check if a touchscreen area is mapped
+ * @list: pointer to the list that holds the segments
+ *
+ * Returns true if a touchscreen area is mapped or false otherwise.
+ */
+bool touch_overlay_mapped_touchscreen(struct list_head *list)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (!segment->key)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL(touch_overlay_mapped_touchscreen);
+
+static bool touch_overlay_event_on_ts(struct list_head *list, u32 *x, u32 *y)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+	bool valid_touch = true;
+
+	if (!x || !y)
+		return false;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (segment->key)
+			continue;
+
+		if (touch_overlay_segment_event(segment, *x, *y)) {
+			*x -= segment->x_origin;
+			*y -= segment->y_origin;
+			return true;
+		}
+		/* ignore touch events outside the defined area */
+		valid_touch = false;
+	}
+
+	return valid_touch;
+}
+
+static bool touch_overlay_button_event(struct input_dev *input,
+				       struct touch_overlay_segment *segment,
+				       const u32 *x, const u32 *y, u32 slot)
+{
+	bool contact = x && y;
+
+	if (segment->slot == slot && segment->pressed) {
+		/* button release */
+		if (!contact) {
+			segment->pressed = false;
+			input_report_key(input, segment->key, false);
+			input_sync(input);
+			return true;
+		}
+
+		/* sliding out of the button releases it */
+		if (!touch_overlay_segment_event(segment, *x, *y)) {
+			segment->pressed = false;
+			input_report_key(input, segment->key, false);
+			input_sync(input);
+			/* keep available for a possible touch event */
+			return false;
+		}
+		/* ignore sliding on the button while pressed */
+		return true;
+	} else if (contact && touch_overlay_segment_event(segment, *x, *y)) {
+		segment->pressed = true;
+		segment->slot = slot;
+		input_report_key(input, segment->key, true);
+		input_sync(input);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * touch_overlay_process_event - process input events according to the overlay
+ * mapping. This function acts as a filter to release the calling driver from
+ * the events that are either related to overlay buttons or out of the overlay
+ * touchscreen area, if defined.
+ * @list: pointer to the list that holds the segments
+ * @input: pointer to the input device associated to the event
+ * @x: pointer to the x coordinate (NULL if not available - no contact)
+ * @y: pointer to the y coordinate (NULL if not available - no contact)
+ * @slot: slot associated to the event
+ *
+ * Returns true if the event was processed (reported for valid key events
+ * and dropped for events outside the overlay touchscreen area) or false
+ * if the event must be processed by the caller. In that case this function
+ * shifts the (x,y) coordinates to the overlay touchscreen axis if required.
+ */
+bool touch_overlay_process_event(struct list_head *list,
+				 struct input_dev *input,
+				 u32 *x, u32 *y, u32 slot)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	/*
+	 * buttons must be prioritized over overlay touchscreens to account for
+	 * overlappings e.g. a button inside the touchscreen area.
+	 */
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (segment->key &&
+		    touch_overlay_button_event(input, segment, x, y, slot))
+			return true;
+	}
+
+	/*
+	 * valid touch events on the overlay touchscreen are left for the client
+	 * to be processed/reported according to its (possibly) unique features.
+	 */
+	return !touch_overlay_event_on_ts(list, x, y);
+}
+EXPORT_SYMBOL(touch_overlay_process_event);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Helper functions for overlay objects on touch devices");
diff --git a/include/linux/input/touch-overlay.h b/include/linux/input/touch-overlay.h
new file mode 100644
index 000000000000..cef05c46000d
--- /dev/null
+++ b/include/linux/input/touch-overlay.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Javier Carrasco <javier.carrasco@wolfvision.net>
+ */
+
+#ifndef _TOUCH_OVERLAY
+#define _TOUCH_OVERLAY
+
+#include <linux/types.h>
+
+struct input_dev;
+
+int touch_overlay_map(struct list_head *list, struct input_dev *input);
+
+void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y);
+
+bool touch_overlay_mapped_touchscreen(struct list_head *list);
+
+bool touch_overlay_process_event(struct list_head *list, struct input_dev *input,
+				 u32 *x, u32 *y, u32 slot);
+
+#endif

-- 
2.40.1


