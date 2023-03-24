Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995896C860D
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 20:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjCXTkg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 24 Mar 2023 15:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjCXTkf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 15:40:35 -0400
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Mar 2023 12:40:34 PDT
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de [134.119.228.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEF9618F
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 12:40:34 -0700 (PDT)
Received: from [92.206.161.29] (helo=note-book.lan)
        by smtprelay08.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1pfnEc-0002bR-Mx; Fri, 24 Mar 2023 20:37:58 +0100
Message-ID: <f85a8d843e30dbeda4cb7bd283ccf9651703edc8.camel@apitzsch.eu>
Subject: Re: [PATCH v2 0/2] platform/x86: Add driver for Yoga Tablet mode
 switch
From:   =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
        linux-input@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Date:   Fri, 24 Mar 2023 20:37:57 +0100
In-Reply-To: <20230323025200.5462-1-kallmeyeras@gmail.com>
References: <20230323025200.5462-1-kallmeyeras@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Mittwoch, dem 22.03.2023 um 19:51 -0700 schrieb Andrew Kallmeyer:
> This driver maps the Lenovo Yoga tablet mode switch to a SW_TABLET_MODE input
> device. This will make the tablet status available to desktop environments.
> 
> This patch series is the result of the discussion at
> https://lore.kernel.org/r/CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com/
> 
> I decided to follow-up on the patch Gergo wrote and respond to the review
> comments to get it merged and available for everyone.
> 
> Gergo and I have tested this on the Yoga 7 14ARB7, and the Yoga 7 14AIL7
> respectively. Additionally, according to reports at
> https://github.com/lukas-w/yoga-usage-mode, which uses the same WMI devices,
> this driver should work with:
> Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.
> 
> [..]
> 
> Andrew Kallmeyer (1):
>   platform/x86: Move ideapad ACPI helpers to a new header
> 
> Gergo Koteles (1):
>   platform/x86: Add driver for Yoga Tablet Mode switch
> 
>  drivers/platform/x86/Kconfig          |  10 ++
>  drivers/platform/x86/Makefile         |   1 +
>  drivers/platform/x86/ideapad-laptop.c | 135 +------------------
>  drivers/platform/x86/ideapad-laptop.h | 152 +++++++++++++++++++++
>  drivers/platform/x86/lenovo-ymc.c     | 187 ++++++++++++++++++++++++++
>  5 files changed, 351 insertions(+), 134 deletions(-)
>  create mode 100644 drivers/platform/x86/ideapad-laptop.h
>  create mode 100644 drivers/platform/x86/lenovo-ymc.c
> 

Hi Andrew,

thank you for working on this.

Tested on Lenovo ThinkBook 14s Yoga ITL.

Tested-by: André Apitzsch <git@apitzsch.eu>

Best regards,
André
