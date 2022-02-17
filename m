Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF494B9AC4
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 09:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237435AbiBQIUR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 03:20:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237434AbiBQIUP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 03:20:15 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EF729722A;
        Thu, 17 Feb 2022 00:20:01 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H7rlG6010826;
        Thu, 17 Feb 2022 08:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=3d6Qvr6/fvwaOXJdnQs2FYnoL9o6cyhb/we2Qc2Wqh8=;
 b=QYxGHzuWWGO4yhd1FFXz4Ah2z6LnjjsD757QjLY2Zw6FXEaQPLBDy2+Xnc/mgd13mMeC
 YxlApiRLnlS53BeTq/9lQOxy4JtQutpb/ayjAvf/zcznbegw6XUCtw9xsBcBkN/rRKHL
 tFcPj06ZtW0N0oPOhQFMCWcdsmJCjDYz+ebvgoho5D8znSJxekfnWOqHggotFs83kwcA
 kfnV05DJH/SH2WMFhvqolVQM7vblsazdd/k3H1JfsGVau1Y/sVtz1Cg/jUaEes9U2lEB
 AOzSyFAlyyg1DQoVlOVMGQl66Y6scpKzhyL38rz670TsWuW6JsdWAtZJr4la9vLQcQe9 Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmwmw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Feb 2022 08:19:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H8Cg9b167496;
        Thu, 17 Feb 2022 08:19:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        by aserp3030.oracle.com with ESMTP id 3e9brc1hwq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Feb 2022 08:19:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I121vImLMPqkcWE0trkKpuibZVrZjgNl7pjaKnlntj7AR6acuWI5j1yhhE0ozr2n5mm/DLWubTLnVXd/8hgI6/WZMKGJsbvOe6fp66cacEUsMRcegxF0w7CCHHpw24B1Xa+nbm6qTYAw8F9m56exmm5aKFMH8PQKRHa4KL4ZDyv1dfymb9VrY9lqBozglCRYQThsNeqYd8WSXv3aum3GUBy10h8Lhq/PV/bClCo95TGFEbwo6w13uHwLTBbZaJ9Il2VPfKnkVXWVXZ/0NubhinsCUpl9A9hEWXcQTankDXBL3sjScUo5YSl3qvsifnC//AO/COwGhRtRiORLywpQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3d6Qvr6/fvwaOXJdnQs2FYnoL9o6cyhb/we2Qc2Wqh8=;
 b=cELlnu8e/clZaMKvY1lkhlLi+MrUKm3AidhR6tLc120rdSFlbxQosDRNx2cTogtw4MkTXEaFp/0gAS1LzJuM+lB1dsZ7BYMoLd7iYwWWI+XlpTlFlYujyMLCI3dqO1+sg+NAAoxUfuNfhbP3nlzm9ty+wfke3lDcZ9eOMHHAo1aHccw0dmdkgBtICscfbD9OqTpAuSEH8rxTeBEieRUbOgmPs5YEFmRam9kJJIOVTFp4qbrE7f7jFFGbdg4ofhGL0mDjRe1BPtZXvR7vLCWg+eA6Ds+kQPipl1+ogWoxuJSo9YeK8tFz4eOY854/j+RhyUWNzWUYN7kzS2WAVa5wMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3d6Qvr6/fvwaOXJdnQs2FYnoL9o6cyhb/we2Qc2Wqh8=;
 b=Nzhe4qkyJ11UXksewQVIRV8KG8kkTpZavIEP8aCC+F7QC3gMprXr02ol1LeHlA2Q+mnAYGBTddmpq1AUGf5qVBBEiNw5QyexnfcUbfaHvtsYMiLwwVQM9gn4/+QvllXHZzy+KwEaOicO0mfcULoks1O2oowSEteAmXeH18EGbzQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH7PR10MB5853.namprd10.prod.outlook.com
 (2603:10b6:510:126::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 08:19:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%3]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 08:19:44 +0000
Date:   Thu, 17 Feb 2022 11:19:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <20220217081925.GA2467@kadam>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
 <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
 <YgpqHEb1CuhIElIP@rowland.harvard.edu>
 <20220217080459.GB2407@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217080459.GB2407@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b84baab-dbf0-4b62-92a7-08d9f1ee40b1
