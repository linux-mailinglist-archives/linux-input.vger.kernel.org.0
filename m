Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BD0447570
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 21:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236375AbhKGUFP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 15:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhKGUFM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Nov 2021 15:05:12 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB612C061714
        for <linux-input@vger.kernel.org>; Sun,  7 Nov 2021 12:02:28 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id g13so11590225qtk.12
        for <linux-input@vger.kernel.org>; Sun, 07 Nov 2021 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jHTtxJLlQcfnjQLsOeFnXfsLO4QxGpcGfvUQt2BuQxs=;
        b=Vpn+ZMUhe+OzC+TiaSbEzjLlxskWMOQqPAtdyHby0/wBv2iFtRhGkiCk6XKluEIH+3
         SbjxwtTMb4gG40ZtnBIkRhiKUYcREihysIGv6a636VTt+/C8XVyRFuoSpzhkAkSEhSBt
         ArA5PDdnBlGchLV5FuPetGmQ1GFlwp/eHbgAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jHTtxJLlQcfnjQLsOeFnXfsLO4QxGpcGfvUQt2BuQxs=;
        b=Lf1HX36DxCRCvIaKxU2lk+lYFvnm8fNJ4kf6hEv68BwZjZ5/VwCbCKkM1c6npNP1xr
         X4CzSQiwhqGEHLfbdseS3JHoVNISCx3fOAj8mjoRa+RdTG6jTkNavQz1+ohAjJ60WOfG
         BHR+v8pX7uI+21E6RklqJZDIswi8zBemHfe2cSKNr/w4tch9wdc9AJNdJxJAIS8Y1qfF
         xGIJGa0IN/2H2uvZN/bbJuTBCeQK532Hb5WGYW7TRi2V9WZAmaG0R9jOnaUl2k5Q425h
         67IOs1nGEXtYrPHxlSar8cdIUZord0Ruf+RB5T8rSuvv+jxSCU/AacwTfbqpHLSOYBtY
         bSlA==
X-Gm-Message-State: AOAM532foipb2SF+NLRDW5/m+UG7VHUCe6wjCcG3NupWAqMBSEoHHcMh
        YYGEOFUbeeeNxTDP8izzP4AayQ==
X-Google-Smtp-Source: ABdhPJyR11I4O4bZuGRciYtXPvMXbm/K7DeDi4Cg2ixyPz0VaV7tCLJRCcHEg0smn8XnRv1XYPjg4g==
X-Received: by 2002:ac8:7f44:: with SMTP id g4mr78744298qtk.130.1636315348073;
        Sun, 07 Nov 2021 12:02:28 -0800 (PST)
Received: from [152.23.88.220] (dhcp-152-23-88-220.wireless-1x.unc.edu. [152.23.88.220])
        by smtp.gmail.com with ESMTPSA id u19sm9741710qtw.14.2021.11.07.12.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 12:02:27 -0800 (PST)
Message-ID: <3a98b10e-6b78-b769-e22d-2496d7bcd69d@cs.unc.edu>
Date:   Sun, 7 Nov 2021 15:02:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Input: elantench - Fix the firmware misreport coordinates
 for trackpoint occasionally.
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        phoenix <phoenix@emc.com.tw>
References: <20210729010940.5752-1-phoenix@emc.com.tw>
 <000001d79d99$53762dd0$fa628970$@emc.com.tw> <YS0+TU21/nok6Ge9@google.com>
From:   Yufei Du <yufeidu@cs.unc.edu>
In-Reply-To: <YS0+TU21/nok6Ge9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I am a user currently suffering from the firmware bug that causes my trackpoint 
to be unusable on my Lenovo X13 Gen 1 AMD. I tested this patch in the latest 
5.15 mainline kernel tree and can possibly answer your questions regarding the 
patch.

 > I think this will reject X coordinates in range [0, 127]. Is this really
 > what is needed?

As Phoenix explained in his reply, the patch will reject X and Y coordinates 
larger than 127 or smaller than -127. This is because the most significant bit 
of packet[1] (for X) and packet[2] (for Y) are inverse of the sign bit. Although 
I do not have the formal design specification of the device, I tried pushing the 
trackpoint as hard as I could, and the X and Y coordinates never go beyond 
+/-127 normally, so I believe that this patch would not cause any functionality 
issue.

 > What kind of patterns are you observing when firmware
 > misreports coordinates?

Here is a sample log I observed (with elantech.debug set to 2 for more debugging 
messages):
psmouse serio1: elantech: PS/2 packet [10 00 80 26 f9 0a]
psmouse serio1: elantech: PS/2 packet [10 00 80 26 00 80]
psmouse serio1: elantech: PS/2 packet [10 00 80 00 00 00]
psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
psmouse serio1: elantech: PS/2 packet [10 00 80 26 f8 0b]
psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.

The first packet is a valid packet. The second packet is the incorrect packet 
that this patch prevents. The third packet is a corrupted packet that psmouse 
detects (as shown in the "lost sync" message), and the fourth packet is a valid 
packet again. Without the patch, the second packet would cause the cursor to 
jump to the edge of the screen.

So far, all my logs of this issue show the same pattern of a jumpy incorrect 
packet followed by a corrupted packet that causes psmouse to lose sync. There 
are more logs and discussions in the BugZilla entry here: 
https://bugzilla.kernel.org/show_bug.cgi?id=209167

Hope my explanation helped a bit.

Thanks!

Best,
Yufei Du
