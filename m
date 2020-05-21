Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECB31DD207
	for <lists+linux-input@lfdr.de>; Thu, 21 May 2020 17:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgEUPiP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 May 2020 11:38:15 -0400
Received: from smtprelay0055.b.hostedemail.com ([64.98.42.55]:54480 "EHLO
        smtprelay.b.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728317AbgEUPiO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 May 2020 11:38:14 -0400
X-Greylist: delayed 409 seconds by postgrey-1.27 at vger.kernel.org; Thu, 21 May 2020 11:38:14 EDT
Received: from smtprelay.b.hostedemail.com (10.5.19.248.rfc1918.com [10.5.19.248])
        by smtpgrave01.b.hostedemail.com (Postfix) with ESMTP id EB2EC51409
        for <linux-input@vger.kernel.org>; Thu, 21 May 2020 15:31:25 +0000 (UTC)
Received: from filter.hostedemail.com (10.5.19.248.rfc1918.com [10.5.19.248])
        by smtprelay02.b.hostedemail.com (Postfix) with ESMTP id 311BA220DB
        for <linux-input@vger.kernel.org>; Thu, 21 May 2020 15:31:25 +0000 (UTC)
X-Session-Marker: 6A6F686E7A40706C656173616E746E696768746D6172652E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,johnz@pleasantnightmare.com,,RULES_HIT:41:355:379:973:988:989:1260:1277:1312:1313:1314:1345:1381:1437:1516:1518:1519:1534:1542:1593:1594:1595:1596:1711:1730:1747:1777:1792:1981:2194:2199:2393:2553:2559:2562:2691:2743:2892:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3874:4250:5007:6119:6261:6691:7903:7974:8828:10004:10400:10450:10455:10848:11232:11658:11914:12297:12663:13071:13439:13618:13895:14096:14097:14180:14181:19904:19999:21080:21323:21324:21325:21627:21740:21795:30051:30054:30070:30075:30090,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: joke19_4a04ae226d1f
X-Filterd-Recvd-Size: 2737
Received: from localhost (hlfxns018gw-134-41-50-0.dhcp-dynamic.fibreop.ns.bellaliant.net [134.41.50.0])
        (Authenticated sender: johnz@pleasantnightmare.com)
        by omf04.b.hostedemail.com (Postfix) with ESMTPA
        for <linux-input@vger.kernel.org>; Thu, 21 May 2020 15:31:24 +0000 (UTC)
Date:   Thu, 21 May 2020 12:29:43 -0300
From:   "John Z." <johnz@pleasantnightmare.com>
To:     linux-input@vger.kernel.org
Subject: Thrustmaster T.Flight 4 driver, help needed
Message-ID: <20200521152943.GE77215@johnslap.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello all,
    I've recently acquired Thrustmaster T.Flight 4 HOTAS, and few of the
    axes do not work, so I wanted to try and fix that.

    I've gotten as far as decoding the USB HID report and comparing it
    to the data packets - and realizing that HID report basically lies
    about offsets.
    The axes that do work are reported correctly, but those that are
    missing are changing byte values in Vendor Specific areas. The user
    manual also says that if the HOTAS is to be used on PC, it is very
    important to install proprietary driver, otherwise some axes won't
    work.

    I've got a tip from a friend that some hardware requires vendor
    specific GET FEATURE request to put hardware into compliant mode,
    but I have instead started hacking together a simple userspace
    program to parse bytes at correct offsets, and then asked for advice
    about how to get this done so that joydev (or evdev, I am not sure)
    properly picks this up, rather than (I'm assuming?) relying on HID
    report to get the data.
    This _might_ produce a buggy driver since joystick has a plug for
    pedals as well, which may change things if they're plugged in.

    Another person advised me that they don't believe this can be done
    in userspace, that I should write a kernel module if I feel capable,
    and that if I'm comfortable with coding and willing to merge it
    upstream - I should seek further help here.
    They further suggested that it might be possible to use a generic
    driver as a foundation and make a specialized version that only
    loads when vendor and product ID's match the hardware.

    If these suggestions are correct - I have a basic skeleton
    helloworld module building and working and my userspace prototype
    (based on Alan Ott's example). I could use some guidance, even just
    pointers to correct places in documentation would be very useful. I
    tried finding my way myself, but there's so much information I have
    no idea where to even start.

    Thanks.


-- 
John Z.
"Rip and tear until it is done."
