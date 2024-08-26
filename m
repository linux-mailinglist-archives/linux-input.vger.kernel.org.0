Return-Path: <linux-input+bounces-5880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E995F669
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 18:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5B11C220F6
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 16:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C07194A6C;
	Mon, 26 Aug 2024 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Opl5wK/4"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9292F870;
	Mon, 26 Aug 2024 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689405; cv=fail; b=gXVIzWXe/QkqAGNky22N4vCdVPKPv+jRR8d/q405TEs+sjmXc9iwoXlXbn0s1qutBOzA0OMsTtG98tSWVr1B3Y9XCkrg0GnpEP/gijI3PlKZL1R4qFhsszQ86cpMauUlCziVRv+NBeO+p+Yb5iVCrdKzMQFWltKYPqOhNWknBgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689405; c=relaxed/simple;
	bh=xKQXlSuZur0fCObedYwZKJjoAJ7yaysVOfJOxKMkE6A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ShTm88kg/t+9k5inEVhImEIFqxnmIm0u5DfcBxT5bMGpXXk16KvscAFEAj+OS4q4dZdZyd6IIrf7cHPjTTI1IiPvXAG084TYKxLkMRxH7nT9xBbmm0DCS8NNZsNejRiPvSAI56JFeXYIR5zaRyAivfto0zIRbw+o6T+yzSYnem4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Opl5wK/4; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bh7t1jLfA6irSlYybIWgMjTrPkbo747OAdyFtL9LVnsdY3SN6pMlkrTzz/erorHbu6kbyTjo7EMnHbNn3yiAyJzYyPfRR/MPKCDDRrgm9mA+Da2n2qwsNvsPt1Fwzzl5BqoajVWhMyU1APaxBAE+YmAgZ0V84ouKpJDxEK+49gHjbHCtO72W8KBjtjmhdzOfgT8zd5qvlkkff24BU2SkeX5AlnW7Xq56VUQTWvOD43/GyQOPbKBWlqeB5vR4ONrX3rv9z33iatX4S8eJzjSEvynOJYgtCDLLCTc0YsWl6iJsuK0OayHdjqBhywUDDCEERKjiHB+j/eh4kA4IxigTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6pg1Of9N74CiMNjyoL0EBOsx1G7oiEqZVWtL31K5r8=;
 b=DO3ayMMaoXWDpM3dpusTsJzB8KzyjZMWYs0OLmqXrHyMQbjc+UvWoNExMtrWQL+iejXsoULNTJUOZSiHIxeWSknQP488HICC6PmmyWe8qssMeGFTQSMCybx9icElDGC4mwGCUN1iQa+xtoDd5J9L9ZNizoN4JjGufDFFV2Df50Oa16ZWzsDknZ5t2lpcrpHVbXxjl0LEQp9Ot/g8AF405t5xii+aCcLk9dJU2g9BQwB/gu9vDc1O+h+I7rR3Ny+PQSR+i+RJTSuCvrglLRMZDsIdsFzRkuOYF9PnVVvkbxvjgjAKFJPDq7/F9JcGaCgyF8z1XkU/dTpUwMOdChr4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6pg1Of9N74CiMNjyoL0EBOsx1G7oiEqZVWtL31K5r8=;
 b=Opl5wK/4G5eRJ+Qtxw7+Kc+HEItTohNdwCRNmwjNsSaJmG0odiqRpcFMdG2394H5/IXlR9u6SA7X3o1pNC8ii2Vvy/hEzV/N1I1NBphGuDWd3AmkM3f9CGzt2Hc6O4W//RWaASyQvSJrX9aVvw3N4b6HUY3Ol/nEZd4Af6ieTKNZUFySPzPBrcrD25kbrFPOic3muWDonMHdgYQ/g/dTW8b8xEmYqnmJjlmnu9t4uLP1YAFJfB2kL32Pd89WHXO65Vbr7Dn20mOQ+0KvLYGo6ritfcynE+P2DXVGRpZe3VCHuabYAmVfs9/6J7vqxATJgAxyop9tz1mtv0xUp4cDIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10145.eurprd04.prod.outlook.com (2603:10a6:800:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Mon, 26 Aug
 2024 16:23:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7875.019; Mon, 26 Aug 2024
 16:23:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v6 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
