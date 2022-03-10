Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773FA4D416E
	for <lists+linux-input@lfdr.de>; Thu, 10 Mar 2022 07:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239947AbiCJHAI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Mar 2022 02:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233872AbiCJHAH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Mar 2022 02:00:07 -0500
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 22:59:05 PST
Received: from eu-smtp-delivery-197.mimecast.com (eu-smtp-delivery-197.mimecast.com [185.58.85.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F3DF12F409
        for <linux-input@vger.kernel.org>; Wed,  9 Mar 2022 22:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=camlingroup.com;
        s=mimecast20210310; t=1646895543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=31Yb/q49RoXfCeMj0XVQIlpQ3f2CH/ohtpF5v2+etvk=;
        b=iq69iMzk3yknwrEywhXCVQOU8KhCuUFIoiqv8mOwJKjq7ziinDEfST2SUxA1bicqzhnEEF
        Lq3h8gaxs3xJFwtO7gyirmimTBnqkfQ3n9Gf9Lh4j2lihS+PSp3Tqin+X5tfyVihS0EGmN
        d4ETSZ5ojQ49/GLcG4o/klPSOB6chOE=
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (mail-cwlgbr01lp2051.outbound.protection.outlook.com [104.47.20.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 uk-mta-36-HTUsmH-vOF-NxuCAfmP04w-1; Thu, 10 Mar 2022 06:57:57 +0000
X-MC-Unique: HTUsmH-vOF-NxuCAfmP04w-1
Received: from LO0P123MB5583.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:213::11)
 by CWLP123MB3266.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:4a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Thu, 10 Mar
 2022 06:57:56 +0000
Received: from LO0P123MB5583.GBRP123.PROD.OUTLOOK.COM
 ([fe80::7441:6280:dede:964f]) by LO0P123MB5583.GBRP123.PROD.OUTLOOK.COM
 ([fe80::7441:6280:dede:964f%5]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 06:57:55 +0000
Message-ID: <5a233ff1-cde4-b432-a170-86379bec972c@camlingroup.com>
Date:   Thu, 10 Mar 2022 07:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
X-Mozilla-News-Host: news://nntp.lore.kernel.org:119
From:   =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@camlingroup.com>
Subject: Detecting invalid gpio keys configuration
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Krzysztof_Drobi=c5=84ski?= 
        <k.drobinski@camlintechnologies.com>,
        Lech Perczak <l.perczak@camlintechnologies.com>,
        =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@camlingroup.com>
X-ClientProxiedBy: LO2P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::25) To LO0P123MB5583.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:213::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0e004a-6d7c-41b4-b460-08da02634d72
X-MS-TrafficTypeDiagnostic: CWLP123MB3266:EE_
X-Microsoft-Antispam-PRVS: <CWLP123MB32669167605FFAD31B380780920B9@CWLP123MB3266.GBRP123.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: tOyY/4/t2EoBrPF1GwY0OKszCYjU2MNhEx6TWY6/wSBm8M4+GPG74if1UefRv3Up3E20L+2cQ4maAjehu1NtRcnBdFon8/yKNgNKQxB9+FtG6b/iIpVxI6cJYFEFUmlsA4nknxYa/lG6yi/tVINlA7uDe5yaXZSSADNyOzvPxWmrlN+RXwdpYHhHtbjc1tbA4t3sfGDbhRjcw2HP+XUOBszhM//O2C7BirDDlBdmkjF1bjsLQlmu41YLEn0iPaEetElEZ/WNXPLW5AF4o8JaImItsNkHlJ0As6DN/lLHrWH6g1IklP806zAv8syckEDcglcHA+1w001gMaF9Cb5rqhA54zrLd61N0LG8RpdOs/a2DjPPPBZX9lWBjUSYb9c705VfQHFlKwERyVSqfBtC9ss93nEiUCrJSWyQmlxyXJGTsdL+bXXnlxNEiWc8mFbtzYHdp4xe/ARtFNZmVLtUPNiMX5BNX6m1nLDHFoZiB9MadxKhYzvItcni9fHMwQhxDySRCEirepE9sdztdiK7fPCAk+ZBatbLhsmtpoQwFU7+MeJ7TbEcCWS2h0a8wcWNWeLxaQMEfxgcX/atFHxwubbHAJF5IY0f+t3tFoNK4CkvMYpnElRg/D2KmKKe+cPgztHqzWBpgjD3HZ92uCO0EkVONrqEFeSOlNyNJR1ajUs6AZED2kdY+e9rMj/PkY4eoSfCi1gbVpy2GKrtfPeb+CKTUibkLCh9GGbtkIrVrAPso3In2o/1T/zTqwxQb7cp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB5583.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(86362001)(107886003)(508600001)(6512007)(31696002)(4326008)(8676002)(38100700002)(6486002)(2616005)(66946007)(66556008)(66476007)(31686004)(316002)(36756003)(26005)(54906003)(186003)(6506007)(83380400001)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3EzRU1Ob3B4TitpSys5emRITk9MYXJaZHVuZXZpaWJsaG9Ja0VmdkdIeXZB?=
 =?utf-8?B?VG9UaTkvdGNuODNZWWxad1FPNVBHWmRWN04weTV5dnAzZjRlOTdjcWh4WFVV?=
 =?utf-8?B?R3RpZkZHRHU4QkVDWUJKcENra2lBTzlWeXhaSXBIN2RCclE3SS8wZXZsVkt4?=
 =?utf-8?B?TEhvalEyWGYvRWVQWUJhaE5SOWQyNCtXd2ZmL1B0TitTcENwOHRXdU03bUNa?=
 =?utf-8?B?RFRmZmtMVXFTdERLUElwSVRiSW5KQkxSajhpUkZpWjhWRHBQenA1OStGRVFt?=
 =?utf-8?B?NXo2UHJqc3dVMGIrbEtvSklOa0dHYkg5Sm5lT0I4R2xvNHNxN0RLdmJ3Ylhv?=
 =?utf-8?B?eDB2UTVnUDVDclVxd0JxYmdQc0ErYk9ueG1icTVxRVFpdFRzRks1R2Y1TWUw?=
 =?utf-8?B?YXllZ2F0Q2FXajRidHA5ckwwNkRQL3V0WEpLb2FVbjdDVHNFdTMrRnVOWXBW?=
 =?utf-8?B?L1BGY3lsejhjOENUTDYrRUVZTytIM2JSNiszOU84aHpBbTR6VTJIVnhDMXBV?=
 =?utf-8?B?eWZVSHpRalJMQjJXUXpCNldDWmpaSkUzZjJBaWtrV1FhSGtmcnNURkJZWFNl?=
 =?utf-8?B?b1dMd0hmdFRYWkpmNWkycFJQOU5IRVBZLzBUU2tBSlk5TUFqVlhxMThOcVBj?=
 =?utf-8?B?N1h3NitqemZ2U3JEOFBqZlUzMUJHT3JjSFZtSzBiZ1ZmUjZiVys4OWg4MW0x?=
 =?utf-8?B?VStKY0o3YTJVN0N1cHRtbmo3cWxqQlRCTzVZOFhSQWp3K3E5eVVvOXpscjM5?=
 =?utf-8?B?cEdkeTMrRlJYVXRIaWIvTkRiL2I1b1Z0V05FM3V3VDZnTFlyYWZmTDQ1RTZ5?=
 =?utf-8?B?UjlmLzE1YUlYR0VvNnNiN1Q2VEdIemdLQ2hqTXNwcFFlTEk3ZE1NOGhxbHdS?=
 =?utf-8?B?Z3p1NGp6bTNLWUJlZ2RDejVCZStJckJ1cTdHaDlyVHFJdlRvN05rVHRNNkFQ?=
 =?utf-8?B?ZFFMZGduTDRmbVkxa0o1VTVlVEVyTTB2S2NMWWJIOGhhcDdVL3A3akZJeFBZ?=
 =?utf-8?B?YlhBdEVLYU9KN3cvcHczNzJPTCtaRzVRSmZjTE03cmorMWhnSURJeHhaU1hO?=
 =?utf-8?B?bXJzaEVxbjIwVytUVU1kODBsZmNEd1NmMFFEeHF3Q2VtOUdWTmI5dWJudWZw?=
 =?utf-8?B?UGowUFNaaFZnamZXNXQ0ZVErZ0xQZ0dGU2ZNRk9LNk02WmZVOXF3TzNGaWJQ?=
 =?utf-8?B?TnNocUhzOUE0QmEvL2IwWDNnbjNWTWVLRHFlUnZlU3VKVStrbGtYRkI3eTBP?=
 =?utf-8?B?ZEJZMnR3M09sRmxlMy9GeFpXQlhHMmx1WDNxT2M2ZFVqUjg2RG1kQ3B4b2Zp?=
 =?utf-8?B?T2kzMGhxTzlWRW1zQUFrdWZ3dlN1THFkZTUzTGFTMHp6SHA3WVN4TVpsQ2l5?=
 =?utf-8?B?WEV3RWt0SjhiODE4Q2liVVk0YVFMWmJkb0RNMHA5SGo4TGg5NXBmNjZtUWtt?=
 =?utf-8?B?Y0xkZ01WMnZGZmtmQXRQQ2tDMi9CVGZwZUtLeFphTVR5MTFTNmVRMDBUM0Q5?=
 =?utf-8?B?YXJMZnpJL3BuWWlNaWpsRWJjRDhURVFneEdIZVRVN0JxZzEyY2g5QkZwS1E5?=
 =?utf-8?B?SitjNmtSMS91NzVKeExHZnc4ZkRiY2NFK1RXd3Q5ZTJhUDdlY3JJZ3BsOGpV?=
 =?utf-8?B?aUpMSnlNVGxoZ3Z1eHo0VWk3RUlPSHJnNlZtV1A2dUIrSmZNaWx5SFU4NW5D?=
 =?utf-8?B?VWEzbko4TkpFOERZUTNmeXBwR2NrMCs3QWtyTXh1NmJaS3Z6aHRTSkRZaFR5?=
 =?utf-8?B?RG9jQnkxTGpUT1N0QXpIUmlyWS9OMUVNbXpvSnNaQ3BKUzFaOVVwdFl3VHlG?=
 =?utf-8?B?VmptRVZXSkhlTi94RkhoRW5qcCtQZ2dwMGNRUjVVQTVaRjcyR2NhS0ZGTmZU?=
 =?utf-8?B?MjloK2FsOHcyREgyaVJpUzU1T3h3VDlSejFEWlFKekZ4WXJ1bjlhODhYOE1v?=
 =?utf-8?B?a2xKWWpncW5NdVFuRFliRmI5VlhuNFFTbktCR3ErRDAxTEgyRENZYUxWZ1VR?=
 =?utf-8?B?Yzlzd1BidDFBPT0=?=
X-OriginatorOrg: camlingroup.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0e004a-6d7c-41b4-b460-08da02634d72
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB5583.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 06:57:55.2289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fd4b1729-b18d-46d2-9ba0-2717b852b252
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wElgDjGU8zF6p0NcMo9sSG14l6OtLcf5vlufM8QYVeZo/VFrS7nsUxQ2VqA3lj5AbECwzx4LAIzomVMUE6cvnZ9Z69sgwRNOBWI8MaHknMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3266
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUK97A341 smtp.mailfrom=tomasz.mon@camlingroup.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: camlingroup.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have recently come across following invalid entry:
=09gpio-keys {
=09=09compatible =3D "gpio-keys";
=09=09servicing-sw {
=09=09=09label =3D "servicing-sw";
=09=09=09gpios =3D <&gpio3 1 GPIO_ACTIVE_LOW>;
=09=09=09linux,code =3D <BTN_0>;
=09=09=09linux,input-type =3D <EV_SW>;
=09=09=09debounce-interval =3D <50>;
=09=09};
=09};

While the entry is clearly invalid, no tools currently detect it.
Documentation/devicetree/bindings/input/gpio-keys.yaml allows any uint32
as linux,code. The actual allowed values do depend on linux,input-type.
Should the gpio-keys.yaml be updated to actually restrict the range
based on linux,input-type?

If the yaml should validate range, it would have to be updated each time
new input event code is added. Is it acceptable? Or is there some way to
use the definitions from include/uapi/linux/input-event-codes.h in yaml?

The code does not sanitize the linux,code values. On 32-bit arm system,
the above example causes kernel panic due to memory corruption:
  * gpio_keys_setup_key() in drivers/input/keyboard/gpio_keys.c calls
    input_set_capability(input, EV_SW, BTN_0)
  * input_set_capability() in drivers/input/input.c calls
    __set_bit(BTN_0, dev->swbit)
  * The setbit changes poller pointer least significant bit
  * input_register_device() calls input_dev_poller_finalize(dev->poller)
  * input_dev_poller_finalize() accesses memory at address 0x00000005

While provided example hopefully crashes every time making the issue
obvious, other code values can cause much more subtle issues.
Should the input_set_capability() warn if code is outside bitmap range?

Best Regards,
Tomasz Mon

