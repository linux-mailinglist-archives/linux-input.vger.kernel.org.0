Return-Path: <linux-input+bounces-6019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0FE966104
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 13:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92EE287791
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 11:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D1C199935;
	Fri, 30 Aug 2024 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pQ+aWWDV"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C519409C;
	Fri, 30 Aug 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018630; cv=fail; b=FT2GFlkwrzhtZMDt2qdgLYE+HcuobTIB1PPZYGHT0NRqAh83vhQNwgBLiyAzGF81zdFJ+J9CAnuO8Ef/7d59FSkI9ru7iQbEXk00jKfdEsuhe4QERw5lzf3MTF9N2z67SET9Ec9Yfclom543rq/Txg7JqGujBaPPi1ciRlnNZp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018630; c=relaxed/simple;
	bh=qGI5j755MtnWcNjJ+pisdl5zMa3t7bOTcqaDGkKRefU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NLIfRZ5Mdl33gnSM2oxqsvBVU43pW8AAxNeWrDtmNYAk6zFZ8d0X7EPAM6/YdCVTv01chZxbWjtPjzk8jZMxRJDbRqvo24PbVnW9pOnqGUrB6TCWR1kuTIwhOlvoFiQ8DDfOUsnVFmDmGbTqyULQa1+f93FdbIZLkEO2PLyPMyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pQ+aWWDV; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U91tOn020792;
	Fri, 30 Aug 2024 07:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qGI5j
	755MtnWcNjJ+pisdl5zMa3t7bOTcqaDGkKRefU=; b=pQ+aWWDVPN47b+jMp6hku
	AEMaTaeC45fXbAzW17/im7qO8y1CA6+HiiKPKL3FnR6X6IOuqBiBnXbY/aGEUMag
	H3ViaCXWj2UHdcR+vFcISk/WBdMQNWmGCv1hOog4FnXRV47TdB0/ksWbGVTHkkLl
	6Ws5+ok71mVDwEesMH/bTh2N6I3ggqcIFUDwSAI1lLKE9Du/F2XRS7K9/4cag803
	SeWl5jdqxGid+koDG8ZtgOyJmg4giX5iF3XFTV9ibf8vPCpb3E7TR7lNoEyo8LvH
	QjhUvnHJQEfnuV0ojs1mRLkT8IeHttcowg1yufn2q1veLruHIv1zZNDXtTPpyuMv
	g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012050.outbound.protection.outlook.com [40.93.14.50])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 41bb38rj7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:50:12 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikhFJ/haN+0Femx7WZLeAn6TmjksWJbvItMObkiLtcTmU+QIFqCmkoIgiDJ5Xq6ZIHJ4RHrSpWKOjpyl3XdcYj7x42w8Ow1AyufPeMT7T+enSn3gKVIjk37CIEsIDQGjKvyadid3SoChPQj/T36/LIYmIB/FWVuXhvVAwyGGdrPVTh/wm1MU8zCH0a2SN8c/i+uqYVIp0tbVy772T9hqehI60wHkkFuyyOuHEh47tesWzwyZX18Wq5oOrsP+1OVl34GkjUIMjPdVXPez5uql6eHkVET3ZEb0dIjLw2AksnYejydoiZ8gHvPWq1klceEwIxdrQhX39aF/fZkSCVcAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGI5j755MtnWcNjJ+pisdl5zMa3t7bOTcqaDGkKRefU=;
 b=nc/0D7B/SecKNm4KTCONdsIYiHu1IfcWqh037jRoDcTPkYhDpfQ4+Rah/gpJuK7pMZECbxEItCHR+4a3opIV1bzWs4zeW+J21obEusvwi8wQ1opw6+C7ynkPcSjF6tMC/G8C2FAviQJ3SqnzVqUKMtpxglVJyodbnXN9dw2BCrmpIEwVs9JvLiNxoG4CEACpI8xCzSGksObFPZg6FzZSfPsYdJGK3MVrkqBLrHJjtQj9gJmO4tiYjf2pReFoIrhCU9CbP+UmPZtRZErbDHv8hAzKGEYlbxKdC7HTlhCbNx3lsaWGAw7IcpbPO6gRGYAJ008IJVVI9OVivWQGl+mKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by BY1PR03MB7852.namprd03.prod.outlook.com (2603:10b6:a03:5b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 11:50:10 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7828.031; Fri, 30 Aug 2024
 11:50:10 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Artamonovs,
 Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH RESEND v11 0/3] adp5588-keys: Support for dedicated gpio
 operation
