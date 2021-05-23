Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1CD38D867
	for <lists+linux-input@lfdr.de>; Sun, 23 May 2021 05:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhEWDLW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 23:11:22 -0400
Received: from mail-mw2nam08on2080.outbound.protection.outlook.com ([40.107.101.80]:7649
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231528AbhEWDLW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 23:11:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhDR3rL0pp951SnX2adkb4JJnXDYmh6hHFqdp+7t1EjhG6V5jrypE/8VZ1+c/DvZu7Y4frezNPqwD4FLmvRvL0mV+b56SAYGxt9fZ6CQM76J5O5Hobvrbouf0OD+CFSzHzvSs/7RtpD8/i+fEuUwzLKun1Yfo4JtpbK9S1XQnWyej1MtU+YmLdicvPsqDF54AGAlKMnlrDfg92HKekS2Bo0DXwZuyxnHXmaN3zBE6giYg2hZIusPqgWzDORwV5ZIWMDCVifpKSxJTKR4I0ANA2QYsswy0vwHtp16lTVoBldD3LP4QeBWNMJ8Cz62qo2EyJl6HN0F9lg+u3YTXE8Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEqZSmfBxQpnPeSL1PALbZcIrQI2Lqe+adM/3E9zb04=;
 b=TsTGZb0CUIg0rxYfPzotCdgk9cX91YUXKx8UxpnVqvKAoRNIsiU8jcfY+my8jzPH17T7I2CoD9v/JqUcdH003oX6cn34J2gp0ckIgwYhdRsBb4qoja8lkS3Ncy04kORJyQxOTSsRGPg4POR5zYzyyYDVd+d5TuUx5fgkq2vRFyMmFQM+4YdWUAg/jE0fH6PVGN6s1LlcdTQiE0VrWlwz0d+qjXfdaM4gjvi8PGodXBepYu0cU2ckpLM0qF83dX4CmuKUGnTYsYePCQC+kqN9gnAfcTtdObyKbpdZt0snXncAEEqSXp6buF5eKzq7piJWkOZv3K66i0+QcbaroRtivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEqZSmfBxQpnPeSL1PALbZcIrQI2Lqe+adM/3E9zb04=;
 b=D36gkkzKzGQmz80eKaw/rn/nCAZOvAGsbLML6rkO7m1hw8Xga24YwMAitnwYNDVucindzZEYfEVllIeoOAhn0TlRYWJ8h0h9Dcd9IXV+t6K7Iy/YmS+Hl/k8RLBULQqDPz0oj0kyYwp/HyL3lSzJVw61+dvf2YHPRDYo6/a0RbM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB4838.namprd08.prod.outlook.com (2603:10b6:a03:61::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Sun, 23 May
 2021 03:09:54 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::ce6:886b:ce27:b4e4]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::ce6:886b:ce27:b4e4%3]) with mapi id 15.20.4150.026; Sun, 23 May 2021
 03:09:54 +0000
Date:   Sat, 22 May 2021 22:09:49 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 1/8] dt-bindings: input: touchscreen: iqs626a: chnage
 node name to pass validation
Message-ID: <20210523030949.GA27945@labundy.com>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
 <20210521044525.7397-2-o.rempel@pengutronix.de>
 <20210521170830.GA14903@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521170830.GA14903@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::17) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27 via Frontend Transport; Sun, 23 May 2021 03:09:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1df0282e-6284-4721-751f-08d91d983ce7
