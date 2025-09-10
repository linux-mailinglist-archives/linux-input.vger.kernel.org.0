Return-Path: <linux-input+bounces-14600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C52B52447
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 00:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DB251C2428C
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 22:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4EB30506A;
	Wed, 10 Sep 2025 22:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xd7YMG46"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E922F3C35;
	Wed, 10 Sep 2025 22:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757544265; cv=fail; b=jYYK4fk+Cs6JD4yX2HZseOp/4sdhmWU+28qnlRLc0QV+N8MIRuJZCZBaFYlETdTao/mAaWkPxoLDMSre8hE6urjcoILdp48TKDiNuzCyZRhupaiHzKyqJzveA77J2Px1KHb7qUgnUNeRfuypA9++s5KvRA+wgqAHguwjmeTQvk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757544265; c=relaxed/simple;
	bh=lMy0D0L9/+4nht6+0EvtQCOo37Q+gd2/Mi/VFm4PNzA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W1S28sarUbKgwUyoAHCfeNfmnj6esgnJZ2UABnmxsO4Ge7IharafCKQe4u/A3P70XMGk1+WsrUpeRFPiAvuOSQV7rR1OA0PhlxVaELMmTjRd95TvwSHn6B/PHRmkxay8/SSIDWWeYzj6gF9L4YoKtaJ6xdjuOyFEZIz9Ybd47R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xd7YMG46; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyIzrHObj7QULp9/b2A+xrHP38ozBSEDJ/siUz+u/uxUlLJNKwusD18eRNsgnYOh3aomz3n0RCRBzkKJav6YlSbzVRyv2T7Ek3pY4L7095LyTGcqaeAwci5LuEXVn6nBo0yb/lpETHiHjxeoY9Nr0udNjXAT6mfPjflMJJu8ioVADFFdY07Qp4Qds0ZWXuqB1+azVpWKv1iXpGnFsYBxhVaopPwkv+wbxJcu4YcT87SEVPtcYlMawA7SgrMEJnVcrUPqSuAv4qZsDNgSBn4hnTN39nmdOh68n0k53tw4M07/9V17IO51nLbnWM4nSINwvlWrc1gtOgxhblVpB+6zuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gj/TRI7ttMglskvR21FTAU+XRrDwdYU6b9t8zluGflo=;
 b=IPTCxCqqN4N0cI4KxM2D8s3qhFlvg6Xdz4d+q/vE8lw2isMmCz5OysR/MXoPNpgzIyK5lVQW5qbpSY+NFN7reLAxUPOHl+1mhTv6ln6DcD6ggNMz+vj34f7OFJnTwTMcqa+RTnkOt5iHJSFRaeEH3geKf9lfmcZNDL+D6nOMYQhWvbBfeoRh7cZM3ypVQgqPSHeDmW66cdSftJSKMZSSCvfCjw7TyCXovHC0pslv+pERf8KphQIk8YrEdHtr1CB5NU8tQt7aE2psJKvrPf01YXByQIv+r+3GYKaGXoGQ1NrvQFg1cohEIgXoLlAX4QzgqArELrisatztecUYVaE5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj/TRI7ttMglskvR21FTAU+XRrDwdYU6b9t8zluGflo=;
 b=Xd7YMG46UywVHgURK/G9izFSwmPSFbGLUrJLPBU5O2dcBFOGaxhahHNB7MzhlIvz3lG/9azDbEWQ9J62AeHQjGBZAxQpCevMUAjaRv5+Vatnm1jJIj8JOs4WiGy+mz0o1izbG8SaeH8lUqUjO9MJbuHLWzSdXd9XASZiE2AEjWYCz9gTtvOppvPwFdz40KRP0Tkf3zHOTI55aGSvLxp5n7gFmOmUdEuOg42XfuafiTMgslYHB91YoTp807CcSN55fiptAYK0SJ5w1TiZSkNbjV64hJ2K/BXWr/OcsUdGbXdAVUTrrxK+BLppb5IHVUOiXfCrAmsYHUoIwt4CNbmbFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 22:44:18 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 22:44:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: touchscreen: resistive-adc-touch: change to unevaluatedProperties
