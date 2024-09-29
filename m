Return-Path: <linux-input+bounces-6855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17769989349
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 08:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A10371F23807
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 06:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7A129CE6;
	Sun, 29 Sep 2024 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="N7J/+3UA"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2043.outbound.protection.outlook.com [40.92.42.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4B47F53;
	Sun, 29 Sep 2024 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727591780; cv=fail; b=Mtwxed3b1T5x26ICjo2tNcRY6SN9Xdt9oK8j8oAng83lMt6cBwnNtW+Ib/W1n4zIV4Y6h7KyQS54sph7ScI4yGKYN6ZlXfS2YTTvR7HeJtw/Xvrr2qv8nuC/4CCmu/M9dLjrBzOL64Y0FpYPOy+W5pD44/mC9V1rIewevyqgsu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727591780; c=relaxed/simple;
	bh=ZLO7M8/x2MyF13wg0y2CcTIE85lcjAm9RgYMYPfqfbc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hN9OLyKk8xd/Z+ei1npCAA9FfOHCaRNEGOnufKppgKRcsYdnGVegRK/5BLot4QmOucnp/RwbDhZYlCytI0iQ2KKW0Dy9QQSRSCnyQb1m9+datsPOYaC8uKagir70d6+OjW+wOePiojBHm26l2upZ6rqlQu13kL2MyIIXzQnLJ0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=N7J/+3UA; arc=fail smtp.client-ip=40.92.42.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vplAXi+wIt/7zVpZSzY0a4VTmRu8o2DsI47xuu505Z4M6K+Mep83a3bBe8nUfGp+ngsvCIpRzpqoZ7RaLg0uG+pbrW3gt+5x5xxPyt9wklobtAfYbf3CM9D7LBYrJ9+pQLoyvuIyprKLzhuTZiceeiX9W6uhSjZet2qKuBnN3JtVa0ndJqeyGt4rVMdAGgoE/1X4q7kIAinFbOfXOKbHypFo52DMOBiHCLDTlpXx7ns/1Pqdl1zlkKqYJ0mVEg+gbxJigBBHsXyQtKkMlaUtAfcY9wY5h0n1PTKfCRy0a42gnhd7b9cImLiHePBi8shLZmG3QxNoYFZuO2Jw1I0HXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgPzf7FC0uqUUByQ4rZGax5JDASYjlJTa6qzd983ADE=;
 b=Kc7aiDyLwSn2Ss9aXWlh8NtdNCA/GAs8UhQK5eUwZFuQU/fYC2mWnqplTOw9VRmqKgdkzfBEm8C1lEWo3KGtsgw1XJMEeDK0D9UqjI1jfQdC3szBHsVsQCoUeboriJjGF596GU0okfXd0g8TYaUAdRNWEJS7ieGGs4bgZ894nmPawDjlJa5asyT+JaieozGQpwv0v6r7vQkCWWnOlVhxI0MSSK95n40abZTQZR7wKIW7SnyfAjTLYjSIfOyz/1wgh+8+2pKB8OpWSqu8i/lIzd6fP8b3Q9sW7ocHeZYqeBg8R9yeJVNMVKQa3nvo0JIPNx/b2cS0fSrbRzpIvo9OHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgPzf7FC0uqUUByQ4rZGax5JDASYjlJTa6qzd983ADE=;
 b=N7J/+3UAK1BosvL6BAVvljCMHm1TEI5+iYEvgN5ZZrkNT1jd3NZ2f9nzXUcVbuETtttsJxUebcm0BMC3WmAFuE/JrTtqj6qRNSOgQKId7XHqkjGT7I8Fkdl2rHWlW3l4+g87iiuevgp57wKsqlU86UCVQ0zEyrOVW6szqzt9nOM5cz7QpHSCG/kNq/7IrCZrsgctGFF1DJZEkv2EGBz/3rvlK0HxypJhrPi4Ov/n0Q5a3HJJcEnFW8DbKP3D9eXNS66djWOv0TOgsVa3Rmygiv96SNCBfXwQmZST7J1BatP19DyYyp6j5np4mJvhSeauwz5Rreqp7a4jcTVzb9OrOQ==
Received: from SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM (2603:10b6:a03:57a::15)
 by LV8P222MB0884.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Sun, 29 Sep
 2024 06:36:15 +0000
Received: from SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM
 ([fe80::a809:fa8e:9f43:1f78]) by SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM
 ([fe80::a809:fa8e:9f43:1f78%4]) with mapi id 15.20.7982.022; Sun, 29 Sep 2024
 06:36:15 +0000
From: Manuel Quintero F <sakunix@hotmail.com>
To: erick.archer@outlook.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Quintero F <sakunix@hotmail.com>
Subject: [PATCH 100/100] Input: joystick: a3d: fixed multiple coding style
Date: Sat, 28 Sep 2024 23:35:55 -0700
Message-ID:
 <SJ2P222MB10432CABF7A18C3A7F7ED9FCBC752@SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::7) To SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:a03:57a::15)
