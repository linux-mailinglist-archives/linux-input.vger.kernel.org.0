Return-Path: <linux-input+bounces-6397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83D973B2C
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 17:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2C72843B0
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 15:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E79197A6B;
	Tue, 10 Sep 2024 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="JW1fzf7p"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2116.outbound.protection.outlook.com [40.107.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B410B194132;
	Tue, 10 Sep 2024 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981166; cv=fail; b=ZJ8gIYMxsgAmBBe54rtN0PWZ08m2ddmQHX1KrLbWGkVJXxOylbON06WtzDhV5vrchwVDJVHtgcuB2KYPfWTxr4PPFEQ7V9aKSpM8jrubVnBhb6IVBb3h1EEUuePPIxsi6THCXAIZiGCCC/KcQkEnzCJPMXif3lwjF3B2HwgQ/ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981166; c=relaxed/simple;
	bh=N/aAPzp64zOsLQ9uMQnCZr79V8INbfD7EDz2Xu2z2wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KA2S9jh5WQ1IjjuXsNli8xB74vyB1D8t9UuDd1HNST+a8odU4PHvMwxpZQwiwHcvp7wAnopmdKSpVGRnCvIeQbk9WO0n342A7KzReIPBlB5pR6pdCW48akBDlmJ/d3ckmp0ES8Zni8yxgoPT/msdrwRekm69+QCjUDg041jLVvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=JW1fzf7p; arc=fail smtp.client-ip=40.107.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM1tiezvUK003gn6aVln4V/9d1/f+TuqSrOpbaDMk9yB3mdGo8YHhcPGt2BuAvntM+uN2LcEqyGaRsNZqRoqwpIPo2gXn7GqH70hyJa0kwJugkBEQ/iqyO1rs0v7QYhPzRQryV2/pdGH2zy7VxOlnTVwEdF24MsHJCt2FZVV6XrwOWlDliG5q8XfckbpSKH0x/2H8ZrMdu84sg7ovDVRhdNRA1pPZfLBuEhZVFEc4gySotqNJdvzpKlXC41Uf7Tqc8MDnBrFaNHCQwLZw+D62zmWaPuexUy+E9cSADQ9KV/Ru1IeJ9UCXCvBbGQXVuZm35omkpKtRK7bTeAW5dZw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8J28s6zRvTkgrLt7VHmQR9n5nBM+Cuc+jNv7SR590A=;
 b=VUi4u9XG8p55cHRKxBNV/vZW9qMf+r4QgWvK2/ygUsjeCRa4ZOvD620TbdgxbeawsM1mKCP3w1TfABIRptZcMENOygGXsQVWrZQUDg6Ey3fZ/9fgcVPVsYtMkCZ1Tw4leTONJkdN85zh6I6fEKjGTFSo7ZMV4X39R+w4yzXD6ZlCEXAnrIalE2re6sCGmQevWyUN9IEF8iP4inv+BQ/OP5ptpFhBvkR09ZOvB1qZ6SfgkhEqMqywpyNtHHYqiCGch8GPd01LMAC0tePKKFQSJuRvGGl2kUxOI2guQlvzmk2s40i9rArZYWb022PBW51CgGkogzhEng8DXsgySHqLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8J28s6zRvTkgrLt7VHmQR9n5nBM+Cuc+jNv7SR590A=;
 b=JW1fzf7pUqPOqdnLGjVwMJvMBR/h2PMR4TsbEt/a1GOSnk1oV17Rk704kWuAFUE9BWXUbEPv8IxwUFfzRf23rNrOlqCakhf/BS4MZqIDjOWQY9omX9VytggsCojcSS9LDNKLDXHz7/GLBICvc9jrCPlKJQlSSSjAlIIDexiR35A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SJ0PR08MB6445.namprd08.prod.outlook.com (2603:10b6:a03:2d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 15:12:41 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:12:41 +0000
Date: Tue, 10 Sep 2024 10:12:38 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/22] Input: iqs626a - use cleanup facility for fwnodes
Message-ID: <ZuBh5ncQCFp/JmGe@nixie71>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
 <Zt47Ic059YbOSbGy@nixie71>
 <Zt5P7hlg-uhRHnCc@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt5P7hlg-uhRHnCc@google.com>
X-ClientProxiedBy: CH0P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::13) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SJ0PR08MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 381f3960-3675-467e-7621-08dcd1ab03dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pTU7GkNgmUBLswS2ZI9u/WpQTTE+va2nq2jp+dumLNyhPHvjM93CCrZjpP29?=
 =?us-ascii?Q?rBFRnZC/Sg+/PuZTfI1s2x2nDcm+9dOMOkUJ+RV+mIlloktdPaQJ65NGPR5f?=
 =?us-ascii?Q?yd4w2X9LlmsOMepLLvYck/eYRa4rdBq9/NNo2gQT7dHokvxoCC2JwqV7FzJ7?=
 =?us-ascii?Q?9Bt3RL/vTpiZ7U9j/9WcYeb248glrQyGrcElRfuNqxQM/Y3eQrATiUZ0eeXC?=
 =?us-ascii?Q?HnYbfcIvU73n/6YUHY8ieSL/uWx6KLmWTgrl3oaYExNaWLKhXs5b2wRjyN0S?=
 =?us-ascii?Q?/xez4X3ipJ71awhfaLh9VHtBKV375kw5V6/5HlA695duKM2R2rlSZOcNztpx?=
 =?us-ascii?Q?/vYlylcwLnM6xeIBYJj4XGi7TAuYWtDXa+dA/XH0b7fdYCKkeF66PQHQvuYb?=
 =?us-ascii?Q?SH05M8Qq6Sqxojduzt+tLYSg4DC2puZxNLybbrXzB9i0a+8EOZwO4rI86F75?=
 =?us-ascii?Q?hGtTHU4RdnmHn0kqqHecRohcnPjSf/WFMKqSd+N4RdhSfne6BG5Z6riV5zBL?=
 =?us-ascii?Q?xFkchRg8k2heJl+07YnrWR8SiWYBWGYgxfyjWJFl2ItaYLcJRYM7DuJfpdQq?=
 =?us-ascii?Q?iXdf+5CXLyiZR/H3H17/NrGiO/+rEP6rPcGCBkZykWcRnQJHfqlEmt7ghGz6?=
 =?us-ascii?Q?oRQfSp4okaPJMCjRpTyLOozhd2sYMnM/ulesdxLC8R69dBRRZp66yvQFagT4?=
 =?us-ascii?Q?2OmCdlxEt1VOqRz9D9HkO8hGaisnSc0O8/ebu8LGPFNIF2pQGnj07DXvtXre?=
 =?us-ascii?Q?9mQTVN+BtslLaYFZSgGSkLa8Ts+uPSxoIk1IunEvjhjVkoqzd9rdNTVjR1XS?=
 =?us-ascii?Q?EZPrDc7DMSE4aVLAJLkymNiZR7/0M+fscwqJLAl8icQtJec+xtKblXeifIsd?=
 =?us-ascii?Q?OAXuoSf0qMQh15Yks8rUnj37JUjweCHUK81t9nVnfDDXyn//rTjmIzAvuLeV?=
 =?us-ascii?Q?2Yscc44Jx9IjjhT95HYzDmtmU+kV801HtBfOM5Wzq7b21NFpEmHLlqXzZXVZ?=
 =?us-ascii?Q?dUgS4DxS7ypsUXUkhqcFwNytuhIP9h8FJQoWxiNscGh8PnraBk7QRctMqEt7?=
 =?us-ascii?Q?NnhAK0fXd2QDiUzfXB+Z/NXPmdsbpSYTCqHLrzh774t2y2h0fPEifBPI+lvy?=
 =?us-ascii?Q?MQlto4b9EZVSgs9+6jc16VxN/pxpmKHh+IpowC3TCrWArgExATSlwWhbktb5?=
 =?us-ascii?Q?d9mS0dJW4ykIFi4ZFCn/th0tag9pXzLytlptWh5mByyJJXmBVWLTDW6kkaEo?=
 =?us-ascii?Q?aygeOka+tK5bl4xGh837QR8d+NPA3eS1i55REenttLl8/PBP6KAd2r02VpsU?=
 =?us-ascii?Q?I+3HH1ekByScHPPRw/Mu4hlqa5JINtTuuFoHWUQanG4EPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DieXYvcz1i5Di8KMknmZarq6VwRb7WjlYGzzqPCyThEeVbXQsTjGit2rd7Be?=
 =?us-ascii?Q?Ua5WNTIKlBryb0CZrSFFfaWjQr52MXQH/cxlJKVH6qeLPM0icdswsDXqRUp2?=
 =?us-ascii?Q?7/6lEsvmm70rRtcmzyRuyS7FA5YWx3EY99XMuSyxZ1lYQcum8NppdrXYrBPm?=
 =?us-ascii?Q?u4G/77ljvvZmWsO+w5KVrZ8eYjEs17/PqhW3YLPrhu192iek2rxZlAUiw52n?=
 =?us-ascii?Q?2mlYFUK6h8WUCgeBUQ1LguGlTEKvibS4v2V1iCInyupCHK6rA60vBywsLYFt?=
 =?us-ascii?Q?5B6vnSU8ETkNcZ4/rTiK1cqVleW0nG8bodenDvhfMrJB65+bqHiHDC/GuKhL?=
 =?us-ascii?Q?L3Hyj0J0j/NctOkqZ9fynFmOxZjp2yaMgb5r1vZQXY3gRk4l/+nc6Mic7dqJ?=
 =?us-ascii?Q?UU12xf0Rd/EGvW1lDhQTyEdL9ALKNXTm1XktGaCeyFhIX4rpjVbbd/Ncdtzy?=
 =?us-ascii?Q?kcebj/6141A8o+cfYy7PbuqF6i9dROWureyEEKzSFomFovxZyI3dnFCVVxAJ?=
 =?us-ascii?Q?306KdLTO0ddXokI4B4BtudOsJU/0wQ9tYW8hJ8uQElt3h7tN/H6kZcYuX8vw?=
 =?us-ascii?Q?E67k0sFldd5ZLMrww1EKPta85W3BWVlVf1lza8nhsQ1IVdknNsr/R57nMMcD?=
 =?us-ascii?Q?5tH5QV+rb2+o0g1f6cH2r4YwCjPPuJYmaYcjgqiFMLn+w/TqlIZCG4hMphzc?=
 =?us-ascii?Q?bfxLm6TKYk8F/vyu53anSeR4Q5Ra+fpPz2kTj4JrxQtwltpmNErQzx/QS2ZO?=
 =?us-ascii?Q?IAsW65kQFFfONYd4oAs2iMGmzRE7YZoBsDDDQpgjMb8OEKZ8h6/jlnvdbIF6?=
 =?us-ascii?Q?fV8daBYkOyU+YdAnWyzG+fcmdg1QyQQuw9kl9ugIPgEl9BgaNDBFG9nJSnmm?=
 =?us-ascii?Q?LsDBVsaMDUK8vvR7KBTytZW9WY09aZ1BriN4MLrqH2NljXI+L/k21Lu0qs/q?=
 =?us-ascii?Q?CdPp+XOGhMeNhDUy1QcEpWzTNDa3aknp7byBEyGzZJGj/gzw3LFvUAXUrSLS?=
 =?us-ascii?Q?upscBHghbz0eQ6Zjm6mEf26vEi+ts6+0e7sN9swxtLSpjII6NAvdP5V7dou8?=
 =?us-ascii?Q?27K7lXFB7xZvM14qJbimAdBXjkjXOWEiKviq7FVai54p8Z4pqAksyxTSuDXB?=
 =?us-ascii?Q?F+/NKATJ1GS7JCgjUGZpis9Zm/bs0HUDRCEJwKOYVWzejJa+2nQ1vlCDdNLy?=
 =?us-ascii?Q?T7OP6LdXe0K66/XvVgPxkbkNj4Kq8aB+xJd458buGNkN7KP13xT8wv7X8DlU?=
 =?us-ascii?Q?AAEQXzguPgFHs+Lc5y9Jp6t7XMztpMZBCHI3KYOPQoF7UnepktH6wC9wCY0L?=
 =?us-ascii?Q?DK5lZ78nFDvXIwAQV27bY2dEjC3YqsnRM36DQeOtB4zO19opiZJBehPFd8uC?=
 =?us-ascii?Q?I3h0+RFSPuTTVHWgPNwSV+5QC3WUGni8ve/2IDfa5svnkGJ+PN9x23fCfpOt?=
 =?us-ascii?Q?PVvXvgRW6DzdGnt1JpweCCjLtdmWcVtJ+rff6yR39wujGUaiioGYTAocgFvx?=
 =?us-ascii?Q?s+pugEa6MsZCskhi70AvIqRJM0QF/7CCHy0GIF4a9aA98sQ6zR4eqxx+bOXN?=
 =?us-ascii?Q?ifhOvQv3/QslLsVD5IG0fGsLDu4xLoXGdgtPhrQd?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381f3960-3675-467e-7621-08dcd1ab03dc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:12:41.6255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBd8Z2c8W6g0Ikp4lzUU1XL8zJFnUzDm4wm89wMJzFTt2h0KKRH0eYIgP1Ak0ijRo4biLIsNxEYoWE3kygAhAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6445

