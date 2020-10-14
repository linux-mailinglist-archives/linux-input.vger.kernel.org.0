Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556A028D95E
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 06:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730072AbgJNEsF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 00:48:05 -0400
Received: from mail-bn8nam12on2053.outbound.protection.outlook.com ([40.107.237.53]:59264
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbgJNEsE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 00:48:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeQ7w4nWg/FiWWHBKCYHBSXNs/VScbvvwwrDRXFDNW9LEU84kei+6NQkSJKChR92ozp0loFClG33ciTd1OcPT4RBjLMM023KPgdPcZCUhhTMDCZDCEFRCFo3KHL9EZoyLl6O9HeJuzXufk61P0ppuXsHbSf4zRZSqiT11ibjQdst9MJUHLa8uVxH+FyLXfzr4xAulU5Yfg2b5z0R5eQrcGsaatnVXfNbW9tv57rWaA2/2vC1I0gQovrxw06gmrQAZQngS3/LzPd+HO9FFnDi6IKhIWNRLvWtW1j/bQ256PKdHN7yTYqplMqPSASctUCM5xOiqHUf/o0wxQKrJXm0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEhSNOQCgX5TXs7e9dz6GIXXso8e4rN4Ut+mdWk7MkU=;
 b=GxwMHjAmy1BI8sesvZC04n2HzF9C42Ug3gA/w6cyboCLEv3VasoObb5bQGlAo4EqIBzIHJ+ZPm0cAwgkXSnqZioJTP0FMAElXkhaD5T/e0Hj1BZjkVWkrBN3UGxE0M9iTjmnXwj8lhyqnRfXqhnmQoXGiaTa4jTVTsBnHiN6UUW5AAvozRhoZwlpkyiTqYPcqaYX9CqZrMsU1ROBAlE79bzknm2OMAk+Voa1nbAfrVZP5qcYBQCjul7U3Mi8N305Dkap+/QsHOLd8BFzvYPKNAQBtnDstRm7yl0bbLCUlPgZ23cMKXIJAQnrgZTUEgLmQU4VR58qmB7NGPCCKMlP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEhSNOQCgX5TXs7e9dz6GIXXso8e4rN4Ut+mdWk7MkU=;
 b=NY9Yyx/plxYvbxu8m2x2zUUm7FzwMWZxlhMZSqACPeP3u3oRjvi/kmEsngY44T29BwQQAolNUW2ADaLSrS9oxgsl8Va0Ja43b3hO9VByxUHQdC4uSGTxx/PGhBLewlNkqIwKk23KdXqp8jC5eTBtUuUA4wJ6KCzLZJjgYxsNeaI=
Authentication-Results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA2PR08MB6619.namprd08.prod.outlook.com (2603:10b6:806:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 04:48:00 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::c989:9cea:baa6:8254]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::c989:9cea:baa6:8254%7]) with mapi id 15.20.3455.032; Wed, 14 Oct 2020
 04:48:00 +0000
Date:   Tue, 13 Oct 2020 23:47:50 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [External] Using IIO to export laptop palm-sensor and lap-mode
 info to userspace?
Message-ID: <20201014044750.GA20190@labundy.com>
References: <218be284-4a37-e9f9-749d-c126ef1d098b@redhat.com>
 <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
 <cadabe4d-7cce-281e-75fe-fcc2099848da@redhat.com>
 <5273a1de9db682cd41e58553fe57707c492a53b7.camel@hadess.net>
 <272074b5-b28e-1b74-8574-3dc2d614269a@redhat.com>
 <20201008001424.GA3713@labundy.com>
 <9893a32c-02c8-f00c-7f00-6287d55043ab@redhat.com>
 <20201009021949.GA3629@labundy.com>
 <961aeee6-22e9-75dc-9fcf-45cee00ab62c@redhat.com>
 <075a5f57-3330-78fe-669b-01570d43d9c0@lenovo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <075a5f57-3330-78fe-669b-01570d43d9c0@lenovo.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.227.119]