Thread-Topic: [PATCH RESEND v11 0/3] adp5588-keys: Support for dedicated gpio
 operation
Thread-Index: AQHa99yGLEihu4njOkm5ilkpnIT7orI+lOGAgAEgxbA=
Date: Fri, 30 Aug 2024 11:50:09 +0000
Message-ID:
 <SJ0PR03MB63437F94F3310A1C8DB2C5A39B972@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240826-adp5588_gpio_support-v11-0-3e5ac2bd31b7@analog.com>
 <ZtC_kx1lty1jeKH8@google.com>
In-Reply-To: <ZtC_kx1lty1jeKH8@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?us-ascii?Q?PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXHVh?=
 =?us-ascii?Q?Z2Fyd2EyXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVl?=
 =?us-ascii?Q?ZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMDA2YzM0MTYtNjZjNi0xMWVmLTg0?=
 =?us-ascii?Q?ZmUtNjQ0OTdkY2U1Zjg1XGFtZS10ZXN0XDAwNmMzNDE4LTY2YzYtMTFlZi04?=
 =?us-ascii?Q?NGZlLTY0NDk3ZGNlNWY4NWJvZHkudHh0IiBzej0iMzQxMiIgdD0iMTMzNjk0?=
 =?us-ascii?Q?OTIyMDc5MDY1Njg0IiBoPSJ4Ui9tV2JLUDNWM2NFdElGeENZMkJwOW0yR1E9?=
 =?us-ascii?Q?IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dV?=
 =?us-ascii?Q?QUFEZ0RBQUJVMXN2QzB2cmFBVDR6d2hHcEFveTlQalBDRWFrQ2pMMERBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFTZ0lBQU80QUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBUUFCQUFBQTNMaFNmZ0FBQUFBQUFBQUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdN?=
 =?us-ascii?Q?QWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0Js?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dC?=
 =?us-ascii?Q?bEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tB?=
 =?us-ascii?Q?WlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJm?=
 =?us-ascii?Q?QUhBQWNnQnZBR29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBTzRB?=
 =?us-ascii?Q?QUFBQUFBQUFDQUFBQUFBQUFBQUlBQUFBQUFBQUFBZ0FBQUFBQUFBQXpnQUFB?=
 =?us-ascii?Q?QU1BQUFCT0FBQUFBQUFBQUdFQVpBQnBBRjhB?=
x-dg-refone:
 Y3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3Qm1BR0VBYkFCekFHVUFYd0JtQUc4QWN3QnBBSFFBYVFCMkFHVUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQThBQUFBQUFBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElBQUFBPSIvPjwvbWV0YT4=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|BY1PR03MB7852:EE_
