Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90897E2C63
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjKFSx2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjKFSx2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:53:28 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7EAA2
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:53:25 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso8270223a12.3
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296802; x=1699901602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vobWoPfyr2+rrL/5P71fsvNfHTe5YXemAFJ+3B3V4Go=;
        b=WJmOz8mnDtVKBLT0h4d31ZQEt47fIEkeDjCXeRt95UtTwSv4qTZZH3S0+QXzGpnA5u
         baLO54DMRAri5FsRSlqAhAIB6mBYOc5i3DRF3a84cFun5HHjut6i3G7CAXnETLQk1rjt
         BPnUI7omc2orTr6S20Na2FkTpGk9IyG4ApqR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296802; x=1699901602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vobWoPfyr2+rrL/5P71fsvNfHTe5YXemAFJ+3B3V4Go=;
        b=wjGbI80a5I+BfitneptcNnCzd0N7TZJH7ls9LS7MdQE0exC/tzoJXBCfKNQHSClpvv
         GGLmYPU3tUzDznlroCM0JJ7M8iZMNns/IqgxfjGU6/7dz4/gwKux4asm425BeHL8Spch
         xdW2ZMLh+YigPX1+hj7O54d+DQY74HFhc3Bo/9KW6s2Vyvtf+xITan847zP8rBu1kqO0
         HU9+wxCNpC7iMd900m8D7f3Wr1khsNOyyTI7eK7vtRvemP7SpZQctAC5IoBZFKFm5Nxy
         D6YkHy+xOXL0HABig5/DPfC62ltiQaVk2Tf8DoDKlGtNuJ8TAA1Xzo/PGrXpWjQNDD9M
         H9sQ==
X-Gm-Message-State: AOJu0YzVZGMo2X5xcEpyGLv2qLwFoAyjFDlG9llwNO0OQkTttOTmoN8r
        Sq0UmUmQUq5GQnmOQq9+5Ma3IGSdraKlUhkow8dyGXWt
X-Google-Smtp-Source: AGHT+IGyL2R1Zg6RqddlIYfcFD5u4Ieeq+vBE0YggkhW3dTcvhsC1bbO06sjEwkEAgqpVuKFBLn+VA==
X-Received: by 2002:a17:906:9c82:b0:9ae:961a:de81 with SMTP id fj2-20020a1709069c8200b009ae961ade81mr13320389ejc.27.1699296802513;
        Mon, 06 Nov 2023 10:53:22 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906a01600b009dd6aca60c6sm137537ejy.89.2023.11.06.10.53.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:53:21 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40837124e1cso10185e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:53:21 -0800 (PST)
X-Received: by 2002:a05:600c:5104:b0:409:222d:87d2 with SMTP id
 o4-20020a05600c510400b00409222d87d2mr15943wms.4.1699296801549; Mon, 06 Nov
 2023 10:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-4-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-4-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:53:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WSZ8ihC2_QZnzFm2kVk=9T_p9=wL2Kz6F7fj=TkB0baQ@mail.gmail.com>
Message-ID: <CAD=FV=WSZ8ihC2_QZnzFm2kVk=9T_p9=wL2Kz6F7fj=TkB0baQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] HID: i2c-hid: Switch i2c_hid_parse() to goto style
 error handling
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sat, Nov 4, 2023 at 4:17=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Switch i2c_hid_parse() to goto style error handling.
>
> This is a preparation patch for removing the need for
> I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
> more like Windows.
>
> Note this changes the descriptor read error path to propagate
> the actual i2c_hid_read_register() error code (which is always
> negative) instead of hardcoding a -EIO return.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
