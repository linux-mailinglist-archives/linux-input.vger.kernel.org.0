Return-Path: <linux-input+bounces-4573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB0913DA2
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 21:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CCF92831E8
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6C018410A;
	Sun, 23 Jun 2024 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NwLogISq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="E7pB/xYy"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82414884C;
	Sun, 23 Jun 2024 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719169522; cv=fail; b=GCa4FyL+1mMVh58xjgFinlimlzBeblaVYO+Q/YUsGCGtJ1zXQvCpd6zsoZrQVMQPDNDwlLS5MQmQxNZI2rGZZMZhus533JpRy0ebrCsJ6hgnD617Y4sVtwEr6+RD22xwFz5mvpo/jkmADmzNXAnf6tbEOR2Os0VzV41a5Yw5lfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719169522; c=relaxed/simple;
	bh=shDYiWiHd/bDMvtKlXvaHLy7OwxZ7xTXnN5S/BM6wdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qpQaZvCjQRbUK8pmGsmC0/pApY4u1Zb2YCTggpwoZ3Iw8PSbdAkm8bYF5wWJoSvLj/MOqsWupJYeAzxuk7Z//Cq3xlPfUak0MtL+erbB1uAcbXOYr6KUHoQDUYGr/u1IXmSRZcqU2RE1lNMkrp7jj+XDcqUS+w+Ez0JS76UNB5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NwLogISq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E7pB/xYy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NIr2tu000899;
	Sun, 23 Jun 2024 14:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=shDYiWiHd/bDMvtKlXvaHLy7OwxZ7xTXnN5S/BM6wdI=; b=
	NwLogISqLAxRNGutM0lCsaauqaTXt/oVUrBZoKWyCltRIOE7LGYcYcVTlbTTnNXT
	haE4MKv998WXrO+KMENEE/h48jG3ILGFN7v4B6mHTYyp0in1tRv79ta3DNrShCOd
	vDN1Nj2Okc9u/rRcpYY2OmzDsYaMGRxfZaw0pkM2+oCdydosAxDjtmOfkd8NAaWo
	0+AB/QSOFA+VPgubJCz6TA449LtVkLxzveq0k9f9mOlGmoT+b3zYo3WlEnZKdphx
	DBcaRi/6XgjJL9Df6EsGAeEyAf6d6pUGiDwZjn3QM1FMOrn+CRhJrIo1uXTJmlrJ
	wMRx781bPTWf9I0JGPvwXw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ywv0x8y1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 14:05:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYTOMFVFYlQGY0evE7JM26WbUG71I9pzHkaj/OQ0Ld/egrmwM3bzKNZONqpxSBthOQYrcm60sUddWiPNSYRj5pog0NexArwdmf4NzYFHqEyCRQ8Au5E7WCjQMDu4p16mlg28tfWFCKZBVxFMzS4R6RmGSiTK8s5VREHnIbKlaoa3DQTKnwhN9Mg1uj6p4eFbqWEH4nx3VCbU3OvWo/XeubLH4SMcvFk7TNqbtNomopxLMQHUW1hGXWnGYplngtOFocXnFMi2rYEWnJVoxrRYdRteu0ObT6LNwKDDEgAeoMAs4CJ+vTAsBCU+gry6hDq8KI/3rYXedAd0+4vhh6Kz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shDYiWiHd/bDMvtKlXvaHLy7OwxZ7xTXnN5S/BM6wdI=;
 b=Qb2Jz2gar2OAVmRZwkvBPWyCjqavVeE5BNvUKsdscleNvh3fNVNblMbLXBZ0ha/oPBVzfZ7828v0DERfP6aCd5CSqWUDzlNyK9gxohUoMTxyClWXuoNOMKWvivEZ/uhZiFR0jKtmSCWDyJGZo9lCK+18ePnSuQs7b4yH44M4iSYpVMw6HcntgXX8xZAysFP5LrlCd8aM0CKGxIdWwuW5WH1hQXrTv+pFiJbhSZnwC15K0p/vk0L7D6O3Po1BGrmDyMWj/3Y2+lngNjsjvvwD7LCYzpRgsJBb4lK3PHV7Kxvng+ZyYJbfV/w6nYHbfDrSZBQ2wtbOadAw8rAI+xMrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shDYiWiHd/bDMvtKlXvaHLy7OwxZ7xTXnN5S/BM6wdI=;
 b=E7pB/xYyJMHjKmDs2WVC3JA3vTAjBlMZY36z7PcLwP9gwu+uY4nmnm8zRfnDY2wI6+w17cVH8sa2JsenPEecuH9/otwig+VExMduu38wsEVk20hW+aK+zWDWMvg+PG+aeP+oGyyE87f68wGS5otuJraHRf2XUOBF+tEYxcCJkMg=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DS0PR19MB6551.namprd19.prod.outlook.com (2603:10b6:8:c3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.26; Sun, 23 Jun 2024 19:04:57 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7677.030; Sun, 23 Jun 2024
 19:04:57 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Jeff LaBundy <jeff@labundy.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v11 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Topic: [PATCH RESEND v11 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Index: AQHawy2Dt6snIwIAhk2ti3emTRi5zbHUgH2AgACAj4CAALkHgA==
Date: Sun, 23 Jun 2024 19:04:57 +0000
Message-ID: <7BC818B9-EA9D-477B-AD62-B7266A424257@cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-5-jogletre@opensource.cirrus.com>
 <ZndqwfN4G+RkCNrn@nixie71> <ZnfWmR48MfcQKpTS@google.com>
In-Reply-To: <ZnfWmR48MfcQKpTS@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DS0PR19MB6551:EE_
x-ms-office365-filtering-correlation-id: 2b3e8e8a-326c-46c7-38a4-08dc93b75fe1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|366013|1800799021|376011|7416011|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TFVRbm5ZVzRBeU51VitjaFEvbGRwdHVpTmRVajh5cXRxSDNMN3lrdjlMcThL?=
 =?utf-8?B?Z01ObE42NWFmaUFVTllsbGtJOUlQY2xqS3c3cUpwem5EQUJHOU5tbDh6bVlt?=
 =?utf-8?B?QVJCd2FVS2l5ZmFwRG1OQklTUEliVWRKZGRocmNwTCtvSnhXSW4zeTAyM0cx?=
 =?utf-8?B?Y0pNRXpmTGpjRSswMkRteVpQbjRFQlVoNW45dlM2YklNS2w2Uk1GUDdOdDZC?=
 =?utf-8?B?bmUxUnA4U3FsZnZFTnFYZnZIWFY4MFhSSGRzajBSY3YrUUUvTk1ZNThWbDV4?=
 =?utf-8?B?ekF5TmJuZlFnTHdIMHVRa2FGc0FpZWR1NW56eWNQaUlOeVJacm8vT25HWTFF?=
 =?utf-8?B?Uk5NZnhwRmNPOXJtSUtndENRS2c5Z1dMRGVIYXI5Z3lMc0d2Tk8xeksvVnRq?=
 =?utf-8?B?UEZ1cFkrd1dhNnJNRTdDK3UvUVBEN2tIaHAvVlk5dDJIRnZVVktJaVNteGZM?=
 =?utf-8?B?cmY2TGVRN2Y0bEE4aEwreHp1VWdjdkFsWEM5d0dJQnhadGxjbCt2dXdDSU1G?=
 =?utf-8?B?SUVTWVEyWU9wa2owZEs1c3JXSVBLd0ZaY2JseVAxd3Qwb0lZdVd4alZUMEd4?=
 =?utf-8?B?Y3Z3NjlJNFQwMUdBYkU0RGpGRnlyQWJJUVJUQ2MvQ2h1N05XMVVyOVR6b2w0?=
 =?utf-8?B?NXVuYmZyT1dxOTlQM0dMTnJxQ1Y1cEhUaHJSVElXYzd5VkVGbGxtOVlPNEZY?=
 =?utf-8?B?NTJNeUxaajN3aE4xQk10R1ZxVUJtejlLNGs1Uyt4Zkp1VEJwYlBJV1RrNVh3?=
 =?utf-8?B?T1d6TVQ1OUxaSTJxZkpqaWVxSndKdEZNYWMzbGRWNFlPRVlJc2VKRUVITDBW?=
 =?utf-8?B?ME5keGZUT0g4Sjl1Szltd2ZzTnk2TXBnbnJEZVpHOFhxT0ZDVE5wQmlFakh0?=
 =?utf-8?B?aFIrVUZuNnEzN2xBQ0V0TE1sdEhtZWNYVHFjRW9YWEhWQXJKazIvb1k2ZTUv?=
 =?utf-8?B?enpQSmFPdTBrOW01S1ljZkpwMC9PczJKeFZLZmtVMUZTY0NnUXlOWmdkYmgw?=
 =?utf-8?B?VEZxT29jeFo4UFN4ZFp0N05zdWY3WjRHVE9UaHIxeXFaYUEwcnlXYmFJaUNN?=
 =?utf-8?B?aWNTdzQ5cjVCUWpKY2JhRTBBcjNwWStTOGJySjA1aXlpQkxiT0ZDb21kTDBJ?=
 =?utf-8?B?VUNTb0x6Q1pBTklxL2l6aHFqYWFtQTZER21melRiWXBva3M1OGphMXF5K1lT?=
 =?utf-8?B?WE55cWIrYkQ5U0FFYnlSeVQrZjdPOFFOSTR0RUYzb2lQcXRpdmdSTCtEUDhC?=
 =?utf-8?B?YkpiQ2o5TkNnZ0dxNjFidlMzQkUzRUVXK0F4NzZsWHFBaDE3blMyQlBwenQw?=
 =?utf-8?B?UzI2QTdSTGN0bUhodUhsTjhWdm40N1RNdzFqNkdTVnZSQzgwekJUUkR4TURn?=
 =?utf-8?B?bGxmT2t0L0V1TmpMWEY4d0l4WTZ6eGFOYS91Z1dlZ3EvOFRJTjRiZldWdE5v?=
 =?utf-8?B?UUY2TnBWd3AyWjdjM21MaFBpTVFLcXNzaFNTcW1BamZNL1NsMjVrMzF4Q0hX?=
 =?utf-8?B?TE9ZQWgrSWNSUGpWQ3MwTUh4eUQ3R3p6RUdEbFJMRnZuU2hlZ2VWc25iTEg0?=
 =?utf-8?B?SnZweGtEQUdCVTRRQnd6OEc0NDBHaDdPSElWZlVURjJyK1VkaEtjaHI1SmJx?=
 =?utf-8?B?d2VVYUtWN0phV3JSMWpLTGZiSEprQ2l0cGUzNW5FVWtWT1RyVTFNV1FjZnlP?=
 =?utf-8?B?RDk2MS9YUGFwRGxDOTlHN2ZtVEtXYjdZMmh3QlduU2VFY0I1VjVqRmhvaXp1?=
 =?utf-8?B?WjZxT0ZlSFBGWFVGSXRZQnJ6VWRjZGpnZ2pqcnM1b2lLTXB6SkdtMHpCUitT?=
 =?utf-8?Q?C7+ROyXdCr0wCjvK3BUgtqygJLCWxUyNOzJ5A=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(7416011)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eWRGWXdtNU1lRGRZcW9DUjhqYkhQcDhoZml5OFJGTDNnRFl3clVJWHFNT09J?=
 =?utf-8?B?TUtZMHBuMjA0TXduaWYvNWZMY0RpQlB4US9yM3JlUzZnME9LNFFWeldOYVZO?=
 =?utf-8?B?enIvckZxT01pN0wrVVZZMzY4VWUzV2ZDUE9mVlovR0ZEZ2ZiY3hYL1l3STNU?=
 =?utf-8?B?QWQvWTlMTDNMaWVzRWdEUm9BcHdNOFdQbVRLbkpCcnF3dG1iWXdROXNBYm1h?=
 =?utf-8?B?TUJWZ0R0ZVZTNzhFb254eGRTNVZCNTZnU3RlVkprdG8vUzhQVXVBYmZXayt0?=
 =?utf-8?B?ZlNjRTk1cUFFYStCOWxTL3FLVVZ3c0o2a3g0STB6L3FQbS9nU1BzOExvajcv?=
 =?utf-8?B?akJ2S1hNUFFZS3laUEwzT0ZSSVZPNHNjSGJpTG9Kcy9MSXNBZi83ZW8vVE03?=
 =?utf-8?B?ZkxicGt0bmVsbVdZNExjV0pRQmkwQk1uOGtFalNQR1NSbGt1eVdpOURIQy84?=
 =?utf-8?B?OXg3STE1cnh4ZS9SZFB1MXZZQjcwUnlFVHZqaEFXcnNNYy9Qd0ttWXc5MEVX?=
 =?utf-8?B?eWpENTBUL09mQkdtZkZjRS9vd2o5cDBiUGhtYjlSWENrbG9jc0FVNW1sMlZi?=
 =?utf-8?B?VVNqREZuTmJRQjBYMExNTm51TVo2dmx6d0dWaE1aVm90bzBJOEttdTc0eWlY?=
 =?utf-8?B?VDN0NFZZTVgzakxkL3V2WVMrSE9xTlhWL0pHUnVuTTVwWFdMdlB4b3R0RlFs?=
 =?utf-8?B?WE0vMlZ2aTBzYzdVV0VwcTVxQ1NSeEFpbGw3OVJNbmxCQXlkS0I5N2dyK1c3?=
 =?utf-8?B?QjAzT05LcmZtcm1KV2U2Tm5odGsvdVlJc1hKZ0tuRjQreXZrWWxYTmNsaHdP?=
 =?utf-8?B?VFBCNUVQNjkyb1l3UG51Y2N4bkw0NWNSbnZ0Ryt0UzJOVk9lZTlNclFFMFBZ?=
 =?utf-8?B?SFk3dklWeDJTT3hOZ1owdzRrUXdDL2p1M3RreldEamZtOUlXMEpnQXRNcGZM?=
 =?utf-8?B?bDNyUW5HclEyamxlTjQweGhNRjdFcEx3SmE3QUovRHNES0dVcFMrOExwWUs1?=
 =?utf-8?B?ZE5PZGN2azZkSml6T2M1amJTSW1EeUFDaFB3dGkranA3cU94M3FTcFdEb3du?=
 =?utf-8?B?Q1p5K3dHRkdhS0ZTbktUTGdaWVgvN2g4TUFWMmpDaUV4QS8rc2I0anFmS3NZ?=
 =?utf-8?B?NlhNdnJ6RlI5bVlhM0xleHYyMkxVVnRIenM3eC9UM09KWGRzL2NWdC9INE9r?=
 =?utf-8?B?OEhOOEpOZGUrT3ZuazNxWlBZbjZGa3dzYnhOemsvNXNBUE90NUJYV2lNYUFa?=
 =?utf-8?B?RnZTT2llQzZwWG9ReHBmTXFMRXNXclRlRjJVTmZOKzM4OFF5cU5XV256aFRJ?=
 =?utf-8?B?YlJEN0JjRnV3SzBjTG43RGJqSGNNM3dNaE52Nm5GSEczT3BnSzVmKzh4RmRz?=
 =?utf-8?B?WXVET3kzdGVHcjUzZmhFd1VEMStLRnIwbUdOWWtVajJkVDdldGhJdFRLajdy?=
 =?utf-8?B?aDEwbTE2M0RPU3NmQ3lXVXExSktlR2xXcG9ia2V2YUJkbEtibkhhc2hYSGN6?=
 =?utf-8?B?aXp6b1pkZDBCSHJVZEdhL2F1TjJocFR5c1Y2UEF4RVBKSFhXeVdRNnZlS1k4?=
 =?utf-8?B?SXZDQXRiUXh3RENWNnNJUHVlMVZPYU9rMk0rcUNjQVY1RkpTbDR3R2FTV2Vv?=
 =?utf-8?B?T2JnWnVteGVUQmxjRU5EVnJnWTF1R2k2VGxzUW1zR012WDhYMlIvM1VWZlBw?=
 =?utf-8?B?RXN3V0UrUHc4OVo0YXNUeURQdHRWVWFFc0lZdnZBb2dNc2hSYUlhaVFsbWpo?=
 =?utf-8?B?MUNhNnZNa0JjSkpuRXgyTkxQWHBPQlhTeGRFc2NUR3hOWWtRS1FzWjBPZ00r?=
 =?utf-8?B?VVNWOGZUV0N5UnJVaEZ2ZnFwMDJGeHpKa1J1K1lHNlFyd0FnQ3pTSG10bTgr?=
 =?utf-8?B?cFZsQTNBc0dvV2hwL3lwRzN3S2pObU5zYlc2UlBMYWRObGdrZk81ZzEwY2g5?=
 =?utf-8?B?MEpNdnFLaFQ5NUVKWXU5Nll4emE5Z1FRSmtleVlmQUJWZ200VHF4TUhBMU8v?=
 =?utf-8?B?NjRGQWgxL3g2WVNTb1puNnRjeUtnaHVyRkNSWGNkdmtLQW42MDhoWEJ5Y2pF?=
 =?utf-8?B?T0tLdFh6a2svL2dEYkNqaDh2eGJaZUlJUHZGVlBHUDFlNzZaaUFsaWk0UGpj?=
 =?utf-8?B?Und2bytRK1NzR0tWN0kzL09aM1F5K1ZXREI0YldaTE9vak5mNi9abWYySDRZ?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0D4B6BAF90B1146A9098261FA7DE215@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3e8e8a-326c-46c7-38a4-08dc93b75fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2024 19:04:57.6256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPgGwGnGJSo0Q+5aT2grVRO+UTYrfjTHEVPT3KdXms4ls+UV3SMufQ2ooYGl13F/sYmkvCfW1HDTGcBJ+V5Npx72/hN2Yr6wSspTFNJR88c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6551
X-Proofpoint-ORIG-GUID: cd6jrC4hEljp6RzVigNnAySnskxa4bpe
X-Proofpoint-GUID: cd6jrC4hEljp6RzVigNnAySnskxa4bpe
X-Proofpoint-Spam-Reason: safe

DQo+IE9uIEp1biAyMywgMjAyNCwgYXQgMzowMuKAr0FNLCBEbWl0cnkgVG9yb2tob3YgPGRtaXRy
eS50b3Jva2hvdkBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gU2F0LCBKdW4gMjIsIDIwMjQg
YXQgMDc6MjI6MjVQTSAtMDUwMCwgSmVmZiBMYUJ1bmR5IHdyb3RlOg0KPj4gSGkgSmFtZXMsDQo+
PiANCj4+IE9uIFRodSwgSnVuIDIwLCAyMDI0IGF0IDA0OjE3OjQ0UE0gKzAwMDAsIEphbWVzIE9n
bGV0cmVlIHdyb3RlOg0KPj4+IEludHJvZHVjZSBzdXBwb3J0IGZvciBDaXJydXMgTG9naWMgRGV2
aWNlIENTNDBMNTA6IGENCj4+PiBoYXB0aWMgZHJpdmVyIHdpdGggd2F2ZWZvcm0gbWVtb3J5LCBp
bnRlZ3JhdGVkIERTUCwNCj4+PiBhbmQgY2xvc2VkLWxvb3AgYWxnb3JpdGhtcy4NCj4+PiANCj4+
PiBUaGUgaW5wdXQgZHJpdmVyIHByb3ZpZGVzIHRoZSBpbnRlcmZhY2UgZm9yIGNvbnRyb2wgb2YN
Cj4+PiBoYXB0aWMgZWZmZWN0cyB0aHJvdWdoIHRoZSBkZXZpY2UuDQo+Pj4gDQo+Pj4gU2lnbmVk
LW9mZi1ieTogSmFtZXMgT2dsZXRyZWUgPGpvZ2xldHJlQG9wZW5zb3VyY2UuY2lycnVzLmNvbT4N
Cj4+IA0KPj4gUmV2aWV3ZWQtYnk6IEplZmYgTGFCdW5keSA8amVmZkBsYWJ1bmR5LmNvbT4NCj4g
DQo+IE9LLCBsZXQncyBtZXJnZSBpdC4NCj4gDQo+IEFja2VkLWJ5OiBEbWl0cnkgVG9yb2tob3Yg
PGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+DQo+IA0KPiBJTU8gaXQgc3RpbGwgbmVlZHMgaW1w
cm92ZW1lbnRzIHNvIHRoYXQgdGhlIHJlcGVhdGVkIGVmZmVjdCBjYW4gYmUNCj4gc3RvcHBlZC9l
cmFzZWQgd2l0aG91dCB3YWl0aW5nIGZvciBpdCB0byBmaW5pc2ggcGxheWluZywgYnV0IHRoYXQN
Cj4gY2FuIGJlIGltcHJvdmVkIGxhdGVyLg0KPiANCj4gSSBhc3N1bWUgaXQgaXMgZ29pbmcgdGhy
b3VnaCBNRkQgdHJlZT8NCj4gDQo+IFRoYW5rcy4NCj4gDQo+IC0tIA0KPiBEbWl0cnkNCg0KQ29y
cmVjdCwgaXQgaXMgZ29pbmcgdGhyb3VnaCB0aGUgTUZEIHRyZWUuDQoNCkJlc3QsDQpKYW1lcw==

