Return-Path: <linux-input+bounces-3506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EFE8BD577
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84186B22002
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 19:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ED815A4B4;
	Mon,  6 May 2024 19:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="rrc2KZDn"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02olkn2031.outbound.protection.outlook.com [40.92.49.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D4A15A48D
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.49.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715023964; cv=fail; b=c5+8g51idbp9P68cuZ9eieRDtPzyh5gH9qzs2FeXoWnmxZVsDLuJZRoZWvzIBo1FeDAbUtmf7exqgKVPXTj+FFGzmZn/LzdMJofrRuWBOi/5O1vW8g0C08Eoq2++303hQh3uBpTBFELtoEYrrdgiFhIlKhMhlM5g8nykGA3erEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715023964; c=relaxed/simple;
	bh=205P8nN4anKW6C5YhcOphmGmwVjlqlw27LFkvrBbNHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mgVN5jWT+iiSM85d5adXNQQObWJFz8dcUTIZ85ML0g5x4xAc+o8Y6z4pzEsJwPMoFfTrremonaYDwkuvL7Uh7rZHGCDbiilKLIfymz3BBuosoMx5ZZHNRbOahs1dZICDlE0UREufN+LHW9NkU0snWWxaTIPfHHdzAGQzTZiP2Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=rrc2KZDn; arc=fail smtp.client-ip=40.92.49.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3ZAAIM4Y2fuuoKvaN2GENvJSrKFcwzLZXIG2+pV9gRkJjct2e2Lx4qHT4JfhLipV/hXQRxgCMcShjY5DgyJJTfRUT8fe936QQRzldDEqelp5DsdkK7UXZG4/MGzDdoHHM0LiuhqIAz1VewnQ3+VqZR82VTi/Ru7AQhTEKSQ9UDFQffYA2qdsv+1BQkfUs3HH/GqGxNGsjPT4O9ii6gxvk33zTfVASkFl5Cjr5qEkPR/51pFU6Gh74LdWuIZzkb5nuc667uvXYy+HbBFQV7hNE5Eczj9V+wdiEhiLUNOo7L3RkbiWR5wkNRp9ja53/PKVGOXbNDw8BJHWXowIKTVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=205P8nN4anKW6C5YhcOphmGmwVjlqlw27LFkvrBbNHc=;
 b=MlWLzqRiAZiaCBQWrFqjYceyhglwxpYzJEwAKYZWPkoLrbg1b3QmRWtgwEkPkSKsgnK6t2y0yI1qulyniwEPCSXqK/hZou/r2BHi23wE4aiXaSbTxwj0ZaFXUxtDAHO+p0pkpYMkD7/JjKxf2b7eZh+fr7zbO49fhos07fGFrihqJjv3K+Hlif2KtXOPYe7J65JUJ7vnvb5FGCHmDcA30JVzx/wIFpWugSgJwezFnrri1533Ge4LimdUhaW+j/5xQOCPGTJMWN1PpAPSbWmVlM37qucBddFGTjdJymRxehC9S5aAWR81mgzJGlyZhXXhRi1BR18UJlItljf0ILCwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=205P8nN4anKW6C5YhcOphmGmwVjlqlw27LFkvrBbNHc=;
 b=rrc2KZDnp2JaaDlH+2kr7U/O5KeO361Q27ENGXPqOzOSKZTfpBlF0E01paMG+1Da+fAkIG0Pg9jVkV2UlXZZcF90ptAYPVyNnetOFo1x53F36jL7SpkFCGbOEBwjKqMhpROHzXNLUHCPEIjyNybWzZjyKmw8uWNG2cKYm4LPZuVpM39Cq7hvFTfq2FfWejylS2JFEEyELX1zUg/zE2t0qSfOw01euSrIfR30MjPchhCUuj+R0y2EcvZmqaJ1EnAea4+A4OzN+aaAg1ANg9QQbFf+sTVVS+r4O77NWT4n62ZKwSzUxJujcogaaO9HYySv/uquGLt057lhaVv92kcqVA==
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::18)
 by PA4P189MB1213.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 19:32:38 +0000
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87]) by PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 19:32:38 +0000
From: Milas Robin <milas.robin@live.fr>
To: crange76@gmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	milas.robin@live.fr
Subject: gamecube adapter driver
Date: Mon,  6 May 2024 21:32:20 +0200
Message-ID:
 <PA4P189MB146957B28CBD2F35D6479C47FA1C2@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <4864668.OV4Wx5bFTl@mythra>
