Return-Path: <linux-input+bounces-12619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE78AC66B0
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 12:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DDC9E3AE9
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEEA279334;
	Wed, 28 May 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhkeDgNp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6ED276028;
	Wed, 28 May 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426920; cv=fail; b=suRj+wgbrK9/6bowm/XhA9V0hO/oaLdtHJOEOG6n17nBOhNiYXAGIiyWPQ5C4LXe8+IwNQL6YkT+VNLXMGKVa99K8NGamoriXsvm3hwQ7BJ+qy1ekw/+IC3ekfJN4z7JcM0PY2IAZZb4WWelpq6L3Z6wz9PWeYcURSb/3KHGLUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426920; c=relaxed/simple;
	bh=BzQXSijwrhGC/g4PzIibxL7IGr18RfcJ9KlDyFwjDrM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c1EU13q5xrZNXf1Z6R+Yz/5daZYQif7q58oQRYActGe+WhiE99Sntk8EpqHbNq0xVJiBX/Zk2cYiFTALi/ayOw4UYE7IpkjjnwUiExh0k5B6uRikcxfIc1RhUQw6zDyiNDdNeNO1UeEllReJU97jrW/bbVMdHUI7Krjd8NcT72o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhkeDgNp; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748426919; x=1779962919;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=BzQXSijwrhGC/g4PzIibxL7IGr18RfcJ9KlDyFwjDrM=;
  b=YhkeDgNppdZ4F4cOLnXQSGG2ebv9jcCna3Y0zAIcssbfWWHUnjW026yE
   6aXnh8D9v9X2wXyzRy/+gTlr/kzYwhySvUy5LBanp3XTNjGg+utnRPi3J
   /Db89H9z9nJs2dPs2JnfJAKuSER1YD2dovraolZ8w9N+PpoxgUn7IiRNh
   WVcihlGyKKuzhHfRqk3XbuDuvivH1va5jwCkUKhzcdN7gvKjgLJ2MD+Li
   Sfr41Q5b5FIYKYumLej4mS442bT+Fw0W/mSIrz+I3kmzbuhuJnrPqo9oz
   f2nZUkHNd6v7IXxOhJTghiL+NWK459sD90biYkpIkDnLmQSiT5EZv6JB+
   Q==;
X-CSE-ConnectionGUID: FdO/ACd0RQClKN6awpi5sA==
X-CSE-MsgGUID: eFY73xlfSJeBKlxdg047rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61847326"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61847326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:08:38 -0700
X-CSE-ConnectionGUID: owvwdaFNT0OBsEPHDzpEBQ==
X-CSE-MsgGUID: nwJalbaySs+qnc/BXxCv8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="148060572"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:08:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 03:08:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 03:08:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 03:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWxa4Op4pByaxmff5RJp/M3NM2aJan80hubPoJt84XbkxFxHO7Uu/lfhJrG3wWrmNP2E8ek2BbbZeb69wASpP3qszHIvMntDqM3z2HINiwukp7bvy1mmlVudlPhPVHu5gb08uW8TSmYPcBCXDqwWpnr77ddPcsmCP6Pq5UCR2/Y5fRL2XalzG3cVndeAUq8+D8VVU5vziIOa+64dIpwLLSB7LlhrXGVL2CIL29lDKC380znPvUPG0DnKYyktxNuVb6BiZbTOvK53qSjW1pUmgoKMoHVYhruLEFddWw8pW9UsvmiVcAcONessc1WR6K/PtdeIZpLDL/XsrwTL2NKUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Gs+kxuclT3M41zZADjyS+cxb1+G36AQVnRjeAu0w+4=;
 b=BBm5xavOSlr7ugaYTKQkDwvFNUIOaTST8Xiz5BdkyXNcgaxmWnUo+y68HGULIqcU6YcrNTQyBCXQmPEWLSSajU8v3n2cvy9muqkGpH+umf0ALW3GpnibgSb0hGU4aw0TFYkoxKPwDGD7P5q1J03d/v/NUlDggT18IUULZ9vrh+uQwkY86IZpxTjvh2M0TgTxL9iQ4GfJz7lw0/jCi+E4TsQOQCx7hyqyDqq3/CFhjwvuRuv5LQD6G3eiV0i4Q0/PvTnmZYI23kcRGhj4WE5kiqBJrXLZEdv96Zq0rX/hCZmWQrUYeiC1/xElv9Ar2PsWGmgHypXsz3OOQA+Z1oz5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 28 May
 2025 10:08:20 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 10:08:19 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "luke@ljones.dev" <luke@ljones.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: [REGRESSSION] on linux-next (next-20250509)
