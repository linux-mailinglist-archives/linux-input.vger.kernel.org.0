Return-Path: <linux-input+bounces-14249-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1614FB302E0
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 21:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7E1F1CE4441
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 19:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E917934AAF8;
	Thu, 21 Aug 2025 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhCg/HFS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140F21F948;
	Thu, 21 Aug 2025 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804414; cv=fail; b=e3kS8yG+Y+z0ab1O5AlYaZVQapHjGsLsi54n1oLwP5HzxXdxvm5yKcr/PcB3XfnPIwCffn5KsREQi/7DR75xT58t/AheVFCkkYrND9uBb3aGMFeOks4FBiaC7QGMcTBi7RjeiObbmfCzC4iqV2AZY/scCs/FGLcnA0RB7q655fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804414; c=relaxed/simple;
	bh=CSGmTj9vQ+sSCbw6Jz0R9Jj28djznFwvBs7ruFYzq/M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JuGygKcFFPiSHwf+7tTmXTelRgOjhBZSB/jPi9LqCQb09JCqUs6Lzf3jU7umCQlKI/ktH8okKEMWSwkLcUmWfxplqv4nNoyXVml/wa0mAjkotpcH8PTGGKV7+swnZVJxBUejSRGZ4YdFg7QzA00b3NN1YEycP8M2jOPdZuwGRO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhCg/HFS; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755804413; x=1787340413;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CSGmTj9vQ+sSCbw6Jz0R9Jj28djznFwvBs7ruFYzq/M=;
  b=NhCg/HFSJ8inbIq+tZ9CPZBiA4OP3JJxQBESqjjYCq+ukTf6umXnubXc
   vTegSEMaSg6AQ8RPAevxgSzJlnDNfsZVqKYu4353WqXorTgr5Aa54mlEQ
   yxRMadQz8s67wDxmTqHIKoE9zXsPlBQl67kU6XU5yPgjVlbqru256SShL
   7T9f+HjtfNWHrpccvxp4jTIzc1TR2Oabw9OCRppXfyvq4BoQuSdyuGAIz
   FocFKUcC5GmJLqFXQDSQ5skhtg2z8k7J7K1JGYkSNc2ZyTx+GVk7jbfbC
   SbUiHwzJudozLWKwy0X2XLN5U6zXqd77iDC4kjz0WQqyj2zx9VejTm7T2
   Q==;
X-CSE-ConnectionGUID: BdgbH7v0TIyx9yJ7KsZtmA==
X-CSE-MsgGUID: e8n0ppF8SNq0xVRrYRqHJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58031688"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58031688"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 12:26:52 -0700
X-CSE-ConnectionGUID: kRG37C5mRXS5vL8qqQHZQQ==
X-CSE-MsgGUID: wtbhElCjRny6UI4hwBGdag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172707063"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 12:26:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 12:26:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 12:26:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 12:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQIPQZam1V7n/uNSib1avqqsQqGEY4lksuFmnTcdqnwVuPPOlVZIjVCkSIqaH12v8Pi205iHaUaqnF6zCmQbOB5dK7Bzc7qq+j3ibPejRY1cuIfQ0c/JeeyeMquiqlEVVaOP89Xf7bYpZY4SDQeVMdE2avFnDIaz6DY0SROs1PlVG1n0T3eQIiiu4SujZzLY39fcre6OKbMN8z0NlsJbfVvK0JEP5r7ieZf0TLPqAcf9kwIXBnydL0fcbGL3YOsfKQy0QdY7HGlw/IOerIW9KueZ3HpSsfVbw22y3tTnPCoSxLP3ZrmRiCJWf+RzRbRyih8wwaYEQwH23z1eToDvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueG/UN3hHkmyE/0lGiWk8nhMimyS45g1sUFwQgMehxI=;
 b=ZsajEWn3VJXe1fUGvcIVxEZwWSMqOK9sFCsBuRQ+tz4y2vk3o4QpSuXQAmXeJmlxnvqlQmbAL1qUQdCcvyqBprzrdoOOPVbtXds6/Z2INPy4zTIBYfM8kqWegecavumcJMD3NdAtQOjDEY+7RBINJBi0oCROKRrSvAUY1cDsGKJg0tYyqspFOvR6RG+kR7LUGVtSB24F+iYRgB+DBkJF8wUC5yHFg39K6HtT998K8EnnP1KJ2TX4tbipzH5plXfjmisMIZ6+W5iwvgHykx4FG5NeIyXX2Wu8jZXxYXmVhPn7VFye/X6wmB+1p/xO+yvPd7WB5Q+lc4GUhMOxL/HFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 21 Aug
 2025 19:26:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 19:26:48 +0000
