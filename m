Return-Path: <linux-input+bounces-4263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30B901135
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 11:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9013B281BFF
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 09:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7133A177999;
	Sat,  8 Jun 2024 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="KczHvo2A"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2083.outbound.protection.outlook.com [40.92.89.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639E176FDB;
	Sat,  8 Jun 2024 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.89.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717840591; cv=fail; b=awW9bRPNmd7QXuNDSfAuodx+45Rdde2PTI1Pydsb2pmpy9t5Iz5977EM/1DCIzybCij/jKwdXSELnX6iDSqX1s91IAQff3N4R4JVHOmlbxUYi61DVjryWM24UQcQupA+y5lJD6ah3kWYt4E7RK3wMns4kAX5JwPPMNXyblQzdiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717840591; c=relaxed/simple;
	bh=FgsrxCU/SXJnLCIkGSK+H88ncxWw4PVkDZBtUjhzdFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bx2VR0Ri/p83gBu2m0giYu2E1xz2EXOVx/R/w7zB+n6TUPZaVnq1IrmVVzfkmTdJTfWRjUyofNDXCdq5LqWfyqSZ/FrVMR8AGkgoNvWseN8SGwUKG0MxKOPtOo8a7Je1wFucG3bPwhzzkxHR/MYpAt84v6Tz40+qRD82BwMNFQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=fail (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KczHvo2A reason="signature verification failed"; arc=fail smtp.client-ip=40.92.89.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl7vHCjaCw7f5WfXIgUggmWx42AWBcGJe1HK+p1sD7w9U981qPT3Yp6L9JCJzPa87qGYWeKzg41T8+yg7bzEvc7taJudD96hNICsRtIUqS7SrPuwHtSU47psH2wvHPZrlTQHu2KVBXIMG6TpTJiabRWcvaBs3kJtAs9qTMY6s6/j0jGNXLp9llcwiO54VH2/6GPBeohhjQ9LtPQyiK2Hxi4KRyJAkq1T1dh9ol/oeT+HnMHjiJiMKLt8gXU16VNhkmeGozti8wxdsnDBBQcX88uA/Myr/GbxPgVqzUKxi4UqZx8iGfcN9v+dDvHeb5L+5g9PtvPd0/pkm4TngVVvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9Bx9xRYVvT4/OK+jPTJAWLrC/EzryAhBkn/5U3oj+Q=;
 b=Cg0TrA328z6SkWQ7ShMHf9qWQCYyfR76a1lvSu1zqQ/4gKngfDZVLCPZodL0CV74LnVqkdY+r6hDeRgzgds9uKa4LRAmIoAwsqcChZslliKy+Uz4LzBw532CZIi52qhnFzaB3c+xrhfv9ZFxHBdrIN2rsICSBFiuj9Qa5dWG6Vk6pMni4jJikcj6w383sTxnOzwg/m9jVPLqNyPabom89g6RcUvHfZ3sRcvCic7ylZLjGVW/ZVVXPrNzzkV0/poGSWn8m9dKW33mhQKMADxqHccCefQFPuKoq906iAeHSfK7lDOeu8zZEGQc5Xsjs5YdHJMlqh3hxO3tnup+wLqBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Bx9xRYVvT4/OK+jPTJAWLrC/EzryAhBkn/5U3oj+Q=;
 b=KczHvo2A3VyHYiSsFxR2MzYY52Y/hTeHqi/5GcsCXhAq3DKbvjhObb3sEbfqfXmB6S1A1FmpxLCNOtocdR/xE/91S4QclY9eq5AfTFiW/vMvvm91g6Yt/J8ODfNZ4HtB22i/paB+m/ZehV1R3St9+pKvYvR37h8QcM2HYUsLeRQZo2YSI8qjWwRRSHQW1Kxhu0LtnNqAz2o1519jsqA55SHbDQv7ZEBpPNlDaz8fht0kMf0P32+UGkVf4xwpxU15+zZ1pooyyQJlSxVXp7nqp393mBu0IT1OofSLSQ0qhG+kJ1ptkCE1lGHfEu6dnyf/MByl0hIi5AzmOx9XMpTFZg==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by DB8PR02MB5962.eurprd02.prod.outlook.com (2603:10a6:10:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sat, 8 Jun
 2024 09:56:26 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 09:56:24 +0000
Date: Sat, 8 Jun 2024 11:56:23 +0200
From: Erick Archer <erick.archer@outlook.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Erick Archer <erick.archer@outlook.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [RFC] HID: ishtp-hid-client: replace fake-flex arrays with
 flex-array members
Message-ID:
 <AS8PR02MB723798FF6CEF28DCB62FAC958BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
References: <AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <80976997acb82fe3e6ba54fa2708c8f40fb3eb00.camel@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80976997acb82fe3e6ba54fa2708c8f40fb3eb00.camel@linux.intel.com>
X-TMN: [93g1rUYlPTSDbOE6N5BL4yBSeFwt6fNI]
X-ClientProxiedBy: MA2P292CA0003.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::20) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID: <20240608095623.GB2542@titan>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|DB8PR02MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 387bc801-1c2b-4612-c47d-08dc87a141cf
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	8Wkc9+F1HH5R4A2LkvjCXTeXjwvhJs2s4swjNFwKf4Kq/QahLqGWPB+mC0vizWLVXgVh+KIY9LVnmIpBoRa2GCBQtKLTJsL9nRbs26g/jU/gzpjyPZu/ZFBxWsnFbdtzbgjczv2SMRi0ilv4H8WiHvP9Mv++eJTeLMAWyFp83VL4qa3ib85HAjvTnssRruZzSsyW8HmO+tQ2Hy61EQTKoLqwbsOOEkGmN63Jrzk0joI072whxb9+Yb1fqqXMFql7FL+IdmoiE00PDcUdn3bu3uEHpw0rXJcSamE2xTpAIg6KKkmNdVF5DYwNF1l6NTrKFtFS7oAI19XNj0p7Y/nYHSNhjAT9m8bTiBtYpSPFcCVJhOpPZ4XNGIz2XQaefTH9TS7EYtVkRQcLqB6xvqnraBYia2Pw6amIhUyHtEl5EvJjSePCBITPQOqm5yxBzXFvFwFczB5WC25DL+c1PKXAWD4pbNbOGM/+xQXaBzMXdBcfk9u0i4N3es4i1P+8PTiuKuTZnlaqTpKlfi7+gK3NO3S0SZPsvVyjEeXnlEaV9Zqw1CMYIKjL1lW1HrUlCNukyWwULTDEIXgy4rZM8J7N5CrR80TDDpNQzVnRWS6UkQaINMne/6gmb1LmPaxQj6dv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?+/GIP7VFxAk+8ACGpN75bRh/58Gr2hwJytQQUEy3ZdCx3MQEVDFHtYQG2z?=
 =?iso-8859-1?Q?eb0QEqjVlQByuP/UMMT8iotrQYwu2DYlya2tF85hNW8UAJlIyRJvNP8BxN?=
 =?iso-8859-1?Q?Z9+nr6Hnbuq04O1RZBKy/kgr9sp9NGoDfVKBN3c32m1zEapIyR1A7Ya7lg?=
 =?iso-8859-1?Q?fhIpPVmYkAGJF9o1ZwxvxOCESsrWiuuW4qyz+SHXCChh7bl5NRKlgX+lam?=
 =?iso-8859-1?Q?nB7PvnQGOlmJlkOpIqKPG4tSN0w94ZYEUbS96Jp47UxZTtaGZgTSvwJBm+?=
 =?iso-8859-1?Q?WqYzjGIFNZfJ7IVs8qNQaNTC4qXe4hu9eVodSHGd1GPuFGNEfPn+vcux8p?=
 =?iso-8859-1?Q?3fkwgTJQiW3ephegUHj7U3/eSHZNfsxuV945e41iexInwn4gLLyfORyWsr?=
 =?iso-8859-1?Q?2sopgoi6AsB711UUysuqK7NjAYeWNI2UJW/zXxCpYgmcmG502an6whr/PH?=
 =?iso-8859-1?Q?MTyQgj5fhgNB9lkOOJ+hhkw6PzMvxb5tVNFIp5I1uOSUb/n0/6fhXxtwXt?=
 =?iso-8859-1?Q?XcqzQkWT44P/8/zOP3He60VsNvdZx2woz/7nVqAMnOXx4Iw1fyrE2AkguG?=
 =?iso-8859-1?Q?t6jZSLnA6qgviMT0ki5V/XOirqrOLtTxsPVCKa2VL+WayjJgSXGOHT9ytw?=
 =?iso-8859-1?Q?hyse45IR/qVI2E7Wk/CZDvU8tTrRoV2yDP7XRXpMOq/dhZO6H/t1P/U2Xf?=
 =?iso-8859-1?Q?QR/EGpf23qvuXttlWWn8b28VWnuAGMqTLR7BcdZoo4n/c3NeP9FzlQBXp6?=
 =?iso-8859-1?Q?C57e5bgI+UZLOPAjJAcIGgHxieawAUzAIhLW3Tau+jWtS6ysga0WcPsV1X?=
 =?iso-8859-1?Q?w97n0lem1qutyBjg428Hnf3vQaIoaAlD/Rgdbi3BjcZHsGAZ36M5KeGagJ?=
 =?iso-8859-1?Q?kmdswPfpEbJK/bPz0Zm16YsrCBW/J0ul+2O0EvKpxI+5L7QQZ7sJwOLPCu?=
 =?iso-8859-1?Q?Xt51jyzadmwutr8A2nRRcB01DXgoA7eIQSU015wFHKMS3vAy2MwdyDOk68?=
 =?iso-8859-1?Q?M44Ps9UYOAAu2vmD4aDmVdvlWB4JUFJdPKUr5lc3Odxw6UyisL2UNRBZZz?=
 =?iso-8859-1?Q?PZJCaIUDfKChDaoYYq/+UU2wrFjS2W1OSb/8ofN8f5A1gWAwwMZuF1sNiW?=
 =?iso-8859-1?Q?jjjPUo8uQ6nnE4ei9JGdv4vTvssP4ZDAJukn93CoLdRStXd+FFVUSmqINm?=
 =?iso-8859-1?Q?uT5KdfKyT1MPr8IVzDLzfRNPAZxyljMzSNCWEx0utGMgFeb8fryt7/ID92?=
 =?iso-8859-1?Q?0cWLoEYwrhGPNi1MHg6zWtW2Mz9OvyIq4vpETQLg94UGYQ20+iIIqdsIg6?=
 =?iso-8859-1?Q?x2wv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387bc801-1c2b-4612-c47d-08dc87a141cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2024 09:56:24.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5962

Hi Srinivas,
First of all, thanks for looking at this ;)

On Sat, Jun 08, 2024 at 01:42:54AM -0700, srinivas pandruvada wrote:
> On Sun, 2024-05-26 at 15:32 +0200, Erick Archer wrote:
> > One-element arrays as fake flex arrays are deprecated [1] and we are
> > moving towards adopting C99 flexible-array members, instead. This
> > case
> > also has more complexity because it is a flexible array of flexible
> > arrays and this patch needs to be ready to enable the new compiler
> > flag
> > -Wflex-array-member-not-at-end (coming in GCC-14) globally.
> > 
> > So, define a new struct type for the single reports:
> > 
> > struct report {
> > 	uint16_t size;
> > 	struct hostif_msg_hdr msg;
> > } __packed;
> > 
> > but without the payload (flex array) in it. And add this payload to
> > the
> > "hostif_msg" structure. This way, in the "report_list" structure we
> > can
> > declare a flex array of single reports which now do not contain
> > another
> > flex array.
> > 
> > struct report_list {
> > 	[...]
> >         struct report reports[];
> > } __packed;
> > 
> > Also, use "container_of()" whenever we need to retrieve a pointer to
> > the flexible structure, through which we can access the flexible
> > array
> > if needed.
> > 
> > Moreover, refactor the code accordingly to use the new structures and
> > take advantage of this avoiding some pointer arithmetic and using the
> > "struct_size" helper when possible.
> > 
> > This way, the code is more readable and safer.
> 
> Applied and tested, atleast didn't break anything.
> 
> But the explanation above didn't give me enough clue. You have added a
> payload[] in the  struct hostif_msg {} then using that as a message
> pointer following the header. I think this description needs to be
> better.

Yeah, I will try to improve the commit message. What do you think about
the following parragrafs?

[I have copied part of the message to show where the new info will be]
> > declare a flex array of single reports which now do not contain
> > another flex array.
> > 
> > struct report_list {
> > 	[...]
> >         struct report reports[];
> > } __packed;

Therefore, the "struct hostif_msg" is now made up of a header and a
payload. And the "struct report" uses only the "hostif_msg" header.
The perfect solution would be for the "report" structure to use the
whole "hostif_msg" structure but this is not possible due to nested
flexible arrays. Anyway, the end result is equivalent since this patch
does attemp to change the behaviour of the code.

Now as well, we have more clarity after the cast from the raw bytes to
the new structures.

> > 
> > Also, use "container_of()" whenever we need to retrieve a pointer to
> > the flexible structure, through which we can access the flexible
> > array
> > if needed.

I would like to know if it is enough :)

Regards,
Erick
> 
> Thanks,
> Srinivas

