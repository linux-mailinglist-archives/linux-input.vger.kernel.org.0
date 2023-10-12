Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771B27C7376
	for <lists+linux-input@lfdr.de>; Thu, 12 Oct 2023 18:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbjJLQvC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 12 Oct 2023 12:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343912AbjJLQvB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Oct 2023 12:51:01 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04olkn2065.outbound.protection.outlook.com [40.92.73.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA3ABE
        for <linux-input@vger.kernel.org>; Thu, 12 Oct 2023 09:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOSbiKvNz9RNberrH4DtvlXP3/v1+pmq361pgbbtmZvwt9Vxgrs69oY9ApOUmb+1eIRH0zQaj+A2NEQb39DomhD3quoZMx5qfupWcws2p5P7g8a5fNcvej2udmcNS8nEffsG/JtPd3r3iCPGrrC19N/Gu6wZzNtDkVj71jLgelthJhgB0QxcqWP8hFXUPOMV4wh2mUbNTiD/vOaIWNbQfuUC+YBTE5ohdvI1DqDYqRRmYh0x8D2atF426cK6/ZNPl9d4/QH9FbJAmZHAP1GjdCjQhpg7v70edh4xrkyn+yFhP1SbqV/BBB9ckv7p2qKL4TuqJAds8dTIFUy5TO9YaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=echFivmQQnIqZ6iZ25GJu3d+swhxgcS3aVQeos0ZCAw=;
 b=FPAGAvqRjgMRW4BZATtFWvzu+jcz5b+ASDfu9oNncAE5deNOhcxbHi+utcp20hD/D3/EET/WHJb7pUa2+ng1BSLe+5QWDG4O7ZV5gkPhSP+tNVuD7a+TSCvvVeCBfbXHYrgcQGzW03jjaN+ppyYapIm8JcPNNyoA46u6o8Q3/j66ECoo34DQFnluv6OyYBKV/uD1T0np+NdpCbTGkggVZp0wm5A0mCtdllsxYlj6bw6heixCZay3hF06ZqI5T1Bjrl1V8in+1lz0G/GmMbakTRZ+LC6Y4aPb6CBL7ddr62B3Ly2hcKMo1Xb3FMPx9kclvAxlpP4ViU06o07icB8KxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB9P190MB1225.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:223::20)
 by AM9P190MB1076.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:263::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 16:50:57 +0000
Received: from DB9P190MB1225.EURP190.PROD.OUTLOOK.COM
 ([fe80::6369:4861:2444:1634]) by DB9P190MB1225.EURP190.PROD.OUTLOOK.COM
 ([fe80::6369:4861:2444:1634%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 16:50:57 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: PAYMENT.
To:     "cs@coindame.net" <theroomsparkroad@hotmail.co.za>
From:   "CoinDame BTC Trader" <theroomsparkroad@hotmail.co.za>
Date:   Thu, 12 Oct 2023 18:50:18 +0200
X-Mailer: TurboMailer 2
X-TMN:  [zrRafEFySXRrJKc+Vi5Ygmm3H4QxsYTn]
X-ClientProxiedBy: JNXP275CA0042.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::30)
 To DB9P190MB1225.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:223::20)
