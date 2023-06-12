Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963BB72CF9C
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 21:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238255AbjFLTdo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jun 2023 15:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238256AbjFLTdn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jun 2023 15:33:43 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468A51B8
        for <linux-input@vger.kernel.org>; Mon, 12 Jun 2023 12:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djmXEx95T0Pigz1Ws8Ot5oItF+KAulhHjew8b+2iOSdb01W5lO/ITHTsffjmuhJl3Xqivoniw9b1fjWoCeJT01weuU7JiqQoT4ogjgqj4NHMto6gpIrGLJUfbxF8OXjXtRifWs9IAWNn7dG4OQuoE09sP6UbICLBVcdqYZLw15N2Diqummu7/UZln8Tl+4n8WxyIfERttai810YgopsJldvgWwQxlJDLPzhpci0P1JDtZiBOgAgUMifqRI4YeikjO+QUp8WBAB+F4HozXAe1I9grmp4DSRBBJqnCEKSDYwsTopPzHRAo6lqUmofABqABIyAXHfPQixCmavc0hnrjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6nX4vLHw0tgWqfB4KI9PkeiRB0J+xFBJ1f/OZ7dZ3M=;
 b=OZP9ayxRJtcXtH46zUVg7jCGbMZh44hCbYVkhHD63AnHUkzd/Xi3b3md0AUKefZzDZrcNbp5MHk0lrzLEWpSKAT6Sfab8HqCOpye25aEPEmh1pd8CdH4zLBE8+OyTPgKzivh/xNwyB8yqy0PFmFeJLRpxH5vIz0krvEm/A7ZEx2jDw2qOeq4UR2L4B8n2vVra/Cgrbl0BtOe+W1kRQgbSGsXAg9c4rTWTGpw/WmdLUWV4qLUaYsoi3TzD6nMoyLRpKIW5+3NVvbWgDegc1qZGLJlpnyo+WJvqU7aLBWE/kIO4bGPrFQ23r+xFbhTBYn2ZDdjBaxMjca1rastGZJUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6nX4vLHw0tgWqfB4KI9PkeiRB0J+xFBJ1f/OZ7dZ3M=;
 b=A7AcSbUuL61lgtoY8MhEeFRnRWwCBrQhW5t28TRhjWT8Vva3BHZ6UnzDsRtj30JR6v+tURopFzbpSQXvUZF5u285c6yuAsCTcLCQKceZAhT208AZdRpQQFwhkipruI9MD+D9E9xrwJrwTFFhICM+kvBsXuAUmamcpPk85mCTZGHKa6ENU2cPSNxkfbdncGJ+b4hoLNvSmL/I7XohOPoXefIqk6+G7pJfTGBYpNRVp490ivwHxb7ciGU6OzVFwrJ1dDZqX8O4R3WpbrmvjeemTLTdTc8hbm9abIfcT9zUo+Xuop9i/DlzZJcT07aynuS/qnkt6/Tz48X38m97ZOf3cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:404::9)
 by AS1P251MB0525.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 19:33:34 +0000
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::d088:f8:7b89:2974]) by AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::d088:f8:7b89:2974%4]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 19:33:34 +0000
Message-ID: <cce96d0b-1642-bf52-b9e6-64e40e8ae275@polimi.it>
Date:   Mon, 12 Jun 2023 21:33:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Tree dumb questions from an occasional
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
References: <5673fd15-b3f2-7911-6eea-39e5126f4874@polimi.it>
 <CAO-hwJKNqosABrr-VGSUVPs8CKRpQNTL0xgNLeT4yg453ADWZA@mail.gmail.com>