Thread-Topic: [REGRESSSION] on linux-next (next-20250509)
Thread-Index: AdvPttzrVyB72AhVShepIdcaeKHEtA==
Date: Wed, 28 May 2025 10:08:19 +0000
Message-ID: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW4PR11MB5821:EE_
x-ms-office365-filtering-correlation-id: 0b5ed02a-9524-4b58-240b-08dd9dcf9291
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?FpphNRNtPCurdcZiTOwKDO2ZWme6ycs7w6ewWsfQF7kFYO9rN9Mi3omNEG?=
 =?iso-8859-1?Q?vevDebLxai9NQYUU+CL0hc9cP/PO+/FZ4LO60qDkHuXYojP8QMtcorhphL?=
 =?iso-8859-1?Q?xoh7EJrISG2i2vnPI3gURwbkydQADjLr4vs5V29eQlJ7aize/LUnD4Q6K+?=
 =?iso-8859-1?Q?ckeX91bEd5LTYZZLyDIthiLggrQ6r1w3xvRvf8i71aQMmCJSirl6UwUQ8s?=
 =?iso-8859-1?Q?VpG2X0vD+RYi1kvj+gIBxMADiQO93Xq+AlgXz+toLB9Ge1B6bKzC3UhNgc?=
 =?iso-8859-1?Q?236YX8Prk4zZzQGvYt0McoSQK6pG3MkZh9fNpwdJUl/axkJUazAmBkLke9?=
 =?iso-8859-1?Q?O9tpTr4rA8j4ZIAJoeyrxlzYUyBNYFCcgNyH5wJ1ITsfs7zWJmNXguwj83?=
 =?iso-8859-1?Q?pI/4iOB4j0AtIUVo2MpHNO18f4Bz4r5fIgNR2jjHtzsMHBTQ8TtYVEszUH?=
 =?iso-8859-1?Q?dAKBHDlpijDOVWKvgMc2dsvtrJlan97Le++PHhl3c6ZaAM/MLaI6Njtqg1?=
 =?iso-8859-1?Q?OND9VNrXSRsaDqefn73S3P1XT72VIQCqee+FA2q05qmb5GKJ71qMuIIYqC?=
 =?iso-8859-1?Q?0jldpa9qnqG+GVawyjGtEk8RD4AuZ/T6pDGjHx7oj4icMo5vbX/zI1QQby?=
 =?iso-8859-1?Q?A045sit+O1SNNfrI0T5br1vUDA9uV3N+javgH9oRBaIeAWnlPW3xmoa/Bn?=
 =?iso-8859-1?Q?t6f2QzVAqcUMV+V5Rn2lpW1raI8EDFg87g1GVUQPeF1jF3w/VqIofNCkHO?=
 =?iso-8859-1?Q?p/h4p3yugeXhpLYEBPaneHDar1ArKCaPcd49fTt7enp+PVbZsEeK7A4RLo?=
 =?iso-8859-1?Q?/S3YKbu8ca6LGEo13lFW5YAQCy46+aTkWQ5zSPwFcdpLSXsgneJlQ9nbgS?=
 =?iso-8859-1?Q?X8bMN4IE2dAwBKUvZCleff4RuzTdQN9XPqcxsj87Sj9T7QG2us9eoJ1M/J?=
 =?iso-8859-1?Q?kAdgi7K4QJ+l8YaX0xBlT/57zOKtK2YmHYKRGq245b14XYymVo6DBIk4iv?=
 =?iso-8859-1?Q?V2rGXaxI7KJM0D2KuOZLmEwtW3o6m/gWOg1/NDYUHLuZQttWcJpBHhC7BF?=
 =?iso-8859-1?Q?riNGq8wkNnBJcLn2rRKcFzTZg8907qZ5jawoCSMbv6wtfczjMOWMQjzShe?=
 =?iso-8859-1?Q?8gLf5wyeQQgTqnfa8MnvEgNRSVWRNF4oxyBgRAegnDDLvZi1Kh4Vpzgbpx?=
 =?iso-8859-1?Q?0OnWsAYfO2abnqBhxF9Tq/w7VIVfvyjTq5z2+vVuJzT+OY6bG79cb2mnZF?=
 =?iso-8859-1?Q?bAP/DraJIqnrHA/Q4sUyj4A+0V1iQ4Z/Uv2Em9z5bWiQbII/HstJ3ZvpU2?=
 =?iso-8859-1?Q?Am7TFYk3Mk96i/vALp/erG5sLrNE3Z7iMkJAC7FIraHiOVo2H1ZgSZmMEr?=
 =?iso-8859-1?Q?D22UXNDVTFztHOB6igAduhz2ZMuLqHuXgeOru+Wnj2QY/6thLYT4VPDAfi?=
 =?iso-8859-1?Q?4wgU5YjQOjYxuFEvDKUl1be6d04zQzpFMMg0RyfP7VnCg9LDRR7VyV8VEf?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5hfhIWsMlunfJD26KvA2WuyfCZ02klJMW60G3Emey3JzTEAqWMk0z55Xah?=
 =?iso-8859-1?Q?NVoNzAtrnEC2ZQ5hnPUmy+nYr420hFlCYLJmA+G50dA+KO4sxXNul79jLx?=
 =?iso-8859-1?Q?deAaho9oL71pnI0Q1g+x1UMm0AWdmMPvZFN6IBKCjIGlMz7JoRS+zgWvOq?=
 =?iso-8859-1?Q?NGYjZmVrB2oPevVEqjiZOY4GSpUbKm7YEdUJo4F6E3huicH21ylMMvHCwX?=
 =?iso-8859-1?Q?hDES5Ct+gX+g4KMifixvrOWMV6M5kyoTpDrJB3OoWic5k5Y/mi9UJz2GZR?=
 =?iso-8859-1?Q?NIL+ToLvEWEC4V9W+1ir3Zz+eckeshBespzQVMlG9+erRM8JMy/aPO5TQ+?=
 =?iso-8859-1?Q?IK/96tDG4CaXFbO7JGAE51+oD0bYzsBn8xw3q/KZ9zNOgqyVABR8ImNWf6?=
 =?iso-8859-1?Q?gxdABtyYFzaxE72w+lTzBCcSl3i5iTiWhlN+cwWO4QUYHTQ2q6LDAwp8HG?=
 =?iso-8859-1?Q?7qX6ID6tsdlqcLHmIADtjHOCOg+bYQQG/Xqv1gLEi++FjuUwG/FSm8VAV4?=
 =?iso-8859-1?Q?QWN1KJFUfjtPWi1gyjF4SkOL29RV9ZN7OdwwdG+uehsHUWEnnng89GKPhT?=
 =?iso-8859-1?Q?ZnQkpzNaYC3iF5wBWeXDBkB1zcM/HpCtVqcLa+QjyerGk0wu1gGTJy0a7R?=
 =?iso-8859-1?Q?nPHvLtZT+ilSPH9FLcHs00ST2X6lkxqs2Mgkkoy097S9z98A5Zcp3QkLi+?=
 =?iso-8859-1?Q?VGreLXYRu307VYFI4B/8MUfQpxVhKtWcvYdn0qfRh6+7nRb3Txpv3XdRMn?=
 =?iso-8859-1?Q?s55VhuNI9IiAw0InMHddCcMsM3rYuA2RyAwHFbgmqK9pGwChncIGDoLiSw?=
 =?iso-8859-1?Q?55eCCYa/wtK3uB3jQUr9QY9WBS5hs1GjzE2uGrgwmfYi521AYet0eYYJvn?=
 =?iso-8859-1?Q?DCnGJU1+jmkiul3ZoC0r7+4rH86N3bOvR+ewlZxojOgpEqeCB+6JIjZlhi?=
 =?iso-8859-1?Q?i2d2zj0mzXQSNc5Z0AF946pbRuAyiluwVPHYrCdDqJtVqaYqIAZG/RT49C?=
 =?iso-8859-1?Q?z/fXdI6w23mfXckO3h0MTh2vKyv4pZM/2kgf7maa+98XMnbS2Y3Ibztb8w?=
 =?iso-8859-1?Q?9aSN0KUgEkUZEUWQrtqdp2UpT4GnrB0E8fA1vh8HIDUtjCH1nzoKRxYDJT?=
 =?iso-8859-1?Q?amdh1aUqb/4OHivsAN8rb9s7RWlvTskITyzhb8H//o45sVNmcnUih/fhLu?=
 =?iso-8859-1?Q?fWcSydPrJwIbh2VQF1kRT0uPsDXlb2oHOweJ0rq3N2dMEwIxCNBIOzbLK9?=
 =?iso-8859-1?Q?IV++zlcXN9AsPRjdxRdZuhriEXEfQLT5vV3LRa9GVFL0nggi6cEqCUoiNL?=
 =?iso-8859-1?Q?Wd/g1xeLEZhLr3KmRLhMNeaPBmdYvY3g42fEuaQsddvMkzLEfmgRDbIhot?=
 =?iso-8859-1?Q?A9rzhF8H0Pt/r1m14vqbuM4iYPLyxPqtbeFeZH1Ru8+J9TnSDpGTRPCbDE?=
 =?iso-8859-1?Q?+yCHk/lmcZ7TZlQLhyV8zRXN0Z5TCG9zH4dhDTsFt6SNXffY8qvFL6NHAT?=
 =?iso-8859-1?Q?tDFZuDZEkDk7ihOZBiLK/szCZN99k1MEFlKkkTqo80nbzt5jkggfGntuvR?=
 =?iso-8859-1?Q?n86ttq3FZNw8h/3VV+TlF8/7l2/Ce2emqMkb4+rM1vlzb1/UBhmj0Zcvix?=
 =?iso-8859-1?Q?ilZycL9j6qbWapkQ4+aHOvsKv5WLdiSNoZjCh2f3FbihGoVAGFFFLf2A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5ed02a-9524-4b58-240b-08dd9dcf9291
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 10:08:19.9166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8XXi5qxOZ2K67SKtrNsA3s6HfDWBdTBhQKjtwiqm8ESvYceuwZr5xfgXg67+pijax3tza+cjvd0ol/C9alTtbu9caxRI5GBRj3C0RE8Dfyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-OriginatorOrg: intel.com

