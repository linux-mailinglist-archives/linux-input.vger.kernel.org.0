Return-Path: <linux-input+bounces-7479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19259A013B
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 08:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C57401C22CC4
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 06:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BF060B8A;
	Wed, 16 Oct 2024 06:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW8UAMRZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC618C331
	for <linux-input@vger.kernel.org>; Wed, 16 Oct 2024 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059502; cv=fail; b=Ol5uIvjA2Qei5LiT0HH2oAJpzEu+HXauKiN5PzzQyW5YXFGETVWHbzv91MtwIuBLKE/xVP2VZNoDmQJ+WD39+EW/7y50k5yqFHQNBOkQRPG8suOICI1RVK1YrEInZWKDR7KQTqLKuAceXgoJKqMSu8PQUkqcCF95Mh4U5dptjk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059502; c=relaxed/simple;
	bh=CXn1f+qBfCch0LiKp+ZDDp5byFSr6RdSzX7ICv3kSmM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NScY+xp4auzLhn+6eN1accKnohoyiRAum5b4R50yu4RhuEuUirC5Hypy1U3S4eHSBbbebZLYrxotpgB4C2Mmf9QXCLY17/UczbPgX3aly38Wo/zIINfkPxEbxGftIxa8YByMFf/ZO/0LiX3682P/lSW85oTwKIW1Ed5VLgr5kUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW8UAMRZ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729059499; x=1760595499;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=CXn1f+qBfCch0LiKp+ZDDp5byFSr6RdSzX7ICv3kSmM=;
  b=EW8UAMRZvqW7QLiX7fz0ODEbk99Xj8gp03hVrQEj3zWWggkZgx2/8QwY
   9nxESbqQK9ifB5Crv369C5oGi/9eRS8w7dZi5Ks2hqkINjeAGMoMWMQkL
   b5Nff6djFbQ3cWnDhNmwz7rW8TKRP8QK5NeCDVenXUAZEWlMO8JuDgEo9
   m+OEjXqWZ0cDtm0slkzdNrN8/JLKyJCwHj8GsVWhZhqd+Wlm+bb0ytCme
   aM/k/5OUz6c1QlaoRjArWMb3AjNyaQC0UJkmb57PcGxvqREHhjlXZpYXX
   IVDoOiFS94TWfvdo8SLU+gzlOWKa5mBxcie0aZIAyLnV7ABoDQIXTANe9
   A==;
X-CSE-ConnectionGUID: NoPP+EThRkmtxYUQQBQtEQ==
X-CSE-MsgGUID: 2jnMvj5+TROYxbmFRcTTPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39122931"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="39122931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 23:18:18 -0700
X-CSE-ConnectionGUID: VhEGtrMoSiyRzlwZbpj8sQ==
X-CSE-MsgGUID: QZYcff2iRJmspvln4YSVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78138873"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Oct 2024 23:18:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 23:18:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 23:18:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 23:18:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 23:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVG88CYw1gFLf/J7Zyg+TY0XsOdjXYghWmYCviyvUlDDiSAHSpPaqMUgN3PoKJm31fA9i2x4GiGmZX17DtvZNxBQJ0aPEkcCvEBT1gVx8KCqMCLoFnw1golTGMjCF6ovuWFtsfXnc2nKsM3ASjUYLifRFgywBkQ6AKV49zgEHjVlCAvT++YRUeQnCqyaN3y86wtMB2/xacyoFDXqjaguA6faJ+xx7PDiKNCZF74yr3yShK/de+bt+/5SMuL+f/i9gkvHioy1W62Ls6iQl6FJsWwsmJcRoKZ+oJbPM2sTRS95j7UK2BhuIzKG0i66eGb6F/A2vka5uTPhpUkgPstYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYyI5vXJxP3sXNMs6z89fY/cfOXCgDmIMeVAfsjVCZE=;
 b=iHjLgOC1Svz/7azT6rh9JTNKafN9fTYxSiXRarPt/lRi9ZnwoFeS+o3NVVvZacGquk94CyqWuXGUPMGzM9ACaPJRT8qkKov0/jOxFw3Vx1e/M9nkVyL1bEIXNPvSDChaUnHxwzBUgpZNIUk6PJ8rI+yBOKSII4pjvZ1HuRVQ8OpL9FZGVdJv5aiAxr9CChpiTCVaGHOuJOzlod36nrgVkjUVQyTl6Aj3/MO5+6FPoN7x80YHX7Mjz4xcrdY32yR0Sj7hr6dAsTI0Dup2e3nmoKIudjSrbhAZxQ1cuP1dhgElTwz3P+64wK6l2UoogqzU2dR1gdUfW6dQQi7idKJR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 06:18:14 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 06:18:14 +0000
