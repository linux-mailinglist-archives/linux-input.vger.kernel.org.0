Return-Path: <linux-input+bounces-11829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE240A92FB6
	for <lists+linux-input@lfdr.de>; Fri, 18 Apr 2025 04:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05BE1696ED
	for <lists+linux-input@lfdr.de>; Fri, 18 Apr 2025 02:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B237C266F10;
	Fri, 18 Apr 2025 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIUmVQeH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CC625E45F;
	Fri, 18 Apr 2025 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744941952; cv=fail; b=uCI8xOYINoDKI6UoYmT69VmwH0NKw7ceMdbUoxYg9pEfgMY9lU+epaFCztQTJBlqS30nNZ7ZvE+lFjMX86D+3AdauUfjdl5PZUKgK/0Zvcc/sEOW9IU2JQ0S62cjrwK19d1Sgw9FthKKa7EzrchI8NgoLug6AL8B7Ln0LGQnjB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744941952; c=relaxed/simple;
	bh=Ik5san1iMVY7G+tHD/p8QCn7Wq35U+Zir9nf5Vi8m0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eN4oNJe5YOAeSqlyrXhvIT+oER5UeEPrskAojEYMzXwI6CUwx7SgpX7L/mS8CgcyOMUfgWaoqnuF3NApYqaJwdQzy35zSexr2Sk4vTBORhJTdyGgIIYswSASS8mNRXB1j2dpeKih8S7XrCV0XGXg9B1zhYYkzIhiYdoR2+TII6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIUmVQeH; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744941951; x=1776477951;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ik5san1iMVY7G+tHD/p8QCn7Wq35U+Zir9nf5Vi8m0Q=;
  b=eIUmVQeHkNtyZ/klEGjmPIRYToeedXfRhXOVlQMXuTYtJNf6ybD9UI8w
   z428mHD9SJjr1yLr0VVrtd3zn+nWZGixXRm0ctZIxI3IJyyMx/2rhF9G6
   FLf+/aeJBU32e71fmSneGQPVJF7psJbiDqn0qFG65cVcrcEW17i7D1D5r
   xBMhgjdrUQQHr9kvkFrzYRBlmMLSeRM3D+EAj7p8j9+YPemXFlN0spxM7
   LhaAD5fI00LkD+lvX+d1mnArmyba0V97/8oOBzR72u1OwF/XEICRhBBrE
   KDulDV9uzHw1TXkodGSiyAGJD+MpsgkVi4fFsh3wBbp9Pulvr7IveAA+2
   A==;
X-CSE-ConnectionGUID: Gf9YJHo/TYe73IV9S/6eRA==
X-CSE-MsgGUID: BjqGQbSMRiqbmw4f7h0V/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46689876"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="46689876"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 19:05:39 -0700
X-CSE-ConnectionGUID: ZRkavdjzQI+OdmxTNLVAIA==
X-CSE-MsgGUID: HGMIg1xcSmOg/b+0ggI4Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="130980179"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 19:05:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 19:05:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 19:05:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 19:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SStypHpS7oEHGl/pP+7G6sPK1UF2KZ88cmSfYkxpqN9i5lrUYFxosnrPXdckCxGeUReo8kam4TCqX37pG33Cqw9Sh7VEq7ektuzvsxaVaakIKk1Vx7iKHyeF6TMm4NMQ5HM8NER2995dFG9my72kPa+FxaOpVg1J7f1C56Dhs3mIOTc71xeA7j0SucnUUut80EDQIxDCEulQb1KNYsYntG/uNFDKEdQrRcSCggnE5cDFoewAj3XJR/JFnjItqbvvsWZ9FYhr2fJBLGkDJOUonUhglSocBtmLjw2Q47sOYlB/BvvlWGbzC3I/IWGtC5V7WvexV/FO28fmQh36mt/BNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLA7Y0usWqj6GhJXT/gUrY6vcGYTiPeJyFhXIoUjBFA=;
 b=DTxz4Dt3cVz1d8Ik58/KnxSgK3dVHqpGugpFDNPd8lw2CSLX67CYwKjX1sUKdznjJjkvX559Zxq8QnliJaDMV9PqU2dAKEuVnICBezjG5EA4jBfk8jGicJ5NOJV27ahggoySmCMZOd2Ng5X1Yc0QgQq2FcmCU++2C0wXS6V5Cm97eVgiWgaNLfkAWHe2AHp4eebgbuQtzGnBI6qZ4oiA1ifyavp2CG0FjJts+p5Oh3zpPBA7IRCHVdiqA+8PPKq5haAUjLTWIHYu+T+r9gEUfXO5Cx7iUzwqRxbGwILKxqmGx2rp6kOoyvjk3BOrPziHG1YfFknmrzsKewPy8yuKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 02:05:36 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%6]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 02:05:35 +0000
