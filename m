Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA93420422
	for <lists+linux-input@lfdr.de>; Sun,  3 Oct 2021 23:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhJCVyo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Oct 2021 17:54:44 -0400
Received: from smtpq2.tb.ukmail.iss.as9143.net ([212.54.57.97]:59604 "EHLO
        smtpq2.tb.ukmail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231748AbhJCVyo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 3 Oct 2021 17:54:44 -0400
Received: from [212.54.57.107] (helo=csmtp3.tb.ukmail.iss.as9143.net)
        by smtpq2.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <gareth.randall@virgin.net>)
        id 1mX9Pj-0001jU-E2
        for linux-input@vger.kernel.org; Sun, 03 Oct 2021 23:52:55 +0200
Received: from Gareths-MacBook-Air.local ([94.175.123.86])
        by cmsmtp with ESMTPA
        id X9PjmbEmwbkrTX9PjmcZbZ; Sun, 03 Oct 2021 23:52:55 +0200
X-Originating-IP: [94.175.123.86]
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=OYD7sjfY c=1 sm=1 tr=0 ts=615a2637 cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=8gfv0ekSlNoA:10 a=xh9-zwYpyvl_0m1RXDsA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1633297975;
        bh=4hDU6reULa8zKa4tfF0uJoTTpZ75y1D09A7gn2RU9+Y=;
        h=From:Subject:To:Date;
        b=bIy5y56jXHYCUBaa8JUvcRC/xeh4GaoAmhD4hP0GI9fwhUyWyttIstRckavuoCpaU
         kU0C/pckKwLbi58lXPr77pWLEXwPXT0PNAFOkFqKgJhtVARAFDMluCkJ8iQaT3bOGT
         h73BKeIe5HRAx56zUe4r8WMWjGRxvYRI9iMjib/PXXowbOIglAdajkmVZ7YXYCs5rv
         3Rjwqi5SOpHDzbRy6IqwEq0Ys/FxOPw+6l2sVFhhH0Rj6LSfHHTfP1p57D2QqNJHwe
         fD5t3H/bReeparWBvGeG7gbbXZ2pKHVI04U9XVwNMH5iOCd0/KT28QpUpNwemmZig4
         8IVPPohufUB+Q==
From:   Gareth Randall <gareth.randall@virgin.net>
Subject: [PATCH RESEND 0/1] Add support for touch screens using the General
 Touch ST6001S controller.
To:     linux-input@vger.kernel.org
Message-ID: <ac6ad041-c57f-2850-b244-a332c980f154@virgin.net>
Date:   Sun, 3 Oct 2021 22:52:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKE9rWJt/qzkM073SA5yBry6AsaCLOdRA01xVrElt9KHn0fK5fHlVBHD6x3YcDp8dZ7+oXeZs3my0oq4wtDEs7iPKE6ZfRVHCNct9gz52JvGpEzIMoEo
 djXzcMHVODI187OtOENE6PGAD5YAp6NFP0OmBHKLKA5qcC6+yv9UjnX7D5qSS81BclnCyLVJG28iFuK0teTi/ym1JR8f2w3lMa+fVxr/KCliL3pbYXOrfkAa
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for touch screens using the General Touch ST6001S
controller, as found in the GPEG model AOD22WZ-ST monitor.
This controller can output the ELO 10-byte protocol,
but requires different initialisation.


However, I would like some advice from the maintainers:

Where my patch contains the following lines, I have set them to match a 
22 inch screen (GPEG model AOD22WZ-ST) that I have been working on, 
based on me moving my finger and watching the position of the mouse 
pointer in X-windows. Are the maintainers satisfied with this or should 
there also be an option to specify them as kernel parameters?

+       // Values taken from a GPEG model AOD22WZ-ST monitor
+       input_set_abs_params(dev, ABS_X, 1365, 5828, 0, 0);
+       // max and min inverted because screen axis is inverted
+       input_set_abs_params(dev, ABS_Y, 5013, 2260, 0, 0);

Note also that the /bin/inputattach command must be extended to support 
using the newly added elo->id value (id=4). I can post my changes to 
this to assist those reviewing this patch but have not here as I'm 
trying to stick to the patch email format.

Thank you for your consideration.


  drivers/input/touchscreen/elo.c | 58 +++++++++++++++++++++++++++++++++
  1 file changed, 58 insertions(+)

