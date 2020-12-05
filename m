Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCCC2CFFDA
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 01:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgLFAAU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 19:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLFAAU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 19:00:20 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423CFC0613CF;
        Sat,  5 Dec 2020 15:59:40 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id w4so5909214pgg.13;
        Sat, 05 Dec 2020 15:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SHqvB3TphI2x05NTOt9y+fjRW/Zq5VR17jei3sHPbQ4=;
        b=itk+OrRnK1bPYRG0cUyYdF1YZf7M7PiSMehuwwIjMFcmj131WTvaBSnospUqLynaWW
         FaFSvmLnk75b0tM2zRuhXMyUC596vsARx1dEgHos/i8kP3g4HXP3ynP7d0xtG0xDcf0W
         Bobp8q/zb3ChPKKm0Z/ldV4KAt55ykMI0rbGUS1VfjXsmKKk6OgVL8MhTePDDZ3vbcfK
         I5ofAi76kmGLxdyLD9Gt8gY9KoKxiB0dxt2dzA+4FCdy2YoZ/zAhKDXX1AosO/rGdywZ
         57hSQN35bjWnEiq0fJcWjhT09AjMFcy0kAortqcyKqm+NRlTr1yytUyPLr4amvn/iaiX
         sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SHqvB3TphI2x05NTOt9y+fjRW/Zq5VR17jei3sHPbQ4=;
        b=TLivujJrEaEQa7CuuZ1Ezi+xE5/Zu9uXj5hnqyIdiKAsFL+P5p4AlTxCyH+zEyNzjK
         Wa9w8tx1/OvR3hx+HjmTHbAgfvb7mmDzHQ5JKfvzlPz/yCnyb1+4WNJdsfND0ShVV/Xi
         aYDUZ521zFlbFhbwL25xV75sokThUC+7c7rTeZzP73YnVm9irFb9tJIaOBNGEhwEQwwE
         yqnZ8zoI4m0ZBr4AozZCj1hKQoc0v4+aBhq3Md/6uxi70pEPC0NtWGxkOGPDETopyp22
         hqyECky87ny6n7bIosjSRc0x66Ov6kb9Zof6OO46rBJYnu2kW0ZOcCYVciAkFGjcrCes
         nzKQ==
X-Gm-Message-State: AOAM533mmek+Pi5bPR1WEAoK30QhN5pAQSIct5p2Ob6XgdJx/ea0K4aa
        36Wfgb8p+uOc3FYzovI53cs=
X-Google-Smtp-Source: ABdhPJwhOa0g1ii1liojzAV8D6uzyHkgzsVCORZimhcHALhh7KyC9vxwV18MVcLtwshJan3ca7Nmuw==
X-Received: by 2002:aa7:91d2:0:b029:19a:8ccd:8b0 with SMTP id z18-20020aa791d20000b029019a8ccd08b0mr10114810pfa.40.1607212779721;
        Sat, 05 Dec 2020 15:59:39 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j19sm9131457pff.74.2020.12.05.15.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 15:59:39 -0800 (PST)
Date:   Sat, 5 Dec 2020 15:59:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.10-rc6
Message-ID: <X8we6Ff3ikti/2bR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get a fix for
"RETRIGEN" handling in Atmel touch controllers that was causing lost
interrupts on systems using edge-triggered interrupts, a quirk for i8042
driver, and a couple more fixes.

Changelog:
---------

Dmitry Torokhov (1):
      Input: soc_button_array - add missing include

Linus Walleij (1):
      Input: atmel_mxt_ts - fix lost interrupts

Luo Meng (1):
      Input: i8042 - fix error return code in i8042_setup_aux()

Po-Hsu Lin (1):
      Input: i8042 - add ByteSpeed touchpad to noloop table

Sanjay Govind (1):
      Input: xpad - support Ardwiino Controllers

Diffstat:
--------

 drivers/input/joystick/xpad.c            | 2 ++
 drivers/input/misc/soc_button_array.c    | 1 +
 drivers/input/serio/i8042-x86ia64io.h    | 4 ++++
 drivers/input/serio/i8042.c              | 3 ++-
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++--
 5 files changed, 11 insertions(+), 3 deletions(-)

Thanks.


-- 
Dmitry
