Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9539C37624A
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 10:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbhEGIpu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 7 May 2021 04:45:50 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:33768 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhEGIpt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 May 2021 04:45:49 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="40617667"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 07 May 2021 16:44:47 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(178003:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 07 May 2021 16:44:47 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2470:1:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 07 May 2021 16:44:44 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Doug Anderson'" <dianders@chromium.org>,
        "'Johnny Chuang'" <johnny.chuang.emc@gmail.com>
Cc:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        "'Peter Hutterer'" <peter.hutterer@who-t.net>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'open list:HID CORE LAYER'" <linux-input@vger.kernel.org>,
        "'Harry Cutts'" <hcutts@chromium.org>,
        "'James Chen'" <james.chen@emc.com.tw>,
        "'Jennifer Tsai'" <jennifer.tsai@emc.com.tw>,
        "'Paul Liang'" <paul.liang@emc.com.tw>,
        "'Jeff Chuang'" <jeff.chuang@emc.com.tw>,
        "'Jingle'" <jingle.wu@emc.com.tw>
References: <1618276850-27178-1-git-send-email-johnny.chuang.emc@gmail.com> <CAD=FV=VvrWKKbLExpFaDLTDGTam3rbwd7CwTLVFdCY=_c7-eag@mail.gmail.com> 
In-Reply-To: 
Subject: RE: [PATCH v3] HID: i2c-hid: Skip ELAN power-on command after reset
Date:   Fri, 7 May 2021 16:44:44 +0800
Message-ID: <038a01d7431d$3adb6b90$b09242b0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQG7a3HnjRYiIwf6YyXjsXt955W0TQGCv5oKqu063NCAFbNHsA==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03Nzk3MWRlMi1hZjEwLTExZWItODY2Mi03YzVjZjg3NDk0NzhcYW1lLXRlc3RcNzc5NzFkZTQtYWYxMC0xMWViLTg2NjItN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIxNTM1IiB0PSIxMzI2NDg1MDY4MzcwNjU5NDAiIGg9Ijk5U2ZtRWNqcGhrd01SM1hkazA1QmtNcFZCYz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> > Hi,
> >
> > On Mon, Apr 12, 2021 at 6:20 PM Johnny Chuang
> > <johnny.chuang.emc@gmail.com> wrote:
> > >
> > > Fixes: 43b7029f475e ("HID: i2c-hid: Send power-on command after reset").
> >
> > Note that the "Fixes" tag actually belongs down at the end. It also
> > shouldn't have a "." at the end. Presumably the maintainer can adjust this
> when landing?
> >
> 
> Hi Dmitry,
> Could you help to review this patch and give an advice?

Hi Sirs,
Could anyone help to review this patch and give an advice?

> 
> >
> > > For ELAN touchscreen, we found our boot code of IC was not flexible
> > > enough to receive and handle this command.
> > > Once the FW main code of our controller is crashed for some reason,
> > > the controller could not be enumerated successfully to be recognized
> > > by the system host. therefore, it lost touch functionality.
> > >
> > > Add quirk for skip send power-on command after reset.
> > > It will impact to ELAN touchscreen and touchpad on HID over I2C projects.
> > >
> > > Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> >
> > This patch looks fine to me, thus:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I can confirm that after applying this patch I can recovery my borked
> > touchscreen (which got borked by a failed firmware update ages ago):
> >
> > Tested-by: Douglas Anderson <dianders@chromium.org>

