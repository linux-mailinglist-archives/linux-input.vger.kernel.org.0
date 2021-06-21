Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EAA3AF76B
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 23:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhFUVes (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 17:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhFUVer (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 17:34:47 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234EEC061574;
        Mon, 21 Jun 2021 14:32:31 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso554234wmc.1;
        Mon, 21 Jun 2021 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mcoCwcelo8Lbr0Q6rkCvF0dSgI5+ZcbGqGlqkbILsEM=;
        b=mI+NH1eVUdGTdvXe4s6oG7uyQMwxJ/Y1+LLtw6u+JF9mWcViYBceNkl9wcFIW0aGIo
         AsReJ/1bBUt+hpag2r9hfzZhfk1GtlpkoTyhKU3HW0I2E4gaFhlLbJeQCLqDk+Z7rYWP
         +JFePEa0TVlWt9adHECXa1//npXa+FpAc6GPWP4G/jbloJqvc278mMMix8URVpHxMAC+
         tVWei4q/qGyftBGq33aJ5EGpcl4lzOHLZXO7Ok0b8kgWnEE1ndbXGcZ7LMtg2E/cSnIq
         UydyGecaunA+OD9zz8ACp/PpXqlNVpMTZUDWt1c+aIPYcbu7/IK6XJXHloFFmrSH3Lf0
         OekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mcoCwcelo8Lbr0Q6rkCvF0dSgI5+ZcbGqGlqkbILsEM=;
        b=ajPNMeM3/cwhR0+j1fybO+uNh2it8E5riynhol2CkOitU1Sy/LSDstKihoQg+HPtX9
         pY21h8jhTHpT5S3sHgigIHokClflPFnoEWRxU1A5GHan+X7M2Z4JyAAdEqo3+HHhqSdO
         k5xNYK3sBMDOTSZCr8bAaCj8dVAaT5AIb7OftLZRFMFOvkKKqkwnlf4yNeHbKdzbd+Tj
         u7Mhjo9cvACbLmENZiU+XVGa2OCPqUuPn5+gTMS9I7Pb9uBZ/gNEL8vIyB7HwMLp08CN
         ywm+xYLRK9QKNB9e+Y0NQCm4E8du0CoVsFnrOD3uMZL0m53w/yD2ODYCCGKtULbpPOAr
         4DCQ==
X-Gm-Message-State: AOAM533N0IgNkORUg6z4jCFgafSyVOROBCIQjTO6zGvyEGt55yuya/iY
        IMX3c/8rKoOhMxk3tw/wUXNjRMjOVULkpTCSFuI=
X-Google-Smtp-Source: ABdhPJzrYslg47YXudm09Gq6WIxI559PJmj9C7Qdhcw+hFMDmwgdD/LsjCNT9dZHwyjQVoOhBoqCSw==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr404810wmc.3.1624311149806;
        Mon, 21 Jun 2021 14:32:29 -0700 (PDT)
Received: from allarkin.tlv.csb ([176.230.197.133])
        by smtp.googlemail.com with ESMTPSA id s62sm280907wms.13.2021.06.21.14.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 14:32:29 -0700 (PDT)
From:   Alexander Larkin <avlarkin82@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     avlarkin82@gmail.com, dan.carpenter@oracle.com,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, murray.mcallister@gmail.com,
        security@kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in ioctl
Date:   Tue, 22 Jun 2021 00:32:15 +0300
Message-Id: <20210621213215.1698347-1-avlarkin82@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
References: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I'm still studying "git send-email", so the first intro part of prev msg deleted, sorry, again:

Continuying my previous message, the JSIOCGBTNMAP always returns 1024 return code,
but not "amount of buttons" like I said before
(that is probably the size of the keymap that is _u16 keymap[KEY_MAX - BTN_MISC + 1] ).
Is it correct?
Reading the line of kernel joydev.c
579	len = min_t(size_t, _IOC_SIZE(cmd), sizeof(joydev->keypam)),
, why the min is always sizeof(joydev->keypam) ?
If I try to call from the userspace
ioctl(fd, JSIOCGBTNMAP, buttons)
where the buttons is "__u16 buttons[5]", then still I get 1024.

Also I did userspace test (that shows how kernel overwrites (out of array bound) the userspace):
1. The buttons is "__u16 buttons[5]" in userspace,
2. buttons[5] = 1;
3. ioctl(fd, JSIOCGBTNMAP, buttons)
4. printf("new %i\n", buttons[5]),
and the output is "new 0", so the value is being overwritten by kernel (so 1024 bytes copied
to 10 bytes buffer).

It looks like I don't understand what is the expected value of the _IOC_SIZE(cmd),
why not 10 for this read ioctl example? Is it possible to make this ioctl safe, so
it doesn't copy more data than user can handle?
