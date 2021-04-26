Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349EB36ACB1
	for <lists+linux-input@lfdr.de>; Mon, 26 Apr 2021 09:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhDZHHf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Apr 2021 03:07:35 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com ([40.107.14.108]:17426
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232127AbhDZHHe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Apr 2021 03:07:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGW1d77nobwu8XLbS4d+YwsqJf/WEanvMgQbHzZ/Zpz8sgQ/bTXjOqKK9sqhOfyhhBdAEOgfRE8tG9u2Zx7+QTBQ5Bm4sFvyIUHuLzoJ8N4G0JhHiSYG1Xi3j4lYHMmxUxl2RgU+jtOOD6qlDGFMtDVDfic9INUku/yfWpVhht4UwMn22ZzQJ9d3nzqnw7R0YdXxTHhsf8yUPtcDnUbpg+dNIXLzv5jgBDRwWO7TsJ9OuPQojXDhPqWYcilp3tB33ZzoWsIpyiEWMBLvIy/+/FsJq1PpACC3+mnt+tj0G0Gw3SBUPq2rC/vP6jSBCkT0QvJjEWJ7kF4BUTYqoW7nug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHCWnKHSKArRcRnUmSERX6GqxEglF/OzsD+X8N4gDG0=;
 b=CBe2CqAgVqK/eFzRjIlOXwzln4qrnXG504GwpoQkHyy5ZPqO4PfdRXpILdylO2x0sMboM4kNrbJnyEowuBOybanX0YT1EO2RwVjBfMaVo25h2z88K7xich5ndXHf7hwUj/pAc7l1FnJuZceSDvCw5xNTSR+HAB3YW0Gl46xlugmw2z5ddpkI72mGcOjv7iHCOaS9Gyeau4+nUGDpTyQ3B1lTEgYLWIW1E/z8J5i4yPvIRHNLy3xzZDHi54S2qmZFMeAXwoimICd/qIQBuk3PIPsTS9+VgVDXlcDMsZAPTlLvD4rMsq0liHxa3GFmDVIG5+fURRC6UT2/CzA0daMmSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHCWnKHSKArRcRnUmSERX6GqxEglF/OzsD+X8N4gDG0=;
 b=SAtdZ0E6Gb41pJR3fFNNTVW8e4HvIEFC6yae6CJnsqWCb31/B4YTEsUwmuVCI+e/F7AGn1G8/eRI848ksmTVTdpPrK6tcM/1UnrOGe3yXxRNYQMGO+PXydc95SIcqNS2JO3IubBBzQvHm11eBZPBLsVzHwV430sqDA/JqKXxHO4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2771.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:131::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 07:06:51 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::888d:190b:b3b5:1ad2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::888d:190b:b3b5:1ad2%3]) with mapi id 15.20.4065.024; Mon, 26 Apr 2021
 07:06:50 +0000
Subject: Re: [PATCH] Input: atkbd - simplify atkbd_show_force_release()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210421201639.1541945-1-linux@rasmusvillemoes.dk>
 <YITTkui8qer2S+4R@google.com>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <7df61d10-6391-f64c-e54d-cb2022b71902@prevas.dk>
