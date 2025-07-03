Return-Path: <linux-input+bounces-13364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D1AF77DB
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 16:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29537567279
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2502ED86C;
	Thu,  3 Jul 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxQvY7Z2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772AF2DE6E5;
	Thu,  3 Jul 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553831; cv=fail; b=Q+By1XViTOOUrhf2IJ6GbjcPYvfAuRU+W2pGfenhgLjr+TCV4xBdfWW6F6MFr4NAqI216kVKj9QTBXxRjG7t4NNFvbP6djFqadhZHC3NdyWcienhsSQ8mXlC5vE1P3EBjaZrXMFWxlR3CHPh+mSuyU/8d0/SZnhOhaG0ftc0nYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553831; c=relaxed/simple;
	bh=iW/5bqJPbS8V3SPs9F5nNMTbpLbzmc4A7O+o1AokL3I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W0LKH9oodbaicdnVkGV6JFyAGaou/EbXbjjwKvbBdRB0ZlLf+98IAxFA3JsleMOCPAeheNT54QW5zvboB/MPTrYa3bDdE1fyYLQNXLWIlRFYTjqQc2YJYMpOh7kL4J56TMNF03jd6ZKM+OhYuR1aXDOVSSzG3ZxIsy0ng/wbTO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxQvY7Z2; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751553829; x=1783089829;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=iW/5bqJPbS8V3SPs9F5nNMTbpLbzmc4A7O+o1AokL3I=;
  b=KxQvY7Z2PvkQOiBmclMbDJnUFOHBOixALsddBKt7mY+MlskKML2YT2AP
   Ys1Zpv13+ugnsYRbOmZKyZc/HLXinRdh+WWVuIkLerCKp2+v099u6+ZwS
   vVC11RrceEg32WwBL52hW0+t7orhH41nJAeoP92YtnvhoDbLI5cP0x/3E
   KVNMurBcY6lj7v13c4u+Xw/dL57yrfCq/6Y5VYPCYl0K5XgYpM026Bo4n
   IKmfzPlyPFqNoQPjg5O1it7gRMUX+8MkAR2nLZsrScq2cZvAyQxKAgPTF
   UUHj2oFnULA+L4QoeBDKAP6vWb+vuSqxZPtapoQgozaUULuAUk8zt0+8S
   g==;
X-CSE-ConnectionGUID: vEyCl19gQo2SJFehjRg1nw==
X-CSE-MsgGUID: +NIm55m1TkeeVOsS6bShZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53998210"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53998210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:43:48 -0700
X-CSE-ConnectionGUID: OhOx5vUETaS6HV42hACcpw==
X-CSE-MsgGUID: lyUbKcXhSvOcoIQpbwWo8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="160084914"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:43:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 07:43:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 07:43:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 07:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGAO9OpWXfa5LtUyHH+vuJQjZmRUaQL6RRvJAWifbvFnpxo/nHDuPL4Z+bGvRK7YUSXcVSrHb2YH2H/ysjj8fmpSmBH0cX2+8JrOEx7Z7p+yjt9Mf03bR8pqn3CjjqpupM+8v0vrIzlzIf2LmJFFa6hfr3ed7hcFTBbI3Ihm/Z0zvcSoZi+aSVtxlhwsSRTu0Km6Y+jEEqNKqXo9sfm66fJlOyT5DWQkumTXcFN8kV58zKndza16ladHdvitwbDQCGisUoiV/oNQwYRtSm7ekutmxU12LMqFE5WNYGSMBxhO4xo3zuDfhDl+J0jUwaYuKduZbETqP/ErKQVLfMaB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h3LceHzwm+GkYDgouqL0cVX1ZF5P7CL4GgRY16/5gA=;
 b=TQLiqYem+6PRNYMlHC+TjCyHLyI0QjwZeANvPStDuWIA7s+Rl2llg+WFxR9FCipgeeUpm3vu18m5unxS17jv2WT8vxWyUtg8QUH6CtT5Vb43mYSLTLbzG1GXpiyRc4eqwWwt0LUyph65vtoD6WQl7e+HSAroc7Ez+gobpeqH+b0JhGWENLK+g29yQSE5MoOvti6iSTmkjd3arFPjQ8Tvu02cNxRIdzQLTT0ECa61VNOZPh8xJv+l+FgmqvS4yxgG6a+J+fiW7CbqPhmJcSGjHpzUIyyJzprb1R35T0QO50E2UuADx4y3A8Up7PnBP+SeCwKGD+khkCK0NRUk+iT21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 14:43:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 14:43:44 +0000