x-ms-office365-filtering-correlation-id: 1432b738-e329-4b56-63d5-08dcc8e9e683
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?W/IsSIuEefrDyBjqOEpEzxKs+X+BlDgzTj9/lCdFcGwwLA5wjBdvrfrnFUU0?=
 =?us-ascii?Q?DtZfE7amy8B1Bq/Da6+SVmxeuPp3448nOGwHmjgGqkOo/pGzQ99Vt+SfuHzm?=
 =?us-ascii?Q?ScdqhiQv2aTFj4Xx8fJ+ezjCgA/qdIoYhnUSi2SoACWdYkIz9GR2oZHH6tJk?=
 =?us-ascii?Q?vcUB+YDnk2blhXWjyIizQqBee68MeMOWZJc9oUU23LswXPdiwct4gYMIbiqN?=
 =?us-ascii?Q?DS2BayXG79hEzi43P8f9yB5KCK8sIYuXYNV0GDZQ1eg6AYenrJs7gDHUoYNh?=
 =?us-ascii?Q?kdPO123cdEqHO8NEiZnhGTyNdFuwlS8RhtNe8tgGvlaaDPgJ0kAVqXSIilId?=
 =?us-ascii?Q?oyDmllhTxLHpp79mMlQU5j7KeszQYzNye2q0NemGR0KUwmlfy5UHrlrY6jcG?=
 =?us-ascii?Q?3chIhds4C4EKgM0+0l9XVOckGMYn4Ztm7PT/5/9OCtssklG4iBtuyM2Suib/?=
 =?us-ascii?Q?k3p+W+LOvHfJ/MgAZ9NZS6Bfta6GLHJvGeKDbzbWrybbFr4dCtvtwmqoISPF?=
 =?us-ascii?Q?YJ5du/5odHqkLO6yZ4VTZVLTYCr/Kqi1eub9IDBUpPo7IOODRLrsftnILnC9?=
 =?us-ascii?Q?2/2LpIMITNFLmCOswdugJ5BrmVScM1/XSduE0Z2EhrZSb51F/ulx7oG6/Jcc?=
 =?us-ascii?Q?Lr98PK0QNc0GRAtJfUWBpaC2+1ZFP7jkCPF4MLppBn2ptoszXERNhIx67RNI?=
 =?us-ascii?Q?M6OjFNXC039r/nGbQ+g1eg8uqGNqjSRAqE33BsomsAjIF/2XV99OfOUrSLUB?=
 =?us-ascii?Q?lcD1grhc4mT6QHS/Dhn3Gqj0Zco0PfHQywjNN2B7RE8GwG4qQWvStVdNPXZN?=
 =?us-ascii?Q?3GAv0kL+z0ngZ1IaGj1fznrudFTubAVXswRp5Wvz5BMOUvo026DIj8z3I72M?=
 =?us-ascii?Q?HU0AOlF1Zb5QH/a2RXtk2svkT8oiRPHJNW2iCu1xlZLIYAvxTJcA4aTw9oti?=
 =?us-ascii?Q?W7IzavosUkprTXigYEtPMGSjFQOxJ6rP2YdIWFg/JtDwxh6t+8+JewQ/b/F5?=
 =?us-ascii?Q?gKFLCH3snlqq9z23EHT06OAudePUN/SrKYnBqKs6A3Xhq7JQbX7gB2PDG7Vg?=
 =?us-ascii?Q?EHI7ThWwjC1F02LUWeK9TfR02hW0PqNORv5W0HlApU+SwBI5YLjtErTpdJBn?=
 =?us-ascii?Q?JSnpKnGIVXAyYULTi2amhef+KTE/fZN/wq1G1sHuhn87MYIT0Q6W0R4tYqun?=
 =?us-ascii?Q?UvtI9Wnu/teouNQFadyz8OYy1uyE8rgespvnjYYdeGFwiBmTkjkjJ3fl7j+A?=
 =?us-ascii?Q?gfwo88hxYuGFk+mKxKWA5gm33gbrySgNig2y38l/Xpqtx3IZH9Xn9psrXvc7?=
 =?us-ascii?Q?srnJ5xIIudhMqs9xAnD658c3ocErUJ04tv4KjweQ+CINU4BidAZwS+GvyoK0?=
 =?us-ascii?Q?nBacUHcn5u5BU7k8WzKfzXEtwjwpnAolHhlnbOx3DWGyFxJlOA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8zP3sv4UwlQRBfI3oLFEXozVovzfMPWvUUC3UT0aJfAjdIhwFQOiv4d3CKwv?=
 =?us-ascii?Q?vvWbxksz497cBDqw8nmK246lZHggfqbb/m11WERw8dHoYHAazUMCuRK6A3JT?=
 =?us-ascii?Q?aCVKCsA92Fba7jhLs78zL7xLn8lZ5+h6/+nYNPB9nkxXsH+xBKTcxNU5g9Qo?=
 =?us-ascii?Q?gKPcp9e/jyMU1bXK7elFcYQTB+oVa7IVqRTDBixsAawe5lBjIdbkZrEQeLea?=
 =?us-ascii?Q?ASu8ph4DN9FsO7LhOeByI3lNuWJ3MOMqUsDy3NeX4JgQbqAlHH4XtnlxlkXy?=
 =?us-ascii?Q?/8tPUQhw7YQH55uIb98EWv9h/fQR66+DW/DSPDvCuXntD4TRV5sTCUQoEK3Z?=
 =?us-ascii?Q?v6kX9i/k2I1R7mTPjlxtehHZb7gkUILO3ugyPt4e/8CTPlF0tZBcn/+QiITp?=
 =?us-ascii?Q?65ZFatUByUQlWjCnjA+2jT5yLiDTDZqqUqcU07OTrCdoKg/F0MbaTvIMORiM?=
 =?us-ascii?Q?jQkAV6semxiXExBgMnIpfR0qN7f4QvefjA/EM5mcIboET0c10CaQVwpi5XS0?=
 =?us-ascii?Q?/YFVqWYpnxt1O1eAgV/ecKQjzPKga/0MLoh2jrHPhJq+ov/ticqOyJTioaHq?=
 =?us-ascii?Q?TpMFUGb6gHvh8+vlsu08VH7TaKNmBLCu/aw8oHHOiyY7bI9w98mnsr9uJ8YP?=
 =?us-ascii?Q?AP86Whr3qzO8C6gOy2NlKmHTNlaiJnFlGxVy8BCjC6v0/yQDy5qYaKs12JXn?=
 =?us-ascii?Q?P71Af09E3BQHUFhtkbKHJaSdMW/1tjTsNBV/6GAwLwpPldAaByvVCWE9balN?=
 =?us-ascii?Q?GYNODMRk1TGeBg+DQQPyXJ59rC/+oRtjIKQXN7t/gvKBSdIc+f7mxsHP6nhi?=
 =?us-ascii?Q?AIIZEtRg5upDBjqw2J3KJXKHV5rMqprvOkUyZOJ/FucLdK1Vzl/2EEEwl5qv?=
 =?us-ascii?Q?Cx2AR5JJ0UMF9Vy16txHF8/NFE2PMfn6UeDae+WutRXOZFOj2E4EJPLiaX/g?=
 =?us-ascii?Q?flbDlLJK2iT6yha+R7n8/8FeHIYQZ/I7BKM92uPLuXCrpQ0CcKEQmc+sWUez?=
 =?us-ascii?Q?nlt0BqI33Jv875GbD5QaGmTIgXTLM2EEsf6aT49jxSPcqUqzZTn+r2NOo63U?=
 =?us-ascii?Q?VOWqhO4IgL3r58tYLv/1Yr3K7YvS0SAjUyqyiayLoYnCdUwUZQHl4CzzUmVr?=
 =?us-ascii?Q?ErtQpAmCL/ByrtsTGejjeWR5YI2OdHuAMsFxrlMFz9oWj4OpJ9ksoIviYkMr?=
 =?us-ascii?Q?BdT5YZmOb3zD/GVijmgTj6kNL1odh04tk23SbgJNJjMkRgXbcj76AemaBqro?=
 =?us-ascii?Q?HI0mFMW3aQRVaM7IOeWF0lOcK7YhjaQAKAuWqK5p6vv3mHGr5Jf4DQE11bK/?=
 =?us-ascii?Q?9Yj0jG7mGJtWLJzaJ2TTOX1Rjbrj0ik+vCPGBpVWpncWC1NpuoyJUVRETjr+?=
 =?us-ascii?Q?aeDdzF2aGcGxaTWUO3Oj2IXlCFKhfkCJaIHwtzgQliAqW01VXCdU16wcaCQx?=
 =?us-ascii?Q?dTXHfpCTaWQnbmAjyydR9FLmS+XSi3XSwcxWodDbZ2Z269L+j7Xs9PHJCEMV?=
 =?us-ascii?Q?h84XvRBWagh9qDLRIax64BMVbp07doiFa8Z79v/omvJlIvik1KtY0hRnHta7?=
 =?us-ascii?Q?vIPFHsEJHgoKG3y4VSbuH0bWp0Bd0mVxqEqxTRp2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1432b738-e329-4b56-63d5-08dcc8e9e683
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 11:50:09.9819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJYPxqn/PbnTYk3LInvLqrBnGCPB8F/4jbPI9KoZGNDrOjqYfdpXWmk8KWKpCDmp10NgN4Z1ReU5kpspGCtwqD7exfzpWTXqvJ9g1YI0NmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7852
X-Proofpoint-GUID: 3-B0G-N0km3myoWYkQeEoF358ac1AKeT
X-Proofpoint-ORIG-GUID: 3-B0G-N0km3myoWYkQeEoF358ac1AKeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=794 clxscore=1015 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300090



> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Thursday, August 29, 2024 7:36 PM
> To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Sa, Nuno <Nuno.Sa@analog.com>; linux-
> input@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Artamonovs, Arturs
> <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> <Oliver.Gaskell@analog.com>; Conor Dooley <conor.dooley@microchip.com>
> Subject: Re: [PATCH RESEND v11 0/3] adp5588-keys: Support for dedicated g=
pio
> operation
>=20
> [External]
>=20
> On Mon, Aug 26, 2024 at 06:22:00PM +0100, Utsav Agarwal via B4 Relay wrot=
e:
> > Current state of the driver for the ADP5588/87 only allows partial
> > I/O to be used as GPIO. This support was previously present as a
> > separate gpio driver, which was dropped with the commit
> > 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> > functionality was deemed to have been merged with adp5588-keys.
> >
> > This series of patches re-enables this support by allowing the driver t=
o
> > relax the requirement for registering a keymap and enable pure GPIO
> > operation.
> >
> > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Applied the series after squashing in additional changes discussed in
> patch #2, thank you.
>=20
> --
> Dmitry

Thank you!

- Utsav

