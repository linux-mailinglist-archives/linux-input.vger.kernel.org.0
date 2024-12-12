Return-Path: <linux-input+bounces-8517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454DE9EED88
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86CB28A276
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39F62253E0;
	Thu, 12 Dec 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TtytnSfi"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42000222D6F;
	Thu, 12 Dec 2024 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018391; cv=fail; b=q8kwajk+aO/zBeK1P6TaX4OLd9NMO6yQOTpodM2OftF90eInKNmFEH/qDkgoXSfaogUdxnL6KbJw7fYzxsUSWNrDmDmMJmy/DKwkSqZInPp7hlWMgKFvKOwV9ldIOTQSudmkRxtQeLN8KGtsq2VkjcL331GTkKGdt9QNRJIefkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018391; c=relaxed/simple;
	bh=6ux3Xx5/Gy0vF0RzWHM/2Cv8ddNBmm3Az5O++80weaw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lu5ryZDZfyS5fUHwWkwFuA6AeRYTjMSb+7uOiancaqVAcjl3Qy+F8++DW/Dfer2TUWscT8vVP2ltYfqOWOtCh9KkLxPAjXr6fbfAZuDmu4yPg33dlG84Vu8fCC0q6s9l/V98axo5/tFgoNacSiducZqpXtBHrlEvHr+FoOKLcxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TtytnSfi; arc=fail smtp.client-ip=40.107.100.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFoabyC02UcaKiRJtlM4nTmIgVr4IgxdZKH5zEvpr8XOLDlp9Ee4ORV6iH25eKwol2ID6nVn3gqK4GxVAQEn5FWoT9UonRxi5c0i+ycd3UeNxf/QYiX3GTIKhhf5+Ma/3jR2xuYPwBDW3na1AkjjgPlaDVpzunaUaPL7VaJFnvij+KD4hb8BT67pM1NiDzpsEv8CvDx5xdNU6GjpfdtNbxAAvJn4ggg7UcItWkskY7T5mIiC+hn1Qh3uM/8B4mxirqwOsiyX2MP0X9K1d23wOOKmyFWKBR0yV/hYT3+COnS3dtMxxeCB0dIAgmjBUHBoHuluU16i7Y4cKRp3wom89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho9KoA3gwz/jnxPHRDl7A4axpBpcuw5WUVYW3RITEik=;
 b=qyuYsK2JYyiS6PsJa42nWYl8FVpH9pni3HclewIFpv6TWRD9zb3tAPKGSaL56afoVUAFoZjQb5DsgF3KoIjQklkdpJX7LQ+SggMyEU9rlYW9ocHHlyRCi6r+1St0DALeqDD8/j5GgqTp8sKRGygdV98oZdGCj8/v3Ihc/zvMKRhzWL26OtYl5G+Y90byeRzUKoSYgjx6+hqGD4DczENm2RDnuz1sS2Foj8r0sRuiX5JE4JHWJy51yRI++0ocj7q0DiWVMU6OgMEsWNR5b3H6aj3YqQ0ML0DmrxPg6hUXfijHIEbgqiBx5+mp3F1/7nHyBx+H5EzQELvuuplequpEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho9KoA3gwz/jnxPHRDl7A4axpBpcuw5WUVYW3RITEik=;
 b=TtytnSfi3KmCxubXwpklkjzN9Ic09yIkfv1XRLg0kyrZhuiLEE84n9qYEhH/WMKr6J+uiXRNZuk567m6Bq8VJTGNPqJP0XioENVTFL2vESJcJrRWljTmRAEgQZwCVGjwBnHkUmWNiCcA8FxECouOM+tSaDql3upbrPKj6yqV6WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7727.namprd12.prod.outlook.com (2603:10b6:8:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 15:46:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 15:46:20 +0000
Message-ID: <1b3dacc1-37bd-49cc-addc-628e843a5af8@amd.com>
Date: Thu, 12 Dec 2024 09:46:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] HID: amd_sfh: Add support to export device operating
 states
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: eb245f29-9284-41bb-c8e1-08dd1ac41f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkFWV0QrcnFCNVpIbGtHYUFjS1B6b1Nnckp6TTZyRi9jb1h0VHBDZjV0Mjgw?=
 =?utf-8?B?K2oyMnhYR2ZmNXpJaFVZd0ttT2ttR1pOY0xKV2M2WStUMlFNUDByRFUvOExB?=
 =?utf-8?B?VXkrTUQ4eC9hbGhaVW9KK2RHV1ZQcCtpMU14UzQrQmQwRkdZQ3Zjd01jWWM3?=
 =?utf-8?B?YzdHNWdWWm5OY0lQeFQ4V29vUW95a1N1am1wVG1TcmxWVE5UVWlrNy9HcHVS?=
 =?utf-8?B?ZCtvejhjc3NjN0NRdWdtUVpBam5uMkYvc1U5TUEvN0RDSmk4QlYwM3gvNWVz?=
 =?utf-8?B?bHlLd2s5NU52WC94YlVhdG5mNlhPbDQrYVl2bDA4bExleGxYTVZBdWNVbWJL?=
 =?utf-8?B?SDBocUdHRExpQWFWUXQvbkxJTFFzTEMvcnZMcnp2SnFrV3NRSTdoNGNEbFkv?=
 =?utf-8?B?TGtCM3hvU0hqNUlkWms4aVBrejJrV2d3bDNQUmYzdEdlU2ZnNytTZm5OQm1N?=
 =?utf-8?B?akNtWkFXNFMvQVdHempWazJxUXZNRnMyUVltTTBXOGN3VUpzTFJGSXVMdUdp?=
 =?utf-8?B?TldaajkxTEpVd1h0ZlFWVzRwOW4wc2lGblZGWDlGVlc1QU1QY3RsUlhab0dI?=
 =?utf-8?B?Ri9xMFc4VGlXbXlLVHhLWG83ZU9ZT25pNWw3c1YxalAxSTJhRFlIVHFOS0x4?=
 =?utf-8?B?Q0UvNWVFKzdFVDM5MFczTjhGYTdaMmlZMm1OVG1aRTRUZVozSzJ2UEZDU2p3?=
 =?utf-8?B?YU00K2ptNG1wQ0dEbXNZalJUZnZwdlZQTzcvYmRMQ1Nzb0pjbVc5WUJ3bGRM?=
 =?utf-8?B?dlBRQmtSRDlPRHFheGZ4b1N4SHhsajFiWkcyMm15Uk5VNy9FcU9rbkRnMUZM?=
 =?utf-8?B?Z0NoQjdDRG1XNFlyaitKbC9QVnMyd2tjTHphT1NiN2I3aXkwRHlSdnZheTJm?=
 =?utf-8?B?UktUSlUrS0xIZ3dpN3I1eXpZbU81UHBIVE1TdmhrVWphT0xXRWtRNENsNXBE?=
 =?utf-8?B?NzBscWxZS2NxTnhzNHNWV3ovakxON0xxYWorUVQ4WHMrUHhBdWJIR2pocTNu?=
 =?utf-8?B?L2FEZXAzazdqREg2K295ZFBuUnJoWG9HeXo1N0xJdEZRMzhJYlVnYlBJZHNG?=
 =?utf-8?B?emZVTmpmVGFIeVlWb29hOVhjSWc0RnEwL3VXYnJkL3pnL1RPSXloQ0hUdEdE?=
 =?utf-8?B?MFNucjZjOUhOT29JVUFoVGVocnI5V0draWpBaUJLNG1jQXR3K2xYdnJ4MFc0?=
 =?utf-8?B?WFh1YllrZG1jeVZ1MVFPQzJYdTAzNGVNbFpvVWozR3UraUdtalFPbDVyMmlx?=
 =?utf-8?B?MC9CMEhQejdpL1RkamJMVzl6Q25HaUdUd3diTjY1MitwVG9PZlpvOGVISnVU?=
 =?utf-8?B?bHVzTHdQV21FMnVUV2EwRUZadm9FNjl2U3lzTk5hQjVsaE5ZeFBVU2RDOGZl?=
 =?utf-8?B?RFc4amdRUGRXU0NIdDV6T1NmV0xjd3g3bnFaSmlYVjgyMWR3N0RyVkhyVHB2?=
 =?utf-8?B?TVVEN0gxSVhRcEdmMkV4UGtvRHNuTmwxSGY1RFYyYThUcmx5d2FybjhFU2hu?=
 =?utf-8?B?L1pEdWlKTzllVWNENXVjM0RhdHBrRDNiOXF5ZmlRWEN5WGNXamVXdG5uVDk3?=
 =?utf-8?B?T25KbktCZkVzUHZydmhVclFBcVcwR0dKV2VzdDZNS1NMV2YyMGxzcUlJSFo3?=
 =?utf-8?B?eXZFYzRkNU5FaHVqVTFVZEZEYmlDOEVieWZqaFZ6SVBrdVkrSzlhOStHNW01?=
 =?utf-8?B?TVRWNHVtUSsrNVhJekNtdHhMdy9DT0NDcGlIdmZORUJaT0w2a2lweTNlYjdK?=
 =?utf-8?B?U01JbEtJNmYveDBJM25ZeTA4RHRLTkxwd0UrMVZ4TVRqbWtieEtFRVFrV1BK?=
 =?utf-8?B?YXFaSXVwUU1tWWk4UEpRdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2FzRmdGMnhXMExyYUVoSmtWNi9lSDJ4UUJiOVRKQW1TdzdVUEZrZlpmaHpV?=
 =?utf-8?B?S3FQV3VHMGdaZ3lBUzlOUzVjSXVadmtNQ3Yvc0x2OFppQU5XK3ZwWFJiQ0xy?=
 =?utf-8?B?bWFaWEI2enFKdkVjY05tTkFjNFBLSWl4ajN6OTk5VkxCZTh0WXJnakxEWDNF?=
 =?utf-8?B?NzgvV3JMUk1rUFZnMi9wZHkzQ1R3WWNNN1RQR0VteWVqd1JMSmU3RXZWQWNt?=
 =?utf-8?B?dHVlQU5UUkozNHZyV0JnQUxmYzYxRzBqakI1b1haSzhyZmpXVHNsOE9GOG4z?=
 =?utf-8?B?SlExZFp1SEZZK3QrSXcrYkRGYWc4UHR3SWYyTWR6cUhOK0padm5OZDA4akZi?=
 =?utf-8?B?cHZIZjFPNmVpSy84Q1dEUEI5cUJFL3UzUEpIbUZCVDRUeHdXaVNvSjhZNUZM?=
 =?utf-8?B?RnN2NnQ3amowcVdySUFEbENhYzR3YzQwLy9FRVAvWExuenp6b09YT3lhZ1Iv?=
 =?utf-8?B?T0x1Q1RSU0dpRTlCbWFCQWVJTmpEY2ROem1WSERNMHZMNHdMb2tVcDNla2Rw?=
 =?utf-8?B?UE5EVVRyKy9FQlhLZkdmSlF6a0JCd09RenpOcThnWjU4eEs4dlk3UFZHb0FZ?=
 =?utf-8?B?c1I2Z1NJeVF1bnNFQ0dzT2VOTmoxSE5ZK1JkcW1hOEQrWVNNOVlVYU9NVEFO?=
 =?utf-8?B?aW1LcUIzODR3Q0RmeFJna1VYaHIzQVpYb0hmNGR1M3lGS1pVc2JDS29ncjFh?=
 =?utf-8?B?czVDQ05NdzUyajlVaURIV1ZCeksxNThTN1A1WmxOYm1tUVRUT3dpVGk2SEJi?=
 =?utf-8?B?K2s5TUJ2V3dEY1I1VlRyQlZEZkFhdndmZ0VxNDV6bzhvcXNpYUhSNmw0Q3NO?=
 =?utf-8?B?RlE1RUJPL2wvbEdHSk5tNG5jaFAra1VwSElPYUVENDlrYU03VFVTQzVqZks5?=
 =?utf-8?B?cnU0TEovcUNCdnByM0YzNnN3MFhlUXo0eUYyc3hPaXNUenVyTlFYVDZjaXVX?=
 =?utf-8?B?UWJFbks2d21mTzBTREwxcm0vK1Q0TnV3bmpqb05GbC9XTlJaU2RnSzRCVzZv?=
 =?utf-8?B?OWFaQnN1Q0JVdCtyVFFkQU1SOTFUcHFVanBTeng2Q3NIV0tDT01kVkx4aWRT?=
 =?utf-8?B?b3gzVEhnMnF1WmJ1SHNkNE1jMG56V0lOUDR1c1AxMEFPRGhCbEdPdndqcGhG?=
 =?utf-8?B?UFUzcUp2NHRPbnRvc1FhdlVUblN1aCs3Y3E2aWJNbHhzNWRZZXhzbDZIcVJV?=
 =?utf-8?B?VFpqUG9YQ0xsUllHcTE5TG9iZ0daaDVhdmFqWmVoNGE1TDdKMVQ0QmZxR1lI?=
 =?utf-8?B?dTZhSld6VlhNazJ6NWNwdGdLOENBMTZ6NkdQMWlVT2dqODluczVpUTBTNEFB?=
 =?utf-8?B?MWRhS3dHNjJ1aHhNblJDNDMwK0FvbzF1USszeHZxaFpsT0lTaWtIVU1TcTdG?=
 =?utf-8?B?dG54REhZWkpGS0ZqWG9uTUdNSW5SbExZVkg3eEIvM1hXa1ZSemlqV3Bsa2h5?=
 =?utf-8?B?V01BZzE4cXNuemkyMmdCUkpXR2N2ZGZsYi85TTR1MDFGNlBYUkZmenRiZzVE?=
 =?utf-8?B?Vmt3c0VFMlVlaFRjN2ZDWW1kSk5CaElkTU9ZQU5BMG92SmhIcisxUlpWWWxC?=
 =?utf-8?B?R2hDV1NNV0wwbTdZNThIUFNCYmFmZ2Y0azZxWkxPaG9SR3Z5RXBML1FNNWV3?=
 =?utf-8?B?RW5zUW54NnpyMmFmLzFDQ0Z0bG1SNmpqR0JsVldmdUplL2V2N2xCdCtDaS94?=
 =?utf-8?B?Vmp4bkJNenNrQ3JNY21xV05KYmI0dHE1RTg3NktQU01UMHFoTDR2WXpyaFQ4?=
 =?utf-8?B?SUc3Wkk4cTVXTUpwVGkxVUJudU0raG5tTFpHR3JBakpVcWROYWFpYklkbFVY?=
 =?utf-8?B?a0s1VFIyZWk2R1ZJR0o3eHhXWHNjUWRuRlkwU1VTTHdYUEpLUWNZbEwxYzNk?=
 =?utf-8?B?bWlDZUhPMEF5Qm41TWhpVjNkekdqbmVrY3EvUGNZdVJyUjRPUWtLb1F5azdw?=
 =?utf-8?B?dXVuQ1haYlYvc2ZTekJhaXRsSzJEOU1rZVExL3BMR20rQWlVcmNmVVFQS3ow?=
 =?utf-8?B?SWtzTm83TTNCcDJPQzJsblFZckllOTcyQm95YzVPK0FtYzdnVEQzeTFtMHFY?=
 =?utf-8?B?S0Qxb0lCVkQvRlNpYkJzSFlnUE11ckJ3ZituZFlaeWZ2NVIzOWFxYko4bkFE?=
 =?utf-8?Q?zKmSUqDAzCYeS4TOA9YkR+B0D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb245f29-9284-41bb-c8e1-08dd1ac41f6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:46:20.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fdv7/WOdiGud3R82CCmbIz2CO7UPVpOyTTdjnV27RfvZm3IOcXWFvclpStWcAzdGtKRyrHAkkiyZkY6WodIcpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7727

