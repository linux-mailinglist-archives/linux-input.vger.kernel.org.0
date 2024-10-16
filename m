Return-Path: <linux-input+bounces-7473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AC99FFDF
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 06:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F258A1F2254B
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 04:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB664170A20;
	Wed, 16 Oct 2024 04:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="OqLP5Smh"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2099.outbound.protection.outlook.com [40.107.104.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93B8290F;
	Wed, 16 Oct 2024 04:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051374; cv=fail; b=MUAQuWw0o7N1QQZw4SvR8Zw5kjRiu8WrHHBG7jKTjG6x8gM8VzuXEl300bSEkAnliZZwZKeCDuXzerHpyHB0qlRQSWZPicGor/HskQ2gNH61q1rAwZVv9s0q5gUvM0i5IlPKe8z8w9H5BL03eumC6Q9Nu0/BYpnj7IgsLJTyUj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051374; c=relaxed/simple;
	bh=yQHrhy/cLj8m5cwZywJZimlUvuzO6TSYXrE1Tzqpzjs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eFOHrxsKyS3GX5zauX/WzM/T1Wbcdcfm/26Fg0WMi+rHMig1uQGDQ20lv/t9mvRdkhESUlKlUsHX0omt8XfNyJsRXpCp4rkzUTO2b47TCQXqY6hn8w4GiB/4TJUk3SlpRm58f9ZJLmW/dTEiWXaOWkG28qNz7rHxXS9r3gYLWH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=OqLP5Smh; arc=fail smtp.client-ip=40.107.104.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6uBeA3zjBFn7h+4f3Ky1G7Xpa0JGLu5RC5YwIvSVUTZG4qAbBtlyGd1W4Qz4grPGwHy8HnDXdah9XBIyFEZSr8KVxh3vBZqmIadoxiHHDzaAVJyueW5j/OVpKIVuYTbpXk99m8YN0P1j1TdUgcPDaYKSfMSwPulfdSvhnSQSn1XBF7rW9UOSE0uCDwjUInkW5bnPkm8FFjVbyihUXM9vr9vjvxRbBZivAi79ee0ad3k0H4VkkdPk6eMae+xBjvbhdvvwni0cTcgTYWuqMEy9W7TjnOV5MtfwV0Jkt9B6iKrhiffnW76rOKf8fbqxxU9RQ8Taun24ppZrGBpVWz6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBaP2zOuwSQ9ixzTarI2EZ4kIOrr2eYt2I5CT+KpXPM=;
 b=Qwo1Qq5ak25Texp1dgzN1Y4hBEyKvtZtIAnGmQaJBhTqWGRP1YWYfFPxA1uWBphe12xKhF6qjedrh9O9ouOgaFnTtfjVqUUF0xVRfUICKJjBllmkme6dEuJNPRqU3g0AK8EoAYVf8kL1gLrM40bP46fXIFTWVIf9pcFBPW8+LakMdceRUqycDpCVOI55Lnn5uvexs8CA0h5CaamOQp9iJy4DfV+aLUHIn5+hKw3RCCjIECOtgYJjXtvEN99Z8scXwwMqWXfhnlSgRVwr9rIYDZLoow0b8nPwiOT86+fbOaSf8wLSNxy/wd6+rQObTdnDrO1YzXvPDDja648vmI/bYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBaP2zOuwSQ9ixzTarI2EZ4kIOrr2eYt2I5CT+KpXPM=;
 b=OqLP5Smhf4BfVBoAyM5r6NtYXK2aD9J2up+Ww7earZRCMJNbS/OeCyrJaX5rbhW2gvS2YQh2JHVjYTyfpFH1E4OxGKWhRm5zaBUTKBXcj1AeGn5sWJFTLZwhkbEskenuTR+xAy0xSHfEowmbI4cpeoeL5ZnmILuLyVF1l8bIE2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by PAWPR08MB10183.eurprd08.prod.outlook.com (2603:10a6:102:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:02:50 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:02:50 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 16 Oct 2024 06:02:40 +0200
Subject: [PATCH v11 1/4] dt-bindings: touchscreen: add touch-overlay
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241016-feature-ts_virtobj_patch-v11-1-b292a1bbb0a1@wolfvision.net>
References: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
In-Reply-To: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729051368; l=7148;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=yQHrhy/cLj8m5cwZywJZimlUvuzO6TSYXrE1Tzqpzjs=;
 b=ob0lSkhZOvOSkCPz6IQbJspuk7I1NAkYwGEAwH1zMNvCCDEakBcLwBo9N+9NJEL7T0AJRWnnK
 i7kVS6mjte1CUulxz/0avGy4PUtA0uK0bO2kkTFwlI2Yv7vp12yeYDZ
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR07CA0154.eurprd07.prod.outlook.com
 (2603:10a6:802:16::41) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|PAWPR08MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: c1578ee6-f8df-4b7c-007c-08dced9766c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnpYSHV1TkduK0kvV2szbGRYZWxuV1NLcFloL0FWckVRVGJ6RzdNRnZjYXJs?=
 =?utf-8?B?cmJBRjkxRGRVU0xEYzlXVWtJNytyaDg1SHNpMWhBUnFUWGxIYnlFenY1ejdU?=
 =?utf-8?B?NXlzRGxnSWRFYy9Ba3Z2OG1nREMvWFg2NCtSTzlxcFFsSTRZY0RnQ2oyTlBP?=
 =?utf-8?B?ZFAzNEhuQTZPelQyVE9tbEh6TWtPSENGZUJuSExOT2hRYmRBVzdYK3JoY2x5?=
 =?utf-8?B?UCtkbkFYeFNmdzZQMjEvQS9rNUpXL1pUbUJFOGp3WG1CZ0pBWVFQUUJhVlkz?=
 =?utf-8?B?K2hwZGpGSzVieUNTSVk2SnFpbnVMdENVZENEMjhuc1dOYjIyUEN2ZFgyZkk1?=
 =?utf-8?B?MWlGZ2FPUmF6TkltaUFYQkpaWW1aNTZrMWdMV3E4dVQ4S1BNdTJHREZCajM4?=
 =?utf-8?B?RGtwV3I4dW1lOHdzNEh1eXlEVnVuNXFDNDZORGQxQ0krZksrMk5uWDZHNE5q?=
 =?utf-8?B?UUtWYXNBcGx3amdCOE16WDh0Ny83dHFQYUVUM0RTVjZUdUU0QnFFTHBhaTlh?=
 =?utf-8?B?WlJBT0IzSGRObzBucnpHRTg2Z0tGMjJyNWJkV1FxSHJTbGJjcXZyb29JNGVM?=
 =?utf-8?B?MTE5S25HZlh6c2xyVlZKbElNN0ZEZXZiQkpiYVlCNUQ2MmxYeEF1MXowNDJS?=
 =?utf-8?B?K09udzF1Q01PZVVjK1pRZkRPZERnaSt3c3dXcVdTVVM2RDVCWWRiT2p4SmJm?=
 =?utf-8?B?bUhZRUtpYlVDaitwV0JIU2NlWnRnaWxCMDErWFJHMUdqMzU3d0l6RVRTWXhh?=
 =?utf-8?B?R3hKTUJxTmRSc2dveXNHOUlsWEY0K3o1VWE2REdqMkxXMzhTZkpBOG80MjZB?=
 =?utf-8?B?ZHMxckxwaUpUamRmUUZMNENoS1lCcFZwWWJQcUVNRFBlTUZWaUVpSzhKN2Ev?=
 =?utf-8?B?ZWlrRFA2T3RMMWRaRjN6MEpGUWViOUY2UjM4dFhmcnZkUXZVaFk5ZzI3QlJ5?=
 =?utf-8?B?a1NTRk1jMkZaSTRuc2YxOTh4QWp3dll4ZkVLdzJEMmF6Wk01blFuMXQxWjFS?=
 =?utf-8?B?L3JrOWI5dVNpNkRoemVFSU5TYmFueGI3a2Q5ZS9zK2toemhJalRLaEtzKzBN?=
 =?utf-8?B?MWQxdHlDcGFKdU1LcCtRRGN2dzB6NEZha3NNcDBLS1ZPSmhGbW5jSEpDNUpt?=
 =?utf-8?B?RlJMczZYSzR4U3R4aGdmajduSUNhUUVvSTZVOTkwSVNlYkpkTStRTlp5cUg4?=
 =?utf-8?B?bnFQdzJuUHJMWktiNmp3K1FISHJDeEZuUm9wR2JJY1RHVUc2TEd3NmRMUkJs?=
 =?utf-8?B?aFBOLzBxVnBtZVpFdFg0MkJTYWFzcXQrZjVmSGlHQlQxbHBteE9LR1JSOWta?=
 =?utf-8?B?UHN0c0luQ2VSL0h4L0RBSndkNWZCbVpOQ3d2ejdCZXR0RWtySW9TY2Q5Q01k?=
 =?utf-8?B?NWFpQ3piaDRsMjRaWktpbHJRNloyVjczSnlRRUZoamJyVU4xQmFvQWNiamwx?=
 =?utf-8?B?Rmo4MlpiWThWZm9XYXlMa0F2aUplL0NZUGxIcjRNbS9leDhSeW9wOEZJS1Ra?=
 =?utf-8?B?cTcvQWI4R05aK29hQlNWempGamlCcUlFdWREcVJYbXVTTjlyaVREL1R5YUlq?=
 =?utf-8?B?dEZXVGFoWlg3a09HQ2FUbTRmbWMrRDFuMi9jQXY4SklVdnIxQzU1Unh6NW9Y?=
 =?utf-8?B?YlVsdGpWNmd5cXpZdGt3WWNOZFAzNy9ibytORDhaZC9qMzh3M29UNmVhbGU5?=
 =?utf-8?B?cHNMYXdSQ1ZEajRicGpLYVRyRFZ0RTlmeWRPSEoyTThkYkJkZmI3UEE5enV6?=
 =?utf-8?B?UXNpWm5mNFlLZW5aN3NLVnZ4YUd6bmUralpZekk5V0k0bzhVaHlKQ1J6Mm9v?=
 =?utf-8?B?VzhYUllzUkRtSHBZMFBYdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHl4eW9LZHJHUVFuSDlIaWU3Y0h6OWJhZnRQMncwMlZHMFJwS1REcmpPbjdB?=
 =?utf-8?B?ZzBsQzRqR2pxcFR6YzhXVjVLYkpwYS9BbkpEWDAzRXJYMThRL09JL3h0dnQ0?=
 =?utf-8?B?S0QrR0I3VGFmWkN3VVFwNGtRMFNIMkY0Ymg0Z2t1cm0waHBEUmRnV2JTazIw?=
 =?utf-8?B?a2ErNDIrVlFmeHRNNDVmWm4wOXQ3Nzg0T1Z3Rk5ZZnU1bWhyR01iNmlKTmVZ?=
 =?utf-8?B?ZHFEVnhjaFIrRjNoMUtuVjFTVlFrWUJtV1poVXBscWwrZUdDeVdNSVB1WWM0?=
 =?utf-8?B?TnU0cGpxU0wxRjluMGVvNEZxRjZJLyttcFl3RHkxU0l6c0xZNnBNL3d3djZG?=
 =?utf-8?B?L0xYMXhPQjN6RTAvdnlhSWthM2Voc2xtdVEvVi9DQXB3RVdyU011UlRpUzZu?=
 =?utf-8?B?aW5Ca1ppV1I0dEFYQ0piUUNXVHcvYXBNRm9JbFQ2WWtMRVhPaTVHb3k5aVZ3?=
 =?utf-8?B?OWo0alJBc3oxNml2N1RMaENwSG8vY0t4N1dyV0Z6M2V1RHJoNzgvbndOV25n?=
 =?utf-8?B?TVRsRXNGMVc0dHhaU294YS9PZHVNTnM2WmpBcGlYQXc2WjZ2QStONHZ6czFm?=
 =?utf-8?B?STREeVVhMXJqajIzZ285b3BDZWFXOXRCcHFvTDlSVll4Y3JkQk5MbHVxcVJS?=
 =?utf-8?B?cktxOGNZUS9iWlNOMzdBcUtzazVTZE5IaWo3SW1Mc0FMYWJpNCsyUlNPVHJM?=
 =?utf-8?B?MUZycGhZTEFhZ0YvTmcrcFlyVVdrem13eWFBaGxwYmJNWEZMN3dPd0t1SVlP?=
 =?utf-8?B?bEFSdlM0TS9BMU1qNlRmT0tLTVBndUZLVVdzVS9zMzdUUFJKN1RLeHlIRk5U?=
 =?utf-8?B?WFZaMWV2NEEzMWFTM0E3bHdUM040TjZkTi9neER6ajFvZXQvVnVaenpxb3Yz?=
 =?utf-8?B?dkZGL1Z0OW04RmlPb3phUU1aOWtncnF3Ty9naEgvV2ZpaG14UTgzblFUdlVG?=
 =?utf-8?B?VWFoWHVySWtzak1JQUdZblBJQm5hZ2paSElzdTFQVFRyMHdZMGpONEJ1Y2lN?=
 =?utf-8?B?WVBLN3FHWHlrajJiUkV0MkpLeHFwN2dFbTRocy94QTJHbzUvNmRuNTZMOFVQ?=
 =?utf-8?B?YXZRNnB3MnR6QTN4dHNYSWlqc0x3eUp1aHhRMmlDVmZYblI1em9zM2syUnBT?=
 =?utf-8?B?VURnRzdEeHhmVkhWVnBwc1REOHQ0cXdtcXhWU1drMjBiL2ZERjVyT09vOFRT?=
 =?utf-8?B?UW1teTU5eDBYdlJpSWhJZC9KTWxnS2tkeldPRXlmQ2grbGRwR0RBVkxtNWZn?=
 =?utf-8?B?R0FQYnFlWGRNQkVLdDVVWWpmS0RKL2RzSE1OK2VIcHp4Nm13QUkvZVAycVZ4?=
 =?utf-8?B?UGc5dEJwdG1NdXBSN3BUSmdNTStCSEl0SzZXeGx6UlBqMEx4MUVPdVRIVm1I?=
 =?utf-8?B?R0s5ZjgxUmdxR3lLcWtLWDFwN282M05qNEtUOWNOQmZIem5HdmI1MGluUVMz?=
 =?utf-8?B?ckN4NUQ1cU1KdUhZanphNVZsMnNFeXducXFBcjdZTmxzbXV1NlBBcm1rWXVw?=
 =?utf-8?B?Y1B3czZKUjdFMXBFZDR0emdlNVhuSWNBRFo1Ui9ZV2M3MWZZQVdwanAvcWNQ?=
 =?utf-8?B?OXhsYlM3R0M5SGpHa1l4SWxNOW5CbklaSlJ1V0xvODVPWVlHK2N1ZVpXbHls?=
 =?utf-8?B?M2VpdWpsT0cyWVU4RFRSbXhwOFdZOGZsY0h6SENkYWc1MjMzZ01scjVMYXRa?=
 =?utf-8?B?MVlqdEVlNnhuTXRhUkRBOHR1S003NENibUlvSnoyRDl2eHJlVEN4eHpHL01t?=
 =?utf-8?B?K2djeExSR2ptb01ZSE1jaVVRVEdBSXB5RDZSdEFrNzlDRTBvczRqWEdzUk9q?=
 =?utf-8?B?YkhSdUZqY1R1SndKdFNuNmhpa0FteXVsTjlieVg4ZnVYd0xMUnNKOFJOVWlC?=
 =?utf-8?B?TXU2Umh4bXdKVnNjVXJtYk92d1pJQjhjbUYyNkxHc1FBV0R6SjVyWEVMMVdu?=
 =?utf-8?B?TXlYVFJ0WEt0c2IySVMrMExLY0lyQlNjQmtWL0tmaGdVcEo5Ynpabzlrakcx?=
 =?utf-8?B?aytnb3FBWjlab00reHFhdXBPWTRqYzBVWlhMemFrY2dqampOM0lVZVZJWXQ5?=
 =?utf-8?B?cktYTTRsK29ldlNqUjAzcXFuaUpWTWpoNHhvRkRsUndPS00ydTIwcDY2SjIr?=
 =?utf-8?B?UnhKYWlZcFA2V0RXaGhCd0pBc1Q0U2ZZV3ZNVEY3aWZhNkQ1L0pPaHFjNkRq?=
 =?utf-8?Q?vaCYUZOIpsI2eFfWggNe298=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c1578ee6-f8df-4b7c-007c-08dced9766c5
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:02:50.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1nN6UleeuNHLied8xn5mVlxFTQHugMyFSxJForwAhZSY6j2r0JNODJlxHjMHCuiGvAZpI07yTPGLIv8xsRylQ2RgzIpKK8W0sE69yputJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10183

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
2.43.0