Date: Thu, 21 Aug 2025 15:26:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Luke Jones <luke@ljones.dev>, "Borah, Chaitanya Kumar"
	<chaitanya.kumar.borah@intel.com>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "Saarinen, Jani"
	<jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [REGRESSSION] on linux-next (next-20250509)
Message-ID: <aKdy8_zVcdg-t1ga@intel.com>
References: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
 <iwo3m4fclstsm4lqmomdmlvk7gwtxjupbczbcw6i2ib5cqv2na@nsu3y5kzqzsp>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <iwo3m4fclstsm4lqmomdmlvk7gwtxjupbczbcw6i2ib5cqv2na@nsu3y5kzqzsp>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb08d0b-66b7-4c48-5281-08dde0e8ac4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gKAmz1jXVmSYchZUnw4oAFU85aQSaG9Ur7V9cLlKJB25wJX5t4uN60u7xF7n?=
 =?us-ascii?Q?f6aXhss2eQ+7chLBBJuUTWWw1eiP3Ln/H2XLEhkG763DlZDrUvk5iWVtS9Xz?=
 =?us-ascii?Q?g7pIomwbXSbZnBL4a59SfaXPqZn88CG/PiO1EKGhBhF/CEpeflS0UB97LpfA?=
 =?us-ascii?Q?xiOmKDAqxliYnhZz16garfWfuDJziH//I0SYkKW7G5U1RW2r62YiuyUcMi5u?=
 =?us-ascii?Q?GoJPcX41xI8mBkLx0LT0RoZ1vCMINhf7EBX4vkp4uaFDUSRZK4PP91NlxlqQ?=
 =?us-ascii?Q?Y44OOPw6xaVzjjqJoKOKMdOUkrAakKMih+D9qMN/EG81xF/F8WZcmNSyS5w6?=
 =?us-ascii?Q?xllVGrZQuRl5YsC0g+LzeZA4w87oCQ+1lIzpKHe9T0hfY958s8rObDnyIIc+?=
 =?us-ascii?Q?vyXcpCosXCKvy2H7JJyOnTLXbZiDChheX5/BhSbyF+a3mvY/Fq5VG/4DPjFD?=
 =?us-ascii?Q?j9NWnPRfmAuhpXijE46aN1LSCeZf+CxgqJe9XhqKto6mb5Wjd6ElTrtls8xP?=
 =?us-ascii?Q?jINPj/joUC7rpay/crMKsKFY5MoLlxR5NJ4gkBGASc0erjcTqYxhevV8bknx?=
 =?us-ascii?Q?OdzR4SkEnTeqcv6O674fa1ItWtr8IFGnTW37Ut3XvwkW2sds/1u590a/9wcN?=
 =?us-ascii?Q?eqvlUKLsizDdt2zqnWyMglpQ/Nh4vw2oAmlKpp+h5Kbfb/eG56ksExBjQJ0h?=
 =?us-ascii?Q?i6nDLfhwQVTE45AqSpeNatN9HtOpC2QtHjmkxDL++et+ABXj1UhogxpgjCWq?=
 =?us-ascii?Q?l8uxvTvXmBt6VF7q7xz2zAEPBTXgtnp0LwVxWmhuMimroZlxds/st5h1WXxY?=
 =?us-ascii?Q?8LlTvnhtofki34rCCPcp03IZTE+Q6dXdP9UndS+LK3TRFDH31P+Jo/Hl47kV?=
 =?us-ascii?Q?igFihTuhGwV2GeNPnwFGayxEZdfOmETsy8IaQ7kmxUW1QuWxu5eJz7kUh7FU?=
 =?us-ascii?Q?yXnPln4mWZ7WDTnD5iyvpn0YZCVyPd8REBR2pzawZ2pkkc+zxmCP0igbBNzi?=
 =?us-ascii?Q?HOOB68kRrNa59ZgV2zlf2PdM5/L/iKWxFYeKpFKrj/VZxDCwlwzKBR+hWuvb?=
 =?us-ascii?Q?067d+s0SMHGJzFlfgpsNqydKW57J/a5RHdUB0W/41lvrV+9+a6XYnlrdzk81?=
 =?us-ascii?Q?Soc8nowB/7alQhe7Ke6932Wa0ANvJr1t9HWQl0XdMWUl3hXnj6kKwXMcp2Ma?=
 =?us-ascii?Q?45mzVUVc8cEIG+7G4bd6DSY+3LP9XwsbudlJjxKg2XV/Lq4+h03ooCb9/kNw?=
 =?us-ascii?Q?7RUK22zWRMyOS4grYXwY3+inJX3X3M+G4Q2GeHXg/Kyggg6d0408/NLY53B2?=
 =?us-ascii?Q?bDk6tUA9ggV65Azi6IuzSLpyvCzUEV8gI8mSoj5GfLdd+0+4E5xBPHQir0Fc?=
 =?us-ascii?Q?wgF+E4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MR9i2CJRX1JFaVNC065zeZ0DA/uZANf/BRceMrb1bvadQhJqGEm98+uabKZw?=
 =?us-ascii?Q?FLuPchmF9oc1hkTiAS8b4uYF8dsTQBN8inTB4lxyHW4Ua+rFgP1NyuUDtwJn?=
 =?us-ascii?Q?xXL3yYatZkWkLZGYyr9slyFVeSWwAqz0+YsUyrA02DaVtkUN2bXmXzlkPKL6?=
 =?us-ascii?Q?7rDfGLUtriD8t/Jf6gTCm6DPAMM9wW7koqYTv/u60UUI+ZvXpIknR27l6rlD?=
 =?us-ascii?Q?QGHcAkUy/HUHzul+xNAwE3lvA1AwqxwihDCgYm4dbMqqdkZhb/MiJAhGS8ZV?=
 =?us-ascii?Q?nFDq+qJOBpwh7No+o0/piJD7Ec/fLgkyMSihhfwCzYxu3Ogbl5e6FR21H7EO?=
 =?us-ascii?Q?DT0nWI98TWZ2vJh698A/OqYX31tGUQYeMPCnPhohSyjO+64SY3+wE6jpCm9v?=
 =?us-ascii?Q?MAHfmDmPTGy38eMC+d2Ex9mP7Pydx9t6wsOiznjb4yeM06gf40YnsVzsqoRS?=
 =?us-ascii?Q?TvsQugBpSCl5DGC59YHFgUcir3j3xhMu3R26Lf0wnEt9ZIruCq8v+A5ECSKr?=
 =?us-ascii?Q?af3cvGCrXiY2i7lEIrZFCWmFWUtWuS9rnM7ZZX+Fb5Dz94IZHByifklgsp5U?=
 =?us-ascii?Q?72NV5DK10vRkxyOpOtCIp9TgbXHKsq+2BWBqtBLcxQC8+B8jedBGh5kp8slk?=
 =?us-ascii?Q?6bPL3uIZPyIhybR+MVNCxNZpT5mjUUk/lX/USvbj99lh1JTSzR+zsMtmsTXB?=
 =?us-ascii?Q?LqpEW1qt1Q0fGy2N8xNxGIk3wOPHD5C/MOucpKlIq4opGgOG4b+16H0b/9jO?=
 =?us-ascii?Q?dSThQC9J33E7RTWipfFn/rF++uimd6pwsISiNbtnfSRs1r/TxI+WovWfOEVS?=
 =?us-ascii?Q?AuQyJl+m2qTUBDMFe7BM+3ALrpZi6t1VoAdsy+lPXHnV7Zjku40WrAWYUKcZ?=
 =?us-ascii?Q?yFwhVc3fsTmrKVehc4vku8YG0psP20g/GejkdHN0ReBJ0OHPTTipcKuQBoJf?=
 =?us-ascii?Q?LnqNUUrnZSjXa95tDB3ZlhbIwvHBF+4suwuAInFkZWg90qHbzGnjNBPONrzD?=
 =?us-ascii?Q?H39CaeD7jYgXr0mEoIAfgXXXoXOsgn/Uu/93gIf9fHkhm01Bt4maMTW5nuvS?=
 =?us-ascii?Q?vuYnxDSshRSdhS2ahrBekq4bl+kdEvMGSkF9rlAqHhI4vH3pCgd5z77YRO/S?=
 =?us-ascii?Q?nT3KrSclfeVY1BkYIDBZbF7PEA4crPfhv6wQbjNenusMTWTXtKO5wVXEgtjq?=
 =?us-ascii?Q?pMIm4X0zreU0R06A9Ohp566/ciQ35Sc5P542eUtn4nDxAwGRCHkZYQ/1DqNv?=
 =?us-ascii?Q?z3EM8ntLNqFZTGI1L+QJ8an1P1zGZVdQl83FvC02r7+iFHj75y/82qQVSw7T?=
 =?us-ascii?Q?yCTZkCz2+McN10JffeXcVPJlKEeGfEzueXZ6GkKcxXt8mEVPrUCvbPbTTNr1?=
 =?us-ascii?Q?kXmQYJ42Bw/3KwQruuS320b5S4mPejugMy+Zt0gNPvi3QKihLb4QERLS1XEQ?=
 =?us-ascii?Q?DajnniuqNrHj7JOy6Cz7Cg/e7NUSlgNNjzCejp7Qji/2OjrwOdijcl3S609j?=
 =?us-ascii?Q?QrTxtTXY9UypDgBIVBns1Y5MWnalPy/4jTBohS3uwcH17J5cG5d8MDry3RnV?=
 =?us-ascii?Q?Qyrsg+T9Al8uxxQF5WJ7voh26asUEGuUCfeejSZJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb08d0b-66b7-4c48-5281-08dde0e8ac4d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 19:26:48.7223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Cknxx61hJl0bYEyYFcPbxyi99BJdN6UjLmtfFGH+UNz1A1Ypon8HZqWSHKNWVGZH2c+fsm9ZGZIoLFA+Qrwpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
