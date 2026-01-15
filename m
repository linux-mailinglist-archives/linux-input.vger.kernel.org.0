Return-Path: <linux-input+bounces-17115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3591D25609
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04289300797E
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 15:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F1A348463;
	Thu, 15 Jan 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VzLsy7JQ"
X-Original-To: linux-input@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13252750ED;
	Thu, 15 Jan 2026 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490969; cv=fail; b=dZzK8xgldJX7LypyQhpPoxpG5RPZ/A98D8ge5JokKlogYQufu/ZBLvz13B7lZyUKqnBol+B04luVJ5ikWNo/LtTLjG+IvGT49anZYOWWG7dsf3t58qzEhXcyzzB2SWhBlU25fq4YAWoYKThaQSj+WM2taD4CvKff6Mvhry4VG4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490969; c=relaxed/simple;
	bh=ArFXzc8/BT88B/4RrrXqTZxj32zfYVGMf/yIvzKx5Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCnDJYnWMcBQ8d9+KSMTQRlVRY1Ijch9td0YyGcoOjhkEAKP5+Os8kh/I8QrLGigRGKUk9jpWrtm/aObpPuhqQyNS22DwTwoubZZP9DjF3NPxDYOPl9YOk19IblZRppgbW5vp8JhV6LuiE46XCxPXg0reLvh5bOojwBIpO8G91U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VzLsy7JQ; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ6u4RWxTHdJm4YA8gNJPw8b9/DkXwvY38BkR84zVbMRtTjJbJbVPHxSAQujYF8Q3q1aplpLDhteUFh8837o8mIlp0SVLoaWoThLErealCepV62tm2Zl/z7Y4oXcXvpYCcUqm52liDq3xi3QqvejnDDkpx3+rm3MtUDGmc9krp9dQV1Xb0w9uOOIIEZAxQRuCBedLzfIpVq7b7SKf34KPfBWAizZnMXWSJEi1LcHSwzgu6NN2664m3ZSRQ66aNs1CtRYX2oUKHSXHEAoO1EuIFK4+xoBqvoGklNoomeKAlumLom2hHDpemi1fUzVEPsKt1deuo4YR0h9Iuzp5S7neQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7+qdLhVC4Xy6F3VJcCBYelG4hVPfLtZAlqS84emjHQ=;
 b=Br6gkJPnOd9HfUT5XwBvfE5TNLgoXeU9mUGwlXlVKo4fECPtMxXzInx/uWkRtSzIwZwHHP0Ea4lBTO2EKD+rnglZSQM7/gomuHOSJRisboTrQiag3qYYYwoR0m7j59mMkDKrcEHatklKFU7So+r4neuTlrlaAbn+ebFOH5vxEfQJlNUNhXN0++O9l8YXdrmlNiHSISZ84Nq4bWYulBjE+tZnDRxU18d+8VhUdW271Zrdtr6WEM9rkkQZ0tDcsofTi9LrbjNTCU3YpAZZXs7aN/2MZjxDVMzW6cLpgkaJg8jc+vRkDubPjJYlWOPGG7dUuWeO5lSwCqWoznfNgYdupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7+qdLhVC4Xy6F3VJcCBYelG4hVPfLtZAlqS84emjHQ=;
 b=VzLsy7JQTTAUDJho2d4YS41jJN6Q9sM9gEPoNeLlbeorDUPATLeN49/tIWpPVE4S7jsxwRLEin6Wd6JhzoYpD1yHgAWxFuzZwxPqfsYt4bWEvShkxPmzKURbqB3Z1HtIQNAoocvYfzNxPkrPaQ0gG/GHolONu2Q/pv0zn9HXOhBAZS1Y39m4teZnZKtZUTdCf3szm0mSPuB+EAjWuS3Xmia0xJMYvHmE5LzXB2Df65KK0QjUgIqC1AImhaoBcHiZKw94VQx1cNI1dOyqim7DAG5yqQUYKtL30pBqzWYMeavBPH73DgTYMD9qlHc4UqwkTJOSr5PK8VaoEWeuXBlC7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:29:24 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 15:29:24 +0000
