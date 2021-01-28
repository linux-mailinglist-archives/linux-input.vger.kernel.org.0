Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714A0307857
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 15:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhA1Okp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 09:40:45 -0500
Received: from mail-bn8nam11on2066.outbound.protection.outlook.com ([40.107.236.66]:51645
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231309AbhA1Oko (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 09:40:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDPe9mZTCk8LMcNezVs2qwnVh4WWjtEVC5XYdUiDv0LRdkXDrQqBTulrtyL+dDk9KyRcXA+NcGNA8bac5BBwHIEm7KPmABx5ot2jRDy+sws3LB+WcDS54AeN7/g1Ixg1DrjC88QnPP43nt5MehF03zRjJ182jyvBGxV7yeGwE/e0XbhDKgz2/NDhcA4/h5MPKqMy6vefAEQKw/FkBckvfcWyTFtGJRsNmPOHjRTfevFn3wwaz3KsXAXIkzKZRnXbqq5S9oXb7Q/Ox+/W8NipKFyYsGRK2a+m4qvbfqExMOnKoHopFHCf9gwOgzkqrkahB8N5EpBWPaVo3BmYC3Cqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVOvS5jmWQ0hZA01M/V4u4ErUTYfIJ5iyz0pVcNIg4c=;
 b=VxAkd6SXcTiCWYUUsZeAF6sF+IrshTQb/Me5XyNO18cgVxSz/Z51bePzmYZiwM6mLHpdxntM5Ogw+SfpyUNcpkhka0oYK1uQCcwQIhbSWhpcAx+vO62XkCrkjCgFtwLX++tJThqylnUqXkfQP4TzI/P5vdH79as5ywSVDRnaS4k7+GyCpFFLGiKFdPiyGMSNBgCTBCLhN6V5rjprUOrbMF2DcyopBdDNdg0q0F1TXq7eD5YUq5ZCJFGoYuj9q30/BY2gVNPoXl9Aw8FxlU9Y3bgqBTWyjawSm40+o2KI+Qm5j4RtXB4PiS69YOwESlf+dMJ3RGyJi6NCpIl5q0XLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVOvS5jmWQ0hZA01M/V4u4ErUTYfIJ5iyz0pVcNIg4c=;
 b=Plk1m6w9zqSvacMSYiaYVW4fKzY857FmD9DnONY9PRzbOX8CFTcwz4Qgfh/DZsWcuAGGLPlnyG8set0MPVPaTWEaV6Lh5bY6mFAe2dK6ARz/df3YExoouGgoIi0qVQsru3l+0fw0+SMaVL5O4xGh6trCAXNkgHgUqI5VHTstwKw=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4094.namprd08.prod.outlook.com (2603:10b6:805:1c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 28 Jan
 2021 14:39:51 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.019; Thu, 28 Jan 2021
 14:39:50 +0000
Date:   Thu, 28 Jan 2021 08:39:46 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] Input: iqs5xx: Ensure error_bl is initialized on
 error exit path
Message-ID: <20210128143946.GA14625@labundy.com>
References: <20210128121903.636652-1-colin.king@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128121903.636652-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN1PR12CA0107.namprd12.prod.outlook.com
 (2603:10b6:802:21::42) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SN1PR12CA0107.namprd12.prod.outlook.com (2603:10b6:802:21::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 14:39:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1249f60-1278-425b-c1fa-08d8c39a9180
X-MS-TrafficTypeDiagnostic: SN6PR08MB4094:
X-Microsoft-Antispam-PRVS: <SN6PR08MB40948EF42453B947E5EB9461D3BA9@SN6PR08MB4094.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvs/ZxzgiMsS2h/yKQsZg99Sf2Om7PmfMkppJevXX8qV/0PfNwsIcwAWMWc74OhnpVoKGYZtTSPnaldBqDalhjXegHCoR3ruLIOz5ifMVF+Ep233bJNYMG5HVtJITqs4ZReOhRcpBYpZYuvlNT4kdBRaYpCiOjK8DrQpS6DBBRuqcrF9fl5jTWCwttjLORLfefYdcbfZ1XuUBpSSzi/UHlWgY6flIwdAvYWK1ZF+VGOH0ORnzJuCWTwzhZbXz/aRx17vECTbGwibUKtRs8j6mfpRD5wju19wwSaNyNGTA6aGB5HDD1t3aqkHwGYaO6yXBgP4jsAyGERy00GNcRvfeZWfc8TJw4ZEP8wWZTeW22lecKwtjpHbs/j6JNa80shR06a8bKwNA8IgKsVAlx+j2Gqk8Xygy9k45l4nfIP2oxUhNVllaMASAqJpdaJBteQ30wOlwnwk/gcch48SZCe/OLzBQRfnODFrScvxyviC67kIxRFkbTDobfSf2/Cc5G2x74F7HGazZG8kHnah7F1Xcu930E4ftmqIRW+DOHs4hJeLgBd4A8/7hkLtUfujjM2HKvgjO9ljLdT7nUrbSus5NgQkA3ZyMGSnxC9smGDK/34dgYLZIzLs2vjlV1wFBvRG1iH990taZlEGpFZS+jjIjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(136003)(346002)(376002)(66556008)(83380400001)(66476007)(5660300002)(33656002)(966005)(8886007)(1076003)(4326008)(478600001)(66946007)(6666004)(55016002)(8936002)(26005)(16526019)(186003)(956004)(2616005)(86362001)(6916009)(316002)(8676002)(2906002)(52116002)(36756003)(7696005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zyeh25sXUGab8UlGyTyJx9LZu5tKRljIgSmAAyqsmxASC39zwUpdcXe2HVod?=
 =?us-ascii?Q?8LOAy9fpjG6ZrpQT7XzUcIm9snoEzRpvI2S58IFqNc/r7zJVy+sqCpyS7iyK?=
 =?us-ascii?Q?WyLxgbGBYcUDJyXZ7y6SYx9kQvilrhhmcTG0cvME9nQcOvoKYb5a081btxyC?=
 =?us-ascii?Q?YwttUrXlPK99S9pPZ3H+2IyfciHMzJ1OeBgEyLFbuMkhnL7xmWAflEqic6FS?=
 =?us-ascii?Q?SKBbHT3ref5yDdCUTI0SmINz5tHzBkiGqxpHLIx09wdJwE9V7jJrBH+tln2G?=
 =?us-ascii?Q?OpQqzvzZFEhUMA3W81g9yhb5XsqkzZlF9Cen8D12QCpRbNukynlGWRTLryax?=
 =?us-ascii?Q?PO9y1/UJdMb6RH55YGVCRq3sPx/VWAerJ5ImD9iTVgoSYCP2WW+8Ns4rf8Xx?=
 =?us-ascii?Q?YNq7bwhm6DGI61N4XwBpbsLt4Jnu48Mx9vGDB0FYkdficRnDc3OWxJpBcdh3?=
 =?us-ascii?Q?seLgZqiTXt2qREyFn+Q5QVe0Mgem6PtnxOcXk3P1ZJrILQotnt9Lf9El59TR?=
 =?us-ascii?Q?nTK/R8CTjl9xutJbWGVg5xSfT8Zs+hIHmJUZZpgFz4Wch34GfK8EUsU2q141?=
 =?us-ascii?Q?KjeVvSN/bwBmQkSmwrfyZaUw42yqwAa/tcVxs2x+79JE00w0SQ1FQNDkWtUw?=
 =?us-ascii?Q?e7Iy1uHCRlum9ClFUolERsnluQizGO7oFaibC3sSJj4oOSCWu57KXrq+vnmg?=
 =?us-ascii?Q?K/JHICUFOMWG/vNVQGSr9LmcwaySHHnM9u4bXTeOGAcoMo8v5x+N9M/rJyYC?=
 =?us-ascii?Q?+SKFoqa38HjPFLuavniXRgIZUthg44u9UNqLw+5XhXydqjBQ6zMcjTnomBVB?=
 =?us-ascii?Q?Q4IMluScOsv6oVHlRyB4EGFmEeXV9YbaZrvxW+JO8ZnZfBdP898XYz2si9CR?=
 =?us-ascii?Q?TRp2b6OBZyzCko8zyQufc53kpFhv6tn/WAwB0qJtw+yFz395J0xT26p+N9iu?=
 =?us-ascii?Q?XiSYduzrzWHYyEOW8wSnC3bKViBvV0i+G1McBYeDwaREo0sNsqMe0s7f83OA?=
 =?us-ascii?Q?DWJLMv/7nmPShYC7gsccA39Euzo/In6eyCqiX71shhYBZ8KYGio46Cz3F4nP?=
 =?us-ascii?Q?SK/Aws03?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1249f60-1278-425b-c1fa-08d8c39a9180
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 14:39:50.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGkvrEb4V0WX3QXW4J7M1IfH7FklFDnA9eE7Wz4YGgIYgJG9Qy8StxPcdyjt1YqXDImVELyueI6lqasTAiPQRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4094
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Colin,

On Thu, Jan 28, 2021 at 12:19:03PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the call to qs5xx_fw_file_parse fails the error return
> exit path will read the uninitialized variable error_bl. Fix this
> by ensuring error_bl is initialized to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This was fixed in [1]; it just needs pushed.

[1] https://patchwork.kernel.org/patch/12043701

> ---
>  drivers/input/touchscreen/iqs5xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index 05e0c6ff217b..54f30038dca4 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -852,7 +852,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
>  static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
>  {
>  	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
> -	int error, error_bl;
> +	int error, error_bl = 0;
>  	u8 *pmap;
>  
>  	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
> -- 
> 2.29.2
> 

Kind regards,
Jeff LaBundy
