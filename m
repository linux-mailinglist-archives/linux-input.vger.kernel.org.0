Return-Path: <linux-input+bounces-14331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C3B376E4
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 03:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E679F1B6706D
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 01:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05C21C861E;
	Wed, 27 Aug 2025 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/Vj0U1a"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EB3595C;
	Wed, 27 Aug 2025 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756257850; cv=fail; b=tnKWfG8uPLEWl5yOddIK3ru1yyZQ1eZm41YvpKfCI4SclVABIbeBupxm8SondL0t2RgBKNoNoEr0x/CeoT8/RlfAshhBdPMo34FZHTBZ3H9OsTq9ufAJ246l4tye0S+mUFiQdMaJ/OiHf9lPPeLrhwA6dA5drrRyvquqYblOS4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756257850; c=relaxed/simple;
	bh=t+x7GBwn758ejej5bAYOM0y1ga9no2w26W5fkT+YOfo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KAxpAOsYoKhMbqJI+Gnk3MbmZurJwcap+46zG381LzKMrYwRXr2LtAlhlDefXFJZrGHEjGWj5EpSuyGyP9zDyGcOPQH/DTtMyRsuAQ5RtqCceLR8nif19FxNhntZL23yDD7/jQWvITH8G3st80hRC9l2XDhNrNd/11PFuR9A1tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/Vj0U1a; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756257849; x=1787793849;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t+x7GBwn758ejej5bAYOM0y1ga9no2w26W5fkT+YOfo=;
  b=M/Vj0U1a8AKn/aGGFn9NjeLy5ZFKB0/429fMNY6PVFtAmebLdDMRW14C
   Q9LhgYrB5qPc65uWt/FPiUhc3UBTfHGzAos6sj9/Q7/fN159obm3Db9FU
   0qQREHbVXvVSY3LltrKbqsDP8KLyoHKSHYVeqW3q86mIYRg4AXNZ0P+a2
   6OwB+L2PiMp/mhT089uZWFzAjw92x1CE45FKHVMZpWCMr5EG8fW/xJqry
   YhTxyzuuWFmH1PXib5NwI5JmCcXn1tx03ZOBYGD3TVao5cSIjwqByTcIB
   yHqZSCKtn/jcRpHdRRpnVqHrzZobR6AOGBYBlivejG+S0egc1KExoOTIh
   A==;