X-MS-TrafficTypeDiagnostic: PH7PR10MB5853:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB58538B97A7D2B48244C02BED8E369@PH7PR10MB5853.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: av8m5nQPMgGUvzmYwQC5NiZ5QJVqt5vZ+X/mVexoQiajLiJ8juEkdOWBS8mI2KlZMvP6yI1W13xiPWJ4bwa/I7oxFNiKDxiiywz32j9FcxtNLpWFaLFvv5Cur2tJI79wlYHfa2StvZXe8cGbGbdybiXBdu0O+urdMH8vDbeDrjOPIwKyOUq1FFcOzuy0s+JjWn34JunKUkNjqe6L44p8Y1vuqbEKoCmfyVDScTnjru+nYXu/eaug+FrQLa1C13/7AjceIUA6aJAkvnzE5qxJhGY8ue2Wa81FcDE/XPtZZRrN6mdnD3Vch4s1k4tJXvMfBVAW6yoEGnpN8e55xuFhEXBqtI6mm2V0lfKJgjNOcjpxboI6ildQa2BwZtfq/Hxr/F3iMQdSxLUlcJyblYnQDiV/JUdnPSbad6HDWIIOLX+tRNbaOYbsRxWnWj4d43wnI7TlyibJVzcbXJaIQPaAg67NYFufxtAQ6TiJDQUn0AQ4+iWkxBTDExdUvNaCC8D1jBADYT70ZXMDakYsP6KADa2jPa3xckTJ1r4owILdzMUK6cm9Vq+eOLvnw6RuUphUBGtJZLPtUW2M4rjKb09RDWtpEuiZoMNgL0hH3eu/q56JdgHccK4jlC9TLhkhtD05lCIl14LOz0eXQSCKUyDz/8uJdKA7mSsS8CmSu6G+qUeGQvXCWQ5IbdJ8jcciehxG9Ui21ghqOxfnaNPQekrrtZ8TMPmBGsa+gyW+hX7TezPX11Dr06xkiW32V7rYLZuf/wSN20UQjuQoS9B3zgUDVrRXHvXrZuhBWW5neS/GGvCfTll9LKiU+o8HVLcA4AAwWayMJNAiIAE/lDp7SGbvnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66476007)(966005)(316002)(6916009)(8936002)(86362001)(8676002)(66556008)(4326008)(52116002)(6666004)(7416002)(6512007)(9686003)(26005)(508600001)(33716001)(6506007)(186003)(1076003)(38350700002)(4744005)(6486002)(33656002)(38100700002)(2906002)(5660300002)(66946007)(44832011)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?up/JSU9h1i0WbdP0IFPZa98fGpdc7rqyYMCmIoARP4O6sKL5tqVtHz3lUhK7?=
 =?us-ascii?Q?pTe7/QwmECw7eCQFuN6Eepc0+7PPwoENRypTRdnoFj1h9rIUbuwz+0+9UNeU?=
 =?us-ascii?Q?ipaUFr1xzp6Otefxb48XGO/QnDx8QZboTWQNsTaKVRrbm5oHbo2W17bOSYqq?=
 =?us-ascii?Q?DBzqMDCjWMCSd+NLepEJ5MoiwtgGOySRRuHDyxC2/nbDldM5ZHJ+Xq3oUfxL?=
 =?us-ascii?Q?wTChg7t69mCn22X5EvT0St7IBvjKcIrtQhegiqUudTwVJeSEHu4EtsLGQ+YF?=
 =?us-ascii?Q?6hvkwdyt7y06yHJJd0Xc/4Vf2EE9CKGAh0yjivTk7qEUiDMZBTJ7gwr3eY8v?=
 =?us-ascii?Q?G91DN1J+vRf5ma5C2RpaxnYyFn8MQtDNCbh8iK2IxndpWJz0G8k5xOdi85Gx?=
 =?us-ascii?Q?cSeNdH3qk7VoFNFdi81eT7pbKlnjNpFxwp/6Js9F5s7js6dmgyVOvjZNdmAx?=
 =?us-ascii?Q?784w68SuhhkLLWho8a+A6UptzghWlDeZ6BtvqI4uO+hD0nkLviuBg5grMIYs?=
 =?us-ascii?Q?q6+NXYWYA6hoDSv9AZxmEOtREUFZptKlOjJe+FoHmxkwAhb7p98D1t2N7mJl?=
 =?us-ascii?Q?O2V+mL23lJT57VcEDA9d/zCwhRsHH8BhUKLhnM2WWQY+ELGgyPhmfr7wGt7F?=
 =?us-ascii?Q?ulx4pEDcsxgiGxHIsTwoRPN7pFl+vcmky5tLbtPEsTHM6Kq8kWdMyrlBlNWC?=
 =?us-ascii?Q?mqHXMWEO1bbHAwA8gDQByeoQoFPVlcqUaTPlTYWECmdIBUn243xSy5qaI0Ue?=
 =?us-ascii?Q?IaEHudqHJnALRqsCGc2JAfDs7n6t4v8eLwjUA3Q96A+anprIVuEV76iafXk3?=
 =?us-ascii?Q?rarhFatiT0EqbBdIK6Mk2w9r3wBrU1qWBT8zKhRMlBsiSBQcV88xw6TtUixJ?=
 =?us-ascii?Q?c1YjHaUrn8J3ZUiIBjJyfggCA/lL9J434HgBLCv+xD099JpUpjwoY645wfi/?=
 =?us-ascii?Q?tWPz8uK5KOfT0qKa5WK5bQ9wLVCYj9ye4t6mpZIvnwAcym/5XcOLxzG7eORB?=
 =?us-ascii?Q?SGGYytVQK3c9Y5/U9Kevf2SdJG0N73oppHjJOap6ywKrZ7d3MvwMucRoTrCu?=
 =?us-ascii?Q?2pE745G0PzgiMd6IVQ99fTpwZMHeNds3hMYFffoFv9gUThKFry0PW0h1XdOi?=
 =?us-ascii?Q?pQWSSTHDRA8Nqzx4rryYFSnv4t2/aorh4eOwWy4JrhO16WJTfCViHkM9oJnB?=
 =?us-ascii?Q?JBz46lXl631H6bcpEVEarFxacj3cf0XKXjRokUsGPNKLmFowIlPCean/7apO?=
 =?us-ascii?Q?L15RUkvAU700W4otkE8gblQcrutzxmb9rniurolPhRljLSzM3nW4uaZqJRYh?=
 =?us-ascii?Q?GSjM2TjbAa6WR4yXJ9ClS/0fnm5h2h8kgLfHGceilus98Bq198hjd+x4o7cV?=
 =?us-ascii?Q?k1qiknskujT+CdynfUvaaYI/4IfGOOZ3t/toXPE1/+55zTeQlZtJC4Un/6BZ?=
 =?us-ascii?Q?vHTb4vfHZeFIx9qK7uh3twC1xBvdch7VWULgTs6yAijCpaePPFT7mROXegh0?=
 =?us-ascii?Q?13eh3jyg+MjizZnAmMOI4CNfYdDMYmP0t4FbYpvYK7fzk7JFqhD8W1rETWTb?=
 =?us-ascii?Q?Nbpma66EBbGOdk9+QeVPhoNrJNV8yc1y5gCgF9+U5qpX0ozd5iN7nzHyhnZU?=
 =?us-ascii?Q?u6J1PK6s1PKGjRdlnjllwfeYwbfLyzoS7EDNnNjOvnvxSssJUc6VIGQssmbo?=
 =?us-ascii?Q?IErdGw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b84baab-dbf0-4b62-92a7-08d9f1ee40b1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:19:44.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZ5cWmLuPUhqRpoSDxVEAtVmFy1unYF7MK/u0dG6QqqrXJYgSsbd1WsCbuCTJK1zUCxzG0ixAnncdv9q9vunw6UR8VQkN7rt7LueYwLFMVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5853
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170036
X-Proofpoint-ORIG-GUID: OFs3-CjZARxnuEl84W12_guAnejTjse6
X-Proofpoint-GUID: OFs3-CjZARxnuEl84W12_guAnejTjse6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 17, 2022 at 11:04:59AM +0300, Dan Carpenter wrote:
> 
> Salah sent a bunch of these.  The reasoning was explained in this email.
> 
> https://www.spinics.net/lists/kernel/msg4026672.html
> 
> When he resent the patch, Greg said that taking the reference wasn't
> needed so the patch wasn't applied.  (Also it had the same reference
> leak so that's a second reason it wasn't applied).
> 
> https://lkml.org/lkml/2021/8/4/324
> 
> So someone should go through and revert all of Salah's bogus usb_get_dev()
> patches.

Never mind, this is the only usb_get_dev() which was merged.

regards,
dan carpenter

