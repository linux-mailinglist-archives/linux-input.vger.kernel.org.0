Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EAC26CA8E
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgIPUIC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:08:02 -0400
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com ([40.107.243.82]:24801
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727217AbgIPUHw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:07:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6RMvajsExL4vn7RQFhXSPRebuMyB/09fvBWSzI7y5u1QwKv2qzwWUkv0NO5Ep4nKkGrOGsgW82W0134tu0HkGN8evGWkZlfZT+uFyUsBSSR5Cceq+IuhusrTnorszvdPOQ6Dj9/pKM1e+oedrAWjeS3Z8sQLdmK2DMuGKud6WrB6LDP3hwCCn7D7Z/ZRxG54H5RysuUOGka2NltIgv4I+kwTo++E3EDfqif5pMywL1HAkOP3i9sYeCd3hHxM4qi9qPNbsNCwtdkoc0jUBJgJuC+QWbA6X5+WVRQA2WSV3Cy8A6rK4sIeGlczqg/A4iUVGmOd2XkOFhZjBG+Hv7nwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63Es/DO8g0FjxwMzBiBZrkY5duzaygXLtW9VY6FXI3U=;
 b=newZxsuuZzowZu5ze2k8aei/j0/qgmQGkBIOtdGiTZcbObhaFx1jTjoY4toxWiW8MtXTeFiK+HL4SmRY5dU/eXjucKE8GJPa5yARphc8S9LotYszjUBFzvoa7MGnU3agC5MzpvOv+eTRCp9gqw+YdSlCiKkvHX+o/la0MWj9vABSg61FHPkxT80YQ+Ie8r840WtoY3/eFsSBqOpmQAX3xsHNzU9sI3iNWzjZ/1MErCvWadRsMWiV+nRVHoB0F6nPLaJvMiiaEljcHLcThUS/YvQQ/4YU3Wxirl/vDsCXo7T6YHJ8JEiVfqrBhEV3m0mMScKr36IIyvBInBIMSymVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63Es/DO8g0FjxwMzBiBZrkY5duzaygXLtW9VY6FXI3U=;
 b=y1aruoDC9WrB8WwTcqVzWSzBIRNQ7r1Qng7r5EwUnuXhlqS1HYlOSBXxF6kdxXxGmZYsMab0n3dLxQgA2vsiiXJzbkm6nobD9TyEvMWnGEqVPOr0OCt6mRbChYu6Hey6RxnmFZIg1xxHU4ovk3FoSug0hcTfICPRGh5vtXkLxhs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5216.namprd08.prod.outlook.com (2603:10b6:805:77::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:07:47 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:07:47 +0000
Date:   Wed, 16 Sep 2020 15:07:40 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [RESEND] input: iqs62x-keys: Remove superfluous function
 parameter
Message-ID: <20200916200724.GA23074@labundy.com>
References: <1600276053-3336-1-git-send-email-jeff@labundy.com>
 <20200916172559.GJ1681290@dtor-ws>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916172559.GJ1681290@dtor-ws>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SN4PR0701CA0042.namprd07.prod.outlook.com
 (2603:10b6:803:2d::16) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by SN4PR0701CA0042.namprd07.prod.outlook.com (2603:10b6:803:2d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 20:07:46 +0000
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21095f86-7a4c-4ba2-f6a0-08d85a7c2df5
X-MS-TrafficTypeDiagnostic: SN6PR08MB5216:
X-Microsoft-Antispam-PRVS: <SN6PR08MB521601EA658698ECF5690CF3D3210@SN6PR08MB5216.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD9xhRT+IA0LFD1p+EkjPcSGMUVW7uECTnyrZYmnMT+8inbzKqi9EChRO12tPo/vN4yl+7WpV9vvFaTBlt+iJFa9OfO7bzBXZvG+sb7r+xHUrMSvh4niux+g18Ae4S/6DJJHG1j1yTdB0EPaxsNXFSgJywNcUW5FZwKz8Kw2TKWjZMC6sIXo+SEVxhBJQNxxCXBKgy9NeFkKjGiTR0QzS4avZGj4KNwovmPyBH90c/TH2iFE9yB7v6Vhl9gTsNMOzRvxV3jVR440sNvlegCxhA1RVinQyisk2XJuqjqz1cptf5r67mf135W4zd1vQOt3quvmohCL05wa38NI4BZIEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39830400003)(346002)(136003)(366004)(6916009)(8936002)(36756003)(5660300002)(956004)(55016002)(8886007)(2616005)(66556008)(16526019)(66476007)(66946007)(2906002)(8676002)(33656002)(478600001)(316002)(26005)(6666004)(4326008)(186003)(86362001)(83380400001)(52116002)(7696005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ejkZA3BKufb4HenczQqZFC+cRK2OgK4JWz22Tg18kIyJR6cHBmR2Dovn6L5DCOvIKWRIYZ9GUNjFbs3Eaur+AzP2JnJ6Du6oDdpWCz8LlvN2WnZQQDfkoWfn/AjZz6pl9R6WvWdSkWVTDyHsUEXax+FB7X1NN82id0D1BQ1BTmPFWR52hA0wu9aUnSY0OcYvorD9+9pGXu7UgxA4QsQPdFZXPmzrri2FBZTIny/D90M+ZEhSHo1DIAm3NloCmW/1xHg2TYS7O+msMok5N8ik1zXb9ow3AKgqZ+FEmOu6BUwgLmFMkOGr1abXDIhmKu4fZxIiaaBVnXqbzs2KaSaDtXXMgXHYN3adkT+JBsR1AgtJ2AiZLueTtarqu3aPCAWfyTmnThwEcntYmyoZDWxvR594/Lq8+jUCVbRC9rgCUHbw7HTUDbuPI7mnRrNxYYbgkK3Rk4dNSoEjJk2arBDhF5R9d1RA3VXGnLNd44xKNqRXCQi3EBjOmNzsoQ/POOVwy9BIEMJpcaLXbYJ3DYwKVTjfAduTdyEZKsfLpfr4y+pjvwqWwdpNinR9P+ojCl/LOsC/F05zdZKz+15gbEWiclHgOgPgHRByKJy4CqP5kV6RTRHl4knsVfAY/VorV+iVUVwnNrEPR/dzYOCk5fNMqQ==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21095f86-7a4c-4ba2-f6a0-08d85a7c2df5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:07:47.0101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLOH1ZHFENqt2BjLfXP3qGIMTwFsyLqKCmlFWj3xfkV/s7aOYo/GfTLcTfeIW+kC/Qx7pZG6/sBDQCfjYx94hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5216
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thanks for taking a look.

On Wed, Sep 16, 2020 at 10:25:59AM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Wed, Sep 16, 2020 at 12:07:33PM -0500, Jeff LaBundy wrote:
> > It is not necessary to pass iqs62x_keys to iqs62x_keys_parse_prop,
> > because it can already be derived from the platform_device cookie.
> 
> Yes, it can be derived, but why is better to have it derived rather than
> passed in? Is the code smaller this way?
> 

I think it is better practice to limit the function's parameters to only
those that are minimally necessary. In this particular case we only want
to populate data in the same iqs62x_keys struct that was allocated using
the original pdev->dev instance, so it seems safer to enforce this by
only offering a single parameter instead of allowing them to be separate.

That's all but guaranteed not to be a problem in this driver; it simply
caught my attention while re-using this code in another project. I would
be happy to add more details in the commit message, but it is also fine
for this patch to be dropped if you prefer.

> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  drivers/input/keyboard/iqs62x-keys.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> > index 93446b2..e2a2b38 100644
> > --- a/drivers/input/keyboard/iqs62x-keys.c
> > +++ b/drivers/input/keyboard/iqs62x-keys.c
> > @@ -42,9 +42,9 @@ struct iqs62x_keys_private {
> >  	u8 interval;
> >  };
> >  
> > -static int iqs62x_keys_parse_prop(struct platform_device *pdev,
> > -				  struct iqs62x_keys_private *iqs62x_keys)
> > +static int iqs62x_keys_parse_prop(struct platform_device *pdev)
> >  {
> > +	struct iqs62x_keys_private *iqs62x_keys = platform_get_drvdata(pdev);
> >  	struct fwnode_handle *child;
> >  	unsigned int val;
> >  	int ret, i;
> > @@ -258,7 +258,7 @@ static int iqs62x_keys_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, iqs62x_keys);
> >  
> > -	ret = iqs62x_keys_parse_prop(pdev, iqs62x_keys);
> > +	ret = iqs62x_keys_parse_prop(pdev);
> >  	if (ret)
> >  		return ret;
> >  
> > -- 
> > 2.7.4
> > 
> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
