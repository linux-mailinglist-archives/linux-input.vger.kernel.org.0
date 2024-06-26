Return-Path: <linux-input+bounces-4654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6291992C
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 22:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 618CA1C226C8
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 20:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB28193083;
	Wed, 26 Jun 2024 20:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kOxmYxY/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="T/YQA39G"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881A19068E;
	Wed, 26 Jun 2024 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719434159; cv=fail; b=T+LsK1KJpReoJotF2bdpuNrbDsAmxb1M9z9lJaxE95NxbBvRquQP4l1qz5bwqOx80COJBY7gohxf4viYbnPtJVlxX8PBDbaeM4LtlzlIKb+KZEOypnxjWnjx5WDvzpcSiW45yfyPR0S493gHjuCF2FbQt+31ZJyICPboygv82k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719434159; c=relaxed/simple;
	bh=z+Rj72+ym/44NrmFaBdzDmTgXXIdKMbf8dl3xCLvNKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhAx+tnj0ldOtSsBoYnHKANisc57Lq0QCxGKWciPN2nad6z4SxpA7HU7RL1+UrY1KMVR5jeTv9R/Qn8SYeC/rlV+vlMbq8lrQ2h4SlmebD9VjzwCzO4SX3itMQq/A5eBSGoYYt3sDFdSgHW32xyzQUUjyciEVk7YT3EZ5eryz6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kOxmYxY/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=T/YQA39G; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QKHNpk002840;
	Wed, 26 Jun 2024 15:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=z+Rj72+ym/44NrmFaBdzDmTgXXIdKMbf8dl3xCLvNKI=; b=
	kOxmYxY/OkvcnyR6Hcm++VwWM7z7CWhfcJ9a+OzJgyNKnOTUvGNtChkEjynw6ZRv
	0ZrbYe/Q/MjZ0DHZys9oL/vmwOIUVkqnWK93lcPH8CrU3EoxSIrQvPjlqerHMWep
	J5fdnrRCE155hfaVsjhU9/VrVSq55JQAGVw/9txP7S+u9Zlei8GTCHdWFwiBdB2b
	1imPKNAclRjO8LWCKdJV9VpeZhNSYsMi1AdVjZcrXUpXYVVATejiBiUgqTWsmgWd
	S5g684cCaQe0U8Rl54FVvmF3cJ6/Ro7G9NWnHmP5lmJSssW6+MvUEo9AVM6m5EtG
	cE5BvEMuF98w9YjwaHnBww==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 400nbdrck4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 15:35:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtfhKgM6e09dh+MNYwapIxCZQjpLYdY2LYTbSEFfeR/LdBnHC1+MVOzuBnM9juYBA4Vfj7y4xKut22VqbZKXGh+iyJjDaLgEsDG1lRuMm/7lTo4RQf6KfrHKC83PkKavZ/xvshZrmdkp4eY2feyw2cAaazjPXxj38Zsz2IYHwnYoFR3aDEBM3TxlvSF54t2j9VOXAwGqwYMYkaLPBIljJn2EgWs9Cgb22FlMdi7qU8dkMVbV6s5oYacrBmOHtKZFjjbYe4yB8zh18+0swPIZ/JF+AlPd8DnF3JV0rVOpfN/OtCZcFaKHWJXxF5FX/DZMZMAINmqC5p+wpIxa4qTKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+Rj72+ym/44NrmFaBdzDmTgXXIdKMbf8dl3xCLvNKI=;
 b=IsB2z/ITno+HWgf7rNWp4F3Lf9Z5mZ18wIxGSXbV6pvQl9R/YULsfS9wogWE+Ijud0RVrvPMnTYnyuh5gr5It1NR280s+aJibOeYmUh3MW+PfiLwhn9XmnBw/CTmpnUA8zGrmQp/KKpX611maKtaOwKWzePo/WBVf1V154cSCCLa+UIArHwiyM2u6c7uGLgTTpwVJZbL7rsyyNIswinrQgXB++cLM99CnVsnrqx0kCTzV+mxJxzjwzAI2YYuPN33dDFNuRAoT+fIA/WufW5056DnkwxYn3PtsF4ntwldjYlEvxLGCbTjRxmeVfSwZen3tY7LCAFEvCi90Bim5KtjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+Rj72+ym/44NrmFaBdzDmTgXXIdKMbf8dl3xCLvNKI=;
 b=T/YQA39GwYRy2pS0dO2ihZiWATFmfK0kpI6JsOwvBZWQoTOpNQsQoqN/Die4i0kvHI3zqOQza8fOC/eTbJUXswRMXGeM3HZHWYQDIHeSLvaQ3xeMHkk3I0Q/Min4U9DDuRzpoCFz8ufFJvDws35zynNlbgrvz9OTjVanO70hXu8=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DS0PR19MB7199.namprd19.prod.outlook.com (2603:10b6:8:139::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Wed, 26 Jun 2024 20:35:42 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7677.036; Wed, 26 Jun 2024
 20:35:42 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Thread-Topic: [PATCH RESEND v11 0/5] Add support for CS40L50
Thread-Index: AQHawy1sjk2JaBubyUKzdOotv82g/bHQ4BmAgAmqUoA=
Date: Wed, 26 Jun 2024 20:35:42 +0000
Message-ID: <21975F67-D71D-4D5D-8042-8EE64E8864CA@cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620165935.GT3029315@google.com>
In-Reply-To: <20240620165935.GT3029315@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DS0PR19MB7199:EE_
x-ms-office365-filtering-correlation-id: ed215657-d9c2-4686-09f1-08dc961f8c54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230038|366014|376012|7416012|1800799022|38070700016;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aVE1eWVQbGZlWC9LK01uaVVNclVrUFlmWXp3RGRJSXQ4eUlDVUt5STRibmlp?=
 =?utf-8?B?Z3JUUDhRakhXbzIwSkFKc1hmTGM1ZFo2RU9iZW96TmFPckNENEJiS0RLOVNh?=
 =?utf-8?B?VldWTzdWZStUbWk3WHB0VWgwQXFVWDFkeGRLVXB6Ynh6QngwazJwclVhNUNC?=
 =?utf-8?B?a282eVNKSHNIejRJZnJJaEV6ZFE4R1IxeThrdDcyanJZa2RpUVNPb0c2ckVN?=
 =?utf-8?B?Y0l3VEJieERtVDAxRUhxbEtVS0ZHUnVpNnVkNXd3Q2dPdmRjajFkL2U4NnNF?=
 =?utf-8?B?YStZTitRdjRJMCsrQm5IenJiMDRybmlwbUw4TGE5M25hV3FZcDFTZ0gvV3lG?=
 =?utf-8?B?S1BDRVcyQys5UnpqWVE2dnZUSE1ZSE1abVkwSDNDK0hTTjNmVFEyUnNiWHFJ?=
 =?utf-8?B?Q2NFWSs3aTJHV2FXalhmVHZ6Q1RkUjAzdFF2SndWeWc1cjI3TEhGTzJ6cU5t?=
 =?utf-8?B?SkVnbFBLVkFOZmdaMHMvY0tOeWsxVW9ZR2FGMDRUQXNIQS9VaVQwK2huK1ZU?=
 =?utf-8?B?L3loL1dtS1R1ZU44QTE1R0lSVlZES1RyWVdoTnpLbWxwK3JFd1o4SzlMbFYv?=
 =?utf-8?B?MVY1WDBrMFg4eUdvSlZZeTdGano4dXlKa0NVb1pHTWZ0SGxacEF6NU9ZNWIy?=
 =?utf-8?B?b29BSHNFWk5hNEQ5RXB4UWhzem1xSkp2cGxyOEVNU3NsVkF1eXB3UnBhb2Rr?=
 =?utf-8?B?ZGFXMzdUUFl5Ty9CamwwSlh1dHpyeWx3Y3I4T0krMC9iV0VXUlE4bW1DNGx4?=
 =?utf-8?B?SXN6RjFhNXI1VFdDS25JQkdNT2RUUFQxWDRjWUJpTDBqWnlXSFRKUmg3OGhX?=
 =?utf-8?B?WUpxVXVqN2NCRFRWNEEvM0hjRWsybW1yaVRtTlhvWitMbTJzMnFwcVhuc1c1?=
 =?utf-8?B?cER6SU95K2xkQnIySzB0dFk2ckd5TW93N21vV1VHWStseDhUQTNoVnQzMVlk?=
 =?utf-8?B?QWZ5MUVHdmJxMUgyYU5rN09ybnIvOGRHRk8vbWhya1Fsb3dzb29IL2dObXlY?=
 =?utf-8?B?NmY2eDNnQ1VpOTZxODBXRGpYL2ErNTZSaWVBRkNIQUttN1orMklObGpra3Z6?=
 =?utf-8?B?L3NtRWFIbTZSNWFtbWRzZFB5M2hVZUdXQ0VMUGdjeHo3b0Z2ek5GYlRoMTl0?=
 =?utf-8?B?N3pTWk81TWJJOHZHbXpvem5ITUtFT2U2VnBHaTJHbGJqMUJUNUQ1dk9xT3d6?=
 =?utf-8?B?UGhyeUlzbWw2RndML3hiaWE0TTBxTDJkeW9jTWhmeGJuUlV2STYwK3JuNmdq?=
 =?utf-8?B?eXB1c1BwM1B5L2pIVE9VNVRrMlVFM3lFS250T0tQM3dOQUlHbzBZdnhDMEx5?=
 =?utf-8?B?dm1WRm54TDhPelkyQlU0N1g5eVVEREtYZjBXTWhxYm93eHBKczM2WG12MFdD?=
 =?utf-8?B?QWdRRHFScUxBbmpCbVF4SWhqODFvZ3lyVHV4c0h5em1CSmt2THVlWWk2YTVW?=
 =?utf-8?B?NDF5ZHlya1BOeWozM0VFS0F4UUNQbE42WTRXb0hKdklhckVtTkFsaWFoamg3?=
 =?utf-8?B?SWFCZVI5WnlUamNSb3VadHpMOGx4UElLTXRrKzlCS2grVHFxVnVGM3NUYUZ2?=
 =?utf-8?B?cWZNNXJMTWh3VXVTRzgvaWFOSEE2MSs2SE1MaHphcDJ0WHlpcHJtSDB5azk2?=
 =?utf-8?B?aVcvdUJadXZDb0YrOFE4SExNekU1c0hPRFFkeHpGUXRZeVBkQy9HVXY3YVZ5?=
 =?utf-8?B?eVp2djd5d3VJbUttRzBFOWNTSkF6MGlxQ1ZLdHpnV2tVR2lMYkRFUU5uWWht?=
 =?utf-8?B?cXRWYXRuTllKMURWWFVxamxnczAyZkh3a0pSNFVpVnpZemFZb3k1czMvcTVv?=
 =?utf-8?Q?Rezx0JfCi4sFcZaQyksbqCDAo5FLbB9F4wseA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022)(38070700016);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SHN4UTNqMWhRQVVHajkyMWwvclRlZ0JxRVVoNmRGNGV1RkZSNkF4ZHNtVnlN?=
 =?utf-8?B?OGMzNVhVUmRiWndXWFFsNEZETCtJRWpLMzNkaGw3elJJYW1PKzcwWWdiZjdE?=
 =?utf-8?B?enZVZ0NPTlBXaytsVldwYlZuaWFXRmxrZmdWMXZSY214TVZ1dHo4VjR0V0My?=
 =?utf-8?B?TmlNcW1qbStWaDkrMmEzUTM5YklkRjBNWkxsOU9rNzRZbnJHZ2hta0F4U25R?=
 =?utf-8?B?a1V1aHBsNXd4cGVhVVJhTzg4M3BsZFBldmxTa05rdFBtbjc4VGNXNXZ5T1p5?=
 =?utf-8?B?UjNWTWkzZDdRanVld3Y1UmxTRVN2MkVRU1NBSmxDcDdNU2JOdFhjOFJtMElQ?=
 =?utf-8?B?djhXNmMyaXk0bncvU2pTeGl2TW9yUlgzdWVyZTlTUDlRQVdJSS91U2xMZGUz?=
 =?utf-8?B?NlJmV0NrYUlnUlZWUzNmdmluKzBVZWpJeStER0hCT3dXYWFhMWxEdEZldG1D?=
 =?utf-8?B?eXlDSmIreHp4RHRpdk4xR2x2d1lyWWM2WEM4azZhY2tXVS9wUjFwOERCaGNy?=
 =?utf-8?B?eHN5SXh3QlJQOG43LytWQU5xbk5ZcTFmdjV5bjJrd0dwQnQ2SldaekFpNm4w?=
 =?utf-8?B?WmZ4cGMyVjBGOGN4OUlQeDBPbm1oY0x2R1NSYWU3OTlJWjFvcjBxTUxTWnlT?=
 =?utf-8?B?WFhrYW9yUmgxeXpsdDE3S0VldElaRHByUW5BeTg0VDZxVDJlNTRxSUNDMGVn?=
 =?utf-8?B?RmpXTm1rcGF0ZEhibW5vVlhHdUtSeGhkenpOc2xRdS9kTzB2L205K2lEaTVs?=
 =?utf-8?B?bC9icUpBa01uemxsaS85bTFCSTVnd21pS0lzZ3E2Q1laQm5XLzkwNFE1Ykln?=
 =?utf-8?B?ODB5YnUzOXlkRHlLVkhRd0h6aHliNXR1VW85cjFUNERCSjM0eFdDNGQ4dW1S?=
 =?utf-8?B?WWNiQjNwRURuVDFPYW1DSmtDQTQzTVpnWjR6RkxzMmMzNkVTU3NadENZQy96?=
 =?utf-8?B?dFA2ellaT2lpd1AxNmNkTndUV0Z0c1VPNmF2T29tUmw0ZVZoeS84UkpoNWJW?=
 =?utf-8?B?eHRiVWVlVi9mc3FnUGxzOTNwZTVHZjZHM1BEekd4cjMrQVZqVlpaSkhuckpk?=
 =?utf-8?B?ak5TVEZmZ1JqdWV5eithRCtCSEFpNmdmUHB0OTJlbkNxa1VSMWNpVXJLVzBi?=
 =?utf-8?B?K25BYVBoUHRBeWlHRUo1S1RqOFdKU3FSWURldFRiQkNhS25DODI4dUhLVC9B?=
 =?utf-8?B?SHFETXNVZzV0WExRWkhiais0c0VqcGhWTWh5OW5BV2ZjQW5URHltMG5abmtM?=
 =?utf-8?B?c0hvZjBKQ1pmSExDQUFuZmVCWUEwYTRKNnFkdVI1ZUE2ZS81YnBVKzM3VU5p?=
 =?utf-8?B?NkFLS1daZnBodVFreHpTVW1QWHNweDcrRVJZeFlYdXhNMXozVnlwU2lkdVZS?=
 =?utf-8?B?dVZ2c1p5VEwyUTVyc1hxRWxwdm8rK3Y1M2dpSVhvMVdNc3ZZYTVlbVUvZDRr?=
 =?utf-8?B?Y0RhV3o1bXhyTkxlTXl1TGdPbCthYVBWWHhma2tsaWFHNUs0c0VJTS9Dd3BD?=
 =?utf-8?B?clgwRUFLaGswSUpwY3h5dWFxU2FHN0FZdXhHZTdWdkVZUzJOLzJKQktYYW5q?=
 =?utf-8?B?aWFmNkUvbjBKUDRDUTVwODNOYXM2OHJnWjIzUjUwSHdibDY0Y3lTcUNkNGhq?=
 =?utf-8?B?NmxvZDFINTd2M2crNTRJbkM4T0hzVXFvbEtKY0phR0xmWE1DdVVXOXJyQzdY?=
 =?utf-8?B?Ym1aMlhPWGJPd1BYRHJZZGR2SmtFaUw1c2FtbEtEQjJXdUlUTWtndTRlNnNn?=
 =?utf-8?B?NGxSRGZGUy9uOW9RU3VuU2V4TXlhL3luSTlHMVlLQUxMclpOazBzZ3NHSnJF?=
 =?utf-8?B?dkFwMkdxNlgrbWx5dTZvMW5hcVlQV1J5ODVqV0lkVGd3dlVlZStQencyZWQ5?=
 =?utf-8?B?OTUrVEw1aFBnWWppbEFUbDlyc3Azd251Sm9ad3BPcTNUTURHZVVCRHBHdHp4?=
 =?utf-8?B?THNTK1dzQUFNbTNtWThHNmd6VHlTZWlzbHJkbm1CMG1WNGZmMGJ6aDZiVDMv?=
 =?utf-8?B?RWFUMjJQWVRoUTJpWGsyL1Q0aUdRV2psMnhpQ2ZhZWZpUEtxSlBiZjBQQ05i?=
 =?utf-8?B?MXdLNWNPcjd5Y2U0V0V0d05RcDhxeDRSVWIxTjI0U0cvcUMwSm1JV1cxVWtF?=
 =?utf-8?B?aGVsemFmZHg5Y3BCYmZrZ282SWNCcGlkS0NlZUJqTUdSV1kxWFF5NEg0WDMw?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DF879232DB1A545A473817C234A8DBC@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5688.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed215657-d9c2-4686-09f1-08dc961f8c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 20:35:42.1740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qE/LD1PW5qCucxyvFti0LmuBMLAvkDxHeAMl2UdI1VTpFMNpitMbIG9WCIYVqbuPzguqJNyggsDzm2vQ1x/Rp/U2cdIYGvqlO3uV8eR2tHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7199