X-OriginatorOrg: intel.com

On Thu, Jul 03, 2025 at 09:43:41AM -0500, Lucas De Marchi wrote:
> Hi,
> 
> On Wed, May 28, 2025 at 03:07:51PM +0200, Luke Jones wrote:
> > On Wed, 28 May 2025, at 12:08 PM, Borah, Chaitanya Kumar wrote:
> > > Hello Luke,
> > > 
> > > Hope you are doing well. I am Chaitanya from the linux graphics team in Intel.
> > > 
> > > This mail is regarding a regression we are seeing in our CI runs[1] on
> > > linux-next repository.
> > 
> > Can you tell me if the fix here was included?
> > https://lkml.org/lkml/2025/5/24/152
> > 
> > I could change to:
> > static void asus_s2idle_check_register(void)
> > {
> >    // Only register for Ally devices
> >    if (dmi_check_system(asus_rog_ally_device)) {
> >        if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
> >            pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> >    }
> > }
> > 
> > but I don't really understand what is happening here. The inner lps0 functions won't run unless use_ally_mcu_hack is set.
> > 
> > I will do my best to fix but I need to understand what happened a bit better.

Hi Luke, is there anything we could do to help here? Any log or info that
could help from this machine?

This bug is blocking some of our CI runs here.

Thanks,
Rodrigo.

> 
> Any updates here? This is basically killing our tests for drm-xe-fixes
> we are submitting to 6.16 since it taints the kernel. If we can't fix,
> maybe it's already late enough in RCs that we should need a revert?
> 
> FWIW, for 6.17 we have a branch on the side we also merge before testing
> and we've been including the change above to stop it from killing the
> rest of our CI:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/e9d0926aa1c6afcc920013c39d5bd6dd85f581fb
> 
> Lucas De Marchi

