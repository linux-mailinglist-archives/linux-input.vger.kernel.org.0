Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8A65FF411
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 21:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiJNTYQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 15:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiJNTYP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 15:24:15 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E221B6CAB
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1665775454; i=@lenovo.com;
        bh=9zCtI6iQOG5q0Q/3G2f9JQXozgJ6PrdZuQ44o9wRI0g=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=NIMAiviDsConWvkimYoSuDf4M3lC0raIcXN32ID9UQ5idyK4YOwuScodZK7/URjRR
         /Kz1hV7Sp9WaPrQZp2LNQF8bWfYs6gwHRPqedRZJm5s2De89XYYr6j1fFVUrnimRwc
         xPlSEE9oqGWq4pwiROTfsg8BYE8UtyHfTyaeCNwNDqzgDiUUHwt3fjrg72bdOn2agA
         TlzWJknd1ZcTXKlvsUPK8IVH0jXMwNj5x9z/PPXP8UziD2GwokWL+wSf4Yt2uL04+H
         mEv+yJFgyTc+WpwbSNkrI+zjOS9deEOafQHBM/J25isUlxVTMlK1NfmfNGz56gFN0U
         nxeTW/GiMtQ0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRWlGSWpSXmKPExsWSoS+Vpxu33TP
  ZYL2jxeFFLxgtbn76xmrxe8cWNouNh3+wOrB47Jx1l91jz3Jfj8+b5AKYo1gz85LyKxJYM45t
  vMBc8Jqr4uv3HawNjG84uhi5OBgFljJLHO5ZywzhLGKVeLq+ix3C6WOSmLn9NSuIIyQwn0mi4
  cpPJgjnKJPEntszwBwJgeOMEt2H1kFlOhklfrw6xQLhTGKS2DjpFjOE84RR4v+RhVDOA0aJnz
  PuMXYxcnLwCthK3Dz+kBXEZhFQlbjy9xM7RFxQ4uTMJywgtqhApMS+lWfAaoQFfCU2HvwDFmc
  WEJe49WQ+E4gtIqAoMePsfqh4sMT/BRPBbCGBUIk9R++zgdhsAtoSW7b8ArM5BawlXtzaxwRR
  rynRuv03O4QtL7H97RxmiF5liV/958FsCaD4paPToOwEieYpRxkhbEmJazcvsEPYshJHz85hg
  bDtJa5eugFV7ysxd/EGqLicxKnec0wwM3duvM0ygVFnFpKXZyF5bRaS82YhOW8BI8sqRrPi1K
  Ky1CJdIwO9pKLM9IyS3MTMHL3EKt1EvdJi3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMC
  ElFKUYLeDsX/ZH71DjJIcTEqivBlbPJOF+JLyUyozEosz4otKc1KLDzHKcHAoSfAybgXKCRal
  pqdWpGXmAJMjTFqCg0dJhPd5N1Cat7ggMbc4Mx0idYrRnuPKtr17mTnO79wPJB+cOAkkr61fs
  I9ZiCUvPy9VSpzXcRtQmwBIW0ZpHtxQWDK/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd9
  NmoCk8mXklcLtfAZ3FBHTW0lNuIGeVJCKkpBqYOCq9VT5UfdPb/7V67c2LeeoitxQjTn35XN9
  Yrv/Na33IvLpHs24FqNbe+M5VeeS7/APLU0fttz2O87PhaZo1sUT1wfQo7VlPqm2+bNi+upE5
  a4JvrMVcgxf1sQdnpH/pn335WVPalI7l6t89mi/ubNW/b7r57ZuSPxca7u3KZVskumFmh8VVc
  afbmlXcuws+cbtJTZ5+w2ipmnmdvab1ctclpqUul/5duHW2MDJr2uz2Y/PNE5RnqDx9nb1k7/
  L8rS/m2rxglNKOeViq+ehny57DP7g7ZBoP+la4iS9bUs4RYnsjRVivsve/wRGuOUnNce2OG8R
  fmEqejnPRX8fXyi3uqHhgl/29V8cEeCyXKrEUZyQaajEXFScCAAvb8u9hBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-655.messagelabs.com!1665775452!386986!1