Date: Mon, 26 Aug 2024 12:22:56 -0400
Message-Id: <20240826162302.960732-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c893cd5-9aff-48a7-c863-08dcc5eb650a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?24QvNFBioZcY1sNwyAidw+ZCEr4paYwUbMMZfISlOl3Ib+hdy8tkNLjeb4X/?=
 =?us-ascii?Q?jd/mSoj7gZpz/QVp45BkrVNDiYsuzwJbyPVJLA6Hm6/9oTZLvZL+T5+JLhbu?=
 =?us-ascii?Q?CvIlCi3AvmgzPewp9fNPIR5jX+Y9gUYxjfOwXLy3e2KSTQP6DRDEmW0xJLeT?=
 =?us-ascii?Q?SgV1H3ZQhf2ElXlF7qU/D38hDLXo5cWrBBWo3UZFwoz3BCdt4mE16LM0UEhI?=
 =?us-ascii?Q?clyOiLYkKNJO1DmJgeLdv/anfsfymZW+XvZ4sMDJXk8n+rUS5Hvlp88LJhPf?=
 =?us-ascii?Q?E6lIfwzJl1+tWOU/H+h7uoG17mC264TiCDqC2DlQbS4GLBJFC9b6LGQyuyRG?=
 =?us-ascii?Q?fxETOLvVSJ+n3SOVjxl/h+hm4nGzp4L7oD3KsIwUZIhGRXotBEiUYIbwrqKX?=
 =?us-ascii?Q?h0yduEQ9GbWwBrJmc2OouEsmfr9yLmd6XNbo3hVfYqfSljbnb85zwFdUohko?=
 =?us-ascii?Q?0QilRY/FJf9U7GsA60if/1zZBUYzwDlHyXiOW+SXm3MzZCQwF8rYEj8Cil3b?=
 =?us-ascii?Q?BCEVrutRyut3urXYb/N0aQQJGQgRiGhtODg4W6WelGwQljPX5TKom17tEkQu?=
 =?us-ascii?Q?vW886TUP2bOgyqg02JBVI9D616mvXuHPhBQOGHnfNeBUMJqkh789HQZKEEoT?=
 =?us-ascii?Q?46DmybRbYO8AeOVcBZ2v157AJbGdTHMjJe0sCBfa/0ylMEedIijzGxjXiD6V?=
 =?us-ascii?Q?BV9rVz4/b0YIDOab2wVX0JDbrxWN8rm91V1wzS4h8VnlVpbjWYV7DcCoXwBj?=
 =?us-ascii?Q?Dzm/6b1yaLbdRGVCL6fCEvrlBda71FEgx91p49KbL4U99jwXpsUP051TWSCs?=
 =?us-ascii?Q?oKSJkhmAw8RbnndXegx7etvWq8/trMzIezcxOnHlIo+ui7Lh/EN6uQyzgte6?=
 =?us-ascii?Q?v0gKDWibCn/sHaBdTqYQz4aOgCM9znKjCW7kpR2X7AJqC2/8VlAz0tRfquPx?=
 =?us-ascii?Q?yvOHqcjE8kTV7BtRoJZE0v6bIrhKB8nGfW9OfVmJMcOuCnPpj0CUKllSq/eC?=
 =?us-ascii?Q?oW1DrdayxaYP5PqPiGy/NS5FUf1QWxrr65vVMeYKnnL3jFE9RZHL1zgyGq43?=
 =?us-ascii?Q?7gMXq8XDaX71GhGCrk9thb0/DZMYdzB6Rvv7w2oHgYx67jRexoCIPDgFwGlS?=
 =?us-ascii?Q?/MsydrkhILsCCtqMJpaZfZyrt1MTW3qpc99WHN7tMS0+kITqnzS5npoMlDnY?=
 =?us-ascii?Q?x+q+Vzvhd9EvHuO9wU2G/vHkzohM9CgYfdZqy+iVOhCXTI7Av+v4pqTQdXjb?=
 =?us-ascii?Q?l9VIl/HVNgkq6a7oiuQGg4SvCGH3QmEE+jefMUXSwB1VwvoGtzLfO8gM6I9w?=
 =?us-ascii?Q?Mz3129se+9uFHCCI1FP/5PsGiGyyno7ICIy/Iay9Jy/30NBY5hPex4KOVdaR?=
 =?us-ascii?Q?qgKkMow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y5EoDvEf5YCYxoCHcxOMzRwt9L2RPKqk34erd9KvjolVcCbNliO1QdtXGU/q?=
 =?us-ascii?Q?w2uJ99vc3vxzqk+WvGfHX3ONr02Q94Tl+LhdOWsYfZh2AXzQuddTmBwsyhZP?=
 =?us-ascii?Q?gH60cTpFmxRLcKkbdc/8oTKMnovpO4FDnYw6N+ayGqnSkAunPkBC8Gp15CpT?=
 =?us-ascii?Q?jvS34ksIm842EZHuPwa4hVmTL/uwl4lm6zrE3K8ji2KfsQJhT4ASkpo9WlCi?=
 =?us-ascii?Q?l4g5qCijyCP5YVHQG39ho2zjWvpw1K9pBWWlHzNZdQsVTEvFd0gpvNs2qcDP?=
 =?us-ascii?Q?NllcUJV84jk9I2w3fbrzQs8FNf/0Of3r8ka2Jrb1RNyy8XQm04DxfcM105tz?=
 =?us-ascii?Q?Nru5U+I46W+LMOV39TEZBZ/zhBlCFb0O0k3Gw9Gv7V5Bv+A/CM6xaCLXtKnJ?=
 =?us-ascii?Q?kdrYbAmXkuKWNy4WqzLgJjeS4jNAv2IHajDf4mreyeUJADtgPtGgw1KRHE/1?=
 =?us-ascii?Q?MHuNU+0LJ1fuYfqhA/LvOtXn4jGpdPJ+7FKXP1RR375G7kqoHojLVzRKpRQy?=
 =?us-ascii?Q?qJw94CBAyvSJwT5vsZygp7cT5JFpO4mqRJudDzsdYU73Sp/SNRQmbrWxIr4l?=
 =?us-ascii?Q?tFVcOdEDJizcavJQxdS6UTWgIM2EVpzE3D+7L7yDtLq3C+sJNkSyXOIa0aER?=
 =?us-ascii?Q?iZ9TePsFR9qYWAC6lCwmszMD8ab1ol3IlF5jNOjIo09BH+IRWP67akAmqV4r?=
 =?us-ascii?Q?NGW4Ax2HN8JMeKEL+dT9aLHKxnw4EBnIE3A32sBJo9KK31LwmpIx8Lv2UBWk?=
 =?us-ascii?Q?q+Z8i95BUs1HWwOr4DjH9a2EAHeTWQ/gYOcxY242qHXIRlf/i+NcHoZfFMsv?=
 =?us-ascii?Q?2YL7/4I8cBQFB+mJ08fBc6YXbA3rwYNwQSMd89x8NVQiXeo8ByR+NbAgikad?=
 =?us-ascii?Q?4eHQhUoulh5HzsfAAYh2JuK3jwokvXAUrOLIlHpAx1odrU7l99v/lNE5sWhA?=
 =?us-ascii?Q?8x5USO97KX+WBI8Xc/06/KmvBujIKtw7dsRXtWgew0Sxce7xC8sQJoP53JCC?=
 =?us-ascii?Q?Dk53Stj78qKKcYbOqRK/4H3A6aZrbi9qqpdWzlWePFFLEqRe+Q3//HMUpYSP?=
 =?us-ascii?Q?lB63s7d/LqtDkQK7f3aw1vT4qL21CrY3zaQ5VculjZgwrBz8dg08byB4Byid?=
 =?us-ascii?Q?ECLqerUEx3oS2hTQeW+IK4n9laLBa2CEkIRmTN3t/y2IffPN4EHgeprVFzLv?=
 =?us-ascii?Q?99y8OPRim9NFdBNy2TT7U5ClBQaQcWnQGyK/fZ33JtAcP2pZahFYZyFTVkkq?=
 =?us-ascii?Q?3ZHTyANVwokuSq6azqbkCOV87pAMShI9QUZHVME1zodlF3C0Kk//OyQxgKE5?=
 =?us-ascii?Q?rrhDCtAGGg/fhFerYOqZuaQVVIz2sKMzeiAtXcUgroXezTp60xJEqW0CJ0vb?=
 =?us-ascii?Q?jufsjzrp+8eXRdErqro2nYBg8UE+DXYm7ThiofeKr4rrJlC+ltbmhBOLtXBr?=
 =?us-ascii?Q?hC2PXUOEKf8ahglQD8tjYYs7jxXkKzHrDQ9TMNuEoPcPhElUOqumq90UfnTK?=
 =?us-ascii?Q?Aia/w31rA4P+NiN/sar/pJfLOj1NjY4SYcnf6FNDDSZqSqMEuEQjF7LzyfmV?=
 =?us-ascii?Q?4fRMv9Yd2xJDL9fsrMs4RIQFzzAZHm7zFWqGHbZc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c893cd5-9aff-48a7-c863-08dcc5eb650a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:23:18.4477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QjpGNizK33J3jonn09cCd9PAYDQcNJIe3vfr1ixFfvt2D4yXGcIQuk3QWoVvZIunumk/6ODjLyRolPYp2Jstw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10145