Hello Luke,

Hope you are doing well. I am Chaitanya from the linux graphics team in Int=
el.

This mail is regarding a regression we are seeing in our CI runs[1] on linu=
x-next repository.

Since the version next-20250509 [2], we are seeing the following regression

```````````````````````````````````````````````````````````````````````````=
``````
<4>[    5.400826] ------------[ cut here ]------------
<4>[    5.400832] list_add double add: new=3Dffffffffa07c0ca0, prev=3Dfffff=
fff837e9a60, next=3Dffffffffa07c0ca0.
<4>[    5.400845] WARNING: CPU: 0 PID: 379 at lib/list_debug.c:35 __list_ad=
d_valid_or_report+0xdc/0xf0
<4>[    5.400850] Modules linked in: cmdlinepart(+) eeepc_wmi(+) asus_nb_wm=
i(+) asus_wmi spi_nor(+) sparse_keymap mei_pxp mtd platform_profile kvm_int=
el(+) mei_hdcp wmi_bmof kvm irqbypass polyval_clmulni usbhid ghash_clmulni_=
intel snd_hda_intel hid sha1_ssse3 r8152(+) binfmt_misc aesni_intel snd_int=
el_dspcfg mii r8169 snd_hda_codec rapl video snd_hda_core intel_cstate snd_=
hwdep realtek snd_pcm snd_timer mei_me snd i2c_i801 i2c_mux spi_intel_pci i=
dma64 soundcore spi_intel i2c_smbus mei intel_pmc_core nls_iso8859_1 pmt_te=
lemetry pmt_class intel_pmc_ssram_telemetry pinctrl_alderlake intel_vsec ac=
pi_tad wmi acpi_pad dm_multipath msr nvme_fabrics fuse efi_pstore nfnetlink=
 ip_tables x_tables autofs4
<4>[    5.400904] CPU: 0 UID: 0 PID: 379 Comm: (udev-worker) Tainted: G S  =
                6.15.0-rc7-next-20250526-next-20250526-g3be1a7a31fbd+ #1 PR=
EEMPT(voluntary)=20
<4>[    5.400907] Tainted: [S]=3DCPU_OUT_OF_SPEC
<4>[    5.400908] Hardware name: ASUS System Product Name/PRIME Z790-P WIFI=
, BIOS 0812 02/24/2023
<4>[    5.400909] RIP: 0010:__list_add_valid_or_report+0xdc/0xf0
<4>[    5.400912] Code: 16 48 89 f1 4c 89 e6 e8 a2 c5 5f ff 0f 0b 31 c0 e9 =
72 ff ff ff 48 89 f2 4c 89 e1 48 89 fe 48 c7 c7 68 ba 0f 83 e8 84 c5 5f ff =
<0f> 0b 31 c0 e9 54 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 90
<4>[    5.400914] RSP: 0018:ffffc90002763588 EFLAGS: 00010246
<4>[    5.400916] RAX: 0000000000000000 RBX: ffffffffa07c0ca0 RCX: 00000000=
00000000
<4>[    5.400918] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000=
00000000
<4>[    5.400919] RBP: ffffc90002763598 R08: 0000000000000000 R09: 00000000=
00000000
<4>[    5.400920] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff=
a07c0ca0
<4>[    5.400921] R13: ffffffffa07c0ca0 R14: 0000000000000000 R15: ffff8881=
212d6da0
<4>[    5.400923] FS:  0000778637b418c0(0000) GS:ffff8888dad0c000(0000) knl=
GS:0000000000000000
<4>[    5.400926] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    5.400928] CR2: 00007786373b80b2 CR3: 0000000116faa000 CR4: 00000000=
00f50ef0
<4>[    5.400931] PKRU: 55555554
<4>[    5.400933] Call Trace:
<4>[    5.400935]  <TASK>
<4>[    5.400937]  ? lock_system_sleep+0x2b/0x40
<4>[    5.400942]  acpi_register_lps0_dev+0x58/0xb0
<4>[    5.400949]  asus_wmi_probe+0x7f/0x1930 [asus_wmi]
<4>[    5.400956]  ? kernfs_create_link+0x69/0xe0
```````````````````````````````````````````````````````````````````````````=
``````
Detailed log can be found in [3].

After bisecting the tree, the following patch [4] seems to be the first "ba=
d"
commit

```````````````````````````````````````````````````````````````````````````=
``````````````````````````````
commit feea7bd6b02d43a794e3f065650d89cf8d8e8e59
Author: Luke D. Jones mailto:luke@ljones.dev
Date:=A0=A0 Sun Mar 23 15:34:21 2025 +1300

=A0=A0=A0 platform/x86: asus-wmi: Refactor Ally suspend/resume
```````````````````````````````````````````````````````````````````````````=
``````````````````````````````

We could not revert the patch because of merge conflict but resetting to th=
e parent of the commit seems to fix the issue

Could you please check why the patch causes this regression and provide a f=
ix if necessary?

Thank you.

Regards

Chaitanya

[1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20250509=20
[3] https://intel-gfx-ci.01.org/tree/linux-next/next-20250526/bat-rpls-4/bo=
ot0.txt=20
[4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20250509&id=3Dfeea7bd6b02d43a794e3f065650d89cf8d8e8e59



