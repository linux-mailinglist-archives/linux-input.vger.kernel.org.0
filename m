Return-Path: <linux-input+bounces-14491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88123B4442C
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 19:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A3AC16E401
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 17:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF9D30E0FB;
	Thu,  4 Sep 2025 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mo9FLJWp"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B682C1A2;
	Thu,  4 Sep 2025 17:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757006166; cv=fail; b=B6qVrJERDU7QUdOLAnUgL7RCyNFPIWs/8HJcI1rYPubvDIXgAU5UoCY4YAA85xiixIzig6qr2W+RdWlYzSnkPxzwYpx1qmoFrd09TF00XzujU5c8V97WYLRgEJMVJtrt4mBt3UWxuCFxNnwI2xUDWXu9t551tQKJRIlAf3vfMVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757006166; c=relaxed/simple;
	bh=Svx703Ww5dERgSoCb25wrICQdd8Sf6n42+SJItGU8Rk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oRORaza23CV9lI7N/Y8oiFIezAfWFOUT+4IPl//zJ6lapu7ynz8xE3DXYSZtYda2tdcQI0ZZsYWUCERcpihmWk4GYipmfWmrp88jw7o0zU+My6xtRtmuJM18eWnPjLxFJlDv6SCIcfjQBWdU0HnGCPvHMaw+aE4eduoCZ99b8cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mo9FLJWp; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOzfpQugOEl4/bjhjdRQHvcylMmXwKQSby9SrGdGpFrsNI7NIIkU6nL6DKc9LlVDficR+Qnm7b40YUcqr70oCcwv0i9vZC79M92znknRdse9QPOZqa8lYRoIjMyfwtt04U90HEpyy86QJwVbvkpMmh+byO+DaoeHsbAn5rUDskPnovT+CxYu5DEPSoOj9/lVzpxKp9OUm9bwkq05NznrWu+zP5vxV/FRiBzvKSC5ht7mKJySI2XNp0ewyLcaTU7Mdp/W7deX626rbFAuOYe53bYPHRFNY40ZzMALVAOHyRGQtwAxQxioNegi0WjunS2Il9fadzA9iyzPOljw5WQxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKF741Fzo+bqI80C4IhJ14QPzQyIkx51jb2lJxqNHiA=;
 b=lBfTAxcz5hV3QzRM/8iudOFM7Mg6axFTmo56dJDu0bBwVWJoHKpL9QhG5J+KuS1o2wYWllIxOaYtWjGP1hrg99ZTYxAHLuui4Waru6sXU+N1E/JMY6Pksis2qUWmyBArhmVraacqt/YWCRiVoFHSvX4gKO9YvSzwA+WtT2XcvdMgw/V3pATVR1BrpV7PynEU00Y826/VA5K9V5K/NfBm6Ya1ciKCoUC7djByDJ0XKAE4s/hkWF26OVyJ82nvcF9dX+yddyG/NGBDOaDtrq92dV3wK1oppJvO6WnaFZi8nmvf/OsASoVnX9g5pAi2Hq+45FWFzzns+ihnfMM3n+XxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKF741Fzo+bqI80C4IhJ14QPzQyIkx51jb2lJxqNHiA=;
 b=mo9FLJWptntUXhVFbvLcNXsSRJkV3+E+DO5J97TuZnU1aXt/2ksCmXQ/ZaHP6AXKk11hCe48g99BjTum4+MwZ8prjsi6xZPBQmxl3Srrbj3fcNGqggeUo650PnzJ3LnfdsD4RcbQ8KrmHDIqqUb4BE4PDS9Sl+3PlP3MhOxQv5Rrzy3AadYV2JJPz6Fx4z7xHTsIgup/3n4WR+5OWg57soMM2JMgcM65GcmBeJluggbOKDByrCcVyE9kZBXiZosNXgzpOfadSelnabcmgy8W3gXis0ENJXvd2PZEQVV4zv1emPaUf7NKJOqpHN+hnwZxM2ru/hAn2VDBGgCjVUZ7UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by MRWPR04MB11492.eurprd04.prod.outlook.com (2603:10a6:501:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 17:16:00 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 17:16:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: input: exc3000: move eeti,egalax_ts from egalax-ts.txt to eeti,exc3000.yaml
Date: Thu,  4 Sep 2025 13:15:41 -0400
Message-Id: <20250904171543.517650-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|MRWPR04MB11492:EE_
X-MS-Office365-Filtering-Correlation-Id: 1916285a-47eb-4417-6fc6-08ddebd6b779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|38350700014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eYTADqF4C1NOidYT8oFvqhjnZhfaiFlrK0e8MQx/EEK6WfpUJBL6yZ0rKyjX?=
 =?us-ascii?Q?3Uyp8QkHR65e7XLY38Nrnc4mPXIeSdXui2U1VdYDXMa8AhT8aRwcVEWIjMpd?=
 =?us-ascii?Q?z94vuM/C+sno8gHB4ZGdyX2/9grpB/fIOP65+nYGKw9lcWT+JdXe2pdTTM8q?=
 =?us-ascii?Q?QEgqdTxM8pg3FInKUL1biw9V5nh8oVT8Bp7LInRTcwMWjS0qkzHMbjaeT889?=
 =?us-ascii?Q?X9qnYyoyI39sdwbd0CZNJ3IfiVUDpo8q0bBmHV5O9SAtDDPcD5EsBJHI41o1?=
 =?us-ascii?Q?9uZnyTxAO3LKohQDdG8/0fMtPY0UzaPyxVR7IaCcD/lvmcH11fngJVk/svMx?=
 =?us-ascii?Q?6QVr+eqXQfdHeMx9JXRrkE0o9m4MQvdO3mrwaT6KAAhHtXztJDlV2Tj64g5m?=
 =?us-ascii?Q?eivcl0ahhzuw/T/vfo9nGUAd7F9wo+CqGo3xuqFD4mGwAyLaFnNo3FLWX8uk?=
 =?us-ascii?Q?HzT7agkxuUXOnCqNM/PnIAk5UlGP8eM8OuNYpCug2Y2iuc9y7ydwFkenTxh4?=
 =?us-ascii?Q?YNd+V5PG/hH+2VChF2aHvPITlNcQBGF7rvPI7g2IwcpyXzFVMZN1uLCKg47b?=
 =?us-ascii?Q?WMfCUkZu41w2N22ZRPmBOf+kwLG1kzpr41fWg+DkEhPwzvvLgdqGQFw5vXDs?=
 =?us-ascii?Q?hwuatQMnDv4rxUtPeYSwifqhGu3RW1gnF+0m4TpA/hgh8e/f97F5im2FMoru?=
 =?us-ascii?Q?RbfPQi8384C7AUVaSKbSSALcZTlnHMhgUa8Dcuzfkx+KdQLoyX1mAvhhfTMK?=
 =?us-ascii?Q?JQki6i4GQApn5Ffa/uj61dJ3vu/UaEzPJuuUZ0MIxr/rqjLrv4Ap7q8Ubyaf?=
 =?us-ascii?Q?ALBA47Xze0P1nFGb7eI508YKEIM14+CBC9gEC/ULThUK/KqhU2wjDLnJUcBE?=
 =?us-ascii?Q?3tVAMGi8BYwafLmHmH+lQbnXZzP+Y/ixbAawRrljAM8qwrVn108nPEpK3ZMc?=
 =?us-ascii?Q?mG/qHAMZtUJhrvIKBCaDIWPr1imswgqrDVGfoQoRVuUjJGYXCaKSJJbd1N7p?=
 =?us-ascii?Q?qErRikRD33kl7E6qX6saq4Uh+IV+Qdhyp4JD0s8BUAWFNfM9bZAzNsJakPoi?=
 =?us-ascii?Q?+eNdhTxmrQbhNKDYA9VdfUvrySWPXADmunab18ZkJj9UXHRkuycMKWjrUhNU?=
 =?us-ascii?Q?PaIdeWsQK23HhkfaAVzeb+KelfK63q9MDnomh+07wdcK4H3lIsnkL4r1ULPp?=
 =?us-ascii?Q?FRuLORC85JB3aw9jmG1khoWwU+j0TcKJX3HE7PVq9qBvFBdlC05wtImEc88A?=
 =?us-ascii?Q?93Is9nDFpiKxNoO/5M591z+iDahbut735sCtnlSGPaQL41PNSF8uHU02kg7x?=
 =?us-ascii?Q?u5Iwn3mJyhuUG5keQlyhS3j5a7YQsYQ7tUAKt+G2POFgIeTw8iPx3DMOFvqw?=
 =?us-ascii?Q?8Fr2Bt9eikHJl2xngEkEZA4Ygrxw9A2xwuVrNeKxqdoIz0qI8Vp6hhWiku34?=
 =?us-ascii?Q?zFuLKlMKxrZNi0DEa+IgXueAUriIMqemv9zNOiptmcbYghIAJ3ACRxqfQ8yC?=
 =?us-ascii?Q?DA+B6biBeIOVxKA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MfsNHYYCPLjqALJcWMoXGdhu1/u1OL47HTpscHyOYxYRYOfb9VfgBK7YZ3on?=
 =?us-ascii?Q?6j5+s7ZfyEHdy1lxkmWcuoqz78G4U1ZOds7rIQwFARN8P6D+4oJ1lmFyhhuv?=
 =?us-ascii?Q?iNIc2FyMmBX0TzhS9XmUcb/pwzQ6XF3vU2UAdaxoDc+S6lv7ugPDQh2lXSW4?=
 =?us-ascii?Q?pv3sZ5uwfMVHrv7azjW4DCzhQuj1GtwagcQz4Fqo9KzAPBogToqy0vvQQXy+?=
 =?us-ascii?Q?PWsJHDZZCTandrf2mWU0iftZShXe4NcEDYC6JKYZPwjQvrAzNNH6GZW998fV?=
 =?us-ascii?Q?npgv8WJdBMVv0jg7UWVmAzhIOTnYmPSaYGWee19/4J0EVBYHCtlmjmPHqu35?=
 =?us-ascii?Q?uo33jqBZFiJgp2cRL/X+QSzE8ZO+XxgXEh73y2OTMH101YDcDpAAwHzT6j14?=
 =?us-ascii?Q?b/iIv0rQEtxr2WNMKiUvj4X7RudYSahVRZ+2Uq9/DBHnjRaAjlMvmL1QCvta?=
 =?us-ascii?Q?8yKGzUeUer2jsk47s6CcaKHghfPGnxZPKS1P61bvnY+CIRWJIuEvEY9N/dJb?=
 =?us-ascii?Q?G8p60qc1zhyIskvGH9uVp3U0Np/e7JHCHm26tUceIpiIAS53YYwqJmR4KTgl?=
 =?us-ascii?Q?uBY6Eo9i31A8U0KXuZBy8YAs/QzDd3Ae8IVPIFN4F+3usB3FEmedoBCDILqS?=
 =?us-ascii?Q?GCzM8sogIu5QvUXTpG31wZo1cmy2cXQYCs3ZfLxvVVCDjUxTsYSEdDrdZVRf?=
 =?us-ascii?Q?pedCPp4hv0O9reLdZSftkSGs4gvp5+gOrlyQzodqaxiDmjtMBpW4OrHbQluD?=
 =?us-ascii?Q?eRxbhMvp6gi9Jz9UylMjsYov9AnTlDfC5SzuRrwHHwuGewuwtFDtbS6zuL6W?=
 =?us-ascii?Q?AlQHDljPcdxwnnn+Bl0pFGnFcVRt/j0u1vpLpkWd5G1CTt9dWiFlC6A7clfX?=
 =?us-ascii?Q?n7ZL2Spk7ufYDoXaI6Ap6sdNYNBvGhZgLTsvBPUSClGECmPYpsdJmtNocBV+?=
 =?us-ascii?Q?Pek/e2q+HShX+ZzzECL0CPnS2DllmRb+PBlqmQ08OxLbxBIkN4nWXEjjYtR9?=
 =?us-ascii?Q?rsdDTgt24nDDuLD7VD2f1uaqsImVFsLRPVsKYcRMXagjb+keRJOR61rSha3J?=
 =?us-ascii?Q?sKqVVcCZua095pDbkPUmwjIcCqsnCd/pTUVET2wMtZOJy83amkI0q2DFO+2i?=
 =?us-ascii?Q?8NbNjXbwqlYgMykeCDvNjUOtGpkT31Z41A+f2TnF7EJ3m2T1KN0SjP6AMa/+?=
 =?us-ascii?Q?mU33w71wtfW6FbPKG6t7ljhjFAGeRbol7ETx7cLYw3qcTlYqbdB4GS3jSgS4?=
 =?us-ascii?Q?1iowx8QlA3Id1YMSuxueuvhq2eXUZJ9A98BdF8/VUWT5PpPlPF4BfcjObOXF?=
 =?us-ascii?Q?f5P2jfRH1/LInZWtStvhCv0xFsya6nEWg/crKVUrAvUujU6Etw0w/oMuOp/+?=
 =?us-ascii?Q?Zem7Anszj8QynQARTJ0S1KYHRvzOwjEft7I088zukLyNlZjw2A+gFcKZNa4Q?=
 =?us-ascii?Q?0rw33T5uP20osZeRxehRTffXNrM/uFgHu+1MjlqZafTPq230DypCjrc81GTI?=
 =?us-ascii?Q?6bRbCZuJgHAhqNUmXOg6ekCY8fDWhGIomBqnIzXpc8gx77ixjN9d7G0V3LqX?=
 =?us-ascii?Q?2sGU08Tas2n7NPVfl62lNOhLprgBjLgLSv7fhrK7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1916285a-47eb-4417-6fc6-08ddebd6b779
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:15:59.9843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D387jblXrIBlEonat2wrNrPyk93lX1913beKc6npFDIZRks/9w8myU3r8CAqXVap8jl7VDtRFFeMB9iPjqCQOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11492

Remove legacy binding egalax-ts.txt file. And add compatible string
eeti,egalax_ts and wakeup-gpios to eeti,exc3000.yaml. "eeti,egalax_ts" is
general compatible string, which is not preferred. But it is compatible
with old devices (older than 10 years) and existing driver in
drivers/input/touchscreen/egalax_ts.c.

Allow address 0x4 for eeti,egalax_ts.

Don't require touchscreen-size-x(y) for eeti,egalax_ts.

Keep the same restriction for existing compatible string.

Fix below DTB_CHECKS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- sorry missed one local change at v1
- allow address 0x4 for eeti,egalax_ts.
- move out touchscreen-size-x(y) from required.
---
 .../input/touchscreen/eeti,exc3000.yaml       | 30 +++++++++++++++----
 .../bindings/input/touchscreen/egalax-ts.txt  | 18 -----------
 2 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 1c7ae05a8c15e..d19b07d4cfd4a 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -9,25 +9,25 @@ title: EETI EXC3000 series touchscreen controller
 maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>
 
-allOf:
-  - $ref: touchscreen.yaml#
-
 properties:
   compatible:
     oneOf:
       - const: eeti,exc3000
       - const: eeti,exc80h60
       - const: eeti,exc80h84
+      - const: eeti,egalax_ts # Do NOT use for new binding
       - items:
           - enum:
               - eeti,exc81w32
           - const: eeti,exc80h84
   reg:
-    const: 0x2a
+    enum: [0x4, 0x2a]
   interrupts:
     maxItems: 1
   reset-gpios:
     maxItems: 1
+  wakeup-gpios:
+    maxItems: 1
   vdd-supply:
     description: Power supply regulator for the chip
   touchscreen-size-x: true
@@ -40,11 +40,29 @@ required:
   - compatible
   - reg
   - interrupts
-  - touchscreen-size-x
-  - touchscreen-size-y
 
 additionalProperties: false
 
+allOf:
+  - $ref: touchscreen.yaml#
+
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: eeti,egalax_ts
+    then:
+      properties:
+        reg:
+          const: 0x2a
+
+        wakeup-gpios: false
+
+      required:
+        - touchscreen-size-x
+        - touchscreen-size-y
+
 examples:
   - |
     #include "dt-bindings/interrupt-controller/irq.h"
diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
deleted file mode 100644
index ebbe938105745..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* EETI eGalax Multiple Touch Controller
-
-Required properties:
-- compatible: must be "eeti,egalax_ts"
-- reg: i2c slave address
-- interrupts: touch controller interrupt
-- wakeup-gpios: the gpio pin to be used for waking up the controller
-  and also used as irq pin
-
-Example:
-
-	touchscreen@4 {
-		compatible = "eeti,egalax_ts";
-		reg = <0x04>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-		wakeup-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
-	};
-- 
2.34.1


