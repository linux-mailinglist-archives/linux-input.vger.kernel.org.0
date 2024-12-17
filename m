Return-Path: <linux-input+bounces-8630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AF9F4F4A
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 16:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C57A4188975B
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 15:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76E71F8925;
	Tue, 17 Dec 2024 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PoPQdQZo"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580521F890A;
	Tue, 17 Dec 2024 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448795; cv=fail; b=q/1AgxPwwm9BOQTSxtX9JXutk0XRDb1zTrrDaw++57M7Qvyupd60QKiIw2K9frefsSiNHK6XLcqxrBQkjGnnaY/3Arot+Uw67oJ0UUMgRfc/DAYMX/xETwQiEFEC1HigQQ+AGJzLpzoSDdNHKqGvnEzGEOhCEvBKUVYH7zEmyT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448795; c=relaxed/simple;
	bh=VAxPeUhgRpniz5CtdB7WExjZpaRENP2WU3dd+em5SAE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZFbQUM+SYN+iF/PN0xNbUV8LBJ/4y4dqkfjclASVdZAQqb+irpGhtpVJ0JhsRtr8XVEFDoogryjg/FmDKvVp0PoHEo4ZUIzQTeyP0arlvi+f6NbU0xABZoeEk6WBxTLRJfszio4W8xlzo8OnVNrAbp7hjlPC2egBnaJyzwyaxwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PoPQdQZo; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wps35PpOq1L65N6UtKuW2vxbdyxnf/V3y20Nr2Q/SGzCViZe68zqnshfzotMsmOhJy//v/WKQGd3kuUoBriMKBuKM5C421EimMD5pW87WuACzI45ojf3NUE3f/VIdxAUelALjNQXVSh9Pn7xNTmfxiMc9quojID8yLUGdUjJ3TINfeMTUeoVBZKEKOoF5Csyy7AbAkg6w/sDc+u7uK9b4tx1s0riJxdpCJSkz2BpnVklb/fudxzPBvQ7BasPQaL9Nbof57aiLs5HowS+l8JnnhcosFO89ij+rjnRcOmK/3T5QCWTJjn321tfjJZvv4hJNukFyfyi7lK76BtDhYTizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zfrtpv0X2OtKwyKJjgi4XatC/AxFCKUPvyNKAH6nkLk=;
 b=FJtis10r2E3CikeLNXBHKAtm3fRkLpozzJwd2mJLaSPLSu36PXVnF/zeKeS6CbcHYOE8tzueSVDTauQw9Dhb7ARDDudi6Tdeo0ITw5HEzJiLSrLUWnRwAZW6du0dU0j0d0oRRWMBOEhAaXJUYQDZzcBQIWmfiB3QVEODF2AizSlY3fODHEGOfdXVrM+/EphkcniDAaShjP1cDBY0S70lhMOrVuCXBWZSW2EopW/H/oigVJA6RM9fHlQtsiuBfWZFZdLGKF97fvwF9t3OZ/8vLzFlEDxF+LvG8Vv0ZCZV7QAfnVyUkh39bjyZhOk6hyj3T25AgnFb9NM3XCMdZnq8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zfrtpv0X2OtKwyKJjgi4XatC/AxFCKUPvyNKAH6nkLk=;
 b=PoPQdQZomVSgbmD1NLlyJmj6m9Di1txfpEL5RceoCLPlsnMNj7ms+qkNvRoXaEa/gLDeEsQyDj2tgCLcsdOQyZNK3/OFEefyJMAGUsLEhe4a1bU7C19JyAk7Db12phXl3jwydi4C2Q+W66ekAjRzOYCqGOUcD2fb5ufkD1fOInU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB6325.namprd12.prod.outlook.com (2603:10b6:8:a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 15:19:50 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:19:49 +0000
Message-ID: <42d2551a-00de-414e-a174-c3b867a95352@amd.com>
Date: Tue, 17 Dec 2024 20:49:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] HID: amd_sfh: Add support to export device operating
 states
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
 <1b3dacc1-37bd-49cc-addc-628e843a5af8@amd.com>
 <a16764a3-744b-4a55-86af-777de02ff999@amd.com>
 <1e9aad0f-73bd-74a4-1a96-3543419b4fc3@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1e9aad0f-73bd-74a4-1a96-3543419b4fc3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::32) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fbcd1b-b32c-4263-ad53-08dd1eae3f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHA0WFRBdW5CSlVGY2V6UHBrc2xmVGJVY21SeGFMcVUvTnhJaGw5UkRkcVdr?=
 =?utf-8?B?WnhBV2tNRVdTOG9FSHFiT3FRSklEUXJuTVhML1RZdSsxOFduM0o5MFBDWmYz?=
 =?utf-8?B?R3BPL0dmTjJ0ck1OWVZobWkzUHFPaFNJZkdIUXJLa2lEM3VDaVdaa1F4NmQy?=
 =?utf-8?B?YTdKK212Z3NRSm1TenJSN3dIMnZuM2s2aS85TTZwdExkM1FBMzBJSTlhdWRn?=
 =?utf-8?B?dVEybTFwdnE5WEFXRXNqY3VZS0RreWpoT21tZ3JQa2k3VkRvY1NScGFGbXFF?=
 =?utf-8?B?bkZ1Tk4wc21sTmt1MkEvVVNReUJSaUgrREduQ3lGVG5YY0NiT2ZLdThQQzJ5?=
 =?utf-8?B?SG03TExtcWMyUGFhWlRScEpzRnVkdVNnRTBucVdDOG9HZW82cm8vZ1FITmg1?=
 =?utf-8?B?WVI1THNHOVlETVc5S2wzZjlnYjdqY1loMU54aWthUW0xcVBLcmprVkhiVVlp?=
 =?utf-8?B?MGtCRGYzaGo3di9LSm1FV1F3blNPaDQwRDJvV0toWFo3ZlhVNG4raWRsQUph?=
 =?utf-8?B?OHhLZzk3QlE4ZU9JcFNXZmJYbjBSb2R2RjJaek0xWThuc2NWeTZPUDJUditr?=
 =?utf-8?B?bzc1dFE5TVh6Q095RXh4Y3ZvMlhtT1VtVEVWK2ZLejRRWGpTV0NJS3g4Nk9a?=
 =?utf-8?B?Z0dkbkhSL2FCd1llV21jWE91R1FicDIyMlJzZWlHUnRqckxVeEJ5OFRGQWY2?=
 =?utf-8?B?bm5KQUFVY2tpRDhEdFk5ZGU5c3ViTlR5UGJyL3BRNHA4OVdFaXNVeEJ5dU1W?=
 =?utf-8?B?d0hhUmtEeTZkMWFuRG5YWnFwU3ZKRzF1OVE2T3Y3UHFEakVvN2tNK2Y1T0hH?=
 =?utf-8?B?SHl4bFZOODVoL2g5bnQ2Y1JtUmtaclVGaTRHdHFzNWM3cGJrWm9GakpCdmp5?=
 =?utf-8?B?d2QyMlNpT2VEdU8vaVNrajFhalppYkI1MVFTNHp5NHV5N0VDWS9jdnhzMjJN?=
 =?utf-8?B?NHFRSHRhL0Yxd3p5eVR5V2FjbzRZY2djUDR0V2JmcEMzbG5mdzlRN1U3dVdw?=
 =?utf-8?B?Z1Zsbm9idkNlZ2pFVk9BMG1LazlFeGtOVzRWM3MyNjdIOGpCbGVIV0FiS1lO?=
 =?utf-8?B?WERmdDJpYjJhWUVHcFhUOHJXUXlsWU9va0k0UEVuZ2NRU2d4bFM1ak5jdE9u?=
 =?utf-8?B?Z1psQVhlTmJaamhJUTIrNDNxT3JXTDVWS09HVFU2aGVxTnBoQndmV1lDQUpN?=
 =?utf-8?B?SG1tdytwME51dEczbUNJTjB5QitUbGxxVHB1eE9IZ2hXWE5rSXVtODRVYlhk?=
 =?utf-8?B?S1hRbHVJZmtuVmc3eFZMVlFILzlwMXhKcERDaEl0Ykp2SkwvMitjZWFoa0Np?=
 =?utf-8?B?Sk5oVDRNd3ZJZkd5MU5GTFZ3OWVvaklZR3M0V200bmdpYUFBNEdBcVovaTAw?=
 =?utf-8?B?M2p1bGE1UWJlV2hnQXlqTkQrRG1TUW9IalJwb2xSL2ViSXFCMkJyeDEycW83?=
 =?utf-8?B?OWFtN3BBZkxVaGNCZTRpKzJ6MlhndXpiMkd4TkJBenpuR0VJNUlPOGdKYm9r?=
 =?utf-8?B?eDdRWTNaWStaOVRKZFlSMjZKWUl1djQ5T1BtMXA0TFdiY2JkenRFOGVVY3lV?=
 =?utf-8?B?RjNDd1UySmhpYUE2WlhwbWJPR21VVGd2dUFzSzVHRi9icDM1cG9XNEEwd1dm?=
 =?utf-8?B?RlVZdHJzVGNwUHhqYXhBVlhQTXE1SkNibmROTTFkL1dVMlBQcy81NFIrb2p1?=
 =?utf-8?B?L2ZKT3lnZjIyVzlpZ2krWmlhSytobk9tMzFUVHhaUm5OWjQ2ZitwZjJIejd2?=
 =?utf-8?B?REpJbWtuQjl4NkJYMGhESTlXd25oMWVGYXNBbEVVckdBL0Voek5hN0pMTWtV?=
 =?utf-8?B?elkyWTFhTGFXcGl6V0dPdXNvcThsSkhzbEw3WW1RTHRXNmNkZEtHZzBWUVV2?=
 =?utf-8?Q?hSNWOT1w3SX1e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFPY0xGeWNvZ2hhWVdtWmM3OE1aelptR1ErQVZ6RHI4elIwdEJZQ2VXQjNv?=
 =?utf-8?B?bUhVUzJ1TWVGakc2QnR1eTFYLzhWM004OW9ZOGVvbDh4eVViZ2wxTWNqbGxV?=
 =?utf-8?B?VzZTWDNic1dDTzZEbkxWNVBzTmNrQUg1N2NoT3I4QzdSY212cWZBb1ZGM094?=
 =?utf-8?B?NTBWWmZsV1dNTDNUYzkzZGFHTE1zNUxLcmJFT2J0enZhdFViUmc2cDBaMzF1?=
 =?utf-8?B?VjVXN3pkeVZyQWVqSUpnaEpJcWpvcHR3YklET2RvUzJJWXVobnU4Y25LaUx3?=
 =?utf-8?B?eTJIUG8yeEVyd1djQjZLakhha0FYNmJjUGlzR3ltMTAxTnlHVXB1ek9welFR?=
 =?utf-8?B?dytWQW1rNjd1ejc1aVFnREhIV2hDYmV4TWUxZ1Avc0VmM29SdW1OWkNhdVJQ?=
 =?utf-8?B?TVpaUVlydXNkc2VlY2FxWHcyV0hncGFrekgwSU1WWGZYVTJTUGdaWVh0ZGlU?=
 =?utf-8?B?WTR5Tm5nZlBkUzB2ZGJKZmhZeDQvNWRVaWRFZ042SHZzcDliNzBuSnBxRnBx?=
 =?utf-8?B?SFFPS29VODJXT3A1RVdoZUI4T2pHeE9iUVVTSCsrWmxoN3Y4Y3RVUGtVTTYx?=
 =?utf-8?B?dnB6SWlSSnZBb2Y5dVBmSUd3eFE5V1JuNW1BT0Rpam9Vc1BtZUtHNTFqdHhM?=
 =?utf-8?B?VkE0ZFU0YS9wY011cWp6WUxjRWlQY1VtTXhLNlB4eDFKcTdNMmxjTVNSeUMv?=
 =?utf-8?B?U0NQQ09OUklmTDRCWlNocGYvYXlRZ25hZXhuZU9INm1LWGhrR2RDZjdMOEk0?=
 =?utf-8?B?Ymx6aVJOT3MrdnZhbmZPT2JDYmIvM3JVdi9iRUt6VEJzUFh0a2lEY0Z6Y2NV?=
 =?utf-8?B?VnduOE04Zm9FMzIyLzErUDJzc1U3TEVzaXcrZ3A2UndGWmlPNU1mOWNnZHh4?=
 =?utf-8?B?dGEzOGx2NTd6dDBBNHp6NHk3L0k0WXQwdTBmWUg4STBDVTJISGlDYnBaRU1J?=
 =?utf-8?B?dVdrbHZDTWlXOTU1KzBaU0g5M09BNGRWeUtNUlF3SGQ1ZWxkbDlQbjc4cDVy?=
 =?utf-8?B?VnpMbk1CbGlWMFVHK3pINGxYNzdrTVk2VXJDaWt1bks5NU0yWTA5TDZKYjAx?=
 =?utf-8?B?UEhzWnlua0l6c1pIdHNVUmd5OGJCaDUyVjJRd1ZHcUgzVzdDLzNwWTJyYmlL?=
 =?utf-8?B?V2FWUzJrM2F2ampRdDBuOW8rcUpTcnpzMlp3TE1seEQzYkErVThLSEhpNUVX?=
 =?utf-8?B?NUl0VkdqbFhvaGUxN2Q5OE82dGgvQzcvQXkzUUhVTEgwMjdacTNwckZDbWU4?=
 =?utf-8?B?YmRyaXRuNE9UYXZSTDRjRFV0NUtpRkxGcjJOTXZMbk5nYlN0aFU0WXFac2p1?=
 =?utf-8?B?UDA4OEJuK0R1dzNNQ0JMU3hOR3MwYlQydTdMbzRSWDFsNGtWalQ2Y3BUQ0ps?=
 =?utf-8?B?aVR5c0ZVbzFxbVVuOUVqaEpnTUFJN3Znb0k3Z0ljTWhHT0tScGNmL2ExbXl3?=
 =?utf-8?B?TnpOYitTVDdjVnJiRHdRZXloQlUzcTNuaFcybFZCQmlRMzRpUDdBYjZxMXhV?=
 =?utf-8?B?SGtlRFVDVXpiM25QNk9CcnRQVStrK2E3Mit5UTZ0Sno2Z3o1WDI4TUEreldE?=
 =?utf-8?B?NGNld2xTOSttVW5FRUwzWHRPTDlhUmg1eUM2OWN2REtuaXo0MEYrWnlqMG5O?=
 =?utf-8?B?MjVmc0I3NlN6a3ZMOE1iM2c4K3llWlk4RmdLa3ErSXo5OGI4VGhVcEljQmVz?=
 =?utf-8?B?ekt0NjlZTDhSdjdNY0RwdHBOckxvMWFGUm9PVDdSK2VORDdTUkZTUzA0NzRV?=
 =?utf-8?B?SVU0M1F1U2gxM0JrTmNGS0xtU1FaYlJ4eWwxOVdwcElKZy94OTV0U2EyRlNG?=
 =?utf-8?B?MXlIaGhuMnpJcmdEZTJaZ3hIT21YVzYyR2FXUDBvRHNFaFJLVUM0VThkQ2FN?=
 =?utf-8?B?Q3ZpUjhOc1JHblE4RDRlbm56bmt5SlY4T2l0OHBOdkRTWWQ1bHpCcDllVFJ0?=
 =?utf-8?B?a05EMUg5Z0ZlcFBLUUR2ekFWaEZJTXduSExOYThzUm52cGNGZTlxZHdCcTBK?=
 =?utf-8?B?TlVQVnhTVVFnWUxaUWJlNGwwOXJldVdCNjBwL05IdFlaNkxxT1dZNFFrNlIv?=
 =?utf-8?B?LzNNVWJid05sUndodSsxenBqWnBDVStUTURTY1IyL2ZjSmkwS0VLd0FoWGJa?=
 =?utf-8?Q?6EeapVDhZhDH5LkIYUZTfz876?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fbcd1b-b32c-4263-ad53-08dd1eae3f4e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:19:49.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulNemB4gvmpu6XuRIfH7M+x/g/IbP1PnRRmd2fwpwLYyYDTYN8FZYpKynlnvIEx9yUE16lw48IRB6THzJ85SOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6325