From: "Xu, Even" <even.xu@intel.com>
To: WangYuli <wangyuli@uniontech.com>, "Sun, Xinpeng" <xinpeng.sun@intel.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"guanwentao@uniontech.com" <guanwentao@uniontech.com>, "phasta@kernel.org"
	<phasta@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "zhanjun@uniontech.com"
	<zhanjun@uniontech.com>, "niecheng1@uniontech.com" <niecheng1@uniontech.com>
Subject: RE: [PATCH] HID: intel-thc-hid: intel-quicki2c: pass correct
 arguments to acpi_evaluate_object
Thread-Topic: [PATCH] HID: intel-thc-hid: intel-quicki2c: pass correct
 arguments to acpi_evaluate_object
Thread-Index: AQHbr5/VBp5Ga9I6rEyJ1wLw95dugLOorMfw
Date: Fri, 18 Apr 2025 02:05:35 +0000
Message-ID: <IA1PR11MB609853AC82FFA8D7B4006E5BF4BF2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <DA446911D078F45A+20250417135023.543707-1-wangyuli@uniontech.com>
In-Reply-To: <DA446911D078F45A+20250417135023.543707-1-wangyuli@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|DM4PR11MB6429:EE_
x-ms-office365-filtering-correlation-id: edff0be4-cd8d-4c0f-96eb-08dd7e1d8211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?G4maYdS+NCwgyrvpDBj7CTR5MkLIRG6NkOZVAsqb06VoYJqMv9/1mGbr2Bm7?=
 =?us-ascii?Q?3/j1O193vuTs86THNRVDTj+cIr0DWRQ9ZC9yMURcX4rYNS5QhZG2rPYtfrbX?=
 =?us-ascii?Q?VfLmtX45l+B81shRkGHpjaF7XCPz1ElWEbqOU658GAlZZwZO5ThURVV+cm7E?=
 =?us-ascii?Q?HQDd4y1fLLGcusKhop5y1XdJ6iqJEypp5rEwu6h9imYlIqbnbMbr/KQSz2Fd?=
 =?us-ascii?Q?DmQ9JlzCCnAoEygEBdmwIRph7AeoWIKdloDAPWqAMX4VxFToauuf1M6GQsl2?=
 =?us-ascii?Q?aG5zDWCIyvLVod9yXmTUo/BrFpoiyri5sLnszruT1R4lG4cs+FhrdMhfE1XL?=
 =?us-ascii?Q?bssDKfBDDejRB2PbRSa7oIkJPamaWxZUkAm0bTWRs9CsX7/iBUGftJjCRwYq?=
 =?us-ascii?Q?isLNX8bPR4EO11oJEAKQ+F6cwDxFua/1ofdNEXcJsyBu+iHa+bFKgy1T7nYB?=
 =?us-ascii?Q?C8LmXq4AkvulgrE+TNbR/ZywjSdHvNCx1SDuNd1UbnlulxR6LI4dLTkPXqHa?=
 =?us-ascii?Q?0zzeVfm3UJloCVKn5I1uHaXe/Uvd8joA00B2OnBNjvu/SoUAVjt4Y79iDbmU?=
 =?us-ascii?Q?f9sdZo5Bx9hrv04SJSLStMS8JA8ovsRCQ5mL2KODrIlyPIe0OC9W3VbJBi2f?=
 =?us-ascii?Q?XwgAIW13Dro9/G6WHZXHaCySk8qYBvObtdEsOeR6rt+x+ij78G2SSJet/+sR?=
 =?us-ascii?Q?EXx8db/SxR0PgsAZMfE537qvLaRPZDgbSBhCs7W2vzwzhHk3hevGqQ8YFOul?=
 =?us-ascii?Q?B5gf5xhnBu+Uz3a5Bggbxb1q1mW0AtTGY/jtaDuwfS2PSBxo51Et44DDlIn8?=
 =?us-ascii?Q?EF80CYPK36iF8f9REDc9iJvyTooNIOs5VC6rI9+5yyGo2QfdPzl0TotoJQBl?=
 =?us-ascii?Q?iDpmrGJwHS82lBbvTAtiqOMCGUvZmm7Iz+smzE/ZTQiKb6UTcxYIST90DdQB?=
 =?us-ascii?Q?XrGkOGGoFmWsCXJd/zqUjgJqEDoSlImGdFG8lypvLln6ROygFAq0qM/6pvYV?=
 =?us-ascii?Q?+KWZ/Ev8AxOLrKWniNMINFHphn2gpIe5lnPhUOrDTLK8AM+3lI4SEistwyYk?=
 =?us-ascii?Q?3CIFhyD0oai5Wrm3yOdBAvkoS+HWwMfKU2hXK+xhqvcMTrCGb8UCHiZ2ucRc?=
 =?us-ascii?Q?heSXGdvkUy806ylpXpBwaqLb7smP5n1UwUXlA467FzCMHg0EyqspDWSOCiCs?=
 =?us-ascii?Q?M60vNm5zwPG7wFkk7QLqDy4xJ6cR878Pyt1KE3KibpHfhVSDb8NFzNrVwwL+?=
 =?us-ascii?Q?nd0OJyfPQwR/RNRgaDLoFgAmGpSejUzDQP2SAdBbaw4PcY4hR5JE2zmEJSWJ?=
 =?us-ascii?Q?/gFqdccn94d6bJZ5BGGvMxIRZh0j+FMLEzOLZa/b8J9jGF5L1oPw6OSJ96eb?=
 =?us-ascii?Q?UYpljgUKOv8qKBgsYSZ+XrD+tXzqJoseX9t3c8/EhYShnn0vZchFrbDgrfHL?=
 =?us-ascii?Q?xyoF4siZD2ELX9gJN/aXrRY6ZbjIIyBOjclLK6HntgBSc12SAkzPkw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6XnwiHkNX5JolGWtGE1jsoS4NIQdZ7iK+Apk8e3z4Q0jvoAYu3Fz7G+O5QRj?=
 =?us-ascii?Q?Uq91OwLZ8cX29dXO3o4JVYylQzVIpisTBHQ6pBmD6LLSrJwyQQtW+Oh/0IH7?=
 =?us-ascii?Q?o/fegEjtznLHclKxGuXuYlKHw5DUnWiEx+M16Zwk9lmGNXJsG4OIPlbN1f2e?=
 =?us-ascii?Q?xgjgT57NqZsKb7XtDHY6gr1mrMUAmp3N+vy3u34kgDQZQaLLtwsWxQEeQVJx?=
 =?us-ascii?Q?LQQfCXWAnYrcLXyZRnwfhQ2Kcphxfqipi/jJLs+MpPu7yfk0HMtIylsMStGn?=
 =?us-ascii?Q?TVVjEFajMAXFxvTKDWfkGVyToaxPbOTRmQmxp1xC3EoVXIDUzNyyB60zDy/j?=
 =?us-ascii?Q?S+U7W20ZeSvQwx4hT8Or1zHbC+VuNC76zWq0ggELspDi6rOZ8b+K0E0qv3qx?=
 =?us-ascii?Q?+uORM0lUN7ijVcKvCZdIN+HyzQQE7zd8VYjx5qEB3GULRgsRW38KTaAQ0VB0?=
 =?us-ascii?Q?nKHY9eKZU57g/d9XOgoXwRmxVb/JKD8CS8bgqCGyELDfOYY45emqUu/tL6OL?=
 =?us-ascii?Q?h53OuCNdo/IFF9fGf9AdOx4Giznvm0FzmXRShKXmfI0+OXLkj/F3yYNWLHR/?=
 =?us-ascii?Q?qsS6zSa4C+gItWIllAN00M4UjCn7fUngSmSrjJql7rmpnzX+Hew5tAZNW4sD?=
 =?us-ascii?Q?nOS5yy6q2zcwSUjVKVa+lycR79IjWpHLV4gYzwuX+2DCt0BRat8i7lr9+J4C?=
 =?us-ascii?Q?fNvpv8aa6tTULiMDGar6qmzA7SPZiCvoadAn4oZ75i5Z2J5DqkR7tXIJFao7?=
 =?us-ascii?Q?8xgBgRPhITkSjjqYqIqqOit4BBuDiyK2WdY3M52625cIz6oVb9YWJEvGrF8R?=
 =?us-ascii?Q?EcjgGkmfOfbNg+E0taLOS2U5dWv1UmZJPoZeXdq04kGrcE6vBvaspHzxBnca?=
 =?us-ascii?Q?TCcFSK3resO9TWylcDCmmuqGJjeLSuZqKKIs+A4b5w7jsa29S6jL7RhYfPkA?=
 =?us-ascii?Q?N+cIMLhP+x2VN1w+JnpTGRV9fI+JAjH2piFg5bDhLGPUP/Egfv7TuW0K5ldS?=
 =?us-ascii?Q?sP88xPNvOxounIwknzZVStYJDFTNMD3/qPE/48nnKjJDHtuA1O6jyRUba9PX?=
 =?us-ascii?Q?IOqlQ44FMh7M4v1eJ4u13Yqbcy1A4E+OigjoMWCfLRzBVJpUyhyNHGF7h6TW?=
 =?us-ascii?Q?oLbnFpDF0TNV3tnswuUn3cgb42W5Te/kVEvQFX91FgdkTTUOrMMnoTcl94cn?=
 =?us-ascii?Q?Keql40wvrvWaz4w+wv7HCHc6gbU8ucuxyj5ElmbEp8fFfoaNCcO4i5hHdYPz?=
 =?us-ascii?Q?l+On8FE1KJLK+Blv+UYcQbUqdye2QuhUgTnS0F8qxLWvURI4950bg5tM19ao?=
 =?us-ascii?Q?YBwStwoRYncTjHcEKk3t1CldpTkFMTo4USvh87ZM1deK7s0fmliCFYfvYWsw?=
 =?us-ascii?Q?B6MxVevpy9XvcviPrWTJwRAFpLIo3Mzj0pxu4AY4XfvQo00aH2IXcQQMzXSY?=
 =?us-ascii?Q?M1eIRwooDFy9NSMLVEVvlM5FKr9pFelC1YzEUIHQrTqLwlXl3SQAU0mlzD1i?=
 =?us-ascii?Q?o2CrbCXNi8BJB88GgP44q1qhkCqVIeOo0qu69MzBIGDZKkpyfukPNmegKHFP?=
 =?us-ascii?Q?kyqUlhQwcfocWwf2bampHDfXxFPIFGt/YZhgACHD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edff0be4-cd8d-4c0f-96eb-08dd7e1d8211
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 02:05:35.7298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0DFJf3MAHTkveDWayNj3Qhm2EVXlXtuldq51pjJn9AYN0FzYjDsWIkpjMXvt8X+/2x3LnA42Rfn9/MpMW9jV8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: WangYuli <wangyuli@uniontech.com>
> Sent: Thursday, April 17, 2025 9:50 PM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> jikos@kernel.org; bentiss@kernel.org
> Cc: mpearson-lenovo@squebb.ca; srinivas.pandruvada@linux.intel.com;
> guanwentao@uniontech.com; phasta@kernel.org; linux-input@vger.kernel.org;
> linux-kernel@vger.kernel.org; zhanjun@uniontech.com;
> niecheng1@uniontech.com; WangYuli <wangyuli@uniontech.com>
> Subject: [PATCH] HID: intel-thc-hid: intel-quicki2c: pass correct argumen=
ts to
> acpi_evaluate_object
>=20
> From: Wentao Guan <guanwentao@uniontech.com>
>=20
> Delete unused argument, pass correct argument to acpi_evaluate_object.
>=20
> Log:
>   intel_quicki2c 0000:00:10.0: enabling device (0000 -> 0002)
>   ACPI: \_SB.PC00.THC0.ICRS: 1 arguments were passed to a non-method ACPI
> object (Buffer) (20230628/nsarguments-211)
>   ACPI: \_SB.PC00.THC0.ISUB: 1 arguments were passed to a non-method ACPI
> object (Buffer) (20230628/nsarguments-211)
>=20
> Fixes: 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2=
C ACPI
> interfaces")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index fa51155ebe39..8a8c4a46f927 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -82,15 +82,10 @@ static int quicki2c_acpi_get_dsd_property(struct
> acpi_device *adev, acpi_string  {
>  	acpi_handle handle =3D acpi_device_handle(adev);
>  	struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object obj =3D { .type =3D type };
> -	struct acpi_object_list arg_list =3D {
> -		.count =3D 1,
> -		.pointer =3D &obj,
> -	};
>  	union acpi_object *ret_obj;
>  	acpi_status status;
>=20
> -	status =3D acpi_evaluate_object(handle, dsd_method_name, &arg_list,
> &buffer);
> +	status =3D acpi_evaluate_object(handle, dsd_method_name, NULL,
> &buffer);

Just tested this patch, it works.
Thanks for the fix!

Reviewed-by: Even Xu <even.xu@intel.com>

>  	if (ACPI_FAILURE(status)) {
>  		acpi_handle_err(handle,
>  				"Can't evaluate %s method: %d\n",
> dsd_method_name, status);
> --
> 2.49.0