Content-Language: en-US, it
From:   Marco Morandini <marco.morandini@polimi.it>
In-Reply-To: <CAO-hwJKNqosABrr-VGSUVPs8CKRpQNTL0xgNLeT4yg453ADWZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::25) To AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:404::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P251MB0339:EE_|AS1P251MB0525:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa55111-e7c5-49f3-95da-08db6b7be933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kS8M0jHujK/OeOXIKjbU03FBW8My4tXrSj8mLdBTscdyTEFJEXuKkPJAUEiBTAbwqPgADtFCY7OiyDGcZ6OFTaCBGtIrgfuD4xhQoD91/8mDJw3ngoNlYb2TK6xIBJIw8YxICjncD3TsQU57yEo8mOVHhlNs0hlBwUxYzFDAV77QcHsy0yGrFipO21/CLNcTHVLKy7iqfVsfWlio6btldaA1ppB5WWkXjBMLKugtMRjLNb0BWwmHovCp8gNsXR8HLKY42OXgfQhoXMuJ3PEXib3tPdppNt+r62go5bf1JLZ/timoYhCqVfTqE/wjufvIz/buiOOw8vy6SfloWceqnihYCPxeK0DpP/GtTNuuS1CLUXMWSqyu62WDk9sl3GLgw5tNKIVJB+0g3lPxpY66Rm/o06bGdWAA44hFmTj1PmbebkUK5D1rObCEpjn+elXnbM/PG37dphlb7gc+vMpz8gAwykxKP3QDasOBSJ5LjWs/VPtj7mJWiquADUYJydnioRz5UBAQi/+WSIQzuRv01WsXBuGf+4jTQAJLow5FbCx9r/9Bt3Azchu6J1/21J/d3wypdkyZMk9y4AAC1nG/u1DqFa8r4NGr1W+paTpClue5wwAJmv7om82iIoCEg2iJXnWDq6vugSon30IcOw2Kkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P251MB0339.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(66946007)(66476007)(66556008)(478600001)(8676002)(5660300002)(8936002)(36756003)(6916009)(6666004)(31686004)(4326008)(786003)(41300700001)(6486002)(316002)(38100700002)(186003)(6506007)(44832011)(86362001)(2906002)(2616005)(31696002)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRocHh5dmsyQWE5SStiWmpLdk9HN213QU1wSjRpbEFuRWRHOHg4VVdORHFL?=
 =?utf-8?B?b3pMVi9LQ1dDN0dseVlnc0ZUUFY2NHg3K25BRDA1dkNxR1VUOE1EWnNjWmU2?=
 =?utf-8?B?MStiVndId2gyODdXV25EWVhRTTl5TWtvNzRidk8rUFBIZEYvZnFMYis3UTEr?=
 =?utf-8?B?QmRhYjFFRGN4RkJqdmRvZERZSjMyR3hQVXFsUU53a05zSTU5bGx3Ylltc0sv?=
 =?utf-8?B?aGZGVVF4MGgxSEJRbWpEWHlSd2hsMmNFcDNPa0VmM3lyNHFIY01VVkNwVHN0?=
 =?utf-8?B?UkdVM0ZRa2p5aFN2alM4WU9qdmZXWERadnVRSDQ4WlNWYUF4YXBuUE9JK2FO?=
 =?utf-8?B?cTNlRUcveUZZRjZQYnBQbUY2S241UmNGeTEvODlwcVA4NEV0b0w1OHRqbGVC?=
 =?utf-8?B?VExsOWY2REgybUQzZCtmWWpPVjZIOEtSSEpZUWtBTWw5RHpWcFQ5VzFpaHJm?=
 =?utf-8?B?dGoyeTlWYlN5R0xCQU44UlhLYXFwVzNqUVpHNUJTa2k1cU0wL2VqQ1NZanVH?=
 =?utf-8?B?SmhVWEZ4VVQzblQ5WVZwelM4RjIyZUtTOGpaeThWMzIzK1djZWpPQ0dNWjVU?=
 =?utf-8?B?RWk5YXFsMVcvdDd0bGt1bWE0UmM5ZVVIcENNN3Z5a3c3RkhaekdhZ0lOQ1g3?=
 =?utf-8?B?czNkN0N3MUxNOE5IaUR4dlFvcjBZVDFjZ3hWRzRpSUJwa2VWcXMwK0hMeHh5?=
 =?utf-8?B?ekhSa2VCL1pERUE1V3Fkb1BvNHp6Q1VqeitlMEVZV0tMbERHcHIvcnNWOWUv?=
 =?utf-8?B?R1hVM1UreHhwL0RMbmhkT1pZTWUwSVRmR0JzMk11QjdySnJzYmY2cCtBWUln?=
 =?utf-8?B?SGJvM3FrcGExRllpUkVObUY2WTM1UU91WlVBZGxZY0NFRDF6QWdHaXowTXNp?=
 =?utf-8?B?c2VWU242K21OV2NWM2ttSGhIdGhRNnRyeGhaL1BBaUdOb0NQV2tLdmN4bitR?=
 =?utf-8?B?UXdEZ1ovU1RMbTZDdG40VUVGMFFpVHpDdytFOW5sVE1MVTR5R2hnUDgydURC?=
 =?utf-8?B?bjJpQmRhOVJXckNUeXZJY3ozM1Y4ZnhteWQvejVXTkozRmkraWNHVEhWN1No?=
 =?utf-8?B?QUxEUUFRdWlQazYzT09FMEQzMzFvV01rM0s2R2VMbmxOU0RxTUIxSjQrZ25v?=
 =?utf-8?B?ZllQVGNnNyt1RkM1Yy9kZVlzTnNNaDRtOE1kVlloZkRPMjNuV1k3aEhVYUJD?=
 =?utf-8?B?aE15L1Y5Z2lTRngvQjEvK1ZRQWY3N1VxNU9wdTBsSi8yUFpBTlNqTWg5NUM5?=
 =?utf-8?B?dmx4WDhURXpVSnJUNjdLV2lXUXpENGVENHhVSDhWN1VQSVZKZXZ4SE5pd1lZ?=
 =?utf-8?B?K1M3bXEyZnJpdnNvc1ZpZ3dlUHRuOW1QS1ZXcVJFbkR6M2h2V21Fa3dSdlNU?=
 =?utf-8?B?RDFMZUVRamtkdDJEQXR0QjRCNEZ6WUx0YmVPYjVpbzR6cGw2VFhvelFXaXFr?=
 =?utf-8?B?aDQ3NFFQaWd4aFNUclQ1bFpubXNZaVlVcXNheWZvUFRQeCtya3NrV0NSZVcx?=
 =?utf-8?B?Zk9iaFNtNWxXQ2V1TEIzZW9CSmErWHBYSzZJOW1rRjlPOWthSmFQKzdsT0RR?=
 =?utf-8?B?Q3RVcE5ZdlVmOUdwZFd2QkJnS0tJam1QQlpRWVUzbE5iWGp3Q09ycXpCcG5w?=
 =?utf-8?B?bTNxVURHQktMeW14am1lMU1zUnZ4V1hFQU5XOVQ1eG4zZitVeHlWanB6ejYy?=
 =?utf-8?B?dDk3M1JXbDZTWXVsWFpPSWVWWVJpTjBzeUFDRnV1bG1XZlZscGtJakVFTWsx?=
 =?utf-8?B?S0xYdlJ6Y1JZaGxNZW5zZTNBOW82N3dIeGZ0L2Y5Ukg5WWZiNEpuL25QRmhW?=
 =?utf-8?B?ekVON0xNMWczQXh2Z0ZveU9QaEFKbU5zMDB0OWptelVZYlhCY0VGSWI1WEl1?=
 =?utf-8?B?cXBkRzQ5N3BRZHd2ZWFNOVliNTJlVWc3UFYyUGxVbVp1Lzk3QjNRbVFrd0ho?=
 =?utf-8?B?RkxXRjFraFpQT0VENGEzdG5ZTnBUOWZyLzBsUGpUeWJTUy9GZ2QvVjR3NzNO?=
 =?utf-8?B?VVFLcUN6eGJSZWJLQkIxV2pkN2pCL2VYUDNySGlnSTZDTzl5eFpzUW5lRHRr?=
 =?utf-8?B?RDQzemxNSUUxYnovRnJRbE1RaDB2RlV6NHVibS8rTDBlMG1YT21EL1Y2SFBK?=
 =?utf-8?B?Q3BKSGF4K3h0Y1VBTUlJRFJtYzF3UmZrL0g5cmZ5NmJpMG1YZnZ4TUlWeTNr?=
 =?utf-8?Q?6ps+9YSB0ObVGw2eN4/NAUDfMqZQN5ftIAxGNwGlAaoC?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa55111-e7c5-49f3-95da-08db6b7be933
