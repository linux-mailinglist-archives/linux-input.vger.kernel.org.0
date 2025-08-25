Return-Path: <linux-input+bounces-14299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338FB342D7
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 16:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599DC1883F8D
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 14:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A3C2E7BDC;
	Mon, 25 Aug 2025 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5uLXj2W7"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121D2727FC
	for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131032; cv=fail; b=sPR1aXFmviujcarpczRXX0hfwmNLeuiqJrk6W0VCUy5yZbcPL3a6RQAlsnXxzkiW6nZFjPFMKxBGTMKZSWwkT7rkkCxSUvZmgCm2pf8DzCExNws0fyyyL4wlK5Px0OzK76dcameoXxSxylLFHvvheMnSJfFzmCUMYSVMZ2CgXmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131032; c=relaxed/simple;
	bh=YHnEcKyR1Nq0OfcnU6+dFxT4b5VrELxI9jgTrJVguSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MFWYWtLtWypEPeRkQp8ExBtwdSqrRlBmbsYXJ2edkiohD/ZI/EPqzW+0djWaQbLzWEeErypW0ExYqLN9iWRmeQ0SwDDdCJ9RvsKNLxhfoD4IAppSUqijCO+hfWv5o2fFDfcLnjvp7vyPEGpimIqUZsMszecPOaC2n5t0u3aA6Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5uLXj2W7; arc=fail smtp.client-ip=40.107.102.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wrt1b/ZzgpJTSnHEXixOK63SvAL1TionqzdT14AQEaCiou9daUQyZOGZblFOi12yTXhSeaxHNZKa/wbtNrrR8KI8VohwF9sY7bNdGHu/DWkQEydxrzOs6jkNHkjTGl3g+H4Hp3JS0TrrTWbM0tm7rnGipJ9m8scgOm0gPRoC0J9DR7y5w+PPp4fkfMi3BgcoLJRp2SafULo1aUQ8rKOXnJqfvqwRBZfaStYFL0vJv++evpSVf/sUWERmMADLglUZUpg5dJYbvTK4aigIBwXV6DjBUnmkQxSb3oQn0dWwfN+9uYOY0U6QE8VE8bB5JdnUtqFM8WUdhkFo1pKREYpRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHnEcKyR1Nq0OfcnU6+dFxT4b5VrELxI9jgTrJVguSo=;
 b=F305JbpEknFU9d97TR2TY5NFfg2r+t1U77g0OMKs7dSOt7FndpvEURuqFNvfMbINfcx52yHTRe/+Z7qeUyKedC0pqDcGzonQiynEJphfGdEmZg+Wv0Vf+5XBUr3DbuSOIC7E2E3dLSAHhEa3np97Plthqymx258LQO/qCQPbw13hZLYS1YuQnfZJZwskfxsy6tyTuyxWlzua4kCsEy/tH+sUvOwMPdHVXcYsmkyea4SH0CmK97BWQ+eh12aD9xKvc8MO6Q0uIcUVHCkeNVlBlmtr0ce9S970SauDxSKKfYCQG+dgIIDoPAat8vhJdJi2Ul6hLPhB/1pRtRCM1VHK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHnEcKyR1Nq0OfcnU6+dFxT4b5VrELxI9jgTrJVguSo=;
 b=5uLXj2W7CEpZnO/fne5iKzwdhfusJrk06XLXBVAYH8ZA0MbhMwTOyAvh/NY4mEDANp1Gp6QZjyb///ZhLy0Swy0xp5fFK7Gctg2TNDKQ1wTj+40WaRYepAB461Vwgzn7k7KatdJqToYKLios09CQDwIoYNvpvcwhIfuRDLiziZE=
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Mon, 25 Aug
 2025 14:10:27 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%7]) with mapi id 15.20.9031.026; Mon, 25 Aug 2025
 14:10:26 +0000
From: "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>
CC: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [BUG] Kernel panic in amd_sfh on Lenovo Legion Go
Thread-Topic: [BUG] Kernel panic in amd_sfh on Lenovo Legion Go
Thread-Index: AQHcEs2fNoi69p+PsEyFjV6aQrJQfLRzbZyQ
Date: Mon, 25 Aug 2025 14:10:26 +0000
Message-ID:
 <DM4PR12MB50401DAEBC63D0BBC8EC6F3DE63EA@DM4PR12MB5040.namprd12.prod.outlook.com>
