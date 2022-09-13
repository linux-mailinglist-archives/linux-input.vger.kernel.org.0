Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B735B7CC9
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 23:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiIMVrE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 17:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIMVrD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 17:47:03 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874686BD7F
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:47:01 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id g12so9458068qts.1
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=F9e72CVH8beHMQQ9IXxSTC+b48uudP1jPeUhAvu93N4=;
        b=MfQk8WhferHWYJ/rhpAjkQ0kVV9pSpnd1O7rpsfH2zCQm9YTtgAgd01gMBUTw7hBip
         qd0d9kkB1MtC09R4tetkVT5xxy3hjLfKUcQJLIBglqcOh3dVnklHegKtsjMDbbeGNfB/
         KRJmAz75996OA746t0qychUO6zmbKyuCFJMpw/UqTqOZDi81K/lRV5m81hSfs2CYhNtk
         dSoZ8mUI1/mmxhS2PUrW84MkaIb624zaU7ZkA8zPYRavoW2gYpheJR7HwsfhjEXkI7Mp
         YB5jtYn6SCeLoIe8K54jSKU81BVpWE2n5AcnJ09n/VOZTmTKI4rSxiOYqDUXXrmu0RRd
         fTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=F9e72CVH8beHMQQ9IXxSTC+b48uudP1jPeUhAvu93N4=;
        b=U5+Xs8easr1hBYd1Ew+RCbohiU7VCeXZzSgla23lnrTDWTfWzgFtD38J4cfUOrHsM/
         Vxt4VRbqJEDGi49ubdzrZl+3dkaphCRUAm2056UODCe2SNtFpe/o12/52bSxQOikZjq6
         4PLLMCLk5yIfsq9JjJfogXfu8pKqeUWcmL1K1fKN624ITUVoxXg3yJ6IgAM2dXEI8+Vt
         ellaqn/vj2Eoq4zz2Zr74BaysKfNARLrl6sACTTFo1NivXMw55zYcKraVorfLnSdAQcJ
         raxvDZbA+Db9aQveGS/+ECM5c3PSDsvOfj2KeA7ZUlR1M7A026ollcQjFAYGHbT+6JtH
         zXNg==
X-Gm-Message-State: ACgBeo0rSy7tzE0VqnDuYblWm8fDNOJUl8RCaA1GPdtRThnvAe8xormP
        4l8mto9nnYz6vswtJWLi1E6raP8lwYugqg8IZzMZlhxAq9c=
X-Google-Smtp-Source: AA6agR75XlClAfp+/9d1/WfjZc6QSfduqs+XplBXecUZvYUkRbxx7wKY6AnjyU9P7u37HWbscJntZ7fcpzTD+r751/I=
X-Received: by 2002:a05:622a:8e:b0:35b:acbe:cb48 with SMTP id
 o14-20020a05622a008e00b0035bacbecb48mr15207815qtw.390.1663105620672; Tue, 13
 Sep 2022 14:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220908173930.28940-1-nate@yocom.org>
In-Reply-To: <20220908173930.28940-1-nate@yocom.org>
From:   Nate Yocom <nate@yocom.org>
Date:   Tue, 13 Sep 2022 14:46:49 -0700
Message-ID: <CAF+10nJmefZ7pb38wTR3VD7LijzYati7eyTe9QZWEpK=sji9yA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Input: joystick: xpad: Add X-Box Adaptive
 Controller support
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        hadess@hadess.net, benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 10:39:25AM -0700, Nate Yocom wrote:
> Adds support for the X-Box Adaptive Controller, which is protocol
> compatible with the XTYPE_XBOXONE support in the driver with two deltas:
>
>  - The X-Box button sets 0x02 as its activation ID, where others set
>    0x01
>  - The controller has an additional Profile button with 4 active states,
>    which this change maps to an Axis control with 4 possible values
>
> Patch series adds device to the supported table, adds support for the
> Profile button, and adds support for the X-Box button as distinct
> changes.
>
> Signed-off-by: Nate Yocom <nate@yocom.org>
>
> Nate Yocom (5):
>   Input: joystick: xpad: Add X-Box Adaptive support
>   Input: joystick: xpad: Add X-Box Adaptive XBox button
>   Input: joystick: xpad: Add ABS_PROFILE to uapi
>   Input: joystick: xpad: Add ABS_PROFILE to Docs
>   Input: joystick: xpad: Add X-Box Adaptive Profile button
>
>  v2: Fix warning Reported-by: kernel test robot <lkp@intel.com>
>  v3: Break into multi-part and remove VID/PID check for XBox button
>  v4: Rename Layer -> Profile as suggested by Bastien Nocera
>  v5: Add new ABS_PROFILE axis to uapi and use it for the profile button
>  v6: Add ABS_PROFILE to absolutes array and docs as requested by Dmitry
>
>  Documentation/input/event-codes.rst    |  6 ++++++
>  Documentation/input/gamepad.rst        |  6 ++++++
>  drivers/hid/hid-debug.c                |  3 ++-
>  drivers/input/joystick/xpad.c          | 15 ++++++++++++++-
>  include/uapi/linux/input-event-codes.h |  1 +
>  5 files changed, 29 insertions(+), 2 deletions(-)
>
>
> base-commit: 26b1224903b3fb66e8aa564868d0d57648c32b15
> --
> 2.30.2
>

Dmitry et al, anything else I can do to see this through?  Thanks!

- Nate
