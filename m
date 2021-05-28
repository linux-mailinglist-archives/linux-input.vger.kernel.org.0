Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1D5394556
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 17:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbhE1Pp6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 11:45:58 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:43144 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235056AbhE1Pp4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 11:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1622216661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         resent-to:resent-from:resent-message-id:in-reply-to:in-reply-to:
         references:references; bh=JkJUm5Q5nZldJdHVI3HDwOi/C3EsQjgUPI0rXoYKGUY=;
        b=ejL/uwGc3uY4Gz5oGmajmnIHCNinJoQXTtUUNSg7dHsIFWdujH4HvR/pq6g0YctMyWfT/k
        ohpacmeMkKQnHr0Uu0pI/EgmvzkaXgaWguJ3p3Q2M7M+WrOIoG5eS+KBeBUeXKhW+PSKCs
        UCp/6TNBBoNSyWbXwrykIK+0AeGgxrQ=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-nxflrI3DORKKugZYRygFVQ-1;
 Fri, 28 May 2021 17:44:20 +0200
X-MC-Unique: nxflrI3DORKKugZYRygFVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2IJ+aeKOxXQlipIPlF31/S5C5EqfnoOefyun9L/33w3q193VvZ6eOh8OvHR4VzMmDAC/thOHi+eHX/Kl+HkNMGEPLObKIWPhyc1Pbo09ZYaIEn5fxTK7+SMySCpZ+xk4hIkp3nLSMHGVyPdUQtm9O9FUqcTPSG3aNnn73NLJsO6tGn+9REq1x8UBm0GdmPyRx2LJ0no6C0UwqVSLhoIeo+Z8sm/Y/NUzTZ8mE429nZM/uLFhTTtFnLRvnjAPs9SOtSIoscW+DydfWmopOc9/ChgLj4SXZQ0ICZYULzqwVBUIZzUOjnq6AZbudTCbOgeXsPaW2b1XvfsVz+lEwA7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkJUm5Q5nZldJdHVI3HDwOi/C3EsQjgUPI0rXoYKGUY=;
 b=BjJpfLarvgiwlFnADVenJioWszmlIxOAz3OQYNXLTxHQ4KbRSW40LPo1+Yj8aFTKAb+EUr6JNiYj0PtbGekUruXNz7jK/iDBkokcTkQOoBIq4/burm6q6vL5tnBWszw2kK/Xx0Zdyw6WCdzujGq/ab7YY5nZcSyLcgEdr8baFUahEwShzrwRxmA0kWj9LD8cxV/4gqzTrG8vkFVNCMTPdV8Ju2MSnbBYcBjcWjHjljiZlbqvUCrJcMl8QiYcfohmvdzNh8EktW+ciUJf1Sf6FLZTRQQB+tqONLFVmjGQ/dq9IC2GkIZohT9qbxm/xQKWAQk1Xf2v7XmE9mVOqvH/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AS8PR04MB7942.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::13)
 by AS8PR04MB8385.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 28 May
 2021 15:44:19 +0000
