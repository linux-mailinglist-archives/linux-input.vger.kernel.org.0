Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA8F391D8E
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 19:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhEZRKC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 13:10:02 -0400
Received: from confino.investici.org ([212.103.72.250]:32041 "EHLO
        confino.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbhEZRKB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 13:10:01 -0400
X-Greylist: delayed 419 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 May 2021 13:10:01 EDT
Received: from mx1.investici.org (unknown [127.0.0.1])
        by confino.investici.org (Postfix) with ESMTP id 4Fqy094hb5z10vC
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1622048489;
        bh=bLruLpmQOuAMRBQjh4mfDVoQQZmjHxD5mSXlyddpj+Y=;
        h=From:To:Subject:Date:From;
        b=OV+Q6DsZtSSa2WFieOJ9q1SEuuPUKxmNE6bPlmrYFxqyDCfznbeMC2aW0f18eLGOv
         Kci0+g9uGcqP4QNj/Xn41RZbPISL2FACXj7hnMVmyN8k631iVLc7VJ73HRpRlxLt+2
         UD9Hrn88V56qWxofNuOQ7BIHy8o4EDElM9SPGCDw=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250]) (Authenticated sender: andrea.monaco@autistici.org) by localhost (Postfix) with ESMTPSA id 4Fqy093zHGz10v7
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 17:01:29 +0000 (UTC)
From:   "Andrea G. Monaco" <andrea.monaco@autistici.org>
To:     linux-input@vger.kernel.org
Subject: Acer laptop, SYN1B7F Synaptics touchpad gets wild sometimes
Date:   Wed, 26 May 2021 19:01:28 +0200
Message-ID: <87mtshfmzb.fsf@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hello,


on Acer laptop, my SYN1B7F Synaptics touchpad quite often starts acting
wild, moving and clicking and scrolling on its own. It uses HID over I2C
interface. The kernel is 4.19.0 on Debian.


This is an example of the evtest output in those moments, while I didn't
touch the pad at all:


Event: time 1622047857.609072, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42932700
Event: time 1622047857.609072, -------------- SYN_REPORT ------------
Event: time 1622047857.616372, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42939900
Event: time 1622047857.616372, -------------- SYN_REPORT ------------
Event: time 1622047857.623630, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42947100
Event: time 1622047857.623630, -------------- SYN_REPORT ------------
Event: time 1622047857.630933, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42954300
Event: time 1622047857.630933, -------------- SYN_REPORT ------------
Event: time 1622047857.638218, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42961500
Event: time 1622047857.638218, -------------- SYN_REPORT ------------
Event: time 1622047857.645786, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 489
Event: time 1622047857.645786, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 215
Event: time 1622047857.645786, type 3 (EV_ABS), code 0 (ABS_X), value 489
Event: time 1622047857.645786, type 3 (EV_ABS), code 1 (ABS_Y), value 215
Event: time 1622047857.645786, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42968700
Event: time 1622047857.645786, -------------- SYN_REPORT ------------
Event: time 1622047857.653065, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42975900
Event: time 1622047857.653065, -------------- SYN_REPORT ------------
Event: time 1622047857.660063, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 498
Event: time 1622047857.660063, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 181
Event: time 1622047857.660063, type 3 (EV_ABS), code 0 (ABS_X), value 498
Event: time 1622047857.660063, type 3 (EV_ABS), code 1 (ABS_Y), value 181
Event: time 1622047857.660063, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42983100
Event: time 1622047857.660063, -------------- SYN_REPORT ------------
Event: time 1622047857.667358, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 182
Event: time 1622047857.667358, type 3 (EV_ABS), code 1 (ABS_Y), value 182
Event: time 1622047857.667358, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 42990300
Event: time 1622047857.667358, -------------- SYN_REPORT ------------


I also noted that lots of those lonely MSC_TIMESTAMPs get emitted when
the touchpad works fine too. Is this expected behavior?


I would appreciate any pointer or feedback to help me work on it.

Andrea Monaco