X-Originating-IP: [104.47.26.110]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17691 invoked from network); 14 Oct 2022 19:24:13 -0000
Received: from mail-sgaapc01lp2110.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.110)
  by server-9.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Oct 2022 19:24:13 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVong4M0Ep1xyJZf6m7E7yhtn7iVy74kxmhSTMiDEZmdxOwkU/VrDphUsWzuhLAuV8b7ePGci5iivZn2YtL9OwgGca2WWJHr9/tjLpuThSQlTrIo5ALy9O3em00mA5odvO9Sz8IyFdC49ER46o834Np9pnw5FDml1SLrEUxcOZfpTCsAuPgAoYLla+opSuRc5PQkKU+GQSoiIPvHRtmVYYVx3hXJqHrKrhLBCqabQnUEadthMqHE78s/W21srfihI1bavQqh4nDgKUakAXgNcn+dbWUDyR6QDTr4XYqBV2hQaRejI8CIt9a4/CUQdkeMgl5Svz4dalb6AA10sSg16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zCtI6iQOG5q0Q/3G2f9JQXozgJ6PrdZuQ44o9wRI0g=;
 b=gsVnfn/zPYpIWUaIX4h6iLzh/5F9gBTgJIXIIX4KhBjdwlGT8HCxwm5L2BQtCuLN403I3TvDHX13v14SM4RhL+mdTY0+yYRDQBDq5maBr4gscSywVbRR7HbzFcI7YYacgWZdRhIZkkCLgcVa1WnQncQG7oH+aBiwrSUB1OsdWF3LnSoLczL6EVQs/lHQflN9B6dtT4v3Zwz/ZwNcudr7qV1wcTm5ZwUguabhU8OZe+eEQ1WAMWpNe4AOQrtI0wFOMteqTud36+ICxPJHt8f3STRK3KLFjURzHyM/JQT4rB9IT+UDktvdOL24BI8XPRPmbL66+G6g+RkA+MwIwKrHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from TYAPR01CA0239.jpnprd01.prod.outlook.com (2603:1096:404:11e::35)
 by TYZPR03MB6496.apcprd03.prod.outlook.com (2603:1096:400:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.8; Fri, 14 Oct
 2022 19:24:11 +0000
Received: from TYZAPC01FT012.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:11e:cafe::44) by TYAPR01CA0239.outlook.office365.com
 (2603:1096:404:11e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Fri, 14 Oct 2022 19:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 TYZAPC01FT012.mail.protection.outlook.com (10.118.152.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 19:24:11 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Fri, 14 Oct
 2022 15:24:09 -0400
Received: from [10.38.98.42] (10.38.98.42) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Fri, 14 Oct
 2022 15:24:08 -0400
Message-ID: <eef66090-15ac-a53e-4677-f1f2620fb965@lenovo.com>
Date:   Fri, 14 Oct 2022 15:24:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] Input: Disable Intertouch for Lenovo T14 and P14s AMD G1
Content-Language: en-US
To:     <linux-input@vger.kernel.org>
CC:     <snafu109@gmail.com>, <dmitry.torokhov@gmail.com>,
        <mpearson-lenovo@squebb.ca>
References: <markpearson@lenovo.com,>
 <20220920193936.8709-1-markpearson@lenovo.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20220920193936.8709-1-markpearson@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.98.42]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT012:EE_|TYZPR03MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d85165a-214d-42fa-5405-08daae19ac4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRySHr34lWtM3iAg453ULNkhjflXuhH3GszIWIa4f8AaDpQWN4nRDoMXjuHVZv4n062d5ETyRxSYIU/vAi4WFEfMdl3izVsylmeuQ7kPplOdzHFhPxbefyKzjzowLMv08UhU/dzuvOBK70e3ezM0tHuo8u9CwQTj3Q/83awYBx4dxFXvzub7zL9+CzvzKvE5X6togtl4duUnPz9S/eyS7a0KmndDSw3HVTC9QCNtDxnQoJ4PGf3DYjcWtxov2w4M/6WNW82eHP3WNzYk392uyGD3WQzYR1zCCQ8HhsnuNo23uUoxJQ7qlr4LqmfxALXgA9iwhK+2FmQ4WrC9GPSr1MfE3tSMu/ryxEN9PX9ElPC6/A39a2tFXSIyiEEa8O8oystErDnlwnmNxT+EaC4/po2yUFzRJoYKfBa26LRn1ffR5RFfWSrE70eDi6lX4fXo+KJfB5Rsv6Uqnac/FBxoz0PVe8i/pWqCX5Fg62JUUraIwNwUlvI6fTj9p9/s50GTK8RHRvGvSXOnHPVBpaeq4boTRGKVuJhsGYjtU0GX78nKUT6qujHCFq3H7QwzsEMmz/3Fw0BJ4BFhsR+fDZGbdwg+MDBe7Edkv7GAG1vi33nSOAS9tKoknQzDi1lH79kh3ygk6WlZYw3DAvQR3kaLoqAhQ62LsCypVOlkIYOWbpTkcqT4O4E57kOpz8CcbPxjRKAWD2XUb9MA2+my2fQW8iHa0+ExH1iJMkZrsfKzx8IeMhw+YpbW7EVNeeJGKfqmnNFQWTn5AJ7+iYC0Te0JJq6cRp+dAbpmjl4oB2Z7RlyckGrGPx0i9opbBJaXAowiqSYmqIYgkiKvt8oLIHr6m4q1EnlnDjHaFZLdSYwgfos=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(16576012)(36906005)(316002)(478600001)(31686004)(6916009)(54906003)(4326008)(8676002)(70206006)(70586007)(53546011)(41300700001)(356005)(81166007)(26005)(8936002)(2616005)(186003)(16526019)(426003)(336012)(2906002)(47076005)(5660300002)(36756003)(83380400001)(36860700001)(82310400005)(82740400003)(82960400001)(40460700003)(40480700001)(86362001)(31696002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 19:24:11.0736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d85165a-214d-42fa-5405-08daae19ac4f
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT012.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6496
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Resending as I hadn't seen any reviews. I think this didn't make it on
the list as I can't see it on the archives :(

Please let me know if there are any concerns.

Thanks
Mark

On 2022-09-20 15:39, Mark Pearson wrote:
> Since intertouch was enabled for the T14 and P14s AMD G1 laptops there
> have been a number of reports of touchpads not working well.
> 
> Debugging this with Synaptics they noted that intertouch should not be
> enabled as SMBUS host notify is not available on these laptops.
> 
> Reverting the previous commit (e4ce4d3a939d97bea045eafa13ad1195695f91ce)
> to restore functionality back to what it was.
> 
> Note - we are working with Synaptics to see if there is a better
> solution, but nothing is confirmed as yet.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/input/mouse/synaptics.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 434d48ae4b12..ffad142801b3 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -186,7 +186,6 @@ static const char * const smbus_pnp_ids[] = {
>  	"LEN2044", /* L470  */
>  	"LEN2054", /* E480 */
>  	"LEN2055", /* E580 */
> -	"LEN2064", /* T14 Gen 1 AMD / P14s Gen 1 AMD */
>  	"LEN2068", /* T14 Gen 1 */
>  	"SYN3052", /* HP EliteBook 840 G4 */
>  	"SYN3221", /* HP 15-ay000 */