References: <a21abca5-4268-449d-95f1-bdd7a25894a5@linux.dev>
In-Reply-To: <a21abca5-4268-449d-95f1-bdd7a25894a5@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-25T14:07:35.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5040:EE_|IA0PR12MB7698:EE_
x-ms-office365-filtering-correlation-id: 4c516fb1-9f59-40ee-2077-08dde3e12406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1NDd0FGUWExUmt2NmFZV2thNW9uRFZvVmYyNVpIUDhtYSt0ZGFSYkk5ODVw?=
 =?utf-8?B?aG9Gd1BkT0I4bzRyVi92UDBOU0tFV29rRFdDVnZHWUFsbTRmaGtwRU1BUkRV?=
 =?utf-8?B?MmpteWtITnZHQlRHckQyeUNncEkybDBlRzhKQml6NE5lQ1F3SmErQk1ycFhk?=
 =?utf-8?B?czhHU1NJSlBZS2NBZ1lYcGcybWdwckowTXBUa3NYdWhtREE0b2Z6eklkbG54?=
 =?utf-8?B?b1hZSzgzYVdMYzNFZk9NL0FGVjJxNzAwMHlsdldlZlB1dSsxUjJZVC9yMjVv?=
 =?utf-8?B?blh4eWhCbmNORElJM0l2UmVBeUZqSXFiMlFUL3VyMXFoeFJtdlkrVHA5UnVV?=
 =?utf-8?B?WEJrQlliMitHQkQ4bllnTHUwNHRvN1ZvclVCS3dYY1pQSTMzNlJYN3U2dHZV?=
 =?utf-8?B?VThscXV1eGppMVVIMU40SExEc0FESHhObjZQYk9lM2Q0MytuMVU3YTlabnJv?=
 =?utf-8?B?S0RSQWFEanJHZU5lcU5COTNLeDFwOGdjMWJST3UzRXR4OGVSSFJrenpGcXFF?=
 =?utf-8?B?ci9HdXpyMzVYTk52Nkg3aTAzVDFjRWNNcG9XaUYrdHpzbDh0d3BhSXpld0Vz?=
 =?utf-8?B?ajlXZVYwRG02MncrdUZZOThxWGlEVFB2SnovN2pSd21SN2ZHcFlXSEtra3F6?=
 =?utf-8?B?QXQ0QzU5WDZiakN6cHJKQlFNTTFHVmUzTEhzcUp0T0RCNDlwZDA2VXh3ZERL?=
 =?utf-8?B?Y20yQURkTlZJSWpIQnpLenhScldZeUJLanVWM0wvbEl3WGJDNHY0T21wa3lS?=
 =?utf-8?B?QnFRRGxjbGsvVGFPZUdRT0FEejdzaGFROTNEVkNaellmZ0V1LzVDcUtrcHNM?=
 =?utf-8?B?bmJzbkErU2N3NFhIUGwydTNBeG9JUWhpM0Ewc0pieEJ6TFFTUksxZlBIaXRw?=
 =?utf-8?B?NFpvODJ4d3VsT1BWSlhNaU1NZmt1OFJLNEhpa3M5d1c1cGdYNlIwbUp4dlI2?=
 =?utf-8?B?bG43dEVEZVJjby93Z0NIS093dGF6RlNVcVhJcC9xblhxRTdsdXc2ejNtSmV3?=
 =?utf-8?B?dHY0aVdBV1BIandjQ1FNNHZwMUlLMTVya3p3NjcrWXJmVXcyUWZxYlhZUUpR?=
 =?utf-8?B?OC84Zzl6MFhHVnJPRTJEYzd5dUpNcFFzWitmR0JNOUZvT1ptU2x6dDU5Njgx?=
 =?utf-8?B?bEF0RFZnU28vZFV3S0dka0tWU0FOMVlLM2VmczBmejlNYzkrTkRzaXczcDdI?=
 =?utf-8?B?MmovZnAwb0NtNFozNkcyekc1RlJob2tpUXA2NVZpRnZvc0xrMnhLQmUyLyty?=
 =?utf-8?B?K1dDenFvclZWSUg1TlFBN1ROMXptVTVjRUl3aVAyL2c0MGJ6T0Y3OXVoQ1NO?=
 =?utf-8?B?dDQxeE80YlZVRyt0eW13UjhwK252Y3BWT0pEUWs0YUxGb0s5L2o2Yi9pNFZm?=
 =?utf-8?B?cTBUUGhXbW42elh4aXJta0VaWU5QQnhFbFlxQjRBR2lrOEc4d1hDQkhUV0ZX?=
 =?utf-8?B?WjlhZDVPVGpxbnhDSWpHWkFDcmRMRGZtN0c3V0JYM2E4blM1aFZWd1B4MHJY?=
 =?utf-8?B?UlNKbWsrc2N6eHJuMHhnRWZBbHZ4TjhoSnV5Vk9oUWNpOWk2K1cxdmtyZkZJ?=
 =?utf-8?B?bEV3NkkwelhGaVo2QUdna01CK1VMSlU5dzNha21QTEQ5SHR0OW9EU1UwbHQ0?=
 =?utf-8?B?R3Z3R2swNVBRcGpkOWlQeXE1alh2T1NYRG9ieWpPQXZhcU9QSjgyZ0c0TG9Y?=
 =?utf-8?B?YUNBMVp1dHdDcmdRTkFwcDVNanAzZHhBYmo5UWRpVXR6aFV0SXg2bmkvcC84?=
 =?utf-8?B?dDF5NjdkMHFsRzQwWnUvaitMQ0I0aEJCandBU2dCT0UxUW9ucDIrcW4wSU55?=
 =?utf-8?B?U1pkNjVONTJORVRRdzdCS0lwa1VEdFU4anJJTlVBenFkN01YSWYvTjI5Q0ls?=
 =?utf-8?B?N2xwWElKS1hoZElxdjlEbkN5ZXROYjRGM0Y5dDYwS2srWGRvUlVjRWtBNXYr?=
 =?utf-8?B?SVNmSUhYV0hIWlJlWThCbnFsS2ttek5FbklOYlVpTFJURy8xdFM4WmdQK09p?=
 =?utf-8?Q?8NkeUBoZBdLEBLNkSnDxQxlhzuTfQk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dG9XY2k5ZXJoK1pTck9JaDIrMGhCcXB2S1FmNTc4WXM1bGpzUEs3WjNGc1BO?=
 =?utf-8?B?ekZPYUwzUk16eXQwMkVScWFYWjlkb2Z1UkRJY2RHYTdKaE1Vdlg1eitjcGFm?=
 =?utf-8?B?VTZMTEVJUWg4eEpXM0dndmpjaFFQbXp1ZG1qbGV3T3V2OUs4emFYUjNEQTcx?=
 =?utf-8?B?Z2ZZazI3cHFzZ3lycGZrdnR1SC9tZ3Y2T0FTOUEvTkFpdTBFTmVNWDNaMTl6?=
 =?utf-8?B?MW9zUmp3NVJaNFloejl4b2w2Q2xGRUhQQk1RSkN2UDNWcXRFZ21MVkpIL2N1?=
 =?utf-8?B?L05BbmpNZTJYemU2Q29tekJWZ0F0eEQvMmJiVHZuN3RoNlNZV1JWQ244aEVG?=
 =?utf-8?B?U0RjK3poakF5SldVSFJCNFlYalo5eittYXlSSi9FMW1IZGlpSWc0cDh6K25p?=
 =?utf-8?B?M0pIQjhPUTZpdTdZb1dmUzFLU3owWFNaZDhGaVRKL0oyci90aisyajVoYno5?=
 =?utf-8?B?VWIwTGt4d1lRbWg0T3NST2htNDZwczBFdDlkUTVNSDVRclJTaGd5dXdUZkJt?=
 =?utf-8?B?SURZcUdnQ0Q3b3BGcmRoc1JYSDF6OUpoSXNNVUoxaE00V1hTTWR6M0pXNEt2?=
 =?utf-8?B?bHFoV0dPcUJqdmtsS2hMdW5qMlFGbFhDVlBZNDlVOG91eko0L1BHZmovMUFW?=
 =?utf-8?B?Z3RSbDhFL3FaSWJxYWJEcmREbnBMcDRwNzJVL0NuRG9BRHJRQ2xmaGRqSjdl?=
 =?utf-8?B?V2krWXkydGlPN28yREV6citMakJnY0NNYmJUdlc0bzA2TDhpdURTeUJ1Z0hE?=
 =?utf-8?B?bzdGUzBlVnd2YkJmc1ZsRTRsbFkvTFFPQUFiOTlYWSs4a2N4ZkUxL3o4ZVVG?=
 =?utf-8?B?ZTdKcVY2cjFnd0hwR2p0NWkrVDhiOG1QT3huMkpDTldWejVpVDZGa3Q0R09i?=
 =?utf-8?B?dHpyS3kvOHdYRmt1T3Zvd1NrcUNHRmt6bWdnUFhXVVZkcmlyRUgyYmNjTXRo?=
 =?utf-8?B?SDd5N0ZxaW5XRVNBSVhDenF0YTRvNW1LdGdVQnMzQVZ6ak53YWpCdHFOZ0lW?=
 =?utf-8?B?dHNoMkp0SUo4bkxrNC9SZVBDbzU2S2FIZitFQmR6Y1Jxdm81aGRNMnhCQjZE?=
 =?utf-8?B?WkVYc1l1TDlFMzkrRmFWeXUyVE5rNnRQNmVFdnU0VXJkUDFUd01QYk9qQ3pS?=
 =?utf-8?B?djFoQW82ZWo4RVAxZ3cxZ0pDM0xZTjZVRzNJbkg0Qk5xSmk1WXhQMVpEWnZB?=
 =?utf-8?B?Z05PbDlEdjRCNk1GZGlnc25EdHZIVENLeXJSWUQ1S3piVjNqcHZxT0l6TWk2?=
 =?utf-8?B?cWN3TU5aYWFCRzJpRFgya1g4ZlJET1I2MnBJUzdZOXU0dlU0UkgxRXE0a1hE?=
 =?utf-8?B?bS81R0w2ZkRsNmlZMFF3YzlNTkhjYTZ2TTZnSTk1WGt2dWZTaFp1QnFzM0Nq?=
 =?utf-8?B?dlFxUEpkZEh2VVJwYllRaEhrMXROVXlzVnRWa1Y5dlJDTkhiMFFkVnU1NUZP?=
 =?utf-8?B?TW9jeEFHek1UaDlOMkgwaGF0dW5sakhGOVlVQmVKbjcxQVlEZytxaUc0dTBr?=
 =?utf-8?B?UHI5NncwS3pQZjF3WFVoZjNzRy8vY3Vjb0pRZkZSTXhNckJNMVQzazJGRE1z?=
 =?utf-8?B?SCs5SFZiekdVR1lNZ1h4YzFEUjY3WUlNaTdoS3VaWnBTRHc5Y3lSWmFJU2Fo?=
 =?utf-8?B?Tkp4bnpjRjZhTlBYTDZCdnVOK2hoRUs4cmFmTUVSU2c0dzVHY1ErT2NvMFZs?=
 =?utf-8?B?ZkwvV3NIYXFrZ2k2eVNWUXFyMVJJeEJ4VDU0MjgwaUsyaGtjVjFOcmdXOStV?=
 =?utf-8?B?QkdTQzVkRjB4TDIzalJnOTdpbTNmVkIxMmMxLzVtSTR3WVhVMXZCOUFpZkdm?=
 =?utf-8?B?SnB0bHhkMndZQS9hY0QyNkZmOTA5OFBGUVZCdHgwNlllT3ZpYW1MNDdHUTV3?=
 =?utf-8?B?dUtZbmRUY1UwekZ0Y05tZUZoRU5NcVBRRkV4RWxTZ1RoNUVQRXE0ekpMTHl0?=
 =?utf-8?B?ZDcrMDdTMmhJS1hjd1JZUitVbkZoc2FYT2owY0hGdVY2Vm1VNXVjZ2Z5Mmxu?=
 =?utf-8?B?WE9RT0traWU3dkRhcUtEOU1tK3lGdHJTQVlCVnYvallKL0lESHEwdThBNVpq?=
 =?utf-8?B?MytKWTJNeFd3UjU5UWNKa3V1YWIzRnp0WU54WXNVcHlPZU1paHNscldZYTVs?=
 =?utf-8?Q?ghYU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c516fb1-9f59-40ee-2077-08dde3e12406
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 14:10:26.7494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRuOzU/OvPn8D8sVKtofO/xlRFSyin2ptpP9QRqcrUWKhQWP0jV0x/0g+0RKlPfPmue1HyYIeXr7U15UVTuk3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhhbmsgeW91LCBNYXR0aGV3LCBmb3IgYnJpbmdpbmcgdGhpcyBpc3N1ZSB0byBvdXIgYXR0
ZW50aW9uLg0KV2Ugd2lsbCBsb29rIGludG8gaXQgYW5kIGtlZXAgeW91IHVwZGF0ZWQuDQoNClRo
YW5rcywNCi0tDQpCYXNhdmFyYWoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IE1hdHRoZXcgU2Nod2FydHogPG1hdHRoZXcuc2Nod2FydHpAbGludXguZGV2Pg0KU2VudDogRnJp
ZGF5LCBBdWd1c3QgMjIsIDIwMjUgMTI6MjkgQU0NClRvOiBOYXRpa2FyLCBCYXNhdmFyYWogPEJh
c2F2YXJhai5OYXRpa2FyQGFtZC5jb20+OyBTLWssIFNoeWFtLXN1bmRhciA8U2h5YW0tc3VuZGFy
LlMta0BhbWQuY29tPg0KQ2M6IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9A
YW1kLmNvbT47IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogW0JVR10gS2Vy
bmVsIHBhbmljIGluIGFtZF9zZmggb24gTGVub3ZvIExlZ2lvbiBHbw0KDQpIZWxsbywNCg0KV2hp
bGUgdXNpbmcgbXkgTGVub3ZvIExlZ2lvbiBHbyBoYW5kaGVsZCBkZXZpY2Ugb24gU3RlYW1PUywg
SSBoYXZlIGhhZCBtYW55IGluc3RhbmNlcyBvZiB3YXJuaW5ncyBhbmQgb2NjYXNpb25hbCBrZXJu
ZWwgcGFuaWNzIGluIGFtZF9zZmhfd29yayBvbiB0aGVpciA2LjE1Ljgga2VybmVsLiBVc2luZyBr
ZHVtcHN0LCBJIHdhcyBhYmxlIHRvIGdldCBzb21lIGxvZ3MgZm9yIHRoZSBtb3N0IHJlY2VudCBr
ZXJuZWwgcGFuaWM6DQoNCjw0PlsgIDY2Mi43MTM3MzNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUg
XS0tLS0tLS0tLS0tLSA8ND5bICA2NjIuNzEzNzM4XSBsaXN0X2RlbCBjb3JydXB0aW9uLiBwcmV2
LT5uZXh0IHNob3VsZCBiZSBmZmZmOGNjYzY2YTUxZTg4LCBidXQgd2FzIGZmZmY4Y2NjNWZjNWQw
ZTguIChwcmV2PWZmZmY4Y2NjNDE0MjUyODApIDw0PlsgIDY2Mi43MTM3NTRdIFdBUk5JTkc6IENQ
VTogMTEgUElEOiAxNjQgYXQgbGliL2xpc3RfZGVidWcuYzo2MiBfX2xpc3RfZGVsX2VudHJ5X3Zh
bGlkX29yX3JlcG9ydCsweGZhLzB4MTBhDQo8ND5bICA2NjIuNzE0MjA0XSBDUFU6IDExIFVJRDog
MCBQSUQ6IDE2NCBDb21tOiBrd29ya2VyLzExOjEgVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAg
ICAgNi4xNS44LXZhbHZlMS0yLW5lcHR1bmUtNjE1LWc0OTI0OGY0ZTJhZDEgIzEgUFJFRU1QVChm
dWxsKSAgNjQ2MDVhNTkxODE3ZGI3NmI0NmI5NWQ3M2U4NmM0MzY0YjI1Yzg0MQ0KPDQ+WyAgNjYy
LjcxNDIxNF0gVGFpbnRlZDogW1ddPVdBUk4NCjw0PlsgIDY2Mi43MTQyMThdIEhhcmR3YXJlIG5h
bWU6IExFTk9WTyA4M0UxL0xOVk5CMTYxMjE2LCBCSU9TIE4zQ04zN1dXIDEyLzA2LzIwMjQgPDQ+
WyAgNjYyLjcxNDIyM10gV29ya3F1ZXVlOiBldmVudHMgYW1kX3NmaF93b3JrIFthbWRfc2ZoXSA8
ND5bICA2NjIuNzE0MjM2XSBSSVA6IDAwMTA6X19saXN0X2RlbF9lbnRyeV92YWxpZF9vcl9yZXBv
cnQrMHhmYS8weDEwYQ0KPDQ+WyAgNjYyLjcxNDI0NV0gQ29kZTogZTggY2IgNGEgMGYgMDAgMGYg
MGIgZTkgNzcgZmYgZmYgZmYgNGMgODkgZTcgZTggZGMgMGMgM2IgMDAgNDkgOGIgMTQgMjQgNGMg
ODkgZTEgNDggODkgZGUgNDggYzcgYzcgMjggYzcgMTMgYjAgZTggYTYgNGEgMGYgMDAgPDBmPiAw
YiBlOSA1MiBmZiBmZiBmZiA1YiA1ZCA0MSA1YyBlOSA5MSBjNiBlYiBmZiA0OCA4OSBkZiBlOCAx
ZSBmZSA8ND5bICA2NjIuNzE0MjUwXSBSU1A6IDAwMTg6ZmZmZmQxMmM4MDZlM2RmOCBFRkxBR1M6
IDAwMDEwMjQ2IDw0PlsgIDY2Mi43MTQyNTddIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZm
ZmY4Y2NjNjZhNTFlODggUkNYOiAwMDAwMDAwMDAwMDAwMDI3IDw0PlsgIDY2Mi43MTQyNjJdIFJE
WDogZmZmZjhjY2YwZmVkYmQwOCBSU0k6IDAwMDAwMDAwMDAwMDAwMDEgUkRJOiBmZmZmOGNjZjBm
ZWRiZDAwIDw0PlsgIDY2Mi43MTQyNjZdIFJCUDogZmZmZjhjY2M0MTQyNTI4MCBSMDg6IDAwMDAw
MDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMGZmZmRmZmZmIDw0PlsgIDY2Mi43MTQyNzBdIFIxMDog
ZmZmZmZmZmZiMTZkMDEyMCBSMTE6IGZmZmZkMTJjODA2ZTNjODggUjEyOiBmZmZmOGNjYzQxNDI1
MjgwIDw0PlsgIDY2Mi43MTQyNzRdIFIxMzogZmZmZjhjY2M2NmE1MWU4OCBSMTQ6IDAwMDAwMDAw
MDAwMDAwMDAgUjE1OiBmZmZmOGNjYzY2YTUxZTgwIDw0PlsgIDY2Mi43MTQyNzhdIEZTOiAgMDAw
MDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOGNjZjVlODhhMDAwKDAwMDApIGtubEdTOjAwMDAw
MDAwMDAwMDAwMDAgPDQ+WyAgNjYyLjcxNDI4M10gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAw
IENSMDogMDAwMDAwMDA4MDA1MDAzMyA8ND5bICA2NjIuNzE0Mjg3XSBDUjI6IDAwMDAwMDAwYzRm
NTIwMTAgQ1IzOiAwMDAwMDAwMTY0ZGUxMDAwIENSNDogMDAwMDAwMDAwMGY1MGVmMCA8ND5bICA2
NjIuNzE0MjkyXSBQS1JVOiA1NTU1NTU1NCA8ND5bICA2NjIuNzE0Mjk2XSBDYWxsIFRyYWNlOg0K
PDQ+WyAgNjYyLjcxNDMwMV0gIDxUQVNLPg0KPDQ+WyAgNjYyLjcxNDMxMF0gIGFtZF9zZmhfd29y
ay5jb2xkKzB4MWMvMHgyMSBbYW1kX3NmaCA1OTBlMjZiZTlkYTc0M2VkOWM0MmQ0NDczZmYxMWU1
NTI0NjFjZDU0XQ0KPDQ+WyAgNjYyLjcxNDMyM10gID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsr
MHg1LzB4ZmJlZjUNCjw0PlsgIDY2Mi43MTQzMzNdICBwcm9jZXNzX29uZV93b3JrKzB4MTkwLzB4
MzUwIDw0PlsgIDY2Mi43MTQzNDRdICB3b3JrZXJfdGhyZWFkKzB4MmQ3LzB4NDEwIDw0PlsgIDY2
Mi43MTQzNTNdICA/IF9fcGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8weDEwIDw0PlsgIDY2Mi43MTQz
NjBdICBrdGhyZWFkKzB4ZjkvMHgyNDAgPDQ+WyAgNjYyLjcxNDM3MF0gID8gX19wZnhfa3RocmVh
ZCsweDEwLzB4MTAgPDQ+WyAgNjYyLjcxNDM3OF0gIHJldF9mcm9tX2ZvcmsrMHgzMS8weDUwIDw0
PlsgIDY2Mi43MTQzODhdICA/IF9fcGZ4X2t0aHJlYWQrMHgxMC8weDEwIDw0PlsgIDY2Mi43MTQz
OTZdICByZXRfZnJvbV9mb3JrX2FzbSsweDFhLzB4MzAgPDQ+WyAgNjYyLjcxNDQxMV0gIDwvVEFT
Sz4gPDQ+WyAgNjYyLjcxNDQxNV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0t
IDw0PlsgIDY2Mi43MTQ1NzddIE9vcHM6IGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCwgcHJvYmFi
bHkgZm9yIG5vbi1jYW5vbmljYWwgYWRkcmVzcyAweDMyZTMxYzU1ZDhhYTA2ODc6IDAwMDAgWyMx
XSBTTVAgTk9QVEkNCjw0PlsgIDY2Mi43MTQ1OTBdIENQVTogNCBVSUQ6IDAgUElEOiAxNjIgQ29t
bToga3dvcmtlci80OjEgVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgICAgNi4xNS44LXZhbHZl
MS0yLW5lcHR1bmUtNjE1LWc0OTI0OGY0ZTJhZDEgIzEgUFJFRU1QVChmdWxsKSAgNjQ2MDVhNTkx
ODE3ZGI3NmI0NmI5NWQ3M2U4NmM0MzY0YjI1Yzg0MQ0KPDQ+WyAgNjYyLjcxNDYwMV0gVGFpbnRl
ZDogW1ddPVdBUk4NCjw0PlsgIDY2Mi43MTQ2MDVdIEhhcmR3YXJlIG5hbWU6IExFTk9WTyA4M0Ux
L0xOVk5CMTYxMjE2LCBCSU9TIE4zQ04zN1dXIDEyLzA2LzIwMjQgPDQ+WyAgNjYyLjcxNDYwOV0g
V29ya3F1ZXVlOiBldmVudHMgYW1kX3NmaF93b3JrIFthbWRfc2ZoXSA8ND5bICA2NjIuNzE0NjIy
XSBSSVA6IDAwMTA6YW1kX3NmaF93b3JrKzB4MzEvMHgxNTAgW2FtZF9zZmhdIDw0PlsgIDY2Mi43
MTQ2MzFdIENvZGU6IDAwIDAwIDQxIDU3IDQxIDU2IDQxIDU1IDQxIDU0IDU1IDUzIDQ4IDg5IGZi
IDQ4IDgzIGVjIDA4IDRjIDhiIGFmIGMwIDAwIDAwIDAwIDRjIDhiIDY3IGY4IDQ5IDhiIDQ1IDA4
IDQ5IDhiIDRkIDAwIDRkIDhkIDdkIGY4IDw0Yz4gM2IgMjggMGYgODUgMmIgM2IgMDAgMDAgNGMg
M2IgNjkgMDggMGYgODUgMjEgM2IgMDAgMDAgNDggODkgNDEgPDQ+WyAgNjYyLjcxNDYzNl0gUlNQ
OiAwMDE4OmZmZmZkMTJjODA2OGZlMTggRUZMQUdTOiAwMDAxMDI5NiA8ND5bICA2NjIuNzE0NjQz
XSBSQVg6IDMyZTMxYzU1ZDhhYTA2ODcgUkJYOiBmZmZmOGNjYzQxNDI1MWM4IFJDWDogZGVhZDAw
MDAwMDAwMDEwMCA8ND5bICA2NjIuNzE0NjQ4XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDEgUlNJOiBm
ZmZmOGNjYzQyMjQwZWM2IFJESTogZmZmZjhjY2M0MTQyNTFjOCA8ND5bICA2NjIuNzE0NjUyXSBS
QlA6IGZmZmY4Y2NjNDAwYjc4MDAgUjA4OiA4MDgwODA4MDgwODA4MDgwIFIwOTogMDAwMDAwMDAw
MDAwMDAwMCA8ND5bICA2NjIuNzE0NjU2XSBSMTA6IGZmZmY4Y2NjNDAwNTA4YzAgUjExOiBmZWZl
ZmVmZWZlZmVmZWZmIFIxMjogZmZmZjhjY2M0M2FjNGU1OCA8ND5bICA2NjIuNzE0NjU5XSBSMTM6
IGZmZmY4Y2NjNjZhNTFlODggUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogZmZmZjhjY2M2NmE1
MWU4MCA8ND5bICA2NjIuNzE0NjY0XSBGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZm
ZjhjY2Y1ZTZjYTAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwIDw0PlsgIDY2Mi43MTQ2
NjldIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMgPDQ+
WyAgNjYyLjcxNDY3M10gQ1IyOiAwMDAwN2Y3Y2NjNWY5MDAwIENSMzogMDAwMDAwMDE2NGRlMTAw
MCBDUjQ6IDAwMDAwMDAwMDBmNTBlZjAgPDQ+WyAgNjYyLjcxNDY3OF0gUEtSVTogNTU1NTU1NTQg
PDQ+WyAgNjYyLjcxNDY4MV0gQ2FsbCBUcmFjZToNCjw0PlsgIDY2Mi43MTQ2ODddICA8VEFTSz4N
Cjw0PlsgIDY2Mi43MTQ2OTBdICA/IHNyc29fYWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1
DQo8ND5bICA2NjIuNzE0NzA0XSAgcHJvY2Vzc19vbmVfd29yaysweDE5MC8weDM1MCA8ND5bICA2
NjIuNzE0NzE1XSAgd29ya2VyX3RocmVhZCsweDJkNy8weDQxMCA8ND5bICA2NjIuNzE0NzI4XSAg
PyBfX3BmeF93b3JrZXJfdGhyZWFkKzB4MTAvMHgxMCA8ND5bICA2NjIuNzE0NzM2XSAga3RocmVh
ZCsweGY5LzB4MjQwIDw0PlsgIDY2Mi43MTQ3NDZdICA/IF9fcGZ4X2t0aHJlYWQrMHgxMC8weDEw
IDw0PlsgIDY2Mi43MTQ3NTVdICByZXRfZnJvbV9mb3JrKzB4MzEvMHg1MCA8ND5bICA2NjIuNzE0
NzYzXSAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMCA8ND5bICA2NjIuNzE0NzcyXSAgcmV0X2Zy
b21fZm9ya19hc20rMHgxYS8weDMwIDw0PlsgIDY2Mi43MTQ3ODddICA8L1RBU0s+IDw0PlsgIDY2
Mi43MTUyMThdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KDQpGdWxsIGRt
ZXNnIGZyb20gcHN0b3JlOg0KDQpkbWVzZy1wc3RvcmUuMjAyNTA4MjEwNzMyLTA6IGh0dHBzOi8v
Z2lzdC5naXRodWIuY29tL21hdHRlLXNjaHdhcnR6L2Y3ZDVmYmM5ZWI2YjQ3MDUxZmI1YzNlYTRk
NmFlMzJmDQpkbWVzZy1wc3RvcmUtMjAyNTA4MjEwNzMyLTE6IGh0dHBzOi8vZ2lzdC5naXRodWIu
Y29tL21hdHRlLXNjaHdhcnR6L2E0NzMzNTQwMTBhMjNlY2IwYjExOTAyNGM5NjAxNjZkDQoNClNp
bWlsYXIgd2FybmluZ3MgaW4gYW1kLXNmaCBhcHBlYXJlZCBpbnRlcm1pdHRlbnRseSBlYXJsaWVy
IGluIG15IGpvdXJuYWwgdW50aWwgZXZlbnR1YWxseSBvbmUgdHJpZ2dlcmVkIHRoZSBrZXJuZWwg
cGFuaWMgYWJvdmUuDQoNClRoZSB3YXJuaW5ncyBhcHBlYXJlZCB3aGlsZSBJIHdhcyBsZWF2aW5n
IHRoZSBkZXZpY2UgaWRsZSBvbiBTdGVhbSdzIEdhbWVwYWRVSSBob21lIHBhZ2Ugd2hpbGUgdXNp
bmcgZ2FtZXNjb3BlLiBCZWNhdXNlIHRoaXMgYnVnIGlzIGludGVybWl0dGVudCwgSSBkb24ndCBo
YXZlIGEgbW9yZSByZWxpYWJsZSB3YXkgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBvdGhlciB0aGFu
IGxlYXZpbmcgdGhlIGRldmljZSBpZGxlIGZvciBleHRlbmRlZCBwZXJpb2RzIG9mIHRpbWUuDQoN
ClRoYW5rcywNCk1hdHRoZXcNCg==

