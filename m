Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0692C447661
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 23:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhKGWrZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 17:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236665AbhKGWrX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Nov 2021 17:47:23 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F49EC061746
        for <linux-input@vger.kernel.org>; Sun,  7 Nov 2021 14:44:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x27so32065673lfu.5
        for <linux-input@vger.kernel.org>; Sun, 07 Nov 2021 14:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tBB4k15jPe4RWWt0Sj8h4HFSgrqWNL64VVXxLtXNWes=;
        b=V6CaAjnJ9ndhtTDf6ogBVOqMsT7AGOcBRECcRDvkqislu+A/scMUiMRdVQvSuCJHaj
         1NVLgGIqEgn9kqwXuTXodyEY0M38iLIEUr89Cg9CsPufwh/rlJwk3Qkh9pfmNVVXL+G6
         9Vhadj7g+buhBC8bGFXS2ZWUWTQDxU01SfcBZSFV73r1sHyB+zlwiFqFCP8Hg6Kg4wPg
         DR/8pRKYOfcK0AJzXx/a/BTfuy0PczYZcje1JeXckZebCD8TE4brHN7Vr7kOhVcALicf
         /xdTBO9jsju+cvPzFrCShMUm6ZLLOHwcujG62zUyPvicdU9edD8cFtPUqJh9x+O6x/Uw
         mURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tBB4k15jPe4RWWt0Sj8h4HFSgrqWNL64VVXxLtXNWes=;
        b=6fsVduezHNa/Mq+hPbMxzVNa+PRxznZGM8BKG5JWFGlsP7NoKrMPew4Dbp8BIaEW1Y
         oULeli3IKU+ByNLT0RX/KxU+pZ6drMZVRW1mdCbHQF9BUTGbha17TvvsSqpgyBeIgDMF
         UtdD1VnIfmWr7To41mu7cCEGJ173dgRBRy50CdMpWC/cnioY0KRpcbLcteFoVyxTjjKP
         ENGn7sOgb+cJs3kgm+8xaeknpfnlRCOdNsWuxeSqF3tlCLkfozYuYwHPDEWyuBkRxYIF
         aSTERD/MTOxZ+qRrj0T1//LwQubo0IkqzJ7s8GqbRzc4fqXD9gw8gS+6eAdRMrpL6e21
         I2lw==
X-Gm-Message-State: AOAM53159K6jNx6OuMjpTVH51bOb0vXI5ESufICzoXLOBil6ggv/Q4my
        TT5Ao2Qr/HlhT4NdUevLMS2L7LzfOItH4GgZ3Jg=
X-Google-Smtp-Source: ABdhPJxwYyK6+fGSzcUwv6S6HLWQIR/my7JeAqpyWIdt2YEHe69udAbjJpaU7ofHmTLSynBhKNOQX6YHQxt2+sSaxuo=
X-Received: by 2002:a05:6512:33c8:: with SMTP id d8mr5324198lfg.205.1636325077792;
 Sun, 07 Nov 2021 14:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20211102100826.26824-1-benjamin@sipsolutions.net>
In-Reply-To: <20211102100826.26824-1-benjamin@sipsolutions.net>
From:   Alex Henrie <alexhenrie24@gmail.com>
Date:   Sun, 7 Nov 2021 15:44:26 -0700
Message-ID: <CAMMLpeTs4LKD+HKToGQAht8CwsWPnG4Vh3nha+hgUdFvnWpkwg@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Add 2021 magic keyboard model
To:     Benjamin Berg <benjamin@sipsolutions.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 2, 2021 at 4:15 AM Benjamin Berg <benjamin@sipsolutions.net> wrote:
>
> The newer magic keyboard (and laptop) models have a different Fn key
> configuration. Also, the PIDs are still missing.
>
> This patch adds the new keycodes and the PID for the small magic
> keyboard model (without numpad and fingerprint reader, MK2A3Y/A,
> Model A2450).

Hi Benjamin,

A patch to add basic support for that keyboard is already in Linux
5.16. Could you please rebase and resend your patch to fix the
function key mappings?

-Alex
