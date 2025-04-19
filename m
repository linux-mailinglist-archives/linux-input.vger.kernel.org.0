Return-Path: <linux-input+bounces-11850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2EA945CD
	for <lists+linux-input@lfdr.de>; Sun, 20 Apr 2025 00:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AE503A21D9
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 22:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7F31C3C1F;
	Sat, 19 Apr 2025 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="Fk3FujNI"
X-Original-To: linux-input@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11021085.outbound.protection.outlook.com [40.93.194.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F335A199E89;
	Sat, 19 Apr 2025 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745101369; cv=fail; b=amC43KhzoCz33+En4qixJzTZ9GUiMj6Q9wcaKq7s3lVYPsa4d3LWet/slKOYMt5hpIY/Zi6akkhmcBvlVWyvsJ8kYfMCd3dEd4IRuucJ4SFXqh5ktduyF9p6jqIU35O/XcznSa7m41oLKNwwc36msZwm7qwk199RvlGszwHDxg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745101369; c=relaxed/simple;
	bh=oK74OyxMtpDEYEKyStE2ozEak5K1UHR9/bfNUU5BjdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gq5Z7685oxUWUK5dKMKcDTiOOm99L24Umk+RQNP+ddU4/vL0b7QRD8AnTLlzdJfTYugr1p/5Ng2pvD9O5VOzi6ZhUSjtQqUyGdCpz7IlhOutdoMLAV+Yfy+81zgnZf71XiDR/58h5xmyz3wpB6bfj6aLcPLtUk51JkDYYxcSmlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=Fk3FujNI; arc=fail smtp.client-ip=40.93.194.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/vyGFwbyHMD7/cgCUH8CeVVtgUHCwZ0UjWwRHbzH3frNMvkHgnjMAcfSzbIJ+kSqTVDe3LsVkUpTnqZZYxwOquTzSEygcF2wYKEXumVRjlbovtsIxHIaajxWcojz8Ct6U9Kbo0YFeyWuXyhUjc1k30FGwlUb6UV5NRJyoI34Uq13Lb7/Pz/cQUZkW2yb+X5pRIzCtFdEtYZdH5Ime0RCkWxtDrNOxbRBqBV2G0yWCpFXAL30A/hy9DrdH0AD6NNUz6XO2pI3sEP4Rty+b1mD4uxJ0mPPUAvqkzQh/E9kLlPFKkjGxht9vDfJB/P0K6ajyFtCQkclek1iFW5Xp3Kkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxZ81tInjf+3AOzriV4/ir5vlvx9biD9AQ8GQHEUm/Q=;
 b=UibO2kb10ryIj9K/WxIC/qbfQEWmVlo+iLscbTkEY6K40QGsGdh4S4JWm9S6LbCtEYH1j3ZR0QtJpP5kQNqsFeDz2Ue0RpHVg8qMHFjqew4PubstMKkBsXk/lk9HoiyNfkoaR5sJ+IoeVPNTHL5sFStGp4Zvo1CzZOCwhtmMe75hYB+o47VA2+JzAXOtQawsDDODIhztb2pDgdVrk03truTjA5JUH92Bzgg607aNttfyVjnOBjMgRGa4dPSjdQnwCntCDkeYwU44zbGmhgBrbbVDRpcs4Xdw8CSF2g8Hb+p766xawIUR3mtgNVTRZkWFGPGBLuwbheCpHv4uHmUm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxZ81tInjf+3AOzriV4/ir5vlvx9biD9AQ8GQHEUm/Q=;
 b=Fk3FujNIHtwRmzlmTpNTCgIUWpSqgljshDRMEspKfwvSSiVrURr7BjmRI2IAP8zWR/w9g5Php2fjHwa7twtYURGSGZ1v2W4LqW1F1H6svNmvbYBhcYdwudv+Imwee0v3A0Amfnaf8gGt5LD/QF2W1Uo3QugFtRQmMyLil0sG5yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by BY1PR08MB10067.namprd08.prod.outlook.com (2603:10b6:a03:5a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sat, 19 Apr
 2025 22:22:39 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.8655.031; Sat, 19 Apr 2025
 22:22:38 +0000
Date: Sat, 19 Apr 2025 17:22:23 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: iqs5xx: Fix incorrect argument passed to hex2bin
Message-ID: <aAQiH1DnDXRcRsya@nixie71>
References: <20250419200434.39661-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419200434.39661-1-purvayeshi550@gmail.com>
X-ClientProxiedBy: SA9PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:806:23::29) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|BY1PR08MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb2a59e-4181-470e-7640-08dd7f90b0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2gBpn0QMJc3xSsx2jaho1c/YR4S1Zl9dnKu1+p8QmPZ1p6G0j3sqHMhaKMP3?=
 =?us-ascii?Q?/ZFva8+5GIYQ+o9Lh4Zaf+yBSD2W0ECx5dfe7ebPfltNv/9j7VcmPuOw2utx?=
 =?us-ascii?Q?DZYqbjoTJqW6G5AsX9WnyBW+8xQgL5M2Q4IoXzwE49y8VxsMGSjEywsS+M4x?=
 =?us-ascii?Q?e04S9PQOUTy1GIyQ3+izj3hbr/blychMREfJizxAycw3nJdPF14cFqPXlTWh?=
 =?us-ascii?Q?I2eXSKm3w+zw0qKstzAmLO2BtjOhR7Z/M0s85Wc14ujhq5ML2jJJ86YVewpb?=
 =?us-ascii?Q?Sx8TD9FDgZ9YSJ+m/Ls9pzZ/KGLJ4fjeXSRyu5EB6sG3v2lyL+a7pj1sOjgZ?=
 =?us-ascii?Q?GN6FC93ICYu4f4bjM921BE7QUCStC3Q+H6VRiExbFZq0H1P9M2maGvcognDE?=
 =?us-ascii?Q?aeEuBDCz90XiKNfVnSCOlJSBx48Qs2swEinalciZB5zemP/q+Lz/OWJo1pBd?=
 =?us-ascii?Q?IlEqJN/pJ+V0LWACfLpOyw/zoGvzb4D84zKYVQFC9U2KuOe7BISp3+HurFsR?=
 =?us-ascii?Q?kP29ESI7IT3Tx7pllGT9RI5IUEAfBlu7CHx730yU8TFwriqGDkr4a9fM04at?=
 =?us-ascii?Q?76l7hoXcyw4vKWQhsQRPsANFTd3wBbn+/xe+2xRFh+CIaZBU+VbZzUnqsibE?=
 =?us-ascii?Q?qZ9WPBqXvagAwFcdaDgePhI4Rc9Tla1cINM8kWTibAxz6j05xkgt76F6lzC5?=
 =?us-ascii?Q?jt9p9rgb+a9VaDAaGOqJXM9/E7Lvldu8nMXBnVKltzAEuI22CfNlIGyQKGO/?=
 =?us-ascii?Q?Q0vQ7ku8dfx1GeKA5GAFE/BB5I9R8LDJmnX7EeFGOwDznsWpSwl8Ft0IQXl2?=
 =?us-ascii?Q?W9nT8VEsOZysOUG+CQ/cdi8WWty6vXiyyDk6P/acY/Q2b1nm5NHijeByOmzh?=
 =?us-ascii?Q?eLkmTvHEsZlZpDxcAZJafbDpFUwoQIylsrq8COAQQ0BCnqISJuVQkv/3GZ2H?=
 =?us-ascii?Q?rtha8vt6MPp35oIkhGxR3semeFXoCP65bGXpuxABBqsmzI1lfsaXpUUEH3Bk?=
 =?us-ascii?Q?ueDaX/dsDKF5G0yEide67tZcANsxnPcjHRrXMYbo8OFiGxsmz2OVqpH7gjXU?=
 =?us-ascii?Q?DB6Av3/a4OOd50/ZIYiTCiNXj5EHrHKJv2hD6XPfeB5zYUhG187Syw40OWet?=
 =?us-ascii?Q?brs6eN5CAqyqfGARmdDchS1R6NWipx98tTZanj6pEILgMdAQnrVWP1QeAZTC?=
 =?us-ascii?Q?3zXkBAbXGYUWNvNoxfnxSvQZTqry1Q62xyRCfy7ZWMnY4uDyObxWDuvd8vzS?=
 =?us-ascii?Q?osHke0IDRv5k9AmMalEJ1cPQNXt0TxPSR83QPNTieeENGkScRFPCJ7AFXpeH?=
 =?us-ascii?Q?D3vAnlaXUvX0ShUlc/37a28KT0sffQAjVue/ATbN2/dGTF/KWeLfHdw9Z0NA?=
 =?us-ascii?Q?gH09XCjRBOXyG/m44VhIwcdb55fyffJDq4jWWwAPbys9KjVKK9AHn5oAwQp8?=
 =?us-ascii?Q?y97Sqj7L7Hw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w86nlBfMjn0oC7RomloMo9EZFWQEh8vx6GPvDd8T1lBaAgQ8T0qpzUEr08qT?=
 =?us-ascii?Q?vS1DXqgW0jJLDkjl4Vp4h/LN0IaOPDX5hGK+ZEvXARDLhJkcc4k4nbFMJuV8?=
 =?us-ascii?Q?Tiq4We/cyVzSjd9NaUAURIlG3A3Zt8JgNMl573XMgz3tAW16ThQTKqzZ26Jg?=
 =?us-ascii?Q?CfuQbKF0+cI6HZ0mFEWg2jIE6WKjUGv6RfoPsQG7ozYMbmSODAWvujA9g6u4?=
 =?us-ascii?Q?PBKtPk0Qq8bHT7AWQx8dGj3AUq6yLG2AAJIkPVP1lrTxUJeKrrx8iDdMLtno?=
 =?us-ascii?Q?+1Sp9YV6EgFORhV/A/bXXEUsbJxfygYeM/HcpzpZGOeAG+rI598P9BpnvIJy?=
 =?us-ascii?Q?xRb5/CVnWV7VBXsUT/1bVD49kJUFm8HEHm8/ulJMYUL9fgVaxr8nz4jZwVwn?=
 =?us-ascii?Q?Uwo+UM3rKP8mnyBze+7S8kyMfUtmB4L8QXkAxpXMNGdjRUmLbLSNawUNjTq6?=
 =?us-ascii?Q?Ponf3WPwy+idj1jlPIvV4+s21kpKYqE3VVNjwjW7IW+vwstN7vwVNwE9MBTW?=
 =?us-ascii?Q?Pvz3OiugTDpXB5FDRjoXHH+SDQzGKdIa5RKRvRumUXHaAqeGmSiN26JEkwrt?=
 =?us-ascii?Q?OhCenwulh5+8cxPxaaNAk1kE9vkyYDmn+bhEHGRCLIlfY4wkwVoREMuPOWJf?=
 =?us-ascii?Q?iR+c65iSHpFDtvB15KxtN5oZWZrvdEQx3G73L4BWmmdMyDoXxtKklf5DaLRG?=
 =?us-ascii?Q?F7wYwyDQ16Nyj83rCrPZ548uS88EEMMuxJcrrgOxNQ5wbHkRfxQ+9Vvcprpf?=
 =?us-ascii?Q?XZp9A2aRS7YQlTpBDDkotZp4MXZdacVzsOd6tpau2MNS9VquhtqyBM9gR/7y?=
 =?us-ascii?Q?WsmXGSJqB4Iko/GjBp6YIqfyZ62Wy5GyprwjRFpE+7DeTOHpO0vh4RqALHAI?=
 =?us-ascii?Q?ZeKE13IJbcGLIuHlqGErUc1lVJicynl+NQJoicaAHItAfoC8A5aNs//X3+Cv?=
 =?us-ascii?Q?dvTz/pvsGUbqQcabmmPuNWuYbRl+qFXCurOOHAh+6Yok9I1LPAz1NCgdl43/?=
 =?us-ascii?Q?JAMlpUrYIpfZ4bSzmtrUazHooUj/bTQjma48/eqLDSO1jAHT/QKZaeMdYKxf?=
 =?us-ascii?Q?wLg69YfbvECI4baTYrVyPgJtTDCkce8SjadPAYXCvcAVnrABrhqiECl/tict?=
 =?us-ascii?Q?mJ0ueja5Vh/15Qw4NN3mVTXkJfjpHkjeRs2pfktuhIFyAHzQZ6+sSoanSZrV?=
 =?us-ascii?Q?8uPLmUPXqlqinsF0+0DOusN9kDJyODRwIoSXTsFpj5wKXeDeJHY/yw0K+VUY?=
 =?us-ascii?Q?t3BM7y5ynf1ZFneL4iL1qJLGL7Kpa/FveTtPN2gsBEHpRyDW1LRQY8sTwz43?=
 =?us-ascii?Q?M4wUvtXBsNzGNoR1BXO8YdXcpcZ6OZvsw5ZfQcj9M1jZz2KpmcRnNNOkNaYl?=
 =?us-ascii?Q?8xZ3IsTkrn2IhsKkmgLGi0CUmkTD8cy25sGOMZUUz96ZlIDFNugdHwgqUIjl?=
 =?us-ascii?Q?BX3DO00EWMyzupyUqbqvDzNUljaEqoJamPrEu2toES95zGcVh7xd48NnLfbI?=
 =?us-ascii?Q?4vXh6QIr7+ojO1sfqLjbVy+zuV4r/ZpRDHX0CxffW4ESbaJkxmoD6Erp6uhe?=
 =?us-ascii?Q?PRD6aytlhqD613yD6OHIsyTDZj5ufV7CwrThSnKo?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb2a59e-4181-470e-7640-08dd7f90b0fe
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 22:22:38.1639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mt9nT9fqD5hz2n1gG0WBRR4CT1dXsusLIhQyIOrWvBdrkUkehPgJmg0/CT1uf1Bt6Gi8nYHnvEOsapsN7WUbMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR08MB10067

Hi Purva,

On Sun, Apr 20, 2025 at 01:34:34AM +0530, Purva Yeshi wrote:
> Fix Smatch-detected issue:
> drivers/input/touchscreen/iqs5xx.c:747 iqs5xx_fw_file_parse()
> error: hex2bin() 'rec->len' too small (2 vs 4)
> 
> Fix incorrect second argument to hex2bin() when parsing firmware records.
> 
> Pass a pointer to the ASCII hex data instead of the u8 record length to
> hex2bin(), which expects a pointer, not an integer. The previous code
> passed rec->len as the second argument, leading to undefined behavior
> as hex2bin() attempted to read from an unintended memory address.
> 
> Cast the entire rec structure to a const char * using a new pointer
> rec_bytes. Skip the initial ':' character in the Intel HEX format by
> passing rec_bytes + 1 to hex2bin(). This allows the function to decode
> the 4-byte record header (length, address high, address low, and type)
> correctly from its ASCII hex representation into binary form.
> 
> Preserve the original code flow while ensuring correctness and resolving
> the issue detected by Smatch.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/input/touchscreen/iqs5xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index 4ebd7565ae6e..e8140a54685f 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -744,7 +744,9 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
>  			break;
>  		}
>  
> -		error = hex2bin(rec_hdr, rec->len, sizeof(rec_hdr));
> +		const char *rec_bytes = (const char *)rec;
> +
> +		error = hex2bin(rec_hdr, rec_bytes + 1, sizeof(rec_hdr));
> +
>  		if (error) {
>  			dev_err(&client->dev, "Invalid header at record %u\n",
>  				rec_num);
> -- 
> 2.34.1
> 
> 

Thank you for the patch! I appreciate your having investigated this
warning, but this patch is a NAK. I can't speak to why Smatch thinks
there is a problem here, but we can see from the definition of the
struct 'iqs5xx_ihex_rec' that 'len' is indeed a pointer:

        char len[2];

I also checked with actual HW on latest kernel that FW updates still
work just fine. The following line ensures we are looking at a valid
memory location when locating the 'src' pointer:

        rec = (struct iqs5xx_ihex_rec *)(fw->data + pos);

In case I have misunderstood, please let me know.

Kind regards,
Jeff LaBundy

