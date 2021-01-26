Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B723047F0
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 20:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388895AbhAZFyJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 00:54:09 -0500
Received: from mail-bn8nam08on2047.outbound.protection.outlook.com ([40.107.100.47]:18913
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731211AbhAZDL1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 22:11:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1gst+DK6dZGnkxDaYznH+4DrJsqrBI8Jlfd3CAu8QO9VfFurm8qSGEmjYRwwaubrEEffm68p6vj1yJclKK8WG2RDPGu3C0Dc0GlNOfTmWWIuKHYbTnktSbwSndM4I+ntusswAOn8KkxfT9w+A8oSl0+mgRte4dMv0EnriGCgHOerDlXZpaCzm3T1kmetzxpHOl6npvBuEslacJUspyUQgDeV8ULZMCTCXFjIaQCO6w2tL3ZZta6hyB3hSAR6AAYYYMdWXMkxwlm2IkmKTqghopDJNDY5yeTrrzzfjuz1+J+0o1/rmOmiH+XPDOH0QaPpG3UndE70cHcLqLoIbr/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qal7ReR/P89aERAeS65npE7TSj5hkgQNVKKoq6S4Epg=;
 b=SOEzeq3EfrfFTRI5jxn8eygl0BH8nqjKPQfCZsOO1KgBO0DFrQq48kO7zYqmj1Na2UXZA0spTI1zzqRI2jlP8sUGm44msf9ySjt3NhwcAwbJCS0PlllKdC0CneelikokCMbmILmqDOKli9HCIcoo3xEyoZFDyS1FvDOTziUK9WZ83SHz+nj6vE0egsw5OQeJ1fazFo9/tS2jW0cFwKFa/xaJ3687bBFM9oiHMAwBpNzD7OrAgYhgSz1UBO34K/37rm0/Fm5NyJLpYaHusS2xsO5IQOmoyTVOr4MrZuIMM8GQeVS7TWgZ0OpyVAcq/Eoqb9cIRRhwwGhPQDvp9XoRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qal7ReR/P89aERAeS65npE7TSj5hkgQNVKKoq6S4Epg=;
 b=iMOZriGhjdaSiBZqv4DxXul2WVKMrI10717puZeJxlgA1SURSb0u8Mk6AdauMKDa35jDNMmJA7mUyoc2I2jvaxMO+97GlxY+Dn/bD7APMXXGlTljYUa03xRiTQpKCZX+/KrF2etCRSBvCHCDbfuWAT0bZRZ+fKO6jx0E7Sa7zG8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5518.namprd08.prod.outlook.com (2603:10b6:805:ff::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Tue, 26 Jan
 2021 03:10:34 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.019; Tue, 26 Jan 2021
 03:10:34 +0000
Date:   Mon, 25 Jan 2021 21:10:32 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 09/10] input: iqs5xx: Make reset GPIO optional
Message-ID: <20210126031032.GB6155@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-10-git-send-email-jeff@labundy.com>
 <YA5Mgtct6WFsxFVi@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA5Mgtct6WFsxFVi@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN7PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:806:126::33) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SN7PR04CA0208.namprd04.prod.outlook.com (2603:10b6:806:126::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 03:10:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c2929ab-c7e5-47f2-f40c-08d8c1a7f24f
X-MS-TrafficTypeDiagnostic: SN6PR08MB5518:
X-Microsoft-Antispam-PRVS: <SN6PR08MB5518F0197A1E4FCBEB4C23C0D3BC9@SN6PR08MB5518.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWywsKAFQum6/RjeNngYQyk5HU7PBqfEPYLmBzvZdYGQ8DGcLHiTcMMiuSTaMXG0f/HfsVAOn8wNwG87k1NlFzB0pFAo8SlsE97ojKLWchW4nRX3k3RpOOcq4Pw7vKXQY1f1X+kDC0XCZE6sXX35LRahnxv9R+ouRXAhnW/ZuZZTgYumgbwIQ9oJ4aDIGYRUxBn5q/mPyUO2IUnD9bZ/l7XGo/CYTWHyFjd0g8PPt12aAild/aX+Rz+orBcCWnoouovLizioC/XAq6zYTM+O99+I94zmer2cj0xIqOcaybBM7kFZPHZZAhQ83HH/u+Q5dz4LalRUDS+t1GnrdOxQbwDaKnZogQxxiS8EphQggSAapAZrNUQP4fpJowHz8pxE95UbWFd7SvneWPKSvgDRysf0C6lvC1VSP59BR3fSwIu4X2kHX48Th0//zGonfUlqYEwT2Zy6xVa7ieTCa9jiB5lNdsX2oL0E6rHMzIksnL2hSEj3E6yQlVHD32j4hXTBwxx3jLgcTAiLI7oAom9mY5pArOpn5EVKu+D/EcKnkoIRsLlu6YGrf9yTYhFkBOiI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39830400003)(396003)(346002)(366004)(4326008)(8886007)(8936002)(36756003)(86362001)(52116002)(16526019)(83380400001)(33656002)(26005)(186003)(478600001)(6916009)(8676002)(55016002)(5660300002)(316002)(1076003)(2616005)(956004)(66476007)(7696005)(66556008)(66946007)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p5PhLEw8Opd0MI+JwBJBJiGrWUDeVx089sm3bI5YH8QI+dUESmXL6iPef1Io?=
 =?us-ascii?Q?D7WWW32N7D8n2OjuNflSVHAbxP8ZqKECZ8Kc9srDL291yw4BbMzXQCFaJ7NK?=
 =?us-ascii?Q?lS64Md4Vp7tr/xHCoQ0B8Rpz1vSOtJD6IhWYFUrCx5N7BKwiEbCIc7QO5ajB?=
 =?us-ascii?Q?XmDyQ/KAdgYUA49aMWvlICuCcMPqUkx/gC53ESSyhi4ypYWDA+dCyIsXbMiH?=
 =?us-ascii?Q?NeDDEvSpFNqLy/bAjA01zQ1EVoO3YPjyFHx3Sukx4f/PN+gKi8mPFviPGrh/?=
 =?us-ascii?Q?mEHvBuPXqujbVoQjFLa6SHpzzuKj/vhNMPVwTz83qIArNPPht5TUHBHfPXcP?=
 =?us-ascii?Q?hDpoqnPGj9eMv7Wr2H4q03exT3tCpFdxGhjBkA0io8b1qvlHD1PjJODDXrjo?=
 =?us-ascii?Q?SMlRkaANVACokC9lYjlVZIBifzIe4MEKz6kZfFL03zVrWC9kqFljVgqbg27k?=
 =?us-ascii?Q?XuKQEo60m52daR5poDD+oQqYQczTRzXM6ah/EajWWyamwd1XEQPmGQ0j3EQQ?=
 =?us-ascii?Q?SGKNgeqkinVD4/rdp45e95h443qOq3eBQwGiJZImDKmrV+sJYGS+qpm65oJm?=
 =?us-ascii?Q?40rxWiSvokuXsuQ0QAJ7Pw67glzCK0rn/n34OCPA6WtQAKrzwAfchnBGDH06?=
 =?us-ascii?Q?UlJ9HjwK3cJ1sjz0yBn/o+oDZfEO5/jsg1C7tE+sP9rAO/40akrN4Xzk5WfD?=
 =?us-ascii?Q?kcsfhknldgKlor+X/dW8/QwiHTCxKwBYlssgMYFK7deEpsQQU+KH31F8bwed?=
 =?us-ascii?Q?NVhV7/+/7lUdhaVCblJrFO2fXNt3J+VkRmuQOyf1eRW9ONtKQtAA0MA1xTDx?=
 =?us-ascii?Q?M9FgdrVnuhMGUuZXoub0Y+SrgElIArHSbL41Dn7RInMNgfIgH8HyqhijEEcL?=
 =?us-ascii?Q?BJyD+j8sjARWsj9V1/gL8uQ7cgVR9dKWbVzSMn6cSh1j++LnXTJXErYm21B2?=
 =?us-ascii?Q?r0e+4BjQcKYV0VCUmrMkQrqyRdBNmGkddRfEoBykXpLLfNYSRg2MhJ9JPGxm?=
 =?us-ascii?Q?l8F8P8I3PgIKG9EYI4kO3PXSUElpCtfuTnAAkZlW+qnONajYXcnbPHc9bs+q?=
 =?us-ascii?Q?eyW/2eqk?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2929ab-c7e5-47f2-f40c-08d8c1a7f24f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 03:10:34.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYUM6MU3uFb6vK7hqoNyfXFmoC+zmiek7Yd/bYxpcom70gIrbzj9XygLhzU/uAFL4UZufRvBq4tFaXHcGOgq5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5518
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sun, Jan 24, 2021 at 08:43:46PM -0800, Dmitry Torokhov wrote:
> On Mon, Jan 18, 2021 at 02:43:45PM -0600, Jeff LaBundy wrote:
> > The device's hardware reset pin is only required if the platform
> > must be able to update the device's firmware on the fly.
> > 
> > As such, demote the reset GPIO to optional in support of devices
> > that ship with pre-programmed firmware and don't route the reset
> > pin back to the SOC.
> > 
> > If user space attempts to push updated firmware which would rely
> > upon the reset pin to wake the bootloader, attempts to reach the
> > bootloader are simply NAK'd and the device resumes normally.
> 
> Can we maybe make the firmware attribute invisible in this case? Or
> return early instead of failing to enter bootloader mode?

I almost sent the second alternative, but instead I liked the idea of
restricting the check for reset_gpio to the only method that actually
uses it. That way, nothing outside of iqs5xx_reset() has to check for
the GPIO and can just fail gracefully in its absence.

That being said, either of your suggestions work just as well; let me
take another stab at it.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
