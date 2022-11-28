Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5768E63A1D0
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 08:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiK1HOx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 02:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbiK1HOm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 02:14:42 -0500
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD1413F04
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 23:14:41 -0800 (PST)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2ZsUA010150;
        Mon, 28 Nov 2022 02:14:31 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3m3gacympa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 02:14:31 -0500
Received: from m0167090.ppops.net (m0167090.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AS76Fp8016840;
        Mon, 28 Nov 2022 02:14:31 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3m3gacymp5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 02:14:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE07TOMStD5oZo8+8L/huGvvoFOrWiDA9rQWczxbbi+MhtLWh3o7GORKhs8yWd1H5N/HvW/sDXf+ZJ49glKxhmKFfN6xey9oSaL6CGUnPrXsqJBkCwcUFDjTKns1/aAC4oHQ1i0ZE/jkXjnf6ZppqfaS8CdC8asHORfqR/YrQS+I780RjCo/mr8MHPbs8MPT2WLq4eoPnRpqlnthWub6xtCsogJqefC0WtqpfJtzOb2RHA/mbjBDsHU19TNZHQM1qwCZLrSpqszaoNCEn2l2+oPTFzqV8x15+41HVnhtVuQjjPnMrPgaLt1ZbJsrpiKJA5NP3kBKk40eGCOxbZAj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edyznfy7X3j0zt104Z4Za+u37g9bMDykPs++FTt7dRU=;
 b=A1p08yoWv+GSGjx4kKldwEndqiX25eviRGNk5eCPvk6lzi3+O1GSbvbuSAv1fKDEwn9vD7z8dncj67OFQQFzpQOp+tYwXndGAfXYu+6+PmtgnDHMlWb/qN+bOzsA/SZcqB+1qadX1bP9wGODSNQsPkuopJJF8letxNHK+NQb7JMY85jETrIlECcVATCGbpqrkyPow8q6isqDRWSZLKALLwbMjdEaNq59Dt/IQNJlPoi6BqTbP0auGCv12ozHbM5mBmkzyuQRgXlR0MkirwLrI2IaaeFo4WtXnLaryAaXihRrHogbMB/JAV8oRaZa+eMbubcKP1AciuqmcFv+p+tujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edyznfy7X3j0zt104Z4Za+u37g9bMDykPs++FTt7dRU=;
 b=X3hgnRale2HgF4Qs/A3Xjcaz7F0Xk+PXzROnykQJuLzVo22sx06mxc6lg40ss+RWypguEZW4w4ne+TKPGmI4GvKohPt9f9SdVeNuTO2SPrJJA6uZ6WacrXEzglG0CT7z1//LImvs6R2WIB2aGbp5C1FXslTE+AvW7qalLICUh2I=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by BY5PR03MB5094.namprd03.prod.outlook.com (2603:10b6:a03:1f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 07:14:28 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9605:ca84:2a4b:643b]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9605:ca84:2a4b:643b%8]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 07:14:28 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: RE: [PATCH 3/9] Input: ad7887 - Fix padding for DMA safe buffers.
Thread-Topic: [PATCH 3/9] Input: ad7887 - Fix padding for DMA safe buffers.
Thread-Index: AQHZAmyXieaXmAY8b0G7rYuom4C/065T7TEw
Date:   Mon, 28 Nov 2022 07:14:28 +0000
Message-ID: <SJ0PR03MB62530406DC5267E2A239E31E8E139@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
 <20221127144116.1418083-4-jic23@kernel.org>
In-Reply-To: <20221127144116.1418083-4-jic23@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy00YTQzZmQxNy02ZWVjLTExZWQtYjcxYS1iY2Yx?=
 =?us-ascii?Q?NzFjNDc2MTlcYW1lLXRlc3RcNGE0M2ZkMTktNmVlYy0xMWVkLWI3MWEtYmNm?=
 =?us-ascii?Q?MTcxYzQ3NjE5Ym9keS50eHQiIHN6PSIyNjE4IiB0PSIxMzMxNDA5MzI2NjU4?=
 =?us-ascii?Q?Mzg1NzEiIGg9ImlhRlNPbmh5R1dSSzFPOUpwblNsb01OaXRmST0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?RHJpNXdNK1FMWkFiYU81VjByUTdyRHRvN2xYU3REdXNNREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBWDVsMkt3QUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|BY5PR03MB5094:EE_
x-ms-office365-filtering-correlation-id: a32b6912-a913-40e3-e627-08dad1103022
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h/UuqhcllTcdyO015uel6w+MNpyxfVeckDKrxNLoZs3UBADhtHZwL9nXByvQ+9/tq6ggP0ZD3fxQhEcAhxDv4mUJxMynLeHmSmj3aH/4Ry27CiedCkbcT88KY0b1Z9bQdsZNrsk518JGy0vZRM10Wfcbxk/uiDIH7r243i6xREH60MRMY9LeAMo6437L6lncebP5mzEpbMrQjUrgNKWbhcpRbg/Q6Jf7lj1RCKfkzRZ0dvIYqHaEHm1q9gO/FE1cHv/n9Zm8+RLnY5OIMwKH+1wDpRPomTxlCDJ8VT+rFLiAAAviiwil12HwH74Gs+/KPHMx4hiGfeMAv5WwO/15UvAdgWt2vMzYVxop9w7duwv22Q1w7sV/f+JJLhkQ++X/EHD6v0ZWmQYdGYLP4Tf4FcRvV7uAom5xXOqXuMOdMhqtJmRvC0BbQjIW/JwcLigcDQ5jqxRqIoWjrclT9CFeEuyrScJhAcnK9epZOjLfvei6qcncWm0oXXReJseCHwD5GE7KyrzRmiuT+TqtbfMthKQPtPmXMsbohSQFnnnW73QUSqjc1YVuMFlHN8EqlebRG8vsOldjQHyYwdM0pVYjfHM5XU6Wk1/LLZFSjc1pcTqhzKHE3iPfHCfw8zsDwoBsZo7iPdCf3UnGFCJtuJgF5hfPKmlO6kevKOUj9nKlGanz6TPTJqAQoOT4a3LIwQfQrgDgJmLXOeb1xJ/FEsocRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(346002)(39850400004)(451199015)(110136005)(8936002)(52536014)(71200400001)(5660300002)(33656002)(76116006)(66446008)(4326008)(66946007)(64756008)(8676002)(66556008)(186003)(66476007)(41300700001)(316002)(83380400001)(55016003)(122000001)(38070700005)(38100700002)(478600001)(9686003)(26005)(86362001)(7696005)(53546011)(6506007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2lWXNygwNJhvDxZiC2gGHokaN+UCVRNRqs16+Cps815Py8Y1DIx2nQ8n55Eq?=
 =?us-ascii?Q?pEuyt3GMZmd5F+UX/XDC9AONtJY7jGQcAS8QaE6YcKh8EVYRe0fEDGZaKBYD?=
 =?us-ascii?Q?UZ/6Rdoe5vPA8wIafSmBuLoli2MF00wFAPgEu8IZaugSW3WfADpx6pYS3yMF?=
 =?us-ascii?Q?MOVfbkxahod7Cmtg4nLvNW12z/LfqQnes7eL8zImZio94UDsJSDELrQszKdg?=
 =?us-ascii?Q?8QTPPwIxM+ZyG313v0ZdQK/HuDWZotmxtcmAcG6YkohN47mA6VxcBuOglBAO?=
 =?us-ascii?Q?GJDMbknAWfNwoWs2dy4HztrqfbGlVF03yOhwFTHVl67H6SYPvz3nHmCCggOW?=
 =?us-ascii?Q?BoL6Umo7+P9WWthwZN5Wu9aTBeCAtE/O3B8y6SE373OZpzaZX/QUHJkEBH5M?=
 =?us-ascii?Q?2yg4zNiiWKItvJKZ7x0l9Agr+Q8hmrHtWBMi1+sZ3XOOkbBHdvrJ26X8bAl9?=
 =?us-ascii?Q?BNzuQWXIhBSdMFJlhU+anA+xL/CMja9sXvE7AwJHtJZ5IzGw3jqaZ7E2kk+x?=
 =?us-ascii?Q?QdXmnrAmzlpi5OoaQkG0BQhPKySSu/CVXXg/QnDIoL+gVht8WaFmV79YJC/P?=
 =?us-ascii?Q?CPJUqvUZOb1EYOgPmCDF3axvhuQhGGRJnSf5wNXOqvI1QP5TIRIqiU6qoCip?=
 =?us-ascii?Q?cnIJ32AIjrrNHRpnS5nE6WY7+4qf6a4v8uoBJyJxAVM5fiPkGjhwWIRISwGv?=
 =?us-ascii?Q?I5yJegPgmK3jmMjBlUUWhT3Xyb5oejHYFGgDslHUGsWlV3nC6XNUehq6bV7l?=
 =?us-ascii?Q?v/VxzhpueaNghcZatWON2S5gpvC/DLbDpzrIVAsWZ9ISE23sZYNbfoYbSi+I?=
 =?us-ascii?Q?8QFYXzVLJh/MpHT0qvSlj1MB/ibqLoutK0dE4xbb9ozWzrf8TBkqtcaO/z1s?=
 =?us-ascii?Q?OpxRTav4zggPQlh+exWKluiZut5mCaHw81nagDnE/14d56UulRMVVwwHaSOJ?=
 =?us-ascii?Q?LemHIJYsII08l1byhMN3uAn9GV/9THDwF08m87Lm/wRh0o7051zWwHOcGuxU?=
 =?us-ascii?Q?dPns9CbbyabGim9htVRdh4//qzQCfZ/cp9Up6yfDjHa0xAyMpsaioiu280ov?=
 =?us-ascii?Q?zLbJyloPEiVskRnZbwl/Pu2LllGd1+xAJmccZBR5CsdkzC/vxI/QMco+qDmP?=
 =?us-ascii?Q?yeDhFlq6veerFmHYGfqJNsPgF35BkKT7bD1w2nrIuYQyX5rGoD85NjbfKLzv?=
 =?us-ascii?Q?RQ6uVhbJo9M+n+kXl67Z5twa3x4rQKVt8ST888KRnN39V1ofVMeiM40mZ58o?=
 =?us-ascii?Q?/TgQ9k01Yo7dw2GTb2Nv+q2bw6h7Q7bSO54BAOOMI6fqO3EbW52lGIcOzGXD?=
 =?us-ascii?Q?QuF5FWnm57DP2+JT+hoKwrNEPDlENMNDvESLw0eyd7+lnp3ecP5rtYGOSO5a?=
 =?us-ascii?Q?LNLqbaHK8OxEDVj1/dEjf1sOt+OTW8HS0tJejAjcwTe5ZBeQqecTFakvCFaj?=
 =?us-ascii?Q?cSgEIBp2NHXxabHybN1PyP14qDLvT4B5G6KTC1Pcvvd9iI+G/SyfkPVqcfmz?=
 =?us-ascii?Q?nwNHSGK1uq6rBgT1NxYJZTQpH4UvW6yN1zCZ1+hXWzFJCaiD2Wk8DAEsbwrg?=
 =?us-ascii?Q?zmrU31TPIbjWCkLlNuuq8RzgxKe2sOTi0zXDg99iDpLxQi9rXslKash9tSyB?=
 =?us-ascii?Q?Aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32b6912-a913-40e3-e627-08dad1103022
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 07:14:28.3309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iVSMayENV3aWE2diEVmEQztse29xGnGuhA4E3v994i+lzKGB63EyO17H7gIOt9PDUEr3NRtwrgX+oClyPCAAN02V2oOaeckyeV5+Acq7uuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5094
X-Proofpoint-ORIG-GUID: wPVQr96OehhSWu3Bg4pOYjbyStWv55Jc
X-Proofpoint-GUID: SZ890AfzuDHOPc5SB1BDvCHAXtJ0jN-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_06,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=975 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280057
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Jonathan Cameron <jic23@kernel.org>
> Sent: Sonntag, 27. November 2022 15:41
> To: linux-input@vger.kernel.org; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>; Hennerich, Michael
> <Michael.Hennerich@analog.com>
> Subject: [PATCH 3/9] Input: ad7887 - Fix padding for DMA safe buffers.
>=20
>=20
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> On some architectures (e.g. arm64), ____cachline_aligned only aligns to t=
he
> cacheline size of the L1 cache size. L1_CACHE_BYTES in
> arch64/include/asm/cache.h  Unfortunately DMA safety on these architectur=
es
> requires the buffer no share a last level cache cacheline given by
> ARCH_DMA_MINALIGN which has a greater granularity.
> ARCH_DMA_MINALIGN is not defined for all architectures, but when it is
> defined it is used to set the size of ARCH_KMALLOC_MINALIGN to allow DMA
> safe buffer allocations.
>=20
> As such the correct alignment requirement is
> __aligned(ARCH_KMALLOC_MINALIGN).
> This has recently been fixed in other subsystems such as IIO.
>=20
> Fixes tag is imprecise as there may have been no architectures where the =
two
> alignments differed at the time of that patch.
>=20
> Fixes: 3843384a0554 ("Input: ad7877 - keep dma rx buffers in seperate cac=
he
> lines")
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Michael Hennerich <michael.hennerich@analog.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/touchscreen/ad7877.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/ad7877.c
> b/drivers/input/touchscreen/ad7877.c
> index 08f5372f0bfd..eaf11dffb28e 100644
> --- a/drivers/input/touchscreen/ad7877.c
> +++ b/drivers/input/touchscreen/ad7877.c
> @@ -150,7 +150,7 @@ struct ser_req {
>  	 * DMA (thus cache coherency maintenance) requires the
>  	 * transfer buffers to live in their own cache lines.
>  	 */
> -	u16 sample ____cacheline_aligned;
> +	u16 sample __aligned(ARCH_KMALLOC_MINALIGN);
>  };
>=20
>  struct ad7877 {
> @@ -189,7 +189,7 @@ struct ad7877 {
>  	 * DMA (thus cache coherency maintenance) requires the
>  	 * transfer buffers to live in their own cache lines.
>  	 */
> -	u16 conversion_data[AD7877_NR_SENSE] ____cacheline_aligned;
> +	u16 conversion_data[AD7877_NR_SENSE]
> __aligned(ARCH_KMALLOC_MINALIGN);
>  };
>=20
>  static bool gpio3;
> --
> 2.38.1