Message-ID: <DB9P190MB12252B4D4DC329B4EF422D9A92D3A@DB9P190MB1225.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P190MB1225:EE_|AM9P190MB1076:EE_
X-MS-Office365-Filtering-Correlation-Id: 375abf76-15c7-4a91-f5fc-08dbcb436154
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S3PZpZeSEYwYAO2wK5syrcifV0v6dDK5677KwsbS4S4tvIeusxapWQ2WP6QGMwmqgRPGIUjp1YEEWZ5Jrc8XVmJWAc/wtYU4gVxkms1PWwC4HQ0dKnVgbZmALVdW5oVUmQlK6fvnB6IzQy+/9MIx0T0w4kBh30daUqlOpmjWKnpmJD6Chws9srsJftF48sxY9Q2eNyHfJg8ylrH6BIByyGAzGaLF0pJS651JsVc/WDbHlwX+hlCF6ja+a1/CgAF9QTP8Hq9HWGSubWkJismb09seAvxXduPPqEMEvC1RJGx/t+44Qlo6qxUMhOTkK09KJwlHsO5g7WAqzf81pOqqLovOpi5WTdu+t2hTcQV/IltB2UfFtsonYSg2YAukCPyWyCnURXMcdREAxVfQosy4tgkmAH1Z/SEWrZuDysl7itPNd+B1AqH4aLw4ULPE+/77ag4zHho6SPoKZEXlAypCW2COJrqqawDfNaObW9z6NEyfF9SA6RHszCErs/8cr0GbuHoc0u0xBr3EwTooTRK++1YNcgzFvUaQUC8xNwijDEPMsg1faj4paRi5iaQau+JUzK7K+DwRXws8e+grr+xyLi7p25lMr9ihZIuNu1ZqE4s=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AZz6LHR1Xl1f/AsdEIUNgdASHCE30mAnqEkhb6y3IcJAE0u70LMhP8BWLv?=
 =?iso-8859-1?Q?crDJtLtrRymsaZONmiogFASWcH0TxVjJ6aYZtC68FqklgEXOT3tcyXWwti?=
 =?iso-8859-1?Q?mapzpOFduHD5gXLLyKqdmyTjjbINscN2dmAVaBZCwrbyGCMHcv+3w045ZE?=
 =?iso-8859-1?Q?bXpAXICVJrHMwmusGJ3bDrqVxV4DcLwxrfz4KuxsvNZmE7mDIsOjqFVY5I?=
 =?iso-8859-1?Q?HuE2mfgc4C15nNo3DMeJ07wOpRAoXnuFsqZvlMZzSU6AjxefFLHxWJc8+s?=
 =?iso-8859-1?Q?oQG5RgETPRbtFkvwHfjD4Mo35LAH+O6nQm7zqoVJPvbQ7NzBXwpaGWcAxx?=
 =?iso-8859-1?Q?tsemeCkEtgYyoTO2Jpwn+TevtIBMsBoDNQKU7CICixPcYTbrIsMoymmWZv?=
 =?iso-8859-1?Q?KWVJuhql8VziH03YBgtGx/NhQy9I+D8LMWWXOjDEZl07efXhiM10BaAYal?=
 =?iso-8859-1?Q?qinYXWnlypOHPGrN+EaaMcEMTlBZiK7/SOmsEZ0GnYBAk81eEHYfS7MHD4?=
 =?iso-8859-1?Q?q4p6Njgnj4SRdPJgZvLordhdS0zAgb7Dl+9w4nnlVqmNWhxO2kfXQ7d5Fu?=
 =?iso-8859-1?Q?54gdKK6atVxgczATMPxU2MsmLgqYr8dQ+vF5ln3SV96iTeZZzDuRn4+lMP?=
 =?iso-8859-1?Q?mY99H7aaGOx6hq+Cx/puqTwP3SpCFIpw5iyuyqpCbavX7lG5PfwWy8ZFUD?=
 =?iso-8859-1?Q?r+730w8MpX08MRPBAmYDDj3ARjSlcePz8hxNT3STRKdaOzrOub6jprGGvf?=
 =?iso-8859-1?Q?JbYLkBaAeAEootHeb2I2oMUzOyxdMm/CNvCKYFj6bDdBOFeapRoCxBVf2z?=
 =?iso-8859-1?Q?n0tcZZdaMwnrOHeJk543eb/N6IKPVvXQrM4sV7D8V2xBYJyjaMLE8cDOp4?=
 =?iso-8859-1?Q?GrhwfE1z+IvaO0M3MAuobWtauO2nXwF+9Y6v4/q7gvl+a51LuJzfUIGnqy?=
 =?iso-8859-1?Q?v6Sg0ZrXX2GdnCtTobWgxa1x/IlNCRwKnA+BI28bY5i6neJtaG57hAgdvf?=
 =?iso-8859-1?Q?YVOrl41unuAZjs/hUjWpcBN0ymN/rclQr0Tw82ADeCamc2KSgjV8m79EV9?=
 =?iso-8859-1?Q?8EHeMoxENLDhV5XBWa7og4gbv69kfv7WrADTgVB+lNXTCeRort30XDalA9?=
 =?iso-8859-1?Q?y0cLHxve1AOZ591mHVgmbS6YX8RvNygZ1xufOBcxgRly6z9OnSx1nEQMdv?=
 =?iso-8859-1?Q?EtMHRF8hkqx0/EivYC0YefKH0fVCvA+AO2x5FrdJGTt6CY9lALUqbkvVl1?=
 =?iso-8859-1?Q?pI1UlBBG8A/JkWlizyZiA65sNX2wDtnnYZ+LEEPD3HpB9Fo3Ogr9FTkdRI?=
 =?iso-8859-1?Q?FzFE?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-91991.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 375abf76-15c7-4a91-f5fc-08dbcb436154
X-MS-Exchange-CrossTenant-AuthSource: DB9P190MB1225.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 16:50:46.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1076
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,BITCOIN_TOEQFM,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Your Bitcoin Online Wallet has been funded with 29 BTC total of $ 750,500 USD, as submitted from CDT Crypto-Trade Account, To withdraw your current balance, and receive your account Login Information, Type "BTC" in a message and send to ( admin@coindame.net )
