Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7737E2C70
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbjKFSyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjKFSyu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:54:50 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF93BB
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:54:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so8050779a12.3
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296880; x=1699901680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpncg0Ds+0zRe/dnhyB9Es9tgUk6/ypMf7UY7ik+rAY=;
        b=DjNhx8Yo1d2fVcVSMP8UT4ytsXOj9qHGK8SYm/O8NDfrPgIJMJ9jO9qvjQNMqKtjs2
         B8Cj4k+wYKjelLs1HlwS6ZNV2pzoG/Nf8KI5r0FtRoeuxLgGUqeXJqsFTe3CO0heNSFS
         2xTAOgvoV5nemYKAiOErrgASz1leZ2FHo3r34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296880; x=1699901680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zpncg0Ds+0zRe/dnhyB9Es9tgUk6/ypMf7UY7ik+rAY=;
        b=kdB2rXQMufO4IyGWse2S9GnVz+3IC4arZ7E9hupBHzFOkH5C6343W4GuWgNK3TJMt+
         lPOR01DugcV6bQiPsEEU4Hc9tTPKXdhABKAyob+nnyJdEhdHfTvJyRwHztQe7QbgZOUz
         MraiG8O+d8PMygbYR4CcmoxPUllJm8TkuwPDDtSvlLsRJHz72MArVBoanOA5sFBsgRy2
         DbsI8SMUy1ry1/pBSw8uEr3zakGk22bYelWN2mnPKXPJXtFv2OPn5llgIJ1ExLQ4q9Ux
         HNdl4WDUeTg8DFP/0Rc/7nDg8VT0c7oqj1y3TKkkDDpADDhf+nidSC7C3cwRttGrn3rm
         ayEA==
X-Gm-Message-State: AOJu0Yx8dkvHzTHfWBW8Ewy3qSLvhnzeNNE5ZY/DvPG4tr3ldUeuecT1
        tRqpbeUI7YAw6HlOmWXNVD2LuwFqPj0fNA2mccqYAHPx
X-Google-Smtp-Source: AGHT+IHO2MF18vn8jwFMOQr6lOq/6WCtQTbb6ZcAP3RWXa/qotUT2TVyk19radk64C0bVtzGfaLmvA==
X-Received: by 2002:a05:6402:b49:b0:53e:775e:9761 with SMTP id bx9-20020a0564020b4900b0053e775e9761mr23861313edb.36.1699296880239;
        Mon, 06 Nov 2023 10:54:40 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id z8-20020a50cd08000000b0053e2a64b5f8sm4687407edi.14.2023.11.06.10.54.37
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:54:39 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40837124e1cso10425e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:54:37 -0800 (PST)
X-Received: by 2002:a05:600c:a007:b0:404:74f8:f47c with SMTP id
 jg7-20020a05600ca00700b0040474f8f47cmr12589wmb.5.1699296876643; Mon, 06 Nov
 2023 10:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-6-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-6-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:54:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7R34XwDuXJCCzY6y5_TUyTAiBpPh2A5XxxgPdyHH5pQ@mail.gmail.com>
Message-ID: <CAD=FV=X7R34XwDuXJCCzY6y5_TUyTAiBpPh2A5XxxgPdyHH5pQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] HID: i2c-hid: Remove I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks
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

On Sat, Nov 4, 2023 at 4:18=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>

Seems OK to me assuming it's not somehow better to read/throw away the
report on devices needing the override, as discussed in a previous
patch.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
