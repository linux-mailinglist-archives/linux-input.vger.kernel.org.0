Return-Path: <linux-input+bounces-5594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC9953B6F
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 22:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D7E287027
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 20:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44799149C4E;
	Thu, 15 Aug 2024 20:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EI5LRlZX"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01F3146D60;
	Thu, 15 Aug 2024 20:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723753782; cv=fail; b=ppxyhW+Sc8C3M4NsrFkmz/JGtARgYwTAGWkORsGswDK51wv+nJG9gxyTEGV6SytHHQCIXAeNc+s8YJ26Pgnhz6XfqChsqyMxtBKRpvgauOtSjgrjh74lpElkFvQ3A6mzuepGymKU7S9JxxNo6xmvy/x5SpkjR+XjWiwMsntW4qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723753782; c=relaxed/simple;
	bh=Gs+voDkeuzpBXdiBiszX9nJsYNYWaShj533QLPIApTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fEohNpMHhKAokyglBtxXbP2HuSVp69nd1J1hOfYWXax7kNA4k2q39eEkJEj4WDRzrXRB8P+JpMzqEgYdZVJluiIDMSnWyalllPJkj8NCksr1bI1nrtcIGrE58SWboANmlLBNXkssm0WVtF+5FH82kTMw9K2zE6FMJiQXgcpSYV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EI5LRlZX; arc=fail smtp.client-ip=40.107.21.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmbPJ3uFCVFncgOWa02b+b5/TnIWKasgASWikbYozAZcSumfD/GtPaVaZZRohCANLQeavir4xVZPDs+P3gcS4FudoJCG9xjZQjLFO3GN5XzpHTEq3S4T5VfOMv+FwKverFYRZB09rJM4wPK9YNSGZvZyIctONps0xyDWACRUMtSN/Z8wpfVT1oq4qJ5t7m6eUSS9v5jN4zybeIFJwTRdDMkzBn7KwOtZgprRoY0v3a0Vzn1kLSYroJawwaX+N7hqSpWsjqMmd1b8yp7F9TFuvQlcoTHJ29TJrqQMfkqkvSGIRc++I9rm10XGcph1iVLdr2HPZXLFWpOB0e8/Od/kAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHxzzI7NItL0fNF+54pr5wMydUtEiYIHlAfi1eqSDTA=;
 b=JEpbZSH06rjYfy7PRfG1xc33ja3Q7JdANk3zWTND4fW+oORxvYmhnoISxWPsErTK/Ppq7alKw5ybA+599EIPXxTAecGTZZLkYFhX1NwVxiW3P9UpaxnzjeTYaZ6WtZoqhsejzvdw4c4rYe/iDNmji4XjbqKoMKOtPf7VaOyxdZlpr0b1H16Dsvt8pHd1ICu9v2ALOX9lbe3BPVi0Dp+STcYG4zC2859k+6vDV/36h5y9QotskqJsj/4Y5C3nh0TIYTWOomiO95g/x+2kSoV5Ne1zZW+GhNG8xc5h5ka3jIaS3BZIPcgsUaA8IjLUm5VkgAoFHRj54+ivn4Jl7G5JoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHxzzI7NItL0fNF+54pr5wMydUtEiYIHlAfi1eqSDTA=;
 b=EI5LRlZXxOjhW1jW7SDOWzee8GiRUUvrB/CYoaVzq1boT8GAImmFYq2cBmO81W5jNcffFYeon1AdjxJI1/5CF57FS3P6EC8VBORZKU/OgpTElxIC8+EbDa3cCiRTG0ANEIoBuDoCq6izKeObJQ+17hcsc/m3t/qud0z94bo+df/WNaSxxxNUMAlFZywviXWsHKYXUSn6vBvqjja56Al60CvSm1llMDpoKtOopBz+cv/ldFLXgL33IiTXNIerNmQpGpJQU8e1o+KokPMHUbldlVHbuNS2yu3HB0tbb23HLj7LRKCIxkbm1+MCd0+y+GTwIUfRPqgAkAIYmPc6fy7ZcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9520.eurprd04.prod.outlook.com (2603:10a6:102:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Thu, 15 Aug
 2024 20:29:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 20:29:36 +0000
Date: Thu, 15 Aug 2024 16:29:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
Message-ID: <Zr5lKNy08nbtjz9n@lizhi-Precision-Tower-5810>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
 <20240814211345.GA4028598-robh@kernel.org>
 <20240814214902.GA4101180-robh@kernel.org>
 <Zr1hZbAq/jrwyNQq@lizhi-Precision-Tower-5810>
 <CAL_JsqJs+aFpOLwWHi32pwAy2Q8N7qK43TuTmEJQn-BqXKwyAw@mail.gmail.com>
 <Zr4eLg+CUQuJHc45@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zr4eLg+CUQuJHc45@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 366dc17d-6eef-4442-6246-08dcbd68faaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3Vma2wzekdHcmVGalM4RWRqb3Jqc3NKSHU4S0hwdElHUmJiN1liYmFMQk9l?=
 =?utf-8?B?SVlHbHJSWXZneVBmTWRjZm1qNzQ5KzJ3d2k3Y3N4enh5dFpWSDFCMG9aUkRx?=
 =?utf-8?B?V2Y4NnJaNDZvVzNxSURjQUxFS21TaEVWczBwREpHMmZnWVJsOXAzaWkxNzl4?=
 =?utf-8?B?MXJiem1uWEk5OHJwaWpwQ2RLcTBROWlhNWxpZzd5cU50Y1BQcVJHa243eXM5?=
 =?utf-8?B?YjdYT1BidmM4SHBYQVBGVDc5THJQOXVZU2d1dTUvVTBKTld0L2x5T1FtWm1o?=
 =?utf-8?B?ejE4ZzRSbEpnK3orM3pHanpNd2hYK2ZrcG9XK3Y5alVDYVhoL0gxTkV5eENi?=
 =?utf-8?B?cU9RUUhCNG1kTWpiWjZITEtZU3JqOHg5bk9BYnMvcXNmbFRRbzFaU0V2azFu?=
 =?utf-8?B?dWdNbVpndjBXZ3UzY0ZQQkNLK0RGWXBjYkYybzFTYkg1ZlBsV0JOeVNsS1VX?=
 =?utf-8?B?dFQvSEU4RmIxRnF0ZUhncitNQWtIOWRLaTBQOGdzMjJiU28xdXQyTzBCVmNt?=
 =?utf-8?B?N2dYbUxZVkw2YWE4NVdYVlFnSE5rRWhvVFI5USt0OHo3blVaZU03R0o1L2tV?=
 =?utf-8?B?NlpuZW9WOGxrRTk1VHh1NXlhRkRkeFlkaUlET2NFRktQOTZxZ29mRTMyVVJW?=
 =?utf-8?B?Y0JsWSt3R1pmTzVLNkVOK3ZaZXVVR25lKzBlNWhmNW1jckNmNmZVdHh1Tmo1?=
 =?utf-8?B?Y1JKb3FNQ1kvNG1RbmVrbWhqbzhwTUxRREc4aWwzZU5GeUVkZUZZSFdKaEwx?=
 =?utf-8?B?eFJBeDlmSGl3QVltdDFwNGNEV1FrTnY4UWNzK284c0F1aklJVFU2eTl0cE9k?=
 =?utf-8?B?TDIvZ0NmOEpGVXQ2ZEZUWVh4N2tKMC9ZRXBMMVFRemhOOVZ0bUw4eE9IUWxM?=
 =?utf-8?B?MlV3c09aaGJpZWFoakpRbkltTVAwZUFnM3ZkYzdkakNNTnBiOEYvSzNrc1Zh?=
 =?utf-8?B?SjN2c1JmamxxV3F2eFpoZkVSVlVGWDNZRlA4aGFBcTh2SzhIZUZ2cHkyUU15?=
 =?utf-8?B?cmhhdHdvY3NTOVhCR2dMZFZmVndPenFPVzNYZWN0UjZBTmtJNnYyMFdhYnBM?=
 =?utf-8?B?dEdnOFU3T3FOQ0tJbE1WdUxqUUc5TytxR1I1WW4xYmYxa0JTbjZTOXFEaEZ4?=
 =?utf-8?B?NVJjZmsvMFBjZEg3cjFRR3B2b2pOclJYK3ZqN2xwU3d0VUdrb1JHbzVXSmx4?=
 =?utf-8?B?WDd0RnhPSiszWXM0YjZpb01ya2liNFlZVWlnaVdrdmZRTUVTNWZSN0c5bVBG?=
 =?utf-8?B?UzNKOUVBSWZjak1oSjA1OW8vV29nbXIvOHluU0lrYTM4MXd5cFV3YlJMVVEr?=
 =?utf-8?B?MGxTQWhRNnNhaXBJZ0ZjVDgxZmtodHZtbU5LcFFmWjhxajI5aE4yQjF2RmFO?=
 =?utf-8?B?MkpMU3lHVmVhQWwwejBJRWRqeVpkNVQwenJrOHF1K1gwelJDUlZJWHRoYXZ1?=
 =?utf-8?B?QmpPN0xnMHpYMUpldUJPdUs4WHR0czE1UDY5T1hMN3g1anUwQkh0M3k5V0xr?=
 =?utf-8?B?ZnZPM0E2UHFiUk1lRmp3eXNGNDdaNUJ3Z2pQZ2VaL29YOHZuQk8vemdZUzFj?=
 =?utf-8?B?ZXVuSVhpRTdKbGhDZkQyOHk0YnhiNmk0N0x4OVMrblkranErYW50T0ZsdDBi?=
 =?utf-8?B?cFVjNHFLNjYzZ3c5YzkwbUVNWXFkaTZJWGlDNFlhdDZvbExiY05BNTlZb1RQ?=
 =?utf-8?B?RVozY21CVVRQZXVlb0drYnlZQWdVMEY4R1RDZ1NjRHk3STBlWEg2QlN5MGJO?=
 =?utf-8?B?aXVzeTMyUW9HbDlycVg5Q3Iwc3MwVlc5YXlHL1h0RnRUTHJuaUhTSFZqZGhx?=
 =?utf-8?Q?eujrFgi3em6NhQPDS3rDKOOliz9MpH2OBSUdk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEhHalZCNnVLV3VtU0RMcEpkT3NzRlN4WHU2azQ1aElpc1Z1NHJZc2RXbmpP?=
 =?utf-8?B?YjhxUDk0WXY5cUtUVWFVcnlvZ3B6QS9QMWJybUtUWlNVMWd5bEh4d3cxWmRs?=
 =?utf-8?B?a2dhYmZVVEltNkNxMXd3d2FHWHNzUXBML0VXQ284R1ZDMVFrZkpKUjQ3S3gw?=
 =?utf-8?B?SFVIZGIxTHUyUVlHb0hiM0p6VzhIaUhoVERkMlJDNUxkcG5wNGsrenJaUGQ4?=
 =?utf-8?B?Y2lHSnpxSWoxdHhUNENvVXVITzJPSzNYc01TSGp3V0tnT3ZyVU1EdmMrczlN?=
 =?utf-8?B?M2h1YU9Od1JzbEd5S2Y2NHV2bnlYV2pFMW96MHFLWG9HNFh3VGlZOS9kR0Zx?=
 =?utf-8?B?ZzMray8rWXF2QS9ZWjY3ZHVJaFpKUUEyNnlJK3BxbisrcUtYcnUxZGhEbm93?=
 =?utf-8?B?VHRiY004Qy9RZDdqVEpXL1NKVGcrYnVkdGdjZjkxV3FmUU1LZUx2VlNlMW9P?=
 =?utf-8?B?NUszYktENkNZaFJmR1BYaHN6WGhRMDJib1h6T2x1bmk0VjYwWGhqQUtzWFp1?=
 =?utf-8?B?eEFkYVhQa1NzSmtNSU5qb0haNkROdGZLaG1hdm9OWDRXZnRpZCtmeFFrRmVs?=
 =?utf-8?B?SlBBYzNobDlWVEhCOEZvM0dBRXlhRE1pZnN0UWIrSExTUCtRcXVKQmtZZUNz?=
 =?utf-8?B?NnJabWRaeGhHRzBOdWVUdnVRMVpGTmhpemw3dEJOUzVZaFBja0lDT1N4YWgz?=
 =?utf-8?B?c21oVmhReGJoN3dwZDl4K2QzT0dVUUhoNTlwTlhzSUtVNEZLbTcyaEhrdG1R?=
 =?utf-8?B?V1Y5ZFZGWTVpeDNzQXpZRmJOeEJqcW1SRTJMOWNiWFFCbEN1TGNSRVVLVW0x?=
 =?utf-8?B?SC96UU5xQlBMNThDZ2NRZG5vSTlRN3VWTWNZYk84eDJ2aWlkOExENXJST0Yv?=
 =?utf-8?B?YXk5cjBPWmZHeEFHc1JCM0JDdmlTSXBvSi85YlY2d3V2WkJRY09DYjhqQ0VW?=
 =?utf-8?B?dzlYL1ZoZ3cvZ3U1N1BuSVFFZHhEK21lOHQ2QTZuQ1ViaTZ5azdmVTNEbkll?=
 =?utf-8?B?UmJYVjBNaDAxQXZRK0trL0lDcHF5ZWU3K002TmE3eGFtOXBYYjdJdW1ldnRl?=
 =?utf-8?B?SmNGMmE0MUJkb2VKRVlSaWRuSHh0MFRQdEJVTXVOVHpVbWRqTjY3OE5qZmpn?=
 =?utf-8?B?L3VtakJOVmpZcFZGUTNEcGcvckNGYVY4SHNlaDVxcS9QallvdTFQVG8yaGVz?=
 =?utf-8?B?ZGM2ZzhwSGY3UWN5ampYZEJKQ2hhTVN6YmwzWGlVYUp2Y1VYeXhGZks3b01u?=
 =?utf-8?B?WFdWYmk0V0lwcjZDL2IzN1QxMnMyYXF3SVdmbFVyWjVIaUpaMlI0eUJRREdy?=
 =?utf-8?B?QU1IOTZ1RVJnWHFLdER6ai9YRGVwQ1VLejNVcHdSUU13U2w0NkIvMW0zQXZK?=
 =?utf-8?B?VW1WaXJHYlA5RzJPWjlsUDltSnBBSlMvMndRU0JRRG1KTXBINndZVEVCTGF2?=
 =?utf-8?B?TUFRK2xWV0tKMjZ2QkhJTzQ1aDBjaWJQenVjR1d6U3F1K2xPakxhdVk0VjRX?=
 =?utf-8?B?MUU3OCthenJjY2VKcFljTGFtajlDeFlRT21JbGRGWkdjcWphSjNoVXBLaXp4?=
 =?utf-8?B?VlEyL1VGc1d3U2JHSEZTREwxbnc5Wjc1blR4N1JIUlZpaEN2eXV1MUtkbW9k?=
 =?utf-8?B?dDZQd0t5ZDBxYmw0R1lLa3BBNE95SlFGM2dEMXJMeHl0ZjJHOEUxdEtJK3ha?=
 =?utf-8?B?cXpEM3NMN1ZERGNjQW9BdEFyV3hJeFh3emJSTm9hM3pCSGNFU1ZDN0Z2cWRW?=
 =?utf-8?B?NFBqMHhyU3hZaGdpakhvVlpIU29aSVhuSlRacHlTelg2SFd2ZWlOb0FYTWRy?=
 =?utf-8?B?TVdtMHpzeVNyQXh5T3FwT0VwcEtDMXJPVzl1bmROQUJDYTFaOWExblpGa1Z2?=
 =?utf-8?B?NmtIQWZvRVp5d3NjSGVaQnJES1l2bUU3UDZieTVBWVFZN2lwbWxzdlFVZWZm?=
 =?utf-8?B?UXpNQ014RjJPSUV0U3g0UmFqZ2lZYzBkbEVUVHdQK0FGTEtBenVNbVdxM1gz?=
 =?utf-8?B?ZVc5UWdkYk1XQ1ZVQXIyZUhHZ1BpOER6czBBZC9kUC96L0VXSCs5WlJnMTBT?=
 =?utf-8?B?ajQ4NG0rUDQvbXBqa2tjelB1VGJaeGQwOW0vQUw5ZEgzd3NyeElkMS94MFBL?=
 =?utf-8?Q?xZvI2YkgnYMdKD5V0arLHoAVc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366dc17d-6eef-4442-6246-08dcbd68faaa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 20:29:36.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ne83t0TwDeehO8eoL747bPqM6/GocCYnJayM8pcZwY364dCDHHFG8C2+q0lYGhd7dpY6tuco8qXvekMi120pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9520

On Thu, Aug 15, 2024 at 11:26:38AM -0400, Frank Li wrote:
> On Thu, Aug 15, 2024 at 09:17:48AM -0600, Rob Herring wrote:
> > On Wed, Aug 14, 2024 at 8:01 PM Frank Li <Frank.li@nxp.com> wrote:
> > >
> > > On Wed, Aug 14, 2024 at 03:49:02PM -0600, Rob Herring wrote:
> > > > On Wed, Aug 14, 2024 at 03:13:45PM -0600, Rob Herring wrote:
> > > > > On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> > > > > > Convert binding doc ads7846.txt to yaml format.
> > > > > > Additional change:
> > > > > > - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> > > > > > - use common node name touchscreen.
> > > > > >
> > > > > > Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> > > > > >   ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> > > > > >
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > > There are warning:
> > > > > > Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
> > > > > >   hint: Standard unit suffix properties don't need a type $ref
> > > > > >
> > > > > > I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
> > > > > > uint32
> > > > >
> > > > > It's going to have to be a special case in dtschema. I'll work on a fix.
> > > >
> > > > Should be fixed now in dtschema main branch.
> > >
> > > Strange, dt_binding_check can pass. but
> > >
> > >  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y imx8mm-var-som-symphony.dtb
> > >   UPD     include/config/kernel.release
> > >   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
> > > arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0: ti,x-plate-ohms: 180 is not of type 'array'
> > >         from schema $id: http://devicetree.org/schemas/property-units.yaml#
> > >
> > > anything wrong?
> >
> > Now fixed.
>
> Yes, thanks.

A new error in dt_binding_check

Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition

>
> Frank
>
> >
> > Rob

