Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956E87733E
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 23:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfGZVKy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 17:10:54 -0400
Received: from zoot.epublica.de ([78.46.103.157]:51418 "EHLO zoot.epublica.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbfGZVKy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 17:10:54 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Jul 2019 17:10:53 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zoot.epublica.de (Postfix) with ESMTP id A8E9C1840D0A;
        Fri, 26 Jul 2019 23:04:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at zoot.epublica.de
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9]
        autolearn=no autolearn_force=no
Received: from zoot.epublica.de ([127.0.0.1])
        by localhost (zoot.epublica.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dIwKdE8-r-0G; Fri, 26 Jul 2019 23:04:10 +0200 (CEST)
Received: from [IPv6:2a04:4540:680e:4001:c8fd:e16b:ea51:5c6d] (unknown [IPv6:2a04:4540:680e:4001:c8fd:e16b:ea51:5c6d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by zoot.epublica.de (Postfix) with ESMTPSA id 376941841554;
        Fri, 26 Jul 2019 23:04:10 +0200 (CEST)
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        jikos@kernel.org
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>
From:   Hanno Zulla <abos@hanno.de>
Subject: Question about gamepad trigger axis values: Is -32767 or 0 the
 correct resting position?
Message-ID: <6b611ae9-a4b4-d456-2a44-dc9d00140a68@hanno.de>
Date:   Fri, 26 Jul 2019 23:04:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi there,

during a discussion of a Retropi issue [1] a question about the Linux
kernel gamepad spec compared to the actual gamepad drivers came up.

The spec says in [2]:

> "ABS trigger values start at 0,
> pressure is reported as positive values."

The kernel drivers for the XBox 360 gamepad, for the Sony Sixaxis PS3
gamepads and other drivers based on their example (like the BigBen
gamepad) however return trigger axis values with a value range that...

- starts at -32767 (trigger resting position) and
- goes up to +32767 (full pressure on the trigger)
- with 0 being the middle position (half pressure)

Please clarify, is the spec wrong or are the drivers in violation of it?

If they are in violation, which should be changed, the spec or the
drivers' behavior?

Thank you,

Hanno

[1] https://github.com/RetroPie/EmulationStation/issues/568
[2] https://www.kernel.org/doc/html/v5.2/input/gamepad.html

