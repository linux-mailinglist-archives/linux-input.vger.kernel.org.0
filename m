Return-Path: <linux-input+bounces-7709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B89B1322
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2024 01:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C441F22602
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 23:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CC420C32D;
	Fri, 25 Oct 2024 23:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GZawQgve";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GuBeHrMn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wQiMUF99"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69C217F3D;
	Fri, 25 Oct 2024 23:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729898614; cv=fail; b=OK+5jPuoGuhyjjt4Cil/UuZ+006PPbxk5QSHaDa1FioXqCNJ8N7FLRyKW9KsJDwOwQuT/xoFTa+3IR4gazsUbe9EIMHDWaoPfeIN3Edm0OPFhXSAbgEl0igHGhf5YStLOlcI282mLmGE+6uT1nZNu2NgXMknwoeb0rqWlRYdIXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729898614; c=relaxed/simple;
	bh=ZQ94RNxZ61Y1Oky/vfkE0q+BcF8kPbPvLrd21qOpKMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ePW8mnNhAGnvq9fbHLEUxLqEdQaNmx2t6VJU6f4KPagTA1FOOaXlUYvi//I8X5rKuCjjvnHe0yabpdPmbS4r7uvGPXnItEPQHBQCwgUk6ja0dGiqsCtKiTTtQCVmyj7pLgt7amto9syRIa+bag9gCQvvWIkGNgcZLlhNeWju1cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GZawQgve; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GuBeHrMn; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wQiMUF99 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PIBgOg006540;
	Fri, 25 Oct 2024 16:23:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ZQ94RNxZ61Y1Oky/vfkE0q+BcF8kPbPvLrd21qOpKMk=; b=
	GZawQgven7wHfjdQpKhM04TuXobRCGq3N68ZC+jbVJRxt0uEz27b8P/aDCCZ4+rX
	XiVAQ0M3da16GD5EqIK06dxgO1B+NtUsxJo1kdZYAcRox9A1iLlFJmPNcv/hjvcx
	K67kw2nj/lhePEc0NBQUEmDgZpr9eOfHPMZTdsS/n3hmnn/8Mk23DwHW1WKJfnAB
	vmIxvvl/Mnqgz6PdxWWxrynGjdHduxj6UFQ6wMfvQHT9dNdVz8gu3yFguOSqBPEk
	it7zxaAuE/rg+AonLpuef8rwgB2tVzYPt53D3FwGKV9pmdVcmmmew9SV9BWGb5jR
	+zv3RYGpONzUkcA686d4gQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 42f7gd6g7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 16:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1729898587; bh=ZQ94RNxZ61Y1Oky/vfkE0q+BcF8kPbPvLrd21qOpKMk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GuBeHrMnmqT4OqxDGWx4UwYvO7DjUsUy1a9xPCTfJelXRaEprOBWTeNAoSYInMY3k
	 TG6YW6Js7MIpPDymI+zzH8pYY/qMLSQQGM9XBQuWsCd4tEkemuBhOZtKO6sEBETncN
	 XGNbWhPOSOnsOkoQyUi2lcJAjbc9mO3oGMcFheZwkng/scZS/BgvETZkqL3azZhaw7
	 IClkLJGm3kYkSWgbqhR+mved18Hic+3yKMEKaD9Cyuwp6LGcZUvyzrzcxA+ctOyQyh
	 BGypVcHV4F5RIVMVv3gWSt+pLhuJ3d3+2RncMp7N+MF9ne+ecb9N8Ajr6JVXVcK5zr
	 oIUjC4/PHUeoQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B25534011D;
	Fri, 25 Oct 2024 23:23:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F4174A00B0;
	Fri, 25 Oct 2024 23:23:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wQiMUF99;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E5F0640361;
	Fri, 25 Oct 2024 23:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa04YOz4x0MQKeX7R7Pzv8zez9Ncav0qt+OQwA7CJb8/AU1VgWkYDUmwhCNo0UiTRatNIW+qNj5A3AFZodAh+QOkUSgfFmeDYjlXuca9jtR2yyGzbRPpqyX8eviS1uMa7fRHpSdakoXF07FXNJbEDSHcEtdd4gzPdo0ASKjAitulo0UqwOjSNejFNLEBUvrD/O8AzsYmDDuRakL5ZbnmQaFmstwgMKQQ2lyHmzg70iFJy5JUt4nGjLBk8QIt/U0CPVWszxgXhJzaBw6Mw4o5QrE9JGXMcCsivZ2pKVAIHbZetsa3kuuFvmVFM2GimBsYqybLeBLz84nFcfHWW4umCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ94RNxZ61Y1Oky/vfkE0q+BcF8kPbPvLrd21qOpKMk=;
 b=CMX/0WcL6WNfA6w7m5CFmTxYwLP/si+Eyv4r22yiJGrqnHpriOdmNGwOqaJVMfczZVJoJPS8tPOu7QNxhIod1pymg0K1L5b7YzFAt9Cpewyw/2/0Fh6TGJ9+6zddVTCfLvXsKzjgykSn8RpXqKqtFEgHtxxrUTttL66UENkxUqzrpbeLOed3Kz1EB5UT1vOkfOZB92+JFMjb/tlsxer5eTIxRIGCNFbBWVCbSp9bepPb6uPTSZFYJfojQrvXZ1dGoWAKP9xsF3FjedWMamihl4R6SvUJUO1piRvNyl87ZBCz6pBNq+f6KtGAD3Q8EoqOLDXlKsYRudm9I39XVtfmNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ94RNxZ61Y1Oky/vfkE0q+BcF8kPbPvLrd21qOpKMk=;
 b=wQiMUF99PA2n6gvOkQnFlRDtzpcPMtgUj1A97dJpqSdMyNFe1M3SVBzA/gSCo2tIjuF4NeBBtynfpxiJER4aH1vp1f3wYUMUQ+k1s+LCd4n3X+Dglb3j0IOgup+JXW4PaaDyVvvZ/H/em2UL3wWi27wdPcdAhotqSCWBhB2IiAU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW6PR12MB8661.namprd12.prod.outlook.com (2603:10b6:303:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 23:22:54 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 23:22:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
CC: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgoswami@quicinc.com" <bgoswami@quicinc.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 04/33] xhci: sideband: add initial api to register a
 sideband entity
Thread-Topic: [PATCH v29 04/33] xhci: sideband: add initial api to register a
 sideband entity
Thread-Index: AQHbH0lrpTSeH/vJGU2NOadsl7aParKYKw0A
Date: Fri, 25 Oct 2024 23:22:54 +0000
Message-ID: <20241025232252.wsk4lviqzyzqjzuh@synopsys.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-5-quic_wcheng@quicinc.com>
In-Reply-To: <20241015212915.1206789-5-quic_wcheng@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW6PR12MB8661:EE_
x-ms-office365-filtering-correlation-id: fb4719d3-9aaa-483d-a0c1-08dcf54bf3ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dDlxR2tNWHkwK3RmdTBRV0FIUlFwSzN2VXdvSS9nd09wSklNNzVvWWRWM3Rl?=
 =?utf-8?B?MW1lOXNvQ3FQdTV2L0hFNkxWUWg5ZUd3TXlENWlQSmVsdW4yYUhFWlhYcWVF?=
 =?utf-8?B?ZTlDak5ZQ0h5TVNjYzNMRnNPMEZlRTltdXNKL1BUQThFeDRNSyt3Y2xrdjc1?=
 =?utf-8?B?cDVmN0tsZGxYMGNJU2prWGxUUzlVdi9uS0dkZGFQc0llYUtzS2dwODFqQkpT?=
 =?utf-8?B?TncvUTdIaHpYQmdXUEsrTS9wUTZvWnJuN3BPUVdDTTZpSmpNN1NrTkJhcHBZ?=
 =?utf-8?B?OVhiL1lFZTNiOE1GMVpVekRUVkxPMWpZbmxQRDdXSkF4UUVPMnowaFJ0djky?=
 =?utf-8?B?ZzU3UENRRUJTNzFmc2RFOUhNNWRzVzg0ZXhGcExDYW92Q1dKRGdneHlhRS9W?=
 =?utf-8?B?RUlIT3VIM25FMFkrTGpxZERTeFR2NjNkd2htd20wWWZnY0FBaTZSaUNpazNs?=
 =?utf-8?B?ak4rTldncDhXUEY5V1RhQjlQOXdScC8xV2ZMYi9iZzM5K29pcWdWdDQ0TktX?=
 =?utf-8?B?RXdxY1VReUd3L3d0RFBQWXJZMmpFR1FNZFViRjdhNFc3MEIwSk1LTFBJMTds?=
 =?utf-8?B?ZklhaXI4c0xFRWloaTZhcFU3Y0tVdzd5cEZqNU1SR2FEZHFHYjFObVZoWGRw?=
 =?utf-8?B?aHcyOUg4K0JLNnFBRnZMWWhqWTZxSU1NbmlMSUR4WWRPTEJzYjB6bW40Ti9h?=
 =?utf-8?B?YTZlWnZFeElzMWZCWjB3cDBOYWlBNG5OSlpueHA1Qnljc2F2MmFac1JMWUla?=
 =?utf-8?B?bVpvMHpORlllRksxTkxDenNKMlg4alFyaXVFUVRLak9ZTG1SNTFXTEVIMzVx?=
 =?utf-8?B?WFV6TzVaLysxNEZOdjcyY3ZMUi9INmtYTjRtNzVmb053UFdmend3WUdUd1B0?=
 =?utf-8?B?TmVnMXEzQTlnbjl2ckxuc0hna0U3MFdRTmY0eFFiNStJc0VrdnZlUnI1elM4?=
 =?utf-8?B?c3ZuMFAwYnFka3VqaVdjWXNOMkZFOHJEbUVuS1oxUHVhT3RLYlN0cjRHeEda?=
 =?utf-8?B?eHhWdEh6aWcxQWVXeW5aQjVuRWhHLzJJSFI3c2FaVEMzYmNhMVNTOG11elY4?=
 =?utf-8?B?QlU1VlF4ZC8rTENrampDY2ZTMjFQNFhKZUVpek5wVE9Ia0lIUDdRTS9TWXIw?=
 =?utf-8?B?Z0tpZHZQeDNQOUM1Y28yZHkxZzVxTHdoVkdDUDVaZkpoMk96cHR1ZmNlWjVR?=
 =?utf-8?B?U2xWdURaZHFtZEd6OUc5M2p4SWs3TnY3ZzRaRnIwcUs5R3MzSTJURzJrQmIv?=
 =?utf-8?B?UXRObFVOR3NVQS9lTEdVMjArQXBUZ2VVMC8wM3ZObXB6SExJbkkxOU90RWgv?=
 =?utf-8?B?WmtnL1VtbVJ6WHNXVUpIVWNZK0JyZTdZbzV4WklyWTZhTUIrUDdZU2VqRXd4?=
 =?utf-8?B?TFRWZzQ4aEd6cW56QzdNWU5qQUdiU2RHdThDV211MWJyNmp5MG5PYUYxbVdn?=
 =?utf-8?B?WkVydG92WTZFRDBIY2pjcTh5Nkk3OEU5UTRPdlJONTd5enFWSFJsUm12OXRm?=
 =?utf-8?B?V3dDeDA5WkpjUzgxU2ovZGJ5c2l3bTdSbHcvaDBoMjZLaXdhdE9lTjZNaWhq?=
 =?utf-8?B?SjFlRG5mYzVId1gzSnpmTHdXaWZsYzBYVGplM1dCRnJqMnhPR3VIYWNiUkNO?=
 =?utf-8?B?TkN1aG4zdHJSTEZ1bDlWSllxbXR3UUxjbk44djFReWJiUTljMS9FSml0dzlC?=
 =?utf-8?B?bUZhOGVINk1mdXNBVCt4TVZIVEsxZnVDTnR6UHM5bjdDdTFZYU4zWmdSK0tP?=
 =?utf-8?B?OTBPN0hvYXFQazI0cnVXWFRVRFpwcm1VVndINVdYR3lGVHl0K1ZQb0xFaWMv?=
 =?utf-8?Q?tWTnaWdnFAWKXaFvUTRrfkjXEwhNsySMSA8KY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0hDRy9YTXh4d2RSa2pQbTBBb1E3TVllNUU2d0crTWdKUDJWSGppOXJqQlRR?=
 =?utf-8?B?TDd6eDlHSjVQL2pqb2phQmk0cklqRGtLclJYTkdWS1BEVldIMU1sNS9Od3FU?=
 =?utf-8?B?SkQ5SWxNeVBCTGZQSWNWeFlsRlVCYVJpY0dXdWs2dUNGeTczd0FOa0dJVjhz?=
 =?utf-8?B?U1l5bWx1L09lQzNCd2JpMHk5dGt1MWNZcVFzM2NYWHZTcGtWc1NsaFZDSlFz?=
 =?utf-8?B?Ymw2R3B3K1pXcUdBSDlLOE0wREwxaVRSTUlqaythWVZZQ0dVdmJuVldhbCtj?=
 =?utf-8?B?TnBnQjBzdmhpSzlnc0xIT01MRkc4NitCUmM5N3hFeEtpRFd0RGhzTFhwaFNv?=
 =?utf-8?B?QzNZR0NSVEZ5N0hQbXoxRE1hWDd0NXAvai9ra1N5VlpiczlkSDNTSGkvNC9t?=
 =?utf-8?B?ZFBQR2YwaTVTclN6M2tQZmZuRUE5RDhsblZtOVp5YnBLaEhGWDFEbXpsQmo2?=
 =?utf-8?B?UlZOZjdzTzkrbjRGQjZWSlFzR2JzS2FUSjdMdmF1eisvbDBDN3FlSVJQTlpI?=
 =?utf-8?B?YmFaOVBkb2NGUGZnTTlFbk5zK011RmJDOHgzVXN1cUVDVUVIL2pKL01Bcmxz?=
 =?utf-8?B?UlhVL1NHUCs0MHdTaUZrY2hBWFhpM3FQZWwrZmkrZS9KR2lIRUE4MktaakhY?=
 =?utf-8?B?YlYwcmRaU0VjNjV4czNKaE8rN2R3NGp6WmFoYVduQmc1RDU0WnBybWhiYjFO?=
 =?utf-8?B?TTl5SkljOXlvbFhZaXpjOC9aWGtUVVN0V1I2U1lyNnBUQ2sydUtTcFNSUGRz?=
 =?utf-8?B?RVBuZzl2VW02MDNsRWxLekVSSWdJdHlOVUdOdDc5M3gyZlZRSWdRbGNXazVq?=
 =?utf-8?B?WUVoTXduMXJCZ2J5QXdHUWJ3WEpJMk1MNG00NXpySWZ4dERHODgrOFg2RVdj?=
 =?utf-8?B?allXdGF4YWVpcFd6cmZyTzRGL04vMWg5T1pNLy9XSXFUY1h4eHJtZlBrZHFs?=
 =?utf-8?B?cytxelZKODk4Nk1QbXZuRGloV2FMaG1TNEE1eWhXUXFwL0dtM3hKQmJNSHdH?=
 =?utf-8?B?RE1Gem82TGgwd0dWU0tYNGxERk96eHlGZlNGdkdpb1ZCdU5ZTG1NYWlBY2w1?=
 =?utf-8?B?OUpUMSsyci82RW5Sa095NjlGNXgrTXRsZEp1MWcwOExoVk9mR0plTVBRYVRS?=
 =?utf-8?B?V3A0ZnVWQkNuLzQzNkszdGhLRFQ0Y1kwM21WOG9tMldPT21wOWVDQSt0MFM3?=
 =?utf-8?B?UE43VjY0WEo3Ky9pMjQ0cFZKNmFaTmNDSXBNWnJSQ2ZWa3JubXEwWnpZNERQ?=
 =?utf-8?B?SmljWUZKaG1NRGZBak5pcnIzV3VMMUpUMFNlV2pKSDQ4Q3BaNEozNTdxOGN0?=
 =?utf-8?B?dFRScWR5aDkwZDZaclBEaHcyTkpNKzBrVVM2Uy9xZUVpUWl3NUgwbzk3SVlv?=
 =?utf-8?B?bkxxS1Z4OS9lczZyZG0yZVBQU1NVVjdnVlRLeDdxL0k4TTgrRTNXMUpvR0xk?=
 =?utf-8?B?NTYvZytpU1UzWXl4RVVRUUZmbkxZckxMQWFBOGJhNDB1amdObHBBeXlWeW1z?=
 =?utf-8?B?OWp4TG5EZ3AveTJ3b0U0YkZjMUdmL0Z0b3pFRkpRVEo5eE0zZ3crU1dkckFW?=
 =?utf-8?B?QXE1Zm5mdWtldFJMQ2VVbisrTnJ6OXo2KzN0ZVhlcUNtR0lEWUhkbzZzS0xr?=
 =?utf-8?B?MXhhYUxCazJtVjRLNGd4cXRPYnY4SmVEd1h6M2FxcFBCb213Q0NBNVdmenlJ?=
 =?utf-8?B?Tmx0TUlrRnhJd3NBN0R0SEpvMFJRVjFiVkdveXpvbUxDZXdtSjJ2VTBtaDdz?=
 =?utf-8?B?YklEK1VkeXpjTlB4cks1NVJzci9PS2p5TTRLUVlCSjc4OFNHQzRSY05iQzRq?=
 =?utf-8?B?aHlaVldNSDRFcTRMNEd4L3NreUxWZVZtdWRPOG9rSVRwVGx6SjdRa1VMaGpH?=
 =?utf-8?B?RlExUFprTUNlUkpOQmtseUMxMkxZenFpUW5WWmdrNVE4d1U2NHV0VjVNcTRt?=
 =?utf-8?B?WmxoQy9lU1RZU3pmenMyNnR5VG12TkxSbnB6M1ROUmZNTWhEa0l6MG4vRkZj?=
 =?utf-8?B?MGdGRUw3SWdzU1pCT0JxZ2lQcjB0c3BwdHpmeFVhdFlqTHNYbDY1OEMzTENL?=
 =?utf-8?B?NzgwZkF3TDZvU3J2K1BadWI3WGxIYWVCcFFtcWpJN3V1NzQ3UXBtZ1NEQVU1?=
 =?utf-8?Q?luxAven9REGYnZKd0AhGu3etg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <067575CA1055E44E9A82F91D59063C65@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0zxWphVP0/eJKON1M4Q50hRraoQ0plWXqNiZDFMu5A2bZ5ZXjks5ibePqaY+LdbfFmSIxru/4IM+zzbuc+WUBgxiQZn+9g1BCEBM8RinDhEaJAlC8HDPEQMDTkx3GiZ1M5xlV2NGZd9VoF+JShP2U16J5JWBgyOZCiz6MnPu4oRfIewySLMOgJHHV+m6VG8O5JspXcc2T1das1DKNix93B6gGbEzANQWcztrQB2uy4BsBxif01Mx1PnKNK9ucbomHhVHDfTK48pFvYL7ed1t4n2DqBDlNckt1SVy8+9/BHZXMjsxVR0qACakto9PCQmuVxiVizmm9gpuVJaICozjpE+mQoXspFF7xyrk/+twST0sNvTnUDSB2ZUKJgChaAkyj+YxsT9yFOQwHqdajDxL9XsL0lId1vQITYG7ggjCxhnbOCnZo7OHnROA3TDUK6MVgUty13m454HbA7Q1Lnq/0ytJqwsBbTPKM3Ee7gxMDjWm8mlnbr/GBm6Zu0q4ejKD6b6ypsuIF9To2ouCLfrj/+uTwdEbkWbRSIvrCtknTRvbUl3mZpbPrz3+SyQcJe8dpx55wo8DwokgrP0OqrQlT29/sLnBhcBCrbWN2+3X8i61nm2WL4+UlNkDEsxnlf2o7PDpHtBCOfShc8Ua7nJPwg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4719d3-9aaa-483d-a0c1-08dcf54bf3ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 23:22:54.2979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: So6GzWwiUSLL5g2QMf94AAvdKWpyFA+0u+FIBrrXd7iks3HmmKFWK64KsGfdSyYf9VqfDCwHhof94Vj4ZNyZFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8661
X-Proofpoint-GUID: OmLBWiJx0FZkGUfnpjls4sEUiS7EO_Lk
X-Authority-Analysis: v=2.4 cv=Q7SA4J2a c=1 sm=1 tr=0 ts=671c285b cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=q6aP7AxYoyHK9P-uW1QA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OmLBWiJx0FZkGUfnpjls4sEUiS7EO_Lk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=855 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250181

SGksDQoNCk9uIFR1ZSwgT2N0IDE1LCAyMDI0LCBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+IEZyb206
IE1hdGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AbGludXguaW50ZWwuY29tPg0KPiANCj4gSW50
cm9kdWNlIFhIQ0kgc2lkZWJhbmQsIHdoaWNoIG1hbmFnZXMgdGhlIFVTQiBlbmRwb2ludHMgYmVp
bmcgcmVxdWVzdGVkIGJ5DQo+IGEgY2xpZW50IGRyaXZlci4gIFRoaXMgaXMgdXNlZCBmb3Igd2hl
biBjbGllbnQgZHJpdmVycyBhcmUgYXR0ZW1wdGluZyB0bw0KPiBvZmZsb2FkIFVTQiBlbmRwb2lu
dHMgdG8gYW5vdGhlciBlbnRpdHkgZm9yIGhhbmRsaW5nIFVTQiB0cmFuc2ZlcnMuICBYSENJDQo+
IHNpZGViYW5kIHdpbGwgYWxsb3cgZm9yIGRyaXZlcnMgdG8gZmV0Y2ggdGhlIHJlcXVpcmVkIGlu
Zm9ybWF0aW9uIGFib3V0IHRoZQ0KPiB0cmFuc2ZlciByaW5nLCBzbyB0aGUgdXNlciBjYW4gc3Vi
bWl0IHRyYW5zZmVycyBpbmRlcGVuZGVudGx5LiAgRXhwb3NlIHRoZQ0KPiByZXF1aXJlZCBBUElz
IGZvciBkcml2ZXJzIHRvIHJlZ2lzdGVyIGFuZCByZXF1ZXN0IGZvciBhIFVTQiBlbmRwb2ludCBh
bmQgdG8NCj4gbWFuYWdlIFhIQ0kgc2Vjb25kYXJ5IGludGVycnVwdGVycy4NCj4gDQo+IE11bHRp
cGxlIHJpbmcgc2VnbWVudCBwYWdlIGxpbmtpbmcsIHByb3BlciBlbmRwb2ludCBjbGVhbiB1cCwg
YW5kIGFsbG93aW5nDQo+IG1vZHVsZSBjb21waWxhdGlvbiBhZGRlZCBieSBXZXNsZXkgQ2hlbmcg
dG8gY29tcGxldGUgb3JpZ2luYWwgY29uY2VwdCBjb2RlDQo+IGJ5IE1hdGhpYXMgTnltYW4uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBXZXNsZXkgQ2hlbmcgPHF1aWNfd2NoZW5nQHF1
aWNpbmMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBXZXNsZXkgQ2hlbmcgPHF1aWNfd2NoZW5nQHF1
aWNpbmMuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZyAgICAgICAgICB8
ICAgOSArDQo+ICBkcml2ZXJzL3VzYi9ob3N0L01ha2VmaWxlICAgICAgICAgfCAgIDIgKw0KPiAg
ZHJpdmVycy91c2IvaG9zdC94aGNpLXNpZGViYW5kLmMgIHwgNDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmggICAgICAgICAgIHwgICA0
ICsNCj4gIGluY2x1ZGUvbGludXgvdXNiL3hoY2ktc2lkZWJhbmQuaCB8ICA3MCArKysrKw0KPiAg
NSBmaWxlcyBjaGFuZ2VkLCA1MDkgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdXNiL2hvc3QveGhjaS1zaWRlYmFuZC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC91c2IveGhjaS1zaWRlYmFuZC5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvaG9zdC9LY29uZmlnIGIvZHJpdmVycy91c2IvaG9zdC9LY29uZmlnDQo+IGluZGV4
IDQ0NDhkMGFiMDZmMC4uOTY2NTllZmE0YmU1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9o
b3N0L0tjb25maWcNCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC9LY29uZmlnDQo+IEBAIC0xMDQs
NiArMTA0LDE1IEBAIGNvbmZpZyBVU0JfWEhDSV9SWlYyTQ0KPiAgCSAgU2F5ICdZJyB0byBlbmFi
bGUgdGhlIHN1cHBvcnQgZm9yIHRoZSB4SENJIGhvc3QgY29udHJvbGxlcg0KPiAgCSAgZm91bmQg
aW4gUmVuZXNhcyBSWi9WMk0gU29DLg0KPiAgDQo+ICtjb25maWcgVVNCX1hIQ0lfU0lERUJBTkQN
Cj4gKwl0cmlzdGF0ZSAieEhDSSBzdXBwb3J0IGZvciBzaWRlYmFuZCINCj4gKwloZWxwDQo+ICsJ
ICBTYXkgJ1knIHRvIGVuYWJsZSB0aGUgc3VwcG9ydCBmb3IgdGhlIHhIQ0kgc2lkZWJhbmQgY2Fw
YWJpbGl0eS4NCj4gKwkgIFByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIGEgc2lkZWJhbmQgZGF0YXBh
dGggZm9yIHBheWxvYWQgYXNzb2NpYXRlZA0KDQpQbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3Jv
bmcsIGJ1dCB0aGlzIGRvZXNuJ3QgbG9vayBsaWtlIHRoZSBhY3R1YWwNCnhIQ0kgQXVkaW8gU2lk
ZWJhbmQgY2FwYWJpbGl0eSBkZXNjcmliZWQgaW4gdGhlIHhIQ0kgc3BlYyBzZWN0aW9uIDcuOQ0K
YnV0IHJhdGhlciBhIHNwZWNpZmljIGltcGxlbWVudGF0aW9uIGZvciBRY29tIHJpZ2h0PyBGb3Ig
dGhlIHhIQ0kgQXVkaW8NClNpZGViYW5kIHhIQ0kgY2FwYWJpbGl0eSwgdGhlIGRyaXZlciBzaG91
bGQgZGV0ZWN0IHRoaXMgY2FwYWJpbGl0eQ0KdGhyb3VnaCB0aGUgeEhDSSBnZXQgZXh0ZW5kZWQg
Y2FwYWJpbGl0eS4gSWYgdGhpcyBpcyBub3QgeEhDSSBBdWRpbw0KU2lkZWJhbmQgY2FwYWJpbGl0
eSwgd2Ugc2hvdWxkIHByb3Blcmx5IGNsYXJpZnkgdGhpcyBpbiB0aGUNCmRvY3VtZW50YXRpb24g
YW5kIHRoZSBuYW1pbmcgb2YgdGhpbmdzIHRvIGF2b2lkIGFueSBjb25mdXNpb24uDQoNCkkgYmVs
aWV2ZSB5b3VyIGltcGxlbWVudGF0aW9uIHN0aWxsIG5lZWRzIHRvIHByb3ZpZGUgdGhlIGRhdGEg
dG8gdGhlDQpob3N0IGNvbnRyb2xsZXIgdGhyb3VnaCB0aGUgc3lzdGVtIG1lbW9yeSByaWdodD8g
VGhlIHhIQ0kgQXVkaW8gU2lkZWJhbmQNCmNhcGFiaWxpdHkgbWF5IHBhc3MgdGhlIGRhdGEgdG8g
dGhlIHhIQyBvdGhlciB0aGFuIHRoZSBtYWluIG1lbW9yeS4NCg0KQlIsDQpUaGluaA0KDQo+ICsJ
ICB3aXRoIGF1ZGlvIGNsYXNzIGVuZHBvaW50cy4gVGhpcyBhbGxvd3MgZm9yIGFuIGF1ZGlvIERT
UCB0byB1c2UNCj4gKwkgIHhIQ0kgVVNCIGVuZHBvaW50cyBkaXJlY3RseSwgYWxsb3dpbmcgQ1BV
IHRvIHNsZWVwIHdoaWxlIHBsYXlpbmcNCj4gKwkgIGF1ZGlvLg0KPiArDQo+ICBjb25maWcgVVNC
X1hIQ0lfVEVHUkENCj4gIAl0cmlzdGF0ZSAieEhDSSBzdXBwb3J0IGZvciBOVklESUEgVGVncmEg
U29DcyINCj4gIAlkZXBlbmRzIG9uIFBIWV9URUdSQV9YVVNC