X-Microsoft-Original-Message-ID: <20240929063556.59941-1-sakunix@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2P222MB1043:EE_|LV8P222MB0884:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2aa24b-1ea7-4846-6af6-08dce0510423
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5062599005|19110799003|5072599009|8060799006|15080799006|7092599003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	0XXZon0UTDrZsXVwRhjf6jxsT8wNGK41yeaqTGlj3TZrZu1lZx+JbcWSrPYCz4YdZdLUBmifH6ZvymorOUXwd2i7l7Oo7/dzu6F5yQk5eBIXAdXrdks05HzpSjFgoYTOuzTyMgxNcd7uGE9lvHWW+O9DJbTApF6lqqre9oI6LiItD+dOdY/wUnEFz4rYMiM8fvae6xVNiGUb9tZuDUvDyS5Qt019awIqVLbQ3YHSXflqnjIc94lDwW2ftV6BfbeT7rImioO3cGBe3cL3FKQEcpVNGa/SE6/GL1cskVJ5gIRSAjtlSqa3+jFAwGI3AZav+f4sL8OdIC6AlYyUHHMmeZ6Rasnx/UlAAGMBhujzp2roWB7JTaHmJo7DUhG+p4ZjGZLronwxuhfo61s9q/8deF+kNRn2jDh1V1VZ72qaSNd3LcQ6oKvGU6eVLwR/sNSpHSrFHB5qiqwR88+ezau34yw0O2IwYYvxv71Y6XP4jjMlX6Vl+SOFCznChpMOzZ5rdEc84mD0KhXAfgUyAuMMtpHD2momp9oEQOw/GWD0QQQ7VQH5A2F/RrZNIsevp4l5+qaKp41YPcFBoY4K9NO+a+PvUQJMy8dqLdGbtfBLNCj1zst2rdrN96ubhG/yP89EdH5d/u8k6omQN/cNXkOjkuy3Au2XXLGQN/D65825RhiTtD6QmyBKUAw7fK/D68QWlblmU8hvxhGtaJwgLDouezUqXNiQ7XeV34vjb6cvrL2uUI+7zAYG5U1WuYqP5VfF5RF6PHwS8ALgXT2pFKI6odGzALkNcmjOSzG4RXihPpQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a8srm+ukP3ZpguthgYLVrUipfznHoTBZ/0YvUTKsfGPZjPGw8+irTFy99jK1?=
 =?us-ascii?Q?MWK9VFWwCEc1GKarHtNZv1c2VgcfTk5Ue4ixCUFL4WcuRHfgqFeFF70AiE/7?=
 =?us-ascii?Q?CPtxpjkV6H7me5oAOSKGMPELBpI3Z4GHuLfIjAydKw/5prz2a+VrOPRWZkdX?=
 =?us-ascii?Q?o+EIYE4a08Y7451V4um932K60YyHB9MmEN8SHBYUa2dFistKqw4ZYerBdbDU?=
 =?us-ascii?Q?wHS5IXkWLkkOBerHDdwrkQ6mQXlyeDCD/xyCiDJp6D6SqTNMqY6VF2XEHxoX?=
 =?us-ascii?Q?jub+dLsAslrBT2zBkDez7uxRvBkszWif/ZXPefGvLzvu093/sDdpKeclWY+y?=
 =?us-ascii?Q?jC+W+ggaCm0NjLYYrxLg4Q/5+Of3T4z8n7Sl6aG1OJuJzt7xFMkbajqPiTTB?=
 =?us-ascii?Q?E776FDrmhBwFEGrImg17lx6GeL4RPMqj39lAay+vxzzYVF7E+O3MxgGah7Vn?=
 =?us-ascii?Q?3i5n5mPJLFi+tTnkKCmcKXbvkpZbfgyZ9TsI+pvhQtRVOMoxqsAvcXBQNpNX?=
 =?us-ascii?Q?bEmzFtqLasIETanFkfPA9oh2FTirmGBYJSQDodq00zPib4sieUy7AgeeAd3e?=
 =?us-ascii?Q?vtjIj99cilp4q00nY+Km529hqHob9tntESJsD8uAJO4K+Kpj/AJqhmlt11Jh?=
 =?us-ascii?Q?jzKIb3X0QYVuifhTS63TM73AwTSQawuZb+U+h1Hf4cypgsLO5A2BB36OdSGZ?=
 =?us-ascii?Q?kkKrDRUFwBz0OMDh+vbG7U0Gf7n4gkM7tX3rv6xzkc5YgitnKqEi6HmLSrs9?=
 =?us-ascii?Q?JFqm8KOWZoRIdEs1xSr5gyp2MGOQJ3cWsCLoNCPEvprqKNl5TTSeU+k6JXu8?=
 =?us-ascii?Q?YkZN4PPa/BePAH5NBQC6JPCEwEcAYdbHOiBEMm17r4b0YerPYIyv0ijQ+f+E?=
 =?us-ascii?Q?09/PhaDUn52bk+nyLFDEWXdU1ZlbEPEqhZGGLWvi5EG/AYDJU2yCuuinuUEF?=
 =?us-ascii?Q?oDP6+saOfBiJ+tIQhv/ZfE+eUVe/cvWYs9kI8GA03BZKInKQCddIAR5QKeNj?=
 =?us-ascii?Q?9oGzsYUlupCGjmeQugvJV/tFyyUjBAzqZAUUDEESiVk7lf9cwjE/ybWDXN7q?=
 =?us-ascii?Q?kpfCA5x24Tli+SoMMFTK7vIx45G92G8emn2iw8SlQU+7KxEDpfaoQBjCo/Hr?=
 =?us-ascii?Q?Dt4WwTEi2spbnw48ISnuynDjb2Y9c0FXaY8WJMsV/cPior/BgtHTamFBuT8+?=
 =?us-ascii?Q?tRRp6gY24jVangJtBsYtHANY7cVZfoagLY2Q3rz6jPq+IoMn1LxOc5t3V4o?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3fbfd.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2aa24b-1ea7-4846-6af6-08dce0510423
