Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106F3447A4F
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 07:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237638AbhKHGJS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 01:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbhKHGJS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 01:09:18 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCE4C061570;
        Sun,  7 Nov 2021 22:06:34 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id u11so15092513plf.3;
        Sun, 07 Nov 2021 22:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PK225LY8ZCorpxzeuNT4a8ylrRSYfrbGsO6m0+KrxhQ=;
        b=EerJR3XtJqpBq+H9Sla0EfFI4v1NPOS/rsLLnLwYJS7H/lSvfBH7DGH4r0KZ58jRs5
         OScMfLG0lFSTGY7vW41pxyaAS9FT7h86yYcZWSF1KlTjH/bPf/dMMSfnGSpCEmHBxVcu
         wfGj47Obb5WHtUOLkFa7IbzKvG0uhRegwY73ma8eTQ+lhvitHaL3HR+/WG04MB45r+AW
         RljLqQ6ctPCpJVkxOVbCPvtVNtaMVp+yjT73qVkNrCwkxSqeWRhjPu058MqyhMRZRgJc
         s6C3wV8juwNr/3Ae/g1XQXy0SduDiUno31ek3G1IdWqpAw0CP3dK/qevuWvM9T5baO/4
         ASuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PK225LY8ZCorpxzeuNT4a8ylrRSYfrbGsO6m0+KrxhQ=;
        b=kE77Q4xsaPziyNnvDWaLr5QqOHRcw9BF1lG3Zv+/dcDj5zWffGWHkvlwqH5ps9ImQl
         AnITWhO+iOjWGJ6lNJHvQvgMhkm0Rz2aZ4zwRVuOtYzxzXfn3amTA2MP5YXus6feytCX
         qg+1OGiSeFhwPbPEK6TJjPFKpgF0o7Evst8xGgeYOHzptCvapLKggYULWa2CrIfJIAwv
         QLYK1enaLceIfBJ6FTtYTWOxbRBrB54WNb9m1rcJTCsyIBq5hwS9npwSzoEyDcsSV++g
         wO1WBf661drtmLMLtBYE0ozq7Tc0KzMb71LLgAQK21aZqN8uCCjsTyZhwTjp+sZYstm1
         c/1g==
X-Gm-Message-State: AOAM531WqOVN5u2huFXxKrBZUPveQzOAPu34jhDVDKRGrMwrbniNviSx
        wSBKkAA3ZbHLfhrN6ZcxX65pRriZ9I8=
X-Google-Smtp-Source: ABdhPJyH6HJaeWq3eY8xIuSoB09+i8NzWebT8jFMLwo12UB6tjIWm6at8sAQDopDeQXXKg7XoQ5E9Q==
X-Received: by 2002:a17:902:d2ce:b0:141:f710:922 with SMTP id n14-20020a170902d2ce00b00141f7100922mr46264505plc.7.1636351593879;
        Sun, 07 Nov 2021 22:06:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:ebb6:b39e:7da6:955f])
        by smtp.gmail.com with ESMTPSA id q89sm521927pjk.50.2021.11.07.22.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 22:06:32 -0800 (PST)
Date:   Sun, 7 Nov 2021 22:06:30 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yufei Du <yufeidu@cs.unc.edu>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        phoenix <phoenix@emc.com.tw>
Subject: Re: [PATCH] Input: elantench - Fix the firmware misreport
 coordinates for trackpoint occasionally.
Message-ID: <YYi+ZoeGtFO+/HYO@google.com>
References: <20210729010940.5752-1-phoenix@emc.com.tw>
 <000001d79d99$53762dd0$fa628970$@emc.com.tw>
 <YS0+TU21/nok6Ge9@google.com>
 <3a98b10e-6b78-b769-e22d-2496d7bcd69d@cs.unc.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a98b10e-6b78-b769-e22d-2496d7bcd69d@cs.unc.edu>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yufei,

On Sun, Nov 07, 2021 at 03:02:27PM -0500, Yufei Du wrote:
> Hi Dmitry,
> 
> I am a user currently suffering from the firmware bug that causes my
> trackpoint to be unusable on my Lenovo X13 Gen 1 AMD. I tested this patch in
> the latest 5.15 mainline kernel tree and can possibly answer your questions
> regarding the patch.
> 
> > I think this will reject X coordinates in range [0, 127]. Is this really
> > what is needed?
> 
> As Phoenix explained in his reply, the patch will reject X and Y coordinates
> larger than 127 or smaller than -127. This is because the most significant
> bit of packet[1] (for X) and packet[2] (for Y) are inverse of the sign bit.
> Although I do not have the formal design specification of the device, I
> tried pushing the trackpoint as hard as I could, and the X and Y coordinates
> never go beyond +/-127 normally, so I believe that this patch would not
> cause any functionality issue.
> 
> > What kind of patterns are you observing when firmware
> > misreports coordinates?
> 
> Here is a sample log I observed (with elantech.debug set to 2 for more
> debugging messages):
> psmouse serio1: elantech: PS/2 packet [10 00 80 26 f9 0a]
> psmouse serio1: elantech: PS/2 packet [10 00 80 26 00 80]
> psmouse serio1: elantech: PS/2 packet [10 00 80 00 00 00]
> psmouse serio1: Touchpad at isa0060/serio1/input0 lost sync at byte 6
> psmouse serio1: elantech: PS/2 packet [10 00 80 26 f8 0b]
> psmouse serio1: Touchpad at isa0060/serio1/input0 - driver resynced.
> 
> The first packet is a valid packet. The second packet is the incorrect
> packet that this patch prevents. The third packet is a corrupted packet that
> psmouse detects (as shown in the "lost sync" message), and the fourth packet
> is a valid packet again. Without the patch, the second packet would cause
> the cursor to jump to the edge of the screen.
> 
> So far, all my logs of this issue show the same pattern of a jumpy incorrect
> packet followed by a corrupted packet that causes psmouse to lose sync.
> There are more logs and discussions in the BugZilla entry here:
> https://bugzilla.kernel.org/show_bug.cgi?id=209167
> 
> Hope my explanation helped a bit.

Sorry I lost track of this patch. Can I add your Tested-by to it before
applying?

Thanks.

-- 
Dmitry
