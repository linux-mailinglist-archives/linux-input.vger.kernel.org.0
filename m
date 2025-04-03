Return-Path: <linux-input+bounces-11490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0EA79E50
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 10:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AA43A966D
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 08:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717A72A8D0;
	Thu,  3 Apr 2025 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="dzQxjSMd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B61A01B0;
	Thu,  3 Apr 2025 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669451; cv=fail; b=XwTyDXO+lTrvesAFdlzGol19dr3RqtXtuI8Qvji2DGTC7cCET5nR+eOU2rP0ufhbO4a+hRzPiNt507jcFGJP8jCwET0PeCveTqINCpb7/V2qLjSKj3tw74628CAAvlUOWufGlSuY6flTkcvEOYzG/ALWFG5o658Rj10yNb4FElA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669451; c=relaxed/simple;
	bh=GmUHYujo69S3rk/f2fUAQhdfXZz7c7pZ1UmoDoVX0pA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CUk5rdYv+LJFD/5+dBS6RotWxGH667/mr51FpZXUXJtdvuO+N6PLFhnlUTLAf1vpjeYRyJ6iFUUiRTvVGq/+VnY/Y7cRFpRGGBCmBS93hJBxBLWUbEgDbgfBEiJF1mviDh+akDF3dGm3MQPuwKC/nRPrk+oywr5K1crsfJh/pXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=dzQxjSMd; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532NMtu1013115;
	Thu, 3 Apr 2025 03:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=Y
	BLQuKANKhnzLhetzzPXAzQ19wnwpoGipuLJXUqC3JM=; b=dzQxjSMdAiu5tuHy+
	Fnc7KgbNlJnLA2G4DSuArs5ra+3AJGrNIZHgdgp1XSMB28jT8I8HCQWNIcWeB5/P
	t4ttk2XWptsZU6joQxqj4hcK+bcY9yoDfLXnvZX41KxjOUuCAS1dLbkKppL3fY9i
	0Jq4kCJllFBcZCaAiEDX8PfU46YksIHyR6S4qVjCyd2scBCWPWrBogV6c3w2ecvl
	9d3bYyJk+1HceqL11sWAedgkE33EK7nkPFxPIbh/rml8G6eXpkCvGixtqXDsBssr
	Ts/UI0gZQgnlXJVje2eTdZRBXY8sMmthw75inSSzLDaMDPa/VNOE/ofvpNFJtAii
	WJ5mg==
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 45pc0xe2xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 03:27:34 -0400 (EDT)
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5334nEvQ036212;
	Thu, 3 Apr 2025 03:27:34 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 45sbmd69y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 03:27:33 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpj2Wp4s/e6vWnSZLfEOcVEA2Y/rWe65uAQv0MaZWwRDywbfrNKjCEqBMp1xpqIm2ewA9idY03dg2xbykfzgt8GK5J5OPsXGabagTymm+KkWHqceWoWLjGnGjiYi7e1xYBM0EVLN/5bdeZOAwVdqtAjM83HBIrn3hS311S9VsqQOJJFldQFp663F1+eTTuypo88XMwU8BHOytgCezn3Jqb4GcWRY2srZZSZNtVZU1npRgwsGYk4jUi26VN67gb8jluSiNEvLeXTwEG6QF0vP7w+n95rmiDEFhFdAV773FjTjg8nWalus79hLzI+B9IP/PAPZ0UrnzH2WNwsFBc/cpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBLQuKANKhnzLhetzzPXAzQ19wnwpoGipuLJXUqC3JM=;
 b=EmUYmtSfm+rtaGXHzRk+kPc+VA5Dyl33eeX8ZsZMZEahJk90RwXgPafYnYlKDvo1VYG0RCYTx25XWTWdij2KdXrsGIQeuvsD/o3kX9LbSoEM+Y8jV23cDSRIGL566IgIk9q4EfKIDDs356jjH8xXQyz4lXNj/CAEIoqKVevPID8VBdrLKd+cN5U8cp6Lev1mJs3sE2B+wuNOADdfwqXBIVLwqO6mYyHVTr+N88P+e0bYwxOiZyyRaKsOQiFegWSwwpvF9sXbvSGMq6LviKLdVsMIbsOrBgPNhkBmJI35LrEULLdZB9SBxbIy9Y40L6IXx9cNyhLKpSqFpZ/Y5DHV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23)
 by CH2PR19MB3767.namprd19.prod.outlook.com (2603:10b6:610:91::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 07:27:31 +0000
Received: from BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::afc3:5bb2:37fb:2f9d]) by BY5PR19MB3922.namprd19.prod.outlook.com
 ([fe80::afc3:5bb2:37fb:2f9d%7]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 07:27:30 +0000
From: "Shen, Yijun" <Yijun.Shen@dell.com>
To: Mario Limonciello <superm1@kernel.org>,
        "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>,
        "basavaraj.natikar@amd.com"
	<basavaraj.natikar@amd.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "bentiss@kernel.org" <bentiss@kernel.org>,
        "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>,
        "Shyam-sundar.S-k@amd.com"
	<Shyam-sundar.S-k@amd.com>,
        "akshata.mukundshetty@amd.com"
	<akshata.mukundshetty@amd.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Thread-Topic: [PATCH] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Thread-Index: AQHbpEZUOzpYa2R6pEK/Od/yHSA4krORiw3A
Date: Thu, 3 Apr 2025 07:27:30 +0000
Message-ID:
 <BY5PR19MB392297B565D4B0A393C844C59AAE2@BY5PR19MB3922.namprd19.prod.outlook.com>
References: <20250403031242.1267561-1-superm1@kernel.org>
In-Reply-To: <20250403031242.1267561-1-superm1@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=217512fa-397b-4e6b-82b1-a8958860fc56;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=0;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2025-04-03T07:27:05Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR19MB3922:EE_|CH2PR19MB3767:EE_
x-ms-office365-filtering-correlation-id: 256f0220-b0e1-4980-f8fa-08dd7280fe98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?V2VZV25uVkpVRmZtWTM4NXFPZ0pQdCstS3FZTWJEZndtaUI0cnB3aHEvMElh?=
 =?utf-7?B?c1N4ZFdRb2FTdTN0UFY4M0RxMGV0emJRZWhiRldEQlUwamlrUk1jbUFSdUdG?=
 =?utf-7?B?SEttNTJFUUhSeTNvbFc5WktMVk5FcThoWm80UWMyQ05lZ1VSNVFHZjJsaEJw?=
 =?utf-7?B?ckZ2aEZpVTB0YThzTmtQbHlLVElSNTVFSXNySDlhVHhkVTU5MmlaN1VJZ2hQ?=
 =?utf-7?B?YTdhQmlCSGhQellNUWJpRzRWYzFmakZUTDBpaSstanhMN0doVjhaRjlIbDdN?=
 =?utf-7?B?bmZibGFrR1NSOWpHTmdYVlRRYzA4WHZlMVBLcystSDNRMkhaNUtDRU1ydENX?=
 =?utf-7?B?MzdFQW5oeE4yY3hpN1A3OThucU5qaDd2SzdjbWlPUmMvU1g2QktMYXBWa1Mv?=
 =?utf-7?B?VmtUQm9vTlk4UHFMdThyVFc4OHZoWDJwV2JpRXRRTXdyUDJwNW02R1JMOEJH?=
 =?utf-7?B?OXU0SlBFOFhVTW1URWxxUEdGaWd3emF5Ky1KSHBhajB5aTFDMWFRZzR6Qist?=
 =?utf-7?B?UE0wWURiaVVDQ0t5cWVlOFg5UjJ1a0tjN2QzM1ZsY2pZYXMvU2lLUFZQbk5s?=
 =?utf-7?B?S0ZqSGZLRFdMMHlsWXFPazlzTENzRkR2aUI1ZVdWUE8yREprRmZRKy1QRUFa?=
 =?utf-7?B?c0pPQjAvU0JNMzRsTENsUkZCYkhxc0U1Q2RLMWJnb0UrLXJIUnBhUkxHMzdv?=
 =?utf-7?B?QUZwUDhXQTV6ZistNjY3emQrLVZURUs2QUdWKy1tdTE1ejVIU2grLWxITXpC?=
 =?utf-7?B?dk5qekNKd2ZhUC9nV1BEM1YwT3hXbFJJRmY2U3JRTmZaYm1nbVJmTVp4aWd5?=
 =?utf-7?B?YXgrLVZVcDlmRzhUY01wVUJWTHFEcUdLL0Q1U0hpai9hNEl4V2tXOEdnbyst?=
 =?utf-7?B?NzhhZHZqU1FOTTZQWFk1RW04VXhua095YWF3WkxQKy16MGdkQm9xSkJuMDZ6?=
 =?utf-7?B?bERydm9QcElydjNCYkpqSjJuOVVINFB3UTl6YlFVKy02dnlKZ011WTFzempk?=
 =?utf-7?B?NTlUUm1MVk82TVdiY1poZ2NocDVYMW1DbDNQSElNUURJTHZjZ0NQNUQ0R09m?=
 =?utf-7?B?N25DKy13bUpZeU43Yk5jSEluTE9WSlFHUVU3b1RJY1Ivd2krLU1CeHl6Ky1H?=
 =?utf-7?B?WE9lMjBIelJaMSstRFpFMndaeWVpME51RTJGZ25mb2VkVWtweW1XeFlGQVNj?=
 =?utf-7?B?ZGxrZDh3ZUsyMm53WGJQMDNTMHhxWTBLQ3NZMUF2RWJIM05sUFBiY1JLSTBE?=
 =?utf-7?B?NHQ1Q2xUUVh4UjZLT0paNUxhOGZOeHhaa25iWGZ3NnZzNmYwd0c4TExrS2VX?=
 =?utf-7?B?RmpPNUdFaEZGTjBZVy91Q3BCaDc4SHhnT0VoQTRCM29Tb25hQVVhYXIzN2Jl?=
 =?utf-7?B?OVRKYkczKy1BbjFXalRhWDRnNHEzNEdXM3ZFOGdGYjFXNnQrLXQ1TE1pWTJj?=
 =?utf-7?B?TnZ0Zm12bDVjR2dkeGdrS3BhSlBrUjlnMlFIQlVkSHlxKy01cktadE5kblRk?=
 =?utf-7?B?MmJ1Y3dCNGtNWXhsRTNSd3cvOVFYazN1QzNCKy1LTWNLd2lQeUZQRkR5UHli?=
 =?utf-7?B?M015U0pmVHd0blZWelVYVjkzdjlSTTYvRVRuVGJWeE02WDM2NGNuNlFuNjJE?=
 =?utf-7?B?WkZLQVpzWVJCN2RSclZoeGFIU1FDN0wzTW9uZ082NXE4TVRMY2NxWnRwVk9U?=
 =?utf-7?B?cXREaXc0N2dZRlJpZldCMFBubkJ6WUZJaTBoRm45Qmt5dHJzODhoVG5Maist?=
 =?utf-7?B?cUFPQkYxd0tUZ3gxMWttVlA0M0UrLXpqb0tEaFFQZ09EQ0o1RThjdjhZMGYz?=
 =?utf-7?B?aVovWG4rLUd3SVJuc3Vrc3FSRlRIQUNnV1c2d05TT1dMZXJjVDcxZDEvd2tk?=
 =?utf-7?B?cEw0Y1YrLUhMZzhYUFg4cXVpUHVkczRYNmRDTGVIVDhPTU5EZkZQd2g2Ky1p?=
 =?utf-7?B?RzhIS2srLTBCdUN6MHJTbVY4OXZLUXZUTmxaWlFUMFh4aC9HV0YvNnA0aG81?=
 =?utf-7?B?TGRRQWtUR2kycGVqMXFVdQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3922.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?VjlTSlpGdGVNSDVUYzNjb3Z2UUFBanBIcUpsR1JvenNMZ2l6MG0xV1ppdmZU?=
 =?utf-7?B?YldudUNFZlR2WFA1dmJ0UC8xVmVnYnExWmhwTDNZSGd6dystRm94Vng2TzU5?=
 =?utf-7?B?bnIrLXZiRnJUWG9Qd29jTlFsNEpraGc1Sk93Wi9XaVJyVGhXa1BkeHlyNE5s?=
 =?utf-7?B?SDdDaWtyT2w1QUlpVmJMdUNNSmM2Mm9iRmZ2aHFtSzZHR1VacXc5WWVIc0g=?=
 =?utf-7?B?Ky1RZWpTZXJXWmluMFhib05MOFZxTWV2VW1wMk1VYXl6Lzd2bmw4T2JvQ3Vn?=
 =?utf-7?B?Qldab2h3QW40Z1NDRTd3OWIzQ05RYS8yYzZZOUdpbmdpNjNCT09RZ2lDQjMz?=
 =?utf-7?B?Z3pvUzZiVmVZKy1Jc0ZJRnh5MDYrLUUvVEdscVVlKy16YUdVMmhXbjlndVU3?=
 =?utf-7?B?VlhjT2NUTFV2Q3Z4OUhLSkpFN2lsZWVXSVBYcUlQS1FlOUp2OUpONTZmekts?=
 =?utf-7?B?dVN4VFNWUDRBRmljcGhDMkl2MFRaOWQ0Ky1mRDU3bWFtUjlCOHNsOHVOR3BO?=
 =?utf-7?B?R1NqNEdyQistYmJZdkl2NEFIUDRORVhCWDdxR3NMVXJyaWtJS3lhb01zSHVk?=
 =?utf-7?B?TG9GekRLWDY3TTk2QXN6cSsteDFnVDVIdW8xZk5UZFJiNWZJMHk1WSstRjRS?=
 =?utf-7?B?YVgxa0dkMW5lOFRTSElEWE1MMzYrLUZXYWgyMGlUYmpMVjkxV2xpVDVXVHND?=
 =?utf-7?B?bEJBOEwzL1dnZEw1MXowNWpJSHFISlBwbmJNNFh1bDZ5V2FYTVVSWDZHZ3g=?=
 =?utf-7?B?Ky0vbSstSXJMSUNuRWs4bC9VMlZnemR1bTBoU1d5ZlN6UXI3b1BoRFY2WWFR?=
 =?utf-7?B?Y29VUnRwNWhBbnBqZXdad1Qva0hiSndTaGt4RmpVbE9NUUErLVRaVGtlaDd4?=
 =?utf-7?B?bVdjdystUDBMWXczZistVVFSbDRET2pzdDFyN0h0YmM1RTZvYVJFMHpNcFlN?=
 =?utf-7?B?dnFnbWZZVDFqTm1SNkxGb3dicGMveDAvcjk2dkpjS282Q0VSd3dOWEpsYkw5?=
 =?utf-7?B?S0lrQTNkSUxGSEFQbGFUR05EbHdhb0JndjNvTDVxeHl4RjBJamNidmRHZzdH?=
 =?utf-7?B?bVJmc1lScnhlRlhwTGxSTlRLcVRQUHgzTHhjSFZKMkZZNkxITDc4cUFBSlNE?=
 =?utf-7?B?L0VjNWZtUWFTSS9zOUg5Ky15TS9uYktrWmdoN3ZmZ3M2RnRDcGN2cDg1a1F0?=
 =?utf-7?B?VmdZZjhnZ3VGaUkwM3BlQXpUOVkzSE9CMUJBWDdURXoyYW8vU1VrMHFhWnBl?=
 =?utf-7?B?T24yKy1QWFpsYzlXWDh1dzc4STF3akNHc2tWS2o5YU1ndDRrZGc4WldqQnVD?=
 =?utf-7?B?YUdGWGdyTlpEenVRZlllWTFiVjBqNmkzQkpSZGZpUi9LRkJqWmhUazV0WXJr?=
 =?utf-7?B?SmxRTHpaQWt3NnR2bXdiVjl6RFBwelRVSG5jS2MxZXdwTTJwNzRVLzJPQzFR?=
 =?utf-7?B?NlRyQXhRUUpiRWE4cCstUDArLUlXNThXbG5HZ3cvbzUzNnhQU0RMWGwzRzZ0?=
 =?utf-7?B?VjA5OUlDeGZVczc1dGduQ1NVV1NVbmIzZVFyNElWNjdLdUgySWpqQlZ4Tldx?=
 =?utf-7?B?aDlRTmNkQ1dlUkFjRTRGVXBMTzBmTmJPVDhYanRicFBZMVRCYUxTR3hkWXlG?=
 =?utf-7?B?Q1F2NUZDdThEeE9IMnEwY1R4MGZ5amRQQXQzWjRDSGJlbWY3RGphZ2xjR0xl?=
 =?utf-7?B?c2RhREE1WERTdVZrcVdSbUVLNU1Lbm1VUnM2UDdiU0xxRjZTS3lsNVhqbTZW?=
 =?utf-7?B?bTltdzFWa2U0b0pFd0xxdnRjaGFSQ2ZSQTNla3ZNSkNLVUgzbkYyRUNCcEs1?=
 =?utf-7?B?dE5OeU5OdElmNjVNQ2xMellNc211aDFpM2FNUXNXMCstWXYvSGJMZXFlOHd5?=
 =?utf-7?B?d1dleTZQOE9zdUwrLWNnRmFaTTF6VjZjb0tIKy05MS83S0UxUFZ3M0dNeDNO?=
 =?utf-7?B?NFBibDB5L080emtoRDE0MDJOR2VmclNicmhZTHRabzFVWEFLNDZlengxVmpo?=
 =?utf-7?B?dHB4Z2pnL1kvOWpYVklDSFkvV25FRTJQNmJCL3ZsVFl4Ky1ieEJid1VJMXkx?=
 =?utf-7?B?SW5Zd1pMQWFUUVdvZi9QY21KOTd1VC94TWVPb0xudHY4OTU2Q2xxN1ByOUdh?=
 =?utf-7?B?RE5mVUZYV1g4N2xOdnVmbHNzbUVDOE03L1dVajdwUVBUVVhDOFoya2RvRzdE?=
 =?utf-7?B?TWdyWlI4?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR19MB3922.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256f0220-b0e1-4980-f8fa-08dd7280fe98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 07:27:30.8822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVY7aZ4dEfZMj+yU4dIqaViftKGcN9ISLql72K4AGVf4Of27tcEOjAm0DVNa+b2l0sIZ+dX/d5nM14f5mTuMuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3767
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_02,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 bulkscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033
X-Proofpoint-ORIG-GUID: S0kspifyF2bH2-pKu6xIrdYr8UtjsW5p
X-Proofpoint-GUID: S0kspifyF2bH2-pKu6xIrdYr8UtjsW5p
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504030033


Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Mario Limonciello +ADw-superm1+AEA-kernel.org+AD4-
+AD4- Sent: Thursday, April 3, 2025 11:12 AM
+AD4- To: mario.limonciello+AEA-amd.com+ADs- basavaraj.natikar+AEA-amd.com+=
ADs-
+AD4- jikos+AEA-kernel.org+ADs- bentiss+AEA-kernel.org+ADs- ilpo.jarvinen+A=
EA-linux.intel.com+ADs- Shyam-
+AD4- sundar.S-k+AEA-amd.com+ADs- akshata.mukundshetty+AEA-amd.com
+AD4- Cc: Shen, Yijun +ADw-Yijun+AF8-Shen+AEA-Dell.com+AD4AOw- stable+AEA-v=
ger.kernel.org+ADs- linux-
+AD4- input+AEA-vger.kernel.org
+AD4- Subject: +AFs-PATCH+AF0- HID: amd+AF8-sfh: Fix SRA sensor when it's t=
he only sensor
+AD4-
+AD4-
+AD4- +AFs-EXTERNAL EMAIL+AF0-
+AD4-
+AD4- From: Mario Limonciello +ADw-mario.limonciello+AEA-amd.com+AD4-
+AD4-
+AD4- On systems that only have an SRA sensor connected to SFH the sensor
+AD4- doesn't get enabled due to a bad optimization condition of breaking t=
he
+AD4- sensor walk loop.
+AD4-
+AD4- This optimization is unnecessary in the first place because if there =
is only one
+AD4- device then the loop only runs once. Drop the condition and explicitl=
y mark
+AD4- sensor as enabled.
+AD4-
+AD4- Reported-by: Yijun Shen +ADw-Yijun.Shen+AEA-dell.com+AD4-
+AD4- Fixes: d1c444b47100d (+ACI-HID: amd+AF8-sfh: Add support to export de=
vice
+AD4- operating states+ACI-)
+AD4- Cc: stable+AEA-vger.kernel.org
+AD4- Signed-off-by: Mario Limonciello +ADw-mario.limonciello+AEA-amd.com+A=
D4-

Verified the patch on the issued system, the issue is gone.

Tested-By: Yijun Shen +ADw-Yijun+AF8-Shen+AEA-Dell.com+AD4-

+AD4- ---
+AD4-  drivers/hid/amd-sfh-hid/sfh1+AF8-1/amd+AF8-sfh+AF8-init.c +AHw- 7 +-=
+-+-----
+AD4-  1 file changed, 3 insertions(+-), 4 deletions(-)
+AD4-
+AD4- diff --git a/drivers/hid/amd-sfh-hid/sfh1+AF8-1/amd+AF8-sfh+AF8-init.=
c b/drivers/hid/amd-
+AD4- sfh-hid/sfh1+AF8-1/amd+AF8-sfh+AF8-init.c
+AD4- index 25f0ebfcbd5f5..c1bdf1e0d44af 100644
+AD4- --- a/drivers/hid/amd-sfh-hid/sfh1+AF8-1/amd+AF8-sfh+AF8-init.c
+AD4- +-+-+- b/drivers/hid/amd-sfh-hid/sfh1+AF8-1/amd+AF8-sfh+AF8-init.c
+AD4- +AEAAQA- -134,9 +-134,6 +AEAAQA- static int amd+AF8-sfh1+AF8-1+AF8-hi=
d+AF8-client+AF8-init(struct
+AD4- amd+AF8-mp2+AF8-dev +ACo-privdata)
+AD4-       for (i +AD0- 0+ADs- i +ADw- cl+AF8-data-+AD4-num+AF8-hid+AF8-de=
vices+ADs- i+-+-) +AHs-
+AD4-               cl+AF8-data-+AD4-sensor+AF8-sts+AFs-i+AF0- +AD0- SENSOR=
+AF8-DISABLED+ADs-
+AD4-
+AD4- -             if (cl+AF8-data-+AD4-num+AF8-hid+AF8-devices +AD0APQ- 1=
 +ACYAJg- cl+AF8-data-+AD4-sensor+AF8-idx+AFs-0+AF0-
+AD4- +AD0APQ- SRA+AF8-IDX)
+AD4- -                     break+ADs-
+AD4- -
+AD4-               if (cl+AF8-data-+AD4-sensor+AF8-idx+AFs-i+AF0- +AD0APQ-=
 SRA+AF8-IDX) +AHs-
+AD4-                       info.sensor+AF8-idx +AD0- cl+AF8-data-+AD4-sens=
or+AF8-idx+AFs-i+AF0AOw-
+AD4-                       writel(0, privdata-+AD4-mmio +-
+AD4- amd+AF8-get+AF8-p2c+AF8-val(privdata, 0))+ADs- +AEAAQA- -145,8 +-142,=
10 +AEAAQA- static int
+AD4- amd+AF8-sfh1+AF8-1+AF8-hid+AF8-client+AF8-init(struct amd+AF8-mp2+AF8=
-dev +ACo-privdata)
+AD4-                               (privdata, cl+AF8-data-+AD4-sensor+AF8-=
idx+AFs-i+AF0-,
+AD4- ENABLE+AF8-SENSOR)+ADs-
+AD4-
+AD4-                       cl+AF8-data-+AD4-sensor+AF8-sts+AFs-i+AF0- +AD0=
- (status +AD0APQ- 0) ?
+AD4- SENSOR+AF8-ENABLED : SENSOR+AF8-DISABLED+ADs-
+AD4- -                     if (cl+AF8-data-+AD4-sensor+AF8-sts+AFs-i+AF0- =
+AD0APQ- SENSOR+AF8-ENABLED)
+AD4- +-                     if (cl+AF8-data-+AD4-sensor+AF8-sts+AFs-i+AF0-=
 +AD0APQ- SENSOR+AF8-ENABLED) +AHs-
+AD4- +-                             cl+AF8-data-+AD4-is+AF8-any+AF8-sensor=
+AF8-enabled +AD0- true+ADs-
+AD4-                               privdata-+AD4-dev+AF8-en.is+AF8-sra+AF8=
-present +AD0- true+ADs-
+AD4- +-                     +AH0-
+AD4-                       continue+ADs-
+AD4-               +AH0-
+AD4-
+AD4- --
+AD4- 2.43.0


