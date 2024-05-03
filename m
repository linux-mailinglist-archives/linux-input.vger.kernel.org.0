Return-Path: <linux-input+bounces-3430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5048BAFBA
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2024 17:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4925CB211B5
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2024 15:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D06D1514E4;
	Fri,  3 May 2024 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n/MEo5KY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ezwT1Irh"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4DD4AEE5;
	Fri,  3 May 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749974; cv=fail; b=AohVvYlKOCmuNw0Ogfz+MWqPduQdlL3kZfim5RDl2JhCKXxJ5G6uFmmV3iwykaA5z8rSJwazNlk30M6nbnTVRe0clSE4y8Ywh6JywxcvYAoXuTNIcjsD6IzY37wLe6fpbGKLceFQ79qH1TvyaixasP1pJCci+QzpB1Z9BdiOx80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749974; c=relaxed/simple;
	bh=CHMQI5saZr7Zk+SHhJOy+pTvVD6uUhWAgkqn71d4g9I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q3PZdliOmG91W3wnO4xnsa6ARnbGAjhGtM1n/H+Da9/+CitfBY0mXoQhpSA6rlzF/KKcXlmqgtwM1urYS8mx88+L1GTZNQjxsGkgCKN0c1J8xzmoN2wRkOcF6bf9eetj1LCV26+ijCFBssYQfh0obObQlE+GVJiW8q8xXAnPwQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n/MEo5KY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ezwT1Irh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4436rqlr002039;
	Fri, 3 May 2024 10:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=CHMQI5saZr7Zk+SHhJOy+pTvVD6uUhWAgkqn71d4g
	9I=; b=n/MEo5KYgidYL/8/hUy5RDdlMcLE+P0+eypd7saNwyPvfnhu63TwJtPn1
	i9Nbg+lrN0dySJTwktBvZUwCmjMIrp3HVDsOKBU3tehMAXg0eQZF0uPpBjjaFOF/
	mFs4QB7gRAZA9fVia236DO28vGiOsw/P52Tu8QFUgjgn51rW5HAQk2cLeXwgubkB
	Tyy/UdyVLouzXB6/hYuDd1Ba1sfMkjXEraUCqFzAhZPN3r2QvlKFd80itYxI5Iqi
	ILEQOio7V7H5zEfmaqZX5AlwsHrml+fokw7U9ATidQ+alDGxD1YErVMhb7qUyOu6
	ZvdyCeWnK08RTLAH0f0Ri6CjYKWhQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xrxry6xdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 10:25:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV2wj5O6zdLJOq1BzsvMCbQ/UZ52FY9vbruuaCoZHtXQLG5k/b9ORth51oq04KauwM+ZJ9sFSt/M2NHQ+julJ/pdNdDVghElVSFE+DqAnP5HX5W+gGrlev+1rcYhwBKcduffuAkFDl2lgRM0L1yuiMnx6UismfL4mMAwF7kiVFFpb1bN4Vlf+gXrU5rJtplzpA/pNhXiOcDO8vrmunTUAuigHfXfPR+CO7bLCjjPP/vVNdeSojNb1toNtoxu5MvbC8BvYxwzqto9fy0WGeErHCF+uUfRqScWaJ2LnTxVti9gfx+P9BfsyAhfa7KgFBkJeAjcajcycQVokCYcTRrWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHMQI5saZr7Zk+SHhJOy+pTvVD6uUhWAgkqn71d4g9I=;
 b=EOZHSLVzaELc0eZnySHE/WmvyH57dlRhIrRp1iuerhkmtw9BtzRazL+2e66zss+45H8Nh6PYlhT3Y7Emli+2PV03I52ElJaYiuj9fQ2EdnvXOKJVkbg3VvwdNA6c4torn8Bra2GplY3j5r462I1IgBpGk+CzU5q+DSbLjQsBzva/2i3sgoOyqvfrmyfyev7IO+gT7xhje8mF+OyQsW0NJonpKAF34lccUmWRs4jj3hTQr+cmpzEvZLh5dbUiZ9ouHSQsIkIDH+EeumwwTxWiylVZari0adBAlqO7+4o475iOnMS0cCsNPQyV2BHNAvJHmzG4htuK6iL2vczuVqPAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHMQI5saZr7Zk+SHhJOy+pTvVD6uUhWAgkqn71d4g9I=;
 b=ezwT1IrhtWypk4X9+xzQHWqSnNuhSUgE29Hx2sQo/ygZVCpdnJiGjf8bULANUVMxKCxUPzH1+ICbtQaPNJNGsc7bt82hZG4ODqfFNlo8upTqKjCETaYjiYy8KCTgd9v2ZGfZmoomddABMEhyh94gtyAaxF4r2jNus9hq38jzhoE=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DS0PR19MB7394.namprd19.prod.outlook.com (2603:10b6:8:141::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.30; Fri, 3 May 2024 15:25:46 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 15:25:46 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>,
        Mark Brown <broonie@kernel.org>, Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>,
        "open list:INPUT (KEYBOARD,
 MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Topic: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Index: AQHaicn9EuAYDNhWQkWTae4PPhg13bFrl+gAgARirwCAFc4egA==
Date: Fri, 3 May 2024 15:25:45 +0000
Message-ID: <BC84DC9F-65FB-4553-A0B9-52151DD549DB@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-5-jogletre@opensource.cirrus.com>
 <Zh8JimSH4cFZsy3o@google.com>
 <A0925B5F-F8D0-4270-B510-385FE4A38F84@cirrus.com>
In-Reply-To: <A0925B5F-F8D0-4270-B510-385FE4A38F84@cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DS0PR19MB7394:EE_
x-ms-office365-filtering-correlation-id: c84c467d-6b6a-4d4f-a8d4-08dc6b854db8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TlF2eWszUHZ4QnR4aDJyWnRuQUsyeUs5R1FpOWlodERMdGQzQlJHbjV5VmJ3?=
 =?utf-8?B?djZRUndWTURRLyt0aEd6TXlZSmFmQUR2QWV5djRxNW96Uk1DMnUraEZnRk5r?=
 =?utf-8?B?K3lEZjNuaU1vVk5PSkdKRHVwSzFyMlluZ2J6TG1VUk43R09CbSs4WS9nZUZl?=
 =?utf-8?B?cXVYWmlONUVXenV5emRiSzNJYVQ3L216eHluN1FEMWd1K2J0aEo2NUhBWjJT?=
 =?utf-8?B?WjROeUlPcS92OUtWNzg0aVhiWHBMQzZ6Z2JIVW9JK3JVbStqMDdndndYQWNB?=
 =?utf-8?B?N2tETEVMQkdVUURpYjM0VlFUQ2dZaUZBRGhsVERGd2pNY1VPaCthNHBMSVhR?=
 =?utf-8?B?Z1RaRlVGL1ZGVk9KeGZwSTZrTVZVQmRRSW5Qc0hjenNxSTRvd1E5WXJDTlUx?=
 =?utf-8?B?am9YTXhxV0tXcGxrQ1UyN1lHQmllY3BER1I5cTFHcUI0bG1CTzF2UVpLZ2F1?=
 =?utf-8?B?SkpGTXVuMzZtZXdENkJVV1dlVHpKMkRvMXcrVXVLd0pvUjNyTkNveXpmRHRo?=
 =?utf-8?B?Mmg4L0JIRDBuVVh6b1hBU280TUZxWTJVWXk4ODJHLzF4UE84ZUFFL3R2dnRU?=
 =?utf-8?B?TGdvV0NuUVZTcVNQZlhFZGUyNk5BTkRmWnlWTGZ3alFiaGFuUjJXYmE4Qkpx?=
 =?utf-8?B?WWIrcXBrTTBqMVlkaktZT2hRQTUxU3N6N1d3MkNZc215Uk56ZnAzdjBucEs4?=
 =?utf-8?B?bDh4WS9UUWx1U0RLUWdYY1djL1AwZllLT1lwNTl6QjJsSUdnTzUySEtpRG51?=
 =?utf-8?B?bjVTQ0VqZkVObVVIblBWSEQ2eDRoU3UxY1F2bVVjZlRTRWowcWxZclc3SjMy?=
 =?utf-8?B?WUhHYy9UM1BWUWtkTkdxbFFoRkJ0KzRsUjJHZVU5SUQzR2dhREFOWkw4TWh2?=
 =?utf-8?B?RG9scFRIWHMwbmFrNVBGVmVpUnFOV2dwZ014ZHlpQ0k5NlBCQ3A1MFh6WHlX?=
 =?utf-8?B?akhRdXRaK3Z6c0hOV3RrRWM2b3hDQWdmVWROOHdDb2NiWmRaMCs5ajF5QSt6?=
 =?utf-8?B?RWl6TDdhSDRhbEJyOGo3ZjN2V3hmc3owNjRNQ0dOdFpVeTZKQnFINTMvbHBo?=
 =?utf-8?B?NVFyNVMvNDlsN250NlBHU0V5L1dqR0FtV0pIY1Ixc2pCOWNaZU9yUUJ3Sk1U?=
 =?utf-8?B?WitKYm01Tno2K1N4V2JFeWhkMlQ4N1h1OFM0UWZzelZ3cGpEc0NRaWtQMDE5?=
 =?utf-8?B?c2ZFMUxBWGxvc0gzQS9HckpDVm5BOUNCMWp6ZFlhM2hDODNPbXZmWUVJa2o0?=
 =?utf-8?B?N1UwL0EzcTRBSWpuTGc2MlNFajJhQ1VHN1BOSGh4UDEwSVdPbXJ6RWFtVGo4?=
 =?utf-8?B?eFo5S0lQeldVZDB3bzRHRDg1VUZMcXFsbkZDNG55ckV1ZEpmOWNVVlNkRjgr?=
 =?utf-8?B?T09qZUIvaVVBNnNpbXVnYTd6WHcwM1FiaXZFTGh4K1l3QWw2MU1tdFBZZzZX?=
 =?utf-8?B?b3RSWG9pMmM1dGV4Yy9KdHdDVDlvODdXTmJXSTVQVkFNNy8zK0JTaGdCcC9K?=
 =?utf-8?B?KzlCUnUxeUMxckNxRHd0NU95bzJzZy9VUGdSbnE0Yk9pOEhQVHFCd094Wm9J?=
 =?utf-8?B?ZVpMQXQyRE1rUjBJbVNNNVNrbTdXUTM4RnRvVHBOWC9nL2V2ektObTZOa0Fq?=
 =?utf-8?B?U1BtSnFqZ1JaU0pNNTUxSGpUODhOYVVCb0IvbUhzdzh2Qkt4N3RXb01vL20x?=
 =?utf-8?B?TnJYNnhROUkwYW5YN1M4ajZoSUJBZTM5Wk5vcUhvaUxvYVlYNUxadTFvV3Nn?=
 =?utf-8?B?ejl1WnZJNzh2SkdmOXRVdnN3TlRZQ3VvVEFsV3NtOXBQOFhlTU5Hd2pOaEMr?=
 =?utf-8?B?NXhxTDBFekdYRkVVUFlYQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OGhRWjRybkZnS2haRTRWYnUydXdpVGZ5eGhncDd4SEFnTkdUVnh6MGZWN0VM?=
 =?utf-8?B?Q0N5U0cyLzkwckxDZkZEYWlnNWU4cEdoWjZ6T0FRY3UvMWl2MThXeWREUkxn?=
 =?utf-8?B?WXJHUWN1THQzTzAxaDZ3cFBIa3JSUTJUUmZUaklMSlFKcTJlZXVxcG5GNk9T?=
 =?utf-8?B?UzZ6RE5PTmRLYWpOemJJOEpPSDcvS2gxSzZ1MXY1UHA2bHZTbHF5N1U3bEk0?=
 =?utf-8?B?ZlZ1Y3NMQXBpTE9mblI0ZHVoWE5OR3hjcXAvZ1oycGNYSVVZQ1JQODliSGZK?=
 =?utf-8?B?dkZKa0dIcExjdVhIRXJpZUJicE5oK1Y4cm1KQ2NmWWRXNUl6UnNOcEtYZ1Yv?=
 =?utf-8?B?bDdNSkZ6Si9TcHlBaFlHU3NxUDNHWG15TmIrTnJDTFdZWWFSU1VRNjNxMEhO?=
 =?utf-8?B?d3N4aXV4ZVBncjFVSVR4c09rdloyWVZzSWpNMzdSK0o4VkdLYkxraCs4ZDFG?=
 =?utf-8?B?TGRES3dUelhUM3NwUGVxaXA5YkJkWHozZEhkN3ZMZmF4bGZRN3pEbURPdlVH?=
 =?utf-8?B?S3RNRy9BUlJOTmxwamFYRUY2Nm9MdWJKMnFaci9FMnVKZ2VoQTNDQ2RJTjNk?=
 =?utf-8?B?bWY1bWMwQlJuUUZROHhNSXRNb3V2STRCMWJQRFpiMzBpbDBRUjR4b2pxTzJU?=
 =?utf-8?B?dXg1N1ovNDAzU0Y4SHVkTzRmd01nTDI4d2tpdlBWOFRPY2dLNWhldkFUV2RX?=
 =?utf-8?B?N1BDZ3NKY1VMTGJuL2Y4SXNoWDBMUXlpMTI4cWRFNVB5d0xXdVJremVyM1Vs?=
 =?utf-8?B?akQ2M2hOVDNSYzhOeDFYcEN2UkkrVnpUeEQ1dUREbXkvNmEyUnBFNDFsSldl?=
 =?utf-8?B?WnNqOThvRVJaOVFTZFN6d2JZV3U0WGIrVnF6eHlrZW5Dc2RjY0RNWjVtSjZJ?=
 =?utf-8?B?SXRML25BNk05VVk5WjlMaFJPVGUzTFFlTHN3MmtPSit0Y2oyMmtJMlJKSkJv?=
 =?utf-8?B?OVBpOVgxdURyS3VUQUpVWWhUN2M2MTFnaCsyWDVQMVZ1eTRwemFTUHpOeWxH?=
 =?utf-8?B?Y1Z0VVRYZUN4bnc1V2lPZDZtTEpUS3g0UlhQeFAzck9NelRIbVNlYWVOa3JU?=
 =?utf-8?B?cUM3dlVuckJ2UDB3dFYzV0ZmYmFjMUh6VGIraTJ0U1EwS1Z0Mjc3Z29UWHRp?=
 =?utf-8?B?TUxlYVNuZUcrSk5SOENWTXhDQTJBUWlxSVFIZjZxOThrWVFNRDBxWHhKU3JR?=
 =?utf-8?B?dEdRZzJaalJMZ2RLMCt2SDJLODlQZkNWQk1OWEhCRnR4WWZJbmJ2YkZjTUlx?=
 =?utf-8?B?UzZkZzJzK3VETFpYK0FNMnpKQVQ3bjZuY0JrbVZFZ05DSjdlQzVoMHF3c3FX?=
 =?utf-8?B?TUZoZUVYQmxQRUEvKzdrQlh4bUpUWmdhL25BUEJDTERteWFTUkVWZHI4S0gv?=
 =?utf-8?B?MUNsT3l4aTBUTGEydys4aDM2WU5TQW1vYURpT3lIUVczamRzSzZnb0wvYmVF?=
 =?utf-8?B?a1d2SGpoZ1RPUmpvNDVta2w3Q2N0MXhKMVVhOWkxclkwREUxckE3UGJ0OXpQ?=
 =?utf-8?B?M2dXUlNBd3cydkJsazhyYjBMOWtyUVRLYUx1ODIrUzVrTFdkNnF0UkdqN1hB?=
 =?utf-8?B?Q0g4a1FTSFdvWmFIMFVMb00wdmJJWVcyblIycXU3SUk0NFNaSnBwcWYySTZk?=
 =?utf-8?B?VzYrOEN4eVJZckhCd0s5NmNuL3ZlejdaaUNTSlZ2eDQ1aE9JUld3KzJVS2RQ?=
 =?utf-8?B?azNDa0hjVXM4dGFYTHZRZ1pXT3pYOHJ2bG5HZDJkMVRNTjNXQVd0b2xRU2Zq?=
 =?utf-8?B?WEROR0I0NkYyb1hIdWJtSGszNW1QR2NJeDdQSi9oMUw3VkgyUDl2b0dSRk5l?=
 =?utf-8?B?bU1UaWFVTnlPcHdRTnQzcTljZ3NRRmQ5UkFkRzV1cTJkdUJkS0k5R3ZROThK?=
 =?utf-8?B?V2VPRXJ3dlJrOERJaUhCT0hFMXAwT2thQS85dVRYQ1lLbytqUHIvaENMN2dV?=
 =?utf-8?B?MWdRMHA4YUhZK0kvdVMzMDNKYlpKdDEvSTVTdkhPVkcvL1ZXbUFsTmhNUStC?=
 =?utf-8?B?Q2dzaCtSeS9UM0RiQWZUZlQzM3JKS3BoQSsreFJpb3kwWVI5SUxpVms4YXRP?=
 =?utf-8?B?cklHSm9SaVhoNklCRmZCNnF2amNZT0h4QmdJaVpYQmF4OUFBaDQ3Y2t1YkVj?=
 =?utf-8?B?WURncC84eGxJL2hqZWFkQVE0aDN1L05zOExhWnlDVVY5WmRVM2YraTZ5bElV?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75704C0B5B74FB4A8AD7BDA2B5AF2A11@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c84c467d-6b6a-4d4f-a8d4-08dc6b854db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 15:25:45.6904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKJFE/dFBUWu7500AWlCr3LX2sb4yDPCEOoklOENvzPNnwWpiVNsNzSOv/5F+7ODbdWFLFwh8P/Mz6Xgc/OnYZksPK4NSkl9+r+4AKzpmtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7394
X-Proofpoint-ORIG-GUID: qUs0yqWXvNBTMH4ikS1hGvk4Xb3K1S-h
X-Proofpoint-GUID: qUs0yqWXvNBTMH4ikS1hGvk4Xb3K1S-h
X-Proofpoint-Spam-Reason: safe

SGkgRG1pdHJ5LA0KDQpUcmltbWluZyBkb3duIG15IGxhc3QgcmVwbHkgdG8ganVzdCB0aGUgcG9p
bnRzIHRoYXQgbmVlZCB5b3VyIGF0dGVudGlvbi9hY2suDQoNCkkgbWFkZSBzb21lIHNtYWxsIGVk
aXRzIGZvciB0aGUgc2FrZSBvZiBjbGFyaXR5Lg0KDQo+IE9uIEFwciAxNiwgMjAyNCwgYXQgNjoy
OOKAr1BNLCBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+IHdyb3Rl
Og0KPiANCj4gT24gTW9uLCBBcHIgMDgsIDIwMjQgYXQgMDM6MzI6MTNQTSArMDAwMCwgSmFtZXMg
T2dsZXRyZWUgd3JvdGU6DQo+PiANCj4+ICsvKiBEZXNjcmliZXMgYW4gYXJlYSBpbiBEU1AgbWVt
b3J5IHBvcHVsYXRlZCBieSBlZmZlY3RzICovDQo+PiArc3RydWN0IGNzNDBsNTBfYmFuayB7DQo+
PiArIGVudW0gY3M0MGw1MF9iYW5rX3R5cGUgdHlwZTsNCj4+ICsgdTMyIGJhc2VfaW5kZXg7DQo+
PiArIHUzMiBtYXhfaW5kZXg7DQo+IA0KPiBUaGlzIGxvb2tzIGxpa2UgaXQgaXMgd3JpdHRlbiB0
byB0aGUgZGV2aWNlLCBzbyBJIHRoaW5rIHRoaXMgbmVlZHMNCj4gcHJvcGVyIGVuZGlhbm5lc3Mg
YW5ub3RhdGlvbi4gSXMgdGhlcmUgYW55IGNvbmNlcm4gYWJvdXQgcGFkZGluZyBiZXR3ZWVuDQo+
IHRoZSB0eXBlIGFuZCBiYXNlX2luZGV4Pw0KDQpUaGUgc3RydWN0dXJlIGl0c2VsZiBpcyBuZXZl
ciB3cml0dGVuLCBzbyB0aGVyZSBpcyBubyBjb25jZXJuIGFib3V0IHBhZGRpbmcuDQpPbmx5IGJh
c2VfaW5kZXggaXMgd3JpdHRlbiwgYW5kIHRoZSBlbmRpYW5uZXNzIGNvbnZlcnNpb24gaXMgaGFu
ZGxlZCBieSByZWdtYXAuDQoNCj4+ICtzdGF0aWMgdm9pZCBjczQwbDUwX3N0YXJ0X3dvcmtlcihz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+PiArew0KPj4gKyBzdHJ1Y3QgY3M0MGw1MF93b3Jr
ICp3b3JrX2RhdGEgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGNzNDBsNTBfd29yaywgd29y
ayk7DQo+PiArIHN0cnVjdCBjczQwbDUwX3ZpYnJhICp2aWJyYSA9IHdvcmtfZGF0YS0+dmlicmE7
DQo+PiArIHN0cnVjdCBjczQwbDUwX2VmZmVjdCAqc3RhcnRfZWZmZWN0Ow0KPj4gKw0KPj4gKyBp
ZiAocG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCh2aWJyYS0+ZGV2KSA8IDApDQo+PiArIGdvdG8g
ZXJyX2ZyZWU7DQo+PiArDQo+PiArIG11dGV4X2xvY2soJnZpYnJhLT5sb2NrKTsNCj4+ICsNCj4+
ICsgc3RhcnRfZWZmZWN0ID0gY3M0MGw1MF9maW5kX2VmZmVjdCh3b3JrX2RhdGEtPmVmZmVjdC0+
aWQsICZ2aWJyYS0+ZWZmZWN0X2hlYWQpOw0KPj4gKyBpZiAoc3RhcnRfZWZmZWN0KSB7DQo+PiAr
IHdoaWxlICgtLXdvcmtfZGF0YS0+Y291bnQgPj0gMCkgew0KPj4gKyB2aWJyYS0+ZHNwLndyaXRl
KHZpYnJhLT5kZXYsIHZpYnJhLT5yZWdtYXAsIHN0YXJ0X2VmZmVjdC0+aW5kZXgpOw0KPj4gKyB1
c2xlZXBfcmFuZ2Uod29ya19kYXRhLT5lZmZlY3QtPnJlcGxheS5sZW5ndGgsDQo+PiArICAgICAg
d29ya19kYXRhLT5lZmZlY3QtPnJlcGxheS5sZW5ndGggKyAxMDApOw0KPiANCj4gSWYgKEkgYW0g
cmVhZGluZyB0aGlzIHJpZ2h0IHlvdSBhcmUgc3Bpbm5pbmcgaGVyZSBwbGF5aW5nIHRoZSBlZmZl
Y3QuIEl0DQo+IHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlmIHlvdSB0cmFja2VkIG91dHN0YW5kaW5n
IG51bWJlciBvZiByZXBsYXlzIGZvciBhbg0KPiBlZmZlY3QgYW5kIGhhZCBhIHdvcmsgcmUtc2No
ZWR1bGVkIHRoYXQgd291bGQgcGxheSBhbiBpbnN0YW5jZS4NCj4gU2ltaWxhcmx5IHRvIHdoYXQg
Y29kZSBpbiBmZi1tZW1sZXNzLmMgaXMgZG9pbmcuDQoNClllcywgeW91IGFyZSByZWFkaW5nIGl0
IHJpZ2h0Lg0KDQpJdCBhcHBlYXJzIHRoYXQgZmYtbWVtbGVzcy5jIGhhbmRsZXMgcmVwZWF0cyBh
dG9taWNhbGx5LCBob3dldmVyIGZvcg0KcmVhc29ucyBleHBsYWluZWQgYmVsb3csIHRoaXMgZHJp
dmVyIG11c3QgcXVldWUgd29yayBmb3IgcGxheWJhY2sNCmV4ZWN1dGlvbnMuDQoNClRoaXMgcmVz
dWx0cyBpbiBhIHBvc3NpYmxlIHNjZW5hcmlvIHdoZXJlIGlmIGEgcGxheWJhY2sgaXMgaXNzdWVk
IHdpdGggYQ0KaGlnaCBlbm91Z2ggcmVwZWF0IHZhbHVlLCBhbiBlcmFzZSBvcGVyYXRpb24gY291
bGQgYXJyaXZlIGluIHRoZSBtaWRkbGUgb2YNCnRoZSBjaGFpbiBvZiByZS1zY2hlZHVsaW5nIGFu
ZCBkaXNydXB0IHRoZSBwbGF5YmFja3Mgd2hpY2ggaGF2ZSB5ZXQgdG8gYmUNCnF1ZXVlZC4gQnV0
IHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2gsIHRoZSBlZmZlY3QgaXMgZ3VhcmFudGVlZCB0byBy
ZXBlYXQNCmFueSBudW1iZXIgb2YgdGltZXMgd2l0aG91dCByaXNrIG9mIGJlaW5nIGVyYXNlZCBp
biB0aGUgbWlkZGxlLg0KDQpUaGF04oCZcyBteSBjb25jZXJuIHdpdGggYWRvcHRpbmcgdGhlIHJl
LXNjaGVkdWxpbmcgYXBwcm9hY2ggZm9yIHRoaXMNCmRyaXZlci4gUGxlYXNlIGxldCBtZSBrbm93
IHlvdXIgdGhvdWdodHMuDQoNCj4+ICtzdGF0aWMgaW50IGNzNDBsNTBfZXJhc2Uoc3RydWN0IGlu
cHV0X2RldiAqZGV2LCBpbnQgZWZmZWN0X2lkKQ0KPj4gK3sNCj4+ICsgc3RydWN0IGNzNDBsNTBf
dmlicmEgKnZpYnJhID0gaW5wdXRfZ2V0X2RydmRhdGEoZGV2KTsNCj4+ICsgc3RydWN0IGNzNDBs
NTBfd29yayB3b3JrX2RhdGE7DQo+PiArDQo+PiArIHdvcmtfZGF0YS52aWJyYSA9IHZpYnJhOw0K
Pj4gKyB3b3JrX2RhdGEuZWZmZWN0ID0gJmRldi0+ZmYtPmVmZmVjdHNbZWZmZWN0X2lkXTsNCj4+
ICsNCj4+ICsgSU5JVF9XT1JLKCZ3b3JrX2RhdGEud29yaywgY3M0MGw1MF9lcmFzZV93b3JrZXIp
Ow0KPj4gKw0KPj4gKyAvKiBQdXNoIHRvIHdvcmtxdWV1ZSB0byBzZXJpYWxpemUgd2l0aCBwbGF5
YmFja3MgKi8NCj4+ICsgcXVldWVfd29yayh2aWJyYS0+dmliZV93cSwgJndvcmtfZGF0YS53b3Jr
KTsNCj4+ICsgZmx1c2hfd29yaygmd29ya19kYXRhLndvcmspOw0KPiANCj4gWW91IGFscmVhZHkg
dGFrZSB0aGUgbG9jayB3aGVuIHlvdSBwbGF5LCB1cGxvYWQgb3IgZXJhc2UgYW4gZWZmZWN0LiBX
aHkNCj4gZG8gd2UgbmVlZCBhZGRpdGlvbmFsIHNpbmdsZS10aHJlYWQgd29ya3F1ZXVlIGZvciB0
aGlzPyBXaHkgZG8gd2UgbmVlZA0KPiBhZGRpdGlvbmFsIG9yZGVyaW5nIGFuZCBzeW5jaHJvbml6
YXRpb24/DQoNClRoZSB3b3JrcXVldWUgaXMgbmVjZXNzYXJ5IGlzIGJlY2F1c2UgcGxheWJhY2sg
YmxvY2tzICh2aWENCnBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQpLCBhbmQgc28gcGxheWJhY2sg
bXVzdCBkZWZlciB3b3JrLiBVcGxvYWQNCmFuZCBlcmFzZSBhcmUgbm90IGNhbGxlZCBpbiBhdG9t
aWMgY29udGV4dCwgYnV0IHdpdGhvdXQgcXVldWVpbmcgdGhvc2UNCmV4ZWN1dGlvbnMsIHRoZXkg
Y291bGQgY3V0IGluIGZyb250IG9mIHBsYXliYWNrcyB3YWl0aW5nIGluIHRoZQ0Kd29ya3F1ZXVl
Lg0KDQpCdXQgYXMgdGhlIGNhbGxiYWNrcyBhcmUgYWxyZWFkeSBzZXJpYWxpemVkIHZpYSB0aGUg
d29ya3F1ZXVlLCB0aGVuIEkgZG8NCnRoaW5rIHRoZSBsb2NrcyBhcmUgZXhjZXNzaXZlLiBUaGF0
4oCZcyBteSB0aGlua2luZywgbGV0IG1lIGtub3cgaWYgaXQgaXMNCnNvdW5kLg0KDQpCZXN0LA0K
SmFtZXM=