X-MS-Exchange-CrossTenant-AuthSource: AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 19:33:34.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDLRvHxVN90GoJ5FzFMxcOWmfWVbH305GGlh5HVDQZdkYUTXzImoemG3m7lNsJMlEtqlPdQJnYHUC3j8yih2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P251MB0525
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Yeah, right. This is the kind of situation where it's usually easy
> enough to detect with hid-tools[0]. We can record the device on your
> machine, then we can replay it locally on ours, and make several
> attempts.

I was not aware of hid-tools, I will mention it in my doc attempt!

> Sure. Please write (if you want) your first draft, we can review it
> and we can iterate from there. Do not forget to add the linux doc
> mailing list in CC in case some people from there want to also add
> things.

Ok, will try.

>> 2) if I got it right, one can add a quirk like HID_QUIRK_MULTI_INPUT
>> while loading the usb_hid module, but not while loading the usb_generic
>> one (that turned out to be the module that manages my HP pointer),
>> even if the statically defined quirks were moved into their own file.
>> Would it make sense to add the possibility to
>> add quirks while loading hid_generic? Is this the right place for
>> such code? If yes, I can try in my spare time to do this,
>> even if I'm not sure I'll be able to get it right.
> 
> I'm not 100% sure of what you mean, but currently dynamic quirks can
> be added to the *usbhid* module (not usb_hid or usb_generic), which is
> the transport layer driver for HID.
> This module is responsible for creating a HID device, which can be
> handled by HID drivers, hid_generic being one of them.

