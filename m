Return-Path: <linux-input+bounces-10430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C245A491B9
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 07:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E854D1893264
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 06:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DCA1C4A20;
	Fri, 28 Feb 2025 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="uHhkYeid"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B71C5D42;
	Fri, 28 Feb 2025 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724942; cv=fail; b=rCuqwymUUESqcTm+WzSruCxH7M1o+GCpBLhRB8SdobCuRexlTesSg4PICdTsxM/75syASFzT+UTTzcYXD1wBqzWdxhhEfS2dkqBmNC1Qbn6Htjd7VZLPpKrz+VvTURXq1E6CSTLH4Dc19eDZqWHLFeQvwysbEfWmn7x6B6Ts6bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724942; c=relaxed/simple;
	bh=/9fDI96w8I1NPlmJ7LWfvATXkyqCvWc2GZqTCb/2oz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=STQkBxHUfbzYqeCn2kvGXheVsCYjEzY5HSeQLSOhCrR9krXwDwy+bW/xRjjKeSCNGGYa1Ih3tHs8VdkGFOn3+eVmsIPy+cWYXuV9gz+euCyBc8NTspd2D/8krEdlMjyPtd8lSQ0Fwc58fdSgAc1q0HCcdvwgFHOV5ZT8ndz3pjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=uHhkYeid; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYfyHnZX4Or0nGJAhJr1PhVgl32QGBJlQTeZrU5DC+Bb1feQI0KDFcbF1ZYQ3dgPmDwmMUWRqlAIPJrBxp/dhP9l0a6k0r6RLf3CraBqTzGbBAPQdx62/PW3hrPe44WclvwkvAKfdUmFZZkMtp3Sue+jpHnEYGMd2m/Dd3XjSuTaaCxzHXDhFwH9VHIFH3pbW9Ri8iTU2QU3m97kk8fnwaqHxkWvVpfTkF3IMqWV/ti3hkHZZZJMrfyuyPzDK0Xwla2eiPvhkM85ShHMjd2X2YEQX3jhUr6qVBIgVphQSSY7Nfoc7bTZxOB8jepoGX8gvcuoKml8jkIHsRGJBzVhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhTDWYC+4mxaOZ0SbGDO1FsA91DjNdd7I8ASFwD4G+8=;
 b=YMaVhum2Wamq73kO4s4RHEGdWeusuuaS1M0YUXStVSrNgem7FBWG87I2aC5MKhamDBS6UHuO/BEz959htXS5IHwhatGMs+0HMvAg8E/UzkevAEcnoiHplPEvSAbzrtZW5XQu1d2AQVHdaCuA8bVj7P7UCDH+nIicdaS42phB1oA6OFzblY8gPq+ohmZUm3DLPeOEgMhLx4kfTHbA6wWQ1v9DWxEWVL36EFnPrI8wKxHrF9+fegUpk5tP/3FS28O9SnKtdPsM/Gba/wbJMcJb6LWRjuas6F6EmszE2JNz3I2zEMOhTkeGTAYY+5vXpftZzX6UMFRyd4MaKgh1ou6MZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhTDWYC+4mxaOZ0SbGDO1FsA91DjNdd7I8ASFwD4G+8=;
 b=uHhkYeidIfzlh05Lo0CaM3p4cKbdcq6DFjfw76/RtF93kt3Icv8jSgt+yQxHrdRYxf2V75MVQawpPOct1y22yt3hj/GI3MEKTSc+q4lh5qpD3UXcsLKO/avIzihrJy7FoLzNcghuGuvy2VWfY23vQ8Q1YiwdA33Agi+IqylGw1dHpUMhDuhu+EEeU/NQMVcRFtn3DzeIj/wsDtdTvbAyVBZ7rSWRD04vA0+LPixZfpysn2QKHbV3dU86aGdwbYnE/oK28Z6bOMFaQ+3T5cygRjnDpXy/CFFGLGRG1xDG1QEiF3EfGr4hizZSyWV/nLC8C630GgE7tCiP+XaZfrFmew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by AS8PR03MB6743.eurprd03.prod.outlook.com (2603:10a6:20b:29e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 06:42:11 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 06:42:10 +0000
Date: Fri, 28 Feb 2025 07:42:04 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Markus Burri <markus.burri@mt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: matrix_keypad - add wakeup-source
 property
Message-ID: <Z8FavNuODoIVepuj@mt.com>
References: <Z8EMI9ALqYY72VBV@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8EMI9ALqYY72VBV@google.com>
X-ClientProxiedBy: MI2P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::17) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|AS8PR03MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 5623ed3a-acaa-486c-27c9-08dd57c3072a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gIaDcgAtZRwaUFnZOIjfmUmIw+reTMdHTHdVeM8+InWHDtLWbEc1XcIHykLS?=
 =?us-ascii?Q?1zHXkKhS5BHN38QbmYzG1vW4HrL1mAiu6BPGB2Yl+nXbzfkabXvO4ewystvk?=
 =?us-ascii?Q?5NEn23BW1R5qU+N1xtegplxmOowyBjtsKIEDSA6iqKtYBc6+v/M74mn11P5z?=
 =?us-ascii?Q?Qno2+nLm5meaqg/LKPIKpM0S1UuooAu8BfqLhZpzfEKrSnMR20bvT/4Wta+0?=
 =?us-ascii?Q?DdWexUl7qx/vxcDxrFZbgtjLWEY/k/LrQWM7IvkoMyU5n6OKMA7Fg4kLrArV?=
 =?us-ascii?Q?11YO+JiTcZb/0BjrYPBIag1PmRf9k1hmYlyEIznLkNkrUP5XbErMyila2i9N?=
 =?us-ascii?Q?U+F1dquslUgTI9ld1WFh52GeULktObwj5IDtwT+yys0ja0uYt5IDmvT160Bg?=
 =?us-ascii?Q?Q6AfHS9+jFajXQIMTRbnxaEGy2h5vFfNJnfC3kVnKzUIcNBMkMQmp6Yp9tfX?=
 =?us-ascii?Q?CDfU/ho311m+dB9D2xm1vcWP/0gjTE4zdljk3LcB2Q8yovKcUgMyrsOcL6U8?=
 =?us-ascii?Q?caQee+xT3NjwLtwx6d8c0TFWbuZ8cze/SRXekrD31tq8vnNP+JXzXs1gLF0L?=
 =?us-ascii?Q?ss57DxA1lbygQKzgO5iGQKPXa8f99AvHiTzr8aeGa0vXjfo57Fymgw5HQ6Jy?=
 =?us-ascii?Q?5CcDxpzqrgBJCBKIAgJs+43EZ0qFl1Gh+xRYpQMf7bxP7CCI1pRsrJInUdHc?=
 =?us-ascii?Q?7VpGjdSYaIIQFI0Uo8F9JjmwWWpjpWQNeXC9f6M9+howF6gTN8Auw/afu/+c?=
 =?us-ascii?Q?JvuwAAzR/DrLY1FJ8QRF4k/DxLUKZPJ1YHNwHZP5wYRCwBbi+IiJxqQRp4JX?=
 =?us-ascii?Q?b2QXFBuTRmnlbHWN31tWHSSRoKoL85uWIzX8i6FPLkQWX2DMkzhCND0OsAd9?=
 =?us-ascii?Q?2Wsdk/IU8ib+CnIPT1d2MzQYLY3Ue6+nWXy6PVuTJAWF2yFAeycLX2BzXCbL?=
 =?us-ascii?Q?1auGI/tqKhzwfUus2PREHd1KsGMOMzay+QUOs8/sBVTrzLbLsfOn0fXZYjox?=
 =?us-ascii?Q?TN2YGzyu9qMjQ/MjqPqORT3x9+6buNxldO3S4qLjp0XDFJoDw1ifJnxpI+NC?=
 =?us-ascii?Q?l9vChcQw8xJKaKXcRbKUz+WUW6+rf+GymxWN3p7CJEno0Sl84jBnfKZxYoJI?=
 =?us-ascii?Q?WnPu78IAte7PQGk6SmYq51HCczVEAEUDwQgKf3cP8fdP3IwrGto4S/khyt1R?=
 =?us-ascii?Q?6isLPT8nmX3AefuqsahpUhHLfaGuqQ6gUb+2oya0C9dTSIEidPTklf53arKD?=
 =?us-ascii?Q?jsDUonIXket4wGk/FD3ljuQtWVEIN0ifH8463OIKeLSnfEbDYiSncWciChsO?=
 =?us-ascii?Q?f01YaEdRIzcooyQrYk2pYAdIeR7GcIyDknbR6jU2Db2PTpXCj5phyCiqERB8?=
 =?us-ascii?Q?4r4mc/5I4iETlW62h1o4QAHGwdb/Sd00h2G0G/Z2zM59ADcHxCkJb4zgNWkL?=
 =?us-ascii?Q?GY+VFE/TRv5QudPM06mztSONoqSdeG2f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9mbDCwo20SMX9L9kEj9lSuaXvHLD4N3j3CaFvisQ/1LCibNEBaXZdFsUQ5+y?=
 =?us-ascii?Q?fFQ9/Z8NYLYyXplz9ctccNnMTwvsR3fxwGwBR1zDh/Gs/iYqdHIJxcwtAAPb?=
 =?us-ascii?Q?sUD7hTzt5hTRCPNlukgV0glWF3UQpcZA7xNfpxH2LWi7Aq12OqM8pBMy+1j7?=
 =?us-ascii?Q?g9cbfI0b/RVQ8FZtAUTO4LNMYqxUXrjNiSY6VeZRaaAe4St9QGFxSgp2SP1a?=
 =?us-ascii?Q?hXAuCOmkB/gIPlG3miW/Aw7IaRq0JPx8oqjp8OVFaYxPsh4cTkikJObHsuDX?=
 =?us-ascii?Q?kvPDMj+X4quN7OCcHCjNLHDR+f9kSzeUYOQqimHym5U7bKAiEhIcckuH3t62?=
 =?us-ascii?Q?T32tLNCwuTIj4r+Lik3kguWRasXbGMgh1m6Xk0HG0tCFg7silcdp/UnlCcY/?=
 =?us-ascii?Q?Q8ywngggLGYyO3z6nMdCIVSv/FBhzBudea4endCJeBwU4LT1yqkK/wpTRrA1?=
 =?us-ascii?Q?fcyGBjXDrBM5itLG5+hGIpG2BAlqCOB/TRBAfDrsWza64eOy/ZDgxOsb8/6h?=
 =?us-ascii?Q?tTsGcYCuH9Njd12dKVCX9Ig2twEA/kE08aj0RdnCZwBHM8mggwspnlduyFAd?=
 =?us-ascii?Q?8upHoakty5nU7RKq1GHUL6Xrz5sG3P+uFh7daOXAdU7mV5jqJHXDOZzbAI96?=
 =?us-ascii?Q?nE0/xw9BToQa3HImV4uP4DGJify1XqzsgUyWIXAgLCh4cmKfZD2Vj1awlbmd?=
 =?us-ascii?Q?QW0TMTBJYCdHyNMx96oj7ga3yDdbrefKGAfFgq5e/PcI6t/zThS76mKgOeRE?=
 =?us-ascii?Q?IJ4eWbCy/liPh77qQTuLrBBAwbliI1Q7X20MHNc1B0R+yuoAvHb9aOT2f9pY?=
 =?us-ascii?Q?TtyCEFHrKaXGtnRe9+6y9ejk6bja5eAMW98ffvzReet2QrmvPWQq4j3uMhIH?=
 =?us-ascii?Q?kJuWKeJms3vJ3Bkrj/MG/uyMtCuDtVNKV5hg10T9rD+P2fP23zpHzqwMNRwo?=
 =?us-ascii?Q?ls0LwJ8z9UuGxQyZbPTFEe32UIAgySXpnoCmowx/mI0t/hwhgVcVt9TQ04ux?=
 =?us-ascii?Q?9DZXTxI6QTCHYtNJFJOZsQG0LG5bSLd420yZDimmPB7bMO1E29joZJyL+mF9?=
 =?us-ascii?Q?mU/yuyg+nenSfMFqiJ5mePi11XAqbFpUAQ+EZxXZ8xvuKLdNf35X55Ml5LZv?=
 =?us-ascii?Q?GkILuJA6PMKpQPP0pTosPz7pd4aJJE/7npVWzAv03af03ANcGzllwMfSBn8q?=
 =?us-ascii?Q?NsfgwQjQK0+GrA3hzaboTUVy9j4AOZ7hGQQYmVRV5Vm5nwjXUW3fqwpueZyh?=
 =?us-ascii?Q?O8MUjOOuFlzwzy0Dx1S0Bqry0Ny/mo+3jOa7ac6TipgMBAGGpRPs6k8OdNtE?=
 =?us-ascii?Q?E/kRjsL/mjxlbUlSZI9bbeAEfl7KhqEl90Bp1s0msjmrSNPLHMSZYo3ALkvF?=
 =?us-ascii?Q?K1inbWtBX8ptlWUVha8TmV8/IgL/joLFM4QDGM0wIeJ4oKzx9qXWe4LKKdKN?=
 =?us-ascii?Q?Otzi3Tr5ouqE504M0UVikRoP9n5viKZt4znZGTTCf/Uxgz1byyssu9U5Fr/k?=
 =?us-ascii?Q?8L01bPhIpTdFClYot19PGHI75XNNJ7RGC2ZP0rlsB7Mbp2sdsQpmAtVVFnGi?=
 =?us-ascii?Q?OVijIw7Rr68jHlP5Nxl7vMo6O6Vj097jUtRrv81/?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5623ed3a-acaa-486c-27c9-08dd57c3072a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 06:42:10.8156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3ajf+2aK6X+vtfmyg8h/EsAHgV9lR929gosibhPjVSq+N/GEzVkC6ULA1dClEjbhBJfRJh4pYNR1Xl76HrkGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6743

On Thu, Feb 27, 2025 at 05:06:43PM -0800, Dmitry Torokhov wrote:
> The driver recognizes standard "wakeup-source" property and there are
> DTS files using it. Add the property to the binding.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502280105.REZ29MVg-lkp@intel.com/
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 73bb153ed241..ebfff9e42a36 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -68,6 +68,8 @@ properties:
>        Drive inactive columns during scan,
>        default is to turn inactive columns into inputs.
>  
> +  wakeup-source: true
> +
>  required:
>    - compatible
>    - row-gpios
> @@ -96,4 +98,6 @@ examples:
>                          0x0001006A
>                          0x0101001C
>                          0x0201006C>;
> +
> +        wakeup-source;
>      };
> -- 
> 2.48.1.711.g2feabab25a-goog
> 
> 
> -- 
> Dmitry