Convert binding doc ads7846.txt to yaml format.
Additional change:
- add ref to touchscreen.yaml and spi-peripheral-props.yaml.
- use common node name touchscreen.
- sort ti properties alphabetically.
- sort common properties alphabetically.
- sort compatible string alphabetically.
- remove vcc-supply from required list.
- deprecated ti,x-min, ti,y-min

Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v5 to v6:
- Fix ti,y,min at commit message
- Add maxItems for gpios
- Add rob's review tag

Change from v4 to v5
- Add Reviewed-by: Marek Vasut <marex@denx.de>
- Start sentence with uppercase letter

Change from v3 to v4
- new line for all descrptions
- add . after sentense.

Change from v2 to v3
- Remove u16(u32) in descriptions
- deprecated ti,x-min and ti, y-min

Change from v1 to v2
- sort properties, by 3 group:
  1. General (compatible, reg, interrupt)
  2. Common properties
  3. ti properties
- sort maintainers name alphabetically.
- uint16 have to be kept because default is uint32
- remove vcc-supply from required list
- remove unfinished sentence "all mandatory properties described in"
because it refer to /schemas/spi/spi-peripheral-props.yaml#
- fix make refcheckdoc error
---
 .../bindings/input/touchscreen/ads7846.txt    | 107 ----------
 .../input/touchscreen/ti,ads7843.yaml         | 184 ++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |   2 +-
 3 files changed, 185 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt b/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