Received: from AS8PR04MB7942.eurprd04.prod.outlook.com
 ([fe80::607e:30bf:3618:1a9a]) by AS8PR04MB7942.eurprd04.prod.outlook.com
 ([fe80::607e:30bf:3618:1a9a%3]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 15:44:19 +0000
Date:   Fri, 28 May 2021 17:43:39 +0200
From:   Vojtech Pavlik <vojtech@suse.com>
To:     Egor Ignatov <egori@altlinux.org>
Cc:     linux-kernel@vger.kernel.org
Subject: Re: Problem with i8042 and PS/2 keyboard on HP laptop
Message-ID: <20210528154339.GA9116@suse.com>
References: <f586401d-73af-097f-812c-f033a922bfc2@altlinux.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f586401d-73af-097f-812c-f033a922bfc2@altlinux.org>
X-Bounce-Cookie: It's a lemon tree, dear Watson!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [91.219.245.66]
X-ClientProxiedBy: VI1PR07CA0291.eurprd07.prod.outlook.com
 (2603:10a6:800:130::19) To AS8PR04MB7942.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from suse.com (91.219.245.66) by VI1PR07CA0291.eurprd07.prod.outlook.com (2603:10a6:800:130::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Fri, 28 May 2021 15:44:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43423c0a-d534-4841-9dd5-08d921ef74e5
X-MS-TrafficTypeDiagnostic: AS8PR04MB8385:
X-Microsoft-Antispam-PRVS: <AS8PR04MB838508D10E56C229AA734AE2CC229@AS8PR04MB8385.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3NDM2YItrxRjynTCRsOQaj6Euyscx+kYjc2jZxt0ZLc1Lr59jdqdKNbSQZVH/KYp4vz67fVuHavDXhT6QTtYqGYsMAgg0t2bYnind9U8rgLgM74CvWs6j2GNJEXGGwA+XmPxwYY45EsxKl8Q7INnVrjlidWMzBAIgbj3NDDXgQj05MQjjVx5gT4ERIJ/jPyvhCtxQsM2aHMb4jfrUcbjqPATtlLIhBO9daSr3gaAYJlYqpsF/n+DjBaiKre91Uj4vAlQfEg0QIEvLJX9HX7kWptw8GOEtr4fAvFX3IYcRPa79h/76IzmEbYTPe1xxzeoo4kd8YXJyf0oVjlckBKlhtv4q+ZlUQqTOHqUcNUnW6F79xmH8N9lr25+QxPp4ugLyG0VA7ONzIbRDiNf6ASolWhy9EccPbcTW7oVK22qFWecy3t1TxVG8PvSy0e3kyYEEkXmHlkvFoudUMHDGIZwPR9znWoe+HdfIFsARjnfGYVZnuVAWJ5JpK5tcfIu0Y+caoCoo5QcZ6IexAWaMk+gHUvnPLbNgmsRui0cvgj35rAJpBZhUvi1YxNZNPuq6SfyOzvAGIKWjExoFhrAp40VSrYk5K3Uo+LvXyoQB1MW9jGcuKoitHT/qSomOdXCqKo6rMXTu7Z18GT8BriMo6gI61UYt7G3bk5I473uWGhw8uE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7942.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(376002)(346002)(39850400004)(956004)(2616005)(8676002)(8936002)(316002)(4326008)(6862004)(1076003)(66556008)(66476007)(38350700002)(38100700002)(66946007)(5660300002)(55016002)(16526019)(83380400001)(2906002)(52116002)(478600001)(7696005)(26005)(86362001)(186003)(33656002)(6666004)(36756003)(8886007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1T1zbaTr+LOEMNiRH19vr1EMaFV9dPPIlGq131PZqBehpmcn1A7j3zGsl6rC?=
 =?us-ascii?Q?3j+5ESS9tqJgJvTUczZFIdabg/5AOqec/bJj0NLb6lSBc2EXrIRKOLi77zcC?=
 =?us-ascii?Q?zFXuRG98zAfyfktHvL+aBrJLG78LgRLj3fc50q4cblKGcPU9OJGjFsgRZno4?=
 =?us-ascii?Q?+MuRUZ1h3Uv8pj1yzhEaTTpOKn3Lzk8wM139xub5P4EBqqI7qR5BA3x8LpMZ?=
 =?us-ascii?Q?2pQt61qapqL17j4siUobHFo6f6JJ3571NQvrvj1WT7vPR8iiScQgCZ39eFab?=
 =?us-ascii?Q?2yRy/c00sED4I6WaZ0uwgEC3gSBFtVyEIhYEkXY5HgW1g7Rjm+gA4BLX0uoT?=
 =?us-ascii?Q?kI2qK3SFlQ4sYY3KWRSdobfp+nWvJu4f9iYGSCB41/sYlfqWwdbfdcu5rp3X?=
 =?us-ascii?Q?IACBgi0h8/6C75vOjV4CZdUMReSNu6IcAmzx0159Isz09Q4S7Cx/wdsnmrrD?=
 =?us-ascii?Q?lfJVANzxQUpLAziXOC/Znz8R/lzH1FTcBr9ZZrzZjwQv8Y0Rp7mEFjYtL1TO?=
 =?us-ascii?Q?W2dPNMlkvTl8bFtqlZW/Ikq+0D83W9OoKqFkh78OVv/RhvE3p88EbRKRqYGA?=
 =?us-ascii?Q?DM4BY/Mbr4sR7gxqgSa/hA1JP0aSwuwwZ7cBuFKr+hZNi5UrONDKGx825gEA?=
 =?us-ascii?Q?ubdTPDPtD5mFtNSQNFmjA2UxzWogKsK7ocZRgc5xYmaoMEEAb68QLX4ctFYP?=
 =?us-ascii?Q?4phydseB8esIU6gNewu0JnJG7MLvi+7lZZHlTaPDHcDA6BsbFFhzeGV+DpbZ?=
 =?us-ascii?Q?ZA+a2s4MKBWmSgCxzGCagduGMOKgdP6nVK5fdLC6S/ffkXxmwDlxtYKc+NY/?=
 =?us-ascii?Q?6nwRShwb1xcLMQNuDVjrCVbsZrdbjHBAaNbIzWpFR6to+265HCUPukMMriE+?=
 =?us-ascii?Q?e/QhU0aAjs5MlRgxLDpL8c/gvuSB5Dl5+UUkpQF5N3u9HQmSN5JuIl4U/flF?=
 =?us-ascii?Q?MJTSBS3kwm66oa/VMCYhMeg55H0rrOVmMLflUhiojFBU3Wz7Spnxc+ELiuRd?=
 =?us-ascii?Q?qmDygCaKPnCgb8mjwYO7NGM3ItimlIIdcnj1PXHIsWZzxwgdB0V1BudStcPx?=
 =?us-ascii?Q?Jfmnu+/Y4YJXZncn6fAh79jlbntc4i2qZLb+08C6FxXfaOGOE6QmDTrA+xPU?=
 =?us-ascii?Q?kcWmpq1Y0m3DsV+4r6RhcaYFlU1wIpoWGb/pD9Z1vh0a51FsGtxNYb3mYT1y?=
 =?us-ascii?Q?kgfmNgP+riHokCdgrwXLkHAvsoi5pMxJFiNnaZOX2RUKfUAoMUr1W8RyqwAc?=
 =?us-ascii?Q?BelDb1YwWclMx7JhQxBTxTYsILpAji9McIud4kv0XbcbBWeVYXjFJT/tP4WV?=
 =?us-ascii?Q?kWt3eBkuir9pztO4r76tgAPZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43423c0a-d534-4841-9dd5-08d921ef74e5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7942.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 15:44:19.2946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXHXLK19D57irGe4hnUGJuU0EH3vWMHSSuzJZtafRxqeeVVY6OLVZZDGWexuza/boZQT6XyXS5oBRmtPlPBOOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8385
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 05:02:53PM +0300, Egor Ignatov wrote:

Hello Egor,

> I have a problem with the PS/2 keyboard on an HP laptop
> (15s-fq2020ur).  The problem is that after booting the
> system, the keyboard does not work.  But it starts working
> about 10 seconds after pressing any key.
> 
> I looked at the i8042 log and it seems to me that the
> problem is that the driver does not wait for a response to
> the GETID. It receives ACK and immediately sends the
> 0xed command without waiting for ID.

Actually, that's not the case if you look at the logs:

Here we send the GETID command

> [    0.460964] i8042: [1] f2 -> i8042 (kbd-data)

And here we get the ACK for the command back, 10ms later.

> [    0.471708] i8042: [12] fa <- i8042 (interrupt, 0, 1)

Here we wait for half a second, as you can see from the timestamps, and
nothing arrives. No ID data from the keyboard at all.

So here we see that the GETID command timed out, so we try a backup
plan. Some very old keyboards don't support GETID, so we try SETLEDS,
which every keyboard should support.

> [    0.977581] i8042: [518] ed -> i8042 (kbd-data)

[ .... crickets .... ]

There is no answer at all. We should at least get an 'fa' response here,
so that we can send the parameter of the command.

We wait for another 800ms and nothing at all arrives.

And so the atkbd_probe() function gives up and returns failure.

Then it's back to i8042.c's i8042_port_close();

And it issues the WCTR command with 0x64 as a parameter, to disable the
keyboard IRQ (dropping KBDINT = 1).

> [    1.185586] i8042: [726] 60 -> i8042 (command)
> [    1.185686] i8042: [726] 64 -> i8042 (parameter)

And then i8042.c enables the interrupt again, to look for hotplug
(setting KBDINT=1):

> [    1.185842] i8042: [726] 60 -> i8042 (command)
> [    1.185935] i8042: [726] 65 -> i8042 (parameter)

And oh wow, once we kicked the controller by toggling the interrupt
disable/enable, see what's coming in!

The GETID response!

> [    1.185975] i8042: [726] ab <- i8042 (interrupt, 0, 0)

But something is suspicious here, the "0, 0". The last number is the
interrupt number and the KBD port always uses IRQ1.

So this comes from manually checking the port for waiting data by
calling i8042_interrupt(0, NULL); at the end of i8042_port_close().

And the controller that got stuck after the GETID command is unstuck
again and properly generates an interrupt for the 2nd byte of the GETID
response:

> [    1.189909] i8042: [730] 83 <- i8042 (interrupt, 0, 1)

Yay, we got that.

Now an incoming byte on the KBD port triggers a hotplug event, we think
there may be a new keyboard plugged in.

So we repeat the detection sequence of atkbd again, sending the GETID
command:

> [    1.189952] i8042: [730] f2 -> i8042 (kbd-data)

And we get a proper ACK response:

> [    1.200096] i8042: [740] fa <- i8042 (interrupt, 0, 1)

But what the hell, there is one more ACK coming that shouldn't have:

> [    1.204012] i8042: [744] fa <- i8042 (interrupt, 0, 1)

So we bail out. An ID of 0xfa is not a keyboard!

Back to i8042.c, we toggle the interrupt enable bit:

> [    1.204031] i8042: [744] 60 -> i8042 (command)
> [    1.204124] i8042: [744] 64 -> i8042 (parameter)
> [    1.204272] i8042: [744] 60 -> i8042 (command)
> [    1.204364] i8042: [744] 65 -> i8042 (parameter)

But there's nothing waiting for us, so nothing else is happening.

> At this point it doesn't do anything until you press a key.
> Then the driver starts sending GETID repeatedly until at
> some point it gets the correct answer, after which the
> keyboard starts working. As I sad it takes about 10 secs.
> 
> Here is a part of the log after pressing a key:
> 

> [   11.103249] i8042: [10643] 1d <- i8042 (interrupt, 0, 1)

Indeed, a keypress means new bytes coming in, so this is a new hotplug
event - and we try to detect if there is a keyboard:

> [   11.103287] i8042: [10643] f2 -> i8042 (kbd-data)
> [   11.113673] i8042: [10654] fa <- i8042 (interrupt, 0, 1)
> [   11.113719] i8042: [10654] ab <- i8042 (interrupt, 0, 1)

And something goes awry again. We're supposed to get 'fa ab 83', not
just 'fa ab'.

So we wait and timeout 0.5 seconds later. We fall back to trying the
SETLED command again.

> [   11.617485] i8042: [11158] ed -> i8042 (kbd-data)

And we don't even get an ACK. The keyboard controller is stuck again.
Ouch.

> [   11.825485] i8042: [11366] 60 -> i8042 (command)
> [   11.825778] i8042: [11366] 64 -> i8042 (parameter)
> [   11.825924] i8042: [11366] 60 -> i8042 (command)
> [   11.826016] i8042: [11366] 65 -> i8042 (parameter)

So we're back in closing the port in i8042.c. We toggled the line, and
we check for any data in the data port:

> [   11.826049] i8042: [11366] 83 <- i8042 (interrupt, 0, 0)

Yes, like before, the 0x83 was waiting there for us and was blocking the
data port for any further communication.

> [   11.830084] i8042: [11370] fa <- i8042 (interrupt, 0, 1)

And another ACK was waiting there, too, probably from the SETLEDs
command. This time, however, we're lucky and manage to read the ACK
before we start reinitializing the keyboard.

So we send a GETID:

> [   11.830107] i8042: [11370] f2 -> i8042 (kbd-data)

Get an ACK:

> [   11.840241] i8042: [11380] fa <- i8042 (interrupt, 0, 1)

And this I don't even have an idea where is coming from. Possibly still
the keypress ... ?

> [   11.844063] i8042: [11384] 38 <- i8042 (interrupt, 0, 1)

Nevertheless, it's not a valid ID, so we bail out again.

We toggle the interrupt pin.

> [   11.844083] i8042: [11384] 60 -> i8042 (command)
> [   11.844174] i8042: [11384] 64 -> i8042 (parameter)
> [   11.844320] i8042: [11384] 60 -> i8042 (command)
> [   11.844413] i8042: [11384] 65 -> i8042 (parameter)

And this time there is no data stuck there. But some comes later via the
normal interrupt way (still no idea what the keybaord is trying to tell
us, maybe more keypresses):

> [   11.849039] i8042: [11389] 3c <- i8042 (interrupt, 0, 1)

And we try to identify the keyboard ....

> [   11.849059] i8042: [11389] f2 -> i8042 (kbd-data)
> [   11.859198] i8042: [11399] fa <- i8042 (interrupt, 0, 1)
> [   12.361490] i8042: [11902] ed -> i8042 (kbd-data)
> ...
> [   27.516138] i8042: [27455] f2 -> i8042 (kbd-data)
> [   27.526395] i8042: [27466] fa <- i8042 (interrupt, 0, 1)
> [   27.531044] i8042: [27471] fa <- i8042 (interrupt, 0, 1)
> [   27.531080] i8042: [27471] 60 -> i8042 (command)
> [   27.531183] i8042: [27471] 64 -> i8042 (parameter)
> [   27.531336] i8042: [27471] 60 -> i8042 (command)
> [   27.531713] i8042: [27471] 65 -> i8042 (parameter)
> [   27.536215] i8042: [27476] 1d <- i8042 (interrupt, 0, 1)
> **HERE IT FINALLY RECEIVES THE CORRECT RESPONSE**

And indeed, later the sequence finally succeeds:

> [   27.536290] i8042: [27476] f2 -> i8042 (kbd-data)
> [   27.546882] i8042: [27487] fa <- i8042 (interrupt, 0, 1)
> [   27.546940] i8042: [27487] ab <- i8042 (interrupt, 0, 1)
> [   27.546997] i8042: [27487] 83 <- i8042 (interrupt, 0, 1)

We get the correct ID and we proceed to RESET_DIS to prevent any
keypresses messing up our further communication with the keyboard:

> [   27.547018] i8042: [27487] f5 -> i8042 (kbd-data)
> [   27.557566] i8042: [27497] fa <- i8042 (interrupt, 0, 1)

We then turn the LEDs off:

> [   27.557615] i8042: [27497] ed -> i8042 (kbd-data)
> [   27.568242] i8042: [27508] fa <- i8042 (interrupt, 0, 1)
> [   27.568294] i8042: [27508] 00 -> i8042 (kbd-data)
> [   27.578730] i8042: [27518] fa <- i8042 (interrupt, 0, 1)

Set the repeat rate:

> [   27.578785] i8042: [27518] f3 -> i8042 (kbd-data)
> [   27.589151] i8042: [27529] fa <- i8042 (interrupt, 0, 1)
> [   27.589206] i8042: [27529] 00 -> i8042 (kbd-data)
> [   27.599602] i8042: [27539] fa <- i8042 (interrupt, 0, 1)

And finally enable the keyboard for use.

> [   27.599676] i8042: [27539] f4 -> i8042 (kbd-data)
> [   27.609986] i8042: [27550] fa <- i8042 (interrupt, 0, 1)
> 
> Any idea what to do about this?

So it's not the problem that the driver would not be waiting for a GETID
answer. It actually waits for a long long time.

It's the virtual i8042 keyboard controller implemented in the BIOS that
has an issue, not properly delivering interrupts when the keyboard sends
three bytes (fa ab 83) in a too quick succession.

You can try experimenting with the 'noaux', 'nomux' and 'dumbkbd',
and 'kbdreset' options of i8042, and also the 'reset' option of 'atkbd'.

This will change the init sequence and there is a chance it'll stop
tickling the virtual i8042 controller in the laptop the wrong way.

If that helps, there is a quirk table in i8042 to enable these options
based on the EDID data of the laptop automatically.

If it doesn't help, then we'd need to find a workaround how to recover
from the lost IRQ situation without giving up on keyboar detection.

Possibly by signalling the detection timeout from atkbd.c back to
i8042.c to check for a stuck byte in the queue.

Vojtech

-- 
Vojtech Pavlik
VP Linux Systems Group, SUSE 

