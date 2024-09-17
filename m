Return-Path: <linux-input+bounces-6574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAF97AA40
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 03:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5BF328715E
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 01:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14092134B6;
	Tue, 17 Sep 2024 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="PStY2AV6"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2113.outbound.protection.outlook.com [40.107.94.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8037F4F1;
	Tue, 17 Sep 2024 01:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726537156; cv=fail; b=IubMQjD8Rh/izd/t+Tj7Vlnoah+huFYQEvdpG6UNcIl5QSZsbrtm9iXL8nmdsRiZKAfhRHCCaUzs06/qaXqPYyEJ6e7ttNIr0oAf/2KgYNOzvqAsQ5E6blwLtgMtKDJ3B/GAGHpX1SkQfMEyUKZJ5jLJITl4PrlJ55v+4CWUptw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726537156; c=relaxed/simple;
	bh=Xn53jD7MtEoIPg5XXoB4DSF9oiapPtJRkomT+4+SMzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mnj0YlguUFBaCVTXyJfxmCQe5x8T57QqJ8Tea2uUGB+innGudzSHXcLHUItHebRkZhMIaJCtSP2m4k7p4qHC5vc9wxS7LW4Dmwrvqu1IS6//psUQ7At+XDXyOMZT+L0nC0/EndYrr5bj4beAL1zKkF6dqMtniVPbeaWRdUC4yGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=PStY2AV6; arc=fail smtp.client-ip=40.107.94.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOQaGIs4e7vlsTLKp/T3WOJK2iHcZE87SGiA1p03BPGRs2VIl1ZrV83icSnNjLpnKyWZHmtbqlfVIZZXQoCX/KJLmITq18oakr/b6Djot9fsvIAjp+QgwczjG5p1PdsFrnf9hv+D1NuftIq4Z2fF6GEY/aY78uUrBQXRpYH/fSbxaXyJHoc8T1AxxcGjIhEl3I17wdohrgezkiNIhM4uXf+BmsImQhw8OodzoBX0Hw3wGSJOLCJyu0SV3qBvvoiefmyCCUdQYexxgFvNarbJdEXxB1wWHGtNrFTnb5jQhYjhowrKj82U/4+1xsrtOvx0J4Xuk5Q3bRjMC8WmlVNQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty3Qd6OhqoKq+b4yRp/KCfDH3VXWnk5U9njLyRduiTw=;
 b=qraoq4z/MgTKNt72Hrot9od257odgmqPbS8gy6NhJ7of+1tncBpPMkgHP0WVNqlapSkiVJqEoP1qFeTE5HyOIkpVE3vxyHwTnYBso23Geu6OMFlgAiRf1uPxgk9rnirHAzUiC/EYVP+/MHdOoZ9SJWBuLk5k5jGcseG4y2iwLTdJTBGZOQ0jfq3bejL8V7WNRPe4x7HlbpeVXl5cnMplipUZAHyCn1GExmU4jcSZ0AqLTW5qvZEWQXuzDiXzEjbJskugGlDxycaljfDm19g4HRp5WrTTOFOQj2D9UdjWOETCExMtsbGhrGVuaQZ76C27LfrS/uSZTuod3IVxsWbAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty3Qd6OhqoKq+b4yRp/KCfDH3VXWnk5U9njLyRduiTw=;
 b=PStY2AV6aMq1ck4uXYX+M7RN8+r36/aWUCjn63WKJv8jD/O3GN+fcYRNMIz8uU0bIbGnoN5KHaaKxYPzli+FQwXiFTj/t1B4PdH4wVSnyQsBQRFb0/1tIU7PM2vP4638qNiRo1YYxaiDYe5lMVSqO7Lc9y2O/3sC/AmQwOJKZzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SA6PR08MB10086.namprd08.prod.outlook.com (2603:10b6:806:404::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 01:39:11 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 01:39:11 +0000
Date: Mon, 16 Sep 2024 20:39:00 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: touchscreen: add Hynitron
 CST816X
Message-ID: <ZujdtKcVcwMTmmOM@nixie71>
References: <20240912132823.123409-1-kuzhylol@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912132823.123409-1-kuzhylol@gmail.com>
X-ClientProxiedBy: SA0PR11CA0151.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::6) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SA6PR08MB10086:EE_
X-MS-Office365-Filtering-Correlation-Id: f04c5f58-ef61-47a0-83de-08dcd6b986ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nJrogFvLby1FOew/rQ9qZQkN8c3ipeegwiikcvb6+Z7ahtvJoeHx5FwLSG5y?=
 =?us-ascii?Q?3Zk4l07IqMcvaHbbnwz5Ep4qI0kuIfGzX8u2bTPfFnvE1e82ff6O4Pj+4Eiy?=
 =?us-ascii?Q?560I1bWhKnfrXMoDxQmQ/pEpxNYBHshG2VAE3s97jxWs0iUZT+zLXdSb9Aw0?=
 =?us-ascii?Q?D9xFESTfvU00DSo61yDhdGtN04ak1wpTfP3OYbnfDksnnfSZPALPJctg7MdN?=
 =?us-ascii?Q?KyOaBrGYRA0V4yCJgiPBiuvC54AXkZi/oArYSltqN3fo/Ahm13uIt5gkvChV?=
 =?us-ascii?Q?STxXQhRSAruneZYw2wUeSl8pc60MRH2UFZuHwgvAksO9a99KgowG4zc6xiQM?=
 =?us-ascii?Q?nQ1DQH9+yI5W+hmx9PD8N5mLik6+0B7jgYqCChsWGDvw51l3h9iwp3PIeLNG?=
 =?us-ascii?Q?rwuwyAhHnkYXeU1wfv8gg3N8e3YiiHp0P/mykoA8MiHeW1GwHixmWLeVd2WD?=
 =?us-ascii?Q?2cIZAeIFjmo2V3GQ0n5s8kp1cblNI19q4uv72HgGdU9DADce1CdIiUr9EdXL?=
 =?us-ascii?Q?c3+e3xPKP4QY1oxuJfQIL6YfOwJFlKvGVYwRY37k8v8w9OnMUCgvPh1ItpNA?=
 =?us-ascii?Q?wzfHzCsgmXv38kTv6QWWSXSlmZWpDvvkg9DL/mLVZeCRnJ2HC0ts8yNRJ1P8?=
 =?us-ascii?Q?scQJXKMjH4ggBM/+6ZwSFOJOlpWeG+1qqvmnpRzDvrb65ZtbeQRdO5lsQWZN?=
 =?us-ascii?Q?dNk2DrjRmMArqLPsbZQJHJaomyHMAy/X2YeyfPV0KCc3mDeH1vhodjFBMXwV?=
 =?us-ascii?Q?x0em+BXtCBifdPyWu+dxppS4PI04ffw9bnBDwPvosCCATmXWwOHhwVfkcwDL?=
 =?us-ascii?Q?pcmjKDwPt5GY4fqwQ2LFRAobankr6bhEjsvkPyG4ghPEnrrZrLg9jWRGU32D?=
 =?us-ascii?Q?R4YwJ5VaJZ2z9dfo61QEPMgIuZV18lSoDnNy0gyUbPt6wvj6UamWBxXkHSQy?=
 =?us-ascii?Q?naIdqRNRet/T4IAX9YPnTZqWd/rnDYDIiA9WNyqorrX+C61n9vxCYdC5JdSg?=
 =?us-ascii?Q?9HrGyoaVWueXjs5D54S0m+rM2zTX6OsBUTt/KUxR+3CeBXue4tKdsXJ+oCZW?=
 =?us-ascii?Q?vpU6cM+Noydu/BhKR3bRu6ZvFe+u01lntAZPo9WMV89EZYFjtl2I+FAaij+9?=
 =?us-ascii?Q?f9Cm90UXCFSp2H0jAKFKY4VH8k9oAGf9BUFS4gFSZ/iSfNF4uZBGy2SOdaD9?=
 =?us-ascii?Q?zGGWSA7yCVVzj0qCYgTPxepwFio3RkgDdNogtJtBDi+YdiYvubcL4TkDuzHT?=
 =?us-ascii?Q?LwuPMFnWaJnR2d39SCA4xtH3HLeqCedaI7eMExOGqsDz7pSJlWQcm+YC1TQ5?=
 =?us-ascii?Q?5tA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V+XWyR8QSydDXCv0H8VhliZX27bv+v6flwPwSbHkm78Do7tgghCMxC21XGlr?=
 =?us-ascii?Q?3ZbjHBNyXlYrZ5AHD/MR7cYnTtTR9iHgv50oy9QuhJlL2DLUSyHJo+E+KjZE?=
 =?us-ascii?Q?0M8uohCYuT+yc7Ez2/3k8oDHqZzi1PzRlNTHbx0dsV7MBYPhYGYc9Y5ZLwM9?=
 =?us-ascii?Q?kDCPMzksjuyqfzAdGblgflQNOyvCqCnEUy67nL6IDvNIndcQwBVCc0Ay6EuC?=
 =?us-ascii?Q?PWPcSLejZXChLl7UajSeGiTTPsIFh7qQY08hWGJHFrpk1HvYT5kjxZkxk7BC?=
 =?us-ascii?Q?jHRTOW5tki4Vbggap4fKLfFzol8P3nRW0FpjPdjqhp8yzVIkfgdKBHOD1rsU?=
 =?us-ascii?Q?R/2S6XQRyP7FHuR7dNm3JWgqRmd4iGPFVdQAY3VXpkjDam1TNsZ2aD4gf0t6?=
 =?us-ascii?Q?9vqTtUXkBwxKOQenD1PPwLQNEOaGesOFjKgLncIsDCIJXoR1Ioii+bYFRBUL?=
 =?us-ascii?Q?7Agd/EmqqgwJ04rQ98RBGF8XrVWxCR3mMlszW+KnhT8ddka4n9xNUzylWWcf?=
 =?us-ascii?Q?1QD2QxdWfskzy2J4OLCWqymNudz1WqTBxqCUeMuLj2hAt7nc5q+agkiH38Oc?=
 =?us-ascii?Q?Q9yxfKrn8a7TaMh5BkYsRbJ5Gm/GnU//JVpJtH1oQx8/5A0kZjGk9MP0gUFz?=
 =?us-ascii?Q?a6psITyKxY0+pL4TDqTFcm7ZcAtyK8LrVl+TNIhtuZRj6xB3P5gS692U9omb?=
 =?us-ascii?Q?BUoKre3s4nRBikh01zYnSC289K2Z0xCKN+HvgcSWPfEbrjuzbe75Rtidllmy?=
 =?us-ascii?Q?DROO4+o08jMmAak3cLmX/816XhPp6EUWCMYNVk8HgOz4Tvi7cmkRb/Wa9JMy?=
 =?us-ascii?Q?IqwDtAbMzOQEXR2qbspWQt+HhOPz+/w4g2cBOO4Jt5aqEoWKvwfDv5xlTDbE?=
 =?us-ascii?Q?ot1/fchVMJIF3jPIKUSxqAoASnmvZ6F3KBVn8K21+z+mDQVi+Cac6gfdyo5/?=
 =?us-ascii?Q?ymZYr4GwYpt0FqBhT6HOsvBb9HUvJqTlRM2gbPcRy7lIIsGLnKIoisNfg/uc?=
 =?us-ascii?Q?3gknN6hAn27n7B4uTBBq33MzYtuq1QBHu3govbPWSycOhuo9elDkrZcqR1ua?=
 =?us-ascii?Q?UK8ehUkV7dagmEe6uS4vmCOikMtrLIQhJCO6kH262x9CUORpRAHRrSUbjU2/?=
 =?us-ascii?Q?0sPUfSillKSB6BglsH7W+CBma+DBPjxIwuHkYJVpfAjg8u79H0DhqzSq+RhY?=
 =?us-ascii?Q?r6I4h/A345ri5GY3XZa6JvZ+6feLzaB0ZZrVaW29fgxbnJ6k6R15k03H2fe3?=
 =?us-ascii?Q?KGDTkaWzMVmOFXuqTNP7wj0TNsztAevjiaqI+Ndt9gfO0ebMksE4he6ybhyk?=
 =?us-ascii?Q?OidN9j4tkQB44OPQKOTYhIu/bkYdw3gEzXuMBZ1JR7MqJmuo09YT3TmbUxK+?=
 =?us-ascii?Q?YZ9/EbwcjFcaDTEBiFveVj7krao0R03iD1H0thYFIG2kLXr5LRiDFabZn4NR?=
 =?us-ascii?Q?JPR9K5A1zV9mU2axPooMz0fMfV0YW5e0mWZa5z+NpIroAtat/+LoU15BPqx+?=
 =?us-ascii?Q?MyF9d38RDruOwhotsqpAJBfRe+mXLUEX9slB8HLKfhkaQp3WNyVX3PhlCm7r?=
 =?us-ascii?Q?7D5Q9erHpX0O1j2RDmA=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04c5f58-ef61-47a0-83de-08dcd6b986ad
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 01:39:11.2237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKjvBVg5135EJGIWhgizLcqkMt9l+p+UaLwJD4AdKuhPPrQVyoG4OcQHLf0/Cz0s8XDRVfkKc4tlAzuKXVCBOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10086

Hi Oleh,

On Thu, Sep 12, 2024 at 03:28:22PM +0200, Oleh Kuzhylnyi wrote:
> Add documentation for the Hynitron CST816X touchscreen bindings.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> 
> Changes in v7:
>  - Introduce the gestures field along with its sub-fields
>  - Make reset-gpio property optional
>  - Extend main description
>  - Remove "touchscreen" reference
> 
> Changes in v6:
>  - Fix minor tweak adviced by Krzysztof:
>  - Move additionalProperties field after required
> 
> Changes in v5:
>  - No code changes
> 
> Changes in v4:
>  - Add Conor's Dooley "Reviewed-by" tag
> 
> Changes in v3:
>  - Rename filename to hynitron,cst816s.yaml
>  - Update description with display details
> 
> Changes in v2:
>  - Apply pin definitions and DT headers
>  - Use generic name for DT node
>  - Drop status field
> 
>  .../input/touchscreen/hynitron,cst816s.yaml   | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> new file mode 100644
> index 000000000000..99ac29da7a5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron CST816S Touchscreen controller
> +
> +description:
> +  The CST816S is a touchscreen controller from Hynitron, which supports gesture
> +  recognition for swipe directions, tap, and long-press actions. This binding
> +  document defines the necessary properties for integrating the CST816S with
> +  a Linux system.
> +
> +maintainers:
> +  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hynitron,cst816s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO line used to reset the touchscreen controller.
> +    optional: true

Thank you for the spin, but I think there is some misunderstanding here.
You do not need to explicitly define the property as optional; I do not
think this is even a keyword.

All properties are optional unless explicitly listed under the 'required'
keyword, so all that needs to be done here is simply remove 'reset-gpios'
from under the 'required' keyword as you have done.

> +
> +  gestures:
> +    type: object
> +    description:
> +      A list of gestures supported by the CST816S touchscreen controller and
> +      their associated Linux input event codes.
> +    optional: true
> +
> +    properties:
> +      "^.*$":

Again, I think there is some misunderstanding here; I do not think this
can compile, as evidenced by the bot and others' feedback. Even if this
regex were valid, it would need to be placed under a 'patternProperties'
keyword. However, this is not really an optional approach either.

I think it can help to put yourself in a customer's perspective; it will
not be clear to many people what is the "gesture ID". This seems like an
arbitrary index that is only relevant within the driver code.

In general, there are two common ways to specify key codes for a touch
controller that can recognize gesture events:

1. By name. Each gesture is represented by a child node with a unique
   name (e.g. 'gesture-x-neg'), and your regex looks something like the
   following:

   patternProperties:
     "^gesture-(x|y)-(pos|neg)$":

   The driver then matches child nodes by name, and the customer need
   not have any sense of the order in which interrupt status bits appear
   within the register map.

   Each child node then specifies the 'linux,code' property, as well
   as any other properties relevant to the gesture.

2. A single array with length equal to the number of gestures reported
   by the device, defined as follows:

   properties:
     linux,keycodes: true

Option (1) is useful if you must support other properties associated
with each gesture such as distance threshold, timing parameters, etc.
If the HW does not expose any such properties and the key code is the
sole parameter associated with each gesture, then option (2) is sufficient.

There are many upstream bindings that use either approach; please follow
them. In either case, 'linux,code' and 'linux,keycodes' are both standard
properties defined in [1], please study this binding and reference it in
this one.

> +        type: object
> +        description:
> +          Each child node represents a gesture that the touchscreen controller
> +          can recognize.
> +
> +        properties:
> +          cst816x,gesture:
> +            description:
> +              Numeric value representing the gesture ID recognized by the
> +              CST816S touchscreen controller.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          linux,code:
> +            description:
> +              Linux input event code (from linux/input-event-codes.h) that
> +              corresponds to the gesture.
> +            $ref: /schemas/types.yaml#/definitions/uint32

This property's description and type are already defined in [1]; they
do not need to be redefined here so long as [1] is referenced correctly.

> +
> +        required:
> +          - cst816x,gesture
> +          - linux,code
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/input/linux-event-codes.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      touchscreen@15 {
> +        compatible = "hynitron,cst816s";
> +        reg = <0x15>;
> +        interrupt-parent = <&gpio0>;
> +        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
> +        reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
> +
> +        gestures {
> +          swipe_up {
> +            cst816x,gesture = <0x1>;
> +            linux,code = <BTN_FORWARD>;
> +          };
> +
> +          swipe_down {
> +            cst816x,gesture = <0x2>;
> +            linux,code = <BTN_BACK>;
> +          };
> +
> +          swipe_left {
> +            cst816x,gesture = <0x3>;
> +            linux,code = <BTN_LEFT>;
> +          };
> +
> +          swipe_right {
> +            cst816x,gesture = <0x4>;
> +            linux,code = <BTN_RIGHT>;
> +          };
> +
> +          single_tap {
> +            cst816x,gesture = <0x5>;
> +            linux,code = <BTN_TOUCH>;
> +          };
> +
> +          long_press {
> +            cst816x,gesture = <0xC>;
> +            linux,code = <BTN_TOOL_TRIPLETAP>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.34.1
> 

[1] Documentation/devicetree/bindings/input/input.yaml

Kind regards,
Jeff LaBundy