Date: Thu, 15 Jan 2026 10:29:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: ili210x - add support for polling mode
Message-ID: <aWkHzd8pKJh91Dkr@lizhi-Precision-Tower-5810>
References: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
 <20260115023530.656645-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115023530.656645-2-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: PH7PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:510:339::9) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2c82ac-3cbc-458e-b54d-08de544adcee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|366016|7416014|38350700014|7053199007|18082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9VEtqSUxpQy+NBJHAOIGGMnACd4zqtXyqIwqxA9VwTu5nK+yybDb/AcMHOxR?=
 =?us-ascii?Q?gpFr5TKRrykNt7DlkyIsRD3t1s0nxuT+FmmwsffBVRYCRS6Str++ptyl6iZs?=
 =?us-ascii?Q?LIobrPjjCs9X++K5kst6V7Jnoyyg+sXOq0R9sdJodvEaD8Aq5Ih2Tk+sf4ni?=
 =?us-ascii?Q?C1Wf1TNrtX93tI/EJyKCRKNgJ+x1Ga+uxFVKRD0Xlo2nrIr51M/2IFXI2k1D?=
 =?us-ascii?Q?IpPiYsjoocdrAAYltuT3UfSdDMeEzHBThEMlE5UNNPOY91KNtX2UBfZpMNxb?=
 =?us-ascii?Q?G35Puq4qr7skNQ+p9tJ4OIcc9AdRTWXkflGGynESTmBLIoIJe4w/+X3+hJ3s?=
 =?us-ascii?Q?F3tefl6/nEbTWJfC/6z2/09ILLA0rtS6Y9+1NK7JnDzj1P7iVY77Nkd4hlvX?=
 =?us-ascii?Q?tEfY+QNfGdcCTXPOMIc6lYyx0YqLKqrEyJRYa8wUMe/d5XGMcvv5cFSUje/B?=
 =?us-ascii?Q?NknYqbNx8xthjDSNbBiBsgd02iQfppGwylLzR/bngLoQy5E/B+LX2dlKhR3h?=
 =?us-ascii?Q?2N0aSiraZ1jkP1oKjrG01QulWFFRFWiCanIIdl/+2s/YV4lsIU/VAU/WGexD?=
 =?us-ascii?Q?SflNLS1VxPJvbcNqzmaLoZQYJ6DejZYy0zD57Wul+Jtg0h1rwzmJolYw7/uz?=
 =?us-ascii?Q?NJdD5DwlER0nMPYZZjQDnzepGetr+/6hKnqxmPccHKb2IUULq+U6IsaBxNhX?=
 =?us-ascii?Q?BvsMOQlrEE2Mg04VVOLZNtaLLOlGAQqiTc0pC1cRQIKpmSOvnwIByVYV4Hcq?=
 =?us-ascii?Q?G6QKtRcAarvo243uIju1Gtuu9qRa6YTzzrZqiZ01x1KW4NEXAEXPrAlCKjBS?=
 =?us-ascii?Q?zyTIS7vuyyRUSlOYADJmCcOZy1dA/kp8cnHk43LyJZtoQLV27d0jFpyIAUGQ?=
 =?us-ascii?Q?q1bnOJM6XWQIMXTOZWQghSTsVjqkVevxPQk8exZq+ZPAxSKunx0WmPG/eYJr?=
 =?us-ascii?Q?J1se7TkBC92vaWi9Xs6HpluXNAQ9TlydhumH2X1Uz3SfDoKaF5s6ZK/rGypP?=
 =?us-ascii?Q?3/0ILABNKCRe6d+XegGCvPfWBlkA9vSIr1EBwXzyCbRIWzVnX0TLLKWiPWEm?=
 =?us-ascii?Q?25FRVrDBkOHxSaLvtd9GLoL4GScuoN2COE05bZ/uz7Z1cVR01eeGd/wo6Z4i?=
 =?us-ascii?Q?19F7H6RnStduR0mDs86oeOAjsI5xzXOy6e48aKS6xPTxMG0Dkx7kZdk74UtW?=
 =?us-ascii?Q?vpFFFXYURNBCPhG76/kgbFRDaPtjckPv1bpf/Ry2QLZKtyziWnoKCcPl+1JD?=
 =?us-ascii?Q?0eWsTqgKoWbeHy7oiTCJtrbY2MURp4c4nE++kMTXsKrJ9Gv4ni3JyycECQxr?=
 =?us-ascii?Q?q4PQptVXZlI78oUXbOetHb1KKKV/NpOnHyuAH/hrWWeyeb02kMTtFsoU36dA?=
 =?us-ascii?Q?zeNpjcf84yt7UbHUwbqTZg79GwlAZJfstc7LxKIb4ht2k2zy583F7x5BgGc0?=
 =?us-ascii?Q?43ee5+oNmPPHPs1ptaRtmnKwK/l2HQmO4OGTGrCkVhu8dm7+CvcnsmxHTzWp?=
 =?us-ascii?Q?wulZePdtu9EtOxDWqihgNkUxw34EN43DR4Pes3ZwB4cuE6sF2I+GffDFOAp7?=
 =?us-ascii?Q?fDEmSwIlAdncAkUh7QEy0T10D1RclPNssCaVqOk0txas1RwH1omI4Few9snV?=
 =?us-ascii?Q?CHBXZH4tSKmFiFua19PiCzE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(366016)(7416014)(38350700014)(7053199007)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ulD63c5Uf6PopICpcvRy9NciHJQZPBmmJ4qP2dXVO1Nyc7W43y6y+CCSB6Ww?=
 =?us-ascii?Q?YBAvJAseEcM8nM6M6GMQ5d7e2H36Zebw2XDjgCAy2G2lFAga5CGt/8N/rC27?=
 =?us-ascii?Q?85lz3iwpnCQz2UOLPOLDPCk4FUjmpnAR4Mplu/3EHj+A2vRZejkSkMiZqZti?=
 =?us-ascii?Q?UlidXzzeZWPqtlut4QVl5GkIu5MlHQT0WNbZbibZpAvs1+5m/ecO1GHXBsk7?=
 =?us-ascii?Q?0MuSYw8uAmT703cRouXQomBU3KQiqqvHmPSRaqA78SROpAtGxz4Gv7HHrkl6?=
 =?us-ascii?Q?lS56XT9AciHfc9PzYhRdLeznluP0Z4AxwXan38gnvA9tvwcDicnyUHlxVah7?=
 =?us-ascii?Q?XMxKDMzH+6ZRCozXSOjgeItbhyv4beutxBeeLO9j2c2eSJfwJkVk76RLUEEl?=
 =?us-ascii?Q?wpPyi3FV8PoD0wjt7GZ/Pn/l/flBjPm/nLH+HKe62jIao7MdrS5DibiZjQEC?=
 =?us-ascii?Q?5MuD9q05CmrC+nkqYytvyAnwnrVJfaEqH9Pk7koUVeBx7Ne4JIRVYysYrrJa?=
 =?us-ascii?Q?c7NJoxMvgWLQ48Xw1ugERZIm0KonJwCs0P4UjKXsLqEU7p6Ogv/jH3HnpbmS?=
 =?us-ascii?Q?dApU00KO7Nrj0AwkW/UEAGB3tiXp1Jy8b2V5FBZnekLa7Yom2h9MsyUZZTPR?=
 =?us-ascii?Q?TB1IWVSYfLOhRb/le6bfrqNRkCVDfh/BObxyL47BYvQ9OneW09LGW5lc4+mt?=
 =?us-ascii?Q?dRtseslAo0LahBbxPj1yC5kyvM5BXDGY6ehAChp90CrcgEInjO/0cNYfdYEQ?=
 =?us-ascii?Q?6Q5NRQIzS34iEQJYCq0sb4rJoeldxdQWFTNmNc9LMLMpGC6FKmY2qHb5IOQQ?=
 =?us-ascii?Q?0MkOglJNBtYau7ZYL3ZJ6ctl1/m/eE3kjxvNSIcVUfOlaPALC9lPp/DdHwlb?=
 =?us-ascii?Q?O9rC4qaItRaucfsp1GE5nahx5ZaoLK0baUiAVYdYYkaGlbCIbXeT9Nl/xAFX?=
 =?us-ascii?Q?1ufhJAPrS5mKFKhYlWvPPv02H64kv3qxsyCYgL9JCvml5BSAchCw8kAtCTt6?=
 =?us-ascii?Q?Vfw00kJvSHC2c8Hw7u7L584D0unJpaMhLx8YFmBl9I5kmcyXmT/hKDDZ1PoC?=
 =?us-ascii?Q?l2mpiy9na69d/zsnuf84O+fkZ3jsXOVStoZu1qx9IraQ6/oKjV6P/6CDq/uo?=
 =?us-ascii?Q?CQabtt7gGcixbt2Vpjt257JpPQEj+gk7iMr3Dzc3Mq58sT73hYHzOw9iF0tM?=
 =?us-ascii?Q?o6iFYwO3/tqifTjd0B3vXtObhzZfQ0/vsZ+g8CPxzDjFPIdlWbmEady2raLc?=
 =?us-ascii?Q?o6uaduWJDa7mXcZqHR1NGjJtezqwXrCd04cusLJeCgncGqprP0phdDbLiXKw?=
 =?us-ascii?Q?ISA0G1SYkLtLgZTTaQAQFQhjv9NFcVZLYZeMo1K5pWoToj+if9gcWSV51geY?=
 =?us-ascii?Q?PuLwY7VRX5aSk1IfZELwHsEsteRknBSY+kpZkd7NFZuOHCEJIGkYxxKxKb2J?=
 =?us-ascii?Q?lNCLd0ryso+xjCAUQ7mD21wOwJ1GdlYl5C+KgiJ1uAsFkm0F/waU/C1nmOkQ?=
 =?us-ascii?Q?TMb7hm2YKr6tZ0VGn2L5W/SevOfAV3yuDmT/DI2CNDdE0VWBzqr4QyOXGwzF?=
 =?us-ascii?Q?CQYK4884saeS4nZKZjTrBzClCwGDPcqZLgXwmFzkOSwOyxI+EC22iNVa036f?=
 =?us-ascii?Q?MW/Q91b5SrNcP88N110cGZYVL6n2QygrXWN5MzcWnXvJDZtbub3iKaD9CIhl?=
 =?us-ascii?Q?tvHojyrZc8NQKIK/gSnhz/xvKDBbI+EciZm1y4T3W8/lKK02?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2c82ac-3cbc-458e-b54d-08de544adcee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:29:24.5459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPWV5/n9vWBnCEnEndJzMVQ4TIMleLHGJnd0PmNqAB/MBXd3l1qup4IPJrip8224rL7SyMOqlVVtkf6wBLDyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928

