Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE3F1D6867
	for <lists+linux-input@lfdr.de>; Sun, 17 May 2020 16:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgEQOVw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 10:21:52 -0400
Received: from traxus.robots.org.uk ([37.139.10.94]:47970 "EHLO
        traxus.robots.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQOVv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 10:21:51 -0400
X-Greylist: delayed 1783 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 May 2020 10:21:50 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=robots.org.uk; s=1; h=Content-Transfer-Encoding:MIME-Version:Content-Type:
        Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ncHJ8xTLImHoM9amJ3w6igetMxQJknpPN8aLdUll+rA=; b=nZ4koyxyuthZDUa4A8Jb0AS2s2
        qlCkCAXWe1M08v6q2Qptz8DFkVPOZAbj/tmah17nmBzEs76pzm6qnd+utwF+G2Ygr6Yoq0RNEqzfC
        mQAVmH6Qa272PJTgWTt+XQwiQRJC5c++B3jB84ggZD+bY0bmxxMBdJsqFwyW1iN4QkGCDz+gbv6PR
        UUUzo9EnvpXj2anSHhMWKLostck5fsDpMUluc3NmYeah7kXYSJlfu6tF6xD1SQa8M36i8Qp/9fkb9
        DMPDFNnu1VMDd7uRzFwDDfqUPOAlgYRdjtHupQMaOMhXCv851Db3I0qGPsCANYhx5L3Y17zAIEOhy
        fPwCJXbg==;
Received: from [2a02:c7f:6c5a:fb00:63c5:7fea:fb50:4a33] (helo=merodach.ipa.robots.org.uk)
        by traxus with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sam@robots.org.uk>)
        id 1jaJhy-00028w-UB; Sun, 17 May 2020 13:52:05 +0000
Message-ID: <8b1ab9a7835ba9dd779b6acd42c70708184617e7.camel@robots.org.uk>
Subject: Dynabook (formerly Toshiba) X30/X40 AccuPoint (pointing stick)
 garbage input events - solved!
From:   Sam Morris <sam@robots.org.uk>
To:     linux-input@vger.kernel.org
Date:   Sun, 17 May 2020 14:52:01 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I'm using 5.6.12 on a Dynabook (formetly Toshiba) X30 and X40. This
laptop has a pointing stick that is non-functional on Linux. Touching
it causes a stream of garbage button press events to be produced that
make the trackpad unusable for a few seconds. Please see <
https://bugzilla.kernel.org/show_bug.cgi?id=205817> for more details.

The kernel told me to post here:

   psmouse serio1: synaptics: queried max coordinates: x [..5682], y [..4760]
   psmouse serio1: synaptics: queried min coordinates: x [1262..], y [1092..]
   psmouse serio1: synaptics: Your touchpad (PNP: TOS0213 PNP0f03) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
   psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0x1e2a1, caps: 0xf00123/0x840300/0x12e800/0x200000, board id: 3322, fw id: 2553520
   input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input5

When booting with psmouse.synaptics_intertouch=1, the pointing sick
(and 'mouse' butotns) remain non-functional, but the garbage events are
finally gone!

   psmouse serio1: synaptics: queried max coordinates: x [..5682], y [..4760]
   psmouse serio1: synaptics: queried min coordinates: x [1262..], y [1092..]
   psmouse serio1: synaptics: Trying to set up SMBus access
   psmouse serio1: synaptics: SMbus companion is not ready yet
   psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0x1e2a1, caps: 0xf00123/0x840300/0x12e800/0x200000, board id: 3322, fw id: 2553520
   psmouse serio1: synaptics: queried max coordinates: x [..5682], y [..4760]
   psmouse serio1: synaptics: queried min coordinates: x [1262..], y [1092..]
   psmouse serio1: synaptics: Trying to set up SMBus access
   rmi4_smbus 6-002c: registering SMbus-connected sensor
   rmi4_f34 rmi4-00.fn34: rmi_f34v7_probe: Unrecognized bootloader version
   rmi4_f34: probe of rmi4-00.fn34 failed with error -22
   rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3322-001, fw id: 2553520
   input: Synaptics TM3322-001 as /devices/rmi4-00/input/input22

   /proc/bus/input/devices reports:

   I: Bus=001d Vendor=06cb Product=0000 Version=0000
   N: Name="Synaptics TM3322-001"
   P: Phys=rmi4-00/input0
   S: Sysfs=/devices/rmi4-00/input/input22
   U: Uniq=
   H: Handlers=mouse1 event17 
   B: PROP=5
   B: EV=b
   B: KEY=e520 10000 0 0 0 0
   B: ABS=6f3800001000003

      Can this be made the default for this hardware & do you need any other
      information to make it so?

      -- 
      Sam Morris
      <https://robots.org.uk/>

