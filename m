Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A16361E9C
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 13:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239119AbhDPL1p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 16 Apr 2021 07:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235253AbhDPL1p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 07:27:45 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC56C061574
        for <linux-input@vger.kernel.org>; Fri, 16 Apr 2021 04:27:20 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4FMDT12C1gzQjmf;
        Fri, 16 Apr 2021 13:27:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id DR7PEpu6tYqR; Fri, 16 Apr 2021 13:27:14 +0200 (CEST)
From:   =?ISO-8859-1?Q?Andr=E9?= Najda <andre@najda.de>
To:     Yussuf Khalil <dev@pp3345.net>
Cc:     linux-input@vger.kernel.org
Subject: Re: psmouse serio2 psmouse.synaptics_intertouch=1
Date:   Fri, 16 Apr 2021 13:27:12 +0200
Message-ID: <2130114.vFx2qVVIhK@xc1507v2>
In-Reply-To: <d81cea9f-67f4-c333-4652-e41cb837a8d5@pp3345.net>
References: <4438747.vXUDI8C0e8@xc1507v2> <d81cea9f-67f4-c333-4652-e41cb837a8d5@pp3345.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.33 / 15.00 / 15.00
X-Rspamd-Queue-Id: 54E5A17FD
X-Rspamd-UID: 444fe3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[    0.000000] DMI: TUXEDO P65_67HSHP/P65_67HSHP, BIOS 1.05.14 02/23/2018 
02/23/2018

This is a laptop from Tuxedo company based on Clevo P650HS(-G) model.

the touchpad still works after

- suspend and resume cycle
- hibernate and resume cycle

(sent a second time with mailinglist in CC)
-- 
Mit freundlichem Gruß, André Najda


On Friday, 16 April 2021 12:40:08 CEST you wrote:
> Can you name the precise model of your laptop? Does the touchpad still work
> properly after a suspend and resume cycle?
> 
> On 16.04.21 12:14, André Najda wrote:
> > [    4.315902] psmouse serio2: synaptics: Your touchpad (PNP: SYN1219
> > PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are
> > not used, you might want to try setting psmouse.synaptics_intertouch to 1
> > and report this to linux-input@vger.kernel.org.
> > 
> > I'd like to report this as being told. If you need any further information
> > please ask me. I'm happy to answer any questions.
> > 
> > psmouse.synaptics_intertouch=1 works fine.



