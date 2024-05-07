Return-Path: <linux-input+bounces-3569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 076CF8BEC36
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 21:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E421F21211
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 19:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0CF16C85E;
	Tue,  7 May 2024 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="GzR46Amn"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02olkn2018.outbound.protection.outlook.com [40.92.49.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6516D319
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 19:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.49.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715108677; cv=fail; b=qKoBxZSE+DpuqWCfiKXxzi34dHH/wbRpitsAGJtWKQ/7hUjD7wiaqYQBmMUDIcBxuYPsFMFLhexOu38aqsKU3ZGRUstWVAKrK/ZYFq8TYgMzYoWM+DwW9Yvqxnxq9N0OB2fbTLshp+Lj2bqlLPZPD/GRFsLAz11G6U7mfdwOIkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715108677; c=relaxed/simple;
	bh=eGeKB1ROERVJ+CgR7IouDYSvaX2N/6oyaFRvrV5jNmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QAHXhC6jJ06oVfoOpa+mm4J8F1jFDxZF+gc2bIxiC8pb625ZLAfvPLMB/ZlUase1ln6xF+GYC+tc3GL4fEiem/eHz12I6LzLQpi5GVLeraWyiVUHv0rHqX4n5cL6UuFXym3/VwP9lcQBaY5mB+mCeAoGB/WhzSuYyGmNBRSAJ8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=GzR46Amn; arc=fail smtp.client-ip=40.92.49.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+leAnaJBsM7j0/6HbjtqkTP3oOevF1WT0+UEkDh0540fJ85wzhRo5430ZhTBAcvAWYVP0LJgweUp4vWHIz31YtihHyEBfdZAhXp3sBdfxR9jqTeJ6NiDpbc2Hg6Wn1dXoNJuy2+tMg9wM9YhCH0r2ITiOC50chDzWBsV9Ov8EtKEYHFfIptXZCTAGlTe2U56CPfAf6jkwVLSzN8SerLt5PjfYlLx94NiUfZBBwMkOPQ5jmJjCadlz1fje0yqlomBf4vgWGtzTge9pO/Y6EGSqfOkMUX7niBtzMIX0uqFVcDb5T9DWp9gjt1ta4S+e9UTS0yFJDLBl4xWOjEPqZ5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg01Nf4+MTQrf6Slk8v1rmwnuJIkwX+FiEc0VYKvIcM=;
 b=T4aGjQ+rL8UGXC6fsRwHSkdxMUYqX6eQfCt1f3HeEqxWid1EzmkSmF2U1/OCC43HI2z5zlXpff1hRXG6mKvI+/MhfrH5O4bW3R0XqRK8k6muNStrJ2xVWApOZ5sCXCO3DkLntkF451q+I4pQjfDuGSveMasANV3h+HOK3gUxO7XpiyC1Hts7UWpwfKVwUVHOtlrF+6AggU+76ATLKY91upAyr7xIpZLo7u8fnEu6NDE3BFOHY7P9fioe+gvDJl5HTFO6fCX1L3LkHPoarmGhup22XpCMWCcb7kB+a2Eojh2y462cUyB6JwQiKTDx09lEV1Dlc/2/Za+K5VxDoNHxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kg01Nf4+MTQrf6Slk8v1rmwnuJIkwX+FiEc0VYKvIcM=;
 b=GzR46AmnnolMtUg0u6vsfMz7cNrbVlGUHuJfg+ayYwaKAA4+r/c7igCR3TPDAGsFRogFFE139EKtPqtqf112ZB7olp3TYbVlqY/DAN41E8714sGhxly+xLYON3lZgdgoUOGWqrQOuSxww2DFr6e7tF0rKuaeRZiHmQcvcSl9gpjAZZgW3JizD87AMkGez4Oc7bSQ6hu8WwJ13D1QdNQiqq682iBrQrDcdnucBSn7g+iND8ST5oFWsCk/Z0C4S+smSpjKEu9vjLLxGLk4buIHLyU0LZ22h92X4ZGzYSCf8PJls/jjVnSmZwaMu338UZlSwAUfuBs2tbfCd1xWpaTtFg==
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::18)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 19:04:33 +0000
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87]) by PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 19:04:32 +0000
From: Milas Robin <milas.robin@live.fr>
To: crange76@gmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	milas.robin@live.fr
Subject: Re: gamecube adapter driver
Date: Tue,  7 May 2024 21:04:05 +0200
Message-ID:
 <PA4P189MB1469E69547FCDDBFF4C44B7EFAE42@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <2693037.vuYhMxLoTh@mythra>