X-Proofpoint-ORIG-GUID: 2Lp6TbnuF5vkhJ1jw8E1z3b4xiCTJxM5
X-Proofpoint-GUID: 2Lp6TbnuF5vkhJ1jw8E1z3b4xiCTJxM5
X-Proofpoint-Spam-Reason: safe

DQo+IE9uIEp1biAyMCwgMjAyNCwgYXQgMTE6NTnigK9BTSwgTGVlIEpvbmVzIDxsZWVAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDIwIEp1biAyMDI0LCBKYW1lcyBPZ2xldHJlZSB3
cm90ZToNCj4gDQo+PiBDaGFuZ2VzIGluIHYxMToNCj4+IC0gQ29uc3RpZmllZCBmdW5jdGlvbiBw
YXJhbWV0ZXJzIGluIEFTT0MgZHJpdmVyDQo+PiAtIFJlbW92ZWQgYW4gdW5uZWVkZWQgI2luY2x1
ZGUNCj4+IC0gQ2hhbmdlZCBudW1iZXIgb2YgbWF4IEZGIGVmZmVjdHMgPSAxDQo+PiAtIE1pbm9y
IHJlZmFjdG9yaW5nIGluIElucHV0IGRyaXZlcg0KPj4gLSBSZXdvcmRlZCBjb21tZW50IGluIE1G
RCBkcml2ZXINCj4+IA0KPj4gQ2hhbmdlcyBpbiB2MTA6DQo+PiAtIE1pbm9yIHJlZmFjdG9yaW5n
IGFuZCBsb2dpY2FsIGltcHJvdmVtZW50cyBhbGwgYXJvdW5kDQo+PiAtIFJlbmFtZWQgYW5kIGFk
ZGVkIHN1cHBsaWVzDQo+PiANCj4+IENoYW5nZXMgaW4gdjk6DQo+PiAtIEZpeGVkIGVtcHR5IHN0
cnVjdCBieSB1dGlsaXppbmcgY3NfZHNwJ3MgcG9zdF9ydW4gY2FsbGJhY2sNCj4+IC0gU3R5bGUg
Zml4ZXMgaW4gTUZEIGRyaXZlcg0KPj4gDQo+PiBDaGFuZ2VzIGluIHY4Og0KPj4gLSBzZXRfc3lz
Y2xrKCkgLT4gc2V0X2JjbGtfcmF0aW8oKQ0KPj4gLSBBZGRlZCBJRCB0YWJsZSB0byBjb2RlYyBk
cml2ZXINCj4+IC0gU3R5bGUgaW1wcm92ZW1lbnRzDQo+PiAtIEZpeGVkIG9yZGVyaW5nIG9mIG5l
dyB3cml0ZSBzZXF1ZW5jZSBvcGVyYXRpb25zDQo+PiANCj4+IENoYW5nZXMgaW4gdjc6DQo+PiAt
IEZpeGVkIHNwYXJzZSB3YXJuaW5nDQo+PiAtIE1vdmVkIHdyaXRlIHNlcXVlbmNlcyB0byBwcml2
YXRlIGRhdGEgc3RydWN0dXJlDQo+PiAtIExvZ2ljYWwgYW5kIHN0eWxlIGltcHJvdmVtZW50cyBp
biB3cml0ZSBzZXF1ZW5jZSBpbnRlcmZhY2UNCj4+IA0KPj4gQ2hhbmdlcyBpbiB2NjoNCj4+IC0g
VXBkYXRlZCB3cml0ZSBzZXF1ZW5jZXIgaW50ZXJmYWNlIHRvIGJlIGNvbnRyb2wtbmFtZSBiYXNl
ZA0KPj4gLSBGaXhlZCBhIHJhY2UgY29uZGl0aW9uIGFuZCBub24taGFuZGxpbmcgb2YgcmVwZWF0
cyBpbiBwbGF5YmFjayBjYWxsYmFjaw0KPj4gLSBTdHlsaXN0aWMgYW5kIGxvZ2ljYWwgaW1wcm92
ZW1lbnRzIGFsbCBhcm91bmQNCj4+IA0KPj4gQ2hhbmdlcyBpbiB2NToNCj4+IC0gQWRkZWQgYSBj
b2RlYyBzdWItZGV2aWNlIHRvIHN1cHBvcnQgSTJTIHN0cmVhbWluZw0KPj4gLSBNb3ZlZCB3cml0
ZSBzZXF1ZW5jZXIgY29kZSBmcm9tIGNpcnJ1c19oYXB0aWNzIHRvIGNzX2RzcA0KPj4gLSBSZXZl
cnRlZCBjaXJydXNfaGFwdGljcyBsaWJyYXJ5OyBmdXR1cmUgQ2lycnVzIGlucHV0DQo+PiAgZHJp
dmVycyB3aWxsIGV4cG9ydCBhbmQgdXRpbGl6ZSBjczQwbDUwX3ZpYnJhIGZ1bmN0aW9ucw0KPj4g
LSBBZGRlZCBtb3JlIGNvbW1lbnRzDQo+PiAtIE1hbnkgc21hbGwgc3R5bGlzdGljIGFuZCBsb2dp
Y2FsIGltcHJvdmVtZW50cw0KPj4gDQo+PiBDaGFuZ2VzIGluIHY0Og0KPj4gLSBNb3ZlZCBmcm9t
IElucHV0IHRvIE1GRA0KPj4gLSBNb3ZlZCBjb21tb24gQ2lycnVzIGhhcHRpYyBmdW5jdGlvbnMg
dG8gYSBsaWJyYXJ5DQo+PiAtIEluY29ycG9yYXRlZCBydW50aW1lIFBNIGZyYW1ld29yaw0KPj4g
LSBNYW55IHN0eWxlIGltcHJvdmVtZW50cw0KPj4gDQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBZ
QU1MIGZvcm1hdHRpbmcgY29ycmVjdGlvbnMNCj4+IC0gRml4ZWQgdHlwbyBpbiBNQUlOVEFJTkVS
Uw0KPj4gLSBVc2VkIGdlbmVyaWMgbm9kZSBuYW1lICJoYXB0aWMtZHJpdmVyIg0KPj4gLSBGaXhl
ZCBwcm9iZSBlcnJvciBjb2RlIHBhdGhzDQo+PiAtIFN3aXRjaGVkIHRvICJzaXplb2YoKikiDQo+
PiAtIFJlbW92ZWQgdHJlZSByZWZlcmVuY2UgaW4gTUFJTlRBSU5FUlMNCj4+IA0KPj4gQ2hhbmdl
cyBpbiB2MjoNCj4+IC0gRml4ZWQgY2hlY2twYXRjaCB3YXJuaW5ncw0KPj4gDQo+PiBKYW1lcyBP
Z2xldHJlZSAoNSk6DQo+PiAgZmlybXdhcmU6IGNzX2RzcDogQWRkIHdyaXRlIHNlcXVlbmNlIGlu
dGVyZmFjZQ0KPj4gIGR0LWJpbmRpbmdzOiBpbnB1dDogY2lycnVzLGNzNDBsNTA6IEFkZCBpbml0
aWFsIERUIGJpbmRpbmcNCj4+ICBtZmQ6IGNzNDBsNTA6IEFkZCBzdXBwb3J0IGZvciBDUzQwTDUw
IGNvcmUgZHJpdmVyDQo+PiAgSW5wdXQ6IGNzNDBsNTAgLSBBZGQgc3VwcG9ydCBmb3IgdGhlIENT
NDBMNTAgaGFwdGljIGRyaXZlcg0KPj4gIEFTb0M6IGNzNDBsNTA6IFN1cHBvcnQgSTJTIHN0cmVh
bWluZyB0byBDUzQwTDUwDQo+PiANCj4+IC4uLi9iaW5kaW5ncy9pbnB1dC9jaXJydXMsY3M0MGw1
MC55YW1sICAgICAgICB8ICA2OCArKysNCj4+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMiArDQo+PiBkcml2ZXJzL2Zpcm13YXJlL2NpcnJ1cy9jc19k
c3AuYyAgICAgICAgICAgICAgfCAyNzggKysrKysrKysrDQo+PiBkcml2ZXJzL2lucHV0L21pc2Mv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KPj4gZHJpdmVycy9pbnB1dC9taXNj
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4+IGRyaXZlcnMvaW5wdXQvbWlz
Yy9jczQwbDUwLXZpYnJhLmMgICAgICAgICAgICB8IDU1NSArKysrKysrKysrKysrKysrKw0KPj4g
ZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMwICsNCj4+
IGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArDQo+
PiBkcml2ZXJzL21mZC9jczQwbDUwLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgfCA1NzAgKysr
KysrKysrKysrKysrKysrDQo+PiBkcml2ZXJzL21mZC9jczQwbDUwLWkyYy5jICAgICAgICAgICAg
ICAgICAgICAgfCAgNjggKysrDQo+PiBkcml2ZXJzL21mZC9jczQwbDUwLXNwaS5jICAgICAgICAg
ICAgICAgICAgICAgfCAgNjggKysrDQo+PiBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL2NpcnJ1cy9j
c19kc3AuaCAgICAgICAgfCAgMjcgKw0KPj4gaW5jbHVkZS9saW51eC9tZmQvY3M0MGw1MC5oICAg
ICAgICAgICAgICAgICAgIHwgMTM3ICsrKysrDQo+PiBzb3VuZC9zb2MvY29kZWNzL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKw0KPj4gc291bmQvc29jL2NvZGVjcy9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4+IHNvdW5kL3NvYy9jb2RlY3MvY3M0MGw1
MC1jb2RlYy5jICAgICAgICAgICAgICB8IDMwNyArKysrKysrKysrDQo+PiAxNiBmaWxlcyBjaGFu
Z2VkLCAyMTQ4IGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvY2lycnVzLGNzNDBsNTAueWFtbA0KPj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW5wdXQvbWlzYy9jczQwbDUwLXZpYnJhLmMNCj4+IGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9jczQwbDUwLWNvcmUuYw0KPj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL2NzNDBsNTAtaTJjLmMNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21mZC9jczQwbDUwLXNwaS5jDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9saW51eC9tZmQvY3M0MGw1MC5oDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL2Nv
ZGVjcy9jczQwbDUwLWNvZGVjLmMNCj4gDQo+IFN0aWxsIG5lZWRzIEFja3MgLSBwaW5nIG1lIHdo
ZW4geW91IGhhdmUgdGhlbS4NCj4gDQo+IC0tIA0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10NCg0K
SGkgTGVlLA0KDQpZb3UgY2FuIHRha2UgdGhpcyBzZXJpZXMgbm93Lg0KDQpCZXN0LA0KSmFtZXMN
Cg0KDQo=

