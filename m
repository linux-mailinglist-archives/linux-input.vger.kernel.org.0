Return-Path: <linux-input+bounces-4543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603019122B8
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 12:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81F891C2174C
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F83171E45;
	Fri, 21 Jun 2024 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="IpVWYxCa"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4216D33A;
	Fri, 21 Jun 2024 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966658; cv=fail; b=phkiKnMw8kkqbAI9W3LyO6h9TKS4wwC8146iv1fzluEokC6Jfs8WbOg1nQBGnSUwOVIONs4C0hThOmUfqyr+n9823gKXR9HTHnC/HBjF5+NOiLoF/szabjKEZ05z1zugVsUUB8BFE8HspYyRSJiGLcF5OKGsNIRKN8WzCwDXTOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966658; c=relaxed/simple;
	bh=9GL1h7X7puTfvzBDhpPol9zSJAlYBRutN/E42pLDsfQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ghrS+HJ9wfq1yCFlij5aD0Knb4HsEUJipcqqWDYxJFKWInQTYIfLheSvZbUdnOQTAibXwDCpc3jXlULhDm//b9hKEYQ6wtpFvPhSYho/SKEZiTiOPLFSl6WUU+f7oOglkxmm3HKYKNoTbJ0VQjgFcoSSjZIfMOi4SPXleNdTZjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=IpVWYxCa; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L7GLAR015342;
	Fri, 21 Jun 2024 06:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=jNkGY5WtzjKCD1hU1XsBcj8D752
	7E2WOEDjQdbhGOJI=; b=IpVWYxCaQcROJ5gnwvETDi+gavJhakmxbfnrfBn/vTx
	LQR9SASoPKbZXtXJE8IElx1L1PYYFf0trcqDtpspswfnLlqRZt6s56mxgiahzYcV
	d9kLWTygCyrSnJfZ3nt5ld4IcEXMfdfXLAUSA+deYBsWAi1/DaMsKWe6bV1yY5nx
	CKfl7NEsHSB3MGEHM5zb1Yat0ksq3Eq1zsiM0xVRkAqbaHG/iTSNa4zusZnrWCqg
	0NvY28reU6uOYKHuAvfSZyGL4ks1ljmojUu1vs80fWWpuWKxNvz4/tSo4Hr2WuRM
	JYRkRg1eqcBwi95EDRtE+pasdcJc1Z/sAnozUCYSxug==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3yw4yxrugh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 06:44:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQdHP4ws+QyvcAtgCxX+gJIH6RQ6OSPFdVWlgfJEGRKrW2lt/K0b7BvCaBc8HQrKvuhsRP4OF0E0KkgVEyoNS8ZEjkPOn3TRZgtXl4Fjge5daOYr6KHvit6qHPAjZ92vqBV+t4mIUmW/W3+B5pporUkJbV6RMhcdhosR+LZ1C9rQ12+C4NtxrUEJ27e99IPWLsYY5JbF8ErG9Oh6rHqH+q/duavvGkXehnZeDBxeVSapm6Oa13x4dNRnb49wSZA3tlP6DufhvtTiwgCTT0uzXRcyAfents4DdNBdI0JCQJQwle09PQz+ZF0oAToBjWPQOxkaCe76BmdsH5zB4uyyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNkGY5WtzjKCD1hU1XsBcj8D7527E2WOEDjQdbhGOJI=;
 b=awi5CC2flClAkrgPJY8TOhHYWpaAYXN/r7qtBtfbyXYatP/Vht+YDCWz7m1SwH8/lO4zdc3V2fuBtPbKChFshCQsuzid17k9VF3ccWTr19RgEy7LYnaPcEEQe2tyHOIcPXrVoaKNkOrW4UHvLioTiWbdmRCbgi+Aq/a/rPKPIPUMO8lMu9VVSQjJALMkC01ELQiChTsMObwN1gsZJcYb/lCc7DtI0WHxQoedVWVfr3xPBbOEQNjKma2EvE3/Xd6OpL/NrqGqBlpcltT52C9sAZSd8Yk3t9O4cH21EF5DXuOMqOwKHzErPsFE6QdHKvAeud9V9Rz002/MuelVG+iJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by CH4PR03MB7579.namprd03.prod.outlook.com (2603:10b6:610:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Fri, 21 Jun
 2024 10:44:12 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7677.026; Fri, 21 Jun 2024
 10:44:12 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>
Subject: [PATCH] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AdrDxwnnhsqWA3twQEu3gpPx2Qa+mA==
Date: Fri, 21 Jun 2024 10:44:12 +0000
Message-ID: 
 <SJ0PR03MB6343CB033C1005A36B102BF89BC92@SJ0PR03MB6343.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YTJc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0zMDk2YWVhMS0yZmJiLTExZWYtODRlZi02NDQ5?=
 =?us-ascii?Q?N2RjZTVmODVcYW1lLXRlc3RcMzA5NmFlYTItMmZiYi0xMWVmLTg0ZWYtNjQ0?=
 =?us-ascii?Q?OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSI1Njk2IiB0PSIxMzM2MzQ0MDI1MDUx?=
 =?us-ascii?Q?NTE2OTQiIGg9IkNXM2FHSkNmcGpJV1hpaE9jdHM2akdSZFYrRT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?RE9WQmZ6eDhQYUFidS94UGVBMmlqWnU3L0U5NERhS05rREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBM0xoU2ZnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|CH4PR03MB7579:EE_
x-ms-office365-filtering-correlation-id: 58f224c1-eba0-4c2a-22a7-08dc91df16a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?V9uUB8TjVCAzMl7mj9EfiVGkyT1rKVHYaFSPf4yrlt8BOFLgKTomg8fTjFZF?=
 =?us-ascii?Q?e/6g3GWN8YDdB3CckUARoJ68Erlj4kidS32/rfOiVoZ5wWIAXIOs7NOR8RUC?=
 =?us-ascii?Q?S3F9qK+1fFRM/6h/MSfMyC8CpfQJ7yLTk1H+cykMANgnIv0mzhFm5qq1Shxm?=
 =?us-ascii?Q?H/J0VoRkIyR5q02brVhQ53mZlXunWG8WfDWRlb4JbqD6KwQCTcfVPDXkQQ4y?=
 =?us-ascii?Q?XgubnDtIkDeYI1vdv3eb/0QByhzRqfZ1u6kIt9JgnzthDzHIQ322vsV07DZV?=
 =?us-ascii?Q?rlg8bHeJ3xorkUPlScytxnIv+jqZmG51VxRTsXGD24DhUzHA524JG9E3SCCi?=
 =?us-ascii?Q?NMVBYgb7WUoE6B34ais4oirCOg6f6A0Jrf6fnVybztEbqfLoI39pJ0znRWCz?=
 =?us-ascii?Q?DOdjT4ewwXdZMYQgak4wiygxPN4530mF9M29UluwOBvixIuw0T4Wndtenn/4?=
 =?us-ascii?Q?5IywFQfbKCiEJ5TXz4+cMnGIz3/EyFTwL0mObTdE/ztyCTZYhljZqxR4Q2iN?=
 =?us-ascii?Q?ME0USf8WE0GClo1yH70QISlI0kAXncOHxsMSTAfIDpamu8JBg9fnC6lBPxWL?=
 =?us-ascii?Q?SNP505a4cj3zGtJ80nFvrV9tF4R6i3L87iSJyy3WUtKJTZ8aO9i5MA2u99Wd?=
 =?us-ascii?Q?yNOx/GBl1uxFnxchb857YCKSWk04WhVq8XzOkNaz1Y5CCU57Wd/W0aBvEcZq?=
 =?us-ascii?Q?j2kjsm4gwqrG/GcLrqRqhkm3u2Xw4kDKdh7CH0g9RFN5T1zosIuOBiAzzqz0?=
 =?us-ascii?Q?RP30+iHEUOzB4uwt0x2ubXyb3/7b3jZQ1QYQXJ/hdrrbnBqZX9+XHNEFKdXT?=
 =?us-ascii?Q?g4x8piC69wrULGPRExepFH79gkq0X/mARmSeH035KTMnzvfEdp4pNfQ87vYz?=
 =?us-ascii?Q?ohZ42P1eFzDdvzt2ZyJRbyRlz3O5OWwK9XwWxmGt5vSYyFXdHOX/1Ys3hVI2?=
 =?us-ascii?Q?ZoQYIsAPZdi5yvQmOQovHALC9Dqxk5zHM2TzitDqEwp8mwiYEowSd0Ko7VaQ?=
 =?us-ascii?Q?eEy8+eYjBnSq18svwYwboFrF8uAoPAphG4pANB8KuWYWOmy0SqdYZs+NUmT6?=
 =?us-ascii?Q?GxpnfVBYsRq4Ho6m+cKUcbxg7KKpisaOFMXnrTdCHcfWgpW/zjd9z56E4aGm?=
 =?us-ascii?Q?yRaXx8DNe6KgVeKVpZY06JdHSjS4cDZHlG8EXoLEacJOM0xoTFAhSS+V75O8?=
 =?us-ascii?Q?JdhlUGuOTJc9Jltp8oxL5jmJZ2XTiNuPlcxZE6r3PNI5rgy/0p7/7Jli3NPe?=
 =?us-ascii?Q?5E++SPryUfnM0MSU0BhfOUGKKUFWP8IiEWNHizN/s1y2T0P3wy54tcRgf6nF?=
 =?us-ascii?Q?D11M0BKjT+WWQAASiuNyk4dE1q+ES7VdyPZbgOKUIdHL+7HL19SQINOkB7JZ?=
 =?us-ascii?Q?049uiEM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?og5pyCADvXxHnrY6UI61Zz1qmDAwwb95uzQ4zd8vdU0TJumZLSu+egi/WzRZ?=
 =?us-ascii?Q?CR5TyqRh72VJklgxxGFqjlwreR2Au9Y4QSQPqy/UD88qowfINViCC42mQmmf?=
 =?us-ascii?Q?qEPtjiFQTV6MJ5KAKp23cCdV81P4akTe/Pi+3cTHi4xGAnk4gdg6NIPNwkS3?=
 =?us-ascii?Q?4vzquPLsZ8M8zRU6y46QlD2N4dZz51qExrNTWw9iPr4l7CBAFuAXodJPKfe+?=
 =?us-ascii?Q?ijxQ1icWOPQrg64HUGZgkJz1L0WWJ/tW7EUPWND+oWFhdYu+g3mSjjYknXdd?=
 =?us-ascii?Q?O+pbBSu7cIcHzm1d69Yjxv8n5VocUbUfFBmF6DPtkEhcsYgTuRox1sQEXGd+?=
 =?us-ascii?Q?DGhsekgVguh0S7uA0xiG1hmOdokhh/Z8cvrQ/lc0fqIEj2QTyZ87M+Ti6R0R?=
 =?us-ascii?Q?zjbGhh+KLXFWo7Bc/fSDp+21nlukmO2uhBuPPtjWWoW0sWeMp0q5MBNnlSlc?=
 =?us-ascii?Q?Znt4Z0wUkHs0HysvgiIun3R5hf5beQf1bZ1VTksbUuZMXuomhy9oDFxuaAhQ?=
 =?us-ascii?Q?m3z6G8sF/+B2nm5ItLM9zti/PMAxqmR1+E204LvuDDj0x59Xez3VwceL6LtM?=
 =?us-ascii?Q?VmdXdIlMR6o1BSi+DLVNEsWMdcr0aVh4NtB2TVTWuJS25f0BNHeGV/EWJT4p?=
 =?us-ascii?Q?o25ellmwDddI3rtDKSW1oRJUSYZzgBfTQTbLCa4NiLzzOV8s/PJqKuL0pYIE?=
 =?us-ascii?Q?qpEgm6agaZErpVNX0Oh+4dTa1Udam9pAW4WBqzCXDJaps9ZJSHLsZUbDIAFB?=
 =?us-ascii?Q?0OdnSLokSrgITaiDm4WsctG1u7mDSx9MiJ+FHSytF/6DcFFlHnvKsiHt2HmF?=
 =?us-ascii?Q?GRCaYYY9PomDT14yJJMOsv8M5z+0G7hZk9iTHT6nSBMYEIIAHkfFbS5zVoxr?=
 =?us-ascii?Q?Md8trp3KzwzgqPcu4FeI9Z0MdmTimG9v/p1hHLNRH9zhXkKRebIbu2tdpbq2?=
 =?us-ascii?Q?6IiD9DCt74GlrrGRqqGiOB8ijo4/raBZDTGfxOGmn/MJ/Lj15IBPhNWUYvs6?=
 =?us-ascii?Q?Db+Q6WMH+cenjL7NsAdrgLwzh58/OlWZTfi1lY/vKoJWs4E3khCNymvSW3SS?=
 =?us-ascii?Q?96RfkGvWFb6wlXn0LhrtOfSxfjYjRzHi2EqFELQs2UIclJKeexFVP4mnznwa?=
 =?us-ascii?Q?a0vdCsIh04rRtDaIwZF8mjMPzwuw7TNsAgzl7aH1SODK6YbGET4Wj//4tV4K?=
 =?us-ascii?Q?EZEluhO21uFdwpktoYGd3Zy8ceGkhEQMAIILtmhvPjdeXKc8qk6LN1SgkjvV?=
 =?us-ascii?Q?oP8xqQP5MmeqjqA8keg3fwmLlOUiiqltQ9IVabZW5xVgPAMhD1InklNLc4SN?=
 =?us-ascii?Q?bw0BgjLlVAqCyokWYYu5Zyy99tIeD0IfdXG+PQ/xJMr0XWeL8hc5TZblHFXY?=
 =?us-ascii?Q?gBlaw9Wn9CuHWiTYxwvk7PnHI9gJRDyZ2gaj/AAfsLzSsJokfZS1LKjFLL8x?=
 =?us-ascii?Q?HbzVSXlOhzhJCptIDXu49SGmOWTMb+HGl9aK++u0Xpo2rXF694xYtkO6dvLp?=
 =?us-ascii?Q?euK0FrWBb5iQ+IMqIGqYYIfD6asr+u7WpfgcIY5+bB6IyMiQZw0LRrkPyrLE?=
 =?us-ascii?Q?a55L0cHW8DcvyuxKf5dSd6WF56ELyev+CHPsQ9F7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f224c1-eba0-4c2a-22a7-08dc91df16a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 10:44:12.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grzmM/pjMPTPf98lV45PhbAzMAEg51Qhv7ScRBcwsuAGdeqFdUs1+24vMI6YtwopjGkrlhv0oqemXwDMeVC8FH+jGWhhWTEcCGAeLtHG77Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7579
X-Proofpoint-GUID: YoQ98gnL-fvMrtIkwyobag-0TVrH_ozD
X-Proofpoint-ORIG-GUID: YoQ98gnL-fvMrtIkwyobag-0TVrH_ozD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210079

From: UtsavAgarwalADI <utsav.agarwal@analog.com>

We have a SoC which uses ADP5587 exclusively as an I2C GPIO expander.
The current state of the driver for the ADP5588/87 only allows
partial I/O to be used as GPIO. This support was present before as a
separate gpio driver, which was dropped with the commit
5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
functionality was deemed to have been merged with adp5588-keys.

To restore this functionality, the "gpio-only" property allows
indicating if the device is to be used for GPIO only.
When specified, the driver skips relevant input device
checks/parsing and allows all GPINS to be registered as GPIO.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 30 ++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard=
/adp5588-keys.c
index 1b0279393df4..78770b2dfe1b 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -719,7 +719,7 @@ static int adp5588_probe(struct i2c_client *client)
 	struct input_dev *input;
 	struct gpio_desc *gpio;
 	unsigned int revid;
-	int ret;
+	int ret, gpio_mode_only;
 	int error;
=20
 	if (!i2c_check_functionality(client->adapter,
@@ -739,13 +739,17 @@ static int adp5588_probe(struct i2c_client *client)
 	kpad->client =3D client;
 	kpad->input =3D input;
=20
-	error =3D adp5588_fw_parse(kpad);
-	if (error)
-		return error;
+	gpio_mode_only =3D device_property_present(&client->dev, "gpio-only");
+	if (!gpio_mode_only) {
+		error =3D adp5588_fw_parse(kpad);
+		if (error)
+			return error;
=20
-	error =3D devm_regulator_get_enable(&client->dev, "vcc");
-	if (error)
-		return error;
+		error =3D devm_regulator_get_enable(&client->dev, "vcc");
+		if (error)
+			return error;
+
+	}
=20
 	gpio =3D devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(gpio))
@@ -790,6 +794,11 @@ static int adp5588_probe(struct i2c_client *client)
 	if (error)
 		return error;
=20
+	if (!client->irq && gpio_mode_only) {
+		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
+		return 0;
+	}
+
 	error =3D devm_request_threaded_irq(&client->dev, client->irq,
 					  adp5588_hard_irq, adp5588_thread_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
@@ -800,6 +809,13 @@ static int adp5588_probe(struct i2c_client *client)
 		return error;
 	}
=20
+
+	if (gpio_mode_only) {
+		dev_info(&client->dev, "Rev.%d irq %d, started as GPIO only\n",
+				revid, client->irq);
+		return 0;
+	}
+
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
 }
--=20
2.34.1