References: <2693037.vuYhMxLoTh@mythra>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [xAwkDRG2WR0JAIP4QXeyI1+4auMEPS7ipm5itZF5PcDOeXF2rtSU5JAx+wqu++yG]
X-ClientProxiedBy: PR1P264CA0197.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::15) To PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:ba::18)
X-Microsoft-Original-Message-ID: <20240507190405.11836-1-milas.robin@live.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P189MB1469:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b0cf86-bea2-4339-8cab-08dc6ec88788
X-MS-Exchange-SLBlob-MailProps:
	B8gWPGiJ24QPpT3vWwZOjyuJghGgmEeKVoW0VoA6WCUHgIr3zMsVJAc70dQcQfdeK438HGOGNVOyouAKdrA671i+qeCecvvhLqN+7PgyCFAMpISPhf1BPpLIbRdmcdNShOzBk2Q+3FMc8eXJQSgFtLYzaBMjChHD23hvcPKZpv1/PAdyRHDSSkl+80gmLdV3ONtm2LAzCm3gdzS8q7ycLdG+gr2eqp2/gbhxfNsraUSTbVwfNXWmWeU2n0nR0FX8fH/wFhSRl9/rlNkMu21fwy2ptQ+v+8DtAwl4drvNZgSR5nHnU6d1yS14AlbsHeCoR/bWHq6YSfQfLDueeEmXdT2qXUqop44V4+JkYjNddeMQpAbiyzgVmD1Q2cdF+z293D6VNfbqs8CMy3Z9v3EWkI0C53UkahHfiyTRmTcJlHdniRSCTGyimj/roilj4vTiKtBDtOokDbCh90B5HxWVUrZOMq7jqQOxILkFtQCfPVj3gOSVLbVaBXOIjxmb6JyakXlblLY+fwBcxtumOxDok3iWLQst8z/Hqw/bzUmQGeIl7KSHXCxNzsvDQ1TmhWvjs/F4aeDrDXiY6EfizwAJZX4WtFyM5nVKOkfPna8VjMupZS0G4qk2+PaS/VSu8RSZDinjlGeuZU4DF2594bNdcO9RxwqnyRgAEs24cEREzdrAmkhdgycP9cxAMWL6lU5j/+mQSrRc89g=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	3igkl/kCf9jamr2mTAUeOgl2jr8yvLNyV7MS4cbarR23z5/tDNI5wqADA5g0Grp+Ugpnq9CCERJsAozBaEEnT/izNSx4zN604pUZPXHmw68+iQY0Jqv3Nqy+riU2gl1ezpPw/tNYtMi66CTsO2JuHk38/YTB5M5o5Az87UZa+V0ua6xaTprTOWzDzlQhho/X27p6ONJL4Wy6yw8tU/0RpbBrLMvmOvnk/lG89FFcPD0oTAGg5yaGrTepUxRvOyzN40yX2RRFEJLu2QLWeik7dK2BJnVDThvLC3eQWKZ0JBVs/4KhnL5e+trjMMnv3Zw5mDsgV4r0qvHGKW6RKMvB3hYg3kB7Ucqh91rSCitwn4n/6tvRnunYnHAsa2nrc+1CiIyH82XJxvyaS0HRU1yxBKrljsHwVQePkprVSreJ4owfyp25Xwx6Vyaao6A3oC5FI6xxI7XYMKYgsLURLgQYHaTHD2fYwythD9hQX2ojsEeY3PXEOgwjQ5+94NwN9/Yogbvo/cU2tXz0EE7XXEphDK+IgOmX5SIgbIsY/MKo/UqXZL997ALSNg3ji0aowKsYRMt7yLC/+lpHudIyVTRyabJdM6NYgP6WtrRt+3EqM6lyCmjoJyPoo3JZWyc6phPF
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4zIHsF1s0gVipwjnyNlw0fFrquNXjbwSUfo5NW34ME4vOI/orlsB8jbLr/L8?=
 =?us-ascii?Q?refSI8nYOj1jLgHESFrya74k1bDzxUP7vKadwLR2ySceRqDjA67UqDz+VSP5?=
 =?us-ascii?Q?9mHyFxtbuZn+BHcUzPw1VE9benBVn8Z81+JBl8KAgvHT9xN3TgPq+sA7ODp5?=
 =?us-ascii?Q?qAV+faulrlJd3gG5LEsvt+9R3D1tst/t/Vsk6VAEEkLu3E0QtNVQOVSHHmf2?=
 =?us-ascii?Q?HfEUs8/EZrdNfaq1d01zPnKlTdLPd0DzjVQ5E2YdM3dP/5WWCBoBrtxCiAVa?=
 =?us-ascii?Q?ICHv94FjjGg9hyhcXesMC11rS0RUaXU2cBRoZaBpOUrzn6Xj6FxZtNRK1tti?=
 =?us-ascii?Q?oxhddqXna2chcjTUZ/5Gv8fQwO8O2lvYMRx8HGRBgbzwlafuFkiSuvDjxnON?=
 =?us-ascii?Q?0bQj/AAAVb6NvL7fjvdI7MLKKM+AeRJcyxdfp52hfGKBUM2ru1G4IKKPPDGc?=
 =?us-ascii?Q?q61hkC217qSiYWKzEqXdp/bvtrOTg9ifICk1dxlHA4+zHwieLiSLMVs4oU/3?=
 =?us-ascii?Q?hLO7VaB1ELusGUZZTeJmyyeVkYp8JFHDVwArz3KvLfGGocBulffBKLbNIf5h?=
 =?us-ascii?Q?V5BU3xKlCU/66hA29TAuOhuFTsPc1UVvd19Rftd8FFCghR6Oon2fC1AkK7UO?=
 =?us-ascii?Q?7OnDta3rb0lSsnZURIZVpqptJeXBqLM1ki3pMXo8Jodx+jgLJ1F104YcDmN6?=
 =?us-ascii?Q?4A0dsUQpzeAj/1UFzTFA5MhAEjyUR/OETVjGbdFgVPk9Tet9KQmjbxKbjpnI?=
 =?us-ascii?Q?QEGPvSH9ULJNEYgvL8cz8LDclRPJL2iIbrDVur6zSQv0ExPOLJRaALdG2QwC?=
 =?us-ascii?Q?Ci8EM3cl8M4iFWBas7qXxl1EyroARqkLigdHu8IIgVmudFHG2WI7zTgUwQwc?=
 =?us-ascii?Q?xB64atwb169kyrZJ3E58aeLZ9EO6BN9slPInRLf2gyl4ZDzrOehNbP27VSgz?=
 =?us-ascii?Q?fPr5LK6t5WuX2t9A5TRyrY2qSNvp7DC2i4N9ztwxSH2gZXlubamGP1ocE6W2?=
 =?us-ascii?Q?YqJwUoKHZqhZvpr/DI4Zi9lLCdHY7eVDV9kjz4bt4PvJqUK22UEa4aZ6KJ+p?=
 =?us-ascii?Q?6+8POQx1weKhU2EFDX+UqLUz22Na3/AdX2HyYYq7yvniPdrtMHeGHQOb5be9?=
 =?us-ascii?Q?yQlsCW1umuOLsIudTfdqSP5cgbxbXLoWBHx4HvQkHCFTopr+GV14cWpXnxc4?=
 =?us-ascii?Q?Z23KIxtrsZMDVbHB3RQEScwKKaElfRJfsS1XM5MDR+xdCxdYK/5VXzeTH+Pe?=
 =?us-ascii?Q?MZupXF/bHWtRcJffJYfUSw4q1N+exip2vKrr8KZ9nV23NFVC7JeqR7iwBljl?=
 =?us-ascii?Q?VrQ=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b0cf86-bea2-4339-8cab-08dc6ec88788
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 19:04:32.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091

> I've built the kernel but it won't boot, its likely a issue with my config but 
> could you rebase the patch to a newer kernel.

This patch is based on next branch from the input repo:
git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git

The patch I submitted still compatible with their latest next branch.
Just to be sure I even updated my GitHub repository again to be based on the
latest commit from their branch, so I do not understand what do you mean by
"newer kernel" as it is up to date with the upstream branch on which it should
be merge.

Try to check in your config again ? I'm able to succesfully boot and test the
driver with a buildroot crafted image based on the input kernel tree and qemu.
If there is any issue related to boot with the driver it would be usefull at
least to get the kernel panic to debug it.

> Also I believe we are not
> contacting the correct person for a merge.

This kernel driver is not an HID driver but a USB driver, as such I don't think
the "NINTENDO HID DRIVER" maintainer is the appropriate to contact.
I might be mistaken but that also what the "get_maintainer.pl" script tells me.