Date: Wed, 10 Sep 2025 18:44:01 -0400
Message-Id: <20250910224402.994046-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DBAPR04MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa21407-7a36-4121-bfa2-08ddf0bb9370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O/al2oVf3V6vhtRVASrGtYjOtm5Os6N0S5AbohhSpd9fcI+L/gKtcWZjFAkP?=
 =?us-ascii?Q?LfWGUOBEmaC1d3VTQz9zUp419iyIdVOEJjm9UdWaVqH1T3ixmHWHCVVhkleL?=
 =?us-ascii?Q?UvCtuPfdyhAOWC3WPiLz65uHNPx92tEirdJpqNV0IsWAURrOj4sdxiiq0nLW?=
 =?us-ascii?Q?tYNfrGDi2z4TSrbs8X7WVBOOXrlLBD3+ih76F74hEfajcZs+pZO3JTVbR0FK?=
 =?us-ascii?Q?URbdhXBljVeIhemdRgJTR4qGIcEoCvehaNhq2MhFnOVhF62R+MMSuvwVBe5S?=
 =?us-ascii?Q?P55NB1/XsyqOjVbUAo57bvwZ99IE9QqeZAb/u5i4omgjvg5qVhbkUxqOM4n8?=
 =?us-ascii?Q?sBK2AnOuCwg1unbHZNi/cDbTihJVk97bqy0m8KuUznD+2gCfxb+wHLnD51U9?=
 =?us-ascii?Q?210abJtn45m81XAn2/HbsMvJK/zed4sc39mIuFpXbrnL8vz6/n5dJuyQJvug?=
 =?us-ascii?Q?eOX3YZWmddlerj0c+eG78ZgRVT67hR8LyCTSXKuCam7T7x+bF/zr3OetxFgp?=
 =?us-ascii?Q?3qz0kUeKJHwukix6OVp6NH/Rp+irGnaPsN7TuupoUJaC+mPwcTqgcP7OGJJS?=
 =?us-ascii?Q?beKWOzEJ9M/FSLST4k7GWWUKB/amJa0cdv3+kq8yVvjbQC0l9/nor3PGoPpJ?=
 =?us-ascii?Q?CT8gEOYS4ysmYbLFU0YWP13Mmj9/eiGWlLCSxr1SsjmZLzLzZkFXTIWiAIPG?=
 =?us-ascii?Q?SHbxTB3GmMcIvOWLZDYUljvzz0qtVe86FvlkIuE4Ygxd3rbmuLwVZDI6UxiN?=
 =?us-ascii?Q?wiMp81olCF8GPBQOKJM5dYxr+/7uT3LQI48w7AfeJUmLDoDauCW+XktTm/XY?=
 =?us-ascii?Q?8+1EN5HNTKwSWKCFUKRdNzOcYtLqoKVZbusXt8YI2nbL3Kb/C3S0zihUbEwM?=
 =?us-ascii?Q?+mBD6lLq28OXrba5BZsVEvWN2uidhzZHF7Fst+4rYdn0cdqZpb3l7kNmBUF3?=
 =?us-ascii?Q?Jtdnu+XmD16S701VT5JPmIiQ4j5PEUIw1cMWv9H5EPfwN6hTel95PBo3DQ9Y?=
 =?us-ascii?Q?WmQoqlhrcpuz5zOtwwOcvqhTib5V7ebl6vpDXH2zV5BxAbvSljm9j/roq5u3?=
 =?us-ascii?Q?mXSxkQg90luorJr8kPUCUXRpYwhLTnRLRcmNE0RdK69hUK+AL5r92wj4iudu?=
 =?us-ascii?Q?b06/iS9DR8IBp08zAqB2Kb+Q4k5omBk9K2pDR5EykKZWUfFeBndG6WvVFteu?=
 =?us-ascii?Q?N6V1y9ZkHu2wNsJq2L37z3RvL9gQeuM0B/DFXo7HjcFNjIq09U/r2KJL6jsQ?=
 =?us-ascii?Q?La9RCmjeizlqQFPT/lr5KHUUtx1ro9IzQ/oCU4Uoglo2Fu0Mmk9JVToCdS/p?=
 =?us-ascii?Q?5BTmZjLp9j8j1DHtQsxft3coNAU6c9bbMLJTITHJ7ui7D4nQWG/2uFXnJPWq?=
 =?us-ascii?Q?ifcePVzXdafq+yJC0MyJd+r4pdl0RKnd+YqxI8GRgQydr6YD9pGHoFUGDmq2?=
 =?us-ascii?Q?0tfxcy7XBvml4eKTyOVqupP79tNGnVEL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/K+jJuzNzvWu2JkSWeJZBIG/DVoWJZvwEvYAWuhZTTuKa/+SuZOuBvY3dFJ5?=
 =?us-ascii?Q?ZXWOVKmwWwu0/P6NXJQvDghFHY1M083v/oIRzPNt03ylf5an19a4x9S+lJsz?=
 =?us-ascii?Q?dPoKhAX7nA07hIyBNyAE/pcBBxu+ORoLElmBfT9TB3uSZrtzN36tFsVwnS3j?=
 =?us-ascii?Q?S40t2pg9Ah+oBC+3pBjVFumBtS6LWIB0TA7rSOF7FpsUbd25CDKCWNs/zyqc?=
 =?us-ascii?Q?64l4wALfIlA/ZtnZuqzkXbnkhWvNqEcEaoihnjY2t4cmJY9IZcdm+k7MAKaA?=
 =?us-ascii?Q?WyVbJgPTtt7o/KDGNlu1nZKQ3cGQjf6wSvZ57eSPRxIU0qxx6qWJ2dg9ulLR?=
 =?us-ascii?Q?VAOl7UnjZFr0i0vJggxdqhWNo3DMu4uLgQXMyl1A7AQjN4Y7FpRZK/kesulL?=
 =?us-ascii?Q?kTxRa6zmRtORz7Ep9JxONMe0WRKkSg7bXMva4cj6iLbnae0caR0LFg98oAt7?=
 =?us-ascii?Q?yn2I7UsaKJPPEONytJt0l9F1YpVtPeGxWwNZ77Mo8tk5OcJNbnN8EAU0ISbJ?=
 =?us-ascii?Q?M0faE31yNdEPk/2n3NYcjQWnUHV9ZskowyZLN2kSuRFTTlBINQnvdSl0cmbw?=
 =?us-ascii?Q?9gfGlTeByjcUd+sCAEOSFrvhCaJTymlwBb72LjyumdMtEv8KNCRgSJ8JH2/N?=
 =?us-ascii?Q?+IcvXPZ63TjjgB4jhribekVNQGG7p48RlEz6RlW8I4x8K04gYwzYxPGtCvZC?=
 =?us-ascii?Q?8GAD+I+KQTY6Q1H7fKxecbhKCpR//Raudr2FE2Iw8DWvMdg1lmUpcvmP1/92?=
 =?us-ascii?Q?2tkNQpP9wp4hl85uLJK2Mv4Zn78dtgBhPgnLB4DNUTZ4pkxaQ/cHlZ9nOy7i?=
 =?us-ascii?Q?hJeJHEL22f2gkbKnamV/JZE5PwsP+/21oB87CuDld5bP0gDIkBBiqOYsETzL?=
 =?us-ascii?Q?D93+jMYr5y1Zq6NVYIk/4/jEQuQc4T71a1Pbhw0W82Wcv6hAByffffvJq7yg?=
 =?us-ascii?Q?2ytknv+elhw21Z7YibLlfQ6XAHtaG8ugZka+Qe084z6nKxvFFfU3ugQTb6yZ?=
 =?us-ascii?Q?+QnH8i7LVIIa7iDDkmrGOv3lqixfrvj8ORfAsvQHhUBM0Jfg3nP2eJoQQ2o+?=
 =?us-ascii?Q?LIAalbS4WhQHM5syTTXt3Ftk1XvElaFuiaBpG+PnKbYAsq7M0n20YNNvLtho?=
 =?us-ascii?Q?PEVbcYl9HR+EBG8VPkRl5+YB5EaTJmAH+wpLbOTOvNAeuLQT3KBE7EnXDAOQ?=
 =?us-ascii?Q?NbJgdg3IlGNcCXAXMiHYac7jH9ebpLaBaXtVFx7Bp7OztKbeTpDsGicf68/o?=
 =?us-ascii?Q?ud8hmeluRAwZqGs22u7x0ZjQl4lYOutQVFojJfMImw0m1dN/J4BQaJsAlDSz?=
 =?us-ascii?Q?9EW92a1DsiwDAgLcoJey/x5AnfY9+O6ECKUS53h8y3rbWDQ14WX1ANHXD3li?=
 =?us-ascii?Q?ixKxereHBasLg+rKO55p+YFlORkgiNOjm72ZNNJqdr+m3LsmGCEsVnWKWorN?=
 =?us-ascii?Q?T3ulr/gwgPRMncR4Np7JIUQW+20oD7BzcxxXAcQ8od2qctKKuVJHtqP1QM5m?=
 =?us-ascii?Q?+3sYdKZALEskUqukebxeNOHDkizuf6NRu8Dbvxdm+Pg3IbulDTe9Oz/GvRNi?=
 =?us-ascii?Q?Xlynwc5xjc0xOpFvyyT9oO1f7rFdqJtqQUi+vBX4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa21407-7a36-4121-bfa2-08ddf0bb9370
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 22:44:18.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdN0JWIbYh819am5WxbhtrziX6i178S5mTi8lMdhxawArxbZrjv1mhGPDOOf420L1EV6r2mANbFVBuMB6cJUvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223

Change additionalProperties to unevaluatedProperties because it refs to
touchscreen.yaml.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/touchscreen/resistive-adc-touch.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
index 7fc22a403d485..059d419f6c1c6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
@@ -55,7 +55,7 @@ properties:
   touchscreen-min-pressure: true
   touchscreen-x-plate-ohms: true
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.34.1


