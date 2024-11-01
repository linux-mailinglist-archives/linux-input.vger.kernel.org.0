Return-Path: <linux-input+bounces-7830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B179B8FFA
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 12:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0133C1C20CE9
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 11:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD65D17C990;
	Fri,  1 Nov 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="APPBQxdu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pe7PSgVG"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DD14F126;
	Fri,  1 Nov 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730459257; cv=fail; b=ulflw2EoGEF2ESR+xWvITxvERz2sAGPEvOS6WT+J9RFlfg/hiNcfXm3qWEt2wqkvXWpSTH5L3hMPDF53NkUhtD5JvZtRefEaqCalT4xEsURdvyNp9yD/AEEr4ALNoPhmaqkHgXxROMyuRbbIS7zIdIMmMCtOdaHKH/ox3qcWW9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730459257; c=relaxed/simple;
	bh=bJzw2FTBtAMqWMUHD/XbP3mSLRkOThxm3AuZ+o00Keg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OL/fSzWDFZw5Esqpx7XDHqqkB3b+4qUGQUAB7tFV/GoQ5/pWetDW7BftLMUTI5uzb8iagcY4HVsq/jahf3EQWAdoiX6Psz1EijX6aPBdNhFx1UyXd9eLfYJ1VRsQZj5Fr02T/Rph5ZjZtyq9oaUhTk+bsCorJL0qin3d2ZHAsuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=APPBQxdu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pe7PSgVG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A18feQT017241;
	Fri, 1 Nov 2024 11:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9Bi8t5CXqL8MWXMYt1
	s4GYMM3aqL6rgxploM4GupIDQ=; b=APPBQxdudkkx/A+ZA4/rquclSonAQRC7A6
	hty58OeGPgaGFiFO29NzmwK11INZXNi2YYpKk7lZjGX9iKMkg0TQi2Tg2tlubgh5
	eAZewpVTsAJmKvptPSiWM/iew0wiNKBYmGYtZpWGENP62IrjRkOrjzbAIhI8/8+M
	jA1zo3Vskz+NFeMEljZwhOD/mKRLrpvfNjv0d4iP2n+SOVIzeROhkfe/EnMwrpx0
	jWlULDLstIha8uJDzmkV9MXhseAFuQllKdMyOwV+4AQV33WJtiol5dMwyLMN7KnM
	oA8l2NyxBLf9dpN18ZiUnt9vsgK7CIADkHCbFq6hyEWTaXrdWf6A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc942eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Nov 2024 11:07:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A19toZS004791;
	Fri, 1 Nov 2024 11:07:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2xygjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Nov 2024 11:07:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgMjCUDT02dycaT1r1e2Kz0tfpu7CeM17ix1vK4SgtOuixYN5YoQYSUW6oCMTr6iErN7UxEXOH1ce+djSp1g9YzL5AyuyAQuivYgTVxi3DMudcpd02FqxV0qcNMr0JB3BwYZq8lgfe4mmmm4K/7Zckj1QOSaDt4eJ0E4nvnKSOs1E1vIC0twvhYXGYv+KutW+1jGOvp4FNHPR3qLo4JrzfVboShRh/ksXqkI9rMHEhtvNMllnW/yy3Utp92wPuDsOW4MRij1VOx6CpYdtYQssT3qntpw50YQQsciwu0FLLjwgtwUnQna2K+QMePK9m/Dw93E7rggBhY5CIs8vrJS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Bi8t5CXqL8MWXMYt1s4GYMM3aqL6rgxploM4GupIDQ=;
 b=XYYU8PZcVs53aKl+mB0i0hntwImHjGo0phPQvY2hw6s+91YRPsq1l0CpSJgEq56S5uWY1fcUMnMOwWLAjSh7KzVZnStsbvKHUKZn4RwcowHt4iaO2KQ8geYwYOKu4x4/9LQsBZr0hq8fy3zaR6bBnPqfAtLFJTjf8pe330GniFV8dqpW2eE7Y8MCXZPw4fS5hi0B7d20Qd2NWBfSVnChivWoX1H9FL0D0QX75d78n08Ts5YvDXeqXwtA5+eJB5iQQ31vudyENQUgXoC1sBwMKkB/tm13CDDsRXjlEGyd8q6M97eMp1R9xMvMj4WI6JRAxx10AG7InpEcbmC3UFdsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Bi8t5CXqL8MWXMYt1s4GYMM3aqL6rgxploM4GupIDQ=;
 b=Pe7PSgVGxGPHXNW2jHeOGaklCzogNnYI5K50+Pm0KDka0QvexAJToH2Q0HAo0HehgEn8UH/w7R6gmyYHDu2olKZ7dheTWpoGDzIY09p7fPnU99kXgUVjqouRwKoOX6B6sso/p+E/6qJ4iQmaMPETOzdqyQv2ZdmF1/+q54QMPb4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4789.namprd10.prod.outlook.com (2603:10b6:510:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Fri, 1 Nov
 2024 11:07:12 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8114.020; Fri, 1 Nov 2024
 11:07:12 +0000
Date: Fri, 1 Nov 2024 11:07:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk
 (2)
Message-ID: <78d267ae-0290-412a-90d9-e5889b8ab112@lucifer.local>
References: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
 <6723b31e.050a0220.35b515.0165.GAE@google.com>
 <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>
 <c963fa8b-7892-4528-8ab7-a8a3a080afb7@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c963fa8b-7892-4528-8ab7-a8a3a080afb7@rowland.harvard.edu>
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bad54d8-8901-4be2-c76a-08dcfa65562c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PNbg/R9NvaeizdYWQT9ZfO7p+bEC89dBxFp57TvxFNCNgqticftbXr03uwND?=
 =?us-ascii?Q?eZNwLbRJiTrNQ/GSFPcJOG03lFwVhdi7MV1pHbpBZrfRv4nc+6t51uaICPBs?=
 =?us-ascii?Q?oqqgCq+KvOb6LLHf7FhvFxGqNdCLlyJCciSsR3H+50zVNLebU6KRBOOvnXAE?=
 =?us-ascii?Q?WmlylLMTQtrnFmNDqwW9Imn1XAQg2WxhDRlWrpsCskhrWmBzPIGeb+24FUNo?=
 =?us-ascii?Q?DQikVg93vdh+50HP1BaFBIbx6uNuSQvESis6XebCOLahDPCx2tHiWybsnEVO?=
 =?us-ascii?Q?If61nVYLyXXz87hCmW1i88Jn6hsXD3vHtx3oDneH+yyJsbCDxNEg2rfY1lOD?=
 =?us-ascii?Q?1TeLVwOtusgs2aFAqWNRMdDg7NeMu9K7jp/G3FBlHxSig/prQMZit+aXVE+m?=
 =?us-ascii?Q?mrzlLjsNBzgreO4LZpcW1qx2Oh1Z6POwhztx2ctS6cSivVx+inJLck1VQ36c?=
 =?us-ascii?Q?N18KY0wMO9j07f7msh6V3rsTI1feaDn+AyzpXRvo8BYA5mSOnmeJkLB0x+7v?=
 =?us-ascii?Q?a9Wa16UHQjR9KK4dR1oThIyLh8qK7RrBw+beuupGtWo9IBirHV9Od+EtoL8t?=
 =?us-ascii?Q?fhf0bEMbZzdEPc4c1V1OXCXicmhFmmw6tNv3NThCGZRZKJYJMTsX7NEJPx5s?=
 =?us-ascii?Q?bwcttTZdeSVsgG+2FWSVmEVAEsmJP7Pkgx8pc4fI/VvT/p8OEtcgAQleR/8b?=
 =?us-ascii?Q?KU1pRTiGGIN+Y30DjXPhJ5vEzx4LN2r9PBg0oB66csXD4fAxGZIVuc+PSRFK?=
 =?us-ascii?Q?J9aDVjg1bFxYRevimpywEJflZK3IYunIGBOU/Ik3xFEIxWF1WHtxgtxVoBRy?=
 =?us-ascii?Q?4ytDi3ik8OjBKFMgK2Amoq2Tx/PHWaG0ivvr3H8S0JpI6steTCi5Op72GVgF?=
 =?us-ascii?Q?0qXhW9KZ9e1o1c/07wvRcfz1sMWCDKWyOLVfFSbp91FjN7wmzsCnv/o9mJUl?=
 =?us-ascii?Q?iugaklJm4a1zCMm5MSLJynrHjHisjE4A6gM2Q+J+x/FC8R1y3yD7cJ7vXg/c?=
 =?us-ascii?Q?A/ZEBj6nfWOgF/xgzhHP0usdjj0E//1CtLvzYOCQa6xcpgIlBArXAS/Tc93o?=
 =?us-ascii?Q?Tz1JKJX4vq8icp0qdmSUOfVEA8Cs9JXL1i6OmR803lkFFLtNzEOCpAW78J1s?=
 =?us-ascii?Q?UzP8x4WUpE1i43kgBoz5NIvNyQOFbtt4UUxK+z+xGPKrepcZAZV5vwP/rnXN?=
 =?us-ascii?Q?NDo1ec5HDzX3OOnE6DoTFqtfxKt/G+opLBWCaqZnNliZ8mYoJZ5UdTTR3oMj?=
 =?us-ascii?Q?BjUAhJuImsKnaQDDyKHHeedY/wAW2XEL8e9+cbe8+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mNGzgwVdEy4MuW3aJCs8JzGdoJwlz0F2Ap0iqNoE+dTp9YwbmxxxFtNrc3eJ?=
 =?us-ascii?Q?Jnc9NseWF/LUMsR4yic9MEMyc12eEw31nughfIUN+xHMpnygVz3RBjAYBT5T?=
 =?us-ascii?Q?ljbNJ4vbcTe7S0qpYH89neIZKDx3Za8RVnaEMKKKr+x7Pgg95cFT1jY4SDa1?=
 =?us-ascii?Q?QzancnMAwx88zRmWVGz7JWa2aOHwm/iqLJM7VTawSANGBIlg6zmrJ217yHst?=
 =?us-ascii?Q?XLCcY+cndXy6HF2NfT6y4GPuImgg/NQUOTnwenuyiBgh7ePaes89CkWoy3Fw?=
 =?us-ascii?Q?XE/RFsArLnQBe4SK93oG0SQT+isbbz3736yiNnARrDZpMUXDKh8CX1AmEk6c?=
 =?us-ascii?Q?FYiP2YUF0opkZxIutOGUzHnZ/Z893nqVci3ColY3ae87lkNFxBVeizjEFskf?=
 =?us-ascii?Q?ASYmMgjm8QcNhlMNOJaupvD7ZE4RnVKoVBW+dWouQuGmIwMdqqZ62MOsxVpB?=
 =?us-ascii?Q?XGR8sKrwOyRFXNaxvObM4jVAHEmQVWeBC3Yj//MPFa9fh+c2TF8OC2yOcTzi?=
 =?us-ascii?Q?ERSEER0r3LzX1/pQ7Xh/uA/XO09MoXxU/dveljUAzQe6w/Cnr+U6lwSSWtyQ?=
 =?us-ascii?Q?Z9hdVECNipIys598dXHZTOq7kGKD7PGEH1+r1stFYBo0y6POY4kbEnra0wp1?=
 =?us-ascii?Q?XuJZLpvojlNg6LD/H9penD6IQUIE+Yg8Lo8TJaZqIb7UFJccOhJb7PriaC8R?=
 =?us-ascii?Q?5h4Te0EZW3m4svepDSadcLWB97Xx+5MdHxqE+TUsITich40hyE+ucCV+wbOQ?=
 =?us-ascii?Q?vQPyk+CMo+233M/oL8GqeSzJF7mfWXpI4941IO1mt1IoD5/MYX1+miP5HX8F?=
 =?us-ascii?Q?EfQUwuY4imyDuOKAT/beiSe31owvkc+GvFEPmGXhzqKA0haEZgc9SQVmg6se?=
 =?us-ascii?Q?eQu2y1u5tcPhhDXzMA+V+uGvq8VZ3mHiSnX7Tp/i25shbGqQacSX8DVieiZe?=
 =?us-ascii?Q?8bUoHA8krtrgZ/6DUNFciYIkZBYUjw1ASkJeHRX139gBTYfgcuv43HqTg3pO?=
 =?us-ascii?Q?TXd3B4CJy0s2CC/JTDYvWYf4pBWlDRMyxOciW1eiup9xVLABxsdD5oEf4hsh?=
 =?us-ascii?Q?tAquFOWTRMq6Y2or2aDEhGgEcM5YjdDBUZLx9AnA15yeYy21y0EH8d4AenaG?=
 =?us-ascii?Q?2mEBruLTsOpgBqwsaX6vx5cJ9CEi7WOWN3kePFClIKbVFkwMxusTBRStdhk2?=
 =?us-ascii?Q?pDFiZghzGcH/OroI9bIPyyrvbrHRhUFBc/RufHQoNHbJgmIB2FDmLqvXxZpn?=
 =?us-ascii?Q?n/vOIR85Y+4M51quk6cRXLQO66jbZ1lblgA/kPAVCt5KjnGPHK3RThp4EHHS?=
 =?us-ascii?Q?PE70cTQysI4cyGPQZExeaP6UBDVePnIqXdYvhSulc+X88ZnLOXLhDheFrMbQ?=
 =?us-ascii?Q?+x6Ikml28oAyA4odPTRgr1sITNQUMQQ8tPzbwDCFRXIQUJOHiZdO6p2TkDRS?=
 =?us-ascii?Q?jI6/ho4oyT/kE0FSyakQzB4PToH2oOdMSRLd9/V4OU90w0pqkqBw+7NJ55WJ?=
 =?us-ascii?Q?K3mmDU8hIjeDQB5JS+7AcnV23P+iaUUvW2uWawIMtaYLmxV2JsfdlCibwr8n?=
 =?us-ascii?Q?+7VT76zzF5G5tCH8ntDB1KenNH+zXhQrGM5ZM7A2e+CZMcPbT8QOYKUouM3i?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r/BtzIwv7nBNUYNRGm3nvkOmFo2cPQ6mX4k6zvFTi5KrV2ZDscH+TPczeWjUIXAgCAcb2Hia6pb19WIPp4mMzzz7Cr581aNgjswWIRCfOQ+1YDJ1YMbAPyXeE4R+yPF1iLivOOpTh1iEpV9NIIRVjEQlj0LdNLrJze4Z+N6cvlFOhqJujj/PXmc0X0hxrSh05cgQQOmDQ0mZzXXH1LLEpnWV0tKFPPkSiRzhvtoGn2dO8LT7JC+tvqP5opUA4gPniSEkjH+RapnPPrQdKO8CTFE44l8KPlcBtutD8N6oRkQWShgqTjTkYMFGGNPSZfEqzsuo0WbB2DsDNOPPlS6KSwLTHiLDFvu9TUDM8xrup/IHowVplda3D01EPgTxsN9e2gVyP9JTpWC4PtuR8RxlFFqFPY7h3tDZPdw00XyKK7JtAzR7GE2gnoa//DMormE3v5gqzIR6mD4QjO4OA/wE+viPqcatL3GNUGHeitKt9L+xUp7C66UFlchLfcUSnt0IopMJ9p2vNPfcYSj8fZrxvMkgKBipgEKc76DJpZbG3BKpxUxvPzuLypv/GwEzK3LHTdkkjyyenqrxXFJ7/vox8VMkDkha6ibkSZKHvanbX6E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bad54d8-8901-4be2-c76a-08dcfa65562c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 11:07:12.6376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIZqhxU8iz3jVERAmOCZ4Off8fVS93SrVihwE8EKETE2mm8A59DReuCIDkjKRNSBwZy5maM9PjHf8njYNN64TTHxOfsrK3qEivdw1kcMXqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4789
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_06,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010079
X-Proofpoint-GUID: 6XnfIhtXNt7v6PSQoKHMfueMfPjwz62T
X-Proofpoint-ORIG-GUID: 6XnfIhtXNt7v6PSQoKHMfueMfPjwz62T

+cc Greg, Jiri in case serial8250 really is an issue here.

For context, the original syzbot report is at [1] that gets snipped here.

[1]:https://lore.kernel.org/all/6723aa4d.050a0220.35b515.0161.GAE@google.com/

On Thu, Oct 31, 2024 at 03:24:57PM -0400, Alan Stern wrote:
> On Thu, Oct 31, 2024 at 04:58:29PM +0000, Lorenzo Stoakes wrote:
> > +Alan re: USB stalls
> >
> > On Thu, Oct 31, 2024 at 09:41:02AM -0700, syzbot wrote:
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> > >
> > > Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > > Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > >
> > > Tested on:
> > >
> > > commit:         cffcc47b mm/mlock: set the correct prev on failure
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1304a630580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=6648774f7c39d413
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
> > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > >
> > > Note: no patches were applied.
> > > Note: testing is done by a robot and is best-effort only.
> >
> > OK this seems likely to be intermittant (and unrelated to what's in
> > mm-unstable-fixes honestly) and does make me wonder if the fix referenced
> > in [0] really has sorted things out? Or whether it has perhaps help
> > mitigate the issue but not sufficiently in conjunction with debug things
> > that slow things down.
>
> This looks very different from the issues that were addressed by the fix
> I mentioned in [0].  In particular, the log traces for this series of
> bug reports all start with something like this:
>
>  serial_out drivers/tty/serial/8250/8250.h:142 [inline]
>  serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3322 [inline]
>  serial8250_console_write+0xf9e/0x17c0 drivers/tty/serial/8250/8250_port.c:3393
>  console_emit_next_record kernel/printk/printk.c:3092 [inline]
>  console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
>  __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
>  console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
>  vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
>  vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
>  _printk+0xc8/0x100 kernel/printk/printk.c:2432
>  printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
>
> indicating that perhaps the problem is related to the 8250 driver.  Or
> perhaps that driver just happens to wait for long periods and so is more
> likely to show up when the real problem occurs.

Yeah, see below, I think the waiting is probably the issue to be honest.

It's hard to know if this backtrace just happened to be code executing at
the time of the stall or is actually related. Have cc'd serial8250 people
in any case.

>
> By contrast, the log traces for the [0] bug reports all show something
> like this:
>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  usb_kill_urb.part.0+0x1ca/0x250 drivers/usb/core/urb.c:713
>  usb_kill_urb+0x83/0xa0 drivers/usb/core/urb.c:702
>  usb_start_wait_urb+0x255/0x4c0 drivers/usb/core/message.c:65
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x327/0x4b0 drivers/usb/core/message.c:154
>
> because that bug involved usb_kill_urb() waiting indefinitely for an
> event that never happens.
>

Ah thanks, sorry am pattern-matching a bit here on usb-related things.

I suspect issue here is the test is on some level assuming that it can have
delays or hold ups that would normally be ok in a non-debug kernel, but not
taking into account the fact that CONFIG_DEBUG_VM_MAPLE_TREE can really,
really slow things down and is a very heavy-handed option.

I think we should nearly always turn it on as it correctly identifies
serious issues, however in cases where we _expect_ slowdown or some
significant waiting relating to hardware or simulated hardware actions we
might want to reconsider that or at least increase timeouts.

Liam has submitted a patch to explicitly rule out an infinite loop in the
maple tree as a source of any stall [2] though there is absolutely no
reason why this should happen other than in the face of overwhelming memory
corruption.

Still suspect these are just due to slow down.

Perhaps somebody from the syzkaller side can look into mitigation?

[2]:https://lore.kernel.org/all/20241031193608.1965366-1-Liam.Howlett@oracle.com

> Alan Stern
>
> > [0]:https://lore.kernel.org/all/967f3aa0-447a-4121-b80b-299c926a33f5@rowland.harvard.edu/