X-MS-Exchange-CrossTenant-AuthSource: SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 06:36:15.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8P222MB0884

Fixed multiple coding styles issue

Signed-off-by: Manuel Quintero F <sakunix@hotmail.com>
---
 drivers/input/joystick/a3d.c | 91 +++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/drivers/input/joystick/a3d.c b/drivers/input/joystick/a3d.c
index 15182f16ed19..8923c58d2288 100644
--- a/drivers/input/joystick/a3d.c
+++ b/drivers/input/joystick/a3d.c
@@ -97,57 +97,57 @@ static void a3d_read(struct a3d *a3d, unsigned char *data)
 
 	switch (a3d->mode) {
 
-		case A3D_MODE_A3D:
-		case A3D_MODE_OEM:
-		case A3D_MODE_PAN:
+	case A3D_MODE_A3D:
+	case A3D_MODE_OEM:
+	case A3D_MODE_PAN:
 
-			input_report_rel(dev, REL_X, ((data[5] << 6) | (data[6] << 3) | data[ 7]) - ((data[5] & 4) << 7));
-			input_report_rel(dev, REL_Y, ((data[8] << 6) | (data[9] << 3) | data[10]) - ((data[8] & 4) << 7));
+		input_report_rel(dev, REL_X, ((data[5] << 6) | (data[6] << 3) | data[7]) - ((data[5] & 4) << 7));
+		input_report_rel(dev, REL_Y, ((data[8] << 6) | (data[9] << 3) | data[10]) - ((data[8] & 4) << 7));
 
-			input_report_key(dev, BTN_RIGHT,  data[2] & 1);
-			input_report_key(dev, BTN_LEFT,   data[3] & 2);
-			input_report_key(dev, BTN_MIDDLE, data[3] & 4);
+		input_report_key(dev, BTN_RIGHT,  data[2] & 1);
+		input_report_key(dev, BTN_LEFT,   data[3] & 2);
+		input_report_key(dev, BTN_MIDDLE, data[3] & 4);
 
-			input_sync(dev);
+		input_sync(dev);
 
-			a3d->axes[0] = ((signed char)((data[11] << 6) | (data[12] << 3) | (data[13]))) + 128;
-			a3d->axes[1] = ((signed char)((data[14] << 6) | (data[15] << 3) | (data[16]))) + 128;
-			a3d->axes[2] = ((signed char)((data[17] << 6) | (data[18] << 3) | (data[19]))) + 128;
-			a3d->axes[3] = ((signed char)((data[20] << 6) | (data[21] << 3) | (data[22]))) + 128;
+		a3d->axes[0] = ((signed char)((data[11] << 6) | (data[12] << 3) | (data[13]))) + 128;
+		a3d->axes[1] = ((signed char)((data[14] << 6) | (data[15] << 3) | (data[16]))) + 128;
+		a3d->axes[2] = ((signed char)((data[17] << 6) | (data[18] << 3) | (data[19]))) + 128;
+		a3d->axes[3] = ((signed char)((data[20] << 6) | (data[21] << 3) | (data[22]))) + 128;
 
-			a3d->buttons = ((data[3] << 3) | data[4]) & 0xf;
+		a3d->buttons = ((data[3] << 3) | data[4]) & 0xf;
 
-			break;
+		break;
 
-		case A3D_MODE_PXL:
+	case A3D_MODE_PXL:
 
-			input_report_rel(dev, REL_X, ((data[ 9] << 6) | (data[10] << 3) | data[11]) - ((data[ 9] & 4) << 7));
-			input_report_rel(dev, REL_Y, ((data[12] << 6) | (data[13] << 3) | data[14]) - ((data[12] & 4) << 7));
+		input_report_rel(dev, REL_X, ((data[9] << 6) | (data[10] << 3) | data[11]) - ((data[9] & 4) << 7));
+		input_report_rel(dev, REL_Y, ((data[12] << 6) | (data[13] << 3) | data[14]) - ((data[12] & 4) << 7));
 
-			input_report_key(dev, BTN_RIGHT,  data[2] & 1);
-			input_report_key(dev, BTN_LEFT,   data[3] & 2);
-			input_report_key(dev, BTN_MIDDLE, data[3] & 4);
-			input_report_key(dev, BTN_SIDE,   data[7] & 2);
-			input_report_key(dev, BTN_EXTRA,  data[7] & 4);
+		input_report_key(dev, BTN_RIGHT,  data[2] & 1);
+		input_report_key(dev, BTN_LEFT,   data[3] & 2);
+		input_report_key(dev, BTN_MIDDLE, data[3] & 4);
+		input_report_key(dev, BTN_SIDE,   data[7] & 2);
+		input_report_key(dev, BTN_EXTRA,  data[7] & 4);
 
-			input_report_abs(dev, ABS_X,        ((signed char)((data[15] << 6) | (data[16] << 3) | (data[17]))) + 128);
-			input_report_abs(dev, ABS_Y,        ((signed char)((data[18] << 6) | (data[19] << 3) | (data[20]))) + 128);
-			input_report_abs(dev, ABS_RUDDER,   ((signed char)((data[21] << 6) | (data[22] << 3) | (data[23]))) + 128);
-			input_report_abs(dev, ABS_THROTTLE, ((signed char)((data[24] << 6) | (data[25] << 3) | (data[26]))) + 128);
+		input_report_abs(dev, ABS_X,        ((signed char)((data[15] << 6) | (data[16] << 3) | (data[17]))) + 128);
+		input_report_abs(dev, ABS_Y,        ((signed char)((data[18] << 6) | (data[19] << 3) | (data[20]))) + 128);
+		input_report_abs(dev, ABS_RUDDER,   ((signed char)((data[21] << 6) | (data[22] << 3) | (data[23]))) + 128);
+		input_report_abs(dev, ABS_THROTTLE, ((signed char)((data[24] << 6) | (data[25] << 3) | (data[26]))) + 128);
 
-			input_report_abs(dev, ABS_HAT0X, ( data[5]       & 1) - ((data[5] >> 2) & 1));
-			input_report_abs(dev, ABS_HAT0Y, ((data[5] >> 1) & 1) - ((data[6] >> 2) & 1));
-			input_report_abs(dev, ABS_HAT1X, ((data[4] >> 1) & 1) - ( data[3]       & 1));
-			input_report_abs(dev, ABS_HAT1Y, ((data[4] >> 2) & 1) - ( data[4]       & 1));
+		input_report_abs(dev, ABS_HAT0X, (data[5]       & 1) - ((data[5] >> 2) & 1));
+		input_report_abs(dev, ABS_HAT0Y, ((data[5] >> 1) & 1) - ((data[6] >> 2) & 1));
+		input_report_abs(dev, ABS_HAT1X, ((data[4] >> 1) & 1) - (data[3]       & 1));
+		input_report_abs(dev, ABS_HAT1Y, ((data[4] >> 2) & 1) - (data[4]       & 1));
 
-			input_report_key(dev, BTN_TRIGGER, data[8] & 1);
-			input_report_key(dev, BTN_THUMB,   data[8] & 2);
-			input_report_key(dev, BTN_TOP,     data[8] & 4);
-			input_report_key(dev, BTN_PINKIE,  data[7] & 1);
+		input_report_key(dev, BTN_TRIGGER, data[8] & 1);
+		input_report_key(dev, BTN_THUMB,   data[8] & 2);
+		input_report_key(dev, BTN_TOP,     data[8] & 4);
+		input_report_key(dev, BTN_PINKIE,  data[7] & 1);
 
-			input_sync(dev);
+		input_sync(dev);
 
-			break;
+		break;
 	}
 }
 