X-MS-TrafficTypeDiagnostic: BYAPR08MB4838:
X-Microsoft-Antispam-PRVS: <BYAPR08MB48382CEFB8566A55EFC232D1D3279@BYAPR08MB4838.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UD26Vs/0qag/DdOufuEfwLxXrM4Pe3b1tkU9Jz2QShYnl4ja1mPXaB83LyGbv34poHg8T4oOK+tSyAjM0RKEJs5KGsEmxRIibPA2sYTxv9SuXWp3YMOyeSPh0r4zA/4/E7N9hLDLd6vlU4ebxcMm/7cOm5FOYoi3ctyHO4Wq+6NadUcAK0xx2Qs9xpCNBTzY/d+ZYigsFeXzj6rIndOcuzvERvkxPIzkt6V4BPbrDl0Ai490Nw9m+xdNrimzfuNkmYIA9zWoAejSuCiJE6kD1HQwKo55B51LjH4Om91Kr8WMNtwl5WPXUf1gfM70ZkODv1BDC8RSqKuB7IcFhqGjABRS3l2nX7yWXbfbNF+lHisvt1nTwUgs1TBEYbSe9Z4BoFZj5O9+2prcyfkx9Umm3MxPyIn+qEknoDzUTzOnbkscuy+C9MYvpuIjiFklzNnzV3mfKRxKAwbfpwR7sIHewWmU7dMmAXWvNoYRdkF5PughaRS2KyulYnUWzF1fmG81Jk8d9lD90TCecJW9Ec2ORmTAVYl3lS62jLkBUd9K4Pt/6lyaA+jKpfJ69vPbhdMBi303T6HCqqlrkBzESqJl91D4mYvqNe5Lq0BOuSSBtdexoIYFsF6xTVcIydnB4SpR+Ee4op2vfxPcca6Sh6mtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39830400003)(346002)(376002)(366004)(956004)(66476007)(66946007)(7696005)(52116002)(26005)(1076003)(316002)(4326008)(2906002)(16526019)(5660300002)(186003)(66556008)(8936002)(2616005)(4744005)(83380400001)(38350700002)(8886007)(478600001)(6916009)(36756003)(54906003)(86362001)(55016002)(38100700002)(7416002)(8676002)(6666004)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lJziP/SQuigPrKM67g2Unk8KNJ/1MNt85UxjMm+iMs26UnqF+4S3uNuxcoWC?=
 =?us-ascii?Q?dfum9gIJBa4GN8/CdhzW1ayaRdo0SmKC+YghCKgBBmjA8twxdqtVeUdIR4iE?=
 =?us-ascii?Q?kSlqARbKCGC7zGrgpQD8SMDFu6l4qpUbI6UC+0yHj4+c7fnhbOy/o0zuM1ng?=
 =?us-ascii?Q?S1ChG61hbEohBApmXhV/Qm52zvxLSX7MfW/4LkZiBacdXwGL/hgW5OoQ745s?=
 =?us-ascii?Q?bulbxYOII25ZcEkPKdkfjLYO+JojA/mvuFRYcgMW7wgWLFEVbX86ZdJjv9D5?=
 =?us-ascii?Q?/CmOZ0TEN2z+y/g63F3kmvWzmX/a42SWPGvVhL/L0N5iYSes0xgm+ZWH0k8t?=
 =?us-ascii?Q?tejC8UaYhxZk33CjKgEo4yKWre5GfI0fJG8FGo4MRAxr5sXKqVoBj+0NmqCr?=
 =?us-ascii?Q?kzvKPtKTYoxOjBpAuuzvWYLUnefucOT8xeQmmZ8Ob+P+e51kP9mw8qMM6N3I?=
 =?us-ascii?Q?u2OcvzbDoCtreamZoIrnMHRUBmWuzUhIJkxI9cbodPRHSeOisw4XZAA9yfUy?=
 =?us-ascii?Q?DXmpEW4U4kfl4N8KaqeDuDZkGi0I8G2F0q+3RC3PkVyZGtJKCd9pbIfdpO2T?=
 =?us-ascii?Q?vVY51L+fsQLzyI/xMO6NBeMgm7YQ8bk4Sb8IHwWh/O5Tx8HEQS1cIQtAgpZK?=
 =?us-ascii?Q?r8QeRtsgE9DPS+O9V/5mEp/TQgSFCmxQZTRRHtld1LxUqfM+DbMXs2Qr0UjA?=
 =?us-ascii?Q?ZZ12cieYJ+/OjrKvraydUrLQWL4MFJk60iLkr4+j6LlQuSCL36gD4y0ofQ1m?=
 =?us-ascii?Q?O3erhU+LZupl1dGBJ4Ff3aXjcFE3Dw1vmD4zFe8sVHDaxUEG3R+xU1ZjtUGP?=
 =?us-ascii?Q?h00xepQdlhQhyOAfJKbRUb36u3xEjzBtK6dzCaDCSDFvfrFGP8phtZEu/IVf?=
 =?us-ascii?Q?Q8mmRtrWBT27ahqXyeVvxsli15r5EQj3r5LXyN1lC5Mr2bKerpciqbERNHWq?=
 =?us-ascii?Q?yiJBWO6iUM7iLE8LupAIJtY7qGSnAwCNvwF1nswARRcyy6wi+b7SzEQ0IOsc?=
 =?us-ascii?Q?nUg144lSuHXaup/7peYKV22wdgr66vs4fGrYM10L4oZRhSeltMOFB81rsSdZ?=
 =?us-ascii?Q?KjojUjwlwq3r/r74WRzIJjh3MrsM0Cn4lZi/0Y1RycoL9aRwvsfTyBDbdaLz?=
 =?us-ascii?Q?6L2fTc2EuswtcSCs+Ud1hQfR86S05+5tEIX1DTz2KSTLH7ps/OJ/Pv1VUTEi?=
 =?us-ascii?Q?bcQo5Dog000RXk1EJSif50edOiF3MizmUxhCdiihEHS/3qOzLufcErMC2hrb?=
 =?us-ascii?Q?XqEjH3emSWDz7Fxkvp4VveetY4v4ekGz7RojUG3T7sYNGV97XYnAwrXgnuwj?=
 =?us-ascii?Q?SvdOVgwhP5zc5msg7jxIzHvl?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df0282e-6284-4721-751f-08d91d983ce7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2021 03:09:54.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvTtpXjQSUzejoY4fJ1GhhLfR/Bd49rLXK+10RqXg6wJbYfsSgsIlMEFodEca4/0Ml/oU59gWq1j8lfM27b+CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4838
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleksij and Rob,

I disagree with this patch; the device is neither a touchscreen nor
does the example include any touchscreen properties. The end result
is confusing.

On Fri, May 21, 2021 at 12:08:30PM -0500, Rob Herring wrote:
> On Fri, 21 May 2021 06:45:18 +0200, Oleksij Rempel wrote:
> > Change node name from iqs626a -> touchscreen to pass dt_binding_check.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/input/iqs626a.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

What is the failure returned by dt_binding_check? Is it because of
the reference to touchscreen.yaml? If so, I'd rather we update the
tool instead of appease it.

This device leverages the touchscreen helpers for axis swapping or
inversion in 'trackpad' mode, which any input device is free to do
starting with 5.13.

Kind regards,
Jeff LaBundy

