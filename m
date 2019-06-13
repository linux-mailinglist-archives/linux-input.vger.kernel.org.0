Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DEC43AFB
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 17:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731589AbfFMPZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 11:25:12 -0400
Received: from mail179c50.megamailservers.eu ([91.136.10.189]:36032 "EHLO
        mail18c50.megamailservers.eu" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731587AbfFMMKS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 08:10:18 -0400
X-Greylist: delayed 1238 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jun 2019 08:10:16 EDT
X-Authenticated-User: wbauer@tmo.at
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
        s=maildub; t=1560426548;
        bh=HrX/Toa8WL0bIniH8dfhPiHbMJPrTq+JJanB+UguPvQ=;
        h=From:To:Reply-To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r0zoI3QGEmDpgBBBDhrd4oGJ2DEmyDB1YTZF6h4tJGtlb2VnDHgfoTVeunM/yMXn+
         /s7AhRI7wDOqUfZZe8ZoJhL5Fpvq1EIIhi1Oe+/t0FxYjcMm8Jme3g5KKaEvF7mkNL
         vajyH0bdUtBtBi1FIVXvZfMfv9PvWO+Py0zWmfm8=
Feedback-ID: wbauer@tmo.at
Received: from linux-lf90.site (217-149-175-152.nat.highway.telekom.at [217.149.175.152])
        (authenticated bits=0)
        by mail18c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id x5DBn471000537;
        Thu, 13 Jun 2019 11:49:06 +0000
From:   Wolfgang Bauer <wbauer@tmo.at>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Reply-To: wbauer1@a1.net
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom usage
Date:   Thu, 13 Jun 2019 13:48:52 +0200
Message-ID: <5346893.KeHrH3GHoD@linux-lf90.site>
User-Agent: KMail/4.14.10 (Linux/5.2.0-rc4-11.gad82a9a-default; KDE/4.14.38; x86_64; ; )
In-Reply-To: <CAO-hwJLAiC1o-kZ5epZHtO2GK+zc5x28pYbZH-XsY4yAuBmHWw@mail.gmail.com>
References: <20190611121320.30267-1-nsaenzjulienne@suse.de> <CAO-hwJLAiC1o-kZ5epZHtO2GK+zc5x28pYbZH-XsY4yAuBmHWw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CTCH-RefID: str=0001.0A0B0213.5D023834.0012,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC:  0
X-CHA:  v=2.3 cv=c7eFvy1l c=1 sm=1 tr=0 a=6czakCY3PBpK8pPoOZjRDg==:117
        a=6czakCY3PBpK8pPoOZjRDg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
        a=kj9zAlcOel0A:10 a=1oJP67jkp3AA:10 a=ZZnuYtJkoWoA:10 a=VwQbUJbxAAAA:8
        a=X5GEwJZm6cy5eeibxwMA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday, 11. Juni 2019, 16:42:37 Benjamin Tissoires wrote:
> On Tue, Jun 11, 2019 at 2:13 PM Nicolas Saenz Julienne
> 
> <nsaenzjulienne@suse.de> wrote:
> > NOTE: I CC'd Wolfgang as he's the one who can test this.
> 
> I'll wait for Wolfram to confirm that the patch works before pushing then.

My name is Wolfgang, not Wolfram... ;-)
But never mind.

I tested the patch meanwhile on top of kernel 5.2.rc4, where the mouse wheel 
actually worked.
As the patch didn't apply cleanly (it's obviously based upon 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=abf82e8f7e9af40a49e3d905187c662a43c96c8f , called "HID-
a4tech-fix-horizontal-scrolling.patch" below), I added that patch as well.

My results:
kernel 5.2.rc4 works
kernel 5.2.rc4 + HID-a4tech-fix-horizontal-scrolling.patch is broken
kernel 5.2.rc4 + HID-a4tech-fix-horizontal-scrolling.patch +
HID-input-fix-a4tech-horizontal-wheel-custom-usage.patch (i.e. this patch) 
works again

kernel 5.2.rc4 + HID-input-fix-a4tech-horizontal-wheel-custom-usage.patch 
works as well.

So AFAICT this patch seems to be fine.

For completeness, this is my mouse as listed by lsusb:
Bus 003 Device 002: ID 09da:000a A4Tech Co., Ltd. Optical Mouse Opto 510D / 
OP-620D

Kind Regards,
Wolfgang