Hi Ilpo,

On 12/12/2024 22:17, Ilpo Järvinen wrote:
> On Thu, 12 Dec 2024, Shyam Sundar S K wrote:
>> On 12/12/2024 21:16, Mario Limonciello wrote:
>>> On 12/12/2024 09:19, Shyam Sundar S K wrote:
>>>> From: Basavaraj Natikar <basavaraj.natikar@amd.com>
>>>>
>>>> Add support to export device operating states, such as laptop
>>>> placement,
>>>> platform types and propagate this data to AMD PMF driver for use in
>>>> actions.
>>>>
>>>> To retrieve the device operating states data, SRA sensor support
>>>> need to
>>>> be enabled in AMD SFH driver. So add support to enable the SRA sensor.
>>>>
>>>> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>> Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
>>>
>>> When you send someone else's patch but don't change it you are still
>>> supposed to add your "own" S-o-b.
>>
>> ah! Thanks. I missed to add it.
>>
>>>
>>> I have two small nits below.
>>>
>>
>> Sure, but I have a question to Hans and Ilpo
>>
>> while we address the remarks what should be approach for merging this
>> series? Should it go via pdx86 tree or hid because patch 2/2 is
>> dependent of 1/2.
> 
> Hi,
> 
> Given pdx86 pmf driver gets much more changes overall, it would seem 
> better to merge the series through pdx86 tree. But I also want to mention 
> that generally it's also possible to make requests on merge path as the 
> submitter of the series, in particular, it is good to take into account
> if you know there are patches that might conflict with the changes 
> (within this kernel cycle) to make the merge window less problematic for 
> maintainers.
> 
> [In some cases it's possible to create an immutable branch which can be 
> merged by two (or more) subsystems but I don't think it provides added 
> value here given how low traffic amd-sfh-hid is.]
> 

Thank you. I have sent out v2 and added additional notes to the
cover-letter.

Thanks,
Shyam

