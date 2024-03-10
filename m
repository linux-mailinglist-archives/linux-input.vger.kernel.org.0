Return-Path: <linux-input+bounces-2317-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E209687784E
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 20:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11A9A1C20943
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 19:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7043D39FEF;
	Sun, 10 Mar 2024 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="pVPidqxn"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2092.outbound.protection.outlook.com [40.107.237.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256E39846;
	Sun, 10 Mar 2024 19:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710099007; cv=fail; b=tR13KI5ZqoIKRQB/OvnaEymcaQdWts6YWwEY8yvoN7np1S5QpOozwt1yw/QvKf7yZEZWyn70AebxBy8nvpv9eM6XTH3I807e34mQVmQCcXxigxvTAaWuMR2gS4CFcXw3r67RfL4UICUfXUO+RCVeYtBEJ8UOwMNWNV5tmyG8mZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710099007; c=relaxed/simple;
	bh=wZSASI/56HTQ/FDVSbv8gIjKfjBOhQAnHOAQ9ytApew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cTTYsqO/pBv6fGyc+A4v8ciKuLv8F6MyMYUE+cZY7NBwUua7Mu3LC/Y1GO1sAx7RcYvbgTBNjPUn1im90gbHYrS8Zpjfh9zvpBSfn5BJMpPTNSE1IXRMHNmob0b9X2wfvYY3BjLhgGa2eNuNunN4vcYMhUUZ8/l10vR1mOEuZr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=pVPidqxn; arc=fail smtp.client-ip=40.107.237.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GudjwVJNwnv77K4bpZAvE9Z6iH9xpdldcwsCMgsZOxbT3DTqv+LueTvEn8HwXULYIIq6e9z8OJLmJvrWKtVB9kObJ7DwoTXOZZqJYxr+meVsmhW+rIWZ2SVCbTkRqTSANWPSF0FTzD1V7gVK2CVQmdZaGtcfGEGzlXXNUF2zubrbeZFV3Y0zy5PwKZ2bxO2X8M9pTBfYTVgMpkn9YIXFJNZ20+QFWOanvcpxWnZURXXxJvtuP8HoJl9FmEjINNxRmrluDiWTSIxpn5be9ygw7A3IjCx6NJqaZagBd6flT2mW31kwtInXIR9F0ZEg+On4KCa5Vx5RClVrpvczo20JRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxWQ3WQoVnlKn9lsbmmQV8ok/1oTY6rHJC59T/yG3x4=;
 b=DRIuc9OIyhWopWtAEwBElntgWJCYXG7CGw63rG9GFUtORvl4JNjQrl1PzaX02nFzmIRv22KFMg/7Yy3X3J7UH1HAjTOSXq+cSxSCYR1tJdZdGMl0Q3va3I0klpS/fvdQhBFiEIgGIf7eWyg2E4zImkbc9lcF/ai0QTaJf5l75sp8jfjSkAtGARJyMlNtNJWd3MU65UD/7MFwpVoo2JFhse54LSZgBOu/sOlga6zSvF5WAbcQkWWTYDaKPodqcW+G4MnlT2gvP44KrOONOMEytwMUk30XgMxQgmCBqGvULeiuBJcpIGgIAQt54amnHTzHxVXiR3mIuYHU6LVKMWUsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxWQ3WQoVnlKn9lsbmmQV8ok/1oTY6rHJC59T/yG3x4=;
 b=pVPidqxnXMNpRd0iBFR59Q5PL1vkyOYawNtGc53oFLYx1It6fAiDv9ajtunCUkuEOacWNHHA09Auf2ZfMnVIB9ubD2/DEeQ1OWfO6+q/l4xz7PvTCLXDIHcjWkXxQuaXBPbYIcXyv7VNosBxwi0qJM/C3FKKT7picbjqiivyyfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM3PR08MB9499.namprd08.prod.outlook.com
 (2603:10b6:0:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Sun, 10 Mar
 2024 19:30:02 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.031; Sun, 10 Mar 2024
 19:30:01 +0000
Date: Sun, 10 Mar 2024 14:29:56 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 2/5] dt-bindings: input: cirrus,cs40l50: Add initial
 DT binding
Message-ID: <Ze4KNBEsK5juzpNR@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-3-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308222421.188858-3-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SA9PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:806:20::32) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM3PR08MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e0074c-46a4-47ff-e44e-08dc41387aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HGaRtDbDTbJaU4dYT1XxbxUQz8dijiMM57XsvfiEwlMj7HMJQkt95WeEYGjETRYwICHtc7FLhDWUmZYUL8YQbFmf/GlBtSCHynI6IX3zfuT/hvJIK90YrQYWq2QHfV0OitJFg+Xp2s5rJouZe95QEgDHOQX1mK6e3M/SRGAWSNhBxNW/BxQX0P+kBcWAG8BqD2weAXHxFbQfG4gHawJSwdPj2CBc7peBCLDn08tCPcBP0MzYFnmiVqrPa5HApCUTx+HLmsewzCj9mrgIjSv1AKvuqJfHZgsL3z877dm58iNMjqjDZljONu9iUq4gIAYpyO/YBqK/ALSRuT45A6WBPfQdV8H5o/aCG4KDmc8MTnhJuf6ScsPmomh3vLltfwljwBNoZ1FSoLXDh+X7t7PAaGESTRi3C55JT5X9EY4AP+lCmLV8jKqP5MNQQxLhPbN2GMo1gxeTG3bk3tmzGTva2duL/Zi8NUiNDlZ4eNfhBxTI1oULVp1ULpJQp7O9AmSpbW+gVwXkxL/zL0cWAy71bzsVknGWpGvt1ZQLwK9HlOTb6vZpnKuAf8jti2Az5bejuPfNwc/mjY08+mwcSHx0lvFILnCEdnFlx9cXcIOHS50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0u/obspgTrUsS/I98mkhP4stm/h+pzVLf8QlLrPjhmBqwMsfkzRYp1E6NNQS?=
 =?us-ascii?Q?WOvHv5AjvKPrBitqvtQJH1Z/TQ8RAjvZy7KtZmSmKyJuHxTTn80ucl0aAKjE?=
 =?us-ascii?Q?uJGqVnGzn1GxPTarmEba9Ov4Iso11BFTZRvNgzGmpu3OVlnXi8Q0CojPlSj8?=
 =?us-ascii?Q?JVU5zo7obYKpzkz/LEtcyabDU9d4+MOynzwNbrHqFL+OsMnjjeFczOv+7U8w?=
 =?us-ascii?Q?HoaEtWO22oLvhlgmTND2bWc3IGuxVYO3QJiFkcPxXghCj0x9J1j03oWlY2eT?=
 =?us-ascii?Q?ifU1wy5N/yC1zLkkcMSaSuQr1iZT3cdIJPgNPS+IquBGqkuCEbxQKGywgFrp?=
 =?us-ascii?Q?iO0xaWX2c24biNasZzpRkHNf4Qe3V9+yhKXgulIHyIU9NLWE3ifhbLJa9YMe?=
 =?us-ascii?Q?MAIW7pfwidmt/3+R29QRekadn+32KZ1mhCbJXmQ5Qwme5/aS2oSmfyPhke1K?=
 =?us-ascii?Q?uMj8D5qsxyBlpQU4HAnIae3bwm3glhyUGHLt95BPh9UaP767Q0/o3PfPmH43?=
 =?us-ascii?Q?3h4YJ0/qju0E3RMXw7AFayQDRKQVjj1damVz40gHfK/Vy4XBXghJTtOMiw0J?=
 =?us-ascii?Q?n5BsRtwoFhYR3VXFmKIadJMh9TC+gWbSC1UfcbMraADx5sgGdN1Rgc4i0bGr?=
 =?us-ascii?Q?OHkEr8+KQLh1g9gj0+lGHiE5A7qTls4P6Wa+girVOvCkMbCY3NHXHIoJKaC2?=
 =?us-ascii?Q?CopmV37KaW56+m3QHyXBbUekrneg9wDbtRAkQR3KPhs0sJqbN1POjzu6WPeX?=
 =?us-ascii?Q?/kE1vvOXgxhann9bbmvZXeXRmfIXXS3OV2Qxt3QetKsCHEuI1elpIK+8cwU2?=
 =?us-ascii?Q?P/GqeWgC3yy+zDBUWjrN+tdIWp7U3tuI9GMMKoTnj8gft7k3oOAsdsUerIcV?=
 =?us-ascii?Q?KNnoCYJJpDu55SGP1vGL9U/N2LPxxRvdevv6xX06zejd5aJMQIJHQyjLHHIK?=
 =?us-ascii?Q?RbA2tAifkOVWBaJgts43+jY/hucbkfL6kuzbAjGLyWxB4ZLipRKJlj2aFCkc?=
 =?us-ascii?Q?O1QtMQsm0PjTpmed0xQEKxOhynT/Zwi+28Yt2xU6hlMF9r8lbLmDF0L96N8l?=
 =?us-ascii?Q?XY1oQyzLlE1k9MIEdD0HM1pxbU6hXj+I/f2huVuAjQZSlFdTmZbxortmL1rh?=
 =?us-ascii?Q?TvFieTXSSqNi0NgGolG6GgEbPEspIb3PVMjlN4h55QbqQ8ITevwM8McjJcxJ?=
 =?us-ascii?Q?BvJzUiGm83FaZ+HcLyKi2zwGevB3J9sM6emSTGw3/uylQgm0l3T9LQ0v6pmp?=
 =?us-ascii?Q?CKsQN9dWTaSkfLIsvu+T3ZZKavC3g37H949VFwGV6hCgVtv4TcK56BTNnF/O?=
 =?us-ascii?Q?an8n2uJoqjpl/82U2fP0gjlmMZ01nj0BTD5JkfgQu1wTEZ7Uu3vHf7Us/4hL?=
 =?us-ascii?Q?Igq8TePCPGv03UL2L/agvznxgvGWDZWaQQ66+ED9YyZhAHfH8LyKhbcVEgwL?=
 =?us-ascii?Q?PFjJPHrCcs+ffPEUgUExe4ImYAhKs6lkN5XlbkL/isWECfW8xqssWgKCCgiT?=
 =?us-ascii?Q?4HsV6cistQDOE9CpqjD/MgVvrkpL32+9CwYLXND97kW+xdVpNHwjnQzH5UOZ?=
 =?us-ascii?Q?cMNdY/Wf6EBBLZwbZBmiS2qm5K2u+Oqn6MhDw32b?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e0074c-46a4-47ff-e44e-08dc41387aff
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2024 19:30:01.8812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgY6Xz2a1ITNzv9ZnojpUR8OuYiQ1x4vSzwbNyHnqhilDEBnRB/jKP/qb/H+YqNqE92pNffFrLOiVqua5RU9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9499