You are right, I should have written usbhid.
I was convinced that hid_generic
did not get the quirks that were set at loading time by usbhid, but only those
defined in quirks.c .

What I really meant was that the quirk I ended up adding is

{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_HP, 0x464a), HID_QUIRK_MULTI_INPUT }

If I got it right usbhid can add only quirks with

BUS_USB (and not BUS_BLUETOOTH, like the above)

because of the code in usbhid/hid-core.c 

(

retval = hid_quirks_init(quirks_param, BUS_USB, MAX_USBHID_BOOT_QUIRKS); 

is this the right line in hid_init ?

)

and the fact that one cannot specify the
bus that should be used (whatever this "bus" means in the kernel, I
still need to get it):

MODULE_PARM_DESC(quirks, "Add/modify USB HID quirks by specifying "
                " quirks=vendorID:productID:quirks"
                " where vendorID, productID, and quirks are all in"
                " 0x-prefixed hex");

Long story short: if I

- either boot with 

usbhid.quirks=0x3f0:0x464a:0x40

- or, alternatively try to

sun:/home/marco/READMEs/HPElitePresenterMouse # rmmod usbhid 
sun:/home/marco/READMEs/HPElitePresenterMouse # modprobe -v usbhid "quirks=0x03f0:0x464a:0x40"
insmod /lib/modules/6.3.6-1-default/kernel/drivers/hid/usbhid/usbhid.ko.zst quirks=0x03f0:0x464a:0x40

my device does not work correctly, but with the added 

{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_HP, 0x464a), HID_QUIRK_MULTI_INPUT }

it does work. 

Hoping that I got it right and HID_QUIRK_MULTI_INPUT corresponds to
0x40, otherwise all what I've written make no sense, and I should go back
and re-do my homework....

At any rate: if there is a way to specify the correct quirk for a device like the one
I stumbled upon, while waiting for the correct upstream fix to percolate down
to the distributions, then of course my questions 2) and 3) (add the options to
specify quirks while loading hid-generic (question 2) and by resorting to ebpf (question 3))
do not make sense.

> As the name says, hid_generic is supposed to be generic, and I do not
> want to see special cases handled there, because it would not be
> generic anymore.

Understood, thank you.

 
> Furthermore, if you submit your patch to the LKML, the quirk will
> likely end up in driver/hid/hid-quirks.c which is exactly the static
> equivalent of the dynamic one from usbhid.

Not exactly, because of the bus issue (again, assuming I got it right).

> No need to apologize. You are actually proposing ideas and your help
> to make things better for end-users, which is extremely valuable in
> itself :)

Thank you, you are very kind. I only hope I've not written too much
nonsense here above.

Marco