X-CSE-ConnectionGUID: FKycsOQgQcWKehQNB5P7/g==
X-CSE-MsgGUID: QnV7CtJoQTume/Ta291YQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58448897"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58448897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 18:24:08 -0700
X-CSE-ConnectionGUID: IAl7kftaQV6RdmxSpE42nA==
X-CSE-MsgGUID: Kk8mV00RRNeVrQZ33ZZTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170117371"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 18:24:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 18:24:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 18:24:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.78) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 18:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG8qR00Vx4olEUvuAHe2YVGMhiwoV5QXlWuMKpF84P6wWG6QOun5oSHAKc7kMnO/NUEVuXWyI9EeBzeAP80Cq7LriiATYHAvm90QJP6qKLPnAJ+UzSqMXtrgCJoLSML0BFZxa1i8rhOSFwRa16HAU0r/aHM2g/svsGz4DkB9K9NXl+QD1opc84d3Bk45pE1c0S/0axXLJo/CQ4CYkbhFcxA3I8VOAy+4t0284MWwFZs/lo24VwUt33iD8gXaqPRXY35cn2sM/GIOqceSLOO3EgHBgl07e1iBR8XqzCmNz6izrRUuCqkydfu8mjyjexnEIbnfL5MgJBtZLbYSAWQp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+x7GBwn758ejej5bAYOM0y1ga9no2w26W5fkT+YOfo=;
 b=NnIUsFw3Hd8rQSIIqew/mOMuXssr6IKyYluDb0Vw50DUhc0DnTp2povkRwNdC9AyHInjz8WnUx0l4wfbLUUeEOXXnPikqtPW792rqhZuf4k7kXxUTLCeO/1AbrQr3WpFkUykOxUCV0dbVxISuuaF6u/esyQfHb8ZuZLAQMkRFSSLOKRr5YO02fdpRk8SeXIa6SLZ8vUENftBXFwthAZngjGc+ocmH3OnNCPij8waR24t4jcWFPJEDhHf8aXUqGxH19Sbr3DSJHdJFF5p+wtUq91mfxOsN5Em2ff99JMRT+xIa/acShbtOkFM81kfz95ECw/ew8Zbu1tprpYHyIK6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6)
 by DS7PR11MB7691.namprd11.prod.outlook.com (2603:10b6:8:e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 01:24:05 +0000
Received: from CH3PR11MB7820.namprd11.prod.outlook.com
 ([fe80::de61:c7fa:e4f4:54ab]) by CH3PR11MB7820.namprd11.prod.outlook.com
 ([fe80::de61:c7fa:e4f4:54ab%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 01:24:04 +0000
From: "Sun, Xinpeng" <xinpeng.sun@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device
 IDs
Thread-Topic: [PATCH 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device
 IDs
Thread-Index: AQHcFlrh12DDCnlMRkqDCUIzZb/FsbR079kAgADFjMA=
Date: Wed, 27 Aug 2025 01:24:04 +0000
Message-ID: <CH3PR11MB7820A47A0042C35C57025878EA38A@CH3PR11MB7820.namprd11.prod.outlook.com>
References: <20250826072701.991046-1-xinpeng.sun@intel.com>
 <e783088816bdf9ab95b1becde94b6b7bf2a2e93f.camel@linux.intel.com>
In-Reply-To: <e783088816bdf9ab95b1becde94b6b7bf2a2e93f.camel@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7820:EE_|DS7PR11MB7691:EE_
x-ms-office365-filtering-correlation-id: b0a8976c-f3c5-4d23-324c-08dde5086978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bTlVV0JMZERERXpIQ0QzbVRGQTZrMmJPSGo5Ynp1aTU4MEFtRVdicFhFSDZ0?=
 =?utf-8?B?aGpMMHQ4WWM0LzY5di9BcXdNOU1nbysyWlAyRUpMaTZic2ZXalgwaDgzeWty?=
 =?utf-8?B?RWpFN3lwMXBGaW9IZjZaRXYzU1hmSkhyYzUxUWlUNmhHVlVXcHJIRU5sbzZT?=
 =?utf-8?B?aDVXdDhEaWo2Q2tuTXJzTXBtNG5OajhWQzl6ckdiam1oeHlVTjUwRElSVEJW?=
 =?utf-8?B?RW5OYWhNanpqeVVDdktFbUNCUTBtc2FIL0pkOU1yUDJpeXlYSG95NnhEVWo5?=
 =?utf-8?B?MUxYR0RmRXE0cWtpTWRIWENRVXRXSmdpSzVPOXJwR3BpMS84Uk83VlRoc3RC?=
 =?utf-8?B?RGdlb0pRTGFTRlRvYklNbTR3ellPMUdxT3BNeWpSdW1GQVNJLzVUamd0TGhF?=
 =?utf-8?B?cmVTVzQyc0hheEVuQ1ZONE4vYmJtcmRVRmhNSlZVcnpEVXZLc3kvR0Z2RU5I?=
 =?utf-8?B?dEFpQmxxZy9xaG5FbWQ4bjNBMUZFV0NsM09TT1BZakJHMVkzNWhwOGtUbGtP?=
 =?utf-8?B?ZjBzbTRxTVFYVUNKU0JPSUUyaGdxSTVvRmZEL01CVWRET0g3YVAydzBQRHJr?=
 =?utf-8?B?NnZVSExBb0p6Uk1BNjZwSlhXbjdybkVsL1RTRk9ITWR5UytkUlkvOVpPSkdh?=
 =?utf-8?B?SnZFcWNLZE90Yk8xNU8vTExYNXNXQThTb3ArMjRpRDJ1am96NzlFTTBTMHpN?=
 =?utf-8?B?eFYrN293MG1KcGptenRrSXZDZkp2VkJsYzlkRmRISXlIR2l4VU5nb01SODdW?=
 =?utf-8?B?Q0FiVm96aC9Dc2FML0FoZ1k1U3JlNURFZmtxQkNFdEU1Y2RqK2ZQT1BGUDFz?=
 =?utf-8?B?VDYvT01ZS0VMV1N1N1NIZW5TVXkzSjYxUklpWk5JWThrZTBueWFvd3BKYWdS?=
 =?utf-8?B?Sm1BUDNkaXJadndUcUtNL2szTkJtemRyWkp5T3FTQUFmUlczMEFxL2xFaWt3?=
 =?utf-8?B?ankwUVEra0NidE53SFVWYU5lRGNvSFh5R0Z2NTZvVmlscC9qUnNQTStsZWJw?=
 =?utf-8?B?Z0pXeExlbGFWWHh2RmwwQ0RMYTZOQkNoN291TElUeG16Qnk1djBwd3R2Sk5F?=
 =?utf-8?B?Z0JjZlNkZ0d5SlRtektGUXN2NEJRSU02cWg3dzErMGVXVlV2RHpiSERSNS9D?=
 =?utf-8?B?WCtJdmhLbGNVZUU5aW5ObVY0WjZwSXBnODJwMVVpZE5MNDBlVGJ1aExrdTJH?=
 =?utf-8?B?czJIY3c2OWxkWnREVjlBcVZOMGY5Vml4eHcxYnVGbm9IdlVJS2hiVk4yVGVz?=
 =?utf-8?B?UnhTak1Zd0NRVG16dFhmczlqVmd6NkkzRzNJL3Foai9iMG9kbS9QSHRIK2Z4?=
 =?utf-8?B?ZHgya1pkUjRvK3N5WUFrMkVkTCtLWCtOK1FXa29kWksyY1M4VmpiTmFCMFFk?=
 =?utf-8?B?OGRPQUVxQkRyNlVpS2pYYVNpampiWmtoSW9OSTZLUXYwS09MVHpjQS9BaFJi?=
 =?utf-8?B?ZC9jRG9DU0JmaXhCeHNnUzhHVlpBRmJtTU9KWmRidm82Q05obVN5RmtBb21E?=
 =?utf-8?B?VjlUSkVia3Z2dXVVYVJqNkxlN3hFMG83OWc1eitIb2RjbnlBeWR6dCtJRWFa?=
 =?utf-8?B?K0ZGODlPTmJPazArRWx3aWloRks2ZU5jMU5iVGZITHBwQ0ZYdk8rTWR6RHpm?=
 =?utf-8?B?K3ZiOURFbjAyOWFDRVhxMm5UMzNEdDUwT1RsR1FYWS9uMnVmZjFObFV3Qzgx?=
 =?utf-8?B?eHIxNkxtWlFlY2lxN09SdCs5NFVTZWdkZnUrSm93ZldObmVNUU0wTXROazJJ?=
 =?utf-8?B?NFJjOXorN2s3aDZMaWJZeHpWNXNwRWpBVUVnZVlXcytpRDIvTWdXN1A5Nlp1?=
 =?utf-8?B?QmhzZDQ0UFcrOHVkejIxb0RsQ1hKNmlWUFRWQU96ZjBvakdXL09IZkkxTzY3?=
 =?utf-8?B?SjhUekpHR3J4R3dRRHlLS3ZWeVV4MnFZWG52anY3N2ZkenAzUytXZW9Ia25v?=
 =?utf-8?B?QnhOcm5yK0pXdzVjdFRiRUE2TnNjYk13VndMSzVGb2RaN0ZtRmRwUlNwY0dh?=
 =?utf-8?B?YzlvVHQvQnV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1NrNTF6VnI0SFl5RWZXdFJPdTUrTjAwZ3M4Y01jVTdUWTR2SnFTelMxT084?=
 =?utf-8?B?YWdrd3FPSWltUTVweTVvdEJXSzU1QUovN0dDK2ozUFJlRTJURTRnZENJMGkw?=
 =?utf-8?B?V0txY1NqMUhMTE1HRFJZSmhkb3JpTW5taXFVMDFxdDl1ekFUbGUwdjY3R2dm?=
 =?utf-8?B?LzlVaFRqNXVENG9HS1BDTU9VL2ZidkNWWUM2UEpOWFB5azBZbFV4R09nZTBH?=
 =?utf-8?B?ckZvOWFucnBwdG41enY3ckt1Y3V0dnNlNG0yR3BPTmtlNTkrKzB2QUV5dEdm?=
 =?utf-8?B?TEVnNFNjMit2UWN1RkRUNXgxeDMvazNPa2pic1ZYbDhGTmh1b3VScGNtWFI3?=
 =?utf-8?B?NjNNMUE5SnY1ai9Rbmh0TG41U2VPYU5NbzZBT1JKQnBBVVQ2bTRsd0prM1h1?=
 =?utf-8?B?Y2ZEa2NFY1pEZnBacnJkWVFyUmJwODhOMDNBZVlBZmRtTlJobnJ6OFE3dVpy?=
 =?utf-8?B?Z2dtVmdTZ0VDbndIK3I3YU1PT003aGNWanFGSi9NU2dndHR4bmMyQnh4N2FM?=
 =?utf-8?B?L3FNUEt5NmdKemw3dHFMRlIvNWY2MUQ0bDFiVC9zVC9zRTFZWmxBaUpXNFZM?=
 =?utf-8?B?VEVZZEI2VExXdC9CMWNIMG5VV3l6aUVaak1nbWdxa01PcnRTK0Q1MWd3WVp0?=
 =?utf-8?B?OHlaT2p4UHlqWFFhU3lxMUVNY2NwQ3R3SW5FTTVWVWN2c2JUWHZEeE9VSjlN?=
 =?utf-8?B?alRTM1FhenRMcllxcDhablZ2aUJ0cERSOW9FK3B5eGdvYXA5S01PUnVTamI4?=
 =?utf-8?B?VUJIaU1BRnBYa20zR2IyaDM4NjQydkZzdEJWb2hTckFBK2Z1UVdKT1Vmbncx?=
 =?utf-8?B?T2xpakVkdi83R2toNFVlcWE5dkZ2RkRTV3BncmplMHhwSFhDRmM3L3RQbi9D?=
 =?utf-8?B?a2l1MVZuVThta2laRmVDTWRYaVhaNUkwNGVlREllOTA3OUxoL3c0OUlUM0Fm?=
 =?utf-8?B?RkJEaUIwZUwwUFVtOTZHa2N2ek5VaGRLN0NwVHdZQWhBOWZuOGYxUStrNXB1?=
 =?utf-8?B?Zmg2bTJzT1pUbmxJY1dqcWRDQkhQaHNmYVFBbUEvN0Y3dGxHZ2RjemFVVGk5?=
 =?utf-8?B?M3JDY3IyNFFoUk5pOUJ1R0FZdElsRXB0VGlmazdTLzZFaFpWM2xSdFRaZzJ0?=
 =?utf-8?B?dG9ydUN0MjU3TmdVT3FRa3lwZXpYdzhLd1hwbkxFdEhGcFhGSW9BNlN4T3BW?=
 =?utf-8?B?TkNpa1FsUVRBYkUrRnUzU0NPbU1rZlFzTUhNVmNWd0hueEVKVXdnVHp0N1kz?=
 =?utf-8?B?S0htd3Y4WlFrdWwyTmdlL3VadFRyS2haNVdCQ1VLRnlKSUNuMGlodnpxWGIz?=
 =?utf-8?B?ZWxaUmJ3NUZsdWRyWXMwZ0lvZlc4enFsa2VhRzdEcWt0OFNNNWIvT1VMTXdS?=
 =?utf-8?B?YmFxYU9Db3dyNDZraTc4VjJERVhxSXdrWE9EWkhNVFVNa0liakNkTCtkQy9C?=
 =?utf-8?B?TEZYNEdCRFdwSkp4MjNnUmxCTmx4VCt2N0lBSlFjNVlzcFEvck84OEg2dHUx?=
 =?utf-8?B?UkkzTU9HcG1vNWoxZFdsalJYRmFBQW1Oa1M2WTNOQ2g1Zjh2ZHhmYXZ1K29R?=
 =?utf-8?B?Z2NhRXJETnN4NGNnU0hwRG04elVUeVBNdk9kWWRSUnR1eXZFV0FId3g3c01y?=
 =?utf-8?B?ZXV6RXE2YWJFcThlTzQwMnZNV2c4c3R5OHpQTTVaVERYRWs2OHBXS2Y3dW1I?=
 =?utf-8?B?UWNUd2o2ZWd3Znhha2ZUdXR5NEZLamVYU1BkRzJndXc5aC85MTZPcThnYk9s?=
 =?utf-8?B?OU9Ib2tIcDhhbDVIdjlhWTdzTkFUNHlLZTZHYW9McTlDbFhYNzExSEJqaXpP?=
 =?utf-8?B?VWJMcmdsL21QOUZ1dGxBK2ltV0ErbFBiVDV1Ym1jTEpXa3VjdFdna0l1a2Ir?=
 =?utf-8?B?aXY3QlhJWE9OL3JzTTJaU056aWxtUFdycUk4Uk5BeWJmU0hzUXZKV0VvTlF3?=
 =?utf-8?B?dDYvZ3N5b1Rja1kxWmVkS0U5eENzTk1CT29Ra0d4TGdZOVQ3K21zZ25hb1NZ?=
 =?utf-8?B?RGJwMnBNT1FHM1BERUQ0emlsSnN3ZkFyV0piWStJK0p1MGJqQlRUZE1IdVps?=
 =?utf-8?B?ZkZhME1Pc1NEUVdVQkg1OGh2cHZKK2p6M2dhZlFJd2pPK1ZRbStQdmppaXhC?=
 =?utf-8?Q?vWequ/edeHANDW76/ddzAeJjX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a8976c-f3c5-4d23-324c-08dde5086978
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 01:24:04.8030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ke0/lqwBdhi0lfAph1Z5uewVDQ9BGxbWefSut0Z7qrxVbeQAzY+TItulI3isPuMnpRMAZEdtFyiHMtcWq/Ii7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7691
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHNyaW5pdmFzIHBhbmRydXZh
ZGEgPHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBBdWd1c3QgMjYsIDIwMjUgOTozNSBQTQ0KPiBUbzogU3VuLCBYaW5wZW5nIDx4aW5wZW5nLnN1
bkBpbnRlbC5jb20+OyBqaWtvc0BrZXJuZWwub3JnOyBiZW50aXNzQGtlcm5lbC5vcmcNCj4gQ2M6
IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaGlkOiBpbnRlbC10aGMtaGlkOiBpbnRlbC1x
dWlja2kyYzogQWRkIFdDTCBEZXZpY2UgSURzDQo+IA0KPiBPbiBUdWUsIDIwMjUtMDgtMjYgYXQg
MTU6MjcgKzA4MDAsIFhpbnBlbmcgU3VuIHdyb3RlOg0KPiANCj4gTm90IGV2ZW4gYSBzaW5nbGUg
bGluZSBvZiBkZXNjcmlwdGlvbj8NCg0KV2lsbCBhZGQgYSBzaW1wbGUgZGVzY3JpcHRpb24gaW4g
bmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MsDQpYaW5wZW5nDQoNCj4gDQo+IFRoYW5rcywNCj4gU3Jp
bml2YXMNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWGlucGVuZyBTdW4gPHhpbnBlbmcuc3VuQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwt
cXVpY2tpMmMvcGNpLXF1aWNraTJjLmMgfCAyICsrDQo+ID4gwqBkcml2ZXJzL2hpZC9pbnRlbC10
aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oIHwgMiArKw0KPiA+IMKgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3BjaS1xdWlja2kyYy5jDQo+ID4gYi9k
cml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3BjaS1xdWlja2kyYy5jDQo+
ID4gaW5kZXggZjEyMmZkZTg3OWI5Li4xN2IxZjJkZjhmOGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcGNpLXF1aWNr
aTJjLmMNCj4gPiBAQCAtMTAxOSw2ICsxMDE5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkDQo+ID4gcXVpY2tpMmNfcGNpX3RibFtdID0gew0KPiA+IMKgCXsgUENJX0RFVklD
RV9EQVRBKElOVEVMLCBUSENfUFRMX0hfREVWSUNFX0lEX0kyQ19QT1JUMiwNCj4gPiAmcHRsX2Rk
YXRhKSB9LA0KPiA+IMKgCXsgUENJX0RFVklDRV9EQVRBKElOVEVMLCBUSENfUFRMX1VfREVWSUNF
X0lEX0kyQ19QT1JUMSwNCj4gPiAmcHRsX2RkYXRhKSB9LA0KPiA+IMKgCXsgUENJX0RFVklDRV9E
QVRBKElOVEVMLCBUSENfUFRMX1VfREVWSUNFX0lEX0kyQ19QT1JUMiwNCj4gPiAmcHRsX2RkYXRh
KSB9LA0KPiA+ICsJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIFRIQ19XQ0xfREVWSUNFX0lEX0ky
Q19QT1JUMSwNCj4gPiAmcHRsX2RkYXRhKSB9LA0KPiA+ICsJeyBQQ0lfREVWSUNFX0RBVEEoSU5U
RUwsIFRIQ19XQ0xfREVWSUNFX0lEX0kyQ19QT1JUMiwNCj4gPiAmcHRsX2RkYXRhKSB9LA0KPiA+
IMKgCXsgfQ0KPiA+IMKgfTsNCj4gPiDCoE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBxdWlja2ky
Y19wY2lfdGJsKTsgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9p
bnRlbC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaA0KPiA+IGIvZHJpdmVycy9oaWQvaW50ZWwtdGhj
LWhpZC9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaA0KPiA+IGluZGV4IGI3OGM4ODY0ZDM5
ZS4uMjQwNDkyYTM4YzI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1o
aWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtZGV2LmgNCj4gPiArKysgYi9kcml2ZXJzL2hpZC9p
bnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oDQo+ID4gQEAgLTEzLDYg
KzEzLDggQEANCj4gPiDCoCNkZWZpbmUNCj4gPiBQQ0lfREVWSUNFX0lEX0lOVEVMX1RIQ19QVExf
SF9ERVZJQ0VfSURfSTJDX1BPUlQyCTB4RTM0QQ0KPiA+IMKgI2RlZmluZQ0KPiA+IFBDSV9ERVZJ
Q0VfSURfSU5URUxfVEhDX1BUTF9VX0RFVklDRV9JRF9JMkNfUE9SVDEJMHhFNDQ4DQo+ID4gwqAj
ZGVmaW5lDQo+ID4gUENJX0RFVklDRV9JRF9JTlRFTF9USENfUFRMX1VfREVWSUNFX0lEX0kyQ19Q
T1JUMgkweEU0NEENCj4gPiArI2RlZmluZQ0KPiA+IFBDSV9ERVZJQ0VfSURfSU5URUxfVEhDX1dD
TF9ERVZJQ0VfSURfSTJDX1BPUlQxwqAJMHg0RDQ4DQo+ID4gKyNkZWZpbmUNCj4gPiBQQ0lfREVW
SUNFX0lEX0lOVEVMX1RIQ19XQ0xfREVWSUNFX0lEX0kyQ19QT1JUMsKgCTB4NEQ0QQ0KPiA+DQo+
ID4gwqAvKiBQYWNrZXQgc2l6ZSB2YWx1ZSwgdGhlIHVuaXQgaXMgMTYgYnl0ZXMgKi8NCj4gPiDC
oCNkZWZpbmUgTUFYX1BBQ0tFVF9TSVpFX1ZBTFVFX0xOTAkJCTI1Ng0KDQo=