Hi James,

On Fri, Mar 08, 2024 at 10:24:18PM +0000, James Ogletree wrote:
> The CS40L50 is a haptic driver with waveform memory,
> integrated DSP, and closed-loop algorithms.
> 
> Add a YAML DT binding document for this device.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>  .../bindings/input/cirrus,cs40l50.yaml        | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> new file mode 100644
> index 000000000000..6a5bdafed56b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/cirrus,cs40l50.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS40L50 Advanced Haptic Driver
> +
> +maintainers:
> +  - James Ogletree <james.ogletree@cirrus.com>

Nit: this email address and the one in MAINTAINERS don't match the one
you're using to sign off. There is no requirement that they do; I just
wanted to check whether this was intentional.

> +
> +description:
> +  CS40L50 is a haptic driver with waveform memory,
> +  integrated DSP, and closed-loop algorithms.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs40l50
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  va-supply:
> +    description: Power supply for internal analog circuits.
> +
> +  vp-supply:
> +    description: Power supply for always-on circuits.
> +
> +  vio-supply:
> +    description: Power supply for digital input/output.
> +
> +  vamp-supply:
> +    description: Power supply for the Class D amplifier.

Does L50 support external boost mode? If not, it will always be shorted
directly to VBST on the board, and there is no reason to describe it in
the binding.