Date: Wed, 16 Oct 2024 14:18:04 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Benjamin Tissoires
	<bentiss@kernel.org>, <linux-input@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [HID]  61595012f2: BUG:kernel_hang_in_boot_stage
Message-ID: <202410161448.b4308a5e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: KL1PR0401CA0023.apcprd04.prod.outlook.com
 (2603:1096:820:e::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bafdf5-a3cf-43aa-dbd2-08dcedaa50fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1hoaXH8WBeSbsBjyHJtgZdlcpyS75SEvv/7Wkp4AZKF6VDVYvx/UEZL0pSaa?=
 =?us-ascii?Q?wU1Y5ywTvqhutoYBp2sSiZHLuIEVbWF9MzpQtUxzLS1EmFcNFVdaN+FYmBhQ?=
 =?us-ascii?Q?wdQr8Q3Exai4KHmGY95rmX8QAPm8iS92UvtRzZ7gTaluS1iL6BwUO+QSaCSn?=
 =?us-ascii?Q?9z60LwDhbMn7f2qd75VbDLjzFwN6ug+ZvCtebL9l6fXhrtFYEERIZgDcElPj?=
 =?us-ascii?Q?NUzNpsoXPyQz4W05nOJKQBoCZIPf+mgdyA24IR01jT/XmzC82FGjvnhCugDr?=
 =?us-ascii?Q?NMro2Pwmnfz99j+AaJaS0b49vOng3Mtu7m4yc0GQzi45ZYq+W3dLXX6LFtfK?=
 =?us-ascii?Q?oinLrPCdSlf4grhL9iITrHquKlm4yRse1bDrCxavFKkZwt2NJZMC6Rs2IJx+?=
 =?us-ascii?Q?ecJqEWw5sjZMjsys+wwvoKbA7cUcmREx5EfkfSDMIgFnaBzFMJ5uiiD2qv7F?=
 =?us-ascii?Q?urEWfktX8xu20YzCXBXIGEHsIdPfs2fmFFiQIz81mLczVF2fSL5L9KVpoL1k?=
 =?us-ascii?Q?8fMrQLNhDfEcdbhuSrfGZ3YPFttWl8BbLrMZVx4zprsrb3RwTEVX8JNPGKaP?=
 =?us-ascii?Q?r4uKDHieoSPWUiwVUCmTAGDJf7/RTvMMyf5uC7RniMRVjvTC4bNf6mi+az1y?=
 =?us-ascii?Q?+4TTbu+9F5UL1sRfrqwqUseKEirkIlAgt3sbGXrtyFDZ6XoMjTS01dSnddYd?=
 =?us-ascii?Q?q4J2M/7xjkBVOUz3tHrqIn2fTQ/S46MWQzXyO8RVueVETaVNuomq1uWyjD1P?=
 =?us-ascii?Q?6L32jZNB5poBTMoMRRI3VLPE9HbzG7SRyC1+dw9sVjtdAiPoZLbFkawZkvhF?=
 =?us-ascii?Q?JpxkoX2q2XnRsbeJfONi3gaRdnoIkqd4jA54kfqBohIZ1xemvB62vmcIDEe5?=
 =?us-ascii?Q?QESiv+dcwLpiw0HbHzj8X+5nBP5hH5PqMPJdEuMjo1iMIqgy8pMZCatXq4Eg?=
 =?us-ascii?Q?Fk9AwthXA/LcYPUcDLJKkVeKEnARmnXxvruD9ZYkx9q63CJJn2+arYtPmdcP?=
 =?us-ascii?Q?TeNHKnTUHalk6v8F+RH1qkBcIQKFdcMt3hkM0iYjYE+ZmhVSP689QKV4VLmb?=
 =?us-ascii?Q?erKIcgjPoluSzocSyXd8OwORLFrlw1oLXpbOKRF0lSqzIad7SEgmwi40Hwf/?=
 =?us-ascii?Q?isSeqSVxvO7t1a7tCKtovdAGjjhyM/rDLUdGlsJUt5avD/IxCeB2aQUrhWix?=
 =?us-ascii?Q?udm39YGUGjo2eE2/D31rytCR6IwA2pOcBM8xFeM7Ra2/ijUXnUOcvFtaSvk?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7+Ge2D7Mo0ql/ynPjSFoG+oOlkOFeeJh0jIA6a+InPDJpz7IC66tDCuSa/BS?=
 =?us-ascii?Q?2amp5buVTPisk5gREV/O46WjDvaKSAkV/O5T4cS6XcQxGcU94K8iZNNDueab?=
 =?us-ascii?Q?WPUh4DT1Q3KZpJCEksUo6XdeGzBLpSJ/0e61T7RHe5nz1fr1R3iJ0aQE+925?=
 =?us-ascii?Q?5qklSa0jja6T6lOjbCHEPS9gaqOTbFF42IrXqqMmZiadmwIdBOAc/wcunsZl?=
 =?us-ascii?Q?ZFQgkjXZljYYRvYe2pw0ejDrxPr+MIM9LMhM9NxTqgqk26gzlIcvZf2T2LxD?=
 =?us-ascii?Q?V1itk6Xwba08GDfu/XhawgtxzDx4/x4cpYNgUYFShE69WGEgeHRUCWI9J0lu?=
 =?us-ascii?Q?zdKeG9H15M7EAoreLHeIa+iJ5uAZIDjMRZTHaO2l0aGfNIy4N4ujcD8zH+Gz?=
 =?us-ascii?Q?vv/eBSIz9Oam90dcwfDYNpRPZe7ecief/ogoqcPipteyrZQ2VIrte/+HQUlC?=
 =?us-ascii?Q?UqI1H15FI5auFYMUYARnB7S2LVxPor2hUWMKdRIlW2E/hukunBEdj8eGjVry?=
 =?us-ascii?Q?YZouB6fLnBzwjI71oIBNlLFF2v8VJNbPZU6RC1Tqt2VTlIABApuN101Omdgf?=
 =?us-ascii?Q?x4cFhmAFGITHAgcm1Ggx6r3MmDDbB3PzJ7EktIXJmNxyY3hzXl52y2p2EuA0?=
 =?us-ascii?Q?5n8OaorNtpqzRHN+ObkJ3PdL044Xa+SgDB3BE8LTSXAndCZYwcml8gm3njNJ?=
 =?us-ascii?Q?RkwonweECX+NmlYnWbvVMUCnC9DtgSxP5qE9oGGAv+p5IeTREPntc0XFuuFg?=
 =?us-ascii?Q?HQPHTT2FkLsTCARWfy9DFuZkp6rcvgExUTTzKxxF2PytCwMtLlFKqyi5AYgo?=
 =?us-ascii?Q?QpEYr8VMqXsI/VmOZxV7de86M/5vlhoofrsPjwGHnwTQX7RbrVCJo+J3VxXG?=
 =?us-ascii?Q?/WCJe4H6ucNPrtb3qBhWiUmCGRulMT4T6R0wzvRk1hA8yW8KZhgynmRD06wh?=
 =?us-ascii?Q?ibu5fq0eRMWWKrLbPlkIAzhl/M5CWVkgTHuB1TC9wTpFwsM6GKdCMFdKA/jm?=
 =?us-ascii?Q?tUH5gwPrPe6dlCGr7Tpe35aVLq8/9QlIBk2YQwdok2F/FkES3KS8nUKqCrGA?=
 =?us-ascii?Q?Zt/Gc+i92+KY1hiOKeK5FTTJM5Fwy6qfP+mtzQdR/byk+WoVVvi0kkmA8wNL?=
 =?us-ascii?Q?BOTQe3rLssGXOmRUgQidBf493lRkWFSwiJH403Rbh66zxPIqGZ8SWmbQEAkR?=
 =?us-ascii?Q?+TaqdcvX3MpiI0om6pGIcg76niHI5vHnePzo40Rtbk+vwYNfB5W5WlwOKGqr?=
 =?us-ascii?Q?8/IJQ2DUTSTtP/RH8a1OkrNNruSNzRagWUSC/wtbc+Xs9uDMRlXD3lrBveh3?=
 =?us-ascii?Q?8wec2BUgxpDOPkGbnlMJ6ofImSFX/4Vc08c4h2tMMXoBZtmkWZPfle6CfLq7?=
 =?us-ascii?Q?b/LF9pGFliVx1dx8rsjIVPeIirHIbTv9YymXYci4u6bjvzLSd70hMiqWbe1S?=
 =?us-ascii?Q?XvJzr7lL/1P3SHcntf5uFkDgVAUR3VvDs9okXtRS+MNnamQ2h0U7SVO05dP2?=
 =?us-ascii?Q?/voon57/qc8WmmdFjLGqkm0GMBI13yGqorIPXfo6A5QHrp759cDOISQJw5VD?=
 =?us-ascii?Q?Na8Lb1NBiOCNiOsyyK66edhj1q4faUyZP87wvWPVCKc6sc5C+kRZrKyAiYYc?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bafdf5-a3cf-43aa-dbd2-08dcedaa50fe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 06:18:14.0199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g5hJ0EbDqODQtlvo33RppkaDtgzCwD2iHv7vasYjw/gWG5vhZsXsZ4XroD3QsukXhfPTgGLs4kBN3gO0/FWOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_hang_in_boot_stage" on:

commit: 61595012f28036a58293df5a2ab75f80ca15c327 ("HID: simplify code in fe=
tch_item()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master d61a00525464bfc5fe92c6ad713350988e492b88]

in testcase: boot

config: x86_64-randconfig-076-20241010
compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410161448.b4308a5e-oliver.sang@=
intel.com


(
there is not many clue in below dmesg, we tried to rebuild kernel and rerun
tests more, the issue seems quite persistent and clean on parent

f23aa4c0761a70bf 61595012f28036a58293df5a2ab
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :100        100%         100:100   dmesg.BUG:kernel_hang_in_boot=
_stage

another thing is the config is a randconfig which is uploaded to [1]
we also tried some config based on rhel-8.3, cannot reprodue the issue

if you want us to test some debug patch, please let us know. thanks!
)



[    1.070840][    T0] WARNING: WARNING: Bad or missing .orc_unwind table. =
 Disabling unwinder.
[    1.070904][    T0] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    1.072519][    T0] pcpu-alloc: [0] 0
[    1.072946][    T0] Kernel command line: ip=3D::::vm-meta-14::dhcp root=
=3D/dev/ram0 RESULT_ROOT=3D/result/boot/1/vm-snb/debian-11.1-i386-20220923.=
cgz/x86_64-randconfig-076-20241010/clang-18/61595012f28036a58293df5a2ab75f8=
0ca15c327/21 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-076-20241010/clang-1=
8/61595012f28036a58293df5a2ab75f80ca15c327/vmlinuz-6.12.0-rc1-00043-g615950=
12f280 branch=3Dlinux-next/master job=3D/lkp/jobs/scheduled/vm-meta-14/boot=
-1-debian-11.1-i386-20220923.cgz-x86_64-randconfig-076-20241010-61595012f28=
0-20241015-29410-tdv4ix-7.yaml user=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86_64-ra=
ndconfig-076-20241010 commit=3D61595012f28036a58293df5a2ab75f80ca15c327 int=
remap=3Dposted_msi vmalloc=3D256M initramfs_async=3D0 page_owner=3Don carri=
er_timeout=3D60 max_uptime=3D600 LKP_SERVER=3Dinternal-lkp-server selinux=
=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 =
nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.=
minor_count=3D8 systemd.log_level=3Derr ignore_loglevel c
[    1.073666][    T0] sysrq: sysrq always enabled.
[    1.084590][    T0] ignoring the deprecated load_ramdisk=3D option
[    1.085894][    T0] Unknown kernel command line parameters "RESULT_ROOT=
=3D/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-07=
6-20241010/clang-18/61595012f28036a58293df5a2ab75f80ca15c327/21 BOOT_IMAGE=
=3D/pkg/linux/x86_64-randconfig-076-20241010/clang-18/61595012f28036a58293d=
f5a2ab75f80ca15c327/vmlinuz-6.12.0-rc1-00043-g61595012f280 branch=3Dlinux-n=
ext/master job=3D/lkp/jobs/scheduled/vm-meta-14/boot-1-debian-11.1-i386-202=
20923.cgz-x86_64-randconfig-076-20241010-61595012f280-20241015-29410-tdv4ix=
-7.yaml user=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-076-20241010 c=
ommit=3D61595012f28036a58293df5a2ab75f80ca15c327 intremap=3Dposted_msi vmal=
loc=3D256M max_uptime=3D600 LKP_SERVER=3Dinternal-lkp-server selinux=3D0 nm=
i_watchdog=3Dpanic prompt_ramdisk=3D0 vga=3Dnormal audit=3D0 riscv_isa_fall=
back=3D1", will be passed to user space.
[    1.099482][    T0] Dentry cache hash table entries: 2097152 (order: 12,=
 16777216 bytes, linear)