Date:   Mon, 26 Apr 2021 09:06:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YITTkui8qer2S+4R@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [80.208.71.248]
X-ClientProxiedBy: AM7PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::18) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.71.248) by AM7PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:110::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 07:06:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45a0e664-b43b-4583-2677-08d90881dbb0
X-MS-TrafficTypeDiagnostic: AM0PR10MB2771:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2771D42220CA18E99A9E4B2293429@AM0PR10MB2771.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fy7AfeubEZd9TuYz3oJUMMp2egCFvV13Sr1rCZoksGS7UW32i3MBh9hR18m7Ndc+i4lV/r41IeY7RK9K2CXgKe3STxswaeybkECiG9VJpepzqHSyPJ3BIXbXP5nSa09pUcHJ+pa1T8eoYPXt8aaeXBMN+40MTKhG3S4tFprgYqmuku6Ts+YnGtodUYtYIXC15Rkg0YQwCTV32m4CRl9HQI7HUV0TsB2XJQYYj1qR+LKFPNDHhCjtkYrAWulZjFNuZybUT2MnKwwMqvxv20KAxihMZDI1C1weTTo/X+Ddw7XD7LHzV1WEMlh5/UvJgdtj6SkNsOmEAeW8K5Zp2YZhDvFwEXSkjMPzSNnLv6BfemvFSSojIbY3ehGY5DRh13UNiMIPn6gshVuM8Nb1dXefKIAI8oYILghypM/X56bT5MVTyyaFX47HvQrVon5NpLUvzOOcdYxhIzqEaJyRiMf6SbCZMFyX+CXwRKarDSInHTBrPZOSUzmNyQcddG5z0qg+idYCoo0BHVCTNYscvptg+TTFIFiMWKFzo4MMVetk2mHHj/6JABqQ+2qKR0QgXNB+T5878JgFNfugHVU/CJxoxGaAKdF2uvcASv41PtB2gWIK7IR8fSHVN/bgmHRoMLkYtIP3R9LmFu3gv1hLpBQx7QvmY3YcVrGWTNmk8A4tXiNRBUCYcH/Wt71aJR3bEdEzHTfLQ54f/xnRcLCzDRTbn/zcHaTjhEL5nfJFKDXmq/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(346002)(39840400004)(136003)(4326008)(2906002)(5660300002)(38350700002)(6486002)(38100700002)(186003)(16526019)(31686004)(8676002)(52116002)(8936002)(66476007)(66946007)(2616005)(36756003)(44832011)(956004)(26005)(31696002)(66556008)(478600001)(86362001)(8976002)(16576012)(110136005)(316002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?svEIUXKpsBD0C8bqsE+SLKXivQtmoGbecExAfXGDdsi1ERzWh7DDQ/Zf?=
 =?Windows-1252?Q?vYDJp/eO67PxBeYWGXw6wd6m5fqQPwdjGcOK2PSkIPEoXehtbugc79Ux?=
 =?Windows-1252?Q?5v/i+3CG3NdPS8zkRNcBh5/o+XC/sJNgYr1lrSPfD+/NL5VSFaGge4Ac?=
 =?Windows-1252?Q?uz/2D1uVUbHiv1ZpN7AE92Y8ertLKBo7/iytlkqZyA/2+eBygp3At8Ug?=
 =?Windows-1252?Q?EQN0W+Mhft383hT867UKgmSSQ0AhvSobacQbg4Os+iijLHdnQpQKCoau?=
 =?Windows-1252?Q?wm+kCRuBGNmOWDnZCNV5dxnaR01A6EWEtEDnAe78M5yiwoUuaGwl7hKq?=
 =?Windows-1252?Q?br8lSHFvALgQK05gkd3/D4Vc5XXOH9Ne2PXvOgRADWWK6gPs7d3C69HY?=
 =?Windows-1252?Q?JW5ZUrIiaVZnJtS1vnIPVFdBJiPnZJLqyWNJx7/DUK3nDcHdkQ5hG6YY?=
 =?Windows-1252?Q?2ZPoYB4SQKFRL4RdML0ooK8/4qR1SHyYgcXQoIOSNawiLSWIK1eznjKK?=
 =?Windows-1252?Q?/n/RRCp6ci8/PlfqDVUiz1QiDHviqRp2wIjRi83L5RXm5VeUs4ElLWLO?=
 =?Windows-1252?Q?gUFBL1jTrGDlCrpsCdhX2MvL0j2PqMysl/2Yv3LbUZ2GESXdJCzjb2jk?=
 =?Windows-1252?Q?SGmZVjTyGiX4l7rroRmFxjpXR4TwifC96tgNSFLIf3RJTbhHXDzcN2xR?=
 =?Windows-1252?Q?WLiVsB/8Yqqtd71OTTs0XFwJv0dLoIU7iGMB/RKzMHKFBfNRl0s/Mfyy?=
 =?Windows-1252?Q?UFq38/sehW1dxtb9xkgQZRe1HFU1fsA+AdaBoVGYtjUzGQt9ESSjcL7n?=
 =?Windows-1252?Q?LS/rIPepeV//53Ij76Kw/43AQJh1LLaBOroAxjxpoIFsV+4mJMKdnVVv?=
 =?Windows-1252?Q?DA/5mmawY7Y6hn2bvO1YxARF46NFfF9VHXXWwXovCwbNoRL33WAb1NGs?=
 =?Windows-1252?Q?+ozVnsD5NL1T1GPaYEpyeeK2/AHNSQPVN+u+mP8N2Lc+7AIu/Sdoigz4?=
 =?Windows-1252?Q?fOj0oCj6ry9Cv2wiGCi00Pjynla54g20XcnRw7qVQR2rJVmnBsW0mDZO?=
 =?Windows-1252?Q?HQKtF/pRGjiQ9weM+mz05ewUF8Kbw7MbnpldrlKCgX0MOo32WEGyh7xb?=
 =?Windows-1252?Q?EwQXIvAcBioD8KEME1nULKv2JYDll9Rdg1++0jas8+K7GTNRfWkBrSPF?=
 =?Windows-1252?Q?8rkavoY8OKXqcAtlhZPIAjJ04CAjDXyIvgyX3hiowMSPlNRjfEUpC8dB?=
 =?Windows-1252?Q?gSKAnZZ5OUwcWJ5XgQ6R8IHkDY/jP0TS8k3Jafhg0JmorCaMX9LeKVfH?=
 =?Windows-1252?Q?JdUgGWIgxxsVhSOiB/cQd0nOygyKBf5p8WTx1EsQKntXVgzbkCVtK4Q6?=
 =?Windows-1252?Q?a0BUEe3Kjr1GKtou+blXyaVpm4nUDntgCZCJKZe6/q+5fGoAuj6GR3M6?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a0e664-b43b-4583-2677-08d90881dbb0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 07:06:50.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xa8L2cvx3uz6ugpIp4Rq7hrMS+STOPmXstRsM2ULXCGDFfoDA4BfiJWUhk/rmueJ+Tr/eBbiVp6foM5ZD7cFQo6NlvPKlK5KbgOMYUCox4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2771
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/04/2021 04.27, Dmitry Torokhov wrote:
> Hi Rasmus,
> 
> On Wed, Apr 21, 2021 at 10:16:39PM +0200, Rasmus Villemoes wrote:
>> We can just include the newline in the format string, and scnprintf()
>> guarantees nul-termination. These days, sysfs_emit() is
>> preferred in sysfs ->show methods, so switch to that.
> 
> Technically speaking the conversion is not 100% equivalent - original
> code ensured that there is always a newline in the output. I kind of
> like this, so maybe we need sysfs_emit_nl() or similar?

(1) From a UX perspective, it actually seems better to have lack of
trailing newline as a (though subtle) indicator that the output was
truncated

(2) Given that ATKBD_KEYMAP_SIZE is 512, I don't see how that could
actually ever happen. AFAICT, the worst case %pbl representation is when
the bitmap consists of a series two set bits and one unset bit, yielding
a pattern of "xxx-yyy," (with yyy=xxx+1) for 8 characters per 3 bits, or
about 1365 characters (slight overestimate because of one- and two-digit
numbers).