On 12/12/2024 09:19, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <basavaraj.natikar@amd.com>
> 
> Add support to export device operating states, such as laptop placement,
> platform types and propagate this data to AMD PMF driver for use in
> actions.
> 
> To retrieve the device operating states data, SRA sensor support need to
> be enabled in AMD SFH driver. So add support to enable the SRA sensor.
> 
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>

When you send someone else's patch but don't change it you are still 
supposed to add your "own" S-o-b.

I have two small nits below.

> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 35 +++++++++++++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 20 +++++++++++
>   include/linux/amd-pmf-io.h                    | 15 ++++++++
>   5 files changed, 93 insertions(+)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index e5620d7db569..799b8686a88a 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -43,6 +43,7 @@ struct amd_mp2_sensor_info {
>   struct sfh_dev_status {
>   	bool is_hpd_present;
>   	bool is_als_present;
> +	bool is_sra_present;
>   };
>   
>   struct amd_mp2_dev {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index db36d87d5634..03c028f1aab4 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -30,6 +30,7 @@ static int amd_sfh_get_sensor_num(struct amd_mp2_dev *mp2, u8 *sensor_id)
>   		case ACCEL_IDX:
>   		case GYRO_IDX:
>   		case MAG_IDX:
> +		case SRA_IDX:
>   		case ALS_IDX:
>   		case HPD_IDX:
>   			if (BIT(i) & slist->sl.sensors)
> @@ -58,6 +59,8 @@ static const char *get_sensor_name(int idx)
>   		return "gyroscope";
>   	case MAG_IDX:
>   		return "magnetometer";
> +	case SRA_IDX:
> +		return "SRA";
>   	case ALS_IDX:
>   		return "ALS";
>   	case HPD_IDX:
> @@ -130,6 +133,23 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
>   		cl_data->sensor_sts[i] = SENSOR_DISABLED;
> +
> +		if (cl_data->num_hid_devices == 1 && cl_data->sensor_idx[0] == SRA_IDX)
> +			break;
> +
> +		if (cl_data->sensor_idx[i] == SRA_IDX) {
> +			info.sensor_idx = cl_data->sensor_idx[i];
> +			writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
> +			mp2_ops->start(privdata, info);
> +			status = amd_sfh_wait_for_response
> +				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
> +
> +			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
> +			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
> +				privdata->dev_en.is_sra_present = true;
> +			continue;
> +		}
> +
>   		cl_data->sensor_requested_cnt[i] = 0;
>   		cl_data->cur_hid_dev = i;
>   		cl_idx = cl_data->sensor_idx[i];
> @@ -181,6 +201,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   	}
>   
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
> +		if (cl_data->sensor_idx[i] == SRA_IDX)
> +			continue;
>   		cl_data->cur_hid_dev = i;
>   		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>   			cl_data->is_any_sensor_enabled = true;
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4676f060da26..b4c0d96ab152 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -87,6 +87,38 @@ void sfh_interface_init(struct amd_mp2_dev *mp2)
>   	emp2 = mp2;
>   }
>   
> +static int amd_sfh_mode_info(u32 *platform_type, u32 *laptop_placement)
> +{
> +	struct sfh_op_mode mode;
> +
> +	if (!platform_type || !laptop_placement)
> +		return -EINVAL;
> +
> +	if (!emp2 || !emp2->dev_en.is_sra_present)
> +		return -ENODEV;
> +
> +	mode.val = readl(emp2->mmio + amd_get_c2p_val(emp2, 3));
> +
> +	*platform_type = mode.op_mode.devicemode;
> +
> +	if (mode.op_mode.ontablestate == 1)
> +		*laptop_placement = ON_TABLE;
> +	else if (mode.op_mode.ontablestate == 2)
> +		*laptop_placement = ON_LAP_MOTION;
> +	else if (mode.op_mode.inbagstate == 1)
> +		*laptop_placement = IN_BAG;
> +	else if (mode.op_mode.outbagstate == 1)
> +		*laptop_placement = OUT_OF_BAG;
> +	else if (mode.op_mode.ontablestate == 0 || mode.op_mode.inbagstate == 0 ||
> +		 mode.op_mode.outbagstate == 0)
> +		*laptop_placement = LP_UNKNOWN;
> +	else if (mode.op_mode.ontablestate == 3 || mode.op_mode.inbagstate == 3 ||
> +		 mode.op_mode.outbagstate == 3)
> +		*laptop_placement = LP_UNDEFINED;

What do you think of doing a pr_warn_once() when you end up with an 
undefined placement?  This could help point out that the driver needs to 
be changed for a newly created mode that the hardware detected.

> +
> +	return 0;
> +}
> +
>   static int amd_sfh_hpd_info(u8 *user_present)
>   {
>   	struct hpd_status hpdstatus;
> @@ -131,6 +163,9 @@ int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
>   			return amd_sfh_hpd_info(&sfh_info->user_present);
>   		case MT_ALS:
>   			return amd_sfh_als_info(&sfh_info->ambient_light);
> +		case MT_SRA:
> +			return amd_sfh_mode_info(&sfh_info->platform_type,
> +						 &sfh_info->laptop_placement);
>   		}
>   	}
>   	return -EINVAL;
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 2c211d28764d..f7eb2539bccc 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -22,6 +22,7 @@ enum sensor_index {
>   	ACCEL_IDX,
>   	GYRO_IDX,
>   	MAG_IDX,
> +	SRA_IDX,
>   	ALS_IDX = 4,
>   	HPD_IDX = 5,

IIRC in C enums start at 0 right?  So ALS_IDX and HPD_IDX don't need 
explicit assingments anymore.

>   	MAX_IDX = 15,
> @@ -164,6 +165,25 @@ struct hpd_status {
>   	};
>   };
>   
> +struct sfh_op_mode {
> +	union {
> +		u32 val;
> +		struct {
> +			u32 mode		: 3;
> +			u32 lidstatus		: 1;
> +			u32 angle		: 10;
> +			u32 inbagstatedbg	: 2;
> +			u32 ontablestate	: 2;
> +			u32 inbagstate		: 2;
> +			u32 outbagstate		: 2;
> +			u32 inbagmlcstate	: 1;
> +			u32 powerstate		: 2;
> +			u32 data		: 3;
> +			u32 devicemode		: 4;
> +		} op_mode;
> +	};
> +};
> +
>   void sfh_interface_init(struct amd_mp2_dev *mp2);
>   void sfh_deinit_emp2(void);
>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index b4f818205216..01f2b12c56a6 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -18,10 +18,12 @@
>    * enum sfh_message_type - Query the SFH message type
>    * @MT_HPD: Message ID to know the Human presence info from MP2 FW
>    * @MT_ALS: Message ID to know the Ambient light info from MP2 FW
> + * @MT_SRA: Message ID to know the SRA data from MP2 FW
>    */
>   enum sfh_message_type {
>   	MT_HPD,
>   	MT_ALS,
> +	MT_SRA,
>   };
>   
>   /**
> @@ -40,10 +42,23 @@ enum sfh_hpd_info {
>    * struct amd_sfh_info - get HPD sensor info from MP2 FW
>    * @ambient_light: Populates the ambient light information
>    * @user_present: Populates the user presence information
> + * @platform_type: Operating modes (clmashell, flat, tent, etc.)
> + * @laptop_placement: Device states (ontable, onlap, outbag)
>    */
>   struct amd_sfh_info {
>   	u32 ambient_light;
>   	u8 user_present;
> +	u32 platform_type;
> +	u32 laptop_placement;
> +};
> +
> +enum laptop_placement {
> +	LP_UNKNOWN = 0,
> +	ON_TABLE,
> +	ON_LAP_MOTION,
> +	IN_BAG,
> +	OUT_OF_BAG,
> +	LP_UNDEFINED,
>   };
>   
>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);