References: <4864668.OV4Wx5bFTl@mythra>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [KhckOF486ZMfyihrfhvnx5qmklFYmghbjohiNgw38updAqlT5j36gae0drohLuDY]
X-ClientProxiedBy: PR3P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::31) To PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:ba::18)
X-Microsoft-Original-Message-ID: <20240506193220.35467-1-milas.robin@live.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P189MB1469:EE_|PA4P189MB1213:EE_
X-MS-Office365-Filtering-Correlation-Id: e51c5dd6-bafc-4fb6-904a-08dc6e0349ab
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info:
	hWTq1rZhL4HIchf9Iz2ORmOqceA15DrNFDfhEkNRwAcQv7jsOeN8Lsxdgb289rdmxpTSJe98gUdNslhY+j3ql3ojSGljHBuDz6ZHRXftsqUMbOeSJtKZtfoC7g4VedcuN48TVsLOrQjetojBmz+Q4Ivi+ulBCWpKB6Df0TnCAH3YbFyDHcC8r9om7J8bE5hUop+553A1tgJ2mo53ripJ8F2oCB+uKDY3Oc+21WtTfQtUbVmqWwckB3xeTWzyr4c810lyNtBP2Db6uz7B/0t1/+v2yMYks1VdoVud83SMREiYKyWj/3egoYf6RrNxD+BGOIInj0YSxaSmlP4Z/mRqYTZenZR57DMun12gDjvVUsYD8WURMm4fSINwP6pPDn7p/EojARlU4LcrexwBwURcSaY0GFbb1s9Nj9pHADw7xbcRLpslWx3q9/FP+tcoEZVNTef7kft5aftGTDPuIW1VW7S24wJ9OrIy+IigrrNh+Rx6sm+U1c4Vmvul9MYnNCUjspROpPjYLPi0CPKGNfzzHdQJEgLT//Hpm+JxlUjwC14wsbBXiq67mB4Yv9pq9niB7viEXvOyuxcI52kj9AX+cbElPr5OzL8Lg6no+cI54b18T1VoJO68fE5hiA/BRTffG2A4B6Subn2N4z7bxUI/t60SLTXd0+M2187/yDC0UaM0a5ptE3J6BdyZC90SnawQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hb9t9j1eM8n74dojQCON8zUpJM4YmtOESbiUTNIB+TcXCMKqkJ4VTA7Lrm0z?=
 =?us-ascii?Q?15wTowA5GXg2wEnaaJziGcVnaHrqr2Q4B4nJm4yZxprnAQaszPfRsqFWYbBb?=
 =?us-ascii?Q?zQJloeu48DF2qSQM6WSAJ2juK0INI0OBFhWQUe60Q9W7WAMNOS4DYQJID8Bk?=
 =?us-ascii?Q?e0JjuA/V5sZnJdddfYVR2Xfjwe98J+C80IyxFv+YGzjyNF1IRRB/qeXsoL6Q?=
 =?us-ascii?Q?TGoNkgdBut4YUS1NBz4WehmLWnIzCqMEZaPRVEGaH+TWOYtX5XRPaq7VW3wq?=
 =?us-ascii?Q?ptlydabukAzCbQD+f6Z1JYeZzdGUQZ4z9ofsWGAeoBrJ8eoGytDwIp4hyFSf?=
 =?us-ascii?Q?kRy+MV5EmEB0RmQhs44Tcmsj/7ByO8lc5Q5s+PXVB8Lm4Ggj5NeYT+dWohYf?=
 =?us-ascii?Q?sK1aHLgqC28x/KSJo8Bwl9VMfgMJjUo6cGTj5r9DN5QW9ClJljf15vc2ZRft?=
 =?us-ascii?Q?Y6aErHvBKNkOliMDfxNCZto8BKNunLnHxOOVRkYbos+WMOn2TTGmo2of+6gn?=
 =?us-ascii?Q?U1vkWUvkmZo9SLUG3Xlc8CFFfQpG7OydYSN3zkm37ik6ipllojNbuJYQwicF?=
 =?us-ascii?Q?ELZzB1myVTTTyLVp3PJ0KLKOrRig5syRrMcLafmNyGWuONbW9CttORaSyVcD?=
 =?us-ascii?Q?JkbxCPlxaP3Vbslimw0LiCz1UzR6o3JhcgyFk4mYcGRQfg+xsCSOTRxlqBMG?=
 =?us-ascii?Q?GUrDd9VG4+QXkBp4911cHlEyF1VQ5opZimeLxrMvk7QNRmKhxPqVwQ+vVrQw?=
 =?us-ascii?Q?tmfBzy9mQZxsxgp+csUXI+jf0MRhZovl5sTaVROQYMQOTmsCoZziYHmbmjcW?=
 =?us-ascii?Q?/X8dVnsjQIpqBP3qqCqXyoa+1Md/7IsMo0uwbHEqFTo9KauG/HpjBq5gVYiw?=
 =?us-ascii?Q?IfnqZUDHlDNcaCD6iIyt86vpKTi1/wVf5N6Dgmqj6+SXdEIK1s4HEohe3VZw?=
 =?us-ascii?Q?I4iUFBshIKP8UJcA97lpxeOv0lnepQTs40H82C7eeeAb0FJ6bq0HqO34k1di?=
 =?us-ascii?Q?mIkjuwHb2vHhVrcDER+QiPnmRjgEK9aqLc2zTSVoJ08zZgumw8jIxnG3LPEv?=
 =?us-ascii?Q?G1ex1ssbtw248C9YJd3olFeZK5d7oHZwR6Juwr2nSW+GRs+COBJMsrHKQ+JW?=
 =?us-ascii?Q?nUIzXUDdaCVyxjWzFg41pyqcWbpieJaqk5U7fyqlqrJATyccVy3xJ34/37NP?=
 =?us-ascii?Q?r17SCSweKp670cgGJiZFy8ufxx+1vfnQWfqL7537hFMQPcKuCwZQn1MQEB/F?=
 =?us-ascii?Q?RE4zHy5MQot1W9m/zSha+ksELTpfljKXVn2Z+muKNmxlzEmsi8mu2GckSfNR?=
 =?us-ascii?Q?j4E=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e51c5dd6-bafc-4fb6-904a-08dc6e0349ab
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 19:32:38.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1213

Hi,

I don't think so, I didn't received any reply so I guess it is not ?
If you have some time to review the code I would be grateful.
As I said in the cover letter (which didn't linked correctly), this is
my first kernel module so there might be some basic architecture notably
on race conditions.

Also due to the way I've implemented it, if it is build as a module
it lose priority over the usb-hid generic driver as the device report
supporting hid it.

One other thing which might make the code heavier to read is properly detecting
if the controller really support rumbles, I actually ignore the bit signalling
it cause I don't know if the adapter could change it without unplugging the
controller which might lead to have to recreate the device to switch it's
rumbling capability

The patch seems to have no conflict with the current input/next branch.
If you need a branch I've uploaded it on https://github.com/Hinara/linux.git
The branch is called ngc.