Date: Thu, 3 Jul 2025 09:43:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Luke Jones <luke@ljones.dev>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [REGRESSSION] on linux-next (next-20250509)
Message-ID: <iwo3m4fclstsm4lqmomdmlvk7gwtxjupbczbcw6i2ib5cqv2na@nsu3y5kzqzsp>
References: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: a91fdf83-944d-4ccb-15d2-08ddba400290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2JoaGtRPwaS/Bf67ZXEZC3Cnlwi96DbZ+CsnAujrLVGX73ZcUY3KGyZqsYuc?=
 =?us-ascii?Q?+1MHOLDmh/McsqhQttPtK4zPKCn7egBzpTDCk3tosY6+FVPCdf2yCSBGHm1i?=
 =?us-ascii?Q?0uJ/9THt2Y222XpSO8dd954mEx21pSJsrWvV1VXMqcjX1rKbNmDC+PW/g9Sc?=
 =?us-ascii?Q?Q4REFBcYf7dmtZJPA3Lbj+6+xxDBaHOy1lZBE8ekTmZ/IO6DilwDCDFcNS/x?=
 =?us-ascii?Q?2h0c3DtwF+9NwSTthh0iIXUrCdJ3E/vARtVda01G71PqEGXig8pFTCXu0enp?=
 =?us-ascii?Q?l3caAzGx+32u+87ljmDzz9CHpVrpMXGGAAgJwlSptW2aexbovvnqzqIaueA2?=
 =?us-ascii?Q?AApEHVSQ9WwdsQQIUWCt7DIWbdsujQXxMKNJTwFILws2MYcdkHSB4vyj2Vev?=
 =?us-ascii?Q?VFTkNZkIDud+WiQPsZMCMB+J3Jz4DOPRw2ZQKg8drKcuEIyhlmrYsdW+tTR4?=
 =?us-ascii?Q?2ljyUH5x6IioasdbwaJL63fAO1TiRo+bsUNEzPNZhpqgm17Qy3xJzDm1sJdz?=
 =?us-ascii?Q?OR1S9jVwfzLfoaMVP7PMfKcjPY5CMTxskNe2LCdVAocWgHFloRSMA3aZq1Nb?=
 =?us-ascii?Q?SzT1xvDldQWqTWXGU/HVaKqTGRCE7C8IQVa6P1mA920Vi61+2j+UgC/DOWF/?=
 =?us-ascii?Q?vbBC4eqsjMIqPSGr6RaXm9oLQjhKMNbr1vQL4zabPcCx0GuWweBnzavMSMNQ?=
 =?us-ascii?Q?QxBgerX/togFmzeb0vWdgQg1xD5FSdwA/UefrghzU2FY/NEd3C1N05QTxXjT?=
 =?us-ascii?Q?4ACwM+TiaVUF1SLOoCXr3vqMtnaAmLxm/2W4ddm48j9MUSDMMTa+onFDzIe0?=
 =?us-ascii?Q?FBWVzEYGt19WR9jme1JFcewVMKszgwEApwLtGe/cBAetL1MykWDTSE2WDj/g?=
 =?us-ascii?Q?+pd6XpUoPViwHoxEtbio3AIyp5s+8KZsK1HB+qMNRo7SeVO5TmC/+PsRbq/3?=
 =?us-ascii?Q?wFa6ZaeZ4qgBJwhgeFpFdQuZJvSCtJ5e3P71BYvaKczeuPT6nbxsV6SRi4YV?=
 =?us-ascii?Q?KyrwdKaCwZ4QPNand4JNlOMx6W5hqnlERRBPOVztieifTiO+0vBf4KD/OXUk?=
 =?us-ascii?Q?G8M4SWc90wcbiivPm+5hrAdFaUqT43rUJrUdEwSneS6oGCEzq5opjEjD89vp?=
 =?us-ascii?Q?s0vdLC0w7FZnFT/d+ncCbi0l0RH6+b+52c/XFjRH6lnGmPlYscJCkkbrjlKI?=
 =?us-ascii?Q?DC8YwNGJJqXEQfGzJGLZdXW+hLlM7AyVPZWK3QDgJ2ss1fq5e9X8oF1cCygs?=
 =?us-ascii?Q?BRdvqpD2QGWtw5TCo0SGgABSn898N/mK23qLud+g2oKxZPCjEpVmgAsp4+zN?=
 =?us-ascii?Q?xr6pHLXSgVD3DGpKk5z26928yMD1Z1+jkyBZCKo7tUVU6F+CWN130b3Nkekz?=
 =?us-ascii?Q?k/lbNYI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgWPO/PaJwnGqtpwJuX3l6pxeLD+le8xTQYA8247KuNBzZvcVbFSf4wVPwWR?=
 =?us-ascii?Q?E2gEs5q5EcHbTXkjcRle/jNc53aeaE2TCAfuQ4XxUIHwoFWehgym7OFOVBMH?=
 =?us-ascii?Q?xPXmkhZnGgElHNNo44xuylJXffb7M/v+E9OMlDr7Om3LyOLQKPr2x8F2aveP?=
 =?us-ascii?Q?xk0DX8JxmporktDdr3cmQBuSN3Szbb7+5urqnuSimT+mrt0v1UbJASqZ1xAU?=
 =?us-ascii?Q?FpyIWUVuid4ofk/awdoKK1zCkGBLrIfCnf2Cr6II8Yl/i4QqgymLv6uTIPG2?=
 =?us-ascii?Q?MyLDloyRFcMyUs93dGdF0CAXLOcdtBwOrhJls8NODWWcq70CrBgT6H7sZQKF?=
 =?us-ascii?Q?U/mxGRWvUR/Y/71e1oSy9Qg1muZVZrf7nmRKcjRAFDtBu03USX1+GTCXL2eP?=
 =?us-ascii?Q?cv0fHNNs0f4Sz03R4/Cowwyk6UoMg7vNkIWRzkZW7tQFTuL6Qd6ND1VrPsGq?=
 =?us-ascii?Q?4TjuVd/8or0JelkArf0CgpsoaopkaOhrE8sn9Y+z6dWzuC/rf1NkP7SzmVaL?=
 =?us-ascii?Q?A/SwqZYaIq3CUAknbn9+AQdrMGLExcg6fXOSvjS6Zf0sdZaE8XKecRk/cqxv?=
 =?us-ascii?Q?yDnaNQHjJLKNEoeU4+h6q7Qc+ggmjh/kQUnTji8HwvtuoI358n0sXKxGAh99?=
 =?us-ascii?Q?/0uklGqvWDxpfsJ6r4Rcp/WoqNmLHhtN4wFY8jnRn8DMNurBEvGFpxpZh7eh?=
 =?us-ascii?Q?Vcczlgwl6BNtriok+81XOFV6oRLN61aw10OjOca1OSFZ92MpnYJ27IELB5N/?=
 =?us-ascii?Q?3NIDtSSaSviqHtpXQnMhRazGwheEzyTBMmOauVN3dmHvh+80x02DSbMBcVmo?=
 =?us-ascii?Q?dK0H87uJcO0ZDKEIkmAe73BEuj642LLi83iuz4z7j3s6EskX10HWZq6PWked?=
 =?us-ascii?Q?yViVyV+k81WD8NBVdk7F3vp1VHKyr7SEx1HxHVIIkaDQFQk/BjI86ebid2yL?=
 =?us-ascii?Q?UZ8CO5PDPHlY/1EHQMgn5BGZe0nuw2utvMJG0QbfqaRV1JPrnZcRq69wdDE7?=
 =?us-ascii?Q?Xc1IFldW0H45JmnkcEHYACXWYrsrQKVMnOPVHBns+nTPQ9oeSXLrRDi54sdp?=
 =?us-ascii?Q?03yJFyByfvCNOmZNi6mY0zVUlIJ9Ve8ogHj6SuT+upUn2BIcg+CbLpDtgbEN?=
 =?us-ascii?Q?nqeoDbVVLwYoQSG1U9Ndu4wnskfZF5NLTNulLMTW5WspLkfIurlm/AUoccgg?=
 =?us-ascii?Q?M1/iJjhgKGsKe5EDiADwmq7Gg5AWInbFLQSe5ha/iF8Anj3HMe5ih0mFDepj?=
 =?us-ascii?Q?dDDysL+LEaEMHSSWl001Sgk54RxpGniqVJ+PRHJoIMQo264FwPWfCIFYc4Bs?=
 =?us-ascii?Q?axxqaYZOCsc/RbXyfO48iLLvyrVfOak1xsaRgG0KYt2eYw2VsHxA2wQSXzY/?=
 =?us-ascii?Q?x0wr6JBJ8BzVakiMZFmzZFK9i25iJtm5dnQRVoxpeqToVckLv8niICPGEzBj?=
 =?us-ascii?Q?CxwrARX+WRFFg9IoZkBnK8Kr5ECTw7YGAUzIfEyTHv8gBAFbUlRxibSfVjM5?=
 =?us-ascii?Q?iw0BgcHlfmxEr/TDR4E1ibDdGblJul9ZO4VrxdTZY+RNEzCuy0SSJwHqDfgy?=
 =?us-ascii?Q?8rod6RsYgUSxsTtXvMGKc6kFFw6AcFbeOuLjNmVwXxvZBLrYmO2WEHyAVCo+?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a91fdf83-944d-4ccb-15d2-08ddba400290
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:43:44.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVPN0qxLhpXV0ftwRt2Nzsvd/LjmuZhTyF6A5qmTmxPhBjDJq7b7vUB1J6klZf25k39Buaj6DjyMkcWZe5jZPKna1n+gCOq9QbdUFlNQDVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-OriginatorOrg: intel.com