deleted file mode 100644
index 399c87782935c..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-Device tree bindings for TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046
-SPI driven touch screen controllers.
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in
-
-	Documentation/devicetree/bindings/spi/spi-bus.txt
-
-must be specified.
-
-Additional required properties:
-
-	compatible		Must be one of the following, depending on the
-				model:
-					"ti,tsc2046"
-					"ti,ads7843"
-					"ti,ads7845"
-					"ti,ads7846"
-					"ti,ads7873"
-
-	interrupts		An interrupt node describing the IRQ line the chip's
-				!PENIRQ pin is connected to.
-	vcc-supply		A regulator node for the supply voltage.
-
-
-Optional properties:
-
-	ti,vref-delay-usecs		vref supply delay in usecs, 0 for
-					external vref (u16).
-	ti,vref-mv			The VREF voltage, in millivolts (u16).
-					Set to 0 to use internal references
-					(ADS7846).
-	ti,keep-vref-on			set to keep vref on for differential
-					measurements as well
-	ti,settle-delay-usec		Settling time of the analog signals;
-					a function of Vcc and the capacitance
-					on the X/Y drivers.  If set to non-zero,
-					two samples are taken with settle_delay
-					us apart, and the second one is used.
-					~150 uSec with 0.01uF caps (u16).
-	ti,penirq-recheck-delay-usecs	If set to non-zero, after samples are
-					taken this delay is applied and penirq
-					is rechecked, to help avoid false
-					events.  This value is affected by the
-					material used to build the touch layer
-					(u16).
-	ti,x-plate-ohms			Resistance of the X-plate,
-					in Ohms (u16).
-	ti,y-plate-ohms			Resistance of the Y-plate,
-					in Ohms (u16).
-	ti,x-min			Minimum value on the X axis (u16).
-	ti,y-min			Minimum value on the Y axis (u16).
-	ti,debounce-tol			Tolerance used for filtering (u16).
-	ti,debounce-rep			Additional consecutive good readings
-					required after the first two (u16).
-	ti,pendown-gpio-debounce	Platform specific debounce time for the
-					pendown-gpio (u32).
-	pendown-gpio			GPIO handle describing the pin the !PENIRQ
-					line is connected to.
-	ti,hsync-gpios			GPIO line to poll for hsync
-	wakeup-source			use any event on touchscreen as wakeup event.
-					(Legacy property support: "linux,wakeup")
-	touchscreen-size-x		General touchscreen binding, see [1].
-	touchscreen-size-y		General touchscreen binding, see [1].
-	touchscreen-max-pressure	General touchscreen binding, see [1].
-	touchscreen-min-pressure	General touchscreen binding, see [1].
-	touchscreen-average-samples	General touchscreen binding, see [1].
-	touchscreen-inverted-x		General touchscreen binding, see [1].
-	touchscreen-inverted-y		General touchscreen binding, see [1].
-	touchscreen-swapped-x-y		General touchscreen binding, see [1].
-
-[1] All general touchscreen properties are described in
-    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
-
-Deprecated properties:
-
-	ti,swap-xy			swap x and y axis
-	ti,x-max			Maximum value on the X axis (u16).
-	ti,y-max			Maximum value on the Y axis (u16).
-	ti,pressure-min			Minimum reported pressure value
-					(threshold) - u16.
-	ti,pressure-max			Maximum reported pressure value (u16).
-	ti,debounce-max			Max number of additional readings per
-					sample (u16).
-
-Example for a TSC2046 chip connected to an McSPI controller of an OMAP SoC::
-
-	spi_controller {
-		tsc2046@0 {
-			reg = <0>;	/* CS0 */
-			compatible = "ti,tsc2046";
-			interrupt-parent = <&gpio1>;
-			interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
-			spi-max-frequency = <1000000>;
-			pendown-gpio = <&gpio1 8 0>;
-			vcc-supply = <&reg_vcc3>;
-
-			ti,x-min = /bits/ 16 <0>;
-			ti,x-max = /bits/ 16 <8000>;
-			ti,y-min = /bits/ 16 <0>;
-			ti,y-max = /bits/ 16 <4800>;
-			ti,x-plate-ohms = /bits/ 16 <40>;
-			ti,pressure-max = /bits/ 16 <255>;
-
-			wakeup-source;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
new file mode 100644
index 0000000000000..34c95ec9da025
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI's SPI driven touch screen controllers
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+  - Marek Vasut <marex@denx.de>
+
+description:
+  TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046 SPI driven touch screen
+  controllers.
+
+properties:
+  compatible:
+    enum:
+      - ti,ads7843
+      - ti,ads7845
+      - ti,ads7846
+      - ti,ads7873
+      - ti,tsc2046
+
+  interrupts:
+    maxItems: 1
+
+  pendown-gpio:
+    maxItems: 1
+    description:
+      GPIO handle describing the pin the !PENIRQ line is connected to.
+
+  vcc-supply:
+    description:
+      A regulator node for the supply voltage.
+
+  wakeup-source: true
+
+  ti,debounce-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Max number of additional readings per sample.
+
+  ti,debounce-rep:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Additional consecutive good readings required after the first two.
+
+  ti,debounce-tol:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Tolerance used for filtering.
+
+  ti,hsync-gpios:
+    maxItems: 1
+    description:
+      GPIO line to poll for hsync.
+
+  ti,keep-vref-on:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set to keep Vref on for differential measurements as well.
+
+  ti,pendown-gpio-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Platform specific debounce time for the pendown-gpio.
+
+  ti,penirq-recheck-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      If set to non-zero, after samples are taken this delay is applied and
+      penirq is rechecked, to help avoid false events.  This value is
+      affected by the material used to build the touch layer.
+
+  ti,pressure-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Maximum reported pressure value.
+
+  ti,pressure-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Minimum reported pressure value (threshold).
+
+  ti,settle-delay-usec:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Settling time of the analog signals; a function of Vcc and the
+      capacitance on the X/Y drivers.  If set to non-zero, two samples are
+      taken with settle_delay us apart, and the second one is used. ~150
+      uSec with 0.01uF caps.
+
+  ti,swap-xy:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Swap x and y axis.
+
+  ti,vref-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Vref supply delay in usecs, 0 for external Vref.
+
+  ti,vref-mv:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      The VREF voltage, in millivolts.
+      Set to 0 to use internal references (ADS7846).
+
+  ti,x-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Resistance of the X-plate, in Ohms.
+
+  ti,x-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Maximum value on the X axis.
+
+  ti,x-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Minimum value on the X axis.
+
+  ti,y-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Resistance of the Y-plate, in Ohms.
+
+  ti,y-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Maximum value on the Y axis.
+
+  ti,y-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Minimum value on the Y axis.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi{
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+           compatible = "ti,tsc2046";
+           reg = <0>;	/* CS0 */
+           interrupt-parent = <&gpio1>;
+           interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
+           pendown-gpio = <&gpio1 8 0>;
+           spi-max-frequency = <1000000>;
+           vcc-supply = <&reg_vcc3>;
+           wakeup-source;
+
+           ti,pressure-max = /bits/ 16 <255>;
+           ti,x-max = /bits/ 16 <8000>;
+           ti,x-min = /bits/ 16 <0>;
+           ti,x-plate-ohms = /bits/ 16 <40>;
+           ti,y-max = /bits/ 16 <4800>;
+           ti,y-min = /bits/ 16 <0>;
+       };
+    };
+
diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
index a6c8978964aa1..9a4f8310eb67d 100644
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@ -25,7 +25,7 @@ List of legacy properties and respective binding document
 2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
 3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 				Documentation/devicetree/bindings/mfd/tc3589x.txt
-				Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
+				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
 5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
 6. "nvidia,wakeup-source"	Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
-- 
2.34.1