On Thu, Jan 15, 2026 at 03:34:59AM +0100, Marek Vasut wrote:
> There are designs incorporating Ilitek ILI2xxx touch controller that
> do not connect interrupt pin, for example Waveshare 13.3" DSI display.
> To support such systems use polling mode for the input device when I2C
> client does not have interrupt assigned to it.
>
> Factor out ili210x_firmware_update_noirq() to allow conditional scoped
> guard around this code. The scoped guard has to be applied only in case
> the IRQ line is connected, and not applied otherwise.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Job Noorman <job@noorman.info>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Test client->irq > 0 for IRQ presence
> ---
>  drivers/input/touchscreen/ili210x.c | 84 ++++++++++++++++++++---------
>  1 file changed, 60 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index fa38d70aded7b..0574f2e86580f 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -327,9 +327,8 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
>  	return contact;
>  }
>

...
>
> -	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> -					  IRQF_ONESHOT, client->name, priv);
> -	if (error) {
> -		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> -			error);
> -		return error;
> +	input_set_drvdata(input, priv);
> +
> +	if (client->irq > 0) {
> +		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> +						  IRQF_ONESHOT, client->name, priv);
> +		if (error) {
> +			dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> +				error);
> +			return error;

return dev_err_probe()

Frank
> +		}
> +	} else {
> +		error = input_setup_polling(input, ili210x_work_i2c_poll);
> +		if (error) {
> +			dev_err(dev, "Could not set up polling mode, err: %d\n",
> +				error);
> +			return error;
> +		}
> +		input_set_poll_interval(input, ILI2XXX_POLL_PERIOD);
>  	}
>
>  	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
> --
> 2.51.0
>