@@ -275,8 +275,8 @@ static int a3d_connect(struct gameport *gameport, struct gameport_driver *drv)
 	a3d->mode = data[0];
 
 	if (!a3d->mode || a3d->mode > 5) {
-		printk(KERN_WARNING "a3d.c: Unknown A3D device detected "
-			"(%s, id=%d), contact <vojtech@ucw.cz>\n", gameport->phys, a3d->mode);
+		pr_warn("a3d.c: Unknown A3D device detected (%s, id=%d), contact <vojtech@ucw.cz>\n",
+			gameport->phys, a3d->mode);
 		err = -ENODEV;
 		goto fail2;
 	}
@@ -339,8 +339,10 @@ static int a3d_connect(struct gameport *gameport, struct gameport_driver *drv)
 
 		a3d_read(a3d, data);
 
-		if (!(a3d->adc = adc = gameport_allocate_port()))
-			printk(KERN_ERR "a3d: Not enough memory for ADC port\n");
+		a3d->adc = adc = gameport_allocate_port();
+
+		if (!(a3d->adc))
+			pr_err("a3d: Not enough memory for ADC port\n");
 		else {
 			adc->port_data = a3d;
 			adc->open = a3d_adc_open;
@@ -362,10 +364,11 @@ static int a3d_connect(struct gameport *gameport, struct gameport_driver *drv)
 
 	return 0;
 
- fail3:	if (a3d->adc)
+fail3:
+	if (a3d->adc)
 		gameport_unregister_port(a3d->adc);
- fail2:	gameport_close(gameport);
- fail1:	gameport_set_drvdata(gameport, NULL);
+fail2: gameport_close(gameport);
+fail1: gameport_set_drvdata(gameport, NULL);
 	input_free_device(input_dev);
 	kfree(a3d);
 	return err;
-- 
2.45.2