X-ClientProxiedBy: DM6PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:5:80::40) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by DM6PR08CA0027.namprd08.prod.outlook.com (2603:10b6:5:80::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 04:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd05014d-13c4-43eb-8a83-08d86ffc5379
X-MS-TrafficTypeDiagnostic: SA2PR08MB6619:
X-Microsoft-Antispam-PRVS: <SA2PR08MB661948D5738BDD1DBD4BA603D3050@SA2PR08MB6619.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89hTjy1/9QaudiOvUeqQCS/73utDp7k+DZf3GGhbx9t053bgqN9jzEaOxYhU/+nLmQXAZD1n+JMOtxbs6aCs+LVElnNPnYOb9YOCPctt/C6n9icj89OADcUWH6VyooAUKU1d6dSJ5/lhqIodxLbYgEhbGCdZKB43z9FEiO6p8f2Vtaovi2ZKyMCPyh2ETRSnI+NdgXIqnjk0pP8gIiYtdRl1+4RAv5kpmrR/sW7wX+P1AvIgdWkmpoLBGrW9PPOigCq7yuK7xcfTIUnlpDnVnj34/5LAqNIZfCZ25gvaizNCLQukYgpMRFBpxR6b8yBCDCn7Pm8NTOS9rLJ7pJYpMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(376002)(136003)(346002)(366004)(396003)(33656002)(8886007)(478600001)(5660300002)(54906003)(2616005)(1076003)(316002)(956004)(55016002)(6916009)(86362001)(186003)(6666004)(16526019)(52116002)(53546011)(7696005)(26005)(4326008)(8936002)(8676002)(4001150100001)(36756003)(2906002)(66476007)(66946007)(83380400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2lgawPQLmdddLF/m4kqB4muN0VusGDpY7TUNa0B8nDSJwkF5mpkfc5TarbmkcWGs4OA0mT+v4gJKsMAeAozjc1WTfrPACe4JIFedcPM7yIg9i/7IQhbd2elvn5EVpTGYZ8YddbWki8hrxmE1LPXElZql7lYDoXYu3AmOBu1rJEfPiVhx7gSiXaiobuU+gNuw8Se1iQ2omO3kUc2ErXJEQuc6KxHPCwgtk/6d8WCBLJrx7QyylkOhr5BNOtL24N+0LcZX6mqkKpvKeZXrAIgl2AsW5Uswkn+2gT0hBX9aV4ZGjaEz8RWRLb9p+uO24dlh4bDicr47IJ4P0LH8vdqaijWL3QyeS7DG/LcX2TOe/tDopKJ9PfkQghuWJo3FsNse20j0++y2d/NyiwOTAk19rQwULj9S+XqKZWKo0fudgN8KrFFY/w6Dx7aVdAILRPBTQ8SkY+DVlYs4fRgP/3CMdjbEKnBaaoumUINx0CrIRvs5t7G2Ot1i9smGzAtoWoqV7an1tez2avw2yE7B9LR4jGDGE/tnV8jFRnas3URx6wcYtUc12klS+yK/ulRuYV965IM0pTQhMpYFa5uFOhpV15q/zvhMD1Gc8blHmIfHaqWEwh9ZesNzQnzuhk0DZZRUV7IsnAlA+4TWZ0n7xNwGQQ==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd05014d-13c4-43eb-8a83-08d86ffc5379
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 04:47:59.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycYH48NHMWpkN//BUeMYQj1iIlcyriP8oFyWWDuKvcmyT8eeaNXLvntbIgLdshk9vIY+Bo5Ed/cfWKBxon/mOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6619
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mark,

Thank you for this additional background information about how these
types of sensors are used in a practical application.

I'll throw in my couple of debug tips below.

On Tue, Oct 13, 2020 at 05:59:18PM -0400, Mark Pearson wrote:
> Hi
> 
> On 2020-10-12 8:13 a.m., Hans de Goede wrote:
> >Hi,
> >
> >On 10/9/20 4:19 AM, Jeff LaBundy wrote:
> >>Hi Hans,
> >>
> <snip>
> >>>
> >>>>I just wanted to chime in and confirm that we do have at least one
> >>>>precedent for these being in input (keyboard/iqs62x-keys) and not
> >>>>iio so I agree with Jonathan here. My argument is that we want to
> >>>>signal binary events (user grabbed onto or let go of the handset)
> >>>>rather than deliver continuous data.
> >>>
> >>>I was curious what keycode you are using for this, but I see
> >>>that the keycodes come from devicetree, so I guess I should
> >>>just ask: what keycode are you using for this ?
> >>
> >>The idea here was that a vendor might implement their own daemon
> >>that interprets any keycode of their choice, hence leaving the
> >>keycodes assignable via devicetree.
> >>
> >>This particular device also acts as a capacitive/inductive button
> >>sensor, and these applications were the primary motivation for it
> >>landing in input with its status bits mapped to keycodes.
> >>
> >>I don't think there are any keycodes that exist today that would
> >>universally work for this application. The couple that seem most
> >>closely related (e.g. KEY_WLAN or KEY_RFKILL) are typically used
> >>for disabling the adapter entirely or for airplane mode (please
> >>correct me if I'm wrong).
> >
> >You're right (aka not wrong), KEY_WLAN and KEY_RFKILL are used to
> >toggle wireless radios on/off and re-using them for some SAR
> >purpose would lead to nothing but confusion. We really need to
> >define some standard *new* event-codes for this, such as e.g.
> >the proposed SW_LAP_PROXIMITY and SW_PALMREST_PROXIMITY.
> >
> >>To that end, I'm keen to see how this interface unfolds because
> >>SAR detection tends to be an available mode of operation for
> >>several of the capacitive touch devices I've been working with.
> >
> >I guess that for touchscreens at least (which are on the front),
> >using the existing SW_FRONT_PROXIMITY would make the most sense.
> >
> 
> I've been looking at implementing this and I'm missing something - and I
> think it's probably something obvious so hoping someone can short cut me to
> the answer. Hope it's OK to do that in this thread (I removed the linux-iio
> list as I'm assuming they won't be interested)
> 
> I've added the new event codes to input-event-codes.h and updated
> mode_devicetable.h
> 
> In the thinkpad_acpi.c driver I initialise the device:
> 
>    tpacpi_sw_dev = input_allocate_device();
>    if (!tpacpi_sw_dev)
>            return -ENOMEM;
>    tpacpi_sw_dev->name = "Thinkpad proximity switches";
>    tpacpi_sw_dev->phys = TPACPI_DRVR_NAME "/input1";
>    tpacpi_sw_dev->id.bustype = BUS_HOST;
>    tpacpi_sw_dev->id.vendor = thinkpad_id.vendor;
>    tpacpi_sw_dev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
>    tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
>    tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;
> 
>    if (has_palmsensor) {
>       input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
>       input_report_switch(tpacpi_sw_dev,SW_PALMREST_PROXIMITY,
> palmsensor_state);
>    }
> 
>    if (has_lapsensor) {
>         input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
>         input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY,
> lapsensor_state);
>    }
>    err = input_register_device(tpacpi_sw_dev);
> 
> If the sensor triggers I update the inputdevice with:
>    input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
>    input_sync(tpacpi_sw_dev);
> <similar for lapmode>
> 
> However I'm not seeing the change when I look under evtest, though I do see
> the new sensors show up:

Have you proven that the sensor is actually signaling a change in state? I
would try printing new_state from your interrupt handler just to make sure
that the hardware is saying what you think it's saying. Maybe an interrupt
is masked within the sensor's register map, etc.

> 
>    [banther@localhost linux]$ sudo evtest
>    No device specified, trying to scan all of /dev/input/event*
>    Available devices:
>    /dev/input/event0:	Sleep Button
>    /dev/input/event1:	Lid Switch
>    /dev/input/event2:	Power Button
>    /dev/input/event3:	AT Translated Set 2 keyboard
>    /dev/input/event4:	TPPS/2 Elan TrackPoint
>    /dev/input/event5:	SYNA8004:00 06CB:CD8B Mouse
>    /dev/input/event6:	SYNA8004:00 06CB:CD8B Touchpad
>    /dev/input/event7:	Video Bus
>    /dev/input/event8:	Thinkpad proximity switches
>    /dev/input/event9:	PC Speaker
>    /dev/input/event10:	Integrated Camera: Integrated C
>    /dev/input/event11:	sof-hda-dsp Headset Jack
>    /dev/input/event12:	sof-hda-dsp Mic
>    /dev/input/event13:	sof-hda-dsp Headphone
>    /dev/input/event14:	sof-hda-dsp HDMI/DP,pcm=3
>    /dev/input/event15:	sof-hda-dsp HDMI/DP,pcm=4
>    /dev/input/event16:	sof-hda-dsp HDMI/DP,pcm=5
>    /dev/input/event17:	ThinkPad Extra Buttons
>    Select the device event number [0-17]: 8
>    Input driver version is 1.0.1
>    Input device ID: bus 0x19 vendor 0x17aa product 0x5054 version 0x4101
>    Input device name: "Thinkpad proximity switches"
>    Supported events:
>      Event type 0 (EV_SYN)
>      Event type 5 (EV_SW)
>        Event code 17 (?) state 0
>        Event code 18 (?) state 0
>    Properties:
>    Testing ... (interrupt to exit)

When you added new switch codes 0x11 and 0x12 to input-event-codes.h, did you
also increase SW_MAX to 0x12?

> 
> The state for both sensors is supposed to be 1.

I would recommend printing both palmsensor_state and lapsensor_state during
initialization to make sure the hardware is reporting what you're expecting.

> I did download and rebuild evtest and fixed the (?), but haven't figured out
> why the state is wrong. It seemed related to the number of keys which I
> found odd.

Can you clarify this observation? What changed as keys were added or removed?

> 
> Any suggestions from what I'm missing, or have done wrong, or where I should
> dig next? What's the recommended way of testing my implementation?
> 
> Thanks
> Mark
> 

Kind regards,
Jeff LaBundy