If external boost mode is supported, then I recommend extending support
for it in the driver. Perhaps some additional registers must be set if
this supply is present.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - vp-supply

Making VP a required supply is likely inconvenient for customers; 99% of
them connect it to a battery, and end up tying this property to a dummy
regulator to keep the driver from bleating.

Only for a wall-powered case would VP be tied to something like a 3.3-V
switching supply, and I imagine those cases are rare. It seems that VP
should be optional.

> +  - vio-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Nit: most device trees tend to use 8-column indentation as with kernel code.

> +
> +      haptic-driver@34 {
> +        compatible = "cirrus,cs40l50";
> +        reg = <0x34>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <113 IRQ_TYPE_LEVEL_LOW>;
> +        reset-gpios = <&gpio 112 GPIO_ACTIVE_LOW>;
> +        vp-supply = <&vreg>;
> +        vio-supply = <&vreg>;

Showing VP and VIO tied to the same supply is not a valid example; VP
typically connects to a battery, and VIO is likely a 1.8-V supply. Their
voltage ranges do not overlap, and hence they cannot be shared. I also
suspect there are sequencing restrictions between them as well.

> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd5de540ec0b..b71017a187f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4933,6 +4933,14 @@ F:	sound/pci/hda/cs*
>  F:	sound/pci/hda/hda_cs_dsp_ctl.*
>  F:	sound/soc/codecs/cs*
>  
> +CIRRUS LOGIC HAPTIC DRIVERS
> +M:	James Ogletree <james.ogletree@cirrus.com>
> +M:	Fred Treven <fred.treven@cirrus.com>
> +M:	Ben Bright <ben.bright@cirrus.com>
> +L:	patches@opensource.cirrus.com
> +S:	Supported
> +F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> +
>  CIRRUS LOGIC DSP FIRMWARE DRIVER
>  M:	Simon Trimmer <simont@opensource.cirrus.com>
>  M:	Charles Keepax <ckeepax@opensource.cirrus.com>
> -- 
> 2.25.1
> 

Kind regards,
Jeff LaBundy