Hi,

On Wed, May 28, 2025 at 03:07:51PM +0200, Luke Jones wrote:
>On Wed, 28 May 2025, at 12:08 PM, Borah, Chaitanya Kumar wrote:
>> Hello Luke,
>>
>> Hope you are doing well. I am Chaitanya from the linux graphics team in Intel.
>>
>> This mail is regarding a regression we are seeing in our CI runs[1] on
>> linux-next repository.
>
>Can you tell me if the fix here was included?
>https://lkml.org/lkml/2025/5/24/152
>
>I could change to:
>static void asus_s2idle_check_register(void)
>{
>    // Only register for Ally devices
>    if (dmi_check_system(asus_rog_ally_device)) {
>        if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
>            pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
>    }
>}
>
>but I don't really understand what is happening here. The inner lps0 functions won't run unless use_ally_mcu_hack is set.
>
>I will do my best to fix but I need to understand what happened a bit better.

Any updates here? This is basically killing our tests for drm-xe-fixes
we are submitting to 6.16 since it taints the kernel. If we can't fix,
maybe it's already late enough in RCs that we should need a revert?

FWIW, for 6.17 we have a branch on the side we also merge before testing
and we've been including the change above to stop it from killing the
rest of our CI:
https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/e9d0926aa1c6afcc920013c39d5bd6dd85f581fb

Lucas De Marchi

