Return-Path: <linux-input+bounces-4676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2F91A63B
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 14:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291C0283EF9
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 12:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F2514F133;
	Thu, 27 Jun 2024 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GSleWVA/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sYGvvjT4"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06789149009;
	Thu, 27 Jun 2024 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490097; cv=fail; b=oh6pfMdDM3fwDq3Qyf/gcoNLdLjt0nasA0XNpR3txx41ymR0Xqo8brefnAZxYXYqlANRdc58gsfgMFD7AffxKX83lqNCvX6CPE7iRREOkijx/N9FMArwpupvcYXBA40w6iuhBCfpMrZ0eeTUFzaiCPV7/+Ygz0YL3iGFRJ9B0Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490097; c=relaxed/simple;
	bh=cOwrNMjVvcWVRUzsQXx8EO4NSIQJ6eYvnSeCEp3EQ6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mUQ5i5LnwhlIssoD6mwRYOIJ+7wZy8LvJhSGzS3mKfielESvuJdxy8pB/mLxWqxkblm1dXZS0dirLD7ayenuO8Ixi1q27rsXKNsEl7l+6GSg202Fpp2/EN0lxkRFMZlQdfBA4fJIih+58fXiD+FMyKeFgSw98ZUR3YS/WToiCag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GSleWVA/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sYGvvjT4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R58ELd000994;
	Thu, 27 Jun 2024 07:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cOwrNMjVvcWVRUzsQXx8EO4NSIQJ6eYvnSeCEp3EQ6s=; b=
	GSleWVA/Y1oibPiBH1nTnNZ1uCiNFXBLqKTCRY7bz1BPqof1HUnsDbFYNfkSAn7l
	hbAWQnSOKYhUxN2z2f6QuqvYJ8sgfPdQ+uuZj3QkkWJPP+J/AXggm+IRXzorJYfq
	K6wHa1LrzY4XafTo7YflylK3OycMq3m8xWbo0MGUi4QudlcS7FdTJCTBpn2QxCec
	Ipa/IumdhJ+8m5HT8Q4yK+R+eRW/xi/HkCwpI1HPj8Ie9gWppxxlD826RQh15I9B
	w0EYqjsrFTbo/AoCuyyGXvGJOd0I/+xztrpanvZ7vg6zr8i4jpX2lvTYFjWT/OGs
	aiZXfu7kxkAhcHbD5Mka9w==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hwa55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 07:07:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH9of4rjF7igOi/5T6Zjx8s1wscegwWCUs8vSPBirWQI8Vl+5wN7EHEULpRevTCNQXfXlrTsBf+pnU4Inhuo2NYGpzvtVrAmx5/nIUJlKcriM2IzNWr8R5pVoX4xiUknmCq+/ZbisysRuz5kf/qmXCNpmRkgTy2wWcvXf+sbrIpMI65GJ4+VZZ+DLBcyodzn1txilNqrS/5DvVkrXyHlnd44JqzSE3NYqK6M0i6SHmhbhAp3K3HK4LvdR1IUNIDXdDqbZeTYDPprd0uAti47fOI9mH19R+RXtpCxNjAyt+CSyISo74vQzQxrKdQX2uvfBXiayIwzcUj5Coe9Mce+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOwrNMjVvcWVRUzsQXx8EO4NSIQJ6eYvnSeCEp3EQ6s=;
 b=RaSr6btx6J0hJdqeZaexH7gjaVtWrr9zNGFwUrUKwxreGVONb0HzwP3L8M/vTOugrQXc8wTO4hKtp08F0HQ/k3wQmXayTwtj2AfRcc9ukWZNadTfsxlLRwoVfupcq0c+OLmF6xsZDJ9eaoNc7hsmerBddIfD0QuMqG/QItJQnUQA3uTP9tmSjuLWBxGJAaIGalyJZ6gWM87rtNdAMpJAauBrTgAVjqCozQD8bqMqxavVyTVT1evozIvpRnqqiLuSBFITZnzbh/Z2hAWpxvYE51PDHjPWlKm0mXcbgv8XIkPCh7VWQX8viXqdKxCG3GXBgvtUjnr+uo0IRXbxWKg5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOwrNMjVvcWVRUzsQXx8EO4NSIQJ6eYvnSeCEp3EQ6s=;
 b=sYGvvjT4vd7+ouilx9rT2yiAEOYgv9sHn7FDggK7ohi8J2/8j+i3RUS8InP0MLNfV5m+r6Xt00ALKb7BascqwbnjHy1SNubPrYbUrQR2oIziDk/nBBjR9oNyMee2sPvEoZ8c1MPT2c0HY2fMwQUHMjaZwN0Rd1P/zNbmxCjyfdQ=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DM6PR19MB4107.namprd19.prod.outlook.com (2603:10b6:5:246::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.35; Thu, 27 Jun 2024 12:07:38 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7677.036; Thu, 27 Jun 2024
 12:07:38 +0000
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
Thread-Index: AQHawy1sjk2JaBubyUKzdOotv82g/bHQ4BmAgAmqUoCAALIaAIAAUkeA
Date: Thu, 27 Jun 2024 12:07:38 +0000
Message-ID: <C8C41985-E19A-400C-9DF2-720BCDE984E1@cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620165935.GT3029315@google.com>
 <21975F67-D71D-4D5D-8042-8EE64E8864CA@cirrus.com>
 <20240627071258.GE2532839@google.com>
In-Reply-To: <20240627071258.GE2532839@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DM6PR19MB4107:EE_
x-ms-office365-filtering-correlation-id: 53e340e8-b8c3-4914-cbb4-08dc96a1bcce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UFQ2NUZ5UEZGOTZOZldUakpLRy9nQXVnVUVib05UWldqUjhsL1ZiY3hJS0J1?=
 =?utf-8?B?eWtjbDM4OU1jd1JnUGVPWExuUGRacEd3VTJReHNZU1RZdGN3OTJmYm9wVWRl?=
 =?utf-8?B?SS9naEVUZlJzeUswclE1eGk2QTJDcVZFTHNXMDdBdFpRNjcySm5YU1ZVREEx?=
 =?utf-8?B?dUVmVklWY20rckVxbnVMR05sVmk2VkR0cjFNWlRzKzM5czV4WU1FY09xUHg5?=
 =?utf-8?B?WUNha2lLUDcvT0VOdHdxbnF0NWJnMDNHMTJ0b1JQMUJUSEVEWDhhYVhlODk1?=
 =?utf-8?B?K3FpZWhOSEJCVlNpK2loQ1plZ2ljWVFlTTF1ODdsbGtrZ29PVGFZUDVqellM?=
 =?utf-8?B?N2swN1FJQlFmelFIdDVFUXJSMDJsQW1OZFlYM0FzQmZTSTdMc1JnMTBPSEJi?=
 =?utf-8?B?QUVzamh5UDYwZUJjbld6UUN3Ynk4VTYwbWdweHlYNnAxTGFVMkFac0JuRmpz?=
 =?utf-8?B?bzl0MGt5NnNFVmhDQVFQS05iZGM0ZGF1Rk5hcFNpM1o1Z0E1WHVkTGNBSWoz?=
 =?utf-8?B?Nk9vV1RlbWplcEZiOFNMU3J4ckYzQzRtT3EwVkU4Yy85OFZaWG9EV2lsZGZu?=
 =?utf-8?B?RTFPbzF3OVptbnlCUXA0UVhJbVcvWklGL0p6K2JIbnRxMHFBR2ZTbkFDdXox?=
 =?utf-8?B?YXBIUHNianZkcUUzeS9zYzdaTGdndlA4QzdGTWpEZEFkeFVIelJ6Y3BCOThS?=
 =?utf-8?B?VGEvRGtZNnhBVlF3QXhQY2t6MzBZM1VJZ3RwZXowQWYyYWxXT2xmVEgvNjBx?=
 =?utf-8?B?TzNRd1laZEpWcEJ0MWh0Snloam55aFhjTENOdDB6ODdJWXN2QTJvckNsY3JV?=
 =?utf-8?B?YmdaTXg1RDFxMi9uNUNnQm41WWpyYTNScnlKek9wbHgvMDJPU1o3ak1GZU5N?=
 =?utf-8?B?MllpNGtBcy8rUXlNbC9nNFY3ak5NNWhPK0JEdElUK2ZtRDBFMHpkQUtMUGtP?=
 =?utf-8?B?UnpCeFcxRWJLbWlSakJaWEcrUTdkZGtHZDM5Wkl5QnZKbUo2bzc2RW1KKyt6?=
 =?utf-8?B?NFo2MXNRMWFBclFodkJvQVQwSnVuNENuZWdOQ3BWTmlkUkNjdXZKeGlLN3lk?=
 =?utf-8?B?Vng2azdzeTQ3VlJsYXJHVDRKWFJvQ2FwNFFzb0pTc1d6OEVRYTVTc3JUZ3dn?=
 =?utf-8?B?WGszT0ZOUUZsWFNhM2k2ZE1hVW05cTVBbzBqRXdpVVdDVmtNUXIvODNsMzlo?=
 =?utf-8?B?NXpwRnRWdkE2QTNGMUtmMUxGdmpuckpDUFhUWHpaN2hTSE1zMzZPa21XdkFt?=
 =?utf-8?B?SXZRQ1REbFlEekFoeHNGMFVlYVZEcGhCQ0hnM3ZCdkxQVWRRYlAyVGJiSFVt?=
 =?utf-8?B?b2krdCt2NEdrL0hIc2V4LzR5VE5OQW5mdW04VmxOSEcvYnJpWDdUU0VTbXA4?=
 =?utf-8?B?NW9hLzk4SllTeUhLdTZxY29aME1pNC9kcTVjM09iclRhV2thbnRLUWRmdmhZ?=
 =?utf-8?B?UTFPTSsvV3RFOHlCNnp0WnBxdkhrV0NaYzk4WnhuVnFWZkp0M2RZZ1UvY1dC?=
 =?utf-8?B?dENWL0NyMXhjQndWam4rOFdaOHlHQjRwS01rbjNWbU5nd2EyTFZUNjFaeXRR?=
 =?utf-8?B?R28yS0dyQTB6NGtOU2YrOTFIVEYyN0MrZ3JTRjdDZjVLT0JDbXpOZWFnbitQ?=
 =?utf-8?B?VVBSWkwyQW0wZFlPb3pXWDd6Y2t4N1Ixbk5aMC9mSFowZURNc1FqZ1NUL0hT?=
 =?utf-8?B?UW1TQXRQU1BzUWcwWVM3UUhkRVRtdWVzQzlOVDR2K0xjVUxVUm1NRFVVWGx6?=
 =?utf-8?B?Z1d1b0dUQktCNm8zelZvWXNlSHRVTU5CM29aK2pjalltNlBxUDVmR3h6b0NO?=
 =?utf-8?Q?HLDFq5S4Bbn5oziShmFMiQ9EmaWDsc2xN3oKU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YVRKYUl0bUpOOTl6MG5XTEQrTlo4R1Q5amNIaC9PdEdqeForNkhVd1lVd1ZO?=
 =?utf-8?B?TFAzdzRJbkhzNjdzUVVNNFg0OFdXY1VjcjZWNlpYQUdHOVZTUHJzK0pYRmNL?=
 =?utf-8?B?MndaSHRvNDhQOHFhazgvTnVtZWdZSDRkVTVuQ3BoSWpjbmlPNGcvaDl2UUZS?=
 =?utf-8?B?bXpRUWQxWUh0eXdoZU1mdVM0b2c4clVHVGdxSG1keUhhVjloSWZ6ZkhKVnp0?=
 =?utf-8?B?VGZmQ1ZZRlhhOXFXSFVHSFgzNDFsbC92bUFZSHRRbkFITEV6SnVyQW8vT01F?=
 =?utf-8?B?S2N0Ui9zdmZwQ29yQ242MzZWeGpIWWR1aVFmWmtsaWFWa1ZBcjdVVytEejVZ?=
 =?utf-8?B?a1FtNGpITUNEQkVDNjA3STlwbnNFMWpmZVRSRHFSa29BaHFvU2FCT0JLYktK?=
 =?utf-8?B?OVh0MUVZbytDK2xtSFlGNUVkYzNOaTRKVFN0NG5Ta1hqYVFYcjh0c1FwQWJT?=
 =?utf-8?B?VkpscTM5bXBXU0JWVzEzNzM3YUNJQjlMaTNVbm1mNzU0N3gwUUY2ckV2Y1F2?=
 =?utf-8?B?WENOOC92Qm5mWVV6N0dhYmVnWUtEQzZZek04RTFiakxIeFBOSDlQTFFUMkRD?=
 =?utf-8?B?ajRkVUs2OHFjb29hUTFkY2llZUl3dGxVQStIaGJrWjRIa3RsejIyUGNjUTRh?=
 =?utf-8?B?Zit3ZjJzbDRZbUpTUVpKc0xmcHJTUFhhZFRhQkEyQUNaSDJzcEdBeG9kK25Y?=
 =?utf-8?B?bDZ6OW93THRyK3BXVGpNRDIrMWZCenZna0E4Q3JnK2toSlR4Q1VSTk9lK05u?=
 =?utf-8?B?SEJJQVQxUXFMTTNHdUZnekV2T244T0RudUxSTmpLNmNTWk1DODhJUDdwaEdx?=
 =?utf-8?B?MHliRFVJSUdZNENpOCswb0Y3U3VIN013UTM1cjZ3dUlmR1NxU1VpS3Y1enRy?=
 =?utf-8?B?OVM3T1V3WW5Xa043OGlqM3huMHFScW1HdjlSMFkya0M1N0llTnBjU0RiYnlD?=
 =?utf-8?B?M25nUVBUYmp5OW1vWDhGZkJPZ0h1QjJ4U2xzZ09ab1c5SVI2NUR0RkRzRjRy?=
 =?utf-8?B?YnRIRDIvYnpocVRUMmdEcUNQTnNZWERVWkdjQjRIUXhFV1hqQTNpVmVqRjZX?=
 =?utf-8?B?b1Q0dVprQkZkQXl2N29aY21hc0xNbXlxd0c1cmVBRFBUd0gxRVRzSnZuTWpR?=
 =?utf-8?B?RnE3aEFiUUl3bSsxVGtMcWlZSlc3US8ycUNrcXBua0xOaWRPNisxeTlMeXhM?=
 =?utf-8?B?Rnd0RXhPZ3BTMDM3cnBQa051L1N1bnN4bTdxK2NJVVNaVUhydTl6RWhlUitn?=
 =?utf-8?B?MGVBRk9RaHA0YUtoRDhKSnhpcVdUUUtjS3Rqc25Ea2RTb055QWl1NnZiSDdy?=
 =?utf-8?B?eXZBcXVPYmZuQ2M0c3NucE9taXlYdXJpRlZNMVVwWUNYYXpLUFZBOUxNLzhP?=
 =?utf-8?B?Q25aa1RIOWxzY0VjaTF5NDBrU292OVU4VnlBZjhQbXNPTFFocGU0OUt5aW4r?=
 =?utf-8?B?SENvellwc0FKZVB0YkNNVzh0Nlo4NkpGalJ4eFA2V2VSMlNmRmlLcHdIVzNy?=
 =?utf-8?B?SVlkWFA1Qk42RmJkb3ZPZHFzWmo4TmI0dnd0S3d4WWkzVDBHMHFaRTJoSlhF?=
 =?utf-8?B?dStBQWJTZ2pVY0tHVnR2dUNyNERONndMUmdiRUZqVmxNeXJnakhiQUtTTHpE?=
 =?utf-8?B?RCt4cmhEcnYrbUFKVExkbWdZc2xPZ3c1SEp1TTRtQk5XVStXZmRtZXNJbVho?=
 =?utf-8?B?NG5TZi8zV0hyaDhPcnJlZHBodWExUUYwYzJSRXdTd1hUUFdINjR4NWUrNjVN?=
 =?utf-8?B?T2JYSy9KUk5tQk9QYVR3RmhjTjA2Mm9YVlU3aHk4TjJwTWhsYmFJVmdzdGta?=
 =?utf-8?B?aFdjS2pjeDNJanNGeDBweUoydXpGZElhSXoyQ2w3SW5HV2Rpays0RnFHYzJQ?=
 =?utf-8?B?a1haNmFrQkJ6L0xwaGxDdDRQc01WdzlYc1I4bXFaS0JiNnBnaXR3UEdBa29s?=
 =?utf-8?B?bkVSS1JEUWxvOG9OL2Zibm5QcFBLWWxaUC9QTTZRLzJnVDdoNTB0VGQ1Sk05?=
 =?utf-8?B?WnRqeWRlK0ZoQnNvQWdLSW5xbGx3aEZ4VzBqWmtBR0ZkT2VIeFhqai9scHJM?=
 =?utf-8?B?dWV1M1l2ZmVKS0tjbnY2Z25XbWVIOUkrYUVjYkI3OUF6elYwa01Yb1VpUCtr?=
 =?utf-8?B?OEZHT3poMzJjbnBZbWJVUW12ZWFsUlpRTVdrUnl2bGs1SExXekxTSXc4cjIw?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E0ECD8116CDDF469DE4437098215962@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e340e8-b8c3-4914-cbb4-08dc96a1bcce
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 12:07:38.1249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSLyN/Gakda0Mm6qLmvCUuJ+m4ap7Lm/PFezv4gNqqnH5h8r+jhouFjPSd4fT6DnJMi9ozuHwXyUbGXHYDRWcdt2g/ptwsEBc9YP1Cc0j68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4107
X-Proofpoint-ORIG-GUID: 7PwbtoAqqBGUYvQqXAMs-MeRjvfjYDT9
X-Proofpoint-GUID: 7PwbtoAqqBGUYvQqXAMs-MeRjvfjYDT9
X-Proofpoint-Spam-Reason: safe

DQo+IE9uIEp1biAyNywgMjAyNCwgYXQgMjoxMuKAr0FNLCBMZWUgSm9uZXMgPGxlZUBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMjYgSnVuIDIwMjQsIEphbWVzIE9nbGV0cmVlIHdy
b3RlOg0KPiANCj4+IA0KPj4+IE9uIEp1biAyMCwgMjAyNCwgYXQgMTE6NTnigK9BTSwgTGVlIEpv
bmVzIDxsZWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVGh1LCAyMCBKdW4gMjAy
NCwgSmFtZXMgT2dsZXRyZWUgd3JvdGU6DQo+Pj4gDQo+Pj4+IENoYW5nZXMgaW4gdjExOg0KPj4+
PiAtIENvbnN0aWZpZWQgZnVuY3Rpb24gcGFyYW1ldGVycyBpbiBBU09DIGRyaXZlcg0KPj4+PiAt
IFJlbW92ZWQgYW4gdW5uZWVkZWQgI2luY2x1ZGUNCj4+Pj4gLSBDaGFuZ2VkIG51bWJlciBvZiBt
YXggRkYgZWZmZWN0cyA9IDENCj4+Pj4gLSBNaW5vciByZWZhY3RvcmluZyBpbiBJbnB1dCBkcml2
ZXINCj4+Pj4gLSBSZXdvcmRlZCBjb21tZW50IGluIE1GRCBkcml2ZXINCj4+Pj4gDQo+Pj4+IENo
YW5nZXMgaW4gdjEwOg0KPj4+PiAtIE1pbm9yIHJlZmFjdG9yaW5nIGFuZCBsb2dpY2FsIGltcHJv
dmVtZW50cyBhbGwgYXJvdW5kDQo+Pj4+IC0gUmVuYW1lZCBhbmQgYWRkZWQgc3VwcGxpZXMNCj4+
Pj4gDQo+Pj4+IENoYW5nZXMgaW4gdjk6DQo+Pj4+IC0gRml4ZWQgZW1wdHkgc3RydWN0IGJ5IHV0
aWxpemluZyBjc19kc3AncyBwb3N0X3J1biBjYWxsYmFjaw0KPj4+PiAtIFN0eWxlIGZpeGVzIGlu
IE1GRCBkcml2ZXINCj4+Pj4gDQo+Pj4+IENoYW5nZXMgaW4gdjg6DQo+Pj4+IC0gc2V0X3N5c2Ns
aygpIC0+IHNldF9iY2xrX3JhdGlvKCkNCj4+Pj4gLSBBZGRlZCBJRCB0YWJsZSB0byBjb2RlYyBk
cml2ZXINCj4+Pj4gLSBTdHlsZSBpbXByb3ZlbWVudHMNCj4+Pj4gLSBGaXhlZCBvcmRlcmluZyBv
ZiBuZXcgd3JpdGUgc2VxdWVuY2Ugb3BlcmF0aW9ucw0KPj4+PiANCj4+Pj4gQ2hhbmdlcyBpbiB2
NzoNCj4+Pj4gLSBGaXhlZCBzcGFyc2Ugd2FybmluZw0KPj4+PiAtIE1vdmVkIHdyaXRlIHNlcXVl
bmNlcyB0byBwcml2YXRlIGRhdGEgc3RydWN0dXJlDQo+Pj4+IC0gTG9naWNhbCBhbmQgc3R5bGUg
aW1wcm92ZW1lbnRzIGluIHdyaXRlIHNlcXVlbmNlIGludGVyZmFjZQ0KPj4+PiANCj4+Pj4gQ2hh
bmdlcyBpbiB2NjoNCj4+Pj4gLSBVcGRhdGVkIHdyaXRlIHNlcXVlbmNlciBpbnRlcmZhY2UgdG8g
YmUgY29udHJvbC1uYW1lIGJhc2VkDQo+Pj4+IC0gRml4ZWQgYSByYWNlIGNvbmRpdGlvbiBhbmQg
bm9uLWhhbmRsaW5nIG9mIHJlcGVhdHMgaW4gcGxheWJhY2sgY2FsbGJhY2sNCj4+Pj4gLSBTdHls
aXN0aWMgYW5kIGxvZ2ljYWwgaW1wcm92ZW1lbnRzIGFsbCBhcm91bmQNCj4+Pj4gDQo+Pj4+IENo
YW5nZXMgaW4gdjU6DQo+Pj4+IC0gQWRkZWQgYSBjb2RlYyBzdWItZGV2aWNlIHRvIHN1cHBvcnQg
STJTIHN0cmVhbWluZw0KPj4+PiAtIE1vdmVkIHdyaXRlIHNlcXVlbmNlciBjb2RlIGZyb20gY2ly
cnVzX2hhcHRpY3MgdG8gY3NfZHNwDQo+Pj4+IC0gUmV2ZXJ0ZWQgY2lycnVzX2hhcHRpY3MgbGli
cmFyeTsgZnV0dXJlIENpcnJ1cyBpbnB1dA0KPj4+PiBkcml2ZXJzIHdpbGwgZXhwb3J0IGFuZCB1
dGlsaXplIGNzNDBsNTBfdmlicmEgZnVuY3Rpb25zDQo+Pj4+IC0gQWRkZWQgbW9yZSBjb21tZW50
cw0KPj4+PiAtIE1hbnkgc21hbGwgc3R5bGlzdGljIGFuZCBsb2dpY2FsIGltcHJvdmVtZW50cw0K
Pj4+PiANCj4+Pj4gQ2hhbmdlcyBpbiB2NDoNCj4+Pj4gLSBNb3ZlZCBmcm9tIElucHV0IHRvIE1G
RA0KPj4+PiAtIE1vdmVkIGNvbW1vbiBDaXJydXMgaGFwdGljIGZ1bmN0aW9ucyB0byBhIGxpYnJh
cnkNCj4+Pj4gLSBJbmNvcnBvcmF0ZWQgcnVudGltZSBQTSBmcmFtZXdvcmsNCj4+Pj4gLSBNYW55
IHN0eWxlIGltcHJvdmVtZW50cw0KPj4+PiANCj4+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4+Pj4gLSBZ
QU1MIGZvcm1hdHRpbmcgY29ycmVjdGlvbnMNCj4+Pj4gLSBGaXhlZCB0eXBvIGluIE1BSU5UQUlO
RVJTDQo+Pj4+IC0gVXNlZCBnZW5lcmljIG5vZGUgbmFtZSAiaGFwdGljLWRyaXZlciINCj4+Pj4g
LSBGaXhlZCBwcm9iZSBlcnJvciBjb2RlIHBhdGhzDQo+Pj4+IC0gU3dpdGNoZWQgdG8gInNpemVv
ZigqKSINCj4+Pj4gLSBSZW1vdmVkIHRyZWUgcmVmZXJlbmNlIGluIE1BSU5UQUlORVJTDQo+Pj4+
IA0KPj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+PiAtIEZpeGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MN
Cj4+Pj4gDQo+Pj4+IEphbWVzIE9nbGV0cmVlICg1KToNCj4+Pj4gZmlybXdhcmU6IGNzX2RzcDog
QWRkIHdyaXRlIHNlcXVlbmNlIGludGVyZmFjZQ0KPj4+PiBkdC1iaW5kaW5nczogaW5wdXQ6IGNp
cnJ1cyxjczQwbDUwOiBBZGQgaW5pdGlhbCBEVCBiaW5kaW5nDQo+Pj4+IG1mZDogY3M0MGw1MDog
QWRkIHN1cHBvcnQgZm9yIENTNDBMNTAgY29yZSBkcml2ZXINCj4+Pj4gSW5wdXQ6IGNzNDBsNTAg
LSBBZGQgc3VwcG9ydCBmb3IgdGhlIENTNDBMNTAgaGFwdGljIGRyaXZlcg0KPj4+PiBBU29DOiBj
czQwbDUwOiBTdXBwb3J0IEkyUyBzdHJlYW1pbmcgdG8gQ1M0MEw1MA0KPj4+PiANCj4+Pj4gLi4u
L2JpbmRpbmdzL2lucHV0L2NpcnJ1cyxjczQwbDUwLnlhbWwgICAgICAgIHwgIDY4ICsrKw0KPj4+
PiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKw0K
Pj4+PiBkcml2ZXJzL2Zpcm13YXJlL2NpcnJ1cy9jc19kc3AuYyAgICAgICAgICAgICAgfCAyNzgg
KysrKysrKysrDQo+Pj4+IGRyaXZlcnMvaW5wdXQvbWlzYy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICB8ICAxMCArDQo+Pj4+IGRyaXZlcnMvaW5wdXQvbWlzYy9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICB8ICAgMSArDQo+Pj4+IGRyaXZlcnMvaW5wdXQvbWlzYy9jczQwbDUwLXZpYnJhLmMg
ICAgICAgICAgICB8IDU1NSArKysrKysrKysrKysrKysrKw0KPj4+PiBkcml2ZXJzL21mZC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzAgKw0KPj4+PiBkcml2ZXJzL21mZC9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPj4+PiBkcml2ZXJzL21m
ZC9jczQwbDUwLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgfCA1NzAgKysrKysrKysrKysrKysr
KysrDQo+Pj4+IGRyaXZlcnMvbWZkL2NzNDBsNTAtaTJjLmMgICAgICAgICAgICAgICAgICAgICB8
ICA2OCArKysNCj4+Pj4gZHJpdmVycy9tZmQvY3M0MGw1MC1zcGkuYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDY4ICsrKw0KPj4+PiBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL2NpcnJ1cy9jc19kc3Au
aCAgICAgICAgfCAgMjcgKw0KPj4+PiBpbmNsdWRlL2xpbnV4L21mZC9jczQwbDUwLmggICAgICAg
ICAgICAgICAgICAgfCAxMzcgKysrKysNCj4+Pj4gc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgIHwgIDExICsNCj4+Pj4gc291bmQvc29jL2NvZGVjcy9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4+Pj4gc291bmQvc29jL2NvZGVjcy9jczQw
bDUwLWNvZGVjLmMgICAgICAgICAgICAgIHwgMzA3ICsrKysrKysrKysNCj4+Pj4gMTYgZmlsZXMg
Y2hhbmdlZCwgMjE0OCBpbnNlcnRpb25zKCspDQo+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvY2lycnVzLGNzNDBsNTAueWFtbA0K
Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pbnB1dC9taXNjL2NzNDBsNTAtdmlicmEu
Yw0KPj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvY3M0MGw1MC1jb3JlLmMNCj4+
Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL2NzNDBsNTAtaTJjLmMNCj4+Pj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL2NzNDBsNTAtc3BpLmMNCj4+Pj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL2NzNDBsNTAuaA0KPj4+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgc291bmQvc29jL2NvZGVjcy9jczQwbDUwLWNvZGVjLmMNCj4+PiANCj4+PiBTdGlsbCBu
ZWVkcyBBY2tzIC0gcGluZyBtZSB3aGVuIHlvdSBoYXZlIHRoZW0uDQo+Pj4gDQo+Pj4gLS0gDQo+
Pj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQo+PiANCj4+IEhpIExlZSwNCj4+IA0KPj4gWW91IGNh
biB0YWtlIHRoaXMgc2VyaWVzIG5vdy4NCj4gDQo+IHNvdW5kL3NvYz8NCj4gDQo+IC0tIA0KPiBM
ZWUgSm9uZXMgW+adjueQvOaWr10NCg0KTWFyayBoYXMgQWNrZWQgdGhlIG9yaWdpbmFsIHYxMSBz
ZXJpZXMgaGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hODVlMDlkNi1kOGViLTRj
NjAtYWU4My1iNGRiZjg3NWE5MjZAc2lyZW5hLm9yZy51ay8NCg0KQmVzdCwNCkphbWVzDQoNCg0K

