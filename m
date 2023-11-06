Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E506D7E2C73
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbjKFSzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjKFSzV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:55:21 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D67134
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:55:18 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so8271876a12.2
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296915; x=1699901715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iojN6C6Wfyde1o790Jz00q1VF724Z8RUIa7EprSn/Co=;
        b=dn66Orz+NsJLpAnWiCM+8sEDhuabKcWhIrFypuE3JsaewAsH+eoQ2pMBNdESPPQJkt
         9+xzxl7PPfgk5zM6sWve+jPLBnjKtmk5dUpcdk9Uzh5OIvoGdpKOWqzDzrt9j9HVqHr7
         h2ICImYGz3S07C/5UmsCCPEYfCF5CzmDD+8jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296915; x=1699901715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iojN6C6Wfyde1o790Jz00q1VF724Z8RUIa7EprSn/Co=;
        b=a/uof7ZCDQbV8k8BNBxSDbAShtbtaL7QvITLxJPyZDGxiPI2pHZuHW42PVWoC4688t
         DhneIeFaKiHQg0qH0wo1ywvPh9wEYLMnq78sAYsRocfd2UB9oezg5+4Ty2i2naMivXiT
         Y8sxI4AxhKga3tKFc5LJrjyjB4eb2TxdA5PpfGkBJ5Z8wpiixvsxZzV7wkPxTloarYyT
         6Z2DsDLa+bcAQAWdKuP7sYscwSmOuCk8AdaLP+3in+Pf/ro9MR0NvKMjZhpbvGxa4Mcv
         JOn3YLRs2sMDreq8iRgwnKz5UsD3PJ7bNV35Zr8pM2tfMIJ892G2R2g7Ka1i2cOv9sHw
         yvPg==
X-Gm-Message-State: AOJu0Ywqsc7Hf/wIXl7vniD7fIL2TGChJjmStQpC6WU+VBwSTpEwERfW
        nA/1azWiA545hVSBWe8L8N/xOgzVPHZlMrK4ituw/xxG
X-Google-Smtp-Source: AGHT+IGz/wdF1dASh8+TQrZouVpLyjeuvNislhT5RARVk+XNJWqu4RreO7V0hqfc7MdUgMbb6lby8A==
X-Received: by 2002:a50:bb0e:0:b0:542:f328:5671 with SMTP id y14-20020a50bb0e000000b00542f3285671mr19885418ede.31.1699296915244;
        Mon, 06 Nov 2023 10:55:15 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id g23-20020a50d5d7000000b0053eb9af1e15sm4784245edj.77.2023.11.06.10.55.13
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:55:14 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40837124e1cso10555e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:55:13 -0800 (PST)
X-Received: by 2002:a05:600c:5104:b0:409:222d:87d2 with SMTP id
 o4-20020a05600c510400b00409222d87d2mr16196wms.4.1699296912589; Mon, 06 Nov
 2023 10:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-7-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-7-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:55:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U8Fq-0gYDxcMqnRttvymvjnntJUSbbPkeny6TV5wHvzA@mail.gmail.com>
Message-ID: <CAD=FV=U8Fq-0gYDxcMqnRttvymvjnntJUSbbPkeny6TV5wHvzA@mail.gmail.com>
Subject: Re: [PATCH 6/7] HID: i2c-hid: Remove I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
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
> Re-trying the power-on command on failure on all devices should
> not be a problem, drop the I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
> and simply retry power-on on all devices.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
