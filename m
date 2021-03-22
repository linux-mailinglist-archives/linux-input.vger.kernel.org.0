Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18901344972
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 16:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhCVPmj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 11:42:39 -0400
Received: from mail-dm6nam10on2069.outbound.protection.outlook.com ([40.107.93.69]:2364
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230042AbhCVPme (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 11:42:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofJS/TVeEt6X+DsAOFWJQlTLKVLlcKMfiVT/ZQscDD8F8kNGUbtoeYBskMdgmJJLBpMIKUd+h2qfVX7XjjD1/KBVsj0kcPPeijFEFiMs+8RiN2h/PjiaaPIPsWYtZ19FZ3ypTXzAts6NlVthjP2mSrWWFT5jLaNtlfhIx9acn3jykAPpbUWsTZZfgD9GIpf0So5MSzGRmQiqQJ1muSrdxoIFVUViLVgd6wjzUxryPDapv03fDknbHAWaH8NW2lQpSoXEEmkKrM+SX8j1o2EkLzzBtSD7dAZkGSqnrEEfb8KRRZ7RXI9ox4W1OFEy1xB5xOE+mrAYY/Zh4muVCr7CAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o0Xv05iMMsmqDczwuVs5DVetCH6JQMpPIN1uPQM8oo=;
 b=BTheA5zZTWfHWyhKKEltxz1SJBOEYMPNKJAHdwIfkRWY9XB/pqI7S3iIhieR/JwKxEml5mdIQRFMQytV/4g8kE/u2NNkcFKPfJoUBriYGGbGokkY8Qyam9oeF4uoXZH8Sw5a89IdhDcFSX5VG+rIaHK4zHG8Lisyas6oh1c9i81H+lZw+JSrDqspVCbwITNhgCiZvlia3RqJBA+Esa7HkEsZecpaPCQgLKLRIz0moF3mV2W2JhEe2T3u+9D+FOB+nVS47SG8Oa3Uy4tgspOPaJK8TR2tToEWYtX2vYwaTnySwTwEOxrPJ0pKXL8zl7h136so/zlicveEljnanh7ENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o0Xv05iMMsmqDczwuVs5DVetCH6JQMpPIN1uPQM8oo=;
 b=b6o6aNNuox2WO4cYliLHKE0/23K36POOeuJWw28RpmJTwQ9+lJLf/wO93t9HzAaymeSdeT1e5pOrvTl80XzTC9fwId27+9CsXqmk/m/pBhMZ5IY+t/Hf7Cmun8/jbtE/1sZkgudxDy8kYzNMSQo04V1MGqlpEfd3rLpYLKUBC4A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4222.namprd08.prod.outlook.com (2603:10b6:805:30::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 22 Mar
 2021 15:42:27 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d443:cdc3:d44e:d1c8]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d443:cdc3:d44e:d1c8%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 15:42:27 +0000
Date:   Mon, 22 Mar 2021 10:42:21 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 8/9] Input: iqs5xx - make reset GPIO optional
Message-ID: <20210322154221.GA3215@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-9-jeff@labundy.com>
 <YFgX37ody0bHwv10@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFgX37ody0bHwv10@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:806:126::33) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SN7PR04CA0208.namprd04.prod.outlook.com (2603:10b6:806:126::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:42:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6fc8f2d-9f8d-4516-f12b-08d8ed49181f
X-MS-TrafficTypeDiagnostic: SN6PR08MB4222:
X-Microsoft-Antispam-PRVS: <SN6PR08MB42221184B6851E0A19B5EE0DD3659@SN6PR08MB4222.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAeB1Wilak3Dj8y1Z5dEDb4ESjnmMZKRCB+ZX8YtIVFImhipjMcppmuXcFYuE4NtoCsDgeMl6U70Ke04RGEBhI5fdDmb5IRx5NW2DRiRs5s7FJnOEar3tAoUbi/PMvrmovB8fPFxT23yrHxISqpTtLUGBM4wIIs/yvfjqLQ2je71+Dgm9OZGh6xiwXVCtYjHMxcouHVBB5eBx12yS+gUy6KV23of3VJmh7o65iqr0NeoH5tbEauX60xgaUhWs+3oK6ZgSODnXORDpthxh+2LLS5RNFCZuiJnEJ5CGBLRej4x+6ArzbRobBhoQoPAwKf/qT6y48YIFzvcG3yeY93huW0Lukw2gBDrP/TEMx+YjkHmvBCloZwrtsvJgn2pHpve7Bqujc0x66s7VWHF0aYQyD+NRC84PlgKwR+K90p7pntTTrxlNB6dEjBuBmyxe+PXYiQfj4f2xuLO4mz3ilLHuRDZu6ykB1L5zsM4cJCTc0wHGKHZoGNufl3MxAx1VU3CbWE7F3el4EBhugA7c+WFs9ApbzH/pqZm8W9QYmA+xp/GK/TcBOJph18fahfG7JwOWq+89k094OOy5y1QFMPXfZoDZ3j3+uEInu/jPEqONPP/BiK53rI8/u0c9OYz0Qi39nfqjuKbj0cpLiPhoMIJD2oGUPgic9VWG8IuD0st7Y/aR5DkNjomPlb3rCmPLat4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(346002)(39830400003)(66476007)(33656002)(186003)(16526019)(66556008)(86362001)(316002)(66946007)(4326008)(36756003)(26005)(38100700001)(1076003)(4744005)(956004)(8886007)(508600001)(2616005)(2906002)(7696005)(52116002)(6666004)(55016002)(8676002)(8936002)(6916009)(5660300002)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8Pr4qQLmHhM7kxIAzmh2paNKStinBRX5uQCpKCtvthOaJ6DBhIGHvhxX5Zme?=
 =?us-ascii?Q?C6CZ6smLs12TfDx7eIZ/128xlLkRXqSWQO96+rZK6+nxHolXG5azP0B5/9YM?=
 =?us-ascii?Q?gEigzwHnQ0Bu3d6RwKa04ImxvtvgeiASpElBbSVYJ6gPTJsTTrrub+ZZxxgg?=
 =?us-ascii?Q?taz7/V5NrZpuzCVNm47pGJdPWWu9m+CAd4DVVZs5puwtBJRzlTQvfOcqwIet?=
 =?us-ascii?Q?BOFPz30bNiQ93cM5mozofxtNWCjobJqnp61Y4qbcUiVMQ+AFzqwkxXJtLv9k?=
 =?us-ascii?Q?A9Umhk4RvxpyFep75HsX4PXnMMHHk+9uiMSXIJO71BbST63HvarADC2iMmqP?=
 =?us-ascii?Q?hUnvjVBBqN4SIoN6FLsJRGFhHlGnGIT/rCeWF3VkWiTowvVqXwlg9jWrSiSh?=
 =?us-ascii?Q?fprxIm7juyJ77Sz1zXefIFhDcfsLca/Jh1uIFQbSaJuZAAEVMIxm9AEvUb3g?=
 =?us-ascii?Q?ytQ5TuwYY9t5+GuaYRBpSZhiZIpqPopkPbf/RnWRVU6mVDFK2jTQBXGYVehX?=
 =?us-ascii?Q?KXB8bJeQlkA1mVNkfq+OsUSclEuQkLciwd1r8ZVlfFZoYLgJqFZoQgLGiHhx?=
 =?us-ascii?Q?0Z0hi4s9Y2rzeiXg2eYB81LvsRN1s74riqx2Iv2WG0AtGXPEklyVeRUGYXqY?=
 =?us-ascii?Q?nWIWHkg6UXBUMLEfU/ZGvOWi6eTN0PUKsuj6iOj10IKJbEocZ8ZOy1iDpGAb?=
 =?us-ascii?Q?Q7K+FXhM8Rx/kxfyPIBPViEQ/J0v5z6uInPPk5zkzSXeGETgIEGPj21i6Tzr?=
 =?us-ascii?Q?zNCnp65PFc4QV/dBrNRSdMipiUGi6PHvJlLxx7YrCo6ehfogAPArHazEDo/T?=
 =?us-ascii?Q?KUrr2FeBXGcpl4wjqhSrUODMYI73VsoN0nHF7nuIBb6IwOOektplZZxRbt0b?=
 =?us-ascii?Q?wyy+zEFLwcvU5qQSvAXHRy8B4oNWqM+tPzcoVj29I/h9FO6G/OxWCauWsMEN?=
 =?us-ascii?Q?kfnjpLvv6JuX2lFUtnZlkhejUL2DYDEFVTIByOaPJCvdE3OOaMzMQnNLDcJl?=
 =?us-ascii?Q?bBzmDnSfVKzeMzGtF7KGuqtnn9knlEaBan9LWPJO31+xhXo0+FA9lxXudd2D?=
 =?us-ascii?Q?fDXlmAu1s+Xs92BazC2NGN20Obk4PQn4rnDykzv79UU7CF3H6IV5htf4jtGc?=
 =?us-ascii?Q?B0hSAyhgErs98rZb61p/4K0VTqiaa4tz0MNUjZyfa9GL/0PNTYQeD0bX1qY+?=
 =?us-ascii?Q?LbqduyYtvBZxiZ8fQ2IFdypr19vbLh7HqJIwfK5+xz3EEBnHmr83JEN3l27t?=
 =?us-ascii?Q?HUUT+eaH1JCd4UJFJ3R8SJAvmhmueARjfMNYrECTjbXc+Cs1+2H2LWOv3DYl?=
 =?us-ascii?Q?5EHmzKqEfIiVeEomjn2qrk5Y?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fc8f2d-9f8d-4516-f12b-08d8ed49181f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 15:42:27.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFvSn79yB0bN3NgSILxygYqjXxcCGjaGeK7VDNQTh8GtUSx9PdPfMQp4RggAEMi4oYTK6LVzQEqc+iBwtJGLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4222
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sun, Mar 21, 2021 at 09:06:55PM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sat, Mar 13, 2021 at 01:12:35PM -0600, Jeff LaBundy wrote:
> > @@ -989,7 +993,11 @@ static int iqs5xx_probe(struct i2c_client *client,
> >  		return error;
> >  	}
> > 
> > -	error = devm_device_add_group(&client->dev, &iqs5xx_attr_group);
> > +	if (iqs5xx->reset_gpio &&
> > +	    iqs5xx->dev_id_info.bl_status != IQS5XX_BL_STATUS_NONE)
> > +		attr_group = &iqs5xx_attr_group_bl;
> 
> I would prefer if we defined is_visible for the attribute instead of
> conditional registration.

Thank you for pointing me to that option; it's much cleaner and I'll
send a v3 with an is_visible callback.

> 
> > +
> > +	error = devm_device_add_group(&client->dev, attr_group);
> >  	if (error) {
> >  		dev_err(&client->dev, "Failed to add attributes: %d\n", error);
> >  		return error;
> > --
> > 2.17.1
> > 
> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