[    1.103259][    T0] Inode-cache hash table entries: 1048576 (order: 11, =
8388608 bytes, linear)
[    1.104885][    T0] Built 1 zonelists, mobility grouping on.  Total page=
s: 4194174
[    1.105755][    T0] mem auto-init: stack:off, heap alloc:off, heap free:=
off
[    1.106517][    T0] stackdepot: allocating hash table via alloc_large_sy=
stem_hash
[    1.107317][    T0] stackdepot hash table entries: 1048576 (order: 12, 1=
6777216 bytes, linear)
[    1.113570][    T0] software IO TLB: area num 1.
[    1.600025][    T0] ****************************************************=
******
[    1.600889][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTIC=
E   **
[    1.601694][    T0] **                                                  =
    **
[    1.602498][    T0] ** This system shows unhashed kernel memory addresse=
s   **
[    1.603340][    T0] ** via the console, logs, and other interfaces. This=
    **
[    1.604126][    T0] ** might reduce the security of your system.        =
    **
[    1.604914][    T0] **                                                  =
    **
[    1.605719][    T0] ** If you see this message and you are not debugging=
    **
[    1.606530][    T0] ** the kernel, report this immediately to your syste=
m   **
[    1.607345][    T0] ** administrator!                                   =
    **
[    1.608108][    T0] **                                                  =
    **
[    1.608907][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTIC=
E   **
[    1.609706][    T0] ****************************************************=
******
[    1.610791][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D1, Nodes=3D1
[    1.849553][    T0] allocated 335544320 bytes of page_ext
[    1.850224][    T0] Node 0, zone      DMA: page owner found early alloca=
ted 0 pages
[    1.852459][    T0] Node 0, zone    DMA32: page owner found early alloca=
ted 0 pages
[    1.890799][    T0] Node 0, zone   Normal: page owner found early alloca=
ted 81999 pages
[    1.892852][    T0] Running RCU self tests
[    1.893343][    T0] Running RCU synchronous self tests
[    1.893890][    T0] RCU Tasks: Setting shift to 0 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D1.
[    1.894913][    T0] RCU Tasks Rude: Setting shift to 0 and lim to 1 rcu_=
task_cb_adjust=3D1 rcu_task_cpu_ids=3D1.
[    1.896021][    T0] RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu=
_task_cb_adjust=3D1 rcu_task_cpu_ids=3D1.
[    1.913613][    T0] NR_IRQS: 4352, nr_irqs: 48, preallocated irqs: 16
[    1.924892][    T0] Console: colour VGA+ 80x25
[    1.925467][    T0] printk: legacy console [tty0] enabled
[    1.982723][    T0] printk: legacy console [ttyS0] enabled
[    1.984270][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.985971][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    1.987360][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    1.988175][    T0] ... MAX_LOCK_DEPTH:          48
[    1.988984][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    1.989821][    T0] ... CLASSHASH_SIZE:          4096
[    1.990660][    T0] ... MAX_LOCKDEP_ENTRIES:     32768
[    1.991493][    T0] ... MAX_LOCKDEP_CHAINS:      65536
[    1.992230][    T0] ... CHAINHASH_SIZE:          32768
[    1.993051][    T0]  memory used by lock dependency info: 6429 kB
[    1.994003][    T0]  memory used for stack traces: 4224 kB
[    1.994896][    T0]  per task-struct memory footprint: 1920 bytes
[    1.995859][    T0] ACPI: Core revision 20240827
[    1.997090][    T0] clocksource: hpet: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 19112604467 ns
[    1.998834][    T0] APIC: Switch to symmetric I/O mode setup
[    1.999787][    T0] Masked ExtINT on CPU#0
[    2.001107][    T0] ENABLING IO-APIC IRQs
[    2.001849][    T0] Init IO_APIC IRQs
[    2.003753][    T0] apic 0 pin 0 not connected
[    2.004545][    T0] IOAPIC[0]: Preconfigured routing entry (0-1 -> IRQ 1=
 Level:0 ActiveLow:0)
[    2.006012][    T0] IOAPIC[0]: Preconfigured routing entry (0-2 -> IRQ 0=
 Level:0 ActiveLow:0)
[    2.007414][    T0] IOAPIC[0]: Preconfigured routing entry (0-3 -> IRQ 3=
 Level:0 ActiveLow:0)
[    2.008799][    T0] IOAPIC[0]: Preconfigured routing entry (0-4 -> IRQ 4=
 Level:0 ActiveLow:0)
[    2.010856][    T0] IOAPIC[0]: Preconfigured routing entry (0-5 -> IRQ 5=
 Level:1 ActiveLow:0)
[    2.012949][    T0] IOAPIC[0]: Preconfigured routing entry (0-6 -> IRQ 6=
 Level:0 ActiveLow:0)
[    2.014360][    T0] IOAPIC[0]: Preconfigured routing entry (0-7 -> IRQ 7=
 Level:0 ActiveLow:0)
[    2.016219][    T0] IOAPIC[0]: Preconfigured routing entry (0-8 -> IRQ 8=
 Level:0 ActiveLow:0)
[    2.024089][    T0] IOAPIC[0]: Preconfigured routing entry (0-9 -> IRQ 9=
 Level:1 ActiveLow:0)
[    2.025682][    T0] IOAPIC[0]: Preconfigured routing entry (0-10 -> IRQ =
10 Level:1 ActiveLow:0)
[    2.027123][    T0] IOAPIC[0]: Preconfigured routing entry (0-11 -> IRQ =
11 Level:1 ActiveLow:0)
[    2.028562][    T0] IOAPIC[0]: Preconfigured routing entry (0-12 -> IRQ =
12 Level:0 ActiveLow:0)
[    2.030086][    T0] IOAPIC[0]: Preconfigured routing entry (0-13 -> IRQ =
13 Level:0 ActiveLow:0)
[    2.031527][    T0] IOAPIC[0]: Preconfigured routing entry (0-14 -> IRQ =
14 Level:0 ActiveLow:0)
[    2.033058][    T0] IOAPIC[0]: Preconfigured routing entry (0-15 -> IRQ =
15 Level:0 ActiveLow:0)
[    2.034485][    T0] apic 0 pin 16 not connected
[    2.035257][    T0] apic 0 pin 17 not connected
[    2.036161][    T0] apic 0 pin 18 not connected
[    2.036941][    T0] apic 0 pin 19 not connected
[    2.037713][    T0] apic 0 pin 20 not connected
[    2.038468][    T0] apic 0 pin 21 not connected
[    2.039818][    T0] apic 0 pin 22 not connected
[    2.040584][    T0] apic 0 pin 23 not connected
[    2.041500][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1=
 pin2=3D-1
[    2.042657][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x2c9475bb8da, max_idle_ns: 440795307408 ns
[    2.044382][    T0] Calibrating delay loop (skipped) preset value.. 6187=
.19 BogoMIPS (lpj=3D10309106)
[    2.047908][    T0] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    2.048878][    T0] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    2.049949][    T0] CPU: Intel Xeon E312xx (Sandy Bridge) (family: 0x6, =
model: 0x2a, stepping: 0x1)
[    2.051470][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    2.052944][    T0] Speculative Store Bypass: Vulnerable
[    2.053820][    T0] MDS: Vulnerable
[    2.054599][    T0] MMIO Stale Data: Unknown: No mitigations
[    2.055549][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    2.056923][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    2.058027][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    2.059125][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    2.060213][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
BUG: kernel hang in boot stage



[1]
The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241016/202410161448.b4308a5e-oliv=
er.sang@intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


