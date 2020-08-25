Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39BC25194D
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 15:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgHYNN2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Aug 2020 09:13:28 -0400
Received: from mx01-muc.bfs.de ([193.174.230.67]:55655 "EHLO mx01-muc.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbgHYNN1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Aug 2020 09:13:27 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Aug 2020 09:13:25 EDT
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-muc.bfs.de (Postfix) with ESMTPS id 7DED42011B;
        Tue, 25 Aug 2020 15:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1598360888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DfGEV/vhGDWZpAaUnALOMzkCaWG+zSVd/96DRDJ5/ls=;
        b=I6AC7eupTBweA2z5lzUYIzGpaHhVMS8gH9lBNdCrYmKpLKX2J0X72ORAJ9SsVWa3HCU9GA
        V/U7AkUXfwNPrPnTy8GqzNEh/BvCWSrWTFm4mKy1E4pSfbiJacpsk/Lx5heQqTn6s/Whnj
        dWdl0qaAwtnd4XavzsBtT8Mj1dFOMlwSZDJwmIvc4ES+wPX6gRL0ea7ESd9lHsFHKrvMQS
        7WpNWJL0Hq2OCTOuUPqc1ppLEQVi7AsRqNn6T8zvQ0EbeQIAhGNS8qPbMeWA/udd28/Z6l
        Lq2s1Tiop1k/Ny4TlqOlai+PogWJCw5Y3BlV9eH9OeuxWV9byzAhj+vMiBzOHw==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Tue, 25 Aug
 2020 15:08:07 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.2044.004; Tue, 25 Aug 2020 15:08:07 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Stefan Achatz <erazor_de@users.sourceforge.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: AW: [PATCH v2] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
Thread-Topic: [PATCH v2] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
Thread-Index: AQHWefToEl9avbae1kGQ4FmFDoAFsalHYb09gADrooCAAIAoLQ==
Date:   Tue, 25 Aug 2020 13:08:07 +0000
Message-ID: <4b0f8fc9b361495c8678de81b1cba381@bfs.de>
References: <1597819984.4101.16.camel@web.de> <20200824085735.GA208317@mwanda>
 <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>,<20200825072903.GQ1793@kadam>
In-Reply-To: <20200825072903.GQ1793@kadam>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
x-tm-as-product-ver: SMEX-14.0.0.3031-8.6.1012-25624.007
x-tm-as-result: No-10--10.842700-5.000000
x-tmase-matchedrid: 9K29sLhW7mvRubRCcrbc5pzEHTUOuMX33dCmvEa6IiGoLZarzrrPmYbM
        AgFeDdi/NxD2+UPaZLLxJpuUVnIb4aEJuVPDxbSkL7t268n/pW3lf2cXbNRplGOMyb1Ixq8VLUR
        eLvdYkFoPn/Bqa8wShuMwa0EiWUk5HyjC+QCbXy0C4mcWVH6HR6dlL9piCOvOMYkmNIO7+haW0G
        j8TPZHp/8nv9x3PStarwZ5g8tV9IyD/sxA0J0W+vUwiX15l0tvMC4zO7d4kaN/50V5HbQzfO7wr
        YXyDkL3rwukP2KfdpBl2ySchWEQjPEPTHQ3k3TSRXdiukZQCgF9LQinZ4QefNZE3xJMmmXc+gtH
        j7OwNO2J8YJgRrgXF16w4bdxd81x2moSG7OJU8U+f4Zag2CTlsuKfUh5HKbi
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--10.842700-5.000000
x-tmase-version: SMEX-14.0.0.3031-8.6.1012-25624.007
x-tm-snts-smtp: B9A852186FD1D5E37DF19BB7767A9DCF76ABCED6B72DBA16A1D7B4441AD735862000:9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=0.07
Authentication-Results: mx01-muc.bfs.de;
        none
X-Spamd-Result: default: False [0.07 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         BAYES_SPAM(0.07)[58.26%];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[7];
         NEURAL_HAM(-0.00)[-0.994];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[]
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

lets hope the maintainer picks that up.

re,
 wh

________________________________________
Von: Dan Carpenter [dan.carpenter@oracle.com]
Gesendet: Dienstag, 25. August 2020 09:29
An: Walter Harms
Cc: Stefan Achatz; Jiri Kosina; Benjamin Tissoires; linux-input@vger.kernel=
.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Betreff: Re: [PATCH v2] HID: roccat: add bounds checking in kone_sysfs_writ=
e_settings()

On Mon, Aug 24, 2020 at 03:35:16PM +0000, Walter Harms wrote:
> hello Dan,
>
> i notice that you can shorten the line to:
> (line above checks for count=3D=3Dsizeof(struct kone_settings))
>
> difference =3D memcmp(settings, &kone->settings, count);
>
> nothing special just to shorten the line and make use of count.
>
> and just to save one indent level and because its  readabel nicely:
>     if ( ! difference )
>           goto unlock;
>
> hope that helps

Yeah.  I wrote that version and I wanted to send it, but then I decided
not to change the style too much.  I definitely agree with you, but I
figured I would keep the patch less intrusive.

regards,
dan carpenter