Hi Dmitry,

On Sun, Sep 08, 2024 at 06:31:26PM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sun, Sep 08, 2024 at 07:02:41PM -0500, Jeff LaBundy wrote:
> > Hi Dmitry,
> > 
> > On Tue, Sep 03, 2024 at 09:48:13PM -0700, Dmitry Torokhov wrote:
> > > Use __free(fwnode_handle) cleanup facility to ensure that references to
> > > acquired fwnodes are dropped at appropriate times automatically.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/input/misc/iqs626a.c | 22 ++++++----------------
> > >  1 file changed, 6 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> > > index 0dab54d3a060..7a6e6927f331 100644
> > > --- a/drivers/input/misc/iqs626a.c
> > > +++ b/drivers/input/misc/iqs626a.c
> > > @@ -462,7 +462,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> > >  {
> > >  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
> > >  	struct i2c_client *client = iqs626->client;
> > > -	struct fwnode_handle *ev_node;
> > >  	const char *ev_name;
> > >  	u8 *thresh, *hyst;
> > >  	unsigned int val;
> > > @@ -501,6 +500,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> > >  		if (!iqs626_channels[ch_id].events[i])
> > >  			continue;
> > >  
> > > +		struct fwnode_handle *ev_node __free(fwnode_handle) = NULL;
> > 
> > This seems to deviate from what I understand to be a more conventional
> > style of declaring variables at the top of the scope, and separate from
> > actual code, like below:
> 
> This is follows Linus' guidance on combining declaration and
> initialization for variables using __free() cleanup annotations (where
> possible). These annotations are the reason for dropping
> -Wdeclaration-after-statement from our makefiles. See b5ec6fd286df
> ("kbuild: Drop -Wdeclaration-after-statement") and discussion in
> https://lore.kernel.org/all/CAHk-=wi-RyoUhbChiVaJZoZXheAwnJ7OO=Gxe85BkPAd93TwDA@mail.gmail.com

Understood; thank you for the reference.

> 
> > 
> > 
> > 	for (i = 0; i < ARRAY_SIZE(iqs626_events); i++) {
> > 		struct fwnode_handle *ev_node __free(fwnode_handle);
> > 
> > 		if (!iqs626_channels[ch_id].events[i])
> > 			continue;
> 
> This will result in attempt to "put" a garbage pointer if we follow
> "continue" code path. In general __free() pointers have to be
> initialized, either to NULL or to a valid object (assuming that cleanup
> function can deal with NULLs).

Great catch; I missed the fact that fwnode_handle_put() is implicitly
being called in all exit paths now.

> 
> > 
> > I also did not see any reason to explicitly declare the variable as NULL;
> > let me know in case I have misunderstood.
> 
> See the above. Yes, in this particular case it will get a value in both
> branches, but I feel it is too fragile and may get messed up if someone
> refactors code.

Based on the above point, I agree with your approach.

> 
> > 
> > >  		if (ch_id == IQS626_CH_TP_2 || ch_id == IQS626_CH_TP_3) {
> > >  			/*
> > >  			 * Trackpad touch events are simply described under the
> > > @@ -530,7 +530,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> > >  					dev_err(&client->dev,
> > >  						"Invalid input type: %u\n",
> > >  						val);
> > > -					fwnode_handle_put(ev_node);
> > >  					return -EINVAL;
> > >  				}
> > >  
> > > @@ -545,7 +544,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> > >  				dev_err(&client->dev,
> > >  					"Invalid %s channel hysteresis: %u\n",
> > >  					fwnode_get_name(ch_node), val);
> > > -				fwnode_handle_put(ev_node);
> > >  				return -EINVAL;
> > >  			}
> > >  
> > > @@ -566,7 +564,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> > >  				dev_err(&client->dev,
> > >  					"Invalid %s channel threshold: %u\n",
> > >  					fwnode_get_name(ch_node), val);
> > > -				fwnode_handle_put(ev_node);
> > >  				return -EINVAL;
> > >  			}
> > >  
> > > @@ -575,8 +572,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> > >  			else
> > >  				*(thresh + iqs626_events[i].th_offs) = val;
> > >  		}
> > > -
> > > -		fwnode_handle_put(ev_node);
> > >  	}
> > >  
> > >  	return 0;
> > > @@ -774,12 +769,12 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
> > >  	for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
> > >  		u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
> > >  		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
> > > -		struct fwnode_handle *tc_node;
> > >  		char tc_name[10];
> > >  
> > >  		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
> > >  
> > > -		tc_node = fwnode_get_named_child_node(ch_node, tc_name);
> > > +		struct fwnode_handle *tc_node __free(fwnode_handle) =
> > > +				fwnode_get_named_child_node(ch_node, tc_name);
> > 
> > Same here.
> 
> Yes, combining declaration and initialization is preferred for such
> pointers.

ACK. Please feel free to add:

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> 
> Thanks.
> 
> -- 
> Dmitry

Thank you for the discussion!

Kind regards,
Jeff LaBundy

