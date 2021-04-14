Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A1335F5BD
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 16:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbhDNODV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 10:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347931AbhDNODU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 10:03:20 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC52C061574;
        Wed, 14 Apr 2021 07:02:57 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g5so24898783ejx.0;
        Wed, 14 Apr 2021 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+GL0bccGhF91/pU0CPQ6qtX8Mn4OD4Tg1yHw5xduEWU=;
        b=tnH66VIyebcluU9CPeDU5Hedp3SS10cqLRjieIC4ZenpTzwFHHmNes1RW8/ano6Xaw
         zIjNTpgh2k3wLxCkpZLnKyEJ8PnyTUFU8OB5Y3ljllMjMnRqumeD6G5HraKIh+pzvENs
         31pBkbnxvZBaIIIvlZEQi4Rv74ZZD3tQbFuWCIs0YcYagtu3QEGC5VLMxXKqcUh5UPKZ
         fjFctkoZRwSzGvUR6ZKhDUPGLKr0djtj9akmrdTiLw61YOG8VV0OC2vJuC9Ja8xngNd1
         8SD+NoIcTqpyWxd6Hpsf0OL480p/in32zNYzXoq2zkcaUXAK+SA4iqvZ7hZvmpKTMlnb
         rDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+GL0bccGhF91/pU0CPQ6qtX8Mn4OD4Tg1yHw5xduEWU=;
        b=BkTyn3mjpIcEJ9qQU4zw7qpqETQcT6u58MBIvLQtVWUiv1bTT7HyvlnvaUO3nsU9WW
         rJpAG2UZffBSpsMurnnv4SoRLzRakVXUt7+afy9NkB4YmtYXxWIksfA1Mijhz+pd4APW
         yXOz3mYpvD6U0WtjBMvGFEaQFKa+NppXzIeP+m+jgXLL9uttzQufP2E2XkCmkOm+vQG3
         SjwA4ojvU0HMJYRePiiPRNNGWuATeD/W9Nh13aV0zWUc+Ysgks+w91R2m+HY66EBp2a2
         xiVm31dRKLsfT96x2r5eD1ijGOcswvzt9UYDUdJ7kTqmB0JuPqN11gQX0XUJ4viutVeR
         /XHA==
X-Gm-Message-State: AOAM533KzsgKyd9+DiDyiA2vlzU+aFMD/DS1aw3OXmWkNx2OccFHvV44
        7vnzUrPJKrGj3YWtQBz6/nbZyNXAWuGMrirx
X-Google-Smtp-Source: ABdhPJx8TOQ+k0C+9gneWM2Hdv4seRQWa2vVPD8QUJlImcMvToSYrr9QAB7KMUkHy/q/3GJla8+0iA==
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr37444466ejq.416.1618408976154;
        Wed, 14 Apr 2021 07:02:56 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id b22sm11618323edv.96.2021.04.14.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:02:55 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Wed, 14 Apr 2021 16:02:54 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Alessandro Grassi <alessandro@aggro.it>, 986561@bugs.debian.org,
        Ioan-Adrian Ratiu <adi@adirat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Bug#986561: linux: Regression in drivers/hid/hid-dr.c causing
 horizontal D-pad to malfunction on SNES joystick
Message-ID: <YHb2Dt24465WcN1r@eldamar.lan>
References: <161779964431.889220.2857033195611862828.reportbug@malacoda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161779964431.889220.2857033195611862828.reportbug@malacoda>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ioan-Adrian,

On Wed, Apr 07, 2021 at 02:47:24PM +0200, Alessandro Grassi wrote:
> Source: linux
> Severity: normal
> Tags: upstream
> X-Debbugs-Cc: alessandro@aggro.it
> 
> Greetings,
> 
> I am encountering the issue described in this thread[1], using a gamepad identified as "DragonRise" with USB ID 0079:0011.
> 
> The joypad works as intended except for the D-pad: up and down are detected in jstest (though misinterpreted: the input graph shows the points in the left up/down corners instead of the center), the left and right buttons are completely ignored.
> 
> Running 'input-events' shows events 0/127 and 255/127 on up and down respectively, nothing at all on left and right.
> 
> I was able to identify that the misbehaviour was caused by this commit[2] on the kernel source tree. To determine this I have rebuilt the Debian kernel using hid-dr.c from the previous commit[3] and loaded hid-dr.ko manually, with which the gamepad worked as intended. I have replaced the file again with the one from the breaking commit iself ([2]) and the behaviour was again broken.
> 
> Furthermore, to confirm that that was the breaking commit, I have commented line 315 (the input mapping one in the struct) from the current Debian source tree and rebuilt it, the joypad works as it should.
> 
> Regards,
> Alessandro
> 
> [1]: https://retropie.org.uk/forum/topic/25657/controler-issue-no-left-and-right-not-working-at-all
> [2]: https://github.com/torvalds/linux/commit/e15944099870f374ca7efc62f98cf23ba272ef43
> [3]: https://github.com/torvalds/linux/commit/313726cad3b68039c8e4dcad5a2840a0d375678c

A user in Debian reported that e15944099870 ("HID: hid-dr: add input
mapping for axis selection") introduced a regression, described above.

Does this ring some bell to you?

Regards,
Salvatore
